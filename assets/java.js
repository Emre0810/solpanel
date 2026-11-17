let cartCount = parseInt(localStorage.getItem("cartCount")) || 0;

// Visa antal i kundvagnen
document.getElementById("cart-count").innerText = cartCount;

// Hämta alla köpknappar
let buttons = document.querySelectorAll(".kund-button");

// När man klickar på en knapp
buttons.forEach(button => {

    button.addEventListener("click", function() {

        cartCount++;

        // Spara antalet
        localStorage.setItem("cartCount", cartCount);

        // Uppdatera kundvagnen
        document.getElementById("cart-count").innerText = cartCount;

    });

});