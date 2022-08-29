import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Infinite Scroll',
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          backgroundColor: Colors.grey[800],
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Text('Infinite Scroll',
            style: TextStyle(fontSize: 30,
            fontFamily: 'ant'
            ),),
              SizedBox(width: 60),
              Text('-by Keter Titus',
                style: TextStyle(fontSize: 15,
                    fontFamily: 'bkant'
                ),),
          ],),
        ),
        body:const RandomWords()
      ),
    );
  }}

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    final suggestions = <WordPair>[];
    return ListView.builder(
      padding: const EdgeInsets.all(2.0),
      itemBuilder: (context,i)
      {
        if(i.isOdd) return const Divider(color: Colors.white);
        final index = i ~/ 2;
        if(index>= suggestions.length)
          { suggestions.addAll(generateWordPairs().take(10));}
        return ListTile(
          title:Text(
            suggestions[index].asPascalCase,
            style: const TextStyle(fontSize: 18,
                color: Colors.white,
                fontFamily: 'bkant',
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic
            ),
          ),
          //subtitle: const Divider(color: Colors.white),
        );
      },
        );
  }
}
