FROM ubuntu

ADD rescramble.sh /polyverse/

ARG POLYVERSE_POLYMORPHIC_LINUX_KEY
ENV POLYVERSE_POLYMORPHIC_LINUX_KEY=thmu0inx1dmo56secy0fkzkt9

# Rescramble base
RUN /polyverse/rescramble.sh

# Rescramble when inheritor builds
ONBUILD RUN /polyverse/rescramble.sh
