import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/controller/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("TODO"),
        backgroundColor: Colors.black54,
      ),
      body: Container(
        color: Colors.grey,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Consumer<TodoProvider>(builder: (context, value, child) {
                  value.getTasks();
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, mainAxisExtent: 80),
                    itemBuilder: (context, index) {
                      final data = value.notelist[index];
                      return GestureDetector(
                        onTap: () {},
                        child: Card(
                          color: Colors.black38,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "${data.subject}",
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: value.notelist.length,
                  );
                }),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          bottomsheet();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void bottomsheet() {
    final todoprovider = Provider.of<TodoProvider>(context,listen: false);
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              TextFormField(
                controller:  todoprovider.subjectcontroller,
                decoration: InputDecoration(
                  labelText: "Enter the subject"
                ),
              ),SizedBox(height: 20,),
              TextFormField(
                controller:  todoprovider.subjectcontroller,
                decoration: InputDecoration(
                  labelText: "Enter the subject"
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
