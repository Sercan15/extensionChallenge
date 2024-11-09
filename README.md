<h1 style="color:#FF6347;">🌟 Extension Challenge Project</h1>

Welcome to the **Extension Challenge** project! This Swift application provides utility methods through extensions to perform tasks such as checking for palindromes, prime number validation, changing view colors, image toggling, and calculating days between dates. Designed for iOS, the app includes two main view controllers and a set of extensions for interactive and user-friendly functionality.

---

<h2 style="color:#4682B4;">📜 Table of Contents</h2>

1. <a href="#project-overview" style="color:#4682B4;">Project Overview</a>
2. <a href="#features" style="color:#4682B4;">Features</a>
3. <a href="#file-structure" style="color:#4682B4;">File Structure</a>
4. <a href="#extensions" style="color:#4682B4;">Extensions</a>
5. <a href="#usage-example" style="color:#4682B4;">Usage Example</a>

---

<h2 id="project-overview" style="color:#FF6347;">📖 Project Overview</h2>

The **Extension Challenge** project is a simple and interactive iOS app demonstrating the use of Swift extensions to enhance functionality across UI elements. The app allows users to input text and check if it's a palindrome, toggle images, validate if a number is prime, and calculate days between two dates.

---

<h2 id="features" style="color:#4682B4;">✨ Features</h2>

This project includes the following key features:

- **Palindrome Check**: Allows users to input text and check if it is a palindrome.
- **Prime Number Validation**: Verifies if a given number is prime.
- **Background Color and Button Color Cycling**: Changes the background and button colors through an interactive color array.
- **Image Toggle**: Switches between two images when a button is clicked.
- **Days Between Dates Calculation**: Calculates the number of days between two specified dates.

---

<h2 id="file-structure" style="color:#FF6347;">📂 File Structure</h2>

The core structure of this project includes:

- **ViewController.swift**: Manages the main view with text input for palindrome check, image toggling, and background color change features.
- **SecondViewController.swift**: Provides inputs for prime number validation and calculates the days between two dates.
- **Extensions**: Adds functionalities to `UIViewController`, `UILabel`, `UIImageView`, `UIButton`, `String`, `UIView`, `Int`, and `Date`.

---

<h2 id="extensions" style="color:#4682B4;">🏗️ Extensions</h2>

The project makes use of the following extensions:

1. **UIViewController**: Adds `changeBackgroundColor` for cycling background colors.
2. **UILabel**: Provides `changeText` to update the label's text and color.
3. **UIImageView**: Includes `changeImage` to toggle between two images.
4. **UIButton**: Adds `changeButtonColor` for cycling button background colors.
5. **String**: Implements `isPalindrome` to check if the text is a palindrome.
6. **UIView**: Adds another `changeBackgroundColor` for UIView elements.
7. **Int**: Contains `isPrime` to validate if the number is prime.
8. **Date**: Adds `dateFromString` to convert strings to dates and `daysBetween` to calculate days between two dates.

---

<h2 id="usage-example" style="color:#FF6347;">💡 Usage Example</h2>

Here’s an example usage of the main view controller to toggle images, check if a string is a palindrome, and change background colors:

```swift
// Palindrome Check Example
@IBAction func palindromeButton(_ sender: Any) {
    if let inputText = palindromeText.text, !inputText.isEmpty {
        let result = inputText.isPalindrome()
        let message = result ? "This text is a palindrome." : "This text is not a palindrome."
        showAlert(title: "Result", message: message)
    } else {
        showAlert(title: "Error", message: "Please enter text.")
    }
}

// Toggle Image Example
@IBAction func changeImage(_ sender: Any) {
    imageView.changeImage(imageOne: "image", imageTwo: "imageSecond")
}

// Background Color Change Example
@IBAction func changeColor(_ sender: Any) {
    view.changeBackgroundColor(colors: colors, index: &currentColorIndex)
}
