
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Musiccard {
  static const MethodChannel _channel =
      const MethodChannel('musiccard');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
class MusicCardWidget extends StatefulWidget {
  final title;
  final content;
  final imgUrl;

  const MusicCardWidget({Key key, this.title, this.content, this.imgUrl}) : super(key: key);

  @override
  _MusicCardWidgetState createState() => _MusicCardWidgetState();
}

class _MusicCardWidgetState extends State<MusicCardWidget> {
  @override
  Widget build(BuildContext context) {
    return musicCard(title: widget.title,content: widget.content,image: widget.imgUrl);
  }
  musicCard({title,content,image}){
    return Card(
      elevation: 5,
      child: Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
              colors: [
                const Color(0xFF040404),
                const Color(0xFF000000),
                const Color(0xFF656565),
              ],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 0.0),
              tileMode: TileMode.clamp),
        ),
        child: Row(
          children: [
            Container(
              height : 70,
              width: 70,
              child: image!=null?Image.network(image,fit: BoxFit.cover):Image.asset(image,fit: BoxFit.cover,),
            ),
            SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("$title",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white),),
                Text("$content",style: TextStyle(fontSize: 13,color: Colors.grey),),
              ],
            ),
            Spacer(),
            Padding(padding: EdgeInsets.only(right: 10),
                child: IconButton(
                    iconSize: 35,
                    color: Colors.white,
                    icon: Icon(Icons.play_arrow),
                    onPressed: (){})
            )
          ],
        ),
      ),
    );
  }
}
