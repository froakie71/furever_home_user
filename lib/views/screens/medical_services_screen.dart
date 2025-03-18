import 'package:flutter/material.dart';

class MedicalServicesScreen extends StatelessWidget {
  const MedicalServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medical Services'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Emergency Contact Card
          Card(
            color: Colors.red.shade50,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.red.shade100,
                        child: const Icon(
                          Icons.emergency,
                          color: Colors.red,
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Emergency Hotline',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('24/7 Veterinary Support'),
                          ],
                        ),
                      ),
                      Text(
                        '+63 123 456 7890',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Q&A Section
          const Text(
            'Frequently Asked Questions',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),

          // Q&A Items
          ...qaItems.map((qa) => _buildQAItem(qa)).toList(),
        ],
      ),
    );
  }

  Widget _buildQAItem(Map<String, String> qa) {
    return ExpansionTile(
      title: Text(
        qa['question']!,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          color: Colors.grey[50],
          child: Text(
            qa['answer']!,
            style: const TextStyle(
              fontSize: 14,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}

// Q&A Data
final List<Map<String, String>> qaItems = [
  {
    'question': 'What vaccinations does my dog need?',
    'answer':
        'Core vaccinations for dogs include: Rabies, Distemper, Parvovirus, and Adenovirus. The vaccination schedule starts at 6-8 weeks of age with boosters every 3-4 weeks until 16 weeks old. Annual boosters may be required depending on the vaccine and your dog\'s risk factors.',
  },
  {
    'question': 'How often should I deworm my dog?',
    'answer':
        'Puppies should be dewormed every 2 weeks until 12 weeks of age, then monthly until 6 months old. Adult dogs should be dewormed every 3-6 months, depending on their lifestyle and risk of exposure.',
  },
  {
    'question': 'What are signs that my dog needs immediate medical attention?',
    'answer':
        'Seek immediate veterinary care if you notice: difficulty breathing, severe bleeding, seizures, collapse, severe vomiting or diarrhea, inability to urinate, bloated abdomen, or signs of extreme pain. These could indicate serious medical conditions requiring emergency treatment.',
  },
  {
    'question': 'How often should I bring my dog for check-ups?',
    'answer':
        'Healthy adult dogs should have a check-up at least once a year. Puppies need more frequent visits for vaccinations and monitoring growth. Senior dogs (7+ years) should have check-ups every 6 months. Dogs with chronic conditions may need more frequent visits as recommended by your vet.',
  },
  {
    'question': 'What preventive care does my dog need?',
    'answer':
        'Regular preventive care includes: vaccinations, parasite prevention (fleas, ticks, heartworm), dental cleaning, regular exercise, proper nutrition, and weight management. Your vet can provide a personalized preventive care plan based on your dog\'s age, breed, and health status.',
  },
];
