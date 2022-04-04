#include <ESP8266HTTPClient.h>

String gethttp_API(String url,int port);

// http get 请求函数 
String gethttp_API(String url,int port){
  String payload="";
  WiFiClient client;
  HTTPClient http;
  if (http.begin(client,url ),port) { 
    int httpCode = http.GET();
    payload = http.getString();
    http.end();
 }
return payload;
}