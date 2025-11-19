class NewsModel {
  String id;
  String title;
  String imagePath;
  String date;

  NewsModel({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.date,
  });
  static List<NewsModel> getNews() {
    List<NewsModel> news = [];
    news.add(
      NewsModel(
        id: '1',
        title: 'Delkevic M8',
        imagePath: 'assets/news/Delkevic_M8.jpg',
        date: '12-11-2025',
      ),
    );
    news.add(
      NewsModel(
        id: '2',
        title: 'VND AK55',
        imagePath: 'assets/news/VND_AK55.jpg',
        date: '23-10-2025',
      ),
    );
    news.add(
      NewsModel(
        id: '3',
        title: 'RCB SP522',
        imagePath: 'assets/news/RCB_SP522.jpg',
        date: '01-10-2025',
      ),
    );
    news.add(
      NewsModel(
        id: '4',
        title: 'CMG MG7',
        imagePath: 'assets/news/CMG_MG7.jpg',
        date: '31-08-2025',
      ),
    );
    return news;
  }
}
