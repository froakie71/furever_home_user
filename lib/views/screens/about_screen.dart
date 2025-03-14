import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Hero Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              'https://paws.org.ph/wp-content/uploads/2022/03/PAWS-Home-Cover-scaled.jpg',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 24),

          // Mission
          const Text(
            'Our Mission',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'To provide loving homes for abandoned and rescued dogs through responsible adoption, while promoting animal welfare education and compassionate pet care in our community.',
            style: TextStyle(fontSize: 16, height: 1.5),
          ),
          const SizedBox(height: 24),

          // Impact Stats
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.orange.shade50,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Our Impact',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatCard('500+', 'Dogs\nRescued'),
                    _buildStatCard('400+', 'Happy\nAdopters'),
                    _buildStatCard('50+', 'Partner\nVets'),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Values
          const Text(
            'Our Values',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _buildValueCard(
            Icons.favorite,
            'Compassion',
            'We treat every animal with love and care',
            Colors.red,
          ),
          const SizedBox(height: 12),
          _buildValueCard(
            Icons.verified_user,
            'Responsibility',
            'We ensure safe and suitable adoptions',
            Colors.blue,
          ),
          const SizedBox(height: 12),
          _buildValueCard(
            Icons.people,
            'Community',
            'We work together to make a difference',
            Colors.green,
          ),
          const SizedBox(height: 24),

          // Contact Info
          const Text(
            'Get in Touch',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.orange.shade100,
              child: const Icon(Icons.location_on, color: Colors.orange),
            ),
            title: const Text('Visit Us'),
            subtitle: const Text('123 Pet Street, Manila, Philippines'),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.orange.shade100,
              child: const Icon(Icons.email, color: Colors.orange),
            ),
            title: const Text('Email Us'),
            subtitle: const Text('contact@fureverhome.org'),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.orange.shade100,
              child: const Icon(Icons.phone, color: Colors.orange),
            ),
            title: const Text('Call Us'),
            subtitle: const Text('+63 123 456 7890'),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _buildValueCard(
      IconData icon, String title, String description, Color color) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: color.withOpacity(0.1),
              child: Icon(icon, color: color),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(
                      color: Colors.grey[600],
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
}
