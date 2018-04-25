//
//  ViewController.swift
//  TripAroundTheEarth
//
//  Created by Pedro Henrique Chiericatti on 4/23/18.
//  Copyright © 2018 Pedro Henrique Chiericatti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Other Properties
    
    static var shared = ViewController()
    var timeIntervalButtonSelected: String?
    var speedButtonSelected: Double?
//    static var result: Double?

    
    let answerViewController = AnswerViewController()
    var dayButtonTappedToggled = false
    var weekButtonTappedToggled = false
    var monthButtonTappedToggled = false
    var yearButtonTappedToggled = false
    var walkButtonTappedToggled = false
    var runButtonTappedToggled = false
    var bikeButtonTappedToggled = false
    var driveButtonTappedToggled = false
    
    // MARK: - ImageViews
    
    let earthImageView: UIImageView = {
        
        let imageView = UIImageView(image: #imageLiteral(resourceName: "earth2"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: - TextFields
    
    let hourTextField: UITextField = {
        
        let textField = UITextField()
        textField.placeholder = "Enter number of hours..."
        textField.font = UIFont.boldSystemFont(ofSize: 18)
        textField.backgroundColor = UIColor(white: 1.0, alpha: 0.45)
        textField.layer.cornerRadius = 13
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .numberPad
        textField.textAlignment = .center
        return textField
    }()
    
    // MARK: - TextViews
    
    let hoursTextView: UITextView = {
        
        let textView = UITextView()
        textView.text = "hour(s)."
        textView.textColor = UIColor.white
        textView.font = UIFont.boldSystemFont(ofSize: 18)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.backgroundColor = UIColor.clear
        return textView
    }()
    
    let forTextView: UITextView = {
        
        let textView = UITextView()
        textView.text = "For"
        textView.textColor = UIColor.white
        textView.font = UIFont.boldSystemFont(ofSize: 18)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .left
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.backgroundColor = UIColor.clear
        return textView
    }()
    
    let questionTextView: UITextView = {
    
        let textView = UITextView()
        textView.text = "How long it will take to complete one trip around the Earth ?"
        textView.textColor = UIColor.white
        textView.font = UIFont.boldSystemFont(ofSize: 18)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.backgroundColor = UIColor.clear
        return textView
    }()
    
    let ifEveryTextView: UITextView = {
        
        let textView = UITextView()
        textView.text = "If every:"
        textView.textColor = .white
        textView.font = UIFont.boldSystemFont(ofSize: 18)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .left
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.backgroundColor = UIColor.clear
        return textView
    }()
    
    let iChooseTextView: UITextView = {
        
        let textView = UITextView()
        textView.text = "I choose to:"
        textView.textColor = .white
        textView.font = UIFont.boldSystemFont(ofSize: 18)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .left
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.backgroundColor = UIColor.clear
        return textView
    }()
    
    // MARK: - Buttons
    
    let calculateButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.setTitle("Calculate", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        button.tintColor = .white
        button.layer.cornerRadius = 13
        button.isUserInteractionEnabled = true
        button.addTarget(self, action: #selector(calculateButtonTapped), for: .touchUpInside)
        return button
    }()

    let driveButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.setTitle("Drive", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        button.tintColor = .white
        button.layer.cornerRadius = 13
        button.tag = 4
        button.addTarget(self, action: #selector(driveButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let bikeButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.setTitle("Bike", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        button.tintColor = .white
        button.layer.cornerRadius = 13
        button.tag = 3
        button.addTarget(self, action: #selector(bikeButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let runButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.setTitle("Run", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        button.tintColor = .white
        button.layer.cornerRadius = 13
        button.tag = 2
        button.addTarget(self, action: #selector(runButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let walkButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.setTitle("Walk", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        button.tintColor = .white
        button.layer.cornerRadius = 13
        button.tag = 1
        button.addTarget(self, action: #selector(walkButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let yearButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.setTitle("Year", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        button.tintColor = .white
        button.layer.cornerRadius = 13
        button.tag = 8
        button.addTarget(self, action: #selector(yearButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let monthButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.setTitle("Month", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        button.tintColor = .white
        button.layer.cornerRadius = 13
        button.tag = 7
        button.addTarget(self, action: #selector(monthButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let weekButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.setTitle("Week", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        button.tintColor = .white
        button.layer.cornerRadius = 13
        button.tag = 6
        button.addTarget(self, action: #selector(weekButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let dayButton: UIButton = {
       
        let button = UIButton(type:.system)
        button.setTitle("Day", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        button.tintColor = .white
        button.layer.cornerRadius = 13
        button.tag = 5
        button.addTarget(self, action: #selector(dayButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(earthImageView)
        view.addSubview(questionTextView)
        view.addSubview(iChooseTextView)
        view.addSubview(ifEveryTextView)
        view.addSubview(dayButton)
        view.addSubview(weekButton)
        view.addSubview(monthButton)
        view.addSubview(yearButton)
        view.addSubview(walkButton)
        view.addSubview(runButton)
        view.addSubview(bikeButton)
        view.addSubview(driveButton)
        view.addSubview(hourTextField)
        view.addSubview(forTextView)
        view.addSubview(hoursTextView)
        view.addSubview(calculateButton)
        
        setUpLayout()
    }

    // MARK: - Set speed and timeInterval functions
    
    func setSpeed() {
        
        speedButtonSelected = 0.0
        
        if walkButton.isUserInteractionEnabled == true {
            speedButtonSelected = 3.1
        } else if runButton.isUserInteractionEnabled == true {
            speedButtonSelected = 6.0
        } else if bikeButton.isUserInteractionEnabled == true {
            speedButtonSelected = 10.0
        } else if driveButton.isUserInteractionEnabled == true {
            speedButtonSelected = 65.0
        }
    }
    
    func setTimeIntervalValue() {
        
        timeIntervalButtonSelected = ""
        
        if dayButton.isUserInteractionEnabled == true {
            timeIntervalButtonSelected = dayButton.titleLabel?.text
        } else if weekButton.isUserInteractionEnabled == true {
            timeIntervalButtonSelected = weekButton.titleLabel?.text
        } else if monthButton.isUserInteractionEnabled == true {
            timeIntervalButtonSelected = monthButton.titleLabel?.text
        } else if yearButton.isUserInteractionEnabled == true {
            timeIntervalButtonSelected = yearButton.titleLabel?.text
        }
        
        print(timeIntervalButtonSelected!)
    }
    
    // MARK: - TimeInterval Functions
    
    @objc func dayButtonTapped(_ sender: UIButton ) {
        if dayButtonTappedToggled == false {
            print("false")
            dayButtonTappedToggled = true
            dayButton.backgroundColor = .white
            dayButton.tintColor = .blue
            weekButton.isUserInteractionEnabled = false
            monthButton.isUserInteractionEnabled = false
            yearButton.isUserInteractionEnabled = false
        } else if dayButtonTappedToggled == true {
            print("true")
            dayButtonTappedToggled = false
            dayButton.backgroundColor = .blue
            dayButton.tintColor = .white
            monthButton.isUserInteractionEnabled = true
            yearButton.isUserInteractionEnabled = true
            weekButton.isUserInteractionEnabled = true
        }
        setTimeIntervalValue()
    }
    
    @objc func weekButtonTapped() {
        if weekButtonTappedToggled == false {
            weekButtonTappedToggled = true
            weekButton.backgroundColor = .white
            weekButton.tintColor = .blue
            dayButton.isUserInteractionEnabled = false
            monthButton.isUserInteractionEnabled = false
            yearButton.isUserInteractionEnabled = false
        } else if weekButtonTappedToggled == true {
            weekButtonTappedToggled = false
            weekButton.backgroundColor = .blue
            weekButton.tintColor = .white
            monthButton.isUserInteractionEnabled = true
            yearButton.isUserInteractionEnabled = true
            dayButton.isUserInteractionEnabled = true
        }
        setTimeIntervalValue()
    }
    
    @objc func monthButtonTapped() {
        if monthButtonTappedToggled == false {
            monthButtonTappedToggled = true
            monthButton.backgroundColor = .white
            monthButton.tintColor = .blue
            weekButton.isUserInteractionEnabled = false
            dayButton.isUserInteractionEnabled = false
            yearButton.isUserInteractionEnabled = false
        } else if monthButtonTappedToggled == true {
            monthButtonTappedToggled = false
            monthButton.backgroundColor = .blue
            monthButton.tintColor = .white
            dayButton.isUserInteractionEnabled = true
            yearButton.isUserInteractionEnabled = true
            weekButton.isUserInteractionEnabled = true
        }
        setTimeIntervalValue()
    }
    
    @objc func yearButtonTapped() {
        if yearButtonTappedToggled == false {
            yearButtonTappedToggled = true
            yearButton.backgroundColor = .white
            yearButton.tintColor = .blue
            weekButton.isUserInteractionEnabled = false
            monthButton.isUserInteractionEnabled = false
            dayButton.isUserInteractionEnabled = false
        } else if yearButtonTappedToggled == true {
            yearButtonTappedToggled = false
            yearButton.backgroundColor = .blue
            yearButton.tintColor = .white
            dayButton.isUserInteractionEnabled = true
            monthButton.isUserInteractionEnabled = true
            weekButton.isUserInteractionEnabled = true
        }
        setTimeIntervalValue()
    }
    
    // MARK: - Speed Functions
    
    @objc func walkButtonTapped() {
        if walkButtonTappedToggled == false {
            walkButtonTappedToggled = true
            walkButton.backgroundColor = .white
            walkButton.tintColor = .blue
            runButton.isUserInteractionEnabled = false
            bikeButton.isUserInteractionEnabled = false
            driveButton.isUserInteractionEnabled = false
        } else if walkButtonTappedToggled == true {
            walkButtonTappedToggled = false
            walkButton.backgroundColor = .blue
            walkButton.tintColor = .white
            runButton.isUserInteractionEnabled = true
            bikeButton.isUserInteractionEnabled = true
            driveButton.isUserInteractionEnabled = true
        }
        setSpeed()
    }
    
    @objc func runButtonTapped() {
        if runButtonTappedToggled == false {
            runButtonTappedToggled = true
            runButton.backgroundColor = .white
            runButton.tintColor = .blue
            walkButton.isUserInteractionEnabled = false
            bikeButton.isUserInteractionEnabled = false
            driveButton.isUserInteractionEnabled = false
        } else if runButtonTappedToggled == true {
            runButtonTappedToggled = false
            runButton.backgroundColor = .blue
            runButton.tintColor = .white
            walkButton.isUserInteractionEnabled = true
            bikeButton.isUserInteractionEnabled = true
            driveButton.isUserInteractionEnabled = true
        }
        setSpeed()
    }
    
    @objc func bikeButtonTapped() {
        if bikeButtonTappedToggled == false {
            bikeButtonTappedToggled = true
            bikeButton.backgroundColor = .white
            bikeButton.tintColor = .blue
            runButton.isUserInteractionEnabled = false
            walkButton.isUserInteractionEnabled = false
            driveButton.isUserInteractionEnabled = false
        } else if bikeButtonTappedToggled == true {
            bikeButtonTappedToggled = false
            bikeButton.backgroundColor = .blue
            bikeButton.tintColor = .white
            runButton.isUserInteractionEnabled = true
            walkButton.isUserInteractionEnabled = true
            driveButton.isUserInteractionEnabled = true
        }
        setSpeed()
    }
    
    @objc func driveButtonTapped() {
        if driveButtonTappedToggled == false {
            driveButtonTappedToggled = true
            driveButton.backgroundColor = .white
            driveButton.tintColor = .blue
            runButton.isUserInteractionEnabled = false
            bikeButton.isUserInteractionEnabled = false
            walkButton.isUserInteractionEnabled = false
        } else if driveButtonTappedToggled == true {
            driveButtonTappedToggled = false
            driveButton.backgroundColor = .blue
            driveButton.tintColor = .white
            runButton.isUserInteractionEnabled = true
            bikeButton.isUserInteractionEnabled = true
            walkButton.isUserInteractionEnabled = true
        }
        setSpeed()
    }
    
    // MARK: - Calculate Button Function
    
    @objc func calculateButtonTapped() {
        
        guard let duration = hourTextField.text, let durationAsDouble = Double(duration) else { return }
        guard let timeInterval = timeIntervalButtonSelected else { return }
        guard let speed = speedButtonSelected else { return }
    
        TripController.shared.trip = Trip(speed: speed, timeInterval: timeInterval, duration: durationAsDouble)
        
        
        hourTextField.resignFirstResponder()
        answerViewController.modalPresentationStyle = .overCurrentContext
        
        present(answerViewController,animated: true, completion: nil)
        hourTextField.text = ""
        dayButton.isUserInteractionEnabled = true
        weekButton.isUserInteractionEnabled = true
        monthButton.isUserInteractionEnabled = true
        yearButton.isUserInteractionEnabled = true
        
    }
    
    // MARK: - Status Bar Function
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    // MARK: - Loyout
    
    private func setUpLayout() {
        
        // Image Layout
        earthImageView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        earthImageView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        
        // Question Text Layout
        questionTextView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        questionTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        questionTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true

        // ifEvery Text Layout
        ifEveryTextView.topAnchor.constraint(equalTo: questionTextView.bottomAnchor, constant: 20).isActive = true
        ifEveryTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        ifEveryTextView.rightAnchor.constraint(equalTo: dayButton.leftAnchor, constant: -5).isActive = true
        
        // iChoose Text Layout
        iChooseTextView.topAnchor.constraint(equalTo: dayButton.bottomAnchor, constant: 20).isActive = true
        iChooseTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        iChooseTextView.rightAnchor.constraint(equalTo: walkButton.leftAnchor, constant: -5).isActive = true
        
        // hourTextField Layout
        hourTextField.topAnchor.constraint(equalTo: iChooseTextView.bottomAnchor, constant: 260).isActive = true
        hourTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        hourTextField.widthAnchor.constraint(equalToConstant: 250).isActive = true
        
        // hoursTextView Layout
        hoursTextView.topAnchor.constraint(equalTo: iChooseTextView.bottomAnchor, constant: 260).isActive = true
        hoursTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        
        // forTextView Layout
        forTextView.topAnchor.constraint(equalTo: iChooseTextView.bottomAnchor, constant: 260).isActive = true
        forTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        forTextView.rightAnchor.constraint(equalTo: hourTextField.leftAnchor, constant: -10).isActive = true
        
        // Calculate Button
        calculateButton.topAnchor.constraint(equalTo: hourTextField.bottomAnchor, constant: 40).isActive = true
        calculateButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        calculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        calculateButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
       
        // Day Button Layout
        dayButton.topAnchor.constraint(equalTo: questionTextView.bottomAnchor, constant: 20).isActive = true
        dayButton.leadingAnchor.constraint(equalTo: ifEveryTextView.leadingAnchor, constant: 85).isActive = true
        dayButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        // Week Button Layout
        weekButton.topAnchor.constraint(equalTo: questionTextView.bottomAnchor, constant: 20).isActive = true
        weekButton.leadingAnchor.constraint(equalTo: dayButton.trailingAnchor, constant: 5).isActive = true
        weekButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        // Month Button Layout
        monthButton.topAnchor.constraint(equalTo: questionTextView.bottomAnchor, constant: 20).isActive = true
        monthButton.leadingAnchor.constraint(equalTo: weekButton.trailingAnchor, constant: 5).isActive = true
        monthButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        // Year Button Layout
        yearButton.topAnchor.constraint(equalTo: questionTextView.bottomAnchor, constant: 20).isActive = true
        yearButton.leadingAnchor.constraint(equalTo: monthButton.trailingAnchor, constant: 5).isActive = true
        yearButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        // Walk Button Layout
        walkButton.topAnchor.constraint(equalTo: dayButton.bottomAnchor, constant: 20).isActive = true
        walkButton.leadingAnchor.constraint(equalTo: iChooseTextView.leadingAnchor, constant: 115).isActive = true
        walkButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        // Run Button Layout
        runButton.topAnchor.constraint(equalTo: dayButton.bottomAnchor, constant: 20).isActive = true
        runButton.leadingAnchor.constraint(equalTo: walkButton.trailingAnchor, constant: 5).isActive = true
        runButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        // Bike Button Layout
        bikeButton.topAnchor.constraint(equalTo: dayButton.bottomAnchor, constant: 20).isActive = true
        bikeButton.leadingAnchor.constraint(equalTo: runButton.trailingAnchor, constant: 5).isActive = true
        bikeButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        // Drive Button Layout
        driveButton.topAnchor.constraint(equalTo: dayButton.bottomAnchor, constant: 20).isActive = true
        driveButton.leadingAnchor.constraint(equalTo: bikeButton.trailingAnchor, constant: 5).isActive = true
        driveButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
}






























