FROM jermine/dl:pytorch.gpu.opencv
RUN apt-get update -y && apt-get install -y python3-dev
WORKDIR /app
COPY . /app
RUN pip3 --no-cache-dir install -i https://mirrors.aliyun.com/pypi/simple -r requirements.txt
ENV API_PORT=5555
EXPOSE $API_PORT
EXPOSE 8888
ENV LANG C.UTF-8
CMD ["bash"]