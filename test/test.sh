echo "Building a container named test that inherits from polymorphic alpine base."
docker build -t test .

echo "Running test container to ensure it rescrambles...."
docker run -it --rm test

# Run this command instead, if you have a different scrambler key
# docker run -it --rm -e POLYVERSE_POLYMORPHIC_LINUX_KEY=<yourkey> test
