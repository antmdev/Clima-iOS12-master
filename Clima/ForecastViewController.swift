//
//  forecastViewController.swift
//  Clima
//
//  Created by Ant Milner on 10/03/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit
//import CoreLocation //taps into GPS data! (Press optino key and click on it to read more)
//import Alamofire   //rember to run "pod update" in terminal to update pods
//import SwiftyJSON
//
class ForecastViewController: UIViewController
{
//{
//    //Constants

//
//    //TODO: Declare instance variables here
//    let locationManager = CLLocationManager()
//    let weatherDataModel = WeatherDataModel()
//
//    //Pre-linked IBOutlets
//
// NEED TO RE ADD THESE
//
//
//    //MARK: - Networking
//    /***************************************************************/
//
//    //Write the getWeatherData method here:
//    //Alamofire makes a GET request, the input data it uses (sends and requests) is the lat and long params defined in the dictionary.
//    //The response type we're expecting is JSON file - if it works we do something... if it doesn't its probably because
//    //the users phone is offline
//
//    func getWeatherData(url: String, parameters: [String: String])
//    {
//        Alamofire.request(url, method: .get, parameters : parameters).responseJSON
//            {
//                response in
//                if response.result.isSuccess {
//                    print("Success! Got the Weather Data")
//
//                    let weatherJSON : JSON = JSON(response.result.value!)
//                    //create constant to assign JSON value to type JSON - force unwrapped as the result must be succesful
//                    //SWIFTYJSON -  uses the function to unwrap the JSON file
//                    //print(weatherJSON)   // test API is working PRINT ALL OUTPUT
//
//                    self.updateWeatherData(json: weatherJSON)
//                    //pass weather data to pasring - requires self because we're in a function within a function shown by the "in" after "reponse" above
//                }
//                else
//                {
//                    print("Error \(response.result.error)")    //print to console error message
//                    self.forecastLocationLabel.text = "Connection Issues" //update GUI label
//                }
//        }
//
//    }
//
//
//    //MARK: - JSON Parsing
//    /***************************************************************/
//
//
//    //Write the updateWeatherData method here:
//
//    func updateWeatherData(json : JSON)
//    {
//
//        if let tempResult = json["main"]["temp"].double  // access temp record within main (swifytyJSON) shortcut
//        {
//            weatherDataModel.temperature = Int(tempResult - 273.15)  // minus degrees kelvin - force unwrap to fix double issue
//            weatherDataModel.city = json["name"].stringValue
//            weatherDataModel.condition = json["weather"][0]["id"].intValue //grab the 701 weather condition which is the first value if more than one available.
//            weatherDataModel.weatherIconName = weatherDataModel.updateWeatherIcon(condition: weatherDataModel.condition) //update icons based on condition
//            updateUIWithWeatherData()
//        }
//
//        else
//        {
//            forecastLocationLabel.text = "Weather Unavailable"
//        }
//    }
//
//
//    //MARK: - UI Updates
//    /***************************************************************/
//
//
//    //Write the updateUIWithWeatherData method here:
//
//    func updateUIWithWeatherData()
//    {
//        forecastLocationLabel.text = weatherDataModel.city                                  //update label to display city name
//        dayOneForecastLabel.text = "\(weatherDataModel.temperature)°C"               //update temperature label with temp //add degrees C logo at e
//        dayOneImageLabel.image = UIImage (named: weatherDataModel.weatherIconName)   //update UIImage with new icon
//    }
//
//
//
//
//
//
//    //MARK: - Location Manager Delegate Methods
//    /***************************************************************/
//
//
//    //Write the didUpdateLocations method here:
//
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        let location = locations[locations.count - 1]     //grab the last value which is the most accurate
//        if  location.horizontalAccuracy > 0 {                          //ensures that the result is valid
//            self.locationManager.stopUpdatingLocation()                    // kills using GPS to save battery
//
//            print("longitude = \(location.coordinate.longitude), latitude = \(location.coordinate.latitude)") //grabbing lat and long
//
//            let latitude = String(location.coordinate.latitude)       //assinging latitude and longitude to constants
//            let longtitude = String(location.coordinate.longitude)
//            let params : [String : String] = ["lat" : latitude, "lon" : longtitude, "appid" : APP_ID]
//
//            // seeting a "dictionary" which is a Key:Value pair - so we set a STring:String dictionary, which means 'lon' is the key and the value is 'longtitude'
//            // we have to go up to the longitude string and put it in brackets though to fix the "string" to "integer" value error.
//            //ALAMOFIRE for URL HTTP requests
//            getWeatherData(url: WEATHER_URL, parameters: params )
//
//        }
//
//    }
//
//    //Write the didFailWithError method here:
//
//    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
//    {
//        print(error)
//        forecastLocationLabel.text = "Location Unavailable"
//    }
//
//    //MARK: - Change City Delegate methods
//    /***************************************************************/
//    //Write the userEnteredANewCityName Delegate method here:
//
//    func userEnteredANewCityName(city: String)
//    {
//        let params : [String : String] = ["q" : city, "appid" : APP_ID]
//        getWeatherData(url: WEATHER_URL, parameters: params)
//    }
//

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        
        if segue.identifier == "locationMenuButton"
        {
            let destinationVC = segue.destination as! ChangeCityViewController
        }
        else if segue.identifier == "homeButtonPressed"
        {
            let destinationVC = segue.destination as! WeatherViewController
        }
        else if segue.identifier == "settingsButtonPressed"
        {
            let destinationVC = segue.destination as! SettingsViewController
        }
    }
    
}
