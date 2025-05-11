import 'package:electrolex/clocktiming.dart';
import 'package:electrolex/displays.dart';
import 'package:electrolex/embedded.dart';
import 'package:electrolex/filters.dart';
import 'package:electrolex/functional.dart';
import 'package:electrolex/inductor.dart';
import 'package:electrolex/interface.dart';
import 'package:electrolex/logic.dart';
import 'package:electrolex/memory.dart';
import 'package:electrolex/micromotors.dart';
import 'package:electrolex/oscillators.dart';
import 'package:flutter/material.dart';
import 'resistordetail.dart';
import 'componentdetail.dart';
import 'diodes.dart';
import 'analogicsdetail.dart';
import 'connectors.dart';
import 'capacitordetail.dart';
import 'sensors.dart';
import 'onboarding_screen.dart';
import 'amplifiersdetail.dart';
import 'fuses.dart';
import 'ledsdetail.dart';
import 'transistordetail.dart';
import 'switches.dart';

void main() {
  runApp(ElectroLexApp());
}

final ValueNotifier<bool> isDarkMode = ValueNotifier(false);

class ElectroLexApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isDarkMode,
      builder: (context, darkMode, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'ElectroLex',
          theme: ThemeData(
            brightness: Brightness.light,
            scaffoldBackgroundColor: Color(0xFFEAF4FF),
            primarySwatch: Colors.blue,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            scaffoldBackgroundColor: Colors.grey[900],
            primarySwatch: Colors.blue,
          ),
          themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
          initialRoute: '/onboarding',
          routes: {
            '/home': (context) => ElectroLexHome(),
            '/onboarding': (context) => OnboardingScreen(),
          },
        );
      },
    );
  }
}

class ElectroLexHome extends StatefulWidget {
  @override
  State<ElectroLexHome> createState() => _ElectroLexHomeState();
}

class _ElectroLexHomeState extends State<ElectroLexHome> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  final List<Map<String, dynamic>> categories = [
    {
      'title': 'Analog ICs',
      'icon': Icons.electrical_services,
      'color': Colors.blue,
    },
    {'title': 'Resistors', 'icon': Icons.linear_scale, 'color': Colors.orange},
    {
      'title': 'Capacitors',
      'icon': Icons.battery_charging_full,
      'color': Colors.green,
    },
    {'title': 'Diodes', 'icon': Icons.flash_on, 'color': Colors.red},
    {'title': 'Transistors', 'icon': Icons.toggle_on, 'color': Colors.purple},
    {'title': 'LEDs', 'icon': Icons.lightbulb, 'color': Colors.amber},
    {'title': 'Sensors', 'icon': Icons.sensors, 'color': Colors.teal},
    {'title': 'Amplifiers', 'icon': Icons.volume_up, 'color': Colors.blue},
    {'title': 'Switches', 'icon': Icons.toggle_on, 'color': Colors.lightBlue},
    {'title': 'Fuses', 'icon': Icons.power_off, 'color': Colors.redAccent},
    {'title': 'Connectors', 'icon': Icons.usb, 'color': Colors.teal},

    {'title': 'Others', 'icon': Icons.more_horiz, 'color': Colors.grey},
  ];

  final List<Map<String, dynamic>> othersComponents = [
    {'title': 'Micromotors', 'icon': Icons.headphones, 'color': Colors.pink},
    {
      'title': 'Clock and Timing',
      'icon': Icons.access_time,
      'color': Colors.indigo,
    },
    {
      'title': '  Oscillators ',
      'icon': Icons.auto_awesome,
      'color': Colors.green,
    },
    {
      'title': '  Development\n    Tools',
      'icon': Icons.developer_board,
      'color': Colors.purple,
    },
    {
      'title': 'Display Drivers',
      'icon': Icons.display_settings,
      'color': Colors.cyan,
    },
    {
      'title': '  Embedded\n  Controllers',
      'icon': Icons.control_camera,
      'color': Colors.amber,
    },
    {
      'title': '  Filters\n Optimization',
      'icon': Icons.tune,
      'color': Colors.green,
    },
    {
      'title': '  Functional\n  Modules',
      'icon': Icons.extension,
      'color': Colors.lime,
    },
    {'title': 'Inductors', 'icon': Icons.all_inclusive, 'color': Colors.indigo},
    {
      'title': 'Interface ICs',
      'icon': Icons.input,
      'color': Colors.purpleAccent,
    },
    {
      'title': 'IoT\n   Communication',
      'icon': Icons.wifi,
      'color': Colors.tealAccent,
    },
    {'title': 'Logic ICs', 'icon': Icons.memory, 'color': Colors.blueAccent},
    {'title': 'Memory', 'icon': Icons.sd_storage, 'color': Colors.orangeAccent},
    {'title': 'Rf & Radio', 'icon': Icons.radio, 'color': Colors.red},
  ];

  List<Map<String, dynamic>> get allComponents => [
    ...categories,
    ...othersComponents,
    ...subcomponents,
  ];

  final List<Map<String, dynamic>> subcomponents = [
    {
      'title': 'Carbon Film Resistor',
      'category': 'Resistors',
      'icon': Icons.linear_scale,
      'color': Colors.orange,
    },
    {
      'title': 'Current Sense Resistor',
      'category': 'Resistors',
      'icon': Icons.linear_scale,
      'color': Colors.orange,
    },
    {
      'title': 'High Voltage Resistor',
      'category': 'Resistors',
      'icon': Icons.linear_scale,
      'color': Colors.orange,
    },
    {
      'title': 'LED Strip Resistor',
      'category': 'Resistors',
      'icon': Icons.linear_scale,
      'color': Colors.orange,
    },
    {
      'title': 'Metal Glaze Resistor',
      'category': 'Resistors',
      'icon': Icons.linear_scale,
      'color': Colors.orange,
    },
    {
      'title': 'Metal Oxide Resistor',
      'category': 'Resistors',
      'icon': Icons.linear_scale,
      'color': Colors.orange,
    },
    {
      'title': 'Potentiometers Resistor',
      'category': 'Resistors',
      'icon': Icons.linear_scale,
      'color': Colors.orange,
    },
    {
      'title': 'Network & Arrays Resistor',
      'category': 'Resistors',
      'icon': Icons.linear_scale,
      'color': Colors.orange,
    },
    {
      'title': 'Variable Resistor',
      'category': 'Resistors',
      'icon': Icons.linear_scale,
      'color': Colors.orange,
    },
    {
      'title': 'Buzzers',
      'category': 'Micromotors',
      'icon': Icons.headphones,
      'color': Colors.pink,
    },
    {
      'title': 'MEMS Microphones',
      'category': 'Micromotors',
      'icon': Icons.headphones,
      'color': Colors.pink,
    },
    {
      'title': 'Micro Motor',
      'category': 'Micromotors',
      'icon': Icons.headphones,
      'color': Colors.pink,
    },
    {
      'title': 'Speakers',
      'category': 'Micromotors',
      'icon': Icons.headphones,
      'color': Colors.pink,
    },
    {
      'title': 'Ceramic Resonators',
      'category': 'Oscillators',
      'icon': Icons.auto_awesome,
      'color': Colors.green,
    },
    {
      'title': 'Crystals',
      'category': 'Oscillators',
      'icon': Icons.auto_awesome,
      'color': Colors.green,
    },
    {
      'title': 'Oven Controlled\n     Crystal',
      'category': 'Oscillators',
      'icon': Icons.auto_awesome,
      'color': Colors.green,
    },
    {
      'title': 'Radial Cylinder\n     Crystals',
      'category': 'Oscillators',
      'icon': Icons.auto_awesome,
      'color': Colors.green,
    },
    {
      'title': 'SAW Resonators',
      'category': 'Oscillators',
      'icon': Icons.auto_awesome,
      'color': Colors.green,
    },
    {
      'title': 'Clock Buffers',
      'category': 'Clock and Timing',
      'icon': Icons.access_time,
      'color': Colors.indigo,
    },
    {
      'title': 'Clock Generators',
      'category': 'Clock and Timing',
      'icon': Icons.access_time,
      'color': Colors.indigo,
    },
    {
      'title': 'Timing Application',
      'category': 'Clock and Timing',
      'icon': Icons.access_time,
      'color': Colors.indigo,
    },
    {
      'title': 'Driver Current',
      'category': 'Clock and Timing',
      'icon': Icons.access_time,
      'color': Colors.indigo,
    },
    {
      'title': 'Microprocessor',
      'category': 'Clock and Timing',
      'icon': Icons.access_time,
      'color': Colors.indigo,
    },
    {
      'title': 'Real Time Clocks',
      'category': 'Clock and Timing',
      'icon': Icons.access_time,
      'color': Colors.indigo,
    },
    {
      'title': 'Driver ICs',
      'category': 'Display Drivers',
      'icon': Icons.display_settings,
      'color': Colors.cyan,
    },
    {
      'title': 'LCD Displays Modules',
      'category': 'Display Drivers',
      'icon': Icons.display_settings,
      'color': Colors.cyan,
    },
    {
      'title': 'LED Displays Drivers',
      'category': 'Display Drivers',
      'icon': Icons.display_settings,
      'color': Colors.cyan,
    },
    {
      'title': 'LED Segment Display',
      'category': 'Display Drivers',
      'icon': Icons.display_settings,
      'color': Colors.cyan,
    },
    {
      'title': 'MOS Drivers',
      'category': 'Display Drivers',
      'icon': Icons.display_settings,
      'color': Colors.cyan,
    },
    {
      'title': 'OLED Displays Modules',
      'category': 'Display Drivers',
      'icon': Icons.display_settings,
      'color': Colors.cyan,
    },
    {
      'title': 'VFD Display Drivers',
      'category': 'Display Drivers',
      'icon': Icons.display_settings,
      'color': Colors.cyan,
    },
    {
      'title': 'ARTERY Mcu',
      'category': 'Embedded\n  Controllers',
      'icon': Icons.control_camera,
      'color': Colors.amber,
    },
    {
      'title': 'Cmsemicon',
      'category': 'Embedded\n  Controllers',
      'icon': Icons.control_camera,
      'color': Colors.amber,
    },
    {
      'title': 'Cypress',
      'category': 'Embedded\n  Controllers',
      'icon': Icons.control_camera,
      'color': Colors.amber,
    },
    {
      'title': 'EastSoft',
      'category': 'Embedded\n  Controllers',
      'icon': Icons.control_camera,
      'color': Colors.amber,
    },
    {
      'title': 'GigaDevice',
      'category': 'Embedded\n  Controllers',
      'icon': Icons.control_camera,
      'color': Colors.amber,
    },
    {
      'title': 'Hitrendtech',
      'category': 'Embedded\n  Controllers',
      'icon': Icons.control_camera,
      'color': Colors.amber,
    },
    {
      'title': 'Holtek',
      'category': 'Embedded\n  Controllers',
      'icon': Icons.control_camera,
      'color': Colors.amber,
    },
    {
      'title': 'Microchip',
      'category': 'Embedded\n  Controllers',
      'icon': Icons.control_camera,
      'color': Colors.amber,
    },
    {
      'title': 'Silicon Labs',
      'category': 'Embedded\n  Controllers',
      'icon': Icons.control_camera,
      'color': Colors.amber,
    },
    {
      'title': 'Renesas',
      'category': 'Embedded\n  Controllers',
      'icon': Icons.control_camera,
      'color': Colors.amber,
    },
    {
      'title': 'Active Filters',
      'category': 'Filters\n Optimization',
      'icon': Icons.tune,
      'color': Colors.green,
    },
    {
      'title': 'Ceramic Filters',
      'category': 'Filters\n Optimization',
      'icon': Icons.tune,
      'color': Colors.green,
    },
    {
      'title': 'Common Mode Filters',
      'category': 'Filters\n Optimization',
      'icon': Icons.tune,
      'color': Colors.green,
    },
    {
      'title': 'EMC Filters',
      'category': 'Filters\n Optimization',
      'icon': Icons.tune,
      'color': Colors.green,
    },
    {
      'title': 'Ferrite Beads',
      'category': 'Filters\n Optimization',
      'icon': Icons.tune,
      'color': Colors.green,
    },
    {
      'title': 'SAW Filters',
      'category': 'Filters\n Optimization',
      'icon': Icons.tune,
      'color': Colors.green,
    },
    {
      'title': 'Sensor Modules',
      'category': 'Functional\n  Modules',
      'icon': Icons.extension,
      'color': Colors.lime,
    },
    {
      'title': 'V-Audio Modules',
      'category': 'Functional\n  Modules',
      'icon': Icons.extension,
      'color': Colors.lime,
    },
    {
      'title': 'Ajustable Inductors',
      'category': 'Inductors',
      'icon': Icons.all_inclusive,
      'color': Colors.indigo,
    },
    {
      'title': 'Current Transformers',
      'category': 'Inductors',
      'icon': Icons.all_inclusive,
      'color': Colors.indigo,
    },
    {
      'title': 'Power Inductors',
      'category': 'Inductors',
      'icon': Icons.all_inclusive,
      'color': Colors.indigo,
    },
    {
      'title': 'Power Transformer',
      'category': 'Inductors',
      'icon': Icons.all_inclusive,
      'color': Colors.indigo,
    },
    {
      'title': 'Through Hole Inductors',
      'category': 'Inductors',
      'icon': Icons.all_inclusive,
      'color': Colors.indigo,
    },
    {
      'title': 'CAN ICs',
      'category': 'Interface ICs',
      'icon': Icons.input,
      'color': Colors.purpleAccent,
    },
    {
      'title': 'Digital Isolators',
      'category': 'Interface ICs',
      'icon': Icons.input,
      'color': Colors.purpleAccent,
    },
    {
      'title': 'Interface Controllers',
      'category': 'Interface ICs',
      'icon': Icons.input,
      'color': Colors.purpleAccent,
    },
    {
      'title': 'LIN Transceivers',
      'category': 'Interface ICs',
      'icon': Icons.input,
      'color': Colors.purpleAccent,
    },
    {
      'title': 'Sensor Interface ICs',
      'category': 'Interface ICs',
      'icon': Icons.input,
      'color': Colors.purpleAccent,
    },
    {
      'title': 'Serial Interface ICs',
      'category': 'Interface ICs',
      'icon': Icons.input,
      'color': Colors.purpleAccent,
    },
    {
      'title': 'Serial Interface ICs',
      'category': 'Interface ICs',
      'icon': Icons.input,
      'color': Colors.purpleAccent,
    },
    {
      'title': '4000 Series',
      'category': 'Logic ICs',
      'icon': Icons.memory,
      'color': Colors.blueAccent,
    },
    {
      'title': '74 Series',
      'category': 'Logic ICs',
      'icon': Icons.memory,
      'color': Colors.blueAccent,
    },
    {
      'title': 'Codec ICs',
      'category': 'Logic ICs',
      'icon': Icons.memory,
      'color': Colors.blueAccent,
    },
    {
      'title': 'Flip Flops',
      'category': 'Logic ICs',
      'icon': Icons.memory,
      'color': Colors.blueAccent,
    },
    {
      'title': 'Gates',
      'category': 'Logic ICs',
      'icon': Icons.memory,
      'color': Colors.blueAccent,
    },
    {
      'title': 'Latches',
      'category': 'Logic ICs',
      'icon': Icons.memory,
      'color': Colors.blueAccent,
    },
    {
      'title': 'Multivibrators',
      'category': 'Logic ICs',
      'icon': Icons.memory,
      'color': Colors.blueAccent,
    },
    {
      'title': 'Registers',
      'category': 'Logic ICs',
      'icon': Icons.memory,
      'color': Colors.blueAccent,
    },
    {
      'title': 'Timer',
      'category': 'Logic ICs',
      'icon': Icons.memory,
      'color': Colors.blueAccent,
    },
    {
      'title': 'Translators',
      'category': 'Logic ICs',
      'icon': Icons.memory,
      'color': Colors.blueAccent,
    },
    {
      'title': 'Universal Bus Function',
      'category': 'Logic ICs',
      'icon': Icons.memory,
      'color': Colors.blueAccent,
    },
    {
      'title': 'DRAM',
      'category': 'Memory',
      'icon': Icons.sd_storage,
      'color': Colors.orangeAccent,
    },
    {
      'title': 'EEPROM',
      'category': 'Memory',
      'icon': Icons.sd_storage,
      'color': Colors.orangeAccent,
    },
    {
      'title': 'Font Chips',
      'category': 'Memory',
      'icon': Icons.sd_storage,
      'color': Colors.orangeAccent,
    },
    {
      'title': 'FRAM',
      'category': 'Memory',
      'icon': Icons.sd_storage,
      'color': Colors.orangeAccent,
    },
    {
      'title': 'NAND FLASH',
      'category': 'Memory',
      'icon': Icons.sd_storage,
      'color': Colors.orangeAccent,
    },
    {
      'title': 'NOR FLASH',
      'category': 'Memory',
      'icon': Icons.sd_storage,
      'color': Colors.orangeAccent,
    },
    {
      'title': 'SDRAM',
      'category': 'Memory',
      'icon': Icons.sd_storage,
      'color': Colors.orangeAccent,
    },
    {
      'title': 'SRAM',
      'category': 'Memory',
      'icon': Icons.sd_storage,
      'color': Colors.orangeAccent,
    },
    {
      'title': 'Analog To Digital\n    Converter',
      'category': 'Analog Ics',
      'icon': Icons.electrical_services,
      'color': Colors.blue,
    },
    {
      'title': 'Digital Potentiometers',
      'category': 'Analog Ics',
      'icon': Icons.electrical_services,
      'color': Colors.blue,
    },
    {
      'title': 'Digital To Analog\n    Converter',
      'category': 'Analog Ics',
      'icon': Icons.electrical_services,
      'color': Colors.blue,
    },
    {
      'title': 'Direct Digital Synthesis',
      'category': 'Analog Ics',
      'icon': Icons.electrical_services,
      'color': Colors.blue,
    },
    {
      'title': 'PMIC- Current Regulation',
      'category': 'Analog Ics',
      'icon': Icons.electrical_services,
      'color': Colors.blue,
    },
    {
      'title': 'Touch Screen Controllers',
      'category': 'Analog Ics',
      'icon': Icons.electrical_services,
      'color': Colors.blue,
    },
    {
      'title': 'Aluminum Electrolytic\n      Capacitors',
      'category': 'Capacitors',
      'icon': Icons.battery_charging_full,
      'color': Colors.green,
    },
    {
      'title': 'Networks, Arrays\n    Capacitors',
      'category': 'Capacitors',
      'icon': Icons.battery_charging_full,
      'color': Colors.green,
    },
    {
      'title': 'Ceramic Disc Capacitors',
      'category': 'Capacitors',
      'icon': Icons.battery_charging_full,
      'color': Colors.green,
    },
    {
      'title': 'Film Capacitors',
      'category': 'Capacitors',
      'icon': Icons.battery_charging_full,
      'color': Colors.green,
    },
    {
      'title': 'High Voltage Capacitors',
      'category': 'Capacitors',
      'icon': Icons.battery_charging_full,
      'color': Colors.green,
    },
    {
      'title': 'Horn-Type Electrolytic\n      Capacitors',
      'category': 'Capacitors',
      'icon': Icons.battery_charging_full,
      'color': Colors.green,
    },
    {
      'title': 'Metallized Polyester Film\n      Capacitors',
      'category': 'Capacitors',
      'icon': Icons.battery_charging_full,
      'color': Colors.green,
    },
    {
      'title': 'Niobium Oxide\n    Capacitors',
      'category': 'Capacitors',
      'icon': Icons.battery_charging_full,
      'color': Colors.green,
    },
    {
      'title': 'Paper Dielectric\n    Capacitors',
      'category': 'Capacitors',
      'icon': Icons.battery_charging_full,
      'color': Colors.green,
    },
    {
      'title': 'Polypropylene Film\n     Capacitors',
      'category': 'Capacitors',
      'icon': Icons.battery_charging_full,
      'color': Colors.green,
    },
    {
      'title': 'Suppression Capacitors',
      'category': 'Capacitors',
      'icon': Icons.battery_charging_full,
      'color': Colors.green,
    },
    {
      'title': 'Tantalum Capacitors',
      'category': 'Capacitors',
      'icon': Icons.battery_charging_full,
      'color': Colors.green,
    },
    {
      'title': 'Trimmers, Variable\n    Capacitors',
      'category': 'Capacitors',
      'icon': Icons.battery_charging_full,
      'color': Colors.green,
    },
    {
      'title': 'Avalanche Diodes',
      'category': 'Diodes',
      'icon': Icons.flash_on,
      'color': Colors.red,
    },
    {
      'title': 'Bridge Rectifiers',
      'category': 'Diodes',
      'icon': Icons.flash_on,
      'color': Colors.red,
    },
    {
      'title': 'Diacs Trigger Diodes',
      'category': 'Diodes',
      'icon': Icons.flash_on,
      'color': Colors.red,
    },
    {
      'title': 'Variable Capacitance Diodes',
      'category': 'Diodes',
      'icon': Icons.flash_on,
      'color': Colors.red,
    },
    {
      'title': 'Discharge Tubes',
      'category': 'Diodes',
      'icon': Icons.flash_on,
      'color': Colors.red,
    },
    {
      'title': 'High Effic Rectifier',
      'category': 'Diodes',
      'icon': Icons.flash_on,
      'color': Colors.red,
    },
    {
      'title': 'Schottky Barrier Diodes',
      'category': 'Diodes',
      'icon': Icons.flash_on,
      'color': Colors.red,
    },
    {
      'title': 'Super Barrier Rectifier',
      'category': 'Diodes',
      'icon': Icons.flash_on,
      'color': Colors.red,
    },
    {
      'title': 'Switching Diode',
      'category': 'Diodes',
      'icon': Icons.flash_on,
      'color': Colors.red,
    },
    {
      'title': 'Zener Diodes',
      'category': 'Diodes',
      'icon': Icons.flash_on,
      'color': Colors.red,
    },
    {
      'title': 'Bipolar Transistor-BJT',
      'category': 'Transistors',
      'icon': Icons.toggle_on,
      'color': Colors.purple,
    },
    {
      'title': 'Darlington Transistor\n     Arrays',
      'category': 'Transistors',
      'icon': Icons.toggle_on,
      'color': Colors.purple,
    },
    {
      'title': 'Digital Transistors',
      'category': 'Transistors',
      'icon': Icons.toggle_on,
      'color': Colors.purple,
    },
    {
      'title': 'Intelligent Power\n     Modules',
      'category': 'Transistors',
      'icon': Icons.toggle_on,
      'color': Colors.purple,
    },
    {
      'title': 'JFETs',
      'category': 'Transistors',
      'icon': Icons.toggle_on,
      'color': Colors.purple,
    },
    {
      'title': 'MOSFETs',
      'category': 'Transistors',
      'icon': Icons.toggle_on,
      'color': Colors.purple,
    },
    {
      'title': 'TRIACs',
      'category': 'Transistors',
      'icon': Icons.toggle_on,
      'color': Colors.purple,
    },
    {
      'title': 'Fiber Optical\n Transceivers',
      'category': 'LEDs',
      'icon': Icons.lightbulb,
      'color': Colors.amber,
    },
    {
      'title': 'Infrared LEDs',
      'category': 'LEDs',
      'icon': Icons.lightbulb,
      'color': Colors.amber,
    },
    {
      'title': 'Infrared Remote\n    Receiver',
      'category': 'LEDs',
      'icon': Icons.lightbulb,
      'color': Colors.amber,
    },
    {
      'title': 'Light Emitting Diodes',
      'category': 'LEDs',
      'icon': Icons.lightbulb,
      'color': Colors.amber,
    },
    {
      'title': 'Optocouplers Phototransistor',
      'category': 'LEDs',
      'icon': Icons.lightbulb,
      'color': Colors.amber,
    },
    {
      'title': 'Photodiodes',
      'category': 'LEDs',
      'icon': Icons.lightbulb,
      'color': Colors.amber,
    },
    {
      'title': 'Silicon Photocell',
      'category': 'LEDs',
      'icon': Icons.lightbulb,
      'color': Colors.amber,
    },
    {
      'title': 'Solid State Relay',
      'category': 'LEDs',
      'icon': Icons.lightbulb,
      'color': Colors.amber,
    },
    {
      'title': 'Ambient Light\n    Sensors',
      'category': 'Sensors',
      'icon': Icons.sensors,
      'color': Colors.teal,
    },
    {
      'title': 'Angle Sensors',
      'category': 'Sensors',
      'icon': Icons.sensors,
      'color': Colors.teal,
    },
    {
      'title': 'Angular Velocity\n   Sensors',
      'category': 'Sensors',
      'icon': Icons.sensors,
      'color': Colors.teal,
    },
    {
      'title': 'Attitude Sensors',
      'category': 'Sensors',
      'icon': Icons.sensors,
      'color': Colors.teal,
    },
    {
      'title': 'Biometric Sensors',
      'category': 'Sensors',
      'icon': Icons.sensors,
      'color': Colors.teal,
    },
    {
      'title': 'Current Sensors',
      'category': 'Sensors',
      'icon': Icons.sensors,
      'color': Colors.teal,
    },
    {
      'title': 'Fiber Optic Sensors',
      'category': 'Sensors',
      'icon': Icons.sensors,
      'color': Colors.teal,
    },
    {
      'title': 'Force Sensors',
      'category': 'Sensors',
      'icon': Icons.sensors,
      'color': Colors.teal,
    },
    {
      'title': 'Gas Sensors',
      'category': 'Sensors',
      'icon': Icons.sensors,
      'color': Colors.teal,
    },
    {
      'title': 'Humidity Sensors',
      'category': 'Sensors',
      'icon': Icons.sensors,
      'color': Colors.teal,
    },
    {
      'title': 'Image Sensors',
      'category': 'Sensors',
      'icon': Icons.sensors,
      'color': Colors.teal,
    },
    {
      'title': 'Magnetic Sensors',
      'category': 'Sensors',
      'icon': Icons.sensors,
      'color': Colors.teal,
    },
    {
      'title': 'Photoresistors',
      'category': 'Sensors',
      'icon': Icons.sensors,
      'color': Colors.teal,
    },
    {
      'title': 'PTC Thermistors',
      'category': 'Sensors',
      'icon': Icons.sensors,
      'color': Colors.teal,
    },
    {
      'title': 'Ultrasonic Receivers',
      'category': 'Sensors',
      'icon': Icons.sensors,
      'color': Colors.teal,
    },
    {
      'title': 'Audio Power\n   OpAmps',
      'category': 'Amplifiers',
      'icon': Icons.volume_up,
      'color': Colors.blue,
    },
    {
      'title': 'Comparators',
      'category': 'Amplifiers',
      'icon': Icons.volume_up,
      'color': Colors.blue,
    },
    {
      'title': 'Current Sensing\n   Amplifiers',
      'category': 'Amplifiers',
      'icon': Icons.volume_up,
      'color': Colors.blue,
    },
    {
      'title': 'Differential\n   OpAmps',
      'category': 'Amplifiers',
      'icon': Icons.volume_up,
      'color': Colors.blue,
    },
    {
      'title': 'Fet Input\n  Amplifiers',
      'category': 'Amplifiers',
      'icon': Icons.volume_up,
      'color': Colors.blue,
    },
    {
      'title': 'Instrumentation\n   OpAmps',
      'category': 'Amplifiers',
      'icon': Icons.volume_up,
      'color': Colors.blue,
    },
    {
      'title': 'Isolation Amplifiers',
      'category': 'Amplifiers',
      'icon': Icons.volume_up,
      'color': Colors.blue,
    },
    {
      'title': 'Presicion OpAmps',
      'category': 'Amplifiers',
      'icon': Icons.volume_up,
      'color': Colors.blue,
    },
    {
      'title': 'Video Amplifiers',
      'category': 'Amplifiers',
      'icon': Icons.volume_up,
      'color': Colors.blue,
    },
    {
      'title': 'DIP Switches',
      'category': 'Switches',
      'icon': Icons.toggle_on,
      'color': Colors.lightBlue,
    },
    {
      'title': 'Mechanical Keyboard\n       Shaft',
      'category': 'Switches',
      'icon': Icons.toggle_on,
      'color': Colors.lightBlue,
    },
    {
      'title': 'Metal Dome\n    Pot',
      'category': 'Switches',
      'icon': Icons.toggle_on,
      'color': Colors.lightBlue,
    },
    {
      'title': 'Microswitches',
      'category': 'Switches',
      'icon': Icons.toggle_on,
      'color': Colors.lightBlue,
    },
    {
      'title': 'Multi-Directional\n    Switches',
      'category': 'Switches',
      'icon': Icons.toggle_on,
      'color': Colors.lightBlue,
    },
    {
      'title': 'Push Switches',
      'category': 'Switches',
      'icon': Icons.toggle_on,
      'color': Colors.lightBlue,
    },
    {
      'title': 'Relay Sockets',
      'category': 'Switches',
      'icon': Icons.toggle_on,
      'color': Colors.lightBlue,
    },
    {
      'title': 'Rocker Switches',
      'category': 'Switches',
      'icon': Icons.toggle_on,
      'color': Colors.lightBlue,
    },
    {
      'title': 'Rotary Switches',
      'category': 'Switches',
      'icon': Icons.toggle_on,
      'color': Colors.lightBlue,
    },
    {
      'title': 'Slide Switches',
      'category': 'Switches',
      'icon': Icons.toggle_on,
      'color': Colors.lightBlue,
    },
    {
      'title': 'Tactile Switches',
      'category': 'Switches',
      'icon': Icons.toggle_on,
      'color': Colors.lightBlue,
    },
    {
      'title': 'Toggle Switches',
      'category': 'Switches',
      'icon': Icons.toggle_on,
      'color': Colors.lightBlue,
    },
    {
      'title': 'Cartridge Fuses',
      'category': 'Fuses',
      'icon': Icons.power_off,
      'color': Colors.redAccent,
    },
    {
      'title': 'ESD Protection\n   Devices',
      'category': 'Fuses',
      'icon': Icons.power_off,
      'color': Colors.redAccent,
    },
    {
      'title': 'Fuse Holders',
      'category': 'Fuses',
      'icon': Icons.power_off,
      'color': Colors.redAccent,
    },
    {
      'title': 'Fuse with\n   Leads',
      'category': 'Fuses',
      'icon': Icons.power_off,
      'color': Colors.redAccent,
    },
    {
      'title': 'Glass Discharge\n   Tube',
      'category': 'Fuses',
      'icon': Icons.power_off,
      'color': Colors.redAccent,
    },
    {
      'title': 'Gas Discharge\n   Tube',
      'category': 'Fuses',
      'icon': Icons.power_off,
      'color': Colors.redAccent,
    },
    {
      'title': 'Resettable Fuses',
      'category': 'Fuses',
      'icon': Icons.power_off,
      'color': Colors.redAccent,
    },
    {
      'title': 'Thermal Cutoffs',
      'category': 'Fuses',
      'icon': Icons.power_off,
      'color': Colors.redAccent,
    },
    {
      'title': 'Varistors',
      'category': 'Fuses',
      'icon': Icons.power_off,
      'color': Colors.redAccent,
    },
    {
      'title': 'AC/DC Connectors',
      'category': 'Connectors',
      'icon': Icons.usb,
      'color': Colors.teal,
    },
    {
      'title': 'Audio Connectors',
      'category': 'Connectors',
      'icon': Icons.usb,
      'color': Colors.teal,
    },
    {
      'title': 'Alligator Clips',
      'category': 'Connectors',
      'icon': Icons.usb,
      'color': Colors.teal,
    },
    {
      'title': 'Battery Connectors',
      'category': 'Connectors',
      'icon': Icons.usb,
      'color': Colors.teal,
    },
    {
      'title': 'Cable Connectors',
      'category': 'Connectors',
      'icon': Icons.usb,
      'color': Colors.teal,
    },
    {
      'title': 'Ethernet Connectors',
      'category': 'Connectors',
      'icon': Icons.usb,
      'color': Colors.teal,
    },
    {
      'title': 'Female Headers',
      'category': 'Connectors',
      'icon': Icons.usb,
      'color': Colors.teal,
    },
    {
      'title': 'IC Sockets',
      'category': 'Connectors',
      'icon': Icons.usb,
      'color': Colors.teal,
    },
    {
      'title': 'IDC Connectors',
      'category': 'Connectors',
      'icon': Icons.usb,
      'color': Colors.teal,
    },
    {
      'title': 'Lighting Connectors',
      'category': 'Connectors',
      'icon': Icons.usb,
      'color': Colors.teal,
    },
    {
      'title': 'Mezzanine Connectors',
      'category': 'Connectors',
      'icon': Icons.usb,
      'color': Colors.teal,
    },
    {
      'title': 'Pin Headers',
      'category': 'Connectors',
      'icon': Icons.usb,
      'color': Colors.teal,
    },
    {
      'title': 'Power Connectors',
      'category': 'Connectors',
      'icon': Icons.usb,
      'color': Colors.teal,
    },
    {
      'title': 'Screw Terminal',
      'category': 'Connectors',
      'icon': Icons.usb,
      'color': Colors.teal,
    },
    {
      'title': 'Sim Card\n   Connectors',
      'category': 'Connectors',
      'icon': Icons.usb,
      'color': Colors.teal,
    },
    {
      'title': 'USB Connectors',
      'category': 'Connectors',
      'icon': Icons.usb,
      'color': Colors.teal,
    },
  ];

  List<Map<String, dynamic>> get filteredComponents {
    return allComponents
        .where(
          (component) => component['title'].toLowerCase().contains(
            _searchQuery.toLowerCase(),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 32),
              Column(
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: Text(
                        'EL',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'ElectroLex',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Electronic Reference',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Container(
                width: 380,
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
                ),
                padding: EdgeInsets.all(4),
                child: TabBar(
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  indicator: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  indicatorColor: Colors.transparent,
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.transparent,
                  tabs: [
                    Tab(text: 'Home'),
                    Tab(text: 'Search'),
                    Tab(text: 'Settings'),
                  ],
                ),
              ),
              const SizedBox(height: 26),
              Expanded(
                child: TabBarView(
                  children: [
                    _buildHomeTab(context),
                    _buildSearchTab(),
                    _buildSettingsTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHomeTab(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          Text(
            'Categories',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 12),
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1,
            children:
                categories.map((category) {
                  return GestureDetector(
                    onTap: () {
                      if (category['title'] == 'Others') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (_) => OthersCategoryPage(othersComponents),
                          ),
                        );
                      } else if (category['title'] == 'Diodes') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => DiodeDetailPage()),
                        );
                      } else if (category['title'] == 'Analog ICs') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => AnalogdetailPage()),
                        );
                      } else if (category['title'] == 'Capacitors') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => CapacitorsDetailPage(),
                          ),
                        );
                      } else if (category['title'] == 'Resistors') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ResistorDetailPage(),
                          ),
                        );
                      } else if (category['title'] == 'Amplifiers') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => AmplifiersDetailPage(),
                          ),
                        );
                      } else if (category['title'] == 'Transistors') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => TransistorDetailPage(),
                          ),
                        );
                      } else if (category['title'] == 'LEDs') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => LEDsDetailPage()),
                        );
                      } else if (category['title'] == 'Switches') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => SwitchesDetailPage(),
                          ),
                        );
                      } else if (category['title'] == 'Fuses') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => FusesDetailPage()),
                        );
                      } else if (category['title'] == 'Sensors') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => SensorsDetailPage(),
                          ),
                        );
                      } else if (category['title'] == 'Connectors') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ConnectorsDetailPage(),
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (_) => ComponentDetailPage(category['title']),
                          ),
                        );
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 4),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: category['color'],
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              category['icon'],
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            category['title'],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchTab() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: _searchController,
            onChanged: (value) {
              setState(() {
                _searchQuery = value;
              });
            },
            decoration: InputDecoration(
              hintText: 'Search for components...',
              prefixIcon: Icon(Icons.search),
              filled: true,
              fillColor: Theme.of(context).cardColor,
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        Expanded(
          child:
              filteredComponents.isEmpty
                  ? Center(child: Text('No components found'))
                  : GridView.count(
                    crossAxisCount: 3,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 1,
                    children:
                        filteredComponents
                            .where(
                              (component) => component['title'] != 'Others',
                            ) // Exclude 'Others' category
                            .map((component) {
                              return GestureDetector(
                                onTap: () {
                                  if (component['title'] == 'Buzzers') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => BuzzersPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Connectors') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => ConnectorsDetailPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'AC/DC Connectors') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => ACDCConnectorsPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Audio Connectors') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => AudioConnectorsPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Alligator Clips') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => AlligatorClipsPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Battery Connectors') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => BatteryConnectorsPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Cable Connectors') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => CableConnectorsPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Ethernet Connectors') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) => EthernetConnectorsPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Female Headers') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => FemaleHeadersPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'IC Sockets') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => ICSocketsPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'IDC Connectors') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => IDCConnectorsPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Lighting Connectors') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) => LightingConnectorsPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Mezzanine Connectors') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) => MezzanineConnectorsPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Pin Headers') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => PinHeadersPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Power Connectors') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => PowerConnectorsPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Screw Terminal') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => ScrewTerminalPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Sim Card\n   Connectors') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => SimCardConnectorsPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'USB Connectors') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => USBConnectorsPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] == 'Fuses') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => FusesDetailPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Cartridge Fuses') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => CartridgeFusesPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'ESD Protection\n   Devices') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) => ESDProtectionDevicesPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Fuse Holders') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => FuseHoldersPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Fuse with\n   Leads') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => FusewithLeadsPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Gas Discharge\n   Tube') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => GasDischargeTubePage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Glass Discharge\n   Tube') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) => GlassDischargeTubePage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Resettable Fuses') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => ResettableFusesPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Thermal Cutoffs') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => ThermalCutoffsPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Varistors') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => VaristorsPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] == 'Switches') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => SwitchesDetailPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'DIP Switches') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => DIPSwitchesPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Mechanical Keyboard\n       Shaft') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) =>
                                                MechanicalKeyboardShaftPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Metal Dome\n    Pot') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => MetalDomePotPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Microswitches') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => MicroswitchesPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Multi-Directional\n    Switches') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) =>
                                                MultiDirectionalSwitchesPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Push Switches') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => PushSwitchesPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Relay Sockets') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => RelaySocketsPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Rocker Switches') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => RockerSwitchesPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Rotary Switches') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => RotarySwitchesPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Slide Switches') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => SlideSwitchesPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Tactile Switches') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => TactileSwitchesPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Toggle Switches') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => ToggleSwitchesPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Amplifiers') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => AmplifiersDetailPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Audio Power\n   OpAmps') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => AudioPowerOpAmpsPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Comparators') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => ComparatorsPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Current Sensing\n   Amplifiers') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) =>
                                                CurrentSensingAmplifiersPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Differential\n   OpAmps') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) => DifferentialOpAmpsPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Fet Input\n  Amplifiers') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) => FetInputAmplifiersPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Instrumentation\n   OpAmps') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) => InstrumentationOpAmpsPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Isolation Amplifiers') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) => IsolationAmplifiersPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Operational\n   Amplifiers') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) => OperationalAmplifiersPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Presicion OpAmps') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => PresicionOpAmpsPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Video Amplifiers') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => VideoAmplifiersPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] == 'Sensors') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => SensorsDetailPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Ambient Light\n    Sensors') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) => AmbientLightSensorsPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Angle Sensors') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => AngleSensorsPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Angular Velocity\n   Sensors') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) => AngularVelocitySensorsPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Attitude Sensors') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => AttitudeSensorsPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Biometric Sensors') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => BiometricSensorsPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Current Sensors') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => CurrentSensorsPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Fiber Optic Sensors') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => FiberOpticSensorsPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Force Sensors') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => ForceSensorsPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Gas Sensors') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => GasSensorsPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Humidity Sensors') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => HumiditySensorsPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Image Sensors') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => ImageSensorsPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Magnetic Sensors') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => MagneticSensorsPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Photoresistors') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => PhotoresistorsPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'PTC Thermistors') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => PTCthermistorsPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Ultrasonic Receivers') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) => UltrasonicReceiversPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] == 'LEDs') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => LEDsDetailPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Fiber Optical\n Transceivers') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) =>
                                                FiberOpticalTransceiversPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Infrared LEDs') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => InfraredLEDsPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Infrared Remote\n    Receiver') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) => InfraredRemoteReceiverPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Light Emitting Diodes') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) => LightEmittingDiodesPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Optocouplers Phototransistor') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) =>
                                                OptocouplersPhototransistorPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Photodiodes') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => PhotodiodesPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Silicon Photocell') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => SiliconPhotocellPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Solid State Relay') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => SolidStateRelayPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] == 'Diodes') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => AvalancheDiodesPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Transistors') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => TransistorDetailPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Darlington Transistors\n     Arrays') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) =>
                                                DarlingtonTransistorArrayPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Bipolar Transistor-BJT') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) => BipolarTransistorBJTPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Digital Transistors') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) => DigitalTransistorsPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Intelligent Power\n     Modules') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) =>
                                                IntelligentPowerModulesPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] == 'JFETs') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => JFETsPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] == 'MOSFETs') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => MOSFETsPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] == 'TRIACs') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => TRIACsPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Bridge Rectifiers') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => BridgeRectifiersPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Diacs Trigger Diodes') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) => DiacsTriggerDiodesPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Variable Capacitance\n      Diodes') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) =>
                                                VariableCapacitanceDiodesPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Discharge Tubes') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => DischargeTubesPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'High Effic Rectifier') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) => HighEfficRectifierPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Schottky Barrier Diodes') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) => SchottkyBarrierDiodesPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Super Barrier Rectifier') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) => SuperBarrierRectifierPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Switching Diode') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => SwitchingDiodePage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Zener Diodes') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => ZenerDiodesPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Capacitors') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => CapacitorsDetailPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Aluminum Electrolytic\n     Capacitors') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) =>
                                                AluminumElectrolyticCapacitorsPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Networks, Arrays\n    Capacitors') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) =>
                                                NetworksArraysCapacitorsPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Ceramic Disc Capacitors') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) => CeramicDiscCapacitorsPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Film Capacitors') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => FilmCapacitorsPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'High Voltage Capacitors') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) => HighVoltageCapacitorsPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Horn-Type Electrolytic\n      Capacitors') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) =>
                                                HornTypeElectrolyticCapacitorsPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Metallized Polyester Film\n      Capacitors') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) =>
                                                MetallizedPolyesterFilmCapacitorsPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Niobium Oxide\n    Capacitors') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) => NiobiumOxideCapacitorsPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Paper Dielectric\n    Capacitors') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) =>
                                                PaperDielectricCapacitorsPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Polypropylene Film\n     Capacitors') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) =>
                                                PolypropyleneFilmCapacitorsPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Suppression Capacitors') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) => SuppressionCapacitorsPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Tantalum Capacitors') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) => TantalumCapacitorsPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Trimmers, Variable\n     Capacitors') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) =>
                                                TrimmersVariableCapacitorsPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Analog ICs') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => AnalogdetailPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Analog To Digital\n    Converter') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) =>
                                                AnalogToDigitalConverterPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Digital Potentiometers') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) => DigitalPotentiometersPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Digital To Analog\n    Converter') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) =>
                                                DigitalToAnalogConverterPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Direct Digital Synthesis') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) => DirectDigitalSynthesisPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'PMIC- Current Regulation') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) => PMICCurrentRegulationPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Touch Screen Controllers') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) => TouchScreenControllersPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] == 'DRAM') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => DRAMPage(),
                                      ),
                                    );
                                  } else if (component['title'] == 'EEPROM') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => EEPROMPage(),
                                      ),
                                    );
                                  } else if (component['title'] ==
                                      'Font Chips') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => FontChipsPage(),
                                      ),
                                    );
                                  } else if (component['title'] == 'FRAM') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => FRAMPage(),
                                      ),
                                    );
                                  } else if (component['title'] ==
                                      'NAND FLASH') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => NANDFLASHPage(),
                                      ),
                                    );
                                  } else if (component['title'] ==
                                      'NOR FLASH') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => NORFLASHPage(),
                                      ),
                                    );
                                  } else if (component['title'] == 'SDRAM') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => SDRAMPage(),
                                      ),
                                    );
                                  } else if (component['title'] == 'SRAM') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => SRAMPage(),
                                      ),
                                    );
                                  } else if (component['title'] ==
                                      '4000 Series') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => SeriesPage(),
                                      ),
                                    );
                                  } else if (component['title'] ==
                                      '74 Series') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => SeriessPage(),
                                      ),
                                    );
                                  } else if (component['title'] ==
                                      'Codec ICs') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => CodecICsPage(),
                                      ),
                                    );
                                  } else if (component['title'] == 'Gates') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => GatesPage(),
                                      ),
                                    );
                                  } else if (component['title'] ==
                                      'Flip Flops') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => FlipFlopsPage(),
                                      ),
                                    );
                                  } else if (component['title'] == 'Latches') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => LatchesPage(),
                                      ),
                                    );
                                  } else if (component['title'] ==
                                      'Multivibrators') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => MultivibratorsPage(),
                                      ),
                                    );
                                  } else if (component['title'] ==
                                      'Registers') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => RegistersPage(),
                                      ),
                                    );
                                  } else if (component['title'] == 'Timer') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => TimerPage(),
                                      ),
                                    );
                                  } else if (component['title'] ==
                                      'Translators') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => TranslatorsPage(),
                                      ),
                                    );
                                  } else if (component['title'] ==
                                      'Universal Bus Function') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) => UniversalBusFunctionPage(),
                                      ),
                                    );
                                  } else if (component['title'] ==
                                      'ARTERY Mcu') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => ARTERYMcuPage(),
                                      ),
                                    );
                                  } else if (component['title'] == 'CAN ICs') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => CANICsPage(),
                                      ),
                                    );
                                  } else if (component['title'] ==
                                      'Digital Isolators') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => DigitalIsolatorsPage(),
                                      ),
                                    );
                                  } else if (component['title'] ==
                                      'Interface Controllers') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) => InterfaceControllersPage(),
                                      ),
                                    );
                                  } else if (component['title'] ==
                                      'LIN Transceivers') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => LINTransceiversPage(),
                                      ),
                                    );
                                  } else if (component['title'] ==
                                      'Sensor Interface ICs') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) => SensorInterfaceICsPage(),
                                      ),
                                    );
                                  } else if (component['title'] ==
                                      'Serial Interface ICs') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) => SerialInterfaceICsPage(),
                                      ),
                                    );
                                  } else if (component['title'] ==
                                      'Ajustable Inductors') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) => AdjustableInductorsPage(),
                                      ),
                                    );
                                  } else if (component['title'] ==
                                      'Current Transformers') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) => CurrentTransformersPage(),
                                      ),
                                    );
                                  } else if (component['title'] ==
                                      'Power Inductors') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => PowerInductorsPage(),
                                      ),
                                    );
                                  } else if (component['title'] ==
                                      'Power Transformer') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => PowerTransformerPage(),
                                      ),
                                    );
                                  } else if (component['title'] ==
                                      'Through Hole Inductors') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) => ThroughHoleInductorsPage(),
                                      ),
                                    );
                                  } else if (component['title'] ==
                                      'Sensor Modules') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => SensorModulesPage(),
                                      ),
                                    );
                                  } else if (component['title'] ==
                                      'V-Audio Modules') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => VAudioModulesPage(),
                                      ),
                                    );
                                  } else if (component['title'] ==
                                      'MEMS Microphones') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => MEMSMicrophonesPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Micro Motor') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => MicroMotorPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] == 'Speakers') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => SpeakersPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Ceramic Resonators') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) => CeramicDiscCapacitorsPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] == 'Crystals') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => CrystalsPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Oven Controlled Crystal') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) => OvenControlledCrystalPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'SAW Resonators') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => SAWResonatorsPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Radial Cylinder Crystals') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) => RadialCylinderCrystalsPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Capacitors') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => CapacitorsDetailPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] == 'Diodes') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => DiodeDetailPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Transistors') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => TransistorDetailPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] == 'LEDs') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => LEDsDetailPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] == 'Sensors') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => SensorsDetailPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Amplifiers') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => AmplifiersDetailPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] == 'Switches') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => SwitchesDetailPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] == 'Fuses') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => FusesDetailPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Connectors') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => ConnectorsDetailPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Carbon Film Resistor') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) => CarbonFilmResistorPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Current Sense Resistor') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) => CurrentSenseResistorsPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'High Voltage Resistor') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) => HighVoltageResistorPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'LED Strip Resistor') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => LEDStripResistorsPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Metal Glaze Resistor') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) => MetalGlazeResistorsPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Metal Oxide Resistor') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) => MetalOxideResistorPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Potentiometers Resistor') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) =>
                                                PotentiometersResistorsPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Network & Arrays Resistor') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) => NetworkArraysResistorsPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Variable Resistor') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => VariableResistorsPage(),
                                      ), // Navigate to CarbonFilmResistorPage
                                    );
                                  } else if (component['title'] ==
                                      'Resistors') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => ResistorDetailPage(),
                                      ), // Navigate to ResistorDetailPage
                                    );
                                  } else if (component['title'] ==
                                      'Clock Buffers') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => ClockBuffersPage(),
                                      ),
                                    );
                                  } else if (component['title'] ==
                                      'Clock Generators') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => ClockGeneratorsPage(),
                                      ),
                                    );
                                  } else if (component['title'] ==
                                      'Timing Application') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => TimingApplicationPage(),
                                      ),
                                    );
                                  } else if (component['title'] ==
                                      'Driver Current') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => DriverCurrentPage(),
                                      ),
                                    );
                                  } else if (component['title'] ==
                                      'Microprocessor') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => MicroprocessorPage(),
                                      ),
                                    );
                                  } else if (component['title'] ==
                                      'Real Time Clocks') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => RealTimeClocksPage(),
                                      ),
                                    );
                                  } else if (component['title'] ==
                                      'Driver ICs') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => DriverICsPage(),
                                      ),
                                    );
                                  } else if (component['title'] ==
                                      'VFD Displays Drivers') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) => VFDDisplaysModulesPage(),
                                      ),
                                    );
                                  } else if (component['title'] ==
                                      'LCD Displays Modules') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) => LCDDisplaysModulesPage(),
                                      ),
                                    );
                                  } else if (component['title'] ==
                                      'LED Displays Drivers') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) => LEDDisplaysDriversPage(),
                                      ),
                                    );
                                  } else if (component['title'] ==
                                      'MOS Drivers') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => MOSDriversPage(),
                                      ),
                                    );
                                  } else if (component['title'] ==
                                      'OLED Displays Modules') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) => OLEDDisplaysModulesPage(),
                                      ),
                                    );
                                  } else if (component['title'] ==
                                      'LED Segment Display') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => LEDSegmentDisplayPage(),
                                      ),
                                    );
                                  } else if (component['title'] ==
                                      'Cmsemicon') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => CmsemiconPage(),
                                      ),
                                    );
                                  } else if (component['title'] == 'Cypress') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => CypressPage(),
                                      ),
                                    );
                                  } else if (component['title'] == 'EastSoft') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => EastSoftPage(),
                                      ),
                                    );
                                  } else if (component['title'] ==
                                      'GigaDevice') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => GigaDevicePage(),
                                      ),
                                    );
                                  } else if (component['title'] ==
                                      'Hitrendtech') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => HitrendtechPage(),
                                      ),
                                    );
                                  } else if (component['title'] == 'Holtek') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => HoltekPage(),
                                      ),
                                    );
                                  } else if (component['title'] ==
                                      'Microchip') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => MicrochipPage(),
                                      ),
                                    );
                                  } else if (component['title'] == 'Renesas') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => RenesasPage(),
                                      ),
                                    );
                                  } else if (component['title'] ==
                                      'Silicon Labs') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => SiliconLabsPage(),
                                      ),
                                    );
                                  } else if (component['title'] ==
                                      'Active Filters') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => ActiveFiltersPage(),
                                      ),
                                    );
                                  } else if (component['title'] ==
                                      'Ceramic Filters') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => CeramicFiltersPage(),
                                      ),
                                    );
                                  } else if (component['title'] ==
                                      'Common Mode Filters') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => CommonModeFiltersPage(),
                                      ),
                                    );
                                  } else if (component['title'] ==
                                      'EMC Filters') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => EMCFiltersPage(),
                                      ),
                                    );
                                  } else if (component['title'] ==
                                      'Ferrite Beads') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => FerriteBeadsPage(),
                                      ),
                                    );
                                  } else if (component['title'] ==
                                      'SAW Filters') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => SAWFiltersPage(),
                                      ),
                                    );
                                  } else {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (_) => ComponentDetailPage(
                                              component['title'],
                                            ),
                                      ), // Navigate to general component page
                                    );
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 4,
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 48,
                                        height: 48,
                                        decoration: BoxDecoration(
                                          color: component['color'],
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          component['icon'],
                                          color: Colors.white,
                                          size: 28,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        component['title'],
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            })
                            .toList(),
                  ),
        ),
      ],
    );
  }

  Widget _buildSettingsTab() {
    return Column(
      children: [
        ListTile(
          title: Text('Dark Mode'),
          trailing: IconButton(
            icon: Icon(
              isDarkMode.value ? Icons.wb_sunny : Icons.nightlight_round,
              color: isDarkMode.value ? Colors.yellow : Colors.blueGrey,
            ),
            onPressed: () {
              setState(() {
                isDarkMode.value = !isDarkMode.value; // Toggle dark mode
              });
            },
          ),
        ),
      ],
    );
  }
}

class OthersCategoryPage extends StatelessWidget {
  final List<Map<String, dynamic>> components;

  OthersCategoryPage(this.components);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Others")),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 1,
          children:
              components.map((item) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ComponentDetailPage(item['title']),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 4),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: item['color'],
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            item['icon'],
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: Text(
                            item['title'],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }
}
