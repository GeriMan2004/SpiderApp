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

struct LocalLoginService {

    let shouldSucceed: Bool

    func login() -> Bool {
        shouldSucceed
    }
}

final class ViewController: UIViewController {
    
    @IBOutlet private weak var messageLabel: UILabel!
    @IBOutlet private weak var emailField: UITextField!
    @IBOutlet private weak var passwordField: UITextField!

    private let loginService = LocalLoginService(shouldSucceed: true)
    
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
            guard loginService.login() else {
                messageLabel.text = "Login service unavailable"
                return
            }

            performSegue(withIdentifier: "showHome", sender: email)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            segue.identifier == "showHome",
            let home = segue.destination as? HomeViewController,
            let email = sender as? String
        else {
            return
        }

        home.email = email
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Login viewDidLoad")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Login viewWillAppear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("Login viewDidDisappear")
    }

    deinit {
        print("Login deinit")
    }
}
