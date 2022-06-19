import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MemoScreen extends StatefulWidget {
  const MemoScreen({Key? key}) : super(key: key);

  @override
  State<MemoScreen> createState() => _MemoScreenState();
}

class _MemoScreenState extends State<MemoScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController memoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadTitle();
    _loadMemo();
  }

  void _loadTitle() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      titleController.text = prefs.getString('title') ?? '';
    });
  }

  void _loadMemo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    memoController.text = prefs.getString('memo') ?? '';
  }

  void _updateTitle() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString('title', titleController.text);
    });
  }

  void _updateMemo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString('memo', memoController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SimpleMemo')),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(children: [
          SizedBox(height: 10),
          Container(
            width: double.infinity,
            child: Text(
              'タイトル',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          TextField(
            controller: titleController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
            onChanged: (text) {
              _updateTitle();
            },
          ),
          SizedBox(height: 10),
          Container(
            width: double.infinity,
            child: Text(
              'メモ',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          Expanded(
            child: TextField(
              controller: memoController,
              textAlignVertical: TextAlignVertical.top,
              decoration: InputDecoration(border: OutlineInputBorder()),
              maxLines: null,
              expands: true,
              onChanged: (text) {
                _updateMemo();
              },
            ),
          ),
          SizedBox(height: 20),
        ]),
      ),
    );
  }
}
