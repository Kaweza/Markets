<?php
include 'Connection.php' ;

// Retrieve market data from the database
$sql = "SELECT * FROM markets";
$result = $conn->query($sql);

$response = ["success" => false];

if ($result->num_rows > 0) {
    $markets = [];
    while ($row = $result->fetch_assoc()) {
        $markets[] = [
            "name" => $row["name"],
            "imageURL" => $row["imageURL"]
        ];
    }
    $response = ["success" => true, "markets" => $markets];
}

// Return JSON response
header("Content-Type: application/json");
echo json_encode($response);

$conn->close();
?>
