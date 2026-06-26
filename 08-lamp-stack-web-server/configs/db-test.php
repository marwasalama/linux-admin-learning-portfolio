<?php
$servername = "localhost";
$username = "lampuser";
$password = "LampPass123";
$dbname = "lamp_lab";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Database connection failed: " . $conn->connect_error);
}

echo "<h1>LAMP Stack Database Test</h1>";
echo "<p>Database connection successful.</p>";

$sql = "SELECT id, name, course FROM students";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    echo "<table border='1'>";
    echo "<tr><th>ID</th><th>Name</th><th>Course</th></tr>";

    while($row = $result->fetch_assoc()) {
        echo "<tr><td>" . $row["id"] . "</td><td>" . $row["name"] . "</td><td>" . $row["course"] . "</td></tr>";
    }

    echo "</table>";
} else {
    echo "No records found.";
}

$conn->close();
?>
