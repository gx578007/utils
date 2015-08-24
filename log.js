var fs = require('fs'); 
var LogPrefix = 'IV-';
var LogPostfix = '.log';
var LogDir = './';
var LogName = '';

function ErrorLog(){
   var rst = '[[' + timeStr() + ']]  ';
   for (var i=0; i<arguments.length; i++){
      var arg = arguments[i];
      var sep = ' ';
      if (i===arguments.length-1) sep = '\n';
      rst += JSON.stringify(arg)+sep;
   }
   LogName = dateStr(); 
   var logname = LogDir+LogPrefix+LogName+LogPostfix;
   fs.appendFile(logname,rst,function(err){ if (err) console.log(err)});
   console.log.apply(null,arguments); 
}
function Log(){
   //var rst = '[[' + timeStr() + ']]  ';
   var rst = ''; 
   for (var i=0; i<arguments.length; i++){
      var arg = arguments[i];
      var sep = ' ';
      if (i===arguments.length-1) sep = '\n';
      rst += JSON.stringify(arg)+sep;
   }
   LogName = dateStr(); 
   var logname = LogPrefix+LogName+LogPostfix;
   fs.appendFile(logname,rst,function(err){ if (err) console.log(err)});
   //console.log(rst);
}
function dateStr(){
   var cur = new Date();
   var year = cur.getFullYear();
   var month = twoDigits(cur.getMonth()+1);
   var day = twoDigits(cur.getDay());
   return ''+year+month+day;
}
function timeStr(){
   var cur = new Date();
   var hour = twoDigits(cur.getHours());
   var minute = twoDigits(cur.getMinutes());
   var second = twoDigits(cur.getSeconds());
   return ''+hour+':'+minute+':'+second;
}
function twoDigits(input){
   if (input<10) return '0'+input;
   return ''+input;
}

exports.Log = Log;
