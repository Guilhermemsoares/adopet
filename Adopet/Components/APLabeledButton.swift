//
//  APLabeledButton.swift
//  Adopet
//
//  Created by Guilherme Moreira Soares on 18/05/26.
//

import UIKit

class APLabeledButton: UIView {
    
    private lazy var SignUpButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setTitle("Cadastrar", for: .normal)
        button.backgroundColor = UIColor(named: "ColorCoral")
        button.titleLabel?.font = .init(name: "Poppins-Bold", size: 18)
        button.layer.cornerRadius = 8
//        button.addTarget(self, action: #selector(signUpButton), for: .touchUpInside)
        return button
    }()
    
    private func setupView() {
        updateUI()
        addSubviews()
        setupConstraints()
    }
    
    private func updateUI() {
//        label.text = title
//        textField.placeholder = placeholder
//        textField.isSecureTextEntry = isSecureEntry
    }
    
    private func addSubviews() {
        addSubview(SignUpButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
//            label.leadingAnchor.constraint(equalTo: leadingAnchor),
//            label.topAnchor.constraint(equalTo: topAnchor),
//            label.trailingAnchor.constraint(equalTo: trailingAnchor),
//            
//            textField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 8),
//            textField.leadingAnchor.constraint(equalTo: leadingAnchor),
//            textField.trailingAnchor.constraint(equalTo: trailingAnchor),
//            textField.bottomAnchor.constraint(equalTo: bottomAnchor),
//            textField.heightAnchor.constraint(equalToConstant: 48.0)
        ])
    }
}
