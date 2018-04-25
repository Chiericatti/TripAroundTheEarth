//
//  AnswerViewController.swift
//  TripAroundTheEarth
//
//  Created by Pedro Henrique Chiericatti on 4/24/18.
//  Copyright © 2018 Pedro Henrique Chiericatti. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {

    // MARK: -  Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Test
        
        view.addSubview(answerView)
        view.backgroundColor = UIColor.clear
        answerView.addSubview(returnButton)
        answerView.addSubview(answerTextView)
        answerView.addSubview(resultTextView)
        answerView.addSubview(justGoImageView)
        setUpConstraints()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
       showResult()
        
    }
    
    // MARK: - Properties
    
    let justGoImageView: UIImageView = {
        
        let imageView = UIImageView(image: #imageLiteral(resourceName: "justGo"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let resultTextView: UITextView = {

        
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = UIColor.clear
        textView.sizeToFit()
        textView.tintColor = .black
        textView.textAlignment = .center
        textView.font = UIFont.boldSystemFont(ofSize: 34)

        return textView
    }()
    
    let answerTextView: UITextView = {
       
        let textView = UITextView()
        textView.text = "It will take you"
        textView.textColor = .blue
        textView.font = UIFont.boldSystemFont(ofSize: 30)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.textAlignment = .center
        textView.backgroundColor = .clear
        return textView
    }()
    
    let answerView: UIView = {
        
        let view = UIView()
        view.backgroundColor = UIColor(white: 1, alpha: 0.9)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let returnButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.setTitle("Return", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.blue
        button.tintColor = UIColor.white
        button.layer.cornerRadius = 13
        button.isUserInteractionEnabled = true
        button.addTarget(self, action: #selector(returnButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: - Functions
    
    func showResult() {
        guard let trip = TripController.shared.trip else { return }
        let result = Int(((25000) / (trip.speed * trip.duration)))
        if result <= 1 {
            resultTextView.text = "\(result) \(trip.timeInterval)"
        } else {
            resultTextView.text = "\(result) \(trip.timeInterval)\("s")"
        }
        
        
    }
    
    @objc func returnButtonTapped() {
        
        
        dismiss(animated: true, completion: nil)
//        ViewController.shared.dayButton.isUserInteractionEnabled = true
//        ViewController.shared.weekButton.isUserInteractionEnabled = true
//        ViewController.shared.monthButton.isUserInteractionEnabled = true
//        ViewController.shared.yearButton.isUserInteractionEnabled = true
    }
    
    func setUpConstraints() {
        
        // asnwer View Layout
        answerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        answerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        answerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        answerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        
        // return button Layout
        returnButton.bottomAnchor.constraint(equalTo: answerView.bottomAnchor, constant: -50).isActive = true
        returnButton.leadingAnchor.constraint(equalTo: answerView.leadingAnchor, constant: 50).isActive = true
        returnButton.trailingAnchor.constraint(equalTo: answerView.trailingAnchor, constant: -50).isActive = true
        
        // answer TextView Layout
        answerTextView.topAnchor.constraint(equalTo: answerView.topAnchor, constant: 50).isActive = true
        answerTextView.leadingAnchor.constraint(equalTo: answerView.leadingAnchor, constant: 40).isActive = true
        answerTextView.trailingAnchor.constraint(equalTo: answerView.trailingAnchor, constant: -40).isActive = true
        
        // result TextView Layout
        resultTextView.leadingAnchor.constraint(equalTo: answerView.leadingAnchor, constant: 50).isActive = true
        resultTextView.trailingAnchor.constraint(equalTo: answerView.trailingAnchor, constant: -50).isActive = true
        resultTextView.bottomAnchor.constraint(equalTo: returnButton.topAnchor, constant: -300).isActive = true
        resultTextView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        NSLayoutConstraint(item: justGoImageView, attribute: .bottom, relatedBy: .equal, toItem: returnButton, attribute: .top, multiplier: 1, constant: -5).isActive = true
        NSLayoutConstraint(item: justGoImageView, attribute: .top, relatedBy: .equal, toItem: resultTextView, attribute: .bottom, multiplier: 1, constant: 20).isActive = true
        NSLayoutConstraint(item: justGoImageView, attribute: .leading, relatedBy: .equal, toItem: answerView, attribute: .leading, multiplier: 1, constant: 5).isActive = true
        NSLayoutConstraint(item: justGoImageView, attribute: .trailing, relatedBy: .equal, toItem: answerView, attribute: .trailing, multiplier: 1, constant: -5).isActive = true
    }
}
































