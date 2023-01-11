// 

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:toggle_list/toggle_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ExampleAppPage(),
    );
  }
}

class ExampleAppPage extends StatefulWidget {
  const ExampleAppPage({Key? key}) : super(key: key);

  @override
  State<ExampleAppPage> createState() => _ExampleAppPageState();
}

class _ExampleAppPageState extends State<ExampleAppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Toggle List',style: TextStyle(color: Colors.white,fontSize: 15)),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ToggleList(
            divider: const SizedBox(height: 10),
            toggleAnimationDuration: const Duration(milliseconds: 400),
            scrollPosition: AutoScrollPosition.begin,
            trailing: const Padding(
              padding: EdgeInsets.all(10),
              child: Icon(Icons.expand_more),
            ),
            children: List.generate(
              2,
              (index) => ToggleListItem(
                leading: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(Icons.sailing),
                ),
                title: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hiding a square inside:',
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(fontSize: 17),
                      ),
                      Text(
                        '$index^2',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ],
                  ),
                ),
                content: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(20),
                    ),
                    color: Colors.green.withOpacity(0.15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$index^2 is ${index * index}',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Properties of n^2:\nGeometric figure: parabola\nRoot: n=0\nDiscriminant: Δ = 0\nParity: even',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Divider(
                        color: Colors.white,
                        height: 2,
                        thickness: 2,
                      ),
                      ButtonBar(
                        alignment: MainAxisAlignment.spaceAround,
                        buttonHeight: 32.0,
                        buttonMinWidth: 90.0,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Column(
                              children: const [
                                Icon(Icons.add,color: Colors.red,),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 2.0),
                                ),
                                Text('Add offset',style: TextStyle(color: Colors.red),),
                              ],
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Column(
                              children: const [
                                Icon(Icons.edit,color: Colors.green,),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 2.0),
                                ),
                                Text('Draw plot',style: TextStyle(color: Colors.green)),
                              ],
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Column(
                              children: const [
                                Icon(Icons.save,color: Colors.black,),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 2.0),
                                ),
                                Text('Export plot',style: TextStyle(color: Colors.black)),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                onExpansionChanged: (index, newValue) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.green,
                      content: Text(
                        'Changed expansion status of item  no.${index + 1} to ${newValue ? "expanded" : "shrunk"}.',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
                headerDecoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [ BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5.0,
                  ),],
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                expandedHeaderDecoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}