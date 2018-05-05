import "package:flutter/material.dart";

class TextButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback onPressed;

  const TextButton({Key key, this.buttonName, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new FlatButton(
      child: new  Text(
        buttonName,
        textAlign: TextAlign.center,
    //   style: buttonTextStyle
      ),
      onPressed: onPressed,
    );
  }
}