FROM java:7
MAINTAINER Paul Lam <paul@quantisan.com>

ENV LEIN_VERSION=2.5.1

# see http://dev.eclipse.org/mhonarc/lists/jetty-users/msg05220.html
RUN gpg --keyserver pool.sks-keyservers.net --recv-keys \
  296F37E451F91ED1783E402792893DA43FC33005

RUN \
  LEIN_DOWNLOAD_URL=https://github.com/technomancy/leiningen/releases/download/$LEIN_VERSION/leiningen-$LEIN_VERSION-standalone.zip \
  && set -x \
  && curl -fSL "$LEIN_DOWNLOAD_URL" -o lein.zip \
  && curl -fSL "$LEIN_DOWNLOAD_URL.asc" -o lein.zip.asc \
  && gpg --verify lein.zip.asc

ENV LEIN_ROOT 1

RUN lein
