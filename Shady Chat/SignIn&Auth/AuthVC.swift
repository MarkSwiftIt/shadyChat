//
//  ViewController.swift
//  Shady Chat
//
//  Created by Mark Goncharov on 22.07.2022.
//

import UIKit

class AuthViewController: UIViewController {

    let shadyChatName = UIImageView(image: #imageLiteral(resourceName: "logo"), contentMode: .scaleAspectFit)
    
    let googleLabel = UILabel(text: "Get started with")
    let emailLabel = UILabel(text: "Or sign up with")
    let alreadyOnboardLabel = UILabel(text: "Alerady onboard?")
    
    let googleButton = UIButton(title: "Google", titleColor: .black, backgroundColor: .white, isShadow: true)
    let emailButton = UIButton(title: "Email", titleColor: .white, backgroundColor: .buttonDark())
    let loginButton = UIButton(title: "Login", titleColor: .buttonRed(), backgroundColor: .white, isShadow: true)

    let signUpVC = SignUpVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        googleButton.customizeGoogleButton()
        view.backgroundColor = .white
        setupConstraints()
        
        emailButton.addTarget(self, action: #selector(emailButtonTapped), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    @objc private func emailButtonTapped() {
        print(#function)
        present(<#T##viewControllerToPresent: UIViewController##UIViewController#>, animated: <#T##Bool#>)
    }
    
    @objc private func loginButtonTapped() {
        print(#function)
    }
}


//MARK: - Setup Constraints

extension AuthViewController {
    
    private func setupConstraints() {
        
        let googleView = ButtonFromView(label: googleLabel, button: googleButton)
        let emailView = ButtonFromView(label: emailLabel, button: emailButton)
        let loginView = ButtonFromView(label: alreadyOnboardLabel, button: loginButton)
        

        let stackView = UIStackView(arrangedSubviews: [googleView, emailView, loginView], axis: .vertical, spacing: 40)

        shadyChatName.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(shadyChatName)
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            shadyChatName.topAnchor.constraint(equalTo: view.topAnchor, constant: 140),
            shadyChatName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50)
        ]
        )
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: shadyChatName.bottomAnchor, constant: 110),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
    }
}


//MARK: - SwiftUI

import SwiftUI

struct ViewControllerProvider: PreviewProvider {
    
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = AuthViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<ViewControllerProvider.ContainerView>) -> AuthViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: ViewControllerProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<ViewControllerProvider.ContainerView>) {
            
        }
    }
}

