#/bin/bash

cd /usr/local/tomcat/daobs/dashboards/data;
elasticdump \
  --input=index-dashboards-mapping.json \
  --output=http://elasticsearch:9200/.dashboards \
  --type=mapping

elasticdump \
  --input=index-dashboards.json \
  --output=http://elasticsearch:9200/.dashboards

echo -e "\e[96mStart tomcat\e[0m"

cd $CATALINA_HOME
catalina.sh run

