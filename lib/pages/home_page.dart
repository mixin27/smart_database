import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

final faker = Faker();

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
          body: Column(
            children: [
              // Brand Name
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'Database',
                        style: Theme.of(context).textTheme.headline4?.copyWith(
                              color: Colors.tealAccent,
                            ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.flutter_dash,
                        size: 35,
                        color: Colors.tealAccent,
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
                child: Row(
                  children: [
                    // Search bar
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          border: Border.all(
                            color: Colors.tealAccent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextFormField(
                          cursorColor: Colors.tealAccent,
                          style: const TextStyle(
                            color: Colors.tealAccent,
                          ),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 8,
                            ),
                            border: InputBorder.none,
                            hintText: 'Type here...',
                            hintStyle: TextStyle(
                              color: Colors.tealAccent.withOpacity(0.6),
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 10),

                    InkWell(
                      splashColor: Colors.tealAccent.withOpacity(0.1),
                      onTap: () {},
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          border: Border.all(
                            color: Colors.tealAccent,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.search,
                          color: Colors.tealAccent,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // List
              const Expanded(
                child: PersonList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PersonList extends StatelessWidget {
  const PersonList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 20,
      separatorBuilder: (context, index) => Divider(
        color: Colors.tealAccent.withOpacity(0.5),
      ),
      itemBuilder: (context, index) {
        return const PersonListItem();
      },
    );
  }
}

class PersonListItem extends StatelessWidget {
  const PersonListItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final address =
        '${faker.address.streetAddress()}, ${faker.address.city()}, ${faker.address.country()}';

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      child: Row(
        children: [
          Expanded(
            child: CircleAvatar(
              backgroundColor: Colors.tealAccent.withOpacity(
                0.2,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  faker.person.name(),
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                        color: Colors.tealAccent,
                      ),
                ),
                Text(
                  address,
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        color: Colors.white.withOpacity(0.7),
                      ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(),
          ),
        ],
      ),
    );
  }
}
