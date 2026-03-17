import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ─────────────────────────────────────────────────────────────────────────────
// EDIT PROFILE PAGE  (route: '/edit-profile')
// No bottom nav — this is a sub-page pushed on top of Settings.
// Back arrow returns to Settings via Get.back().
// ─────────────────────────────────────────────────────────────────────────────
class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  // Pre-filled with the hardcoded profile values from Settings
  final TextEditingController _nameController = TextEditingController(
    text: 'John Doe',
  );
  final TextEditingController _emailController = TextEditingController(
    text: 'johndoe@gmail.com',
  );
  final TextEditingController _phoneController = TextEditingController(
    text: '+254 712 345 678',
  );
  final TextEditingController _bioController = TextEditingController(
    text: 'Smart Messages user',
  );

  // Initials shown in the avatar — updates live as name changes
  String get _initials {
    final parts = _nameController.text.trim().split(' ');
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    if (parts[0].isNotEmpty) return parts[0][0].toUpperCase();
    return 'JD';
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ── TOP SECTION — header + avatar ─────────────────────────────
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(24, 62, 24, 36),
              child: Column(
                children: [
                  // Back button + title row
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: Container(
                          width: 38,
                          height: 38,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.10),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.15),
                            ),
                          ),
                          child: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.white70,
                            size: 16,
                          ),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Edit Profile',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Update your personal information',
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 32),

                  // ── AVATAR ────────────────────────────────────────────
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      // Glow ring
                      Container(
                        width: 96,
                        height: 96,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.blueAccent.withOpacity(0.50),
                            width: 3,
                          ),
                        ),
                      ),

                      // Avatar circle
                      CircleAvatar(
                        radius: 42,
                        backgroundColor: Colors.blueAccent,
                        child: Text(
                          _initials,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 26,
                          ),
                        ),
                      ),

                      // Camera badge — bottom right
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color(0xFF1A1A2E),
                              width: 2,
                            ),
                          ),
                          child: const Icon(
                            Icons.camera_alt_rounded,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Name preview under avatar
                  Text(
                    _nameController.text.trim().isEmpty
                        ? 'Your Name'
                        : _nameController.text.trim(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // ── FORM CARD ──────────────────────────────────────────────────
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(24, 32, 24, 40),
              decoration: const BoxDecoration(
                color: Color(0xFFF4F6FA),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(36),
                  topRight: Radius.circular(36),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // ── PERSONAL INFO LABEL ───────────────────────────────
                  const Text(
                    'PERSONAL INFO',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey,
                      letterSpacing: 0.8,
                    ),
                  ),

                  const SizedBox(height: 14),

                  // ── FULL NAME ─────────────────────────────────────────
                  _buildLabel('Full name'),
                  const SizedBox(height: 8),
                  _buildEditField(
                    controller: _nameController,
                    hint: 'John Doe',
                    icon: Icons.person_rounded,
                    iconBg: const Color(0xFFDBEAFE),
                    iconColor: Colors.blueAccent,
                    keyboardType: TextInputType.name,
                    onChanged: (_) => setState(() {}),
                  ),

                  const SizedBox(height: 18),

                  // ── EMAIL ─────────────────────────────────────────────
                  _buildLabel('Email address'),
                  const SizedBox(height: 8),
                  _buildEditField(
                    controller: _emailController,
                    hint: 'you@email.com',
                    icon: Icons.email_rounded,
                    iconBg: const Color(0xFFEDE9FE),
                    iconColor: Colors.purple,
                    keyboardType: TextInputType.emailAddress,
                  ),

                  const SizedBox(height: 18),

                  // ── PHONE ─────────────────────────────────────────────
                  _buildLabel('Phone number'),
                  const SizedBox(height: 8),
                  _buildEditField(
                    controller: _phoneController,
                    hint: '+254 7XX XXX XXX',
                    icon: Icons.phone_rounded,
                    iconBg: const Color(0xFFDCFCE7),
                    iconColor: Colors.green,
                    keyboardType: TextInputType.phone,
                  ),

                  const SizedBox(height: 18),

                  // ── BIO ───────────────────────────────────────────────
                  _buildLabel('Bio'),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xFFE5E7EB)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.04),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: _bioController,
                      maxLines: 3,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF111827),
                      ),
                      decoration: InputDecoration(
                        hintText: 'Write a short bio...',
                        hintStyle: const TextStyle(
                          color: Color(0xFF9CA3AF),
                          fontSize: 13,
                        ),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 6,
                            top: 12,
                          ),
                          child: Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFF7ED),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(
                              Icons.edit_note_rounded,
                              color: Colors.orange,
                              size: 20,
                            ),
                          ),
                        ),
                        prefixIconConstraints: const BoxConstraints(
                          minWidth: 56,
                          minHeight: 56,
                        ),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 28),

                  // ── ACCOUNT SECTION ───────────────────────────────────
                  const Text(
                    'ACCOUNT',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey,
                      letterSpacing: 0.8,
                    ),
                  ),

                  const SizedBox(height: 14),

                  // Change password row
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xFFE5E7EB)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.04),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        _buildActionRow(
                          icon: Icons.lock_reset_rounded,
                          iconBg: const Color(0xFFFEE2E2),
                          iconColor: Colors.redAccent,
                          label: 'Change Password',
                          divider: true,
                        ),
                        _buildActionRow(
                          icon: Icons.verified_user_rounded,
                          iconBg: const Color(0xFFDCFCE7),
                          iconColor: Colors.green,
                          label: 'Verify Email Address',
                          divider: false,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 28),

                  // ── SAVE BUTTON ───────────────────────────────────────
                  GestureDetector(
                    onTap: () {
                      // Save logic goes here when backend is ready.
                      // For now show a snackbar and go back.
                      Get.snackbar(
                        'Profile Updated',
                        'Your changes have been saved.',
                        backgroundColor: const Color(0xFF1A1A2E),
                        colorText: Colors.white,
                        icon: const Icon(
                          Icons.check_circle_rounded,
                          color: Colors.green,
                        ),
                        snackPosition: SnackPosition.BOTTOM,
                        margin: const EdgeInsets.all(16),
                        borderRadius: 14,
                        duration: const Duration(seconds: 2),
                      );
                      Future.delayed(const Duration(seconds: 2), () {
                        Get.back();
                      });
                    },
                    child: Container(
                      height: 54,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blueAccent.withOpacity(0.35),
                            blurRadius: 14,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.save_rounded,
                            color: Colors.white,
                            size: 20,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Save Changes',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Discard changes
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      height: 52,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: const Color(0xFFE5E7EB),
                          width: 1.5,
                        ),
                      ),
                      child: const Text(
                        'Discard Changes',
                        style: TextStyle(
                          color: Color(0xFF6B7280),
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  const Center(
                    child: Text(
                      'Smart Messages  v1.0.0',
                      style: TextStyle(fontSize: 11, color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Helper: section label ───────────────────────────────────────────────────
  Widget _buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: Color(0xFF374151),
      ),
    );
  }

  // ── Helper: editable text field ─────────────────────────────────────────────
  Widget _buildEditField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
    TextInputType keyboardType = TextInputType.text,
    ValueChanged<String>? onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5E7EB)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        onChanged: onChanged,
        style: const TextStyle(fontSize: 14, color: Color(0xFF111827)),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 13),
          prefixIcon: Container(
            margin: const EdgeInsets.all(10),
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          // Clear button on the right
          suffixIcon: GestureDetector(
            onTap: () {
              controller.clear();
              if (onChanged != null) onChanged('');
            },
            child: const Icon(
              Icons.close_rounded,
              color: Color(0xFFD1D5DB),
              size: 18,
            ),
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
        ),
      ),
    );
  }

  // ── Helper: tappable action row ─────────────────────────────────────────────
  Widget _buildActionRow({
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
    required String label,
    required bool divider,
  }) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
          child: Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: iconBg,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: iconColor, size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  label,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF111827),
                  ),
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 14,
                color: Colors.grey,
              ),
            ],
          ),
        ),
        if (divider)
          Container(
            height: 1,
            margin: const EdgeInsets.only(left: 62),
            color: const Color(0xFFF3F4F6),
          ),
      ],
    );
  }
}
