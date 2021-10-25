class Glitch
{
  String? msg;
  Glitch({this.msg});


  @override
  String toString()=> 'Glitch(msg: $msg)';
 

  @override
  bool operator ==(Object o)
  {
    if(identical(this , o)) return true;

     return o is Glitch && o.msg == msg;
  }
  @override 
  int get hashCode => msg.hashCode;
}



class NoInternetGlitch extends Glitch
{
  NoInternetGlitch() : super(msg: "Unable To Connect To Internet");
}