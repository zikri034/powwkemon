import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import '../widgets/neo_box.dart';
import '../widgets/neo_button.dart';

class ProfilePage extends StatefulWidget {
  final String username;
  const ProfilePage({super.key, required this.username});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Color _selectedColor = AppColors.success;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Avatar dengan Border Hitam 3px
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.ink, width: 3),
              ),
              child: CircleAvatar(
                radius: 48,
                backgroundColor: _selectedColor,
                child: Text(
                  widget.username.isNotEmpty
                      ? widget.username[0].toUpperCase()
                      : '?',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              widget.username,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: AppColors.ink,
              ),
            ),
            const SizedBox(height: 24),
            // Teks Sumpah
            NeoBox(
              padding: const EdgeInsets.all(16),
              child: const Text(
                'Saya bersumpah mengerjakan soal kuis ini dengan jujur dan tidak melakukan kecurangan apapun itu',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppColors.ink,
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Tombol Warna
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildColorButton(AppColors.blue),
                const SizedBox(width: 16),
                _buildColorButton(AppColors.red),
                const SizedBox(width: 16),
                _buildColorButton(AppColors.purple),
              ],
            ),
            const SizedBox(height: 32),
            // Tombol Logout
            NeoButton(
              label: 'LOGOUT',
              color: _selectedColor,
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/login',
                  (route) => false
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColorButton(Color color) {
    bool isActive = _selectedColor == color;
    return GestureDetector(
      onTap: () => setState(() => _selectedColor = color),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.ink,
            width: isActive ? 5 : 3
          ),
          boxShadow: [
            if (!isActive)
              const BoxShadow(
                color: AppColors.ink,
                offset: Offset(2, 2),
                blurRadius: 0,
              ),
          ],
        ),
        child: isActive
            ? const Icon(Icons.check, color: Colors.white, size: 20)
            : null,
      ),
    );
  }
}
