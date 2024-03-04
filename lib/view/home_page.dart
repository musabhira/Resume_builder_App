import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resume_builder_app/controller/home_provider.dart';

import 'package:resume_builder_app/view/ViewResumePage.dart';
import 'package:resume_builder_app/view/resume_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends ConsumerWidget {
  final ValueNotifier<bool> theme;
  const HomePage({super.key, required this.theme});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void viewResume(int index) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ViewResumePage(
              index: index,
            ),
          ));
    }

    final double width = MediaQuery.of(context).size.width;
    void changeTheme() async {
      theme.value = !theme.value;
      (await SharedPreferences.getInstance()).setBool('theme', theme.value);
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.background,
        iconTheme: const IconThemeData(color: Color.fromARGB(255, 255, 17, 0)),
        elevation: 0,
        title: Text(
          'Resume Builder',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
          ),
        ),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              theme.value = !theme.value;
            },
            child: IconButton(
              icon: Icon(
                theme.value ? Icons.light_mode : Icons.dark_mode,
              ),
              onPressed: () => changeTheme(),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 255, 17, 0),
        width: MediaQuery.of(context).size.width * 0.8,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              curve: Curves.easeIn,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 10),
                      Text(
                        'Resume Builder',
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  Text(
                    'Build Resume on the Go',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, size: 24, color: Colors.white),
              title: const Text(
                'Home',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.receipt_long_outlined,
                  size: 24, color: Colors.white),
              title: const Text(
                'New Resume',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ResumePage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.list, size: 24, color: Colors.white),
              title: Text(
                theme.value ? 'Day Light' : 'Night Mode',
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
              onTap: () {
                changeTheme();
              },
            ),
            ListTile(
              leading: const RotationTransition(
                turns: AlwaysStoppedAnimation(180 / 360),
                child: Icon(
                  Icons.logout,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              title: const Text(
                'Logout',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Are you sure?'),
                      content: const Text('Would you like to logout?'),
                      actions: [
                        TextButton(
                          child: const Text('Cancel'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: const Text('Logout'),
                          onPressed: () {
                            // Perform logout action
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 10.0,
              ),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border(
                        bottom: BorderSide(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // showAddDialog(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ResumePage()),
                            );
                          },
                          child: Container(
                            width: width * 0.45,
                            padding: const EdgeInsets.all(15.0),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 17, 0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.receipt_long,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'New Resume',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          width: width * 0.45,
                          padding: const EdgeInsets.all(15.0),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 17, 0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.receipt_long,
                                color: Colors.white,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Cover Letter',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Color.fromARGB(255, 255, 17, 0),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        'My Resumes',
                        style: TextStyle(
                            fontSize: 19,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final resume = ref.watch(homeProvider)[index];

                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      child: Card(
                        color: const Color.fromARGB(255, 255, 17, 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 4, // Add elevation for shadow effect
                        child: ListTile(
                          onTap: () => viewResume(index),
                          title: Text(
                            resume.name,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
              itemCount: ref.watch(homeProvider).length,
            )
          ],
        ),
      ),
    );
  }
}
