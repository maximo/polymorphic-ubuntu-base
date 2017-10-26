# Rescramble base
if [ "$POLYVERSE_POLYMORPHIC_LINUX_KEY" != "" ]; then \
  echo "Rescrambling all packages on this image..." && \
  echo "Using Scrambling key: $POLYVERSE_POLYMORPHIC_LINUX_KEY" && \
 apt update && apt install -y curl && \
 curl https://repo.polyverse.io/install.sh | sh -s "$POLYVERSE_POLYMORPHIC_LINUX_KEY" && \
  apt-get update && apt-get -y --allow-change-held-packages install --reinstall $(dpkg --get-selections | awk '{print $1}') && \
  echo "Scrambling complete."; \
fi
