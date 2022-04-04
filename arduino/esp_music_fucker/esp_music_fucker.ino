#include <HttpGet.h>
#include <ESP8266WiFi.h>
#include <DNSServer.h>
#include <ESP8266WebServer.h>
#include <WiFiManager.h>      //https://github.com/tzapu/WiFiManager
#include <OneButton.h>        //https://github.com/mathertel/OneButton
//引入库

OneButton button(D4, true);
//添加按钮

void click() {
//设定按钮单击函数
  gethttp_API("http://api.klpnb.cn/index.php?enable",80);
  //执行HttpGet
  Serial.println("单击");
  //串口输出
}

void doubleclick() {
//设定按钮双击函数
  gethttp_API("http://api.klpnb.cn/index.php?disable",80);
  //执行HttpGet
  Serial.println("双击");
  //串口输出
}

void setup() {
  Serial.begin(115200);
  //启动波特率115200

  WiFiManager wifiManager;
  //启动WiFi管理器
  
  //设置自定义IP
  wifiManager.setAPStaticIPConfig(IPAddress(6,6,6,6), IPAddress(6,6,6,6), IPAddress(255,255,255,0));

  wifiManager.autoConnect("EspMusicFucker");
  //设置自定义AP
    
  Serial.println("connected...yeey :)");
  //连接WIFI成功
  
  button.attachClick(click);
  //定义按钮单击

  button.attachDoubleClick(doubleclick);
  //定义按钮双击
}

void loop() {
  button.tick();
  //保持按钮函数运行
} 
