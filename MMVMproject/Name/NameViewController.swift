//
//  NameViewController.swift
//  MMVMproject
//
//  Created by 여누 on 7/9/24.
//

import UIKit
import SnapKit

class NameViewController : UIViewController {
    
    let imageView = UIImageView()
    let nameTextField = UITextField()
    let alertLabel = UILabel()
    let checkButton = UIButton()
    
    let viewmodel = NameViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configure()
        configureLayout()
        actiontext()
        bindData()
    }
    
    func bindData() {
        viewmodel.checkname.bind { value in
            self.alertLabel.text = value
        }
        
        viewmodel.namebool.bind { value in
            self.alertLabel.textColor = value ? .orange : .black
            self.checkButton.backgroundColor = value ? .orange : .lightGray
            self.checkButton.isEnabled = value
        }
    }
    
    func configure() {
        view.addSubview(imageView)
        view.addSubview(nameTextField)
        view.addSubview(alertLabel)
        view.addSubview(checkButton)
    }
    
    func configureLayout() {
        imageView.image = UIImage(systemName: "star")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .lightGray
        imageView.layer.borderWidth = 5
        imageView.layer.cornerRadius = 40
        imageView.layer.borderColor = UIColor.systemOrange.cgColor
        imageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(160)
            make.height.width.equalTo(80)
        }
        
//        nameTextField.backgroundColor = .blue
        nameTextField.placeholder = "닉네임을 입력해주세요 :)"
        nameTextField.textAlignment = .center
        nameTextField.font = .systemFont(ofSize: 18, weight: .bold)
        nameTextField.layer.cornerRadius = 5
        nameTextField.layer.borderWidth = 3
        nameTextField.layer.borderColor = UIColor.systemOrange.cgColor
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(40)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(80)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-80)
            make.height.equalTo(40)
            
        }
        alertLabel.text = "닉네임을 입력해주세요!"
        alertLabel.textColor = .black
        alertLabel.font = .systemFont(ofSize: 14, weight: .bold)
        alertLabel.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(5)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(80)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-80)
            make.height.equalTo(40)
        }
        
        checkButton.setTitle("확 인", for: .normal)
        checkButton.layer.cornerRadius = 5
        checkButton.tintColor = .white
        checkButton.backgroundColor = .lightGray
        checkButton.snp.makeConstraints { make in
            make.top.equalTo(alertLabel.snp.bottom).offset(20)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(120)
            make.height.equalTo(50)
        }
    }
    
    func actiontext() {
        nameTextField.addTarget(self, action: #selector(textFieldTapped), for: .editingChanged)
    }
    
    @objc func textFieldTapped() {
        print(#function, nameTextField.text)
        viewmodel.inputname.value = nameTextField.text
    }
}

