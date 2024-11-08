//
//  SecondViewController.swift
//  extensionChallenge
//
//  Created by Sercan Yeşilyurt on 8.11.2024.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var numberTextfield: UITextField!
    @IBOutlet weak var firstDateText: UITextField!
    @IBOutlet weak var secondDateText: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func primeNumberButton(_ sender: UIButton) {
        guard let inputText = numberTextfield.text, let number = Int(inputText), number > 1 else {
            showAlert(message: "Lütfen geçerli bir sayı girin")
            return
        }
        
        let message = number.isPrime() ? "\(number) sayısı asaldır." : "\(number) sayısı asal değildir."
        showAlert(message: message)
    }
    
    @IBAction func calculateButton(_ sender: Any) {
        guard let firstDateText = firstDateText.text, let firstDate = Date.dateFromString(firstDateText),
              let secondDateText = secondDateText.text, let secondDate = Date.dateFromString(secondDateText) else {
            showAlert(message: "Lütfen geçerli bir tarih girin (yyyy-MM-dd)")
            return
        }
        
        let daysBetween = firstDate.daysBetween(to: secondDate)
        resultLabel.text = "İki tarih arasında \(daysBetween) gün var."
    }
    
    func showAlert(message: String) {
        let alertController = UIAlertController(title: "Sonuç", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Tamam", style: .default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

extension Int {
    func isPrime() -> Bool {
        guard self > 1 else { return false }
        if self <= 3 { return true }
        if self % 2 == 0 || self % 3 == 0 { return false }
        
        for i in stride(from: 5, through: Int(sqrt(Double(self))), by: 2) {
            if self % i == 0 { return false }
        }
        return true
    }
}

extension Date {
    static func dateFromString(_ dateString: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.date(from: dateString)
    }
    
    func daysBetween(to date: Date) -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: self, to: date)
        return components.day ?? 0
    }
}
