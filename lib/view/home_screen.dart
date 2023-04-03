import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rankway_assignment/controller/home_provider.dart';
import 'package:rankway_assignment/core/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final provider = Provider.of<HomeProvider>(context, listen: false);
    provider.fetchApi();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        elevation: 1,
        leading: const Icon(
          Icons.sort,
          color: kThemeColor,
          size: 30,
        ),
        title: const Text(
          'Contacts',
          style: TextStyle(
              color: Color(0xff3C535D),
              fontWeight: FontWeight.bold,
              fontSize: 25),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(
              Icons.search,
              color: kThemeColor,
              size: 30,
            ),
          ),
        ],
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 20, bottom: 20, right: 20, left: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Consumer<HomeProvider>(
                builder: (context, value, child) {
                  return value.isLoading == true
                      ? SizedBox(
                          height: size.height * 0.8,
                          child:
                              const Center(child: CircularProgressIndicator()))
                      : ListView.separated(
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemBuilder: (context, index) {
                            final data = value.userList[index];
                            return ListTile(
                              leading: CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(data.avatar),
                              ),
                              title: Text(
                                data.firstName + data.lastName,
                                style: const TextStyle(color: kTitleColor),
                              ),
                              subtitle: Text(
                                data.name,
                                style: const TextStyle(color: kSubTitleColor),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => kHeight10,
                          itemCount: value.userList.length,
                        );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kFloatColor,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
