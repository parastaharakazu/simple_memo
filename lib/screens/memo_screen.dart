import 'package:flutter/material.dart';

class MemoScreen extends StatefulWidget {
  const MemoScreen({Key? key}) : super(key: key);

  @override
  State<MemoScreen> createState() => _MemoScreenState();
}

class _MemoScreenState extends State<MemoScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController memoController = TextEditingController();

  void _updateTitle() {
    print('Update title');
  }

  void _updateMemo() {
    print('Update memo');
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
