//
//  CoreDataCell.swift
//  CoreDataEX
//
//  Created by YJ on 12/17/24.
//

import UIKit
import SnapKit

final class CoreDataCell: UITableViewCell {
    static let id = "CoreDataCell"
    
    private let infoStackView = UIStackView()
    let nameLabel = UILabel()
    let genderLabel = UILabel()
    let ageLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubviews()
        setConstraints()
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        contentView.addSubview(infoStackView)
        infoStackView.addArrangedSubview(nameLabel)
        infoStackView.addArrangedSubview(genderLabel)
        infoStackView.addArrangedSubview(ageLabel)
    }
    
    func setConstraints() {
        infoStackView.snp.makeConstraints {
            $0.edges.equalTo(contentView.safeAreaLayoutGuide).inset(10)
        }
    }
    
    func configureUI() {
        contentView.backgroundColor = .white
        
        infoStackView.axis = .horizontal
        infoStackView.distribution = .fillEqually
    }
}
