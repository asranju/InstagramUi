class InstaModel {
  String _id = "";
  String _channelname = "";
  String _title = "";
  String _highThumbnail = "";
  String _lowThumbnail = "";
  String _mediumThumbnail = "";
  bool _bmark = false;
  List<Null> _tags = [];

  InstaModel(
      String id,
      String channelname,
      String title,
      String highThumbnail,
      String lowThumbnail,
      String mediumThumbnail,
      List<Null> tags,
      bool bmark) {
    this._id = id;
    this._channelname = channelname;
    this._title = title;
    this._highThumbnail = highThumbnail;
    this._lowThumbnail = lowThumbnail;
    this._mediumThumbnail = mediumThumbnail;
    this._tags = tags;
    this._bmark = bmark;
  }

  bool get bmark => _bmark;
  set bmark(bool bmark) => _bmark = bmark;
  String get id => _id;
  set id(String id) => _id = id;
  String get channelname => _channelname;
  set channelname(String channelname) => _channelname = channelname;
  String get title => _title;
  set title(String title) => _title = title;
  String get highThumbnail => _highThumbnail;
  set highThumbnail(String highThumbnail) => _highThumbnail = highThumbnail;
  String get lowThumbnail => _lowThumbnail;
  set lowThumbnail(String lowThumbnail) => _lowThumbnail = lowThumbnail;
  String get mediumThumbnail => _mediumThumbnail;
  set mediumThumbnail(String mediumThumbnail) =>
      _mediumThumbnail = mediumThumbnail;
  List<Null> get tags => _tags;
  set tags(List<Null> tags) => _tags = tags;

  InstaModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _channelname = json['channelname'];
    _title = json['title'];
    _highThumbnail = json['high thumbnail'];
    _lowThumbnail = json['low thumbnail'];
    _mediumThumbnail = json['medium thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['channelname'] = this._channelname;
    data['title'] = this._title;
    data['high thumbnail'] = this._highThumbnail;
    data['low thumbnail'] = this._lowThumbnail;
    data['medium thumbnail'] = this._mediumThumbnail;

    return data;
  }
}
