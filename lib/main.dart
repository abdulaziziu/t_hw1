import 'package:flutter/material.dart';

void main() {
  runApp(const UserCardsApp());
}

class UserCardsApp extends StatelessWidget {
  const UserCardsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Cards',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        scaffoldBackgroundColor: const Color(0xFFF4F6FA),
      ),
      home: const UsersScreen(),
    );
  }
}

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  List<User> _buildUsers() {
    return const [
      User(
        name: 'Anna Petrova',
        role: 'Product Designer',
        email: 'anna.petrova@mail.com',
        phone: '+1 202 555 0114',
        status: 'Online',
        isOnline: true,
        avatarColor: Color(0xFF6C63FF),
      ),
      User(
        name: 'David Wang',
        role: 'Mobile Developer',
        email: 'd.wang@mail.com',
        phone: '+1 202 555 0172',
        status: 'Busy',
        isOnline: true,
        avatarColor: Color(0xFF2FB67D),
      ),
      User(
        name: 'Maria Gomez',
        role: 'QA Engineer',
        email: 'maria.gomez@mail.com',
        phone: '+1 202 555 0199',
        status: 'Offline',
        isOnline: false,
        avatarColor: Color(0xFFF29D50),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final users = _buildUsers();

    return Scaffold(
      appBar: AppBar(
        title: const Text('User Cards'),
        centerTitle: false,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: users.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          return UserCard(user: users[index]);
        },
      ),
    );
  }
}

abstract class Person {
  final String name;
  final String role;
  final Color avatarColor;

  const Person({
    required this.name,
    required this.role,
    required this.avatarColor,
  });

  String get initials {
    final cleaned = name.trim();
    if (cleaned.isEmpty) {
      return '';
    }
    final parts = cleaned.split(RegExp(r'\s+'));
    if (parts.length == 1) {
      return parts.first[0].toUpperCase();
    }
    return (parts[0][0] + parts[1][0]).toUpperCase();
  }
}

class User extends Person {
  final String email;
  final String phone;
  final String status;
  final bool isOnline;

  const User({
    required super.name,
    required super.role,
    required super.avatarColor,
    required this.email,
    required this.phone,
    required this.status,
    required this.isOnline,
  });
}

abstract class BaseCard extends StatelessWidget {
  const BaseCard({super.key});

  Widget buildContent(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A000000),
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: buildContent(context),
    );
  }
}

class UserCard extends BaseCard {
  final User user;

  const UserCard({super.key, required this.user});

  @override
  Widget buildContent(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 26,
          backgroundColor: user.avatarColor,
          child: Text(
            user.initials,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                user.role,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey.shade600,
                ),
              ),
              const SizedBox(height: 12),
              _InfoRow(icon: Icons.email_outlined, text: user.email),
              const SizedBox(height: 6),
              _InfoRow(icon: Icons.phone_outlined, text: user.phone),
            ],
          ),
        ),
        const SizedBox(width: 8),
        _StatusChip(isOnline: user.isOnline, label: user.status),
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey.shade600),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            text,
            style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class _StatusChip extends StatelessWidget {
  final bool isOnline;
  final String label;

  const _StatusChip({required this.isOnline, required this.label});

  @override
  Widget build(BuildContext context) {
    final background = isOnline ? const Color(0xFFE7F7EF) : const Color(0xFFF1F1F1);
    final foreground = isOnline ? const Color(0xFF2FB67D) : const Color(0xFF8E8E8E);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: foreground,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
