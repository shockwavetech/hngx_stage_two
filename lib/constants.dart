import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Constants {
  static const Color backgroundColor = Color(0xFF384C5E);
  static const Color alternateColor = Color(0xFF1A2936);
}

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
        this.validator,
        required this.hintText,
        required this.label,
        this.controller,
        this.icon,
        this.iconAction,
        this.prefixIcon,
        this.inputType = TextInputType.text,
        required this.onChanged,
        this.validateMode = AutovalidateMode.disabled,
        this.obscureText = false,
        this.padding = 10,
        this.readOnly = false})
      : super(key: key);

  final TextEditingController? controller;
  final String label;
  final String hintText;
  final TextInputType inputType;
  final Function(String) onChanged;
  final bool readOnly;
  final VoidCallback? iconAction;
  final validator;
  final validateMode;
  final bool obscureText;
  final IconData? icon;
  final IconData? prefixIcon;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 5),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Colors.white,
                border: Border.all(
                    color: Colors.green.withOpacity(0.7)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.green.withOpacity(0.8),
                      blurRadius: 1,
                      offset: const Offset(1, 2))
                ]),
            child: TextFormField(
              obscuringCharacter: '*',
              autovalidateMode: validateMode,
              validator: validator,
              controller: controller,
              keyboardType: inputType,
              readOnly: readOnly,
              obscureText: obscureText,
              minLines: 1,
              maxLines: 10,
              style: const TextStyle(
                letterSpacing: 2,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                  prefixIcon: prefixIcon != null ? Icon(
                    prefixIcon,
                    color: Constants.alternateColor,
                  ) : null,
                  suffixIcon: GestureDetector(
                      onTap: iconAction,
                      child: Icon(
                        icon,
                        color: Constants.alternateColor,
                      )),
                  hintText: hintText,
                  hintStyle: TextStyle(
                      color: Colors.black.withOpacity(0.2),
                      fontSize: 12,
                      letterSpacing: 0),
                  border: myBorder(),
                  focusedBorder: myBorder(),
                  enabledBorder: myBorder()),
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }

  OutlineInputBorder myBorder() {
    return OutlineInputBorder(
        borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10.r));
  }
}