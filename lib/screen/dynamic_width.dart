import 'package:flutter/material.dart';

class DynamicWidthContainer extends StatefulWidget {
  const DynamicWidthContainer({super.key});

  @override
  State<DynamicWidthContainer> createState() => _DynamicWidthContainerState();
}

class _DynamicWidthContainerState extends State<DynamicWidthContainer> {
  final TextEditingController _controller = TextEditingController();
  double _textFieldWidth = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Container(
              //   height: 100,
              //   child: ListView.builder(
              //     shrinkWrap: true,
              //     itemBuilder: (context, index) {
              //       return Text(_controller.text);
              //     },
              //   ),
              // ),
              const Text('Write something'),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(5),
                width: _textFieldWidth,
                constraints: const BoxConstraints(
                  minWidth: 20,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return TextField(
                      maxLines: null,
                      controller: _controller,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: '',
                      ),
                      onChanged: (value) {
                        setState(
                          () {
                            final TextPainter textPainter = TextPainter(
                              text: TextSpan(
                                text: value,
                                style: const TextStyle(fontSize: 16),
                              ),
                              textDirection: TextDirection.ltr,
                            )..layout(maxWidth: double.infinity);
                            setState(
                              () {
                                _textFieldWidth = textPainter.width + 15;
                              },
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
