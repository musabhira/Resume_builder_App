import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resume_builder_app/controller/home_provider.dart';

import 'package:resume_builder_app/view/ViewResumePage.dart';
import 'package:resume_builder_app/view/resume_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

final localStorageProvider = Provider((_) => LocalStorage());

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
              leading: const Icon(Icons.person_2_outlined,
                  size: 24, color: Colors.white),
              title: const Text(
                'Profile',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              onTap: () {
                // Navigate to Profile screen
              },
            ),
            ListTile(
              leading: const Icon(Icons.list, size: 24, color: Colors.white),
              title: const Text(
                'Settings',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              onTap: () {
                // Navigate to Settings screen
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
                              ? Colors.black // White color in dark mode
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
                                    ? Colors.white // White color in dark mode
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
                    ListTile(
                      onTap: () => viewResume(index),
                      title: Text(resume.name),
                    ),
                    const SizedBox(height: 16),
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

  // void showAddDialog(BuildContext context) {
  //   final TextEditingController titleController = TextEditingController();

  //   Widget cancelButton = TextButton(
  //     child: const Text('Cancel'),
  //     onPressed: () {
  //       Navigator.pop(context);
  //     },
  //   );

  // Widget okButton = TextButton(
  //   child: const Text('Create'),
  //   onPressed: () async {
  //     // final String title = titleController.text;
  //     // titleController.clear();
  //     // createResume(tokens['access'], user['uuid'], title);
  //   },
  // );

  // AlertDialog alert = AlertDialog(
  //   title: const Text('Create a new resume'),
  //   content: Column(
  //     mainAxisSize: MainAxisSize.min,
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       const Text(
  //         'Resume title',
  //         style: TextStyle(
  //           color: Colors.grey,
  //         ),
  //       ),
  //       const SizedBox(height: 10.0),
  //       TextFormField(
  //         autofocus: true,
  //         controller: titleController,
  //         decoration: const InputDecoration(
  //           hintText: 'Resume title',
  //         ),
  //         keyboardType: TextInputType.text,
  //       ),
  //     ],
  //   ),
  //   actions: [
  //     cancelButton,
  //     okButton,
  //   ],
  // );

  // show the dialog
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return alert;
  //     },
  //   );
  // }

  watch(Provider<LocalStorage> localStorageProvider) {}
}

class LocalStorage {}

class Resume {}

class ResumeDetailsScreen extends StatelessWidget {
  final Resume resume;

  const ResumeDetailsScreen({Key? key, required this.resume}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Implement resume details screen UI
    return Scaffold(
      appBar: AppBar(
        title: Text('Resume Details'),
      ),
      body: Center(
        child: Text('Resume Details will be shown here'),
      ),
    );
  }
}

class ResumeCard extends StatelessWidget {
  final Resume resume;

  const ResumeCard({super.key, required this.resume});

  @override
  Widget build(BuildContext context) {
    // Implement resume card UI
    return Card(
      child: ListTile(
        title: Text('Resume Title'),
        subtitle: Text('Resume Description'),
        onTap: () {
          // Navigate to resume details screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResumeDetailsScreen(resume: resume),
            ),
          );
        },
      ),
    );
  }
}

void fetchResumes(String? accessToken, String? userId) {
  // Implement fetching resumes logic
}

void createResume(String? accessToken, String? userId, String title) {
  // Implement creating resume logic
}
