FROM adoptopenjdk/openjdk8-openj9:alpine-slim
EXPOSE 8080
ENV PROFILE default
ENV JVM_METASPACE_SIZE 128M
ENV JVM_MEM_MAX_SIZE 1024M
ENV JVM_MEM_YOUNG_SIZE 384M
ENV JVM_MEM_THREAD_SIZE 128K
ENTRYPOINT ["java","-server","-noverify","-XX:TieredStopAtLevel=1","-XX:+HeapDumpOnOutOfMemoryError","-Djava.awt.headless=true","-Xmn${JVM_MEM_YOUNG_SIZE}","-Xms${JVM_MEM_MAX_SIZE}","-Xmx${JVM_MEM_MAX_SIZE}","-Xss${JVM_MEM_THREAD_SIZE}","-XX:MetaspaceSize=${JVM_METASPACE_SIZE}","-XX:MaxMetaspaceSize=${JVM_METASPACE_SIZE}","-Xshareclasses","-Xquickstart","-jar","-Dserver.port=8080","-Dspring.profiles.active=${PROFILE}","/app.jar"]
ADD target/*.jar app.jar