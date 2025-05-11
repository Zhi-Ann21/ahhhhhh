import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: AnalogdetailPage(),
    ),
  );
}

class AnalogdetailPage extends StatelessWidget {
  final List<String> analogicsItems = [
    'Analog To Digital Converter',
    'Digital Potentiometers',
    'Digital To Analog Converter',
    'Direct Digital Synthesis',
    'PMIC- Current Regulation',
    'Touch Screen Controllers',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Analog Ics")),
      body: ListView.builder(
        itemCount: analogicsItems.length,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              title: Text(analogicsItems[index]),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => _getAnalogPage(analogicsItems[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _getAnalogPage(String name) {
    switch (name) {
      case 'Analog To Digital Converter':
        return AnalogToDigitalConverterPage();
      case 'Digital Potentiometers':
        return DigitalPotentiometersPage();
      case 'Digital To Analog Converter':
        return DigitalToAnalogConverterPage();
      case 'Direct Digital Synthesis':
        return DirectDigitalSynthesisPage();
      case 'PMIC- Current Regulation':
        return PMICCurrentRegulationPage();
      case 'Touch Screen Controllers':
        return TouchScreenControllersPage();
      default:
        return IndividualAnalogPage(
          title: name,
          description: 'No description available.',
          imagePath: 'assets/Analog/default.png',
        );
    }
  }
}

class IndividualAnalogPage extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const IndividualAnalogPage({
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

class AnalogToDigitalConverterPage extends StatelessWidget {
  const AnalogToDigitalConverterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: const Text('Analog To Digital Converter')),
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
                  'assets/86.jpg',
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
              'An Analog to Digital Converter (ADC) is an electronic component that converts continuous analog signals (like voltage or sound) into digital binary values that can be processed by microcontrollers, computers, or digital systems.',
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
                  TextSpan(text: '• Resolution: '),
                  TextSpan(
                    text:
                        '\n     8-bit, 10-bit, 12-bit, 16-bit, 24-bit (determines accuracy)\n\n',
                  ),
                  TextSpan(text: '• Input Voltage Range: '),
                  TextSpan(text: '\n     Typically 0-5 V or ±10 V)\n\n'),
                  TextSpan(text: '• Conversion Time: '),
                  TextSpan(text: '\n     From nanoseconds to microseconds\n\n'),
                  TextSpan(text: '• Power Supply: '),
                  TextSpan(text: '\n     3.3 V or 5 V)\n\n'),
                  TextSpan(text: '• Applications: '),
                  TextSpan(
                    text:
                        '\n     •Digital audio recording and processing\n     •Data acquisition systems\n     •Temperature and pressure sensor interfacing\n     •Oscilloscopes and digital multimeters\n     •Medical instruments like ECG machines',
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
                  'assets/87.jpg',
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
                  'assets/88.jpg',
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

class DigitalPotentiometersPage extends StatelessWidget {
  const DigitalPotentiometersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: const Text('Digital Potentiometers')),
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
                  'assets/89.jpg',
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
              'Digital potentiometers (or digipots) are electronically controlled resistors that emulate the function of traditional mechanical potentiometers. They use digital signals—typically from a microcontroller—to adjust resistance levels, allowing precise and repeatable control without physical movement.',
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
                  TextSpan(text: '• Resolution: '),
                  TextSpan(
                    text:
                        '\n     6-bit to 10-bit (typically 64 to 1024 steps)\n\n',
                  ),
                  TextSpan(text: '• Input Voltage Range: '),
                  TextSpan(
                    text:
                        '\n     0 V to 5 V (some support up to ±15 V depending on model)\n\n',
                  ),
                  TextSpan(text: '• Conversion Time: '),
                  TextSpan(
                    text:
                        '\n     1 µs to 10 µs (depending on the interface and model)\n\n',
                  ),
                  TextSpan(text: '• Power Supply: '),
                  TextSpan(
                    text:
                        '\n     2.7 V to 5.5 V (typical), some support dual supplies for bipolar operation\n\n',
                  ),
                  TextSpan(text: '• Applications: '),
                  TextSpan(
                    text:
                        '\n     •Volume control in audio devices\n     •Adjustable gain amplifiers\n     •Calibration and trimming in analog circuits\n     •Sensor sensitivity tuning\n     •DAC/ADC reference voltage adjustment\n     •Programmable filters and oscillators',
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
                  'assets/90.jpg',
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
                  'assets/91.jpg',
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

class DigitalToAnalogConverterPage extends StatelessWidget {
  const DigitalToAnalogConverterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: const Text('Digital To Analog Converter')),
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
                  'assets/92.jpg',
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
              'A Digital-to-Analog Converter (DAC) is an electronic device that converts digital binary values (usually from a microcontroller or digital system) into a continuous analog voltage or current. It is essential in systems where digital signals need to interact with the analog world, such as in audio, video, and instrumentation.',
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
                  TextSpan(text: '• Resolution: '),
                  TextSpan(
                    text:
                        '\n     8-bit to 20-bit (higher bit = more precision)\n\n',
                  ),
                  TextSpan(text: '• Input Voltage Range: '),
                  TextSpan(
                    text:
                        '\n     Typically 0 V to (e.g., 0 V to 3.3 V or 0 V to 5 V)\n\n',
                  ),
                  TextSpan(text: '• Conversion Time: '),
                  TextSpan(
                    text:
                        '\n     From a few nanoseconds (high-speed DACs) to microseconds\n\n',
                  ),
                  TextSpan(text: '• Power Supply: '),
                  TextSpan(
                    text:
                        '\n     Commonly 3.3 V or 5 V (single supply), some require dual ±15 V for high-performance DACs\n\n',
                  ),
                  TextSpan(text: '• Applications: '),
                  TextSpan(
                    text:
                        '\n     •Audio signal generation (e.g., music playback)\n     •Video signal processing\n     •Analog control in industrial systems\n     •Function generators and waveform synthesis\n     •Digital signal processing (DSP) output',
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
                  'assets/93.jpg',
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
                  'assets/94.jpg',
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

class DirectDigitalSynthesisPage extends StatelessWidget {
  const DirectDigitalSynthesisPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: const Text('Direct Digital Synthesis')),
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
                  'assets/95.jpg',
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
              'Direct Digital Synthesis is a method of generating precise, high-resolution analog waveforms (typically sine, square, or triangle) using digital data processing. It relies on a digital accumulator, a waveform lookup table (usually ROM), and a DAC (Digital-to-Analog Converter) to produce the desired frequency and waveform shape.',
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
                  TextSpan(text: '• Resolution: '),
                  TextSpan(
                    text: '\n     Typically 10-bit to 16-bit or higher \n\n',
                  ),
                  TextSpan(text: '• Input Voltage Range: '),
                  TextSpan(
                    text:
                        '\n     Depends on DAC stage; usually 0 V to 3.3 V or 0 V to 5 V for logic-level inputs\n\n',
                  ),
                  TextSpan(text: '• Conversion Time: '),
                  TextSpan(
                    text: '\n     Sub-microsecond to a few nanoseconds\n\n',
                  ),
                  TextSpan(text: '• Power Supply: '),
                  TextSpan(text: '\n     Typically 3.3 V or 5 V\n\n'),
                  TextSpan(text: '• Applications: '),
                  TextSpan(
                    text:
                        '\n     •Signal generators\n     •Function/arbitrary waveform generators\n     •Frequency synthesizers in communication systems\n     •Audio signal modulation\n     •Radar and sonar systems',
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
                  'assets/96.jpg',
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
                  'assets/97.jpg',
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

class PMICCurrentRegulationPage extends StatelessWidget {
  const PMICCurrentRegulationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: const Text('PMIC- Current Regulation')),
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
                  'assets/98.jpg',
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
              'Power Management Integrated Circuits (PMICs) with current regulation are specialized ICs designed to manage and control the flow of electrical current in electronic systems. They ensure precise current levels are delivered to components, protecting them from overcurrent conditions and enhancing efficiency in power-sensitive designs.',
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
                  TextSpan(text: '• Resolution: '),
                  TextSpan(
                    text:
                        '\n     8-bit to 20-bit (higher bit = more precision)\n\n',
                  ),
                  TextSpan(text: '• Input Voltage Range: '),
                  TextSpan(
                    text:
                        '\n     Typically 0 V to (e.g., 0 V to 3.3 V or 0 V to 5 V)\n\n',
                  ),
                  TextSpan(text: '• Conversion Time: '),
                  TextSpan(
                    text:
                        '\n     From a few nanoseconds (high-speed DACs) to microseconds\n\n',
                  ),
                  TextSpan(text: '• Power Supply: '),
                  TextSpan(
                    text:
                        '\n     Commonly 3.3 V or 5 V (single supply), some require dual ±15 V for high-performance DACs\n\n',
                  ),
                  TextSpan(text: '• Applications: '),
                  TextSpan(
                    text:
                        '\n     •Battery-powered devices (smartphones, tablets)\n     •LED drivers with constant current control\n     •Motor control systems\n     •Power supplies for precision analog or RF circuits\n     •Wearables and IoT devices requiring power optimization',
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
                  'assets/99.jpg',
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
                  'assets/100.jpg',
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

class TouchScreenControllersPage extends StatelessWidget {
  const TouchScreenControllersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: const Text('Touch Screen Controllers')),
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
                  'assets/101.jpg',
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
              'Touch screen controllers are integrated circuits (ICs) that interpret signals from touch-sensitive surfaces (like resistive or capacitive screens) and convert them into digital data that can be read by a microcontroller or processor. They detect touch position, pressure, and sometimes gestures.',
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
                  TextSpan(text: '• Resolution: '),
                  TextSpan(
                    text:
                        '\n     Typically 10-bit to 12-bit (1024 to 4096 levels per axis)\n\n',
                  ),
                  TextSpan(text: '• Input Voltage Range: '),
                  TextSpan(
                    text: '\n     0 V to 5 V (depending on sensor type)\n\n',
                  ),
                  TextSpan(text: '• Conversion Time: '),
                  TextSpan(
                    text: '\n     5 µs to 50 µs per coordinate (X or Y)\n\n',
                  ),
                  TextSpan(text: '• Power Supply: '),
                  TextSpan(
                    text: '\n     1.8 V to 5.5 V (depends on model)\n\n',
                  ),
                  TextSpan(text: '• Applications: '),
                  TextSpan(
                    text:
                        '\n     •Smartphones and tablets\n     •Industrial control panels\n     •Automotive infotainment systems\n     •Handheld devices and POS terminals\n     •Smart appliances and kiosks',
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
                  'assets/102.jpg',
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
                  'assets/103.jpg',
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
