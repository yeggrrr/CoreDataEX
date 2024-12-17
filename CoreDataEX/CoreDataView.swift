//
//  CoreDataView.swift
//  CoreDataEX
//
//  Created by YJ on 12/17/24.
//

import UIKit
import SnapKit

final class CoreDataView: UIView {
    let nameTextField = UITextField()
    let genderTextField = UITextField()
    let ageTextField = UITextField()
    let saveButton = UIButton()
    let tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        setConstraints()
        configureUI()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    func addSubviews() {
        addSubview(nameTextField)
        addSubview(genderTextField)
        addSubview(ageTextField)
        addSubview(saveButton)
        addSubview(tableView)
    }
    
    func setConstraints() {
        let safeArea = safeAreaLayoutGuide
        
        nameTextField.snp.makeConstraints {
            $0.top.horizontalEdges.equalTo(safeArea)
            $0.height.equalTo(35)
        }
        
        genderTextField.snp.makeConstraints {
            $0.top.equalTo(nameTextField.snp.bottom).offset(-1)
            $0.horizontalEdges.equalTo(safeArea)
            $0.height.equalTo(35)
        }
        
        ageTextField.snp.makeConstraints {
            $0.top.equalTo(genderTextField.snp.bottom).offset(-1)
            $0.horizontalEdges.equalTo(safeArea)
            $0.height.equalTo(35)
        }
        
        saveButton.snp.makeConstraints {
            $0.top.equalTo(ageTextField.snp.bottom)
            $0.horizontalEdges.equalTo(safeArea)
            $0.height.equalTo(35)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(saveButton.snp.bottom)
            $0.horizontalEdges.bottom.equalTo(safeArea)
        }
    }
    
    func configureUI() {
        backgroundColor = .white
        
        let namePaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: nameTextField.frame.height))
        nameTextField.leftView = namePaddingView
        nameTextField.leftViewMode = .always
        nameTextField.layer.borderWidth = 1
        nameTextField.layer.borderColor = UIColor.lightGray.cgColor
        nameTextField.placeholder = "이름을 입력해주세요."

        let genderPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: genderTextField.frame.height))
        genderTextField.leftView = genderPaddingView
        genderTextField.leftViewMode = .always
        genderTextField.layer.borderWidth = 1
        genderTextField.layer.borderColor = UIColor.lightGray.cgColor
        genderTextField.placeholder = "성별을 입력해주세요. (M / F)"

        let agePaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: ageTextField.frame.height))
        ageTextField.leftView = agePaddingView
        ageTextField.leftViewMode = .always
        ageTextField.layer.borderWidth = 1
        ageTextField.layer.borderColor = UIColor.lightGray.cgColor
        ageTextField.placeholder = "나이를 입력해주세요."

        
        saveButton.setTitle("저장", for: .normal)
        saveButton.setTitleColor(.black, for: .normal)
        saveButton.backgroundColor = .systemGray5
    }
}
