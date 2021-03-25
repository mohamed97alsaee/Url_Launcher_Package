import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextButton(onPressed: () {calling();}, child: Text(" Phone call")),
            TextButton(onPressed: () {sms();}, child: Text(" Send sms")),
            TextButton(onPressed: () {email();}, child: Text(" Send Email")),
            TextButton(onPressed: () {whatsapp();}, child: Text(" Whatsapp")),
            TextButton(onPressed: () {messenger();}, child: Text(" Facebook messenger")),
          ],
        ),
      )),
    );
  }

  calling()async{
    const url = 'tel:+218919247183';
    if( await canLaunch(url)){
      await launch(url);
    }else{
      throw 'Could not launch $url';
    }
  }

whatsapp()async{
  const url = "whatsapp://send?phone=+218919247183";
      if( await canLaunch(url)){
      await launch(url);
    }else{
      throw 'Could not launch $url';
    }
}

messenger()async{
  const url = "http://m.me/xyzchannelxyz";
     if( await canLaunch(url)){
      await launch(url);
    }else{
      throw 'Could not launch $url';
    }
}

sms()async{
  const url = 'sms:+218919247183';

     if( await canLaunch(url)){
      await launch(url);
    }else{
      throw 'Could not launch $url';
    }
}

email()async{
  final Uri _emailurl = Uri(
scheme: 'maito',
path: 'xyzmohamedchannelalsaee@gmail.com',
queryParameters: { 'subject': 'hello xyz مرحباً محمد' }
  );

      if( await canLaunch(_emailurl.toString())){
      await launch(_emailurl.toString());
    }else{
      throw 'Could not launch $_emailurl';
    }
}

}
