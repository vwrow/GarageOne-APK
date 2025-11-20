import 'package:flutter/material.dart';

class profilePage extends StatefulWidget {
  const profilePage({super.key});

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  bool _isEditing = false;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final String profilePicturePath = 'assets/logovelg.png';

  @override
  void initState() {
    super.initState();
    _usernameController.text = 'vroowww';
    _emailController.text = 'vro@gmail.com';
    _phoneController.text = '+62 000 0000 0000';
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _toggleEdit() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }

  void _saveChanges() {
    setState(() {
      _isEditing = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Changes saved'), duration: Duration(seconds: 2)),
    );
  }

  void _cancelEdit() {
    setState(() {
      _isEditing = false;
      _usernameController.text = 'vroowww';
      _emailController.text = 'vro@gmail.com';
      _phoneController.text = '+62 000 0000 0000';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBarProfile(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _profilePic(),
            _personalInfo(),
            _preferences(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Padding _preferences() {
    return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Card(
              shadowColor: Colors.black,
              color: const Color.fromARGB(255, 245, 245, 245),
              elevation: 2,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Preference Settings',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 50, 50, 50),
                        fontFamily: "Popins",
                      ),
                    ),
                    SizedBox(height: 20),
                    _buildPreferenceRow(
                      Icons.notifications_outlined,
                      'Notifications',
                      true,
                    ),
                    Divider(height: 30),
                    _buildPreferenceRow(
                      Icons.dark_mode_outlined,
                      'Dark Mode',
                      false,
                    ),
                  ],
                ),
              ),
            ),
          );
  }

  Padding _personalInfo() {
    return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Card(
              shadowColor: Colors.black,
              color: const Color.fromARGB(255, 245, 245, 245),
              elevation: 2,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Personal Information',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 50, 50, 50),
                            fontFamily: "Popins",
                          ),
                        ),
                        if (!_isEditing)
                          IconButton(
                            icon: Icon(Icons.edit, color: Colors.black),
                            onPressed: _toggleEdit,
                            tooltip: 'Edit',
                          )
                        else
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.check, color: Colors.green),
                                onPressed: _saveChanges,
                                tooltip: 'Save',
                              ),
                              IconButton(
                                icon: Icon(Icons.close, color: Colors.red),
                                onPressed: _cancelEdit,
                                tooltip: 'Cancel',
                              ),
                            ],
                          ),
                      ],
                    ),
                    SizedBox(height: 20),
                    _buildInfoRow(
                      Icons.person_outline,
                      'Username',
                      _usernameController,
                      _isEditing,
                    ),
                    Divider(height: 30),
                    _buildInfoRow(
                      Icons.email_outlined,
                      'Email',
                      _emailController,
                      _isEditing,
                    ),
                    Divider(height: 30),
                    _buildInfoRow(
                      Icons.phone_outlined,
                      'Phone Number',
                      _phoneController,
                      _isEditing,
                    ),
                  ],
                ),
              ),
            ),
          );
  }

  Container _profilePic() {
    return Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 40),
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: const Color.fromARGB(255, 245, 245, 245),
                  child: ClipOval(
                    child: Image.asset(
                      profilePicturePath,
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(
                          Icons.person,
                          size: 60,
                          color: Colors.grey.shade600,
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Alvaro',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 50, 50, 50),
                    fontFamily: "Popins",
                  ),
                ),
              ],
            ),
          );
  }

  AppBar _appBarProfile(BuildContext context) {
    return AppBar(
      elevation: 0.1,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_new, size: 24, color: Colors.black),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      title: Text(
        'Profile',
        style: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildInfoRow(
    IconData icon,
    String label,
    TextEditingController controller,
    bool isEditing,
  ) {
    return Row(
      children: [
        Icon(icon, size: 24, color: Colors.grey.shade700),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
              ),
              SizedBox(height: 4),
              isEditing
                  ? TextField(
                      controller: controller,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromARGB(255, 50, 50, 50),
                      ),
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 8),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    )
                  : Text(
                      controller.text,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromARGB(255, 50, 50, 50),
                      ),
                    ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPreferenceRow(IconData icon, String label, bool value) {
    return Row(
      children: [
        Icon(icon, size: 24, color: Colors.grey.shade700),
        SizedBox(width: 16),
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: const Color.fromARGB(255, 50, 50, 50),
            ),
          ),
        ),
        Switch(
          value: value,
          inactiveTrackColor: Colors.white,
          onChanged: (bool newValue) {},
          activeColor: Colors.black,
        ),
      ],
    );
  }
}
