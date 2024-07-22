import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    _globalKey.currentState?.openDrawer();
                  },
                  child: const Icon(
                    Icons.menu,
                    size: 25,
                  ),
                ),
                const Icon(
                  Icons.search,
                  size: 25,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 10),
              children: [
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Messages",
                      style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
                    )),
                const SizedBox(width: 35),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Online",
                      style: TextStyle(fontSize: 26, color: Colors.grey),
                    )),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 15, left: 25, right: 25),
            decoration: BoxDecoration(
              color: Colors.redAccent,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Doctors",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.more_horiz,
                          color: Colors.white,
                        )),
                  ],
                ),
                SizedBox(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      buildContactAvatar('Doctor1', 'doctor1.jpg'),
                      buildContactAvatar('Doctor2', 'doctor2.jpg'),
                      buildContactAvatar('Doctor3', 'doctor3.jpg'),
                      buildContactAvatar('Doctor4', 'doctor4.jpg'),
                      buildContactAvatar('Doctor5', 'doctor5.jpg'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: ListView(
                padding: const EdgeInsets.only(left: 25),
                children: [
                  buildConversationRow('Dr. Ej', 'Hello, how are you', 'doctor1.jpg', 0),
                  buildConversationRow('Dr. Joan', 'Will you visit me', 'doctor2.jpg', 2),
                  buildConversationRow('Dr. Patrick', 'Kumain kana ba?', 'doctor3.jpg', 6),
                  buildConversationRow('Dr. Cyril', 'I love you ...', 'doctor4.jpg', 0),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: SizedBox(
        height: 65,
        width: 65,
        child: FloatingActionButton(
          backgroundColor: Colors.redAccent,
          child: const Icon(
            Icons.edit_outlined,
            size: 30,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ),
    );
  }

  Widget buildContactAvatar(String name, String imagePath) {
    return Container(
      width: 80, // Ensure width fits within the available space
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/$imagePath'),
            radius: 30,
          ),
          SizedBox(height: 5),
          Text(
            name,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget buildConversationRow(String name, String message, String imagePath, int unreadMessages) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage('assets/images/$imagePath'),
      ),
      title: Text(name),
      subtitle: Text(message),
      trailing: unreadMessages > 0
          ? CircleAvatar(
              radius: 10,
              backgroundColor: Colors.red,
              child: Text(
                unreadMessages.toString(),
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            )
          : null,
    );
  }
}
