function validateLogin(event) {
    event.preventDefault();

    let password = document.getElementById("password").value;

    if (password.length < 6) {
        alert("Password must be at least 6 characters");
        return;
    }

    alert("Login successful!");
    window.location.href = "Register.html";
}
