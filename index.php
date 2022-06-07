<?php include 'header.php'; ?>

<main>

<?php
   $db = new SQLite3('hw9.db');
   if($db->connect_error) {
      die("Error: Could not connect to database. " . $db->connect_error);
   }

//    For each table, write a query that returns any 5 records.
//    Use the command LIMIT 5 to control the result count.
//    You should return all attributes and the default attribute names using SELECT * syntax.
//    You may merely choose to return the first five records, or
//        use the WHERE clause to specify a more specific and interesting query.
//    Cite any and all real-world data sources (the URL) you use as a comment in your .sql file


$sql_planets = "SELECT * FROM PLANET ORDER BY RANDOM() LIMIT 5";
$planets = $db->query($sql_planets);

?>
<table id="motorcycles">
    <thead>
        <tr>
            <th>Planet ID</th>
            <th>Name</th>
            <th>Mass</th>
            <th>Diameter</th>
            <th>Gravity</th>
            <th>Orbital Period</th>
            <th>Day Length</th>
            <th>Dwarf Planet</th>
        </tr>
    </thead>
    <tbody>
        <?php
            while($row = $planets->fetchArray(SQLITE3_ASSOC)) {
                echo "<tr>";
                foreach($row as $field) {
                    echo "<td>$field</td>";
                }
                echo "</tr>";
            }
        ?>
        <tr>
            <td colspan="8">
                <a href="planets.php">View All Planets</a>
            </td>
        </tr>
    </tbody>
</table>



<form action="?" method="post">
    <input style="width: XX%" type="text" name="query" placeholder="SELECT * FROM TableName">
    <input type="submit" value="Execute Query">
</form>

<pre>
<?php 
    if (isset($_POST['query'])) {
        $query = $_POST['query'];
        $res = $db->query($query);
        while($row = $res->fetchArray(SQLITE3_ASSOC)) {
            print_r($row);
            echo "<br>";
        }
    }
?>
</pre>
</main>

<?php mysqli_close($db); ?>
<?php include 'footer.php'; ?>