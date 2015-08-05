function addOneTableRow($table,cols){
   var $row = $("<tr>");
   for (var i=0; i<cols.length; i++){
      var $col = $("<td>").html(cols[i]);
      $row.append($col);
   }
   $table.append($row);
}
