//
//  CarViewController.swift
//  Xccelerator
//
//  Created by Sarah Mullings on 2/15/22.
//

import UIKit
import MapKit
import CoreLocation

class CarViewController: UIViewController {
    
    var car: carPost?
    var update = false
    private let locationManager = CLLocationManager()
    private var currentLocation = CLLocationCoordinate2D()

    @IBOutlet weak var deleteCarButton: UIButton!
    @IBOutlet weak var makeTextView: UILabel!
    @IBOutlet weak var colorTextView: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLocationServices()
        // Do any additional setup after loading the view.
        if update == true {
            makeTextView.text = car?.make
            colorTextView.text = car?.color
        }
        
    }
    @IBAction func deleteOnClick(_ sender: Any) {
        APIFunctions.functions.deletePost(id: car!._id)
        print("car post deleted")
        self.navigationController?.popViewController(animated: true)
    }
    
    private func configureLocationServices(){
        locationManager.delegate = self
        
        let status = CLLocationManager.authorizationStatus()
        
        //request the location
        if CLLocationManager.authorizationStatus() == .notDetermined{
            locationManager.requestAlwaysAuthorization()
        }else if status == .authorizedAlways || status == .authorizedWhenInUse{
            beginLocationUpdates(locationmanager: locationManager)
        }
    
    }
    
    private func beginLocationUpdates(locationmanager: CLLocationManager){
        mapView.showsUserLocation = true
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }
    
    private func zoomToLocation(with coordinate: CLLocationCoordinate2D){
        let zoomSpan = MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
        let zoomRegion = MKCoordinateRegion(center: coordinate, span: zoomSpan)
        mapView.setRegion(zoomRegion, animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension CarViewController: CLLocationManagerDelegate {
    //updates if the users current location changes
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //print("Did get latest location")
        
//        guard let latestLocation = locations.first else {return}
//
//        //if currentLocation == nil {
//        zoomToLocation(with: latestLocation.coordinate)
//        //}
//        currentLocation = latestLocation.coordinate
        
        currentLocation.latitude = car!.latitude
        currentLocation.longitude = car!.longitude
        let coordinates = CLLocationCoordinate2D(latitude: currentLocation.latitude, longitude: currentLocation.longitude)
        zoomToLocation(with: coordinates)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("The status changed")
        if status == .authorizedAlways || status == .authorizedWhenInUse{
            beginLocationUpdates(locationmanager: manager)
        }
    }
}
