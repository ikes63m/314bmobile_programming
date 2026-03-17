import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ─────────────────────────────────────────────────────────────────────────────
// SETTINGS PAGE  (route: '/settings')
// Uses StatefulWidget only so the Switch widgets can visually toggle.
// ─────────────────────────────────────────────────────────────────────────────
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // Hardcoded toggle defaults — no backend logic
  bool _notificationsEnabled = true;
  bool _autoClassify = true;
  bool _darkMode = false;
  bool _spamFilter = true;
  bool _weeklyReport = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),

      // ── CURVED NAVIGATION BAR — index: 3 (Settings is active) ─────────
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: const Color(0xFFF4F6FA),
        color: Colors.blueAccent,
        buttonBackgroundColor: const Color(0xFF1565C0),
        height: 60,
        index: 3, // <-- Settings tab is active
        animationDuration: const Duration(milliseconds: 300),
        animationCurve: Curves.easeInOut,
        items: const <Widget>[
          Icon(Icons.home_rounded, size: 26, color: Colors.white70),
          Icon(Icons.bar_chart_rounded, size: 26, color: Colors.white70),
          Icon(Icons.notifications_rounded, size: 26, color: Colors.white70),
          Icon(Icons.settings_rounded, size: 30, color: Colors.white),
        ],
        onTap: (index) {
          if (index == 0) Get.offNamed('/');
          if (index == 1) Get.offNamed('/analytics');
          if (index == 2) Get.offNamed('/alerts');
          if (index == 3) return; // already here
        },
      ),

      // ── BODY ───────────────────────────────────────────────────────────
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),

              // ── PAGE TITLE ────────────────────────────────────────────
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1A1A2E),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.settings_rounded,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'Settings',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF111827),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 6),
              const Text(
                'App preferences & account',
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),

              const SizedBox(height: 28),

              // ── ACCOUNT CARD — tap anywhere (including pen icon) ──────
              Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(18),
                child: InkWell(
                  borderRadius: BorderRadius.circular(18),
                  onTap: () => Get.toNamed('/edit-profile'),
                  child: Ink(
                    decoration: BoxDecoration(
                      color: const Color(0xFF1A1A2E),
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.10),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: 28,
                            backgroundColor: Colors.blueAccent,
                            child: Text(
                              'JD',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'John Doe',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 3),
                                Text(
                                  'johndoe@gmail.com',
                                  style: TextStyle(
                                    color: Colors.white60,
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(height: 3),
                                Text(
                                  'Free Plan',
                                  style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Pen icon — part of the same tappable surface
                          Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.10),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(
                              Icons.edit_rounded,
                              color: Colors.white70,
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 28),

              // ── NOTIFICATIONS SECTION ─────────────────────────────────
              const Text(
                'NOTIFICATIONS',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey,
                  letterSpacing: 0.8,
                ),
              ),

              const SizedBox(height: 12),

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
                    _buildToggle(
                      icon: Icons.notifications_rounded,
                      iconBg: const Color(0xFFDBEAFE),
                      iconColor: Colors.blueAccent,
                      label: 'Enable Notifications',
                      subtitle: 'Get alerts for new classifications',
                      value: _notificationsEnabled,
                      onChanged: (v) =>
                          setState(() => _notificationsEnabled = v),
                      divider: true,
                    ),
                    _buildToggle(
                      icon: Icons.bar_chart_rounded,
                      iconBg: const Color(0xFFEDE9FE),
                      iconColor: Colors.purple,
                      label: 'Weekly Report',
                      subtitle: 'Summary every Monday morning',
                      value: _weeklyReport,
                      onChanged: (v) => setState(() => _weeklyReport = v),
                      divider: false,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // ── CLASSIFICATION SECTION ────────────────────────────────
              const Text(
                'CLASSIFICATION',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey,
                  letterSpacing: 0.8,
                ),
              ),

              const SizedBox(height: 12),

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
                    _buildToggle(
                      icon: Icons.psychology_rounded,
                      iconBg: const Color(0xFFDCFCE7),
                      iconColor: Colors.green,
                      label: 'Auto-classify Messages',
                      subtitle: 'Classify incoming messages automatically',
                      value: _autoClassify,
                      onChanged: (v) => setState(() => _autoClassify = v),
                      divider: true,
                    ),
                    _buildToggle(
                      icon: Icons.shield_rounded,
                      iconBg: const Color(0xFFFEE2E2),
                      iconColor: Colors.redAccent,
                      label: 'Spam Filter',
                      subtitle: 'Block detected spam automatically',
                      value: _spamFilter,
                      onChanged: (v) => setState(() => _spamFilter = v),
                      divider: false,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // ── APPEARANCE ────────────────────────────────────────────
              const Text(
                'APPEARANCE',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey,
                  letterSpacing: 0.8,
                ),
              ),

              const SizedBox(height: 12),

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
                child: _buildToggle(
                  icon: Icons.dark_mode_rounded,
                  iconBg: const Color(0xFF1A1A2E),
                  iconColor: Colors.white,
                  label: 'Dark Mode',
                  subtitle: 'Switch to dark theme',
                  value: _darkMode,
                  onChanged: (v) => setState(() => _darkMode = v),
                  divider: false,
                ),
              ),

              const SizedBox(height: 24),

              // ── ACCOUNT ACTIONS ───────────────────────────────────────
              const Text(
                'ACCOUNT',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey,
                  letterSpacing: 0.8,
                ),
              ),

              const SizedBox(height: 12),

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
                    _buildNavRow(
                      Icons.privacy_tip_rounded,
                      const Color(0xFFDBEAFE),
                      Colors.blueAccent,
                      'Privacy Policy',
                      true,
                    ),
                    _buildNavRow(
                      Icons.help_rounded,
                      const Color(0xFFDCFCE7),
                      Colors.green,
                      'Help & Support',
                      true,
                    ),
                    _buildNavRow(
                      Icons.info_rounded,
                      const Color(0xFFEDE9FE),
                      Colors.purple,
                      'About',
                      false,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // ── LOGOUT BUTTON ─────────────────────────────────────────
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () {
                    // Logout — UI only, wire to auth logic when ready
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFEE2E2),
                    foregroundColor: Colors.redAccent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: const BorderSide(
                        color: Color(0xFFFCA5A5),
                        width: 1,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.logout_rounded, size: 20),
                      SizedBox(width: 8),
                      Text(
                        'Logout',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 10),

              const Center(
                child: Text(
                  'Smart Messages  v1.0.0',
                  style: TextStyle(fontSize: 11, color: Colors.grey),
                ),
              ),

              const SizedBox(height: 90),
            ],
          ),
        ),
      ),
    );
  }

  // ── Helper: toggle row ──────────────────────────────────────────────────────
  Widget _buildToggle({
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
    required String label,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
    required bool divider,
  }) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF111827),
                      ),
                    ),
                    Text(
                      subtitle,
                      style: const TextStyle(fontSize: 11, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Switch(
                value: value,
                onChanged: onChanged,
                activeColor: Colors.blueAccent,
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

  // ── Helper: nav row ─────────────────────────────────────────────────────────
  Widget _buildNavRow(
    IconData icon,
    Color bg,
    Color color,
    String label,
    bool divider,
  ) {
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
                  color: bg,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: color, size: 20),
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
