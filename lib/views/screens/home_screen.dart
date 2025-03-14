import 'package:flutter/material.dart';
import 'package:furever_home/views/screens/adopted_dogs_screen.dart';
import 'package:furever_home/views/screens/dog_screen.dart';
import 'package:furever_home/views/screens/donation_screen.dart';
import 'package:furever_home/views/screens/event_screen.dart';
import 'medical_services_screen.dart';
import 'about_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/logo.png', // Add your logo here
          height: 40,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  size: 50,
                  color: Colors.grey,
                ),
              ),
              accountName: Text('John Doe'),
              accountEmail: Text('johndoe@example.com'),
            ),
            ListTile(
              leading: const Icon(Icons.event),
              title: const Text('Events'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EventScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.pets),
              title: const Text('Dogs'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DogScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.volunteer_activism),
              title: const Text('Donate'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DonationScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text('Adopted'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AdoptedDogsScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.medical_services),
              title: const Text('Medical Services'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MedicalServicesScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('About Us'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AboutScreen(),
                  ),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                // TODO: Implement logout functionality
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Hero Banner
          Stack(
            children: [
              Image.network(
                'https://paws.org.ph/wp-content/uploads/2022/03/PAWS-Home-Cover-scaled.jpg',
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Container(
                height: 250,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.1),
                      Colors.black.withOpacity(0.7),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Help them find a home',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Donate Now'),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Quick Actions
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'How You Can Help',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  children: [
                    _buildActionCard(
                      'Events',
                      Icons.event,
                      'View upcoming events',
                      Colors.purple,
                      context,
                    ),
                    _buildActionCard(
                      'Dogs',
                      Icons.pets,
                      'Browse available dogs',
                      Colors.blue,
                      context,
                    ),
                    _buildActionCard(
                      'Donate',
                      Icons.volunteer_activism,
                      'Support our cause',
                      Colors.orange,
                      context,
                    ),
                    _buildActionCard(
                      'Adopted',
                      Icons.favorite,
                      'Your adopted pets',
                      Colors.red,
                      context,
                    ),
                    _buildActionCard(
                      'Medical',
                      Icons.medical_services,
                      'Pet health services',
                      Colors.green,
                      context,
                    ),
                    _buildActionCard(
                      'About',
                      Icons.info_outline,
                      'Learn about us',
                      Colors.teal,
                      context,
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                const Text(
                  'Dogs for Adoption',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.only(bottom: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(8),
                            ),
                            child: Image.network(
                              'https://placedog.net/500/300?id=$index',
                              height: 200,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Dog ${index + 1}',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Age: 2 years • Gender: Male\nBreed: Mixed',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                  ),
                                ),
                                const SizedBox(height: 16),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.orange,
                                    foregroundColor: Colors.white,
                                  ),
                                  child: const Text('Learn More'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionCard(String title, IconData icon, String subtitle,
      Color color, BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (title == 'Donate') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const DonationScreen(),
            ),
          );
        } else if (title == 'Events') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const EventScreen(),
            ),
          );
        } else if (title == 'Dogs') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const DogScreen(),
            ),
          );
        } else if (title == 'Adopted') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AdoptedDogsScreen(),
            ),
          );
        } else if (title == 'Medical') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MedicalServicesScreen(),
            ),
          );
        } else if (title == 'About') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AboutScreen(),
            ),
          );
        }
      },
      child: Card(
        elevation: 2,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border(top: BorderSide(color: color, width: 4)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: color),
              const SizedBox(height: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
