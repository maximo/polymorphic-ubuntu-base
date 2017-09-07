# Rescramble base
if [[ "$POLYVERSE_POLYMORPHIC_LINUX_KEY" != "" ]]; then \
  echo "Rescrambling all packages on this image..." && \
  apk update && \
  apk add -y curl && \
  curl https://repo.polyverse.io/config/alpine/v3.6/install | sh -s "$POLYVERSE_POLYMORPHIC_LINUX_KEY" && \
  apk update && \
  apk info -q | xargs apk fix && \
  echo "Scrambling complete. Number of packages scrambled: " && \
  apk info | xargs apk policy | grep -i polyverse | wc -l && \
  echo "Total packages on this system:" && \
  apk info | wc -l; \
fi
