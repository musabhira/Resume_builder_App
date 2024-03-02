import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localStorageProvider = Provider((_) => LocalStorage());

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Resume> resumes = [];

    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Color.fromARGB(255, 255, 17, 0)),
        elevation: 0,
        title: const Text(
          'Resume Builder',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.only(right: 10.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: const Icon(
                Icons.nightlight_outlined,
                color: Color.fromARGB(255, 255, 17, 0),
              ),
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
        child: Container(
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
                      color: Colors.grey.shade100,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        showAddDialog(context);
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
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
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
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    'My Resumes',
                    style: TextStyle(
                        fontSize: 19,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: resumes.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResumeDetailsScreen(
                            resume: resumes[index],
                          ),
                        ),
                      );
                    },
                    child: ResumeCard(
                      resume: resumes[index],
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  void showAddDialog(BuildContext context) {
    final TextEditingController titleController = TextEditingController();

    Widget cancelButton = TextButton(
      child: const Text('Cancel'),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    Widget okButton = TextButton(
      child: const Text('Create'),
      onPressed: () async {
        // final String title = titleController.text;
        // titleController.clear();
        // createResume(tokens['access'], user['uuid'], title);
      },
    );

    AlertDialog alert = AlertDialog(
      title: const Text('Create a new resume'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Resume title',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 10.0),
          TextFormField(
            autofocus: true,
            controller: titleController,
            decoration: const InputDecoration(
              hintText: 'Resume title',
            ),
            keyboardType: TextInputType.text,
          ),
        ],
      ),
      actions: [
        cancelButton,
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

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
