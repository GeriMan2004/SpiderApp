import UIKit

struct LoginForm {
    
    let email: String
    let password: String
    
    enum ValidationResult {
        case emptyEmail
        case invalidEmail
        case shortPassword
        case success
    }
    
    var validationResult: ValidationResult {
        
        if email.isEmpty {
            return .emptyEmail
        }
        
        if !email.contains("@") || !email.contains(".") {
            return .invalidEmail
        }
        
        if password.count < 8 {
            return .shortPassword
        }
        
        return .success
    }
}

final class ViewController: UIViewController {
    
    @IBOutlet private weak var messageLabel: UILabel!
    @IBOutlet private weak var emailField: UITextField!
    @IBOutlet private weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func loginTapped(_ sender: UIButton) {
        
        view.endEditing(true)
        
        let email = emailField.text ?? ""
        let password = passwordField.text ?? ""
        
        let form = LoginForm(
            email: email,
            password: password
        )
        
        switch form.validationResult {
            
        case .emptyEmail:
            messageLabel.text = "Enter your email"
            
        case .invalidEmail:
            messageLabel.text = "Enter a valid email"
            
        case .shortPassword:
            messageLabel.text = "Password must be at least 8 characters"
            
        case .success:
            messageLabel.text = "Login successful"
        }
    }
}
