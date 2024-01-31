document.addEventListener("DOMContentLoaded", function () {
    // Function to fetch and display market data
    function fetchAndDisplayMarkets(appendToContainer) {
        // Fetch market data from the server
        fetch("get_markets.php")
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    const container = document.getElementById("container");

                    // Loop through the retrieved markets and create elements
                    data.markets.forEach(market => {
                        const newMarketElement = createMarketElement(market.name, market.imageURL);
                        if (appendToContainer) {
                            appendToContainer.appendChild(newMarketElement);
                        } else {
                            container.appendChild(newMarketElement);
                        }
                    });
                } else {
                    alert("Failed to fetch market data. Please try again.");
                }
            })
            .catch(error => {
                console.error(error);
            });
    }

    // Function to create a market element with "Edit" and "Delete" buttons
    function createMarketElement(marketName, imageURL) {
        const newMarketElement = document.createElement("div");
        newMarketElement.classList.add("col-md-4");

        const marketTypeElement = document.createElement("p");
        marketTypeElement.classList.add("market-type");
        marketTypeElement.textContent = marketName;
        marketTypeElement.setAttribute("data-market", marketName);

        const marketLinkElement = document.createElement("a");
        marketLinkElement.href = `view.php?market=${marketName.toLowerCase().replace(/\s/g, " ")}`;
        marketLinkElement.classList.add("square-link");
        marketLinkElement.style.backgroundImage = `url('${removeLocalhost(imageURL)}')`;
        marketLinkElement.style.color = "green";
        marketLinkElement.setAttribute("data-market", marketName);

        // Create edit button
        const editButton = document.createElement("button");
        editButton.textContent = "Edit";
        editButton.style.backgroundColor = "#007bff";
        editButton.style.color = "#fff";
        editButton.style.border = "none";
        editButton.style.padding = "10px 20px";
        editButton.style.marginRight = "10px";
        editButton.style.cursor = "pointer";
        editButton.style.transition = "background-color 0.3s";

        editButton.addEventListener("click", function () {
            const newImageURL = prompt("Enter the new URL of the market image:");
            if (newImageURL) {
                // Call the function to edit the market image
                editMarketImage(marketName, newImageURL);
            }
        });

        // Create delete button
        const deleteButton = document.createElement("button");
        deleteButton.textContent = "Delete";
        deleteButton.style.backgroundColor = "#dc3545";
        deleteButton.style.color = "#fff";
        deleteButton.style.border = "none";
        deleteButton.style.padding = "10px 20px";
        deleteButton.style.cursor = "pointer";
        deleteButton.style.transition = "background-color 0.3s";

        deleteButton.addEventListener("click", function () {
            const confirmation = confirm("Are you sure you want to delete this market?");
            if (confirmation) {
                // Call the function to delete the market
                deleteMarket(marketName);
            }
        });

        newMarketElement.appendChild(marketTypeElement);
        newMarketElement.appendChild(marketLinkElement);
        newMarketElement.appendChild(editButton);
        newMarketElement.appendChild(deleteButton);

        return newMarketElement;
    }

    // Function to delete the market
    function deleteMarket(marketName) {
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
                    // Remove the deleted market from the client-side representation
                    const container = document.getElementById("container");
                    const marketElement = document.querySelector(`.market-type[data-market="${marketName}"]`).parentElement;
                    container.removeChild(marketElement);
                } else {
                    alert("Failed to delete the market. Please try again.");
                }
            })
            .catch(error => {
                console.error(error);
            });
    }

    // Function to edit the market image
    function editMarketImage(marketName, newImageURL) {
        // Send a request to the server to edit the market image
        fetch("update_market.php", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify({
                name: marketName,
                imageURL: newImageURL,
            }),
        })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    // Update the market image in the client-side representation
                    const marketLinkElement = document.querySelector(`a.square-link[data-market="${marketName}"]`);
                    marketLinkElement.style.backgroundImage = `url('${removeLocalhost(newImageURL)}')`; 
                    marketLinkElement.style.color = "green";
                } else {
                    alert("Failed to edit the market image. Please try again.");
                }
            })
            .catch(error => {
                console.error(error);
            });
    }

    // Function to remove localhost from URLs
    function removeLocalhost(url) {
        return url.replace("http://localhost/", ""); 
    }

    // Add event listener to the Add Market link
    const addMarketLink = document.getElementById("addMarketLink");
    addMarketLink.addEventListener("click", function () {
        // Prompt the user for the new market name and image URL
        const newMarketName = prompt("Enter the new market name:");
        const newMarketImageURL = prompt("Enter the URL of the market image:");

        if (newMarketName && newMarketImageURL) {
            // Send a request to the server to add the new market
            fetch("add_market.php", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                },
                body: JSON.stringify({
                    name: newMarketName,
                    imageURL: newMarketImageURL,
                }),
            })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        // Create a new market element and add it to the client-side representation
                        const container = document.getElementById("container");
                        const newMarketElement = createMarketElement(newMarketName, newMarketImageURL);
                        container.appendChild(newMarketElement);
                    } else {
                        alert("Failed to add the market. Please try again.");
                    }
                })
                .catch(error => {
                    console.error(error);
                });
        }
    });

    // Fetch and display the initial market data
    fetchAndDisplayMarkets();
});
