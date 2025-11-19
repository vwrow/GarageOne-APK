class VelgData {
  int id;
  String model;
  String description;

  String posterPath;
  VelgData({
    required this.id,
    required this.model,
    required this.description,

    required this.posterPath,
  }) : assert(model.trim().isNotEmpty, 'Model name must be provided');
}

List<VelgData> getInventory() {
  List<VelgData> inventory = [];
  inventory.add(
    VelgData(
      id: 1,
      model: "Rotobox Bullet",
      description:
          "A unique, top performance, one-piece carbon wheel with a daring look.",

      posterPath: "assets/Thumbnail/Rotobox-1.png",
    ),
  );
  inventory.add(
    VelgData(
      id: 2,
      model: "Yamaha R25 OEM",
      description: "Yamaha R25 OEM Rims.",

      posterPath: "assets/Thumbnail/R25.png",
    ),
  );
  inventory.add(
    VelgData(
      id: 3,
      model: "OZ Racing Piega",
      description:
          "Straight from OZ racing experience that uses forged technologys.",

      posterPath: "assets/Thumbnail/OZ-2.png",
    ),
  );
  inventory.add(
    VelgData(
      id: 4,
      model: "OZ Racing GASS",
      description:
          "From the WSBK circuits comes the lightest aluminum wheel for street uses.",

      posterPath: "assets/Thumbnail/OZ-1.png",
    ),
  );
  inventory.add(
    VelgData(
      id: 5,
      model: "Delkevic M8",
      description: "Velg CNC dengan palang 8 kompatibel untuk berbagai motor matic",

      posterPath: "assets/Thumbnail/M8.png",
    ),
  );
  inventory.add(
    VelgData(
      id: 6,
      model: "Rotobox Boost",
      description:
          "The BOOST stands out with its enormous strength, elegant design",

      posterPath: "assets/Thumbnail/Rotobox-2.png",
    ),
  );
  inventory.add(
    VelgData(
      id: 7,
      model: "VND AK55",
      description: "Velg CNC dengan panggilan bintang laudnya, kompatibel untuk berbagai motor",

      posterPath: "assets/Thumbnail/AK55.png",
    ),
  );
  inventory.add(
    VelgData(
      id: 8,
      model: "CMG MG7",
      description: "Velg CNC dengan palang 7 kompatibel untuk berbagai motor",

      posterPath: "assets/Thumbnail/MG7.png",
    ),
  );
  inventory.add(
    VelgData(
      id: 9,
      model: "RCB SP522",
      description: "Velg aloy palang 5 favoritnya motor kenchang",

      posterPath: "assets/Thumbnail/SP522.png",
    ),
  );
  return inventory;
}
