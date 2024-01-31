<?php
// Database connection settings
$host = "localhost";
$username = "root"; 
$password = ""; 
$database = "demo"; 

try {
    // Create a new PDO instance
    $pdo = new PDO("mysql:host=$host;dbname=$database", $username, $password);

    // Set the PDO error mode to exception
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    // Handle database connection errors
    die("Database connection failed: " . $e->getMessage());
}

// Check if the request method is POST
if ($_SERVER["REQUEST_METHOD"] === "POST") {
    // Get the market name and new image URL from the request body
    $data = json_decode(file_get_contents("php://input"));

    if ($data && isset($data->name) && isset($data->imageURL)) {
        $marketName = $data->name;
        $newImageURL = $data->imageURL;

        // Check if the image URL has changed
        $query = "SELECT imageURL FROM markets WHERE name = ?";
        $stmt = $pdo->prepare($query);
        $stmt->execute([$marketName]);
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        
        if ($row && $row['imageURL'] !== $newImageURL) {
            // Update the market's image URL in the database
            $updateQuery = "UPDATE markets SET imageURL = ? WHERE name = ?";
            $updateStmt = $pdo->prepare($updateQuery);
            
            if ($updateStmt->execute([$newImageURL, $marketName])) {
                // Return a success response
                $response = [
                    "success" => true,
                    "message" => "Market image URL updated successfully."
                ];
                echo json_encode($response);
            } else {
                // Return an error response
                $response = [
                    "success" => false,
                    "message" => "Failed to update market image URL."
                ];
                echo json_encode($response);
            }
        } else {
            // Image URL has not changed
            $response = [
                "success" => false,
                "message" => "Image URL remains the same."
            ];
            echo json_encode($response);
        }
    } else {
        // Invalid request data
        $response = [
            "success" => false,
            "message" => "Invalid request data."
        ];
        echo json_encode($response);
    }
} else {
    // Handle other HTTP methods if necessary
    http_response_code(405); // Method Not Allowed
}
?>
