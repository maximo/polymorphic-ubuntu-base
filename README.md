Polymorphic Ubuntu Base
========================

# Get Started

In all your Dockerfiles, replace
```
FROM ubuntu:16.04
```

with 
```
FROM polyverse/polymorphic-ubuntu-base
```

This Dockerfile generates a Polymorphic Ubuntu based on Polyverse's Polymorphic Linux repositories.

This Dockerfile may be used as-is, or the generated image may be used as a drop-in replacement for ubuntu:latest, that rescrambles the base every time you rebuild your inherited container (using the ONBUILD directive.)


# Increasing Dynamic Polymorphism

This image contains a built-in Polyverse key to provide a base level of Polymorphism, but to truly benefit from dynamism, in real-world use cases you'll want to use your own key. A few ways to do this.

## Rebuild the base with your key

When building the inherited image, you can use your own base-image, with your own polymorphism key as a build argument:

```
docker build --build-arg POLYVERSE_POLYMORPHIC_LINUX_KEY="<your key>" .
```

## Provide a custom key at runtime, and call rescramble

The highest benefit you get from Polymorphic Linux is when you rescramble at runtime, thereby ensuring every container instance of an image, contains a different scramble.

This would look something like:

```
FROM polyverse/polymorphic-ubuntu-base

...

CMD /polyverse/rescramble.sh && <your default command>
```


And you would then run this as:
```
docker run  -e POLYVERSE_POLYMORPHIC_LINUX_KEY="<your key>" your-container 
```


At runtime, this environment variable would be picked up by rescramble.sh giving you a different scramble based on that key.
