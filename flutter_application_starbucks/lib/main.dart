import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StarBucks(),
    );
  }
}

/// Starbucks 메인 색상
Color starbucksPrimaryColor = const Color.fromARGB(255, 83, 184, 138);

/// Starbucks 포인트 색상
Color starbucksAccentColor = const Color.fromARGB(255, 199, 176, 121);

class StarBucks extends StatefulWidget {
  const StarBucks({super.key});

  @override
  State<StarBucks> createState() => _StarBucksState();
}

class _StarBucksState extends State<StarBucks> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex, // index 순서에 해당하는 child를 맨 위에 보여줌
        children: const [
          StarbucksFirstPage(),
          StarbucksSecondPage(),
          StarbucksThirdPage(),
          Center(child: Text('Starbucks 네 번째 페이지')),
          Center(child: Text('Starbucks 다섯 번째 페이지')),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex, // 현재 보여주는 탭
        onTap: (newIndex) {
          print("selected newIndex : $newIndex");
          // 다른 페이지로 ㅇ이동
          setState(() {
            currentIndex = newIndex;
          });
        },
        selectedItemColor: starbucksPrimaryColor, // 선택된 아이콘 색상
        unselectedItemColor: Colors.grey, // 선택되지 않은 아이콘 색상
        showSelectedLabels: false, // 선택된 항목 label 숨기기
        showUnselectedLabels: false, // 선택되지 않은 항목 label 숨기기
        type: BottomNavigationBarType.fixed, // 선택시 아이콘 움직이지 않기
        backgroundColor: Colors.white.withOpacity(0.8),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.credit_card_rounded), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.free_breakfast), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.redeem), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: ""),
        ],
      ),
    );
  }
}

/// 첫 번째 페이지
class StarbucksFirstPage extends StatelessWidget {
  const StarbucksFirstPage({super.key});

  /// 배경 이미지 URL
  final String backImg =
      "https://i.ibb.co/2Pz33q7/2021-12-16-12-21-42-cleanup.png";

  /// Frequency 이미지 URL
  final String frequencyImg = "https://i.ibb.co/QcVn97y/2021-12-16-1-33-11.png";

  /// 추천 메뉴
  final List<Map<String, String>> recommendMenu = const [
    {
      "name": "돌체쿠키라떼",
      "imgUrl": "https://i.ibb.co/SwGPpzR/9200000003687-20211118142543832.jpg",
    },
    {
      "name": "아이스 홀리데이 돌체 쿠키 라떼",
      "imgUrl": "https://i.ibb.co/JHVXZ72/9200000003690-20211118142702357.jpg",
    },
    {
      "name": "스노우 민트 초콜릿",
      "imgUrl": "https://i.ibb.co/M91G17c/9200000003693-20211118142933650.jpg",
    },
    {
      "name": "아이스 스노우 민트 초콜릿",
      "imgUrl": "https://i.ibb.co/jyZK4C9/9200000003696-20211118143125337.jpg",
    },
    {
      "name": "스노우 민트 초콜릿 블렌디드",
      "imgUrl": "https://i.ibb.co/DKkV0rw/9200000003699-20211118143249044.jpg",
    },
  ];

  /// 크리스마스 이벤트 이미지 URL
  final String eventImg = "https://i.ibb.co/Fb0q43T/IMG-F9-BA5-CBCB476-1.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      /// 우측 하단에 Deliverys 아이콘을 띄위 위해 Stack으로 구현
      body: Stack(
        children: [
          /// Tip : Sliver 위젯들을 이용하려면 CustomScrollView를 사용해야 합니다.
          CustomScrollView(
            slivers: [
              /// Tip : 스크롤시 배경이 사라지게 만들려면 SliverAppBar 위젯을 사용하면 됩니다.
              SliverAppBar(
                automaticallyImplyLeading: false, // 뒤로가기 버튼 숨기기
                pinned: true, // 스크롤시 bottom 영역을 화면 상단에 남길지 여부
                snap: false, // 중간에 멈출 때 자동으로 AppBar를 펼쳐서 배경을 모두 보여줄지
                floating: true, // AppBar를 화면에 띄울지, 아니면 컬럼처럼 최 상단에 놓을지
                expandedHeight: 252, // 최대 확장되었을 떄 높이
                backgroundColor: Colors.white,

                /// 스크롤시 사라지는 영역
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Stack(
                    children: [
                      /// 백그라운드 이미지
                      Positioned.fill(
                        bottom: 60,
                        child: Image.network(
                          backImg,
                          fit: BoxFit.fill,
                        ),
                      ),

                      /// 배경 위 위젯
                      Positioned(
                        left: 24,
                        right: 24,
                        bottom: 60,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "한 해의 마무리,\n수고 많았어요💖",
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 32),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                /// Tip: LinearProgressIndicator가 끝없이 길어지지 않도록 Column의 가로 길이를 Row의 남은 자리만큼만 차지하도록 만들어줌
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "11 ★ until next Reward",
                                        style: TextStyle(
                                          color: starbucksAccentColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 16),

                                      /// Tip : LinearProgressIndicator는 각져있는데, 둥글게 보이도록 모서리를 잘라냄
                                      ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        child: LinearProgressIndicator(
                                          backgroundColor:
                                              Colors.grey.withOpacity(0.2),
                                          value: 0.083,
                                          minHeight: 10,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            starbucksAccentColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 16),
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    // 공통 스타일
                                    style: const TextStyle(
                                      fontSize: 28,
                                      color: Colors
                                          .black, // RichText는 기본이 흰색이라 안보임
                                    ),
                                    children: [
                                      const TextSpan(
                                        text: "1",
                                        style: TextStyle(
                                          fontSize: 38,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const TextSpan(
                                        text: " / ",
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "12 ★",
                                        style: TextStyle(
                                          color: starbucksAccentColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                /// 스크롤시 남아있는 영역
                /// SliverAppBar의 bottom은 PreferredSize 위젯으로 시작해야만 합니다.
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(52), // 영역 높이
                  child: Container(
                    height: 52,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 24,
                        right: 12,
                      ),
                      child: Row(
                        children: [
                          /// What's New
                          GestureDetector(
                            onTap: () => print("What's New 클릭 됨"),
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.mail_outline,
                                  color: Colors.grey,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  "What's New",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 32),

                          /// Coupon
                          GestureDetector(
                            onTap: () => print("Coupon 클릭 됨"),
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.confirmation_num_outlined,
                                  color: Colors.grey,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  "Coupon",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),

                          /// Alarm
                          Stack(
                            children: [
                              const Icon(
                                Icons.notifications_outlined,
                                color: Colors.grey,
                                size: 32,
                              ),
                              Positioned(
                                right: 2,
                                top: 2,
                                child: CircleAvatar(
                                  radius: 5,
                                  backgroundColor: starbucksPrimaryColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              /// Tip : CustomScrollView 안에서는 모든 첫 번째 위젯이 Sliver로 구현 되어야합니다.
              /// SliverToBoxAdapter는 Container 같은 위젯이라고 보시면 됩니다.

              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Frequency
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 18,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          frequencyImg,
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),

                    /// 추천 메뉴 Title
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          // 공통 스타일
                          style: const TextStyle(
                            fontSize: 28,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                            TextSpan(
                              text: "이찬호",
                              style: TextStyle(
                                color: starbucksAccentColor,
                              ),
                            ),
                            const TextSpan(text: "님을 위한 추천 메뉴"),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 32),

                    /// 추천 메뉴 horizontal list view
                    SizedBox(
                      height: 150, // 높이를 가져야 ListView를 Column 안에 넣을 수 있습니다.
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal, // 횡스크롤
                        itemCount: 100,
                        itemBuilder: (context, index) {
                          final menu =
                              recommendMenu[index % recommendMenu.length];
                          final name = menu["name"] ?? "이름";
                          final imgUrl = menu["imgUrl"] ?? "";
                          return SizedBox(
                            width: 128,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CircleAvatar(
                                  radius: 52,
                                  // Tip : circleAvatar 배경에 맞춰서 동그랗게 이미지 넣는 방법
                                  backgroundImage: NetworkImage(imgUrl),
                                  backgroundColor: Colors.transparent,
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  name,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 13.8,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),

                    /// Event
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 18,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          eventImg,
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ],
          ),

          /// Deliverys
          Positioned(
            bottom: 18,
            right: 24,
            child: GestureDetector(
              onTap: () => print("Deliverys 클릭 됨"),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: starbucksPrimaryColor,
                  borderRadius: BorderRadius.circular(64),
                ),
                child: const Row(
                  children: [
                    Text(
                      "Deliverys",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(
                      Icons.pedal_bike_outlined,
                      color: Colors.white,
                      size: 28,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// 두 번쨰 페이지
class StarbucksSecondPage extends StatelessWidget {
  const StarbucksSecondPage({super.key});

  // 카드 이미지
  final String cardImgUrl = "https://i.ibb.co/BgfYHg4/2021-12-16-1-49-51.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Pay",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              print("Pay 우측 상단 아이콘 클릭 됨");
            },
            icon: const Icon(
              Icons.list_rounded,
              color: Colors.grey,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Card
          Expanded(
            // Tip : 스크롤하는데 스냅이 걸려서 해당 항목이 화면 중앙에 보이는 경우 PageView 위젯을 사용합니다.
            child: PageView.builder(
              controller: PageController(
                viewportFraction: 0.85,
              ), // 옆에 항목 살짝 보이게
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(2),
                    // 그림자
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        // 광원의 위치를 중심(0, 0)보다 위쪽(0, 5)
                        offset: const Offset(0, 5),
                        spreadRadius: 1,
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: Image.network(cardImgUrl),
                );
              },
            ),
          ),

          /// Coupon & e-Gift Item
          Container(
            height: 72,
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () => print("Coupone 선택 됨"),
                    child: const Text(
                      "Coupon",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 12,
                  width: 1,
                  color: Colors.grey,
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () => print("e-Gift Item 선택 됨"),
                    child: const Text(
                      "e-Gift Item",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// 세 번째 페이지
class StarbucksThirdPage extends StatelessWidget {
  const StarbucksThirdPage({super.key});

  /// 전체 메뉴
  final List<Map<String, String>> menu = const [
    {
      "ko": "추천",
      "en": "Recommend",
      "imgUrl": "https://i.ibb.co/SwGPpzR/9200000003687-20211118142543832.jpg",
    },
    {
      "ko": "리저브 에스프레소",
      "en": "Reserve Espresso",
      "imgUrl": "https://i.ibb.co/JHVXZ72/9200000003690-20211118142702357.jpg",
    },
    {
      "ko": "리저브 드립",
      "en": "Reserve Drip",
      "imgUrl": "https://i.ibb.co/M91G17c/9200000003693-20211118142933650.jpg",
    },
    {
      "ko": "콜드브루",
      "en": "ColdBrew",
      "imgUrl": "https://i.ibb.co/jyZK4C9/9200000003696-20211118143125337.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    /// Tip : TabBar controller를 직접 TabBar에 넣어줄 수도 있고, 아래와 같이 위젯으로 감싸줄 수도 있습니다.
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Order",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              onPressed: () {
                print("Pay 우측 상단 아이콘 클릭 됨");
              },
              icon: const Icon(
                Icons.search_outlined,
                color: Colors.grey,
              ),
            ),
          ],

          /// Tip : AppBar 하단에 TabBar를 만들어 줍니다.
          bottom: TabBar(
            isScrollable: false,
            indicatorColor: starbucksPrimaryColor,
            indicatorWeight: 4,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            labelStyle:
                const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            tabs: const [
              Tab(text: "전체 메뉴"),
              Tab(text: "나만의 메뉴"),
              Tab(text: "🎂 홀케이크"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            /// 전체 메뉴
            ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                final item = menu[index % menu.length];
                final ko = item["ko"] ?? "제목";
                final en = item["en"] ?? "title";
                final imgUrl = item["imgUrl"] ?? "";
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 21,
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 52,
                        // Tip : circleAvatar 배경에 맞춰서 동그랗게 이미지 넣는 방법
                        backgroundImage: NetworkImage(imgUrl),
                        backgroundColor: Colors.transparent,
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ko,
                            style: const TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            en,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),

            /// 나만의 메뉴
            const Center(child: Text("나만의 메뉴")),

            /// 홀케이크 예약
            const Center(child: Text("홀케이크 예약")),
          ],
        ),
      ),
    );
  }
}
