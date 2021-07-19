class CountriesListModel {
  int? updated;
  String? country;
  CountryInfo? countryInfo;
  CountriesListModel({
    this.updated,
    this.country,
    this.countryInfo,
  });

  CountriesListModel.fromJson(Map json) {
    updated = json['updated'];
    country = json['country'];
    countryInfo = json['countryInfo'] != null
        ? new CountryInfo.fromJson(json['countryInfo'])
        : null;
  }

  Map toJson() {
    final Map data = new Map();
    data['updated'] = this.updated;
    data['country'] = this.country;
    if (this.countryInfo != null) {
      data['countryInfo'] = this.countryInfo?.toJson();
    }
    return data;
  }
}

class CountryInfo {
  int? iId;
  String? flag;

  CountryInfo({this.iId, this.flag});

  CountryInfo.fromJson(Map json) {
    iId = json['_id'];
    flag = json['flag'];
  }

  Map toJson() {
    final Map data = new Map();
    data['_id'] = this.iId;
    data['flag'] = this.flag;
    return data;
  }
}