//
//  PresentationController.swift
//  sample_modal
//
//  Created by chikari kobayashi on 2020/12/20.
//

import UIKit

class PresentationController: UIPresentationController {
    
    var overlayView = UIView()

    override func presentationTransitionWillBegin() {
        guard let containerView = containerView else {
            return
        }
        presentedViewController.transitionCoordinator?.animate(alongsideTransition: {[weak self] context in
            self?.overlayView.backgroundColor = UIColor.init(hex: "#787878", alpha: 0.5)
            containerView.insertSubview(self!.overlayView, at: 0)
            }, completion:nil)
    }

    override func dismissalTransitionWillBegin() {
        presentedViewController.transitionCoordinator?.animate(alongsideTransition: {[weak self] context in
            self?.overlayView.alpha = 0.0
            }, completion:nil)
    }

    override func dismissalTransitionDidEnd(_ completed: Bool) {
        if completed {
            overlayView.removeFromSuperview()
        }
    }
    
    let margin = (x: CGFloat(60), y: CGFloat(600.0))
    
    override func size(forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
        return CGSize(width: parentSize.width - margin.x, height: parentSize.height - margin.y)
    }

    override var frameOfPresentedViewInContainerView: CGRect {
        var presentedViewFrame = CGRect()
        let containerBounds = containerView!.bounds
        let childContentSize = size(forChildContentContainer: presentedViewController, withParentContainerSize: containerBounds.size)
        presentedViewFrame.size = childContentSize
        presentedViewFrame.origin.x = margin.x / 2.0
        presentedViewFrame.origin.y = margin.y / 2.0

        return presentedViewFrame
    }

    override func containerViewWillLayoutSubviews() {
        overlayView.frame = containerView!.bounds
        presentedView?.frame = frameOfPresentedViewInContainerView
        presentedView?.layer.cornerRadius = 10
        presentedView?.clipsToBounds = true
    }

    @objc func overlayViewDidTouch(_ sender: UITapGestureRecognizer) {
        presentedViewController.dismiss(animated: true, completion: nil)
    }

}
