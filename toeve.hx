
class Function1{
  var name:String;
  var length:Int;
  var location:Int;
  public function new(name,length,location){
    this.name=name;
    this.length=length;
    this.location=location;
  }
}

class Toeve {
  static public function main(){
    var s="function $2f1 p1\nfunction p1 $1f2 p2\nf1 p11v f2 p22v\nf1 p11v";
    var s1="function f1/1 p1\nfunction f2 p1 p2\nf2 p1v f1/1 p1v\nf1/1 p1v";
    trace(r2e(s));
  }
    
  static public function r2e(s){
    var s1=s;
    var lines:Array<String>=s1.split("\n");
    var defines=new Map();
    var functionType=new Map();
    var priority=new Map<String,String>();
    var sentence1=[];
    var para:Array<String>=new Array();
    var func:Array<Dynamic>=[];
    //var catalog=new Map();
    function a2s(a1:Array<String>){
      var a=a1.copy();
      var result="[";
      var function_name=a.shift().substring(1);
      result+="#"+function_name;
      for (i in 0...a.length){
        if(a[i].substr(0,1)=="["){
          result+=" "+defines[function_name][i]+":"+a[i];
        }
        else{
          // trace(function_name);
          // trace(i);
          // trace(a);
          // trace(defines);
          result+=" "+defines[function_name][i]+":"+"\""+a[i]+"\"";
        }
      }
      result+="]";
      return result;
    }
    function listIt3(){
      // trace(para);
      // trace(func);
      var thisFunction=func.pop();
      var name=thisFunction.name;
      var length=thisFunction.length;
      var location=thisFunction.location;
      var vars=para.splice(location,length);
      vars.unshift("#"+name);
      para.insert(location,a2s(vars));
    }
    function listIt2(){
      // trace(para);
      // trace(func);
      while (func.length>0){
        listIt3();
      }
    }
    function listIt1(input1:Array<String>){
      var input=input1.copy();
      if (input.length==0){return 1;};
      var word=input.shift();
      if (defines.exists(word)){
        while(
          func.length>0 
          && (para.length-func[func.length-1].location)==func[func.length-1].length
          && priority[word] <= priority[func[func.length-1].name]
        ){
          listIt3();
        }
        var function_length=defines[word].length;
        var function_location=para.length-functionType[word];
        func.push(new Function1(word,function_length,function_location));
      }
      else{
        para.push(word);
      }
      return listIt1(input);
    }
    function listIt(a){
      listIt1(a);
      listIt2();
      var result=para[0];
      para=[];
      return result;
    }


    //exec
    var result="```eve\ncommit";
    for (line in lines){
      var words=line.split(" ");
      var key="";
      var toRemove="";
      if (words[0]=="function"){
        words.shift();
        for (i in 0...words.length){
          if (words[i].substr(0,1)=="$"){
            toRemove=words[i];
            key=words[i].substring(2);
            functionType[key]=i;
            priority[key]=words[i].substr(1,1);
          }
        }
        words.remove(toRemove);
        defines[key]=words;
      }
      else{
        result+="\n"+listIt(words);
      }
    }
    result+="\n```";
    return result;
  }
}

