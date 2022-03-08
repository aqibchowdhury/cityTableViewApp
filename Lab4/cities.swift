//
//  cities.swift
//  lab4
//
//  Created by Aqib Chowdhury on 2/24/22.
//

import Foundation

class cities
{
    var cities:[city] = []
    
    init()
    {
        let c1 = city(cn: "New York", cd: "The city that never sleeps", cin: "newyork.png")
        let c2 = city(cn: "Los Angeles", cd: "Home to the biggest movie stars", cin: "losangeles.png")
        let c3 = city(cn: "Chicago", cd: "Try a Chicago deep dish pizza while you're here?", cin: "chicago.png")
        let c4 = city(cn: "Houston", cd: "The world capital of air conditioning, fun fact!", cin: "houston.png")
        let c5 = city(cn: "Seattle", cd: "Bring an umbrella!", cin: "seattle.png")
        
        cities.append(c1)
        cities.append(c2)
        cities.append(c3)
        cities.append(c4)
        cities.append(c5)
        
    }
    
    func getCount() -> Int
    {
        return cities.count
    }
    
    func getCityObject(item:Int) -> city{
        
        return cities[item]
    }
    
    func removeCityObject(item:Int) {
        
         cities.remove(at: item)
    }
    
    func addCityObject(name:String, desc: String, image: String) -> city{
        let c = city(cn: name, cd: "Another beautiful city for the list!", cin: "newyork.png")
        cities.append(c)
        return c
    }
    
}
class city
{
    var cityName:String?
    var cityDescription:String?
    var cityImageName:String?
    
    init(cn:String, cd:String, cin:String)
    {
        cityName = cn
        cityDescription = cd
        cityImageName = cin
        
    }
    
    
}
