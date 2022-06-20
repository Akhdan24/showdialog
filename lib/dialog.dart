import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supercharged/supercharged.dart';

class dialog extends StatefulWidget {
  const dialog({Key? key}) : super(key: key);

  @override
  State<dialog> createState() => _dialogState();
}

class _dialogState extends State<dialog> {
  var isChanged = false;

  Future<void> show(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AnimatedContainer(
            duration: Duration(seconds: 1),
            width: isChanged ? 300 : 0,
            height: isChanged ? 300 : 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.fromLTRB(0, 0, 50, 0),
                    child: Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(Icons.close_outlined,
                          color: Colors.black, size: 20),
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.fromLTRB(0, 0, 2, 0),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    image: DecorationImage(
                        fit: BoxFit.cover, image: AssetImage('assets/g.jpeg')),
                  ),
                  alignment: Alignment.center,
                ),
              ],
            ),
          );
        });
  }

  @override
  void initState() {
    super.initState();
    setState(() => isChanged = !isChanged);
    SchedulerBinding.instance?.addPostFrameCallback((_) {
      show(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        // color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
              onPressed: () {
                print("Telah diklik");
              },
              child: Icon(Icons.delete_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
