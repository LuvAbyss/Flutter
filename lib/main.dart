import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2563EB)),
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
      ),
      home: const PortfolioHomePage(),
    );
  }
}

class PortfolioHomePage extends StatelessWidget {
  const PortfolioHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 700;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _HeaderSection(isSmallScreen: isSmallScreen),
                  const SizedBox(height: 28),
                  const _SectionTitle(title: 'Kỹ năng'),
                  const SizedBox(height: 16),
                  const _SkillsSection(),
                  const SizedBox(height: 32),
                  const _SectionTitle(title: 'Kinh nghiệm'),
                  const SizedBox(height: 16),
                  const _ExperienceSection(),
                  const SizedBox(height: 32),
                  const _SectionTitle(title: 'Dự án đã làm'),
                  const SizedBox(height: 16),
                  const _ProjectsSection(),
                  const SizedBox(height: 32),
                  const _SectionTitle(title: 'Liên hệ'),
                  const SizedBox(height: 16),
                  const _ContactSection(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  const _HeaderSection({required this.isSmallScreen});

  final bool isSmallScreen;

  @override
  Widget build(BuildContext context) {
    final profileInfo = Column(
      crossAxisAlignment:
          isSmallScreen ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: const [
        Text(
          'Hoàng Tùng',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.8,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Sinh viên năm 4 - Đại học Thủy Lợi',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xFF2563EB),
          ),
        ),
        SizedBox(height: 14),
        Text(
          'Tôi tập trung vào việc xây dựng trải nghiệm ứng dụng hiện đại, dễ dùng và tối ưu hiệu suất cho người dùng.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            height: 1.7,
            color: Color(0xFF475569),
          ),
        ),
      ],
    );

    final avatar = Container(
      width: isSmallScreen ? 180 : 220,
      height: isSmallScreen ? 180 : 220,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: const DecorationImage(
          image: AssetImage('assets/vanitas.jpg'),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withValues(alpha: 0.25),
            blurRadius: 24,
            offset: const Offset(0, 16),
          ),
        ],
      ),
    );

    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 20,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: isSmallScreen
          ? Column(
              children: [
                avatar,
                const SizedBox(height: 20),
                profileInfo,
              ],
            )
          : Row(
              children: [
                avatar,
                const SizedBox(width: 28),
                Expanded(child: profileInfo),
              ],
            ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w800,
        letterSpacing: -0.5,
      ),
    );
  }
}

class _SkillsSection extends StatelessWidget {
  const _SkillsSection();

  @override
  Widget build(BuildContext context) {
    final skills = [
      'Flutter',
      'Dart',
      'UI/UX',
      'REST API',
      'Firebase',
      'Git',
      'Problem Solving',
      'Agile',
    ];

    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: skills
          .map(
            (skill) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xFFDBEAFE),
                borderRadius: BorderRadius.circular(999),
                border: Border.all(color: const Color(0xFFBFDBFE)),
              ),
              child: Text(
                skill,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1D4ED8),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}

class _ExperienceSection extends StatelessWidget {
  const _ExperienceSection();

  @override
  Widget build(BuildContext context) {
    final experiences = [
      {
        'title': 'Senior Flutter Developer',
        'company': 'Freelance',
        'period': '2022 - Hiện tại',
        'detail': 'Phát triển và tối ưu ứng dụng mobile, làm việc với design system và tích hợp API.',
      },
      {
        'title': 'Mobile Developer',
        'company': 'Start-up Tech',
        'period': '2019 - 2022',
        'detail': 'Xây dựng giao diện, triển khai tính năng chính, cải thiện trải nghiệm người dùng.',
      },
    ];

    return Column(
      children: experiences
          .map(
            (item) => Container(
              margin: const EdgeInsets.only(bottom: 14),
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 14,
                    height: 14,
                    margin: const EdgeInsets.only(top: 8, right: 16),
                    decoration: const BoxDecoration(
                      color: Color(0xFF2563EB),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['title'] as String,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          '${item['company']} · ${item['period']}',
                          style: const TextStyle(
                            color: Color(0xFF2563EB),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          item['detail'] as String,
                          style: const TextStyle(
                            height: 1.7,
                            color: Color(0xFF475569),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}

class _ProjectsSection extends StatelessWidget {
  const _ProjectsSection();

  @override
  Widget build(BuildContext context) {
    final projects = [
      {
        'name': 'E-commerce App [Fake]',
        'desc': 'Ứng dụng mua sắm, thanh toán, theo dõi đơn hàng và quản lý giỏ hàng.',
      },
      {
        'name': 'Booking System [Fake]',
        'desc': 'Hệ thống đặt lịch, xác nhận và quản lý các lượt đặt với dashboard quản trị.',
      },
      {
        'name': 'Portfolio App',
        'desc': 'Giao diện cá nhân chuyên nghiệp, tối ưu trên mobile và tablet.',
      },
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = constraints.maxWidth >= 900 ? 3 : 1;

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.5,
          ),
          itemCount: projects.length,
          itemBuilder: (context, index) {
            final project = projects[index];
            return Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: const Color(0xFFE2E8F0)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: const BoxDecoration(
                      color: Color(0xFFDBEAFE),
                      borderRadius: BorderRadius.all(Radius.circular(14)),
                    ),
                    child: const Icon(
                      Icons.folder_open_rounded,
                      color: Color(0xFF1D4ED8),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    project['name'] as String,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    project['desc'] as String,
                    style: const TextStyle(
                      height: 1.7,
                      color: Color(0xFF475569),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class _ContactSection extends StatelessWidget {
  const _ContactSection();

  Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $urlString');
    }
  }

  @override
  Widget build(BuildContext context) {
    final contacts = [
      {
        'icon': Icons.email_outlined,
        'label': 'Email',
        'value': 'kurozero180405@gmail.com',
        'url': 'mailto:kurozero180405@gmail.com',
      },
      {
        'icon': Icons.facebook_rounded,
        'label': 'Facebook',
        'value': 'fb.com/lmao.xd.18',
        'url': 'https://www.facebook.com/lmao.xd.18',
      },
      {
        'icon': Icons.code_rounded,
        'label': 'GitHub',
        'value': 'github.com/LuvAbyss',
        'url': 'https://github.com/LuvAbyss',
      },
      {
        'icon': Icons.work_rounded,
        'label': 'LinkedIn',
        'value': 'linkedin.com/in/HoangTung',
        'url': 'https://www.linkedin.com/in/HoangTung',
      },
    ];

    return Wrap(
      spacing: 14,
      runSpacing: 14,
      children: contacts
          .map(
            (contact) => SizedBox(
              width: 250,
              child: ElevatedButton.icon(
                onPressed: () => _launchUrl(contact['url'] as String),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  backgroundColor: Colors.white,
                  foregroundColor: const Color(0xFF0F172A),
                  elevation: 0,
                  side: const BorderSide(color: Color(0xFFE2E8F0)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                icon: Icon(contact['icon'] as IconData, color: const Color(0xFF2563EB)),
                label: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      contact['label'] as String,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF64748B),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      contact['value'] as String,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
