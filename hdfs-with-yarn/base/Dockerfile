# ubuntu 18 기반인 zulu의 openjdk 8버전을 선택
FROM azul/zulu-openjdk:8

RUN apt-get update && apt-get install -y curl 

ENV HADOOP_VERSION=3.1.1
ENV HADOOP_URL=https://archive.apache.org/dist/hadoop/common/hadoop-3.1.1/hadoop-3.1.1.tar.gz

# Hadoop 3.1.1 버전을 내려받고 /opt/hadoop에 압축 해제
RUN curl -fSL "$HADOOP_URL" -o /tmp/hadoop.tar.gz \
    && tar -xvf /tmp/hadoop.tar.gz -C /opt/ \
    && rm /tmp/hadoop.tar.gz

# 데이터 디렉토리 생성 및 설정 폴더의 심볼릭 링크 생성
RUN ln -s /opt/hadoop-$HADOOP_VERSION /opt/hadoop \
    && mkdir /opt/hadoop/dfs \
    && ln -s /opt/hadoop-$HADOOP_VERSION/etc/hadoop /etc/hadoop \
    && rm -rf /opt/hadoop/share/doc

# 로컬의 core-site.xml 파일을 복제
ADD core-site.xml /etc/hadoop/
ADD mapred-site.xml /etc/hadoop/
ADD yarn-site.xml /etc/hadoop/

# 실행 환경에 필요한 환경 변수 등록
ENV HADOOP_HOME /opt/hadoop
ENV HADOOP_CONF_DIR /etc/hadoop
ENV PATH $HADOOP_HOME/bin/:$PATH
ENV YARN_CONF_DIR=$HADOOP_CONF_DIR