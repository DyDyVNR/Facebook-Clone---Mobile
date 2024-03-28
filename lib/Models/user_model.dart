
class UserModel {
  String name;
  String image;
  String caption;
  String photo;
  String onlineTime;

  UserModel(this.name, this.image, this.photo, this.onlineTime, {this.caption = "no caption"});
  
}