final articles = [
  Article(
      text: "Flutter自定义Appbar",
      description : "起初想到这个需求，是因项目中有头部定制化的功能。于是硬着头皮去搜索，最终实现了，我的效果图展示只是一个我做成的样子。实际上这是一个通用解决方案",
      domain: "https://www.jianshu.com/p/14b70d345862",
      by: "Easonyu"
  ),
  Article(
      text: "Flutter文件上传和下载",
      description : "先说说我为了测试文件上传和下载做了哪些前期准备吧，首先我把我的个人域名申请了一张ssl证书（https），然后我自己写了一个文件上传接口(php)",
      domain: "https://www.jianshu.com/p/e867567dd2ff",
      by: "Easonyu"
  ),
  Article(
      text: "Flutter中文官网2",
      description:"开篇先分享一个优秀的dart语法的学习基地：http://codingdict.com/article/21908我在这里面边学边写dart语法还是蛮开心的",
      domain: "https://www.jianshu.com/p/80b736ac5448",
      by: "Easonyu"
  ),
  Article(
      text: "Flutter中文官网3",
      domain: "https://www.jianshu.com/p/c1854a4de4c1",
      description :"继前篇flutter初探之后，此次我来聊聊从传统web项目角度剖析我是怎么一步步搭建flutter基础项目的。本文主要讲述如何实现flutter用户数据多页面共享，用户数据本地缓存",
      by: "Easonyu"
  ),
  Article(
      text: "Flutter初探",
      domain: "https://www.jianshu.com/p/f66cd0e23cfa",
      description :"作为一名长期web前端开发，这次涉及app开发，我自我感觉确实有点膨胀。本篇我主要是以web开发者在flutter开发摸索中碰到的一些问题，进行记录",
      by: "Easonyu"
  )
];

class Article {
  final String text;
  final String description;
  final String domain;
  final String by;
  Article({
    required this.text,
    required this.description,
    required this.domain,
    required this.by
  });
}