import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // Edit profile functionality
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Settings functionality
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header Section
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  // Profile Picture
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.grey[300],
                        child: const Icon(
                          Icons.person,
                          size: 50,
                          color: Colors.grey,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.camera_alt,
                            size: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Name and Title
                  const Text(
                    'Ramanand Sharma',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Senior Software Developer',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Location
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 16,
                        color: Colors.grey[600],
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'San Francisco, CA',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Stats Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildStatItem('Projects', '24'),
                      _buildStatItem('Connections', '1.2k'),
                      _buildStatItem('Reviews', '4.8'),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // About Section
            _buildSection(
              title: 'About',
              child: const Text(
                'Passionate software developer with 5+ years of experience in mobile app development. Specialized in Flutter and React Native. Love creating intuitive user experiences and solving complex problems.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  height: 1.5,
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Contact Information
            _buildSection(
              title: 'Contact Information',
              child: Column(
                children: [
                  _buildContactItem(
                    icon: Icons.email,
                    label: 'Email',
                    value: 'john.doe@email.com',
                  ),
                  _buildContactItem(
                    icon: Icons.phone,
                    label: 'Phone',
                    value: '+1 (555) 123-4567',
                  ),
                  _buildContactItem(
                    icon: Icons.web,
                    label: 'Website',
                    value: 'johndoe.dev',
                  ),
                  _buildContactItem(
                    icon: Icons.work,
                    label: 'LinkedIn',
                    value: 'linkedin.com/in/johndoe',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Skills Section
            _buildSection(
              title: 'Skills',
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _buildSkillChip('Flutter'),
                  _buildSkillChip('Dart'),
                  _buildSkillChip('React Native'),
                  _buildSkillChip('JavaScript'),
                  _buildSkillChip('Firebase'),
                  _buildSkillChip('Node.js'),
                  _buildSkillChip('MongoDB'),
                  _buildSkillChip('Git'),
                  _buildSkillChip('UI/UX Design'),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Experience Section
            _buildSection(
              title: 'Experience',
              child: Column(
                children: [
                  _buildExperienceItem(
                    title: 'Senior Software Developer',
                    company: 'Tech Solutions Inc.',
                    duration: '2022 - Present',
                    description:
                        'Lead mobile app development team, built 5+ production apps',
                  ),
                  const SizedBox(height: 16),
                  _buildExperienceItem(
                    title: 'Mobile Developer',
                    company: 'Digital Innovations',
                    duration: '2020 - 2022',
                    description:
                        'Developed cross-platform mobile applications using Flutter',
                  ),
                  const SizedBox(height: 16),
                  _buildExperienceItem(
                    title: 'Junior Developer',
                    company: 'StartUp Labs',
                    duration: '2019 - 2020',
                    description:
                        'Contributed to web and mobile application development',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Education Section
            _buildSection(
              title: 'Education',
              child: Column(
                children: [
                  _buildEducationItem(
                    degree: 'Bachelor of Science in Computer Science',
                    school: 'University of California, Berkeley',
                    year: '2019',
                  ),
                  const SizedBox(height: 12),
                  _buildEducationItem(
                    degree: 'Flutter Development Certificate',
                    school: 'Google Developer Training',
                    year: '2020',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Action Buttons
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Edit profile functionality
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Edit Profile',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {
                        // Share profile functionality
                      },
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Share Profile',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({required String title, required Widget child}) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildContactItem({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
            color: Colors.grey[600],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.copy,
            size: 16,
            color: Colors.grey[400],
          ),
        ],
      ),
    );
  }

  Widget _buildSkillChip(String skill) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.blue[200]!),
      ),
      child: Text(
        skill,
        style: TextStyle(
          fontSize: 14,
          color: Colors.blue[700],
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildExperienceItem({
    required String title,
    required String company,
    required String duration,
    required String description,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          company,
          style: TextStyle(
            fontSize: 14,
            color: Colors.blue[600],
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          duration,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black87,
            height: 1.4,
          ),
        ),
      ],
    );
  }

  Widget _buildEducationItem({
    required String degree,
    required String school,
    required String year,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          degree,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          school,
          style: TextStyle(
            fontSize: 14,
            color: Colors.blue[600],
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          year,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}
