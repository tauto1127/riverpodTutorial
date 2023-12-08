import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/viewModel/KumaVM.dart';
///こっちのコードでは昨日のと違って　ボタンが押されたら，テキストフィールドの値をstateに入れるようにしてます
class BearPage extends ConsumerWidget{
  int left = 100;
  int right = 100; //textfieldの値を一時的に保存
  late WidgetRef _ref; //気にしなくていい

  BearPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _ref = ref;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _numberFields(),
            const SizedBox(height: 30,),
            TextButton(
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                backgroundColor: Colors.blue[100],
                foregroundColor: Colors.blueAccent
              ),
              onPressed: () {
                ref.read(kumaVMProvider.notifier).setKumaState(right, left);
                ref.read(kumaVMProvider.notifier).getBearImg();
              },
              child: const Text("put"),
            ),
            Consumer( //ConsumerWidgetの中にConsumer入れないので，このConsumerは必要ない
              builder: (context, ref, child) {
                return ref.watch(kumaVMProvider).when(
                  data: (value) => Text("${value.width}:${value.height}"), 
                  error: (_,__) => const Text("error"), 
                  loading: () => const Text("loading")
                );
              },
            ),
            Consumer(
              builder: (context, ref, child) {
                return ref.watch(kumaVMProvider).when(
                  data: (value) {
                    if (value.image == null) {
                      return const Text("まだ画像がありません");
                    } else {
                      return Image.memory(value.image!); ///Image.memory()で画像を表示してます
                    }
                  }, error: (_,__) => const Text("errorがおきました"), 
                  loading: () => const CircularProgressIndicator(),  //ローディング中のくるくるするウィジェット
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
              if(value.errorText != null) {
                return Text(
                  value.errorText!,
                  style: const TextStyle(color: Colors.red),
                );
              } else {
                return const Text("");
              }
            },
              orElse: () => const Text("")
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
  Widget _numberField(void Function(String value) assign, String label){//Widgetを返す関数を作って，コードを見やすくしたり，コードの重複をなくしてる
    //return Consumer にすれば，_refを使う必要はない
    return TextField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: label,
      ),
      onChanged: (String value) { 
        //left = int.parse(value);
        if(int.tryParse(value) == null) {
          _ref.read(kumaVMProvider.notifier).setErrorString("数字を入力してください");
        } else {
          assign(value);
          _ref.read(kumaVMProvider.notifier).setErrorString("");
        }
      },
    );
  }
}
