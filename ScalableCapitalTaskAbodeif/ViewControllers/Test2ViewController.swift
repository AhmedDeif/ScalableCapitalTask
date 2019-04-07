//
//  Test2ViewController.swift
//  ScalableCapitalTaskAbodeif
//
//  Created by Ahmed Abodeif on 2/27/19.
//  Copyright © 2019 Ahmed Abodeif. All rights reserved.
//

import UIKit

class Test2ViewController: UIViewController {
    

    
    let labelOne: UILabel = {
        let label = UILabel()
        label.text = "Scroll Top"
        label.backgroundColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labelTwo: UILabel = {
        let label = UILabel()
        label.text = "Scroll Bottom"
        label.backgroundColor = .green
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let scrollView: UIScrollView = {
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .cyan
        return v
    }()
    
    let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        return view
    }()
    
    private let topContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.gray
        return view
    }()
    
    private let curvedView: UIView = {
        let view = CurvedView(color: UIColor.gray)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // add the scroll view to self.view
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(contentView)
        contentView.addSubview(topContainerView)
        topContainerView.addSubview(curvedView)
        
        // constrain the scroll view to 8-pts on each side
        scrollView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 0).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        
        
        contentView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 0).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0).isActive = true
        contentView.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: 0).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0).isActive = true
        contentView.widthAnchor.constraint(equalTo: contentView.superview!.widthAnchor, multiplier: 1.0).isActive = true
        
        
        // TopSection Constrints
        topContainerView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        topContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        topContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
//        topContainerView.heightAnchor.constraint(equalToConstant: 2050).isActive = true

        // Top Section Subview constraints
        let height: CGFloat = 100
        curvedView.leadingAnchor.constraint(equalTo: topContainerView.leadingAnchor, constant: -20).isActive = true
        curvedView.trailingAnchor.constraint(equalTo: topContainerView.trailingAnchor, constant: 20).isActive = true
        curvedView.heightAnchor.constraint(equalToConstant: height).isActive = true
        curvedView.bottomAnchor.constraint(equalTo: topContainerView.bottomAnchor, constant: height / 2).isActive = true
        

        
        
        
        // add labelOne to the scroll view
        contentView.addSubview(labelOne)
        
        // constrain labelOne to left & top with 16-pts padding
        // this also defines the left & top of the scroll content
        labelOne.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16.0).isActive = true
        labelOne.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16.0).isActive = true
        
        // add labelTwo to the scroll view
        contentView.addSubview(labelTwo)
        
        // constrain labelTwo at 400-pts from the left
        labelTwo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4.0).isActive = true
        
        // constrain labelTwo at 1000-pts from the top
        labelTwo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 1000).isActive = true
        
        // constrain labelTwo to right & bottom with 16-pts padding
        labelTwo.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0).isActive = true
        labelTwo.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        
    }

}


class CurvedView: UIView {
    
    
    private var path: UIBezierPath!
    private let color: UIColor
    
    init(color: UIColor) {
        self.color = color
        super.init(frame: .zero)
        backgroundColor = .clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        color = .clear
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        self.path = UIBezierPath(ovalIn: self.bounds)
        color.setFill()
        path.fill()
    }
    
}
