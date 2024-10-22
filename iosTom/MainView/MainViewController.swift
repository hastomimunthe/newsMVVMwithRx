//
//  MainViewController.swift
//  iosTom
//
//  Created by Hastomi Riduan Munthe on 22/10/24.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var titleHomeUiLabel: UILabel!
    @IBOutlet weak var userNameTitleLabel: UILabel!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTitleLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    let viewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupLoginButton()
    }
    
    override func viewDidLayoutSubviews() {
        setupUI()
    }

    func setupUI() {
        titleHomeUiLabel.text = "Welcome Home!"
        titleHomeUiLabel.font = .boldSystemFont(ofSize: 40)
        titleHomeUiLabel.textColor = .blue
        
        userNameTitleLabel.text = "Username"
        userNameTitleLabel.font = .systemFont(ofSize: 14)
        userNameTitleLabel.textColor = .black
        userNameTextField.placeholder = "Enter Username"
        
        passwordTitleLabel.text = "Password"
        passwordTitleLabel.font = .systemFont(ofSize: 14)
        passwordTitleLabel.textColor = .black
        passwordTextField.placeholder = "Enter Your Password"
        
        forgotPasswordButton.titleLabel?.text = "Forgot"
        
        loginButton.titleLabel?.text = "Login"
    }

    func setupLoginButton() {
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    @objc private func loginButtonTapped() {
        navToHomePageView()
    }
    
    private func navToHomePageView() {
        let homeVC = HomePageViewController(nibName: "HomePageViewController", bundle: nil)
         navigationController?.pushViewController(homeVC, animated: true)
    }
}
