Table table;

void setup() {
  
  table = loadTable("universe.csv", "header");
  
  println(table.getRowCount() + " total rows in table"); 

  for (TableRow row : table.rows()) {
    
    int galaxyNum = row.getInt("galaxy_num");
    int systemNum = row.getInt("system_num");
    String name = row.getString("name");
    
    println(name + " (" + systemNum + ")");
  }
  
}
