// Function to create a market element with "Edit" and "Delete" buttons
function createMarketElement(marketName, imageURL) {
    const newMarketElement = document.createElement("div");
    newMarketElement.classList.add("col-md-4");

    const marketTypeElement = document.createElement("p");
    marketTypeElement.classList.add("market-type");
    marketTypeElement.textContent = marketName;

    const marketLinkElement = document.createElement("a");
    marketLinkElement.href = `view.php?market=${marketName.toLowerCase().replace(/\s/g, "_")}`;
    marketLinkElement.classList.add("square-link");
    marketLinkElement.style.backgroundImage = `url('${imageURL}')`;

    // Create "Edit" button
    const editButton = document.createElement("button");
    editButton.textContent = "Edit";
    editButton.addEventListener("click", function () {
        // Prompt the user for a new image URL
        const newImageURL = prompt("Enter the new image URL:", imageURL);

        if (newImageURL !== null) {
            // Send a request to the server to update the image URL
            fetch("update_market.php", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                },
                body: JSON.stringify({
                    marketName: marketName,
                    imageURL: newImageURL,
                }),
            })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        // Update the image URL on the client-side
                        marketLinkElement.style.backgroundImage = `url('${newImageURL}')`;
                    } else {
                        alert("Failed to update the image URL. Please try again.");
                    }
                })
                .catch(error => {
                    console.error(error);
                });
        }
    });

    // Create "Delete" button
    const deleteButton = document.createElement("button");
    deleteButton.textContent = "Delete";
    deleteButton.addEventListener("click", function () {
        // Ask the user for confirmation before deleting
        const confirmDelete = confirm("Are you sure you want to delete this market?");
        
        if (confirmDelete) {
            // Send a request to the server to delete the market
            fetch("delete_market.php", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                },
                body: JSON.stringify({
                    marketName: marketName,
                }),
            })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        // Remove the market element from the client-side
                        newMarketElement.remove();
                    } else {
                        alert("Failed to delete the market. Please try again.");
                    }
                })
                .catch(error => {
                    console.error(error);
                });
        }
    });

    newMarketElement.appendChild(marketTypeElement);
    newMarketElement.appendChild(marketLinkElement);
    newMarketElement.appendChild(editButton);
    newMarketElement.appendChild(deleteButton);

    return newMarketElement;
}
