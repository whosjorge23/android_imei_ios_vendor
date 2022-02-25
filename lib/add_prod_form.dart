import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class AddProductForm extends StatefulWidget {
  const AddProductForm({Key? key}) : super(key: key);

  @override
  State<AddProductForm> createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
  late Map<String, dynamic>? _productMap;
  final _formKey = GlobalKey<FormBuilderState>();
  final List _items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(height: 48),
          FormBuilder(
            key: _formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FormBuilderTextField(
                    keyboardType: TextInputType.name,
                    name: 'device-name',
                    validator: FormBuilderValidators.compose(
                      [
                        FormBuilderValidators.required(context,
                            errorText: 'Device name is required.'),
                      ],
                    ),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Device Name'),
                  ),
                  SizedBox(height: 28),
                  FormBuilderTextField(
                    name: 'device-image',
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Device Image'),
                  ),
                  SizedBox(height: 28),
                  FormBuilderTextField(
                    name: 'label',
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Label'),
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.value != null) {
                  _formKey.currentState!.save();
                  if (_formKey.currentState!.validate()) {
                    // print(_formKey.currentState!.value);
                    _productMap =
                        _formKey.currentState!.value as Map<String, dynamic>;
                  } else {
                    print("validation failed");
                  }
                  _items.add(_productMap);
                  Future.delayed(Duration(seconds: 5), () {
                    print(_items);
                  });
                }
              },
              child: Text("Add"))
        ],
      ),
    );
  }
}
