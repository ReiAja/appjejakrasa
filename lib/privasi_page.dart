import 'package:flutter/material.dart';

class PrivasiPage extends StatefulWidget {
  const PrivasiPage({Key? key}) : super(key: key);

  @override
  State<PrivasiPage> createState() => _PrivasiPageState();
}

class _PrivasiPageState extends State<PrivasiPage> {
  bool _isPrivateAccount = false;
  bool _showInSearch = true;
  bool _showActivityStatus = true;
  bool _allowTagging = true;
  bool _allowMentions = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Privasi',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
            color: Colors.black87,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            // Akun Section
            _buildSectionTitle('Akun'),
            const SizedBox(height: 12),
            _buildToggleItem(
              title: 'Akun Privat',
              subtitle: 'Hanya pengikut yang disetujui bisa melihat resep Anda',
              icon: Icons.lock_outline,
              value: _isPrivateAccount,
              onChanged: (value) {
                setState(() {
                  _isPrivateAccount = value;
                });
                _showSnackBar('Pengaturan privasi diperbarui');
              },
            ),
            const SizedBox(height: 8),
            _buildToggleItem(
              title: 'Tampilkan di Pencarian',
              subtitle: 'Izinkan orang lain menemukan akun Anda',
              icon: Icons.search,
              value: _showInSearch,
              onChanged: (value) {
                setState(() {
                  _showInSearch = value;
                });
                _showSnackBar('Pengaturan pencarian diperbarui');
              },
            ),

            const SizedBox(height: 24),

            // Aktivitas Section
            _buildSectionTitle('Aktivitas'),
            const SizedBox(height: 12),
            _buildToggleItem(
              title: 'Status Online',
              subtitle: 'Tampilkan saat Anda sedang aktif',
              icon: Icons.visibility,
              value: _showActivityStatus,
              onChanged: (value) {
                setState(() {
                  _showActivityStatus = value;
                });
                _showSnackBar('Status online diperbarui');
              },
            ),
            const SizedBox(height: 8),
            _buildToggleItem(
              title: 'Izinkan Tagging',
              subtitle: 'Izinkan orang lain menandai Anda di resep',
              icon: Icons.person_add_outlined,
              value: _allowTagging,
              onChanged: (value) {
                setState(() {
                  _allowTagging = value;
                });
                _showSnackBar('Pengaturan tagging diperbarui');
              },
            ),
            const SizedBox(height: 8),
            _buildToggleItem(
              title: 'Izinkan Mention',
              subtitle: 'Izinkan orang lain menyebut Anda di komentar',
              icon: Icons.alternate_email,
              value: _allowMentions,
              onChanged: (value) {
                setState(() {
                  _allowMentions = value;
                });
                _showSnackBar('Pengaturan mention diperbarui');
              },
            ),

            const SizedBox(height: 24),

            // Data Section
            _buildSectionTitle('Data'),
            const SizedBox(height: 12),
            _buildActionItem(
              title: 'Unduh Data',
              subtitle: 'Unduh salinan data akun Anda',
              icon: Icons.download_outlined,
              onTap: () {
                _showSnackBar('Fitur sedang dalam pengembangan');
              },
            ),
            const SizedBox(height: 8),
            _buildActionItem(
              title: 'Hapus Riwayat Pencarian',
              subtitle: 'Hapus semua riwayat pencarian Anda',
              icon: Icons.history,
              onTap: () {
                _showConfirmationDialog(
                  title: 'Hapus Riwayat Pencarian',
                  message:
                      'Apakah Anda yakin ingin menghapus semua riwayat pencarian?',
                  onConfirm: () {
                    _showSnackBar('Riwayat pencarian dihapus');
                    Navigator.pop(context);
                  },
                );
              },
            ),

            const SizedBox(height: 24),

            // Keamanan Section
            _buildSectionTitle('Keamanan'),
            const SizedBox(height: 12),
            _buildActionItem(
              title: 'Ubah Kata Sandi',
              subtitle: 'Perbarui kata sandi akun Anda',
              icon: Icons.vpn_key_outlined,
              onTap: () {
                _showSnackBar('Fitur sedang dalam pengembangan');
              },
            ),
            const SizedBox(height: 8),
            _buildActionItem(
              title: 'Verifikasi Dua Langkah',
              subtitle: 'Tambahkan lapisan keamanan ekstra',
              icon: Icons.security_outlined,
              onTap: () {
                _showSnackBar('Fitur sedang dalam pengembangan');
              },
            ),
            const SizedBox(height: 8),
            _buildActionItem(
              title: 'Sesi Aktif',
              subtitle: 'Kelola perangkat yang login ke akun Anda',
              icon: Icons.devices_outlined,
              onTap: () {
                _showSnackBar('Fitur sedang dalam pengembangan');
              },
            ),
            const SizedBox(height: 8),
            _buildActionItem(
              title: 'Hapus Akun',
              subtitle: 'Hapus akun secara permanen',
              icon: Icons.delete_forever_outlined,
              isDestructive: true,
              onTap: () {
                _showConfirmationDialog(
                  title: 'Hapus Akun',
                  message:
                      'Apakah Anda yakin ingin menghapus akun secara permanen? Tindakan ini tidak dapat dibatalkan.',
                  onConfirm: () {
                    _showSnackBar('Permintaan penghapusan akun dikirim');
                    Navigator.pop(context);
                  },
                );
              },
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          fontFamily: 'Poppins',
          color: Colors.amber[700],
        ),
      ),
    );
  }

  Widget _buildToggleItem({
    required String title,
    required String subtitle,
    required IconData icon,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.amber.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.amber[50],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: Colors.amber[600], size: 20),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey[500],
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: Colors.amber[700],
            activeTrackColor: Colors.amber[200],
          ),
        ],
      ),
    );
  }

  Widget _buildActionItem({
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
    bool isDestructive = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.amber.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: isDestructive ? Colors.red[50] : Colors.amber[50],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                icon,
                color: isDestructive ? Colors.red[600] : Colors.amber[600],
                size: 20,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                      color: isDestructive ? Colors.red[600] : Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey[500],
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: Colors.grey[400]),
          ],
        ),
      ),
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: const TextStyle(fontFamily: 'Poppins')),
        backgroundColor: Colors.amber[700],
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  void _showConfirmationDialog({
    required String title,
    required String message,
    required VoidCallback onConfirm,
  }) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
          ),
          content: Text(message, style: const TextStyle(fontFamily: 'Poppins')),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Batal',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: onConfirm,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[600],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Hapus',
                style: TextStyle(color: Colors.white, fontFamily: 'Poppins'),
              ),
            ),
          ],
        );
      },
    );
  }
}
