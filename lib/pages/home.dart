import 'package:flutter/material.dart';
import 'package:velg/models/news_model.dart';
import 'package:velg/models/inventory_model.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<NewsModel> news = [];
  ValueNotifier<List<VelgData>> inventoryInfo = ValueNotifier<List<VelgData>>(
    [],
  );

  void _getNews() {
    news = NewsModel.getNews();
  }

  void _getInventory() {
    List<VelgData> items = getInventory().toList();
    inventoryInfo.value = items;
  }

  @override
  void initState() {
    super.initState();
    _getNews();
    _getInventory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
        width: 200,
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        child: Column(
          children: [
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 15),
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    size: 20,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                SizedBox(width: 20),
                Text(
                  "Menu",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 20),

            ListTile(
              tileColor: const Color.fromARGB(255, 228, 228, 228),
              iconColor: Colors.black,
              textColor: Colors.black,
              leading: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Icon(Icons.home_filled),
              ),
              title: Text(
                "Home",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {},
            ),
            ListTile(
              iconColor: Colors.black,
              textColor: Colors.black,
              leading: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Icon(Icons.favorite_border),
              ),
              title: Text("Wishlist"),
              onTap: () {},
            ),
            ListTile(
              iconColor: Colors.black,
              textColor: Colors.black,
              leading: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Icon(Icons.history),
              ),
              title: Text("History"),
              onTap: () {},
            ),
            ListTile(
              iconColor: Colors.black,
              textColor: Colors.black,
              leading: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Icon(Icons.support_agent),
              ),
              title: Text("Support"),
              onTap: () {},
            ),
          ],
        ),
      ),

      appBar: appBar(),
      body: ListView(children: [_searchBar(), _newDrops(), _inventory()]),
    );
  }

  Column _inventory() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 30,
            bottom: 20,
            top: 40,
            right: 30,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Our Inventory",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 30,
                width: 100,
                child: FloatingActionButton(
                  onPressed: () => _showItemDialog(),
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    "Add Items",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 30, right: 30),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 70,
                spreadRadius: 0,
              ),
            ],
          ),
          child: ValueListenableBuilder<List<VelgData>>(
            valueListenable: inventoryInfo,
            builder: (context, inventory, child) {
              return Column(
                children: inventory.asMap().entries.map((entry) {
                  final idx = entry.key;
                  final item = entry.value;
                  return Card(
                    margin: EdgeInsets.only(bottom: 15),
                    elevation: 2,
                    color: const Color.fromARGB(255, 245, 245, 245),
                    child: Container(
                      margin: EdgeInsets.only(
                        top: 20,
                        bottom: 20,
                        right: 20,
                        left: 20,
                      ),
                      width: 500,
                      height: 175,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            item.posterPath,
                            height: 175,
                            width: 175,
                            fit: BoxFit.fill,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                height: 175,
                                width: 175,
                                child: Icon(
                                  Icons.image_not_supported,
                                  size: 60,
                                  color: Colors.grey.shade600,
                                ),
                              );
                            },
                          ),

                          Padding(
                            padding: const EdgeInsets.only(
                              left: 15,
                              top: 10,
                              right: 0,
                            ),
                            child: Container(
                              margin: EdgeInsets.only(bottom: 10),
                              width: 170,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.model,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: const Color.fromARGB(
                                            255,
                                            50,
                                            50,
                                            50,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        item.description,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey.shade700,
                                        ),
                                      ),
                                    ],
                                  ),

                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                        height: 30,
                                        width: 80,
                                        child: FloatingActionButton(
                                          onPressed: () => _showItemDialog(
                                            item: item,
                                            index: idx,
                                          ),
                                          backgroundColor: Colors.black,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              5,
                                            ),
                                          ),
                                          child: Text(
                                            "Edit",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30,
                                        width: 80,
                                        child: FloatingActionButton(
                                          onPressed: () => _deleteItem(idx),
                                          backgroundColor: const Color.fromARGB(
                                            255,
                                            161,
                                            0,
                                            0,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              5,
                                            ),
                                          ),
                                          child: Text(
                                            "Delete",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ),
      ],
    );
  }

  Column _newDrops() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30, bottom: 20, top: 40),
          child: Text(
            "New Drops",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 30, right: 30),
          height: 250,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 70,
                spreadRadius: 0,
              ),
            ],
          ),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: news.length,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.only(right: 15),
                elevation: 2,
                color: const Color.fromARGB(255, 245, 245, 245),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      news[index].imagePath,
                      height: 175,
                      width: 200,
                      fit: BoxFit.cover,
                    ),

                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                        top: 10,
                        right: 0,
                      ),
                      child: Container(
                        width: 170,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  news[index].title,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: const Color.fromARGB(
                                      255,
                                      50,
                                      50,
                                      50,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  news[index].date,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                              ],
                            ),

                            Icon(Icons.arrow_forward_ios, size: 20),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Container _searchBar() {
    return Container(
      margin: EdgeInsets.only(top: 30, left: 40, right: 40),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 50,
            spreadRadius: 0,
          ),
        ],
      ),
      child: TextField(
        maxLines: 1,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          hoverColor: Colors.white,
          prefixIcon: Icon(Icons.search, size: 20),
          hintText: "Rotobox",
          hintStyle: TextStyle(
            fontSize: 16,
            color: const Color.fromARGB(187, 158, 158, 158),
          ),
          suffixIcon: Icon(Icons.sort, size: 20),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      elevation: 0.1,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      leading: Builder(
        builder: (context) {
          return Row(
            children: [
              SizedBox(width: 15),
              IconButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                icon: Icon(Icons.menu, color: Colors.black, size: 24),
              ),
            ],
          );
        },
      ),

      title: Text(
        "GarageOne",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 24,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, "/profile");
          },
          icon: Icon(Icons.person, color: Colors.black, size: 24),
        ),
        SizedBox(width: 15),
      ],
    );
  }

  Future<void> _deleteItem(int index) async {
    final modelName = inventoryInfo.value[index].model;

    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // ── BLACK HEADER ─────────────────────────────
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Delete Item",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 25,
                ),
                child: Text(
                  'Are you sure you want to delete "$modelName"?',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ),

              // ── ACTION BUTTONS ──────────────────────────
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: Text(
                        "Cancel",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFD64545),
                        padding: EdgeInsets.symmetric(
                          horizontal: 28,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () => Navigator.pop(context, true),
                      child: Text(
                        "Delete",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );

    if (confirm == true) {
      final list = List<VelgData>.from(inventoryInfo.value);
      list.removeAt(index);
      inventoryInfo.value = list;
    }
  }

  Future<void> _showItemDialog({VelgData? item, int? index}) async {
    final modelCtrl = TextEditingController(text: item?.model ?? '');
    final descCtrl = TextEditingController(text: item?.description ?? '');
    final posterCtrl = TextEditingController(text: item?.posterPath ?? '');

    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        // local error flag for the model field inside the dialog
        bool showModelError = false;
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item == null ? "Add Item" : "Edit Item",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        // Model field with inline validation
                        TextField(
                          controller: modelCtrl,
                          decoration: InputDecoration(
                            labelText: 'Model',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            errorText: showModelError ? "Can't be empty" : null,
                          ),
                        ),
                        SizedBox(height: 15),
                        _popupField("Description", descCtrl),
                        SizedBox(height: 15),
                        _popupField("Poster asset path", posterCtrl),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            surfaceTintColor: Colors.black,
                          ),
                          onPressed: () => Navigator.pop(context),
                          child: Text(
                            "Cancel",
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            padding: EdgeInsets.symmetric(
                              horizontal: 28,
                              vertical: 12,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            // validate model field
                            if (modelCtrl.text.trim().isEmpty) {
                              setState(() {
                                showModelError = true;
                              });
                              return;
                            }

                            final current = List<VelgData>.from(
                              inventoryInfo.value,
                            );
                            final newId = (current.isEmpty)
                                ? 1
                                : current
                                          .map((e) => e.id)
                                          .reduce((a, b) => a > b ? a : b) +
                                      1;

                            final newItem = VelgData(
                              id: item?.id ?? newId,
                              model: modelCtrl.text.trim(),
                              description: descCtrl.text.trim(),
                              posterPath: posterCtrl.text.trim(),
                            );

                            if (index != null) {
                              current[index] = newItem;
                            } else {
                              current.add(newItem);
                            }

                            inventoryInfo.value = current;
                            Navigator.pop(context);
                          },
                          child: Text(
                            item == null ? "Add" : "Save",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  // Helper to build the styled text fields
  Widget _popupField(String label, TextEditingController ctrl) {
    return TextField(
      controller: ctrl,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
