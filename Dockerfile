FROM jermine/dl:pytorch.gpu
MAINTAINER Jermine <Jermine.hu@qq.com>
ARG JRE_PATH=/opt/java-8-openjdk-amd64
COPY --from=openjdk:8u162-jre-slim  /usr/lib/jvm/java-8-openjdk-amd64 $JRE_PATH
ENV JAVA_HOME=$JRE_PATH
ENV JRE_HOME=${JAVA_HOME}/jre
ENV CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib
ENV PATH=${JAVA_HOME}/bin:$PATH
RUN apt-get update -y && apt-get install -y gcc g++ python3-dev --no-install-recommends
WORKDIR /app
COPY . /app
RUN pip3 --no-cache-dir install -i https://mirrors.aliyun.com/pypi/simple -r requirements.txt
ENV API_PORT=5555
EXPOSE $API_PORT
EXPOSE 8888
ENV LANG C.UTF-8
CMD ["bash"]
