//
//  ModalViewController.swift
//  sample_modal
//
//  Created by chikari kobayashi on 2020/12/20.
//

import UIKit

protocol ModalViewControllerDelegate{
  func modalDidFinished(modalText: String)
}

class ModalViewController: UIViewController {

    var delegate: ModalViewControllerDelegate?
    var list: [String] = ["Hello", "Good morning", "Hi!!", "Good afternoon", "Good evening"]
    var text: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func closeButton(_ sender: Any) {
        text = list.randomElement()
        self.delegate?.modalDidFinished(modalText: text)
        dismiss(animated: true, completion: nil)
    }
  
}
