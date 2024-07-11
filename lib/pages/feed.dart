import 'package:flutter/material.dart';
import 'package:kickstarther/pages/home.dart';

class Feed extends StatelessWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'kickstarther',
          style: TextStyle(
              fontStyle: FontStyle.italic, fontWeight: FontWeight.w800),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          child: ListView.builder(
            itemCount: _articles.length,
            itemBuilder: (BuildContext context, int index) {
              final item = _articles[index];
              return TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage(
                                isDemonstration: true,
                              )));
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                ),
                child: Container(
                  height: 150,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.title,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "${item.author} · ${item.postedOn}",
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icons.bookmark_border_rounded,
                                Icons.share,
                                Icons.more_vert
                              ].map((e) {
                                return InkWell(
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Icon(e, size: 16),
                                  ),
                                );
                              }).toList(),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: const Icon(Icons.face_3,
                            size: 60, color: Colors.pink),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class Article {
  final String title;
  final String imageUrl;
  final String author;
  final String postedOn;

  Article(
      {required this.title,
      required this.imageUrl,
      required this.author,
      required this.postedOn});
}

final List<Article> _articles = [
  Article(
    title: "Opening Your Neighborhood BBQ eatery",
    author: "Sophia Martinez, Founder of Deli BBQ",
    imageUrl: "https://example.com/neighborhood-bakery.jpg",
    postedOn: "1 day ago",
  ),
  Article(
    title: "Starting Your Organic Skincare Workshop",
    author: "Emily Johnson, CEO of Glow Organic",
    imageUrl: "https://example.com/organic-skincare-workshop.jpg",
    postedOn: "3 hours ago",
  ),
  Article(
    title: "Crafting Custom Jewelry at Your Local Studio",
    author: "Ava Nguyen, Owner of Gemstone Creations",
    imageUrl: "https://example.com/local-jewelry-studio.jpg",
    postedOn: "2 days ago",
  ),
  Article(
    title: "Launching Your Online Handmade Boutique",
    author: "Rachel Thompson, Founder of Chic Boutique",
    imageUrl: "https://example.com/handmade-boutique.jpg",
    postedOn: "5 hours ago",
  ),
  Article(
    title: "Funding Your Community Tech Hub",
    author: "Jessica Lee, Co-founder of Tech Innovate",
    imageUrl: "https://example.com/community-tech-hub.jpg",
    postedOn: "6 days ago",
  ),
];
