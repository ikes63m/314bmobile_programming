import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ─────────────────────────────────────────────────────────────────────────────
// ALERTS PAGE  (route: '/alerts')
// ─────────────────────────────────────────────────────────────────────────────
class AlertsPage extends StatelessWidget {
  const AlertsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),

      // ── CURVED NAVIGATION BAR — index: 2 (Alerts is active) ───────────
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: const Color(0xFFF4F6FA),
        color: Colors.blueAccent,
        buttonBackgroundColor: const Color(0xFF1565C0),
        height: 60,
        index: 2, // <-- Alerts tab is active
        animationDuration: const Duration(milliseconds: 300),
        animationCurve: Curves.easeInOut,
        items: const <Widget>[
          Icon(Icons.home_rounded, size: 26, color: Colors.white70),
          Icon(Icons.bar_chart_rounded, size: 26, color: Colors.white70),
          Icon(Icons.notifications_rounded, size: 30, color: Colors.white),
          Icon(Icons.settings_rounded, size: 26, color: Colors.white70),
        ],
        onTap: (index) {
          if (index == 0) Get.offNamed('/');
          if (index == 1) Get.offNamed('/analytics');
          if (index == 2) return; // already here
          if (index == 3) Get.offNamed('/settings');
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.notifications_rounded,
                          color: Colors.white,
                          size: 22,
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        'Alerts',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF111827),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      '5 new',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 6),
              const Text(
                'Recent classification alerts',
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),

              const SizedBox(height: 24),

              // ── TODAY ─────────────────────────────────────────────────
              const Text(
                'TODAY',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey,
                  letterSpacing: 0.8,
                ),
              ),

              const SizedBox(height: 12),

              _buildAlert(
                icon: Icons.block_rounded,
                iconBg: const Color(0xFFFEE2E2),
                iconColor: Colors.redAccent,
                title: '3 spam messages blocked',
                subtitle:
                    'Suspicious messages from unknown numbers were automatically blocked.',
                time: '10:24 AM',
                tag: 'Spam',
                tagColor: Colors.redAccent,
                tagBg: const Color(0xFFFEE2E2),
                isUnread: true,
              ),

              const SizedBox(height: 10),

              _buildAlert(
                icon: Icons.star_rounded,
                iconBg: const Color(0xFFDCFCE7),
                iconColor: Colors.green,
                title: 'New important message received',
                subtitle:
                    'A message from Mom was classified as important with 96% confidence.',
                time: '9:11 AM',
                tag: 'Important',
                tagColor: Colors.green,
                tagBg: const Color(0xFFDCFCE7),
                isUnread: true,
              ),

              const SizedBox(height: 10),

              _buildAlert(
                icon: Icons.local_offer_rounded,
                iconBg: const Color(0xFFFFF7ED),
                iconColor: Colors.orange,
                title: 'Promotion detected from Jumia',
                subtitle: 'Flash sale message was moved to Promotions folder.',
                time: '8:45 AM',
                tag: 'Promo',
                tagColor: Colors.orange,
                tagBg: const Color(0xFFFFF7ED),
                isUnread: true,
              ),

              const SizedBox(height: 10),

              _buildAlert(
                icon: Icons.psychology_rounded,
                iconBg: const Color(0xFFDBEAFE),
                iconColor: Colors.blueAccent,
                title: 'Classifier model updated',
                subtitle:
                    'The AI model was refreshed. Accuracy improved to 94.2%.',
                time: '7:00 AM',
                tag: 'System',
                tagColor: Colors.blueAccent,
                tagBg: const Color(0xFFDBEAFE),
                isUnread: true,
              ),

              const SizedBox(height: 24),

              // ── YESTERDAY ─────────────────────────────────────────────
              const Text(
                'YESTERDAY',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey,
                  letterSpacing: 0.8,
                ),
              ),

              const SizedBox(height: 12),

              _buildAlert(
                icon: Icons.warning_amber_rounded,
                iconBg: const Color(0xFFFEE2E2),
                iconColor: Colors.redAccent,
                title: 'Phishing attempt detected',
                subtitle:
                    'A message pretending to be from Safaricom was blocked.',
                time: 'Yesterday, 4:52 PM',
                tag: 'Spam',
                tagColor: Colors.redAccent,
                tagBg: const Color(0xFFFEE2E2),
                isUnread: false,
              ),

              const SizedBox(height: 10),

              _buildAlert(
                icon: Icons.bar_chart_rounded,
                iconBg: const Color(0xFFEDE9FE),
                iconColor: Colors.purple,
                title: 'Weekly summary ready',
                subtitle:
                    'You received 23 messages this week. 4 spam, 7 important, 12 promotions.',
                time: 'Yesterday, 8:00 AM',
                tag: 'Report',
                tagColor: Colors.purple,
                tagBg: const Color(0xFFEDE9FE),
                isUnread: false,
              ),

              const SizedBox(height: 10),

              _buildAlert(
                icon: Icons.person_rounded,
                iconBg: const Color(0xFFDCFCE7),
                iconColor: Colors.green,
                title: 'Personal message from Alex Kamau',
                subtitle:
                    'Message about the hackathon classified as Personal with 88% confidence.',
                time: 'Yesterday, 2:30 PM',
                tag: 'Personal',
                tagColor: Colors.green,
                tagBg: const Color(0xFFDCFCE7),
                isUnread: false,
              ),

              const SizedBox(height: 90),
            ],
          ),
        ),
      ),
    );
  }

  // ── Helper: alert card ──────────────────────────────────────────────────────
  Widget _buildAlert({
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
    required String title,
    required String subtitle,
    required String time,
    required String tag,
    required Color tagColor,
    required Color tagBg,
    required bool isUnread,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isUnread
              ? tagColor.withOpacity(0.35)
              : const Color(0xFFE5E7EB),
          width: isUnread ? 1.5 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 7,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(13),
            ),
            child: Icon(icon, color: iconColor, size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 13.5,
                          fontWeight: isUnread
                              ? FontWeight.w700
                              : FontWeight.w600,
                          color: const Color(0xFF111827),
                        ),
                      ),
                    ),
                    if (isUnread) ...[
                      const SizedBox(width: 6),
                      Container(
                        width: 8,
                        height: 8,
                        margin: const EdgeInsets.only(top: 3),
                        decoration: const BoxDecoration(
                          color: Colors.blueAccent,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF6B7280),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: tagBg,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        tag,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: tagColor,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      time,
                      style: const TextStyle(
                        fontSize: 10.5,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
