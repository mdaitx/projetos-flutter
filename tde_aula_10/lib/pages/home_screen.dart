import 'package:flutter/material.dart';
import '../widgets/language_list.dart';
import '../widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _filterController = TextEditingController();
  final List<String> _languages = [
    'PHP', 'KOTLIN', 'JAVA', 'JAVASCRIPT', 'PYTHON',
    'DART', 'SWIFT', 'C#', 'C++', 'RUBY',
    'GO', 'RUST', 'SCALA', 'TYPESCRIPT', 'PERL'
  ];
  List<String> _filteredLanguages = [];

  @override
  void initState() {
    super.initState();
    _filteredLanguages = List.from(_languages);
  }

  void _filterLanguages(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredLanguages = List.from(_languages);
      } else {
        _filteredLanguages = _languages
            .where((language) =>
            language.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void _clearFilter() {
    _filterController.clear();
    _filterLanguages('');
  }

  @override
  void dispose() {
    _filterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: [
          Expanded(
            child: LanguageList(languages: _filteredLanguages),
          ),
          CustomSearchBar(
            controller: _filterController,
            onChanged: _filterLanguages,
            onClearPressed: _clearFilter,
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title:Text(
        'Home',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Color(0xFF20B2AA),
      elevation: 0,
      actions: [
        IconButton(
          icon: Icon(
            Icons.cloud,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}