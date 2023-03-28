//
//  ViewController.swift
//  graduation-thesis
//
//  Created by Vu Duc Trong on 20/03/2023.
//

import UIKit

class FirstScreenViewController: UIViewController {
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var regionLabel: UILabel!
    @IBOutlet var feelLikeLabel: UILabel!
    @IBOutlet var temperatureLabel: UILabel!

    @IBOutlet var weatherView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()

        configSubView()
    }

    func configSubView() {
        weatherView.roundCorners(with: 20)
    }

//    https://api.openweathermap.org/data/2.5/weather?lat=21.0278&lon=105.8342&appid=797332900dd8bbb179b5e390e71cda68

    private func fetchData() {
        let url = URL(string: "https://api.weatherapi.com/v1/current.json?key=b421cb51418a45ef9f1150452232203&q=Hanoi&aqi=no")!
        let dataTask = URLSession.shared.dataTask(with: url, completionHandler: { data, _, error in
            guard let data = data, error == nil else {
                print("Error")
                return
            }
            var fullWeatherData: WeatherData?
            do {
                fullWeatherData = try JSONDecoder().decode(WeatherData.self, from: data)
            } catch {
                print("Error")
            }

            DispatchQueue.main.async {
                self.cityLabel.text = "\(fullWeatherData?.location.name ?? ""),"
                self.regionLabel.text = "\(fullWeatherData?.location.country ?? "")"
                self.feelLikeLabel.text = String(format: "Tốc độ gió %.f Kmh", fullWeatherData?.current.windKph ?? 0)
                self.temperatureLabel.text = String(format: "%.f℃", fullWeatherData?.current.tempC ?? 0)
            }

        })
        dataTask.resume()
    }
}
