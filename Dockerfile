# Commands to know
# to build: docker build -t myapp . where "myapp" can be any name.
# to jump inside final container: docker run -it myapp /bin/bash/
# to run image: docker run -p 80:8080 myapp
# to view deployment http://localhost

FROM amazoncorretto:8

VOLUME /tmp
ARG DEPENDENCY=target/dependency
COPY ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY ${DEPENDENCY}/META-INF /app/META-INF
COPY ${DEPENDENCY}/BOOT-INF/classes /app
ENTRYPOINT ["java","-cp","app:app/lib/*","hello.Application"]
