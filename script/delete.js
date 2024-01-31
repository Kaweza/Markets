document.addEventListener("DOMContentLoaded", function () {
    // ...

    // Function to toggle the delete form visibility
    function toggleDeleteForm(marketName) {
        const deleteForm = document.getElementById("deleteForm");
        const deleteMarketType = document.getElementById("deleteMarketType");
        const deleteButton = document.getElementById("deleteButton");

        // Set the selected market name in the form
        deleteMarketType.textContent = `Are you sure you want to delete ${marketName}?`;

        // Show the delete form and button
        deleteForm.style.display = "block";
    }

    // Function to delete a market
    function deleteMarket(marketName) {
        if (confirm("Are you sure you want to delete this market?")) {
            // Send a request to the server to delete the market
            fetch("delete_market.php", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                },
                body: JSON.stringify({
                    name: marketName,
                }),
            })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        // Refresh the market list after deletion
                        fetchAndDisplayMarkets();
                    } else {
                        alert("Failed to delete the market. Please try again.");
                    }
                })
                .catch(error => {
                    console.error(error);
                });
        }
    }

    // ...

    // Inside the loop that displays markets, add a "Delete" link
    const deleteLink = document.createElement("a");
    deleteLink.href = "javascript:void(0);"; // Use a placeholder link
    deleteLink.textContent = "Delete";
    deleteLink.addEventListener("click", function () {
        toggleDeleteForm(market.name); // Show the delete form
    });
    newMarketElement.appendChild(deleteLink);

    // ...
});
