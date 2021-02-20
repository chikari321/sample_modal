//
//  ViewController.swift
//  sample_modal
//
//  Created by chikari kobayashi on 2020/12/20.
//

import UIKit

class ViewController: UIViewController {
  
    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func modalButton(_ sender: AnyObject) {
        let modalVC = self.storyboard?.instantiateViewController(withIdentifier: "modal") as! ModalViewController
        modalVC.modalPresentationStyle = .custom
        modalVC.transitioningDelegate = self
        modalVC.modalTransitionStyle = .crossDissolve
        modalVC.delegate = self
        present(modalVC, animated: true, completion: nil)
    }
  
}

extension ViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return PresentationController(presentedViewController: presented, presenting: presenting)
    }
}

extension ViewController: ModalViewControllerDelegate {
    func modalDidFinished(modalText: String) {
        label.text = modalText
    }
}
