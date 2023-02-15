// ignore_for_file: library_prefixes, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = '/home';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const HomeScreen(),
        settings: const RouteSettings(name: routeName));
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final kBackgroundColor = const Color(0xFF202020);
  final kPrimaryColor = const Color(0xFFFFBD73);

  Box box = Hive.box('passwords');
  bool longPressed = false;

  Future fetch() async {
    if (box.values.isEmpty) {
      return Future.value(null);
    } else {
      return Future.value(box.toMap());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Passwords",
          style: TextStyle(fontSize: 22.0, color: Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: insertDB,
        backgroundColor: Color(0xFFFFBD73),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: box.listenable(),
        builder: (context, Box box, _) {
          if (box.values.isEmpty) {
            return Center(
              child: Text(
                "You have saved no password\n  Save some\n.Everything is in your Phone..",
                style: TextStyle(
                  fontSize: 22.0,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
            );
          } else {
            return ListView.builder(
              itemCount: box.values.length,
              itemBuilder: (context, index) {
                Map data = box.getAt(index);

                return Card(
                  margin: EdgeInsets.all(
                    12.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Website: ${data['type']}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Divider(color: Colors.transparent),
                            Divider(color: Colors.transparent),
                            Text('Username: ${data['email']}'),
                            Divider(color: Colors.transparent),
                            Divider(color: Colors.transparent),
                            Text('Password: ${data['password']}'),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          InkWell(
                              // onTap: () =>
                              //     modalAlertDelete(index, data['type']),
                              child: Icon(Icons.edit,
                                  color: Colors.grey, size: 32)),
                          SizedBox(
                            width: 20,
                          ),
                          InkWell(
                              onTap: () =>
                                  modalAlertDelete(index, data['type']),
                              child: Icon(Icons.delete_outline_outlined,
                                  color: Colors.red, size: 32)),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  void insertDB() {
    String type = 'a';
    String email = 'c';
    String password = 'd';

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Container(
        padding: EdgeInsets.all(
          12.0,
        ),
        decoration: BoxDecoration(
          color: Colors.black87,
        ),
        child: Form(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Website",
                  hintText: "Enter website",
                ),
                style: TextStyle(
                  fontSize: 18.0,
                ),
                onChanged: (val) {
                  type = val;
                },
                validator: (val) {
                  if (val!.trim().isEmpty) {
                    return "Enter A Value !";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 12.0,
              ),
              // TextFormField(
              //   decoration: InputDecoration(
              //     border: OutlineInputBorder(),
              //     labelText: "Nick Name",
              //     hintText: "Will be dispplayed as a Title",
              //   ),
              //   style: TextStyle(
              //     fontSize: 18.0,
              //     fontFamily: "customFont",
              //   ),
              //   onChanged: (val) {
              //     nick = val;
              //   },
              //   validator: (val) {
              //     if (val!.trim().isEmpty) {
              //       return "Enter A Value !";
              //     } else {
              //       return null;
              //     }
              //   },
              // ),
              // SizedBox(
              //   height: 12.0,
              // ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Username",
                ),
                style: TextStyle(
                  fontSize: 18.0,
                ),
                onChanged: (val) {
                  email = val;
                },
                validator: (val) {
                  if (val!.trim().isEmpty) {
                    return "Enter A Value !";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 12.0,
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Password",
                ),
                style: TextStyle(
                  fontSize: 18.0,
                ),
                onChanged: (val) {
                  password = val;
                },
                validator: (val) {
                  if (val!.trim().isEmpty) {
                    return "Enter A Value !";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 12.0,
              ),
              ElevatedButton(
                onPressed: () {
                  // insert into db

                  Box box = Hive.box('passwords');

                  // insert
                  var value = {
                    'type': type.toLowerCase(),
                    'email': email,
                    'password': password,
                  };

                  box.add(value);

                  Navigator.of(context).pop();
                  setState(() {});
                },
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 50.0,
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(
                    Color(0xFFFFBD73),
                  ),
                ),
                child: Text(
                  "Save",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

void modalAlertDelete(int index, String type) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Center(child: Text('Delete $type')),
        content: Text('Are you sure to delete $type'),
        actions: [
          TextButton(
              child: Text('Yes'),
              onPressed: () async {
                await box.deleteAt(index);
                setState(() {});
                Navigator.pop(context);
              })
        ],
      ),
    );
  }

}
