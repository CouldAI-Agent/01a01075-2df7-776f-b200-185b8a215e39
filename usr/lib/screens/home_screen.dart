import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Messages'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Family', icon: Icon(Icons.family_restroom)),
              Tab(text: 'Office', icon: Icon(Icons.work)),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            _ContactList(category: 'Family'),
            _ContactList(category: 'Office'),
          ],
        ),
      ),
    );
  }
}

class _ContactList extends StatelessWidget {
  final String category;

  const _ContactList({required this.category});

  @override
  Widget build(BuildContext context) {
    // Dummy data for contacts
    final contacts = List.generate(
      10,
      (index) => '$category Contact ${index + 1}',
    );

    return ListView.builder(
      itemCount: contacts.length,
      itemBuilder: (context, index) {
        final contact = contacts[index];
        return ListTile(
          leading: CircleAvatar(
            child: Text(contact.substring(0, 1)),
          ),
          title: Text(contact),
          subtitle: const Text('Tap to open chat...'),
          onTap: () {
            Navigator.pushNamed(
              context,
              '/chat',
              arguments: contact,
            );
          },
        );
      },
    );
  }
}
