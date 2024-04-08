import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AutoCompleteTextField extends StatefulWidget {
  @override
  _AutoCompleteTextFieldState createState() => _AutoCompleteTextFieldState();
}

class _AutoCompleteTextFieldState extends State<AutoCompleteTextField> {
  final List<String> suggestions = ['Apple', 'Banana','Bangala', 'Cherry', 'Date', 'Fig', 'Grape', 'Kiwi'];

  String _selectedItem = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Autocomplete<String>(
          overlayDirection: VerticalDirection.up,
          optionsBuilder: (TextEditingValue textEditingValue) {
            if (textEditingValue.text.isEmpty) {
              return const Iterable<String>.empty();
            }
            return suggestions.where((String option) {
              return option.toLowerCase().startsWith(textEditingValue.text.toLowerCase());
            });
          },
          onSelected: (String selection) {
            setState(() {
              _selectedItem = selection;
            });
          },
          fieldViewBuilder: (BuildContext context, TextEditingController textEditingController, FocusNode focusNode, VoidCallback onFieldSubmitted) {
            return TextField(
              controller: textEditingController,
              focusNode: focusNode,
              decoration: InputDecoration(
                labelText: 'Type something...',
                hintText: 'Saisir le non de l\'etablissement',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black12,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black12,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ), // Adding border to the input field
              ),
              style: TextStyle(
                fontSize: 16.0, // Adjusting font size
              ),
              onChanged: (String value) {
                // You can do something with the value if needed
              },
              onSubmitted: (String value) {
                // You can do something when the user submits the text field if needed
              },
            );
          },
          optionsViewBuilder: (BuildContext context, AutocompleteOnSelected<String> onSelected, Iterable<String> options) {
            return Align(
              alignment: Alignment.topLeft,
              child: Material(
                elevation: 4.0,
                child: SizedBox(
                  height: 200.0,
                  child: ListView(
                    children: options.map((String option) {
                      return GestureDetector(
                        onTap: () {
                          onSelected(option);
                        },
                        child: ListTile(
                          title: Text(
                            option,
                            style: TextStyle(fontSize: 16.0), // Adjusting font size
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
