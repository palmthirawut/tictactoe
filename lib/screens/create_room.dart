import 'package:flutter/material.dart';
import 'package:tictactoe/resources/socket_method.dart';
import 'package:tictactoe/responsive/responsive.dart';
import 'package:tictactoe/utils/colors.dart';
import 'package:tictactoe/widgets/custom_button.dart';
import 'package:tictactoe/widgets/custom_text.dart';
import 'package:tictactoe/widgets/custom_textfield.dart';

class CreateRoom extends StatefulWidget {
  static String routeName = '/creat';

  const CreateRoom({super.key});

  @override
  State<CreateRoom> createState() => _CreateRoomState();
}

class _CreateRoomState extends State<CreateRoom> {
  final TextEditingController _nameController = TextEditingController();
  final SocketMethod _socketMethods = SocketMethod();

  @override
  void initState() {
    super.initState();
    _socketMethods.createRoomSuccessListener(context);
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Responsive(
          child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomText(
                shadows: [Shadow(blurRadius: 40, color: boxColor)],
                text: 'Create Room',
                fontSize: 70),
            SizedBox(height: size.height * 0.08),
            CustomTextField(
                controller: _nameController, hintText: 'Enter your nickname'),
            SizedBox(height: size.height * 0.045),
            CustomButton(
                onTap: () => _socketMethods.createRoom(_nameController.text),
                text: 'Create'),
            SizedBox(height: size.height * 0.01),
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  "Back",
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ))
          ],
        ),
      )),
    );
  }
}
