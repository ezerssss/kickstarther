import 'package:flutter/material.dart';

class Checklist extends StatefulWidget {
  final bool isDemonstration;

  const Checklist({super.key, this.isDemonstration = false});

  @override
  State<Checklist> createState() => _ChecklistState();
}

class _ChecklistState extends State<Checklist> {
  List data = [
    "Choose your signature BBQ dishes",
    "Find a visible location for your BBQ stand or food truck",
    "Get necessary permits and licenses",
    "Buy essential BBQ equipment (grill, utensils)",
    "Find reliable suppliers for meat and ingredients",
    "Set clear prices for your BBQ items",
    "Promote your business on social media",
    "Offer free tastings or launch specials",
    "Focus on friendly customer service",
    "Track expenses and adjust accordingly",
  ];
  List selectedItemsList = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    widget.isDemonstration
                        ? "BBQ Business (Sophia Martinez)"
                        : "Start a new business!",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Icon(
                  Icons.next_plan,
                  size: 25,
                ),
              ],
            )),
        const Divider(endIndent: 16, thickness: 1, indent: 16),
        Expanded(
          child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () => selectTappedItem(index),
                  title: Text(
                      widget.isDemonstration
                          ? '${data[index]}'
                          : 'Item ${index + 1}',
                      style: selectedItemsList.contains(data[index])
                          ? const TextStyle(
                              decoration: TextDecoration.lineThrough,
                            )
                          : const TextStyle()),
                  leading: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: !selectedItemsList.contains(data[index])
                        ? const Icon(Icons.check_box_outline_blank)
                        : const Icon(Icons.check_box),
                  ),
                );
              }),
        ),
        const Divider(endIndent: 16, thickness: 1, indent: 16),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }

  void selectTappedItem(int index) {
    if (selectedItemsList.contains(data[index])) {
      setState(() {
        selectedItemsList.remove(data[index]);
      });
    } else {
      setState(() {
        final item = data[index];
        selectedItemsList.add(data[index]);
        data.removeAt(index);
        data.add(item);
      });
    }
  }
}
