//
//  ImageSlider.swift
//  Test
//
//  Created by Hermann Vallejo on 28/12/16.
//  Copyright © 2016 Hermann Vallejo. All rights reserved.
//

import UIKit

class ImageSlider : UIView {
    let defaultAnimationDuration = 0.5
    let defaultSlideChageTimeout = 3.0
    
    weak var delegate:ImageSliderDelegate?
    weak var dataSource:ImageSliderDataSource?
    
    var scrollView:UIScrollView!
    var slideTimeout:Double = 0.0
    var animationDuration:Double = 0.0
    
    func create(slideTimeout timeout:Double = 0, animationDuration animation:Double = 0) {
        let totalItems = delegate?.itemsCount()
        
        slideTimeout = validateAndGetTime(time: timeout, defaultValue: defaultSlideChageTimeout)
        animationDuration = validateAndGetTime(time: animationDuration, defaultValue: defaultAnimationDuration)
        
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        scrollView.delegate = self
        scrollView.autoresizesSubviews = false
        scrollView.isScrollEnabled = false
        
    }
}

// MARK: - Private Methods

extension ImageSlider {
    internal func validateAndGetTime(time:Double, defaultValue defaultTime:Double) -> Double {
        return time >= 0 ? time : defaultTime
    }
}

// MARK: - ScrollView Delegate

extension ImageSlider : UIScrollViewDelegate {
    
}
