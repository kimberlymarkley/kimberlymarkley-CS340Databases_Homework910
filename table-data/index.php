<?php include '../header.php'; ?>

<main>

<?php
   $db = new SQLite3('hw9.db');
   if($db->connect_error) {
      die("Error: Could not connect to database. " . $db->connect_error);
   }


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

</main>

<?php mysqli_close($db); ?>

<?php include '../footer.php'; ?>