//
//  ViewController.swift
//  Slide In Card
//
//  Created by Leonardo Bilia on 1/9/19.
//  Copyright © 2019 Leonardo Bilia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private lazy var popupButton: UIButton = {
        let button = UIButton()
        button.setTitle("Pay with Bitcoin", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.layer.cornerRadius = 29
        button.clipsToBounds = true
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = UIColor(red: 245/255, green: 166/255, blue: 35/255, alpha: 1)
        button.addTarget(self, action: #selector(presentPopupViewHandler), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var popupView = PopupView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutHandler()
        popupView.setupPopupView()
    }
    
    @objc fileprivate func presentPopupViewHandler() {
        popupView.startSlideAnimation()
    }
    
    fileprivate func layoutHandler() {
        view.backgroundColor = UIColor(red: 32/255, green: 36/255, blue: 45/255, alpha: 1)
        
        view.addSubview(popupButton)
        popupButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        popupButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        popupButton.widthAnchor.constraint(equalToConstant: 255).isActive = true
        popupButton.heightAnchor.constraint(equalToConstant: 58).isActive = true
    }
}

