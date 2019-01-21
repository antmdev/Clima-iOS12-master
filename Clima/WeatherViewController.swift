//
//  ViewController.swift
//  WeatherApp
//
//  Created by Angela Yu on 23/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit
import CoreLocation //taps into GPS data! (Press optino key and click on it to read more)
import Alamofire
import SwiftyJSON



class WeatherViewController: UIViewController, CLLocationManagerDelegate {
    
    //Constants
    let WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather"
    let APP_ID = "f24215d49784b506df09879f04117d37" //KEY from Weather app
    /***Get your own App ID at https://openweathermap.org/appid ****/
    

    //TODO: Declare instance variables here
    
    let locationManager = CLLocationManager ()
    

    
    //Pre-linked IBOutlets
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //TODO:Set up the location manager here.
        
        locationManager.delegate = self                     // to automatically triangulate the coordinates using apple API
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters                   // accuracy of the geolocating
        locationManager.requestWhenInUseAuthorization()                 //ask user for permissions to request Data location
        locationManager.startUpdatingLocation()                  //Ascyncrhonous method to start finding location on launch
    
        
        
    }
    
    
    
    //MARK: - Networking
    /***************************************************************/
    
    //Write the getWeatherData method here:
    
    func getWeatherData(url: String, parameters: [String: String]) {
        
    }
    

    
    
    
    
    
    //MARK: - JSON Parsing
    /***************************************************************/
   
    
    //Write the updateWeatherData method here:
    

    
    
    
    //MARK: - UI Updates
    /***************************************************************/
    
    
    //Write the updateUIWithWeatherData method here:
    
    
    
    
    
    
    //MARK: - Location Manager Delegate Methods
    /***************************************************************/
    
    
    //Write the didUpdateLocations method here:
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[locations.count - 1]     //grab the last value which is the most accurate
        if  location.horizontalAccuracy > 0 {                          //ensures that the result is valid
            locationManager.stopUpdatingLocation()                    // kills using GPS to save battery
            
            print("longitude = \(location.coordinate.longitude), latitude = \(location.coordinate.latitude)") //grabbing lat and long
            
            let latitude = String(location.coordinate.latitude)       //assinging latitude and longitude to constants
            let longtitude = String(location.coordinate.longitude)
            
            let params : [String : String] = ["lat" : latitude, "lon" : longtitude, "appid" : APP_ID]
            
            // seeting a "dictionary" which is a Key:Value pair - so we set a STring:String dictionary, which means 'lon' is the key and the value is 'longtitude'
            // we have to go up to the longitude string and put it in brackets though to fix the "string" to "integer" value error.
            
            //ALAMOFIRE for URL HTTP requests
            
            getWeatherData(url: WEATHER_URL, parameters: params )
            
        }
        
    }
    
    
    
    //Write the didFailWithError method here:
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
        cityLabel.text = "Location Unavailable"
    }
    
    
    

    
    //MARK: - Change City Delegate methods
    /***************************************************************/
    
    
    //Write the userEnteredANewCityName Delegate method here:
    

    
    //Write the PrepareForSegue Method here
    
    
    
    
    
}


