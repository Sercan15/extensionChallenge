//
//  ViewController.swift
//  extensionChallenge
//
//  Created by Sercan Yeşilyurt on 8.11.2024.
//
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var palindromeText: UITextField!
    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    let colors: [UIColor] = [.red, .blue, .green, .yellow, .purple]
    var currentColorIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func secondvcButton(_ sender: Any) {
        performSegue(withIdentifier: "secondVC", sender: nil)
    }
    
    @IBAction func changeImage(_ sender: Any) {
        imageView.changeImage(imageOne: "image", imageTwo: "imageSecond")
    }
    
    @IBAction func changeColor(_ sender: Any) {
        view.changeBackgroundColor(colors: colors, index: &currentColorIndex)
    }
    
    @IBAction func changeText(_ sender: Any) {
        labelText.changeText("Changed Text", color: .red)
    }
    
    @IBAction func palindromeButton(_ sender: Any) {
        if let inputText = palindromeText.text, !inputText.isEmpty {
            let result = inputText.isPalindrome()
            let message = result ? "Bu metin bir palindromdur." : "Bu metin bir palindrom değildir."
            showAlert(title: "Sonuç", message: message)
        } else {
            showAlert(title: "Hata", message: "Lütfen bir metin girin.")
        }
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func changeButtonColor(_ sender: UIButton) {
        sender.changeButtonColor(colors: colors, index: &currentColorIndex)
    }
}

extension UIViewController {
    func changeBackgroundColor(colors: [UIColor], index: inout Int) {
        view.backgroundColor = colors[index]
        index = (index + 1) % colors.count
    }
}

extension UILabel {
    func changeText(_ text: String, color: UIColor) {
        self.text = text
        self.textColor = color
    }
}

extension UIImageView {
    func changeImage(imageOne: String, imageTwo: String) {
        self.image = self.image == UIImage(named: imageOne) ? UIImage(named: imageTwo) : UIImage(named: imageOne)
    }
}

extension UIButton {
    func changeButtonColor(colors: [UIColor], index: inout Int) {
        self.backgroundColor = colors[index]
        index = (index + 1) % colors.count
    }
}

extension String {
    func isPalindrome() -> Bool {
        let cleanedString = self.lowercased().filter { $0.isLetter || $0.isNumber }
        return cleanedString == String(cleanedString.reversed())
    }
}

extension UIView {
    func changeBackgroundColor(colors: [UIColor], index: inout Int) {
        self.backgroundColor = colors[index]
        index = (index + 1) % colors.count
    }
}
