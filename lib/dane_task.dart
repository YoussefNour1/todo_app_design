import 'package:flutter/material.dart';
import 'package:todo_app_design/data.dart';

class DoneTask extends StatelessWidget {
  const DoneTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      height: double.infinity,
      width: double.infinity,
      child: ListView.separated(
          itemBuilder: (ctx, i) => Container(
                padding: const EdgeInsets.all(10),
                child: ListTile(
                  style: ListTileStyle.drawer,
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doneTasks[i]['title'],
                        style: Theme.of(ctx)
                            .textTheme
                            .headline1!
                            .apply(decoration: TextDecoration.lineThrough),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(doneTasks[i]['date'],
                              style: Theme.of(ctx).textTheme.bodyText1),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            doneTasks[i]['time'],
                            style: Theme.of(ctx).textTheme.bodyText1,
                          ),
                        ],
                      )
                    ],
                  ),
                  onTap: () {
                    navigate(context: ctx, task: doneTasks[i], isDone: true);
                  },
                  leading: const Icon(
                    Icons.check_circle_rounded,
                    color: Colors.green,
                  ),
                ),
              ),
          separatorBuilder: (_, i) => const Divider(),
          itemCount: doneTasks.length),
    );
  }
}
