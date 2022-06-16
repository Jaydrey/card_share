class BusinessModel {
  String? businessName;
  String? businessType;
  String? businessCategory;
  String? personName;
  String? businessNumber;
  String? ownerEmail;
  String? businessLocation;
  String? businessCity;
  String? businessCode;
  // Map<String, dynamic> businessPosition = Map<String, dynamic>();
  BusinessModel({
    this.businessName,
    this.businessType,
    this.businessCategory,
    this.personName,
    this.businessNumber,
    this.ownerEmail,
    this.businessLocation,
    this.businessCity,
    this.businessCode,
  });

  Map<String, dynamic> toJson() {
    var data = <String, dynamic>{};
    data["businessName"] = businessName;
    data["businesstype"] = businessType;
    data["businessCategory"] = businessCategory;
    data["personName"] = personName;
    data["businessNumber"] = businessNumber;
    data["ownerEmail"] = ownerEmail;
    data["businessLocation"] = businessLocation;
    data["businessCity"] = businessCity;
    data["businessCode"] = businessCode;

    return data;
  }
}
