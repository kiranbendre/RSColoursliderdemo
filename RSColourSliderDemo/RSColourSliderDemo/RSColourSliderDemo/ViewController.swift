//
//  ViewController.swift
//  RSColourSliderDemo
//
//  Created by Iphone XR on 03/01/23.
//

import UIKit
import RSColourSlider

class ViewController: UIViewController, RSColourSliderDelegate {
    
    lazy var colourSlider = RSColourSlider(frame: CGRect(x: 0, y: 350, width: self.view.bounds.width, height: 30))
    let colourView = UIView(frame: CGRect(x: 150, y: 150, width: 50, height: 50))
    let rgbLabel = UILabel()
    var neededColour = UIColor.blue
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        RGBLabel()
        ColrSliderUI()
        ColorUI()
        updateUI()
    }
    func RGBLabel(){
        
        rgbLabel.text = "Welcome to App"
        rgbLabel.numberOfLines = 0
        rgbLabel.textAlignment = .center
       // rgbLabel.sizeToFit()
        rgbLabel.backgroundColor = UIColor.clear
        self.view.addSubview(rgbLabel)
        rgbLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: rgbLabel, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 250).isActive = true
        NSLayoutConstraint(item: rgbLabel, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 20).isActive = true
        NSLayoutConstraint(item: rgbLabel, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: -20).isActive = true
    }
    func ColrSliderUI(){
        colourSlider.delegate = self
        colourSlider.setCornerRadius(by: colourSlider.bounds.height / 2)
        colourSlider.setSliderValueBy(colour: neededColour)
        view.addSubview(colourSlider)
    }
    func ColorUI(){
        colourView.layer.cornerRadius = colourView.bounds.height / 2
        colourView.clipsToBounds = true
        self.view.addSubview(colourView)
    }
   // view.backgroundColor = UIColor(red: 33.0/255, green: 40.0/255, blue: 64.0/255, alpha: 1.0)
    private func updateUI(){
        colourView.backgroundColor = neededColour
    }
    private func updateRGBALabel(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat){
        rgbLabel.text = "red: \(Int(r*100))%, green: \(Int(g*100))%,\nblue: \(Int(b*100))%, alpha: \(Int(a*100))%"
    }
    func colourValuesChanged(to red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        updateRGBALabel(r: red, g: green, b: blue, a: alpha)
    }
    
    //MARK: - COLOUR SLIDER DELEGATES
    
    //MARK:-It returns the UIColour when the slider changes values
    func colourGotten(colour: UIColor) {
        neededColour = colour
        updateUI()
    }
    func getCurrentValues(){
        //Get slider values whenever you need
        let valuesRGBA = colourSlider.getCurrentRGBAValues()
        
        updateRGBALabel(r: valuesRGBA.red, g: valuesRGBA.green, b: valuesRGBA.blue, a: valuesRGBA.alpha)
        
    }
    
    
}

