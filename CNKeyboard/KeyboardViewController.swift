//
//  KeyboardViewController.swift
//  CNKeyboard
//
//  Created by Erica Millado on 5/9/17.
//  Copyright © 2017 Erica Millado. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    //8a - Note the keyboard button which will take us to our next available keyboard (i.e. emoji keyboard)
    @IBOutlet var nextKeyboardButton: UIButton!

    //9 -
    let chuckNorrisJokeLabel = UILabel()
    
    //10 -
    var button: UIButton!
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createLabel()
        createButton()
        
        //8b - this code from line 64-77 comes with your keyboard extension and controls the navigation to the next keyboard
        // Perform custom UI setup here
        self.nextKeyboardButton = UIButton(type: .system)
        self.nextKeyboardButton.setTitleColor(UIColor.lightGray, for: .normal)
        
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), for: [])
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        
        self.view.addSubview(self.nextKeyboardButton)
        
        self.nextKeyboardButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.nextKeyboardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    //11 -
    func createLabel() {
        chuckNorrisJokeLabel.backgroundColor = UIColor.clear
        chuckNorrisJokeLabel.text = "Chuck Norris is the reason Waldo is hiding."
        chuckNorrisJokeLabel.font = UIFont(name: "Avenir", size: 14)
        chuckNorrisJokeLabel.textColor = UIColor.white
        chuckNorrisJokeLabel.translatesAutoresizingMaskIntoConstraints = false
        chuckNorrisJokeLabel.isUserInteractionEnabled = true
        view.addSubview(chuckNorrisJokeLabel)
        chuckNorrisJokeLabel.isHidden = true
        chuckNorrisJokeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        chuckNorrisJokeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        chuckNorrisJokeLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.90).isActive = true
    }
    
    //12 -
    func createButton() {
        button = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        button.setTitle("Click For Quote", for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir", size: 18)!
        button.backgroundColor = UIColor(red:0.00, green:0.45, blue:0.74, alpha:1.0)
        button.isUserInteractionEnabled = true
        button.addTarget(self, action: #selector(ratingButtonTapped), for: .touchUpInside)
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6).isActive = true
    }
    
    //13 - 
    func ratingButtonTapped(_ button: UIButton) {
        chuckNorrisJokeLabel.isHidden = false
        view.backgroundColor = UIColor(red:0.00, green:0.64, blue:0.53, alpha:1.0)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }
    
    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
        
        var textColor: UIColor
        let proxy = self.textDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
            textColor = UIColor.white
        } else {
            textColor = UIColor.black
        }
        self.nextKeyboardButton.setTitleColor(textColor, for: [])
    }

}
