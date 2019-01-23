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



class WeatherViewController: UIViewController, CLLocationManagerDelegate, ChangeCityDelegate {
    
    //Constants
    let WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather"
    let APP_ID = "f24215d49784b506df09879f04117d37" //KEY from Weather app
    /***Get your own App ID at https://openweathermap.org/appid ****/
    

    //TODO: Declare instance variables here
    
    let locationManager = CLLocationManager ()
    let weatherDataModel = WeatherDataModel()
    

    
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
//        locationManager.delegate = nil                           //means the data only is requested once from the API -
                                        // THIS ALSO MEANS THE APP DOESNT REQUEST API DATA NEXT TIME YOU LOG ON! REMOVE IT!
        
        
    }
    
    
    
    //MARK: - Networking
    /***************************************************************/
    
    //Write the getWeatherData method here:
    //Alamofire makes a GET request, the input data it uses (sends and requests) is the lat and long params defined in the dictionary.
    //The response type we're expecting is JSON file - if it works we do something... if it doesn't its probably because
    //the users phone is offline
    
    func getWeatherData(url: String, parameters: [String: String]) {
        
        Alamofire.request(url, method: .get, parameters : parameters).responseJSON {
            response in
            if response.result.isSuccess {
                print("Success! Got the Weather Data")
                
                
                let weatherJSON : JSON = JSON(response.result.value!)
        //create constant to assign JSON value to type JSON - force unwrapped as the result must be succesful
        //SWIFTYJSON -  uses the function to unwrap the JSON file
         //print(weatherJSON)   // test API is working PRINT ALL OUTPUT
                
                self.updateWeatherData(json: weatherJSON)
        //pass weather data to pasring - requires self because we're in a function within a function shown by the "in" after "reponse" above
           
            }
            else {
                print("Error \(response.result.error)")    //print to console error message
                self.cityLabel.text = "Connection Issues" //update GUI label
            }
        }
        
    }
    
    
    //MARK: - JSON Parsing
    /***************************************************************/
   
    
    //Write the updateWeatherData method here:
    
    func updateWeatherData(json : JSON) {
        
        if let tempResult = json["main"]["temp"].double { // access temp record within main (swifytyJSON) shortcut
        
        weatherDataModel.temperature = Int(tempResult - 273.15)  // minus degrees kelvin - force unwrap to fix double issue.
        
        weatherDataModel.city = json["name"].stringValue
        
        weatherDataModel.condition = json["weather"][0]["id"].intValue //grab the 701 weather condition which is the first value if more than one available.
     
        weatherDataModel.weatherIconName = weatherDataModel.updateWeatherIcon(condition: weatherDataModel.condition) //update icons based on condition
            
        updateUIWithWeatherData()
    }
    
    else {
    
        cityLabel.text = "Weather Unavailable"
    }
}


    
    //MARK: - UI Updates
    /***************************************************************/
    
    
    //Write the updateUIWithWeatherData method here:
    
    func updateUIWithWeatherData() {
        
        cityLabel.text = weatherDataModel.city                                  //update label to display city name
        temperatureLabel.text = "\(weatherDataModel.temperature)°"               //update temperature label with temp //add degrees C logo at e
        weatherIcon.image = UIImage (named: weatherDataModel.weatherIconName)   //update UIImage with new icon
    }
    
    
    
    
    
    
    //MARK: - Location Manager Delegate Methods
    /***************************************************************/
    
    
    //Write the didUpdateLocations method here:
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[locations.count - 1]     //grab the last value which is the most accurate
        if  location.horizontalAccuracy > 0 {                          //ensures that the result is valid
            self.locationManager.stopUpdatingLocation()                    // kills using GPS to save battery
            
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
    
    func userEnteredANewCityName(city: String) {
        print(city)
        
    }
    

    
    //Write the PrepareForSegue Method here
    
    //we also need to declare ourselves as the delegate
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "changeCityName" {                                     //if segue button has been pressed
            
            let destinationVC = segue.destination as! ChangeCityViewController        //data type of segue will be a destinatioVC s
            
            destinationVC.delegate = self
        }
    }
    
    
}


