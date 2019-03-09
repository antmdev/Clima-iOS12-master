//
//  ChangeCityViewController.swift
//  WeatherApp
//
//  Created by Angela Yu on 23/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit


//Write the protocol declaration here:


//Protocol and delgate are just simply a way of two objects within different classes communicating with each other.
//I.e when you use import CoreLocation - that is the protocol - and when we tap into that using locationmanager.delegate - etc.
//Then we are using locationmanager object as a delegate - We use protocol to define our own protocol <-> delegate functions
//We need to trigger a message - whatever the user triggers in the second screen and pass it back to the first screen.
//Here we're basically saying the "contract" is , if you want to be the delgate - you have to be able to enter the required details
// for the ptorocol which is you must be able to enter userEnteredANewCityName method


protocol ChangeCityDelegate
{
    func userEnteredANewCityName (city: String)
}



class ChangeCityViewController: UIViewController {
    
    //Declare the delegate variable here:
    
    var delegate : ChangeCityDelegate?
    
    
    //optional variable so can be any format
    // we also need to update the WeatherVC class to ensure we are confirming with this delegate

    
    //This is the pre-linked IBOutlets to the text field:
    @IBOutlet weak var changeCityTextField: UITextField!

    
    //This is the IBAction that gets called when the user taps on the "Get Weather" button:
    @IBAction func getWeatherPressed(_ sender: AnyObject)
    {
        
        
        
        //1 Get the city name the user entered in the text field
        let cityName = changeCityTextField.text!
        
        
        //2 If we have a delegate set, call the method userEnteredANewCityName
        
        delegate?.userEnteredANewCityName(city: cityName)
        
        //? "optinal chaining" checking to see if the optional for ChangeCItyDelegate
        //it basically says if it contains a value carry on otherwise do nothing.
        
        //3 dismiss the Change City View Controller to go back to the WeatherViewController
        self.dismiss(animated: true, completion: nil)
        
        
    }
    

    
    //This is the IBAction that gets called when the user taps the back button. It dismisses the ChangeCityViewController.
    @IBAction func backButtonPressed(_ sender: AnyObject)
    {
        self.dismiss(animated: false, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        
        if segue.identifier == "getForecastPressed"
        {
            let destinationVC = segue.destination as! ForecastViewController
            
        }
    }
    
}
