FROM node:8-stretch
LABEL description="Debian image to build nativefier apps"

# Get wine32, not 64, to work around binary incompatibility with rcedit.
# https://github.com/jiahaog/nativefier/issues/375#issuecomment-304247033
# Forced us to use Debian rather than Alpine, which doesn't do multiarch.
RUN dpkg --add-architecture i386

# Install dependencies
RUN apt-get update \
    && apt-get --yes install wine32 imagemagick git \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Add sources
RUN git clone https://github.com/jiahaog/nativefier.git /nativefier

# Build nativefier and link globally
WORKDIR /nativefier/app
RUN npm install
WORKDIR /nativefier
RUN npm install && npm run build && npm link

# Run a {lin,mac,win} build: 1. to check installation was sucessful,
# 2. to cache electron distributables and avoid downloads at runtime.
RUN nativefier https://github.com/jiahaog/nativefier /tmp/nativefier \
    && nativefier -p osx https://github.com/jiahaog/nativefier /tmp/nativefier \
    && nativefier -p windows https://github.com/jiahaog/nativefier /tmp/nativefier \
    && rm -rf /tmp/nativefier

ENTRYPOINT ["nativefier"]
CMD ["--help"]
