import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:localdatatodu/pages/home/creattask.dart';

class InboxPage extends StatefulWidget {
  final List<StringBuffer?>? elementlar;
  const InboxPage({
    required this.elementlar,
    super.key,
  });

  @override
  State<InboxPage> createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  // List<String> retrievedList = [];

  // @override
  // void initState() {
  //   super.initState();
  //   // retrieveList();
  // }

  // Future<void> retrieveList() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   List<String>? storedList = sharedPreferences.getStringList('list');

  //   if (storedList != null) {
  //     setState(() {
  //       retrievedList = storedList;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white8,
      appBar: AppBar(
        title: const Text('Inbox'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            //Text('${widget.elementlar}'),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.88,
              child: ListView.builder(
                itemCount: widget.elementlar!.length,
                itemBuilder: (contex, index) {
                  //  var res = retrievedList.join('');
                  var res = widget.elementlar!.join('');

                  //var data = .
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.26,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.black12,
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 50,
                            decoration: const BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  const Icon(Icons.flag),
                                  //!title
                                  Expanded(
                                    child: Text(
                                      '   ${res.substring(0, res.length - 13)}',
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                  ),
                                  const Icon(Icons.more_horiz_outlined),
                                ],
                              ),
                            ),
                          ),
                          const Gap(26),
                          Row(
                            children: [
                              const Icon(Icons.mode_standby_rounded),
                              Text(
                                '   ${res.substring(0, res.length - 13)}',
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: Divider(
                              indent: 20,
                              endIndent: 20,
                              color: Colors.black,
                            ),
                          ),
                          Row(
                            children: [
                              const Gap(10),
                              const Icon(Icons.alarm),
                              //! data
                              Text(
                                res.substring(19, 24),
                              ),
                              const Gap(10),
                              const Icon(Icons.chat),
                              const Lefttext(text: '1'),
                              const Gap(10),
                              const Icon(Icons.downloading),
                              const Expanded(
                                child: Lefttext(
                                  text: '3',
                                ),
                              ),
                              //!day mooth and year
                              Text(
                                res.substring(11, 19),
                              ),
                              const Gap(20),
                            ],
                          ),

                          // Text(
                          //   widget.elementlar!.toString(),
                          // ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (contex) => const HomePage(),
          ),
        );
      }),
    );
  }
}
