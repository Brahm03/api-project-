import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:gadgets_store_admin/src/features/home/provider/home_provider.dart';
import 'package:material_ui/material_ui.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider()..getLaptops(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            floatingActionButton: ValueListenableBuilder(
              valueListenable: isLoading,
              builder: (context, value, child) {
                if (value == true) {
                  return CircularProgressIndicator();
                } else {
                  return FloatingActionButton(
                    onPressed: () {
                      context.read<HomeProvider>().qoshish(
                        "test",
                        "test",
                        "test",
                        'test',
                      );
                    },
                    child: Icon(Icons.add),
                  );
                }
              },
            ),
            body: Row(
              children: [
                Visibility(
                  visible: MediaQuery.sizeOf(context).width > 550,
                  child: Container(
                    height: double.infinity,
                    width: MediaQuery.sizeOf(context).width * 0.05,
                    decoration: BoxDecoration(
                      color: CupertinoColors.activeBlue,
                      borderRadius: BorderRadius.horizontal(
                        right: Radius.circular(40),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.95,
                  child: Builder(
                    builder: (context) {
                      final status = context.watch<HomeProvider>().status;
                      if (status == HomeStatus.loading) {
                        return Center(child: CircularProgressIndicator());
                      } else if (status == HomeStatus.success) {
                        final data = context.watch<HomeProvider>().data;
                        if (data.isEmpty) {
                          return Center(child: Text('Hech bola yoq'));
                        } else {
                          return ListView.separated(
                            itemBuilder: (context, index) {
                              return Card(
                                child: ListTile(
                                  trailing: ValueListenableBuilder(
                                    valueListenable: isDeleting,
                                    builder: (context, value, child) {
                                      return IconButton(
                                        onPressed: value
                                            ? null
                                            : () {
                                                context
                                                    .read<HomeProvider>()
                                                    .ochirish(
                                                      data[index]['id'],
                                                    );
                                              },
                                        icon:
                                            value &&
                                                data[index]['id'] ==
                                                    context
                                                        .watch<HomeProvider>()
                                                        .deletingID
                                            ? CircularProgressIndicator()
                                            : Icon(Icons.delete),
                                      );
                                    },
                                  ),
                                  title: Text(data[index]['model']),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) =>
                                SizedBox(height: 20),
                            itemCount: data.length,
                          );
                        }
                      } else {
                        return Center(
                          child: Text('Xatolik bor qayta urunib koring'),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
