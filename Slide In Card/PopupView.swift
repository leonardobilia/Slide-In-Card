//
//  PopupView.swift
//  Slide In Card
//
//  Created by Leonardo Bilia on 1/9/19.
//  Copyright © 2019 Leonardo Bilia. All rights reserved.
//

import UIKit

class PopupView: NSObject {
    
    private lazy var blackView: UIView = {
        let view = UIView()
        view.alpha = 0
        view.backgroundColor = UIColor(white: 0, alpha: 0.5)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismissSlider)))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var whiteView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.clipsToBounds = true
        view.layer.cornerRadius = 32
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismissSlider)))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var QRCodeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "qrcode")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var btcAddressLable: UILabel = {
        let label = UILabel()
        label.text = "3K4obP5qeg5AUk4ohtx1U61NmXD8yb1YsA"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.darkGray
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let window = UIApplication.shared.keyWindow
    private var whiteViewBottomAnchor: NSLayoutConstraint?
    
    override init() {
        super.init()
    }
    
    //MARK: actions
    @objc fileprivate func handleDismissSlider() {
        guard let window = window else { return }
        self.whiteViewBottomAnchor?.constant = 340
        
        UIView.animate(withDuration: 0.5) {
            self.blackView.alpha = 0
            window.layoutIfNeeded()
        }
    }

    //MARK: functions
    func startSlideAnimation() {
        guard let window = window else { return }
        self.whiteViewBottomAnchor?.constant = 0
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.blackView.alpha = 1
            window.layoutIfNeeded()
        }, completion: nil)
    }
    
    func setupPopupView() {
        guard let window = window else { return }
        
        window.addSubview(blackView)
        window.addSubview(whiteView)
        whiteView.addSubview(QRCodeImageView)
        whiteView.addSubview(btcAddressLable)
        
        blackView.topAnchor.constraint(equalTo: window.topAnchor).isActive = true
        blackView.leadingAnchor.constraint(equalTo: window.leadingAnchor).isActive = true
        blackView.trailingAnchor.constraint(equalTo: window.trailingAnchor).isActive = true
        blackView.bottomAnchor.constraint(equalTo: window.bottomAnchor).isActive = true
        
        whiteView.leadingAnchor.constraint(equalTo: window.leadingAnchor).isActive = true
        whiteView.trailingAnchor.constraint(equalTo: window.trailingAnchor).isActive = true
        whiteView.heightAnchor.constraint(equalToConstant: 340).isActive = true
        
        whiteViewBottomAnchor = whiteView.bottomAnchor.constraint(equalTo: window.bottomAnchor, constant: 340)
        whiteViewBottomAnchor?.isActive = true
        
        QRCodeImageView.centerXAnchor.constraint(equalTo: whiteView.centerXAnchor).isActive = true
        QRCodeImageView.centerYAnchor.constraint(equalTo: whiteView.centerYAnchor, constant: -16).isActive = true
        QRCodeImageView.widthAnchor.constraint(equalToConstant: 160).isActive = true
        QRCodeImageView.heightAnchor.constraint(equalToConstant: 160).isActive = true
        
        btcAddressLable.topAnchor.constraint(equalTo: QRCodeImageView.bottomAnchor, constant: 16).isActive = true
        btcAddressLable.centerXAnchor.constraint(equalTo: whiteView.centerXAnchor).isActive = true
        btcAddressLable.widthAnchor.constraint(equalTo: whiteView.widthAnchor, multiplier: 0.8).isActive = true
    }
}
