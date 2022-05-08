import 'package:flutter/material.dart';
import 'data.dart';

class NewTask extends StatelessWidget {
  const NewTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      height: double.infinity,
      width: double.infinity,
      child: ListView.separated(
          itemBuilder: (ctx, i) => ListTile(
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      newTasks[i]['title'],
                      style: Theme.of(ctx).textTheme.headline1,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          newTasks[i]['date'],
                          style: Theme.of(ctx).textTheme.bodyText1,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          newTasks[i]['time'],
                          style: Theme.of(ctx).textTheme.bodyText1,
                        ),
                      ],
                    )
                  ],
                ),
                onTap: () {
                  navigate(context: ctx, task: newTasks[i], isDone: false, i: i);
                },
                leading: const Icon(Icons.circle_outlined),
                trailing: Icon(i%2 == 0? Icons.star : Icons.star_outline, color:i%2 == 0? Colors.orange:null,),
              ),
          separatorBuilder: (_, x) => const Divider(),
          itemCount: newTasks.length),
    );
  }
}
