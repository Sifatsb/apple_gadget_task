class LoginResponseModel {
  bool? result;
  String? token;

  LoginResponseModel({this.result, this.token});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    data['token'] = token;
    return data;
  }
}
