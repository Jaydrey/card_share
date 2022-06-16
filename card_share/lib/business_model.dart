class BusinessModel {
  String? businessName;
  String? businessCategory;
  String? personName;
  String? businessNumber;
  String? businessLocation;
  String? businessCity;
  String? businessCode;
  // Map<String, dynamic> businessPosition = Map<String, dynamic>();
  BusinessModel({
    this.businessName,
    this.businessCategory,
    this.personName,
    this.businessNumber,
    this.businessLocation,
    this.businessCity,
    this.businessCode,
  });

  Map<String, dynamic> toJson() {
    var data = <String, dynamic>{};
    data["businessName"] = businessName;
    data["businessCategory"] = businessCategory;
    data["personName"] = personName;
    data["businessNumber"] = businessNumber;
    data["businessLocation"] = businessLocation;
    data["businessCity"] = businessCity;
    data["businessCode"] = businessCode;

    return data;
  }
}
