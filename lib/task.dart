import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Task extends StatelessWidget {
  final Map<String, dynamic> task;
  final bool isDone;
  final int i;

  Task({Key? key, required this.task, required this.isDone, required this.i}) : super(key: key);

  List<Map<String, dynamic>> content = [
    {"title": "add step", "icon": Icons.add},
    {"title": "Add to My Day", "icon": Icons.brightness_5_rounded},
    {"title": "Remind me", "icon": Icons.add_alert_outlined},
    {"title": "Add due date", "icon": Icons.calendar_today_rounded},
    {"title": "Repeat", "icon": Icons.repeat},
    {"title": "Add File", "icon": Icons.attachment},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      isDone
                          ? const Icon(
                              Icons.check_circle,
                              color: Colors.green,
                            )
                          : const Icon(Icons.circle_outlined),
                      Column(
                        children: [
                          Text(
                            task['title'],
                            style: Theme.of(context).textTheme.headline1!.apply(
                                  decoration: isDone
                                      ? TextDecoration.lineThrough
                                      : null,
                                ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                task['date'],
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                task['time'],
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ],
                          )
                        ],
                      ),
                      Icon(i%2 == 0? Icons.star : Icons.star_outline, color:i%2 == 0? Colors.orange:null,)
                    ],
                  ),
                  ...List.generate(
                    content.length,
                    (index) => ListTile(
                      title: Text(content[index]["title"]),
                      leading: Icon(content[index]["icon"]),
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const TextField(
                    readOnly: true,
                    maxLines: 4,
                    decoration: InputDecoration(
                        hintText: "Add Note",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 3),
                        )),
                  ),
                ],
              ),
            ),
            const Spacer(),
            const Divider(
              color: Colors.black,
            ),
            ListTile(
              title: const Text("Complete today"),
              trailing: IconButton(
                icon: const Icon(Icons.delete_outline),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
