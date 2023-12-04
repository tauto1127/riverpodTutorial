import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/viewModel/KumaVM.dart';

class BearPage extends ConsumerWidget{
  int left = 100;
  int right = 100;
  late WidgetRef _ref;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    _ref = ref;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _numberFields(),
            SizedBox(height: 30,),
            TextButton(
              style: FilledButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                backgroundColor: Colors.blue[100],
                foregroundColor: Colors.blueAccent
              ),
              onPressed: () {
                ref.read(kumaVMProvider.notifier).setKumaState(right, left);
                ref.read(kumaVMProvider.notifier).getBearImg(left, right);
              },
              child: const Text("put"),
            ),
            Consumer(
              builder: (context, ref, child) {
                return ref.watch(kumaVMProvider).when(
                  data: (value) => Text(value.width.toString() + ":" + value.height.toString()), 
                  error: (_,__) => Text("error"), 
                  loading: () => Text("loading")
                );
              },
            ),
            Consumer(
              builder: (context, ref, child) {
                return ref.watch(kumaVMProvider).when(
                  data: (value) {
                    if (value.image == null) return Text("まだ画像がありません");
                    else return Image.memory(value.image!);
                  }, error: (_,__) => Text("errorがおきました"), 
                  loading: () => CircularProgressIndicator(), 
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _numberFields() {
    return 
    Column(
      children: [
        Consumer(
          builder: (context, ref, child) {
            return ref.watch(kumaVMProvider).maybeWhen(
              data: (value) {
              if(value.errorText != null) return Text(
                  value.errorText!,
                  style: TextStyle(color: Colors.red),
                );
              else return Text("");
            },
              orElse: () => Text("")
            );
          },
          ),
        Row(
          children: [
            Flexible(
              child: _numberField((value) => left = int.parse(value), 'left')
            ),
            Flexible(
              child: _numberField((value) => right = int.parse(value), 'right')
            ),
          ],
        ),
      ],
    );
  }
  Widget _numberField(void Function(String value) assign, String label){
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: label,
      ),
      onChanged: (String value) { 
        //left = int.parse(value);
        if(int.tryParse(value) == null) _ref.read(kumaVMProvider.notifier).setErrorString("数字を入力してください");
        else {
          assign(value);
          _ref.read(kumaVMProvider.notifier).setErrorString("");
        }
      },
    );
  }
}
