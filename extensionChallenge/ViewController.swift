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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func secondButton(_ sender: Any) {
        performSegue(withIdentifier: "secondVC", sender: nil)
    }
    @IBAction func changeImage(_ sender: Any) {
        imageView.image = UIImage(named: "imageSecond")
        
    }
    @IBAction func changeColor(_ sender: Any) {
        view.backgroundColor = .brown
    }
    @IBAction func changeText(_ sender: Any) {
        labelText.text = "Changed Text"
        labelText.textColor = .red
    }
    @IBAction func palindromeButton(_ sender: Any) {
        
        if let inputText = palindromeText.text {
            // isPalindrome fonksiyonunu kullanarak kontrol et
            let result = inputText.isPalindrome()
            // Sonucu göster
            if result {
                showAlert(title: "Sonuç", message: "Bu metin bir palindromdur.")
            } else {
                showAlert(title: "Sonuç", message: "Bu metin bir palindrom değildir.")
            }
        }
        
        
    }
    
    // Basit bir uyarı mesajı göstermek için yardımcı fonksiyon
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
        
}

extension String {
    func isPalindrome() -> Bool {
        // Non-alphanumeric karakterleri kaldır ve küçük harfe çevir
        let cleanedString = self.lowercased().filter { $0.isLetter || $0.isNumber }
        
        // Tersine çevrilmiş halini karşılaştır
        return cleanedString == String(cleanedString.reversed())
    }
}
