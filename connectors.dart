import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: ConnectorsDetailPage(),
    ),
  );
}

class ConnectorsDetailPage extends StatelessWidget {
  final List<String> connectorItems = [
    'AC/DC Connectors',
    'Audio Connectors',
    'Alligator Clips',
    'Battery Connectors',
    'Cable Connectors',
    'Ethernet Connectors',
    'Female Headers',
    'IC Sockets',
    'IDC Connectors',
    'Lighting Connectors',
    'Mezzanine Connectors',
    'Pin Headers',
    'Power Connectors',
    'Screw Terminal',
    'Sim Card Connectors',
    'USB Connectors',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Connectors")),
      body: ListView.builder(
        itemCount: connectorItems.length,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              title: Text(connectorItems[index]),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => _getConnectorsPage(connectorItems[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _getConnectorsPage(String name) {
    switch (name) {
      case 'AC/DC Connectors':
        return ACDCConnectorsPage();
      case 'Audio Connectors':
        return AudioConnectorsPage();
      case 'Alligator Clips':
        return AlligatorClipsPage();
      case 'Battery Connectors':
        return BatteryConnectorsPage();
      case 'Cable Connectors':
        return CableConnectorsPage();
      case 'Ethernet Connectors':
        return EthernetConnectorsPage();
      case 'Female Headers':
        return FemaleHeadersPage();
      case 'IC Sockets':
        return ICSocketsPage();
      case 'IDC Connectors':
        return IDCConnectorsPage();
      case 'Lighting Connectors':
        return LightingConnectorsPage();
      case 'Mezzanine Connectors':
        return MezzanineConnectorsPage();
      case 'Pin Headers':
        return PinHeadersPage();
      case 'Power Connectors':
        return PowerConnectorsPage();
      case 'Screw Terminal':
        return ScrewTerminalPage();
      case 'Sim Card Connectors':
        return SimCardConnectorsPage();
      case 'USB Connectors':
        return USBConnectorsPage();
      default:
        return IndividualConnectorsPage(
          title: name,
          description: 'No description available.',
          imagePath: 'assets/connector/default.png',
        );
    }
  }
}

class IndividualConnectorsPage extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const IndividualConnectorsPage({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                height: 220,
                width: screenWidth * 0.8,
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.broken_image, size: 64, color: Colors.grey),
                        SizedBox(height: 8),
                        Text("Image not found"),
                      ],
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(description, style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}

class ACDCConnectorsPage extends StatelessWidget {
  const ACDCConnectorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: const Text('AC/DC Connectors')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                height: 220,
                width: screenWidth * 0.8,
                child: Image.asset(
                  'assets/1c.jpg',
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.broken_image, size: 64, color: Colors.grey),
                        SizedBox(height: 8),
                        Text("Image not found"),
                      ],
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Description',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'AC/DC connectors are used to supply power to electronic devices, either through alternating current (AC) or direct current (DC). They are commonly found in wall adapters and power supplies. These connectors ensure a secure connection for stable voltage transmission. They come in various sizes, typically barrel-shaped for DC connections.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 24),
            const Text(
              'Specifications',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text.rich(
              TextSpan(
                style: TextStyle(fontSize: 16),
                children: [
                  TextSpan(text: '• Voltage rating: '),
                  TextSpan(text: '\n     Up to 250V\n\n'),
                  TextSpan(text: '• Current rating: '),
                  TextSpan(text: '\n     1-10A\n\n'),
                  TextSpan(text: '• Types: '),
                  TextSpan(
                    text: '\n     Barrel, coaxial, snap-fit, locking\n\n',
                  ),
                  TextSpan(text: '• Polarity: '),
                  TextSpan(
                    text: '\n     Center-positive or center-negative\n\n',
                  ),
                  TextSpan(text: '• Applications: '),
                  TextSpan(
                    text:
                        '\n     • Powering consumer electronics\n     • External power adapters for laptops\n     • Wall-mounted power supply systems',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Pin Diagram',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Center(
              child: SizedBox(
                height: 220,
                width: screenWidth * 0.8,
                child: Image.asset(
                  'assets/2c.jpg',
                  // Pin diagram image
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.broken_image, size: 64, color: Colors.grey),
                        SizedBox(height: 8),
                        Text("Pin diagram not found"),
                      ],
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 2), // Spacing between images
            Center(
              child: SizedBox(
                height: 220,
                width: screenWidth * 0.8,
                child: Image.asset(
                  'assets/3c.jpg',
                  // Second image
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.broken_image, size: 64, color: Colors.grey),
                        SizedBox(height: 8),
                        Text("Pin diagram not found"),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AudioConnectorsPage extends StatelessWidget {
  const AudioConnectorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: const Text('Audio Connectors')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                height: 220,
                width: screenWidth * 0.8,
                child: Image.asset(
                  'assets/4c.jpg',
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.broken_image, size: 64, color: Colors.grey),
                        SizedBox(height: 8),
                        Text("Image not found"),
                      ],
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Description',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Audio connectors are used for transmitting audio signals between devices. They come in various types, such as 3.5mm jacks, RCA connectors, and XLR connectors. These connectors are designed to ensure high-quality signal transfer with minimal interference. Common applications include headphones, speakers, and audio interfaces.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 24),
            const Text(
              'Specifications',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text.rich(
              TextSpan(
                style: TextStyle(fontSize: 16),
                children: [
                  TextSpan(text: '• Voltage rating: '),
                  TextSpan(text: '\n     Typically up to 20V\n\n'),
                  TextSpan(text: '• Current rating: '),
                  TextSpan(text: '\n     0.5A to 2A\n\n'),
                  TextSpan(text: '• Types: '),
                  TextSpan(text: '\n     3.5mm, RCA, XLR, TRS, TS\n\n'),
                  TextSpan(text: '• Shielding: '),
                  TextSpan(text: '\n     Braided or foil shielding\n\n'),
                  TextSpan(text: '• Applications: '),
                  TextSpan(
                    text:
                        '\n     • Audio equipment connections\n     • Home theater systems\n     • Professional audio gear',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Pin Diagram',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Center(
              child: SizedBox(
                height: 220,
                width: screenWidth * 0.8,
                child: Image.asset(
                  'assets/5c.jpg',
                  // Pin diagram image
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.broken_image, size: 64, color: Colors.grey),
                        SizedBox(height: 8),
                        Text("Pin diagram not found"),
                      ],
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 8), // Spacing between images
            Center(
              child: SizedBox(
                height: 220,
                width: screenWidth * 0.7,
                child: Image.asset(
                  'assets/6c.jpg',
                  // Second image
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.broken_image, size: 64, color: Colors.grey),
                        SizedBox(height: 8),
                        Text("Pin diagram not found"),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AlligatorClipsPage extends StatelessWidget {
  const AlligatorClipsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: const Text('Alligator Clips')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                height: 220,
                width: screenWidth * 0.8,
                child: Image.asset(
                  'assets/7c.jpg',
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.broken_image, size: 64, color: Colors.grey),
                        SizedBox(height: 8),
                        Text("Image not found"),
                      ],
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Description',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Alligator clips are versatile tools used in electronics for making temporary connections in circuits. They are spring-loaded and feature serrated jaws that grip tightly to wires, pins, or other conductive surfaces. Commonly used in testing, prototyping, and repair work, these clips are known for their ease of use and durability.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 24),
            const Text(
              'Specifications',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text.rich(
              TextSpan(
                style: TextStyle(fontSize: 16),
                children: [
                  TextSpan(text: '• Voltage rating: '),
                  TextSpan(text: '\n     Typically up to 30V\n\n'),
                  TextSpan(text: '• Current rating: '),
                  TextSpan(text: '\n     10A to 20A\n\n'),
                  TextSpan(text: '• Materials: '),
                  TextSpan(
                    text: '\n     Copper, nickel-plated or plastic-coated\n\n',
                  ),
                  TextSpan(text: '• Insulation: '),
                  TextSpan(text: '\n     Plastic or rubber insulated\n\n'),
                  TextSpan(text: '• Length: '),
                  TextSpan(text: '\n     3 inches to 6 inches\n\n'),
                  TextSpan(text: '• Applications: '),
                  TextSpan(
                    text:
                        '\n     • Circuit testing\n     • Prototyping\n     • Connecting wires in temporary circuits\n     • Electrical repair work',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Pin Diagram',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Center(
              child: SizedBox(
                height: 220,
                width: screenWidth * 0.8,
                child: Image.asset(
                  'assets/8c.jpg',
                  // Pin diagram image
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.broken_image, size: 64, color: Colors.grey),
                        SizedBox(height: 8),
                        Text("Pin diagram not found"),
                      ],
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 8), // Spacing between images
            Center(
              child: SizedBox(
                height: 220,
                width: screenWidth * 0.7,
                child: Image.asset(
                  'assets/9c.jpg',
                  // Second image
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.broken_image, size: 64, color: Colors.grey),
                        SizedBox(height: 8),
                        Text("Pin diagram not found"),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BatteryConnectorsPage extends StatelessWidget {
  const BatteryConnectorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: const Text('Battery Connectors')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                height: 220,
                width: screenWidth * 0.8,
                child: Image.asset(
                  'assets/10c.jpg',
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.broken_image, size: 64, color: Colors.grey),
                        SizedBox(height: 8),
                        Text("Image not found"),
                      ],
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Battery connectors are used to establish an electrical connection between a battery and other components of a circuit. These connectors come in various forms, including clips, terminals, and plugs, designed to fit different battery types and sizes. They ensure safe and reliable power transfer from the battery to other devices or systems.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 24),
            const Text(
              'Specifications',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text.rich(
              TextSpan(
                style: TextStyle(fontSize: 16),
                children: [
                  TextSpan(text: '• Voltage rating: '),
                  TextSpan(text: '\n     Varies depending on battery type\n\n'),
                  TextSpan(text: '• Current rating: '),
                  TextSpan(
                    text: '\n     Varies from a few amps to over 100A\n\n',
                  ),
                  TextSpan(text: '• Materials: '),
                  TextSpan(text: '\n     Copper, aluminum, plastic, brass\n\n'),
                  TextSpan(text: '• Insulation: '),
                  TextSpan(text: '\n     Plastic or rubber-coated\n\n'),
                  TextSpan(text: '• Types: '),
                  TextSpan(
                    text:
                        '\n     • Battery terminal connectors\n     • Battery clips\n     • Battery plugs\n     • JST connectors',
                  ),
                  TextSpan(text: '• Applications: '),
                  TextSpan(
                    text:
                        '\n     • Connecting batteries to devices\n     • Power systems\n     • Electric vehicles\n     • Consumer electronics',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Pin Diagram',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Center(
              child: SizedBox(
                height: 220,
                width: screenWidth * 0.8,
                child: Image.asset(
                  'assets/11c.jpg',
                  // Pin diagram image
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.broken_image, size: 64, color: Colors.grey),
                        SizedBox(height: 8),
                        Text("Pin diagram not found"),
                      ],
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 8), // Spacing between images
            Center(
              child: SizedBox(
                height: 220,
                width: screenWidth * 0.7,
                child: Image.asset(
                  'assets/12c.jpg',
                  // Second image
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.broken_image, size: 64, color: Colors.grey),
                        SizedBox(height: 8),
                        Text("Pin diagram not found"),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CableConnectorsPage extends StatelessWidget {
  const CableConnectorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: const Text('Cable Connectors')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                height: 220,
                width: screenWidth * 0.8,
                child: Image.asset(
                  'assets/13c.jpg',
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.broken_image, size: 64, color: Colors.grey),
                        SizedBox(height: 8),
                        Text("Image not found"),
                      ],
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Description',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Battery connectors are used to establish an electrical connection between a battery and other components of a circuit. These connectors come in various forms, including clips, terminals, and plugs, designed to fit different battery types and sizes. They ensure safe and reliable power transfer from the battery to other devices or systems.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 24),
            const Text(
              'Specifications',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text.rich(
              TextSpan(
                style: TextStyle(fontSize: 16),
                children: [
                  TextSpan(text: '• Voltage rating: '),
                  TextSpan(text: '\n     Varies depending on battery type\n\n'),
                  TextSpan(text: '• Current rating: '),
                  TextSpan(
                    text: '\n     Varies from a few amps to over 100A\n\n',
                  ),
                  TextSpan(text: '• Materials: '),
                  TextSpan(text: '\n     Copper, aluminum, plastic, brass\n\n'),
                  TextSpan(text: '• Insulation: '),
                  TextSpan(text: '\n     Plastic or rubber-coated\n\n'),
                  TextSpan(text: '• Types: '),
                  TextSpan(
                    text:
                        '\n     • Battery terminal connectors\n     • Battery clips\n     • Battery plugs\n     • JST connectors',
                  ),
                  TextSpan(text: '• Applications: '),
                  TextSpan(
                    text:
                        '\n     • Connecting batteries to devices\n     • Power systems\n     • Electric vehicles\n     • Consumer electronics',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Pin Diagram',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Center(
              child: SizedBox(
                height: 220,
                width: screenWidth * 0.8,
                child: Image.asset(
                  'assets/14c.jpg',
                  // Pin diagram image
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.broken_image, size: 64, color: Colors.grey),
                        SizedBox(height: 8),
                        Text("Pin diagram not found"),
                      ],
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 8), // Spacing between images
            Center(
              child: SizedBox(
                height: 220,
                width: screenWidth * 0.7,
                child: Image.asset(
                  'assets/15c.jpg',
                  // Second image
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.broken_image, size: 64, color: Colors.grey),
                        SizedBox(height: 8),
                        Text("Pin diagram not found"),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EthernetConnectorsPage extends StatelessWidget {
  const EthernetConnectorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: const Text('Ethernet Connectors')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                height: 220,
                width: screenWidth * 0.8,
                child: Image.asset(
                  'assets/16c.jpg',
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.broken_image, size: 64, color: Colors.grey),
                        SizedBox(height: 8),
                        Text("Image not found"),
                      ],
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Description',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Ethernet connectors are used in networking applications for high-speed data transmission. These connectors are primarily used in computer networks to link devices like routers, switches, and computers. They come in various types, with the most common being RJ45 connectors, which are used for Ethernet cables in local area networks (LAN).',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 24),
            const Text(
              'Specifications',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text.rich(
              TextSpan(
                style: TextStyle(fontSize: 16),
                children: [
                  TextSpan(text: '• Voltage rating: '),
                  TextSpan(text: '\n     Typically 125V\n\n'),
                  TextSpan(text: '• Current rating: '),
                  TextSpan(text: '\n     Usually 1A\n\n'),
                  TextSpan(text: '• Cable type: '),
                  TextSpan(text: '\n     Twisted pair (Cat5, Cat6, Cat7)\n\n'),
                  TextSpan(text: '• Contacts: '),
                  TextSpan(text: '\n     8 pins (for RJ45)\n\n'),
                  TextSpan(text: '• Materials: '),
                  TextSpan(
                    text: '\n     Copper, plastic, and gold contacts\n\n',
                  ),
                  TextSpan(text: '• Types: '),
                  TextSpan(
                    text:
                        '\n     • RJ45 connectors\n     • RJ11 connectors (for telephone lines)\n     • Shielded Ethernet connectors\n',
                  ),
                  TextSpan(text: '• Applications: '),
                  TextSpan(
                    text:
                        '\n     • Local area networks (LAN)\n     • Computer networking\n     • Data transmission over Ethernet\n     • Office and home networking setups',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Pin Diagram',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Center(
              child: SizedBox(
                height: 220,
                width: screenWidth * 0.8,
                child: Image.asset(
                  'assets/17c.jpg',
                  // Pin diagram image
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.broken_image, size: 64, color: Colors.grey),
                        SizedBox(height: 8),
                        Text("Pin diagram not found"),
                      ],
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 8), // Spacing between images
            Center(
              child: SizedBox(
                height: 220,
                width: screenWidth * 0.7,
                child: Image.asset(
                  'assets/18c.jpg',
                  // Second image
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.broken_image, size: 64, color: Colors.grey),
                        SizedBox(height: 8),
                        Text("Pin diagram not found"),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FemaleHeadersPage extends StatelessWidget {
  const FemaleHeadersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: const Text('Female Headers')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                height: 220,
                width: screenWidth * 0.8,
                child: Image.asset(
                  'assets/19c.jpg',
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.broken_image, size: 64, color: Colors.grey),
                        SizedBox(height: 8),
                        Text("Image not found"),
                      ],
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Description',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Female headers are connectors used to interface with male pin headers or jumper wires in electronic circuits. They consist of rows of female pins that fit into male headers, allowing easy connection and disconnection of components. Female headers are commonly used in breadboards, development boards, and various other electronic prototypes.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 24),
            const Text(
              'Specifications',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text.rich(
              TextSpan(
                style: TextStyle(fontSize: 16),
                children: [
                  TextSpan(text: '• Voltage rating: '),
                  TextSpan(text: '\n     Typically 250V\n\n'),
                  TextSpan(text: '• Current rating: '),
                  TextSpan(text: '\n     Typically 1A\n\n'),
                  TextSpan(text: '• Pin count: '),
                  TextSpan(text: '\n     2 to 40 pins\n\n'),
                  TextSpan(text: '• Material: '),
                  TextSpan(text: '\n     Plastic housing with metal pins\n\n'),
                  TextSpan(text: '• Contact resistance: '),
                  TextSpan(text: '\n     Less than 10mΩ\n\n'),
                  TextSpan(text: '• Plating: '),
                  TextSpan(
                    text: '\n     Gold-plated or tin-plated contacts\n\n',
                  ),
                  TextSpan(text: '• Types: '),
                  TextSpan(
                    text:
                        '\n     • Single row\n     • Double row\n     • Right-angle connectors\n',
                  ),
                  TextSpan(text: '• Applications: '),
                  TextSpan(
                    text:
                        '\n     • Development boards\n     • Breadboards\n     • Jumper wire connections\n     • Custom circuit designs\n',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Pin Diagram',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Center(
              child: SizedBox(
                height: 220,
                width: screenWidth * 0.8,
                child: Image.asset(
                  'assets/20c.jpg',
                  // Pin diagram image
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.broken_image, size: 64, color: Colors.grey),
                        SizedBox(height: 8),
                        Text("Pin diagram not found"),
                      ],
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 8), // Spacing between images
            Center(
              child: SizedBox(
                height: 220,
                width: screenWidth * 0.7,
                child: Image.asset(
                  'assets/21c.jpg',
                  // Second image
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.broken_image, size: 64, color: Colors.grey),
                        SizedBox(height: 8),
                        Text("Pin diagram not found"),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ICSocketsPage extends StatelessWidget {
  const ICSocketsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: const Text('IC Sockets')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                height: 220,
                width: screenWidth * 0.8,
                child: Image.asset(
                  'assets/22c.jpg',
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.broken_image, size: 64, color: Colors.grey),
                        SizedBox(height: 8),
                        Text("Image not found"),
                      ],
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Description',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'IC sockets are used to mount integrated circuits (ICs) onto a circuit board without soldering the IC directly to the PCB. These sockets help in easy replacement or upgrading of ICs, ensuring the longevity and integrity of the board. They also provide convenience in testing and troubleshooting.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 24),
            const Text(
              'Specifications',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text.rich(
              TextSpan(
                style: TextStyle(fontSize: 16),
                children: [
                  TextSpan(text: '• Voltage rating: '),
                  TextSpan(text: '\n     Typically 25V to 100V\n\n'),
                  TextSpan(text: '• Current rating: '),
                  TextSpan(text: '\n     Typically 1A\n\n'),
                  TextSpan(text: '• Pin count: '),
                  TextSpan(text: '\n     8 to 40 pins\n\n'),
                  TextSpan(text: '• Material: '),
                  TextSpan(text: '\n     Plastic housing, metal contacts\n\n'),
                  TextSpan(text: '• Contact resistance: '),
                  TextSpan(text: '\n     Less than 10mΩ\n\n'),
                  TextSpan(text: '• Mounting style: '),
                  TextSpan(text: '\n     Through-hole or Surface-mount\n\n'),
                  TextSpan(text: '• Plating: '),
                  TextSpan(
                    text: '\n     Gold-plated or tin-plated contacts\n\n',
                  ),
                  TextSpan(text: '• Types: '),
                  TextSpan(
                    text:
                        '\n     • Single in-line (SIP)\n     • Dual in-line (DIP)\n     • Surface-mount IC sockets\n',
                  ),
                  TextSpan(text: '• Applications: '),
                  TextSpan(
                    text:
                        '\n     • IC replacement\n     • PCB assembly\n     • Prototype boards\n     • Testing and troubleshooting\n',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Pin Diagram',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Center(
              child: SizedBox(
                height: 220,
                width: screenWidth * 0.8,
                child: Image.asset(
                  'assets/23c.jpg',
                  // Pin diagram image
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.broken_image, size: 64, color: Colors.grey),
                        SizedBox(height: 8),
                        Text("Pin diagram not found"),
                      ],
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 8), // Spacing between images
            Center(
              child: SizedBox(
                height: 220,
                width: screenWidth * 0.7,
                child: Image.asset(
                  'assets/24c.jpg',
                  // Second image
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.broken_image, size: 64, color: Colors.grey),
                        SizedBox(height: 8),
                        Text("Pin diagram not found"),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IDCConnectorsPage extends StatelessWidget {
  const IDCConnectorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: const Text('IDC Connectors')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                height: 220,
                width: screenWidth * 0.8,
                child: Image.asset(
                  'assets/25c.jpg',
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.broken_image, size: 64, color: Colors.grey),
                        SizedBox(height: 8),
                        Text("Image not found"),
                      ],
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Description',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'IDC (Insulation Displacement Connector) connectors are used to terminate flat ribbon cables, allowing easy connection without stripping the wire. These connectors use a metal blade to pierce the insulation of the wire, creating an electrical connection. IDC connectors are commonly used in data transmission and power applications.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 24),
            const Text(
              'Specifications',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text.rich(
              TextSpan(
                style: TextStyle(fontSize: 16),
                children: [
                  TextSpan(text: '• Voltage rating: '),
                  TextSpan(text: '\n     Typically 250V to 500V\n\n'),
                  TextSpan(text: '• Current rating: '),
                  TextSpan(text: '\n     Typically 1A to 3A\n\n'),
                  TextSpan(text: '• Pitch: '),
                  TextSpan(text: '\n     1.27mm to 2.54mm\n\n'),
                  TextSpan(text: '• Contact resistance: '),
                  TextSpan(text: '\n     Less than 10mΩ\n\n'),
                  TextSpan(text: '• Insulation material: '),
                  TextSpan(text: '\n     UL 94V-0 rated plastic\n\n'),
                  TextSpan(text: '• Mounting style: '),
                  TextSpan(text: '\n     Through-hole, Surface-mount\n\n'),
                  TextSpan(text: '• Termination type: '),
                  TextSpan(text: '\n     IDC, soldered\n\n'),
                  TextSpan(text: '• Types: '),
                  TextSpan(
                    text:
                        '\n     • Male header\n     • Female header\n     • Shrouded IDC\n',
                  ),
                  TextSpan(text: '• Applications: '),
                  TextSpan(
                    text:
                        '\n     • Data and signal transmission\n     • Ribbon cable connections\n     • Printers, hard drives, and networking equipment\n',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Pin Diagram',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Center(
              child: SizedBox(
                height: 220,
                width: screenWidth * 0.8,
                child: Image.asset(
                  'assets/26c.jpg',
                  // Pin diagram image
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.broken_image, size: 64, color: Colors.grey),
                        SizedBox(height: 8),
                        Text("Pin diagram not found"),
                      ],
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 8), // Spacing between images
            Center(
              child: SizedBox(
                height: 220,
                width: screenWidth * 0.7,
                child: Image.asset(
                  'assets/27c.jpg',
                  // Second image
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.broken_image, size: 64, color: Colors.grey),
                        SizedBox(height: 8),
                        Text("Pin diagram not found"),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LightingConnectorsPage extends StatelessWidget {
  const LightingConnectorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: const Text('Lighting Connectors')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                height: 220,
                width: screenWidth * 0.8,
                child: Image.asset(
                  'assets/28c.jpg',
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.broken_image, size: 64, color: Colors.grey),
                        SizedBox(height: 8),
                        Text("Image not found"),
                      ],
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Description',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Lighting connectors are specialized connectors used in lighting applications. They are designed to handle the unique electrical demands of lighting circuits, including high voltage and high current. These connectors ensure safe and efficient connections in various lighting systems, such as residential, commercial, and automotive lighting.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 24),
            const Text(
              'Specifications',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text.rich(
              TextSpan(
                style: TextStyle(fontSize: 16),
                children: [
                  TextSpan(text: '• Voltage rating: '),
                  TextSpan(text: '\n     Typically 250V to 600V\n\n'),
                  TextSpan(text: '• Current rating: '),
                  TextSpan(text: '\n     Typically 10A to 20A\n\n'),
                  TextSpan(text: '• Contact resistance: '),
                  TextSpan(text: '\n     Less than 5mΩ\n\n'),
                  TextSpan(text: '• Insulation material: '),
                  TextSpan(text: '\n     UL 94V-0 rated plastic\n\n'),
                  TextSpan(text: '• Mounting style: '),
                  TextSpan(text: '\n     Through-hole, Surface-mount\n\n'),
                  TextSpan(text: '• Contact material: '),
                  TextSpan(text: '\n     Copper, Tin-plated\n\n'),
                  TextSpan(text: '• Terminal type: '),
                  TextSpan(text: '\n     Screw terminal, Push-fit, Crimp\n\n'),
                  TextSpan(text: '• Applications: '),
                  TextSpan(
                    text:
                        '\n     • Residential lighting\n     • Commercial lighting\n     • Automotive lighting\n     • Stage lighting\n',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Pin Diagram',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Center(
              child: SizedBox(
                height: 220,
                width: screenWidth * 0.8,
                child: Image.asset(
                  'assets/29c.jpg',
                  // Pin diagram image
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.broken_image, size: 64, color: Colors.grey),
                        SizedBox(height: 8),
                        Text("Pin diagram not found"),
                      ],
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 8), // Spacing between images
            Center(
              child: SizedBox(
                height: 220,
                width: screenWidth * 0.7,
                child: Image.asset(
                  'assets/30c.jpg',
                  // Second image
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.broken_image, size: 64, color: Colors.grey),
                        SizedBox(height: 8),
                        Text("Pin diagram not found"),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MezzanineConnectorsPage extends StatelessWidget {
  const MezzanineConnectorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: const Text('Mezzanine Connectors')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                height: 220,
                width: screenWidth * 0.8,
                child: Image.asset(
                  'assets/31c.jpg',
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.broken_image, size: 64, color: Colors.grey),
                        SizedBox(height: 8),
                        Text("Image not found"),
                      ],
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Description',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Mezzanine connectors are used to connect two different circuit boards in a vertical alignment, often in high-density applications. These connectors allow for both electrical and mechanical connections between the boards. They are typically used in servers, telecommunications equipment, and other applications where compact designs are necessary.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 24),
            const Text(
              'Specifications',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text.rich(
              TextSpan(
                style: TextStyle(fontSize: 16),
                children: [
                  TextSpan(text: '• Voltage rating: '),
                  TextSpan(text: '\n     Typically 250V to 500V\n\n'),
                  TextSpan(text: '• Current rating: '),
                  TextSpan(text: '\n     Typically 10A to 20A\n\n'),
                  TextSpan(text: '• Pitch: '),
                  TextSpan(text: '\n     Typically 0.5mm to 2mm\n\n'),
                  TextSpan(text: '• Insulation resistance: '),
                  TextSpan(text: '\n     Typically 1000MΩ\n\n'),
                  TextSpan(text: '• Temperature range: '),
                  TextSpan(text: '\n     -40°C to 85°C\n\n'),
                  TextSpan(text: '• Contact material: '),
                  TextSpan(text: '\n     Gold-plated contacts\n\n'),
                  TextSpan(text: '• Mounting style: '),
                  TextSpan(text: '\n     Through-hole, Surface-mount\n\n'),
                  TextSpan(text: '• Applications: '),
                  TextSpan(
                    text:
                        '\n     • Servers\n     • Telecommunications equipment\n     • Data storage devices\n     • Industrial controls\n',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Pin Diagram',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Center(
              child: SizedBox(
                height: 220,
                width: screenWidth * 0.8,
                child: Image.asset(
                  'assets/32c.jpg',
                  // Pin diagram image
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.broken_image, size: 64, color: Colors.grey),
                        SizedBox(height: 8),
                        Text("Pin diagram not found"),
                      ],
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 8), // Spacing between images
            Center(
              child: SizedBox(
                height: 220,
                width: screenWidth * 0.7,
                child: Image.asset(
                  'assets/33c.jpg',
                  // Second image
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.broken_image, size: 64, color: Colors.grey),
                        SizedBox(height: 8),
                        Text("Pin diagram not found"),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PinHeadersPage extends StatelessWidget {
  const PinHeadersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: const Text('Pin Headers')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                height: 220,
                width: screenWidth * 0.8,
                child: Image.asset(
                  'assets/34c.jpg',
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.broken_image, size: 64, color: Colors.grey),
                        SizedBox(height: 8),
                        Text("Image not found"),
                      ],
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Description',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Pin headers are used for making electrical connections between circuit boards and components. They typically consist of a row of pins arranged in a single line or multiple lines. Pin headers are often used for prototyping, such as in breadboards, and they allow for easy connectivity with jumper wires or female connectors.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 24),
            const Text(
              'Specifications',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text.rich(
              TextSpan(
                style: TextStyle(fontSize: 16),
                children: [
                  TextSpan(text: '• Voltage rating: '),
                  TextSpan(text: '\n     Typically 50V to 250V\n\n'),
                  TextSpan(text: '• Current rating: '),
                  TextSpan(text: '\n     Typically 1A to 3A\n\n'),
                  TextSpan(text: '• Pitch: '),
                  TextSpan(text: '\n     Typically 2.54mm\n\n'),
                  TextSpan(text: '• Number of pins: '),
                  TextSpan(text: '\n     Varies, commonly 2 to 40 pins\n\n'),
                  TextSpan(text: '• Contact material: '),
                  TextSpan(
                    text: '\n     Brass or copper with tin or gold plating\n\n',
                  ),
                  TextSpan(text: '• Insulation resistance: '),
                  TextSpan(text: '\n     Typically 1000MΩ\n\n'),
                  TextSpan(text: '• Temperature range: '),
                  TextSpan(text: '\n     -40°C to 105°C\n\n'),
                  TextSpan(text: '• Mounting style: '),
                  TextSpan(text: '\n     Through-hole, Surface-mount\n\n'),
                  TextSpan(text: '• Applications: '),
                  TextSpan(
                    text:
                        '\n     • Prototyping\n     • Breadboard connections\n     • PCB-to-PCB connections\n     • Microcontroller connections\n',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Pin Diagram',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Center(
              child: SizedBox(
                height: 220,
                width: screenWidth * 0.8,
                child: Image.asset(
                  'assets/35c.jpg',
                  // Pin diagram image
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.broken_image, size: 64, color: Colors.grey),
                        SizedBox(height: 8),
                        Text("Pin diagram not found"),
                      ],
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 8), // Spacing between images
            Center(
              child: SizedBox(
                height: 220,
                width: screenWidth * 0.7,
                child: Image.asset(
                  'assets/36c.jpg',
                  // Second image
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.broken_image, size: 64, color: Colors.grey),
                        SizedBox(height: 8),
                        Text("Pin diagram not found"),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PowerConnectorsPage extends StatelessWidget {
  const PowerConnectorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: const Text('Power Connectors')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                height: 220,
                width: screenWidth * 0.8,
                child: Image.asset(
                  'assets/37c.jpg',
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.broken_image, size: 64, color: Colors.grey),
                        SizedBox(height: 8),
                        Text("Image not found"),
                      ],
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Description',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Power connectors provide a secure electrical interface for delivering high or low voltage power. They are used in equipment ranging from PCs to industrial machinery. These connectors are designed to handle specific current and voltage levels safely. They include standardized types like Molex and ATX.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 24),
            const Text(
              'Specifications',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text.rich(
              TextSpan(
                style: TextStyle(fontSize: 16),
                children: [
                  TextSpan(text: '• Voltage rating: '),
                  TextSpan(text: '\n     Up to 600V\n\n'),
                  TextSpan(text: '• Current rating: '),
                  TextSpan(text: '\n     1-30A+\n\n'),
                  TextSpan(text: '• Contact resistance: '),
                  TextSpan(text: '\n     Low (<10 mΩ)\n\n'),
                  TextSpan(text: '• Types: '),
                  TextSpan(text: '\n     2-pin, 4-pin, locking, etc.\n\n'),
                  TextSpan(text: '• Applications: '),
                  TextSpan(
                    text:
                        '\n     • PC power supply connectors\n     • Industrial machine interfaces\n     • Modular power systems\n',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Pin Diagram',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Center(
              child: SizedBox(
                height: 220,
                width: screenWidth * 0.8,
                child: Image.asset(
                  'assets/38c.jpg',
                  // Pin diagram image
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.broken_image, size: 64, color: Colors.grey),
                        SizedBox(height: 8),
                        Text("Pin diagram not found"),
                      ],
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 8), // Spacing between images
            Center(
              child: SizedBox(
                height: 220,
                width: screenWidth * 0.7,
                child: Image.asset(
                  'assets/39c.jpg',
                  // Second image
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.broken_image, size: 64, color: Colors.grey),
                        SizedBox(height: 8),
                        Text("Pin diagram not found"),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ScrewTerminalPage extends StatelessWidget {
  const ScrewTerminalPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: const Text('Screw Terminal')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                height: 220,
                width: screenWidth * 0.8,
                child: Image.asset(
                  'assets/40c.jpg',
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.broken_image, size: 64, color: Colors.grey),
                        SizedBox(height: 8),
                        Text("Image not found"),
                      ],
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Description',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Screw terminals provide a robust mechanical and electrical connection by tightening a screw over a wire. They are widely used in power distribution and control panels. These connectors allow secure field wiring without specialized tools. Their reusability makes them ideal for test setups.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 24),
            const Text(
              'Specifications',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text.rich(
              TextSpan(
                style: TextStyle(fontSize: 16),
                children: [
                  TextSpan(text: '• Wire gauge: '),
                  TextSpan(text: '\n     22-10 AWG\n\n'),
                  TextSpan(text: '• Voltage rating: '),
                  TextSpan(text: '\n     250-600V\n\n'),
                  TextSpan(text: '• Current rating: '),
                  TextSpan(text: '\n     5-30A\n\n'),
                  TextSpan(text: '• Mounting: '),
                  TextSpan(text: '\n     PCB or DIN rail\n\n'),
                  TextSpan(text: '• Applications: '),
                  TextSpan(
                    text:
                        '\n     • Electrical panels and control boxes\n     • Power supplies and relays\n     • Industrial automation wiring\n',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Pin Diagram',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Center(
              child: SizedBox(
                height: 220,
                width: screenWidth * 0.8,
                child: Image.asset(
                  'assets/41c.jpg',
                  // Pin diagram image
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.broken_image, size: 64, color: Colors.grey),
                        SizedBox(height: 8),
                        Text("Pin diagram not found"),
                      ],
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 8), // Spacing between images
            Center(
              child: SizedBox(
                height: 220,
                width: screenWidth * 0.7,
                child: Image.asset(
                  'assets/42c.jpg',
                  // Second image
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.broken_image, size: 64, color: Colors.grey),
                        SizedBox(height: 8),
                        Text("Pin diagram not found"),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SimCardConnectorsPage extends StatelessWidget {
  const SimCardConnectorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: const Text('Sim Card Connectors')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                height: 220,
                width: screenWidth * 0.8,
                child: Image.asset(
                  'assets/43c.jpg',
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.broken_image, size: 64, color: Colors.grey),
                        SizedBox(height: 8),
                        Text("Image not found"),
                      ],
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Description',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'SIM card connectors provide the interface between a SIM card and a communication module. They ensure reliable electrical contact for data transmission. These connectors are compact and designed for repeated insertions. They are crucial in mobile and IoT devices.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 24),
            const Text(
              'Specifications',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text.rich(
              TextSpan(
                style: TextStyle(fontSize: 16),
                children: [
                  TextSpan(text: '• Card type: '),
                  TextSpan(text: '\n     Mini, micro, nano\n\n'),
                  TextSpan(text: '• Insertion cycles: '),
                  TextSpan(text: '\n     5,000-10,000\n\n'),
                  TextSpan(text: '• Contact count: '),
                  TextSpan(text: '\n     6 or 8\n\n'),
                  TextSpan(text: '• Mounting: '),
                  TextSpan(text: '\n     Push-pull, push-push, tray\n\n'),
                  TextSpan(text: '• Applications: '),
                  TextSpan(
                    text:
                        '\n     • Mobile phones\n     • GPS and GSM modules\n     • Embedded M2M devices\n',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Pin Diagram',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Center(
              child: SizedBox(
                height: 220,
                width: screenWidth * 0.8,
                child: Image.asset(
                  'assets/44c.jpg',
                  // Pin diagram image
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.broken_image, size: 64, color: Colors.grey),
                        SizedBox(height: 8),
                        Text("Pin diagram not found"),
                      ],
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 8), // Spacing between images
            Center(
              child: SizedBox(
                height: 220,
                width: screenWidth * 0.7,
                child: Image.asset(
                  'assets/45c.jpg',
                  // Second image
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.broken_image, size: 64, color: Colors.grey),
                        SizedBox(height: 8),
                        Text("Pin diagram not found"),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class USBConnectorsPage extends StatelessWidget {
  const USBConnectorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: const Text('USB Connectors')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                height: 220,
                width: screenWidth * 0.8,
                child: Image.asset(
                  'assets/46c.jpg',
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.broken_image, size: 64, color: Colors.grey),
                        SizedBox(height: 8),
                        Text("Image not found"),
                      ],
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Description',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'USB (Universal Serial Bus) connectors enable communication and power supply between devices. They are used in peripherals like keyboards, flash drives, and smartphones. USB has evolved through several versions, including USB 2.0, 3.0, and Type-C. These connectors support plug-and-play functionality.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 24),
            const Text(
              'Specifications',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text.rich(
              TextSpan(
                style: TextStyle(fontSize: 16),
                children: [
                  TextSpan(text: '• Versions: '),
                  TextSpan(text: '\n     USB 2.0, 3.0, 3.1, Type-C\n\n'),
                  TextSpan(text: '• Data rate: '),
                  TextSpan(text: '\n     Up to 10 Gbps (USB 3.1)\n\n'),
                  TextSpan(text: '• Power delivery: '),
                  TextSpan(text: '\n     Up to 100W (USB-C PD)\n\n'),
                  TextSpan(text: '• Compatibility: '),
                  TextSpan(text: '\n     Backward-compatible\n\n'),
                  TextSpan(text: '• Applications: '),
                  TextSpan(
                    text:
                        '\n     • Charging and data transfer for mobile devices\n     • Computer peripheral connections\n     • Audio and video transmission (via USB-C)\n',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Pin Diagram',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Center(
              child: SizedBox(
                height: 220,
                width: screenWidth * 0.8,
                child: Image.asset(
                  'assets/47c.jpg',
                  // Pin diagram image
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.broken_image, size: 64, color: Colors.grey),
                        SizedBox(height: 8),
                        Text("Pin diagram not found"),
                      ],
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 8), // Spacing between images
            Center(
              child: SizedBox(
                height: 220,
                width: screenWidth * 0.7,
                child: Image.asset(
                  'assets/48c.jpg',
                  // Second image
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.broken_image, size: 64, color: Colors.grey),
                        SizedBox(height: 8),
                        Text("Pin diagram not found"),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
