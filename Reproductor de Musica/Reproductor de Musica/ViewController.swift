//
//  ViewController.swift
//  Reproductor de Musica
//
//  Created by Timo Siegle on 04.07.16.
//  Copyright © 2016 Timo Siegle. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var songArtist: UILabel!
    @IBOutlet weak var songTitle: UILabel!
    @IBOutlet weak var songImage: UIImageView!
    @IBOutlet weak var songs: UIPickerView!
    
    var availableSongs: [Song] = []
    var selectedSong: Song? = nil
    private var reproductor: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        songs.dataSource = self
        songs.delegate = self
        
        // initialize available songs
        var song1 = Song(title: "I For An Eye", artist: "WAAX")
        song1.nameMp3 = "song1"
        if let imageSong1 = UIImage(named:"Song1") {
            song1.image = imageSong1
        }
        availableSongs.append(song1)
        
        var song2 = Song(title: "The Pain", artist: "Robbie Miller")
        song2.nameMp3 = "song2"
        if let imageSong2 = UIImage(named:"Song2") {
            song2.image = imageSong2
        }
        availableSongs.append(song2)
        
        var song3 = Song(title: "Still Here", artist: "Glass Skies")
        song3.nameMp3 = "song3"
        if let imageSong3 = UIImage(named:"Song3") {
            song3.image = imageSong3
        }
        availableSongs.append(song3)
        
        var song4 = Song(title: "Haunt Me", artist: "Endless Heights")
        song4.nameMp3 = "song4"
        if let imageSong4 = UIImage(named:"Song4") {
            song4.image = imageSong4
        }
        availableSongs.append(song4)
        
        var song5 = Song(title: "See Through Walls", artist: "Anitek")
        song5.nameMp3 = "song5"
        if let imageSong5 = UIImage(named:"Song5") {
            song5.image = imageSong5
        }
        availableSongs.append(song5)
        
        selectedSong = song1
        setSong(selectedSong!)
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return availableSongs.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return availableSongs[row].title
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedSong = availableSongs[row]
        setSong(selectedSong!)
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func setSong(song: Song, startPlaying: Bool = true) {
        let sonidoURL = NSBundle.mainBundle().URLForResource(song.nameMp3, withExtension: "mp3")
        do {
            try reproductor = AVAudioPlayer(contentsOfURL: sonidoURL!)
        } catch {
            print("Error al cargar el archivo de sonido!")
        }
        songTitle.text = song.title
        songArtist.text = song.artist
        songImage.image = song.image
        
        if startPlaying {
            reproductor.play()
        }
    }

    
    @IBAction func play() {
        if !reproductor.playing {
            reproductor.play()
        }
    }

    @IBAction func pause() {
        if reproductor.playing {
            reproductor.pause()
        }
    }
    
    @IBAction func stop() {
        if reproductor.playing {
            reproductor.stop()
            reproductor.currentTime = 0
        }
    }
    
    @IBAction func shuffle() {
        let posición = Int(arc4random()) % availableSongs.count
        setSong(availableSongs[posición])
    }
    
    @IBAction func slideVolume(sender: UISlider) {
        reproductor.volume = sender.value
    }
}

