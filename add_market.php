<?php
include 'Connection.php' ;

// Get POST data
$data = json_decode(file_get_contents("php://input"));

if (isset($data->name) && isset($data->imageURL)) {
    $name = $conn->real_escape_string($data->name); // Sanitize input to prevent SQL injection
    $imageURL = $conn->real_escape_string($data->imageURL); // Sanitize input

    // Insert market data into the database
    $sql = "INSERT INTO markets (name, imageURL) VALUES ('$name', '$imageURL')";
    
    if ($conn->query($sql) === TRUE) {
        $response = ["success" => true];
        
        // Retrieve the newly added market data from the database
        $newMarketID = $conn->insert_id;
        $selectSQL = "SELECT name, imageURL FROM markets WHERE id = $newMarketID";
        $result = $conn->query($selectSQL);

        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            $response["market"] = $row;
        }
    } else {
        $response = ["success" => false, "error" => $conn->error];
    }

    // Return JSON response
    header("Content-Type: application/json");
    echo json_encode($response);
} else {
    $response = ["success" => false, "error" => "Invalid data"];
    header("Content-Type: application/json");
    echo json_encode($response);
}

$conn->close();
?>
