import 'package:flutter/material.dart';

class TermsDialog extends StatelessWidget {
  final VoidCallback onAccept;

  const TermsDialog({
    super.key,
    required this.onAccept,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 520),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF4DB), // pale yellow
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.warning_amber_rounded,
                        color: Color(0xFFFFB000),
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Persetujuan Pelapor',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: isDark ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),

                // Bullet points
                _bulletItem(
                  'Saya telah membaca dan menyetujui semua persyaratan dalam sistem pelaporan ini.',
                  isDark,
                ),
                _bulletItem(
                  'Laporan yang saya buat adalah ',
                  isDark,
                  richSuffix: ' sebenar-benarnya berdasarkan fakta yang saya alami atau saksikan.',
                ),
                _bulletItem(
                  'Saya ',
                  isDark,
                  richSuffix: ' tidak akan membuat laporan palsu (hoax) atau memberikan keterangan yang menyesatkan.',
                ),
                _bulletItem(
                  'Saya memahami bahwa laporan palsu dapat dikenakan sanksi sesuai peraturan yang berlaku.',
                  isDark,
                ),
                _bulletItem(
                  'Saya bertanggung jawab penuh atas kebenaran informasi yang saya sampaikan.',
                  isDark,
                ),
                _bulletItem(
                  'Data dan video yang saya unggah akan diproses oleh Satgas PPKPRT Politeknik Negeri Lhokseumawe untuk keperluan investigasi.',
                  isDark,
                ),

                const SizedBox(height: 12),

                // Blue note box
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isDark ? Colors.blue.withOpacity(0.08) : const Color(0xFFEAF4FF),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isDark ? Colors.blue.withOpacity(0.18) : const Color(0xFFBEE1FF),
                    ),
                  ),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Catatan Penting: ',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: isDark ? Colors.white : const Color(0xFF1558D6),
                          ),
                        ),
                        TextSpan(
                          text:
                              'Sistem ini dilindungi dengan anonimisasi wajah untuk melindungi privasi Anda. Namun, kami tetap mengharapkan laporan yang jujur dan bertanggung jawab.',
                          style: TextStyle(
                            color: isDark ? Colors.white70 : Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                SizedBox(
                  width: double.infinity,
                  height: 44,
                  child: ElevatedButton(
                    onPressed: onAccept,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      elevation: 0,
                    ),
                    child: const Text('Saya Setuju dan Bertanggung Jawab'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _bulletItem(String text, bool isDark, {String? richSuffix}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 6),
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: isDark ? Colors.white70 : Colors.black87,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: richSuffix == null
                ? Text(
                    text,
                    style: TextStyle(
                      fontSize: 14,
                      color: isDark ? Colors.white70 : Colors.black87,
                    ),
                  )
                : RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: text,
                          style: TextStyle(
                            fontSize: 14,
                            color: isDark ? Colors.white70 : Colors.black87,
                          ),
                        ),
                        TextSpan(
                          text: richSuffix,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: isDark ? Colors.white : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}