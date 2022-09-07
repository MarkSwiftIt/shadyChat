//
//  SetupProfileVC.swift
//  Shady Chat
//
//  Created by Mark Goncharov on 22.07.2022.
//

import UIKit

class SetupProfileVC: UIViewController {
        
    let welcomeLabel = UILabel(text: "Set up profile!", font: .avenir26())

    let fullNameLabel = UILabel(text: "Full name")
    let aboutMeLabel = UILabel(text: "About me")
    let sexLabel = UILabel(text: "Sex")

    let fullNameTextField = OneLineTextField(font: .avenir20())
    let aboutMeTextField = OneLineTextField(font: .avenir20())
    
    let segmentControll = UISegmentedControl(first: "Male", second: "Female")
    let goChartsButton = UIButton(title: "Go to Charts!", titleColor: .white, backgroundColor: .buttonDark(), cornerRadius: 4)
    
    let fullImageView = AddPhotoView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupConstraints()
    }
}


//MARK: - Setup Constraints

extension SetupProfileVC {
    
    private func setupConstraints() {
        
        let fullNameStackView = UIStackView(arrangedSubviews: [fullNameLabel, fullNameTextField], axis: .vertical, spacing: 0)
        let aboutMeStackView = UIStackView(arrangedSubviews: [aboutMeLabel, aboutMeTextField], axis: .vertical, spacing: 0)
        let sexStackView = UIStackView(arrangedSubviews: [sexLabel, segmentControll], axis: .vertical, spacing: 12)

        goChartsButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        let stackView = UIStackView(arrangedSubviews: [fullNameStackView,
                                                       aboutMeStackView,
                                                       sexStackView,
                                                       goChartsButton], axis: .vertical, spacing: 40)
        
        fullImageView.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(fullImageView)
        view.addSubview(stackView)
        view.addSubview(welcomeLabel)
        
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        )
        NSLayoutConstraint.activate([
            fullImageView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 40),
            fullImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        )
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: fullImageView.bottomAnchor, constant: 40),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ]
        )
    }
}


//MARK: - SwiftUI

import SwiftUI

struct SetupProfileVCVCProvider: PreviewProvider {

static var previews: some View {
ContainerView().edgesIgnoringSafeArea(.all)
}

struct ContainerView: UIViewControllerRepresentable {

let viewController = SetupProfileVC()

func makeUIViewController(context: UIViewControllerRepresentableContext<SetupProfileVCVCProvider.ContainerView>) -> SetupProfileVC {
    return viewController
}

func updateUIViewController(_ uiViewController: SetupProfileVCVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<SetupProfileVCVCProvider.ContainerView>) {
    
        }
    }
}

