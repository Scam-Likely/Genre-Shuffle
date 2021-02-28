import UIKit
import MediaPlayer

class GenreButtonScreen: UIViewController {
    
    var musicPlayer = MPMusicPlayerController.applicationMusicPlayer
    
    @IBAction func genreButtonPressed(_ sender: UIButton) {
        
        MPMediaLibrary.requestAuthorization { (status) in
            if status == .authorized {
                self.playGenre(genre: sender.currentTitle!)
            }
        }
        
    }
    @IBAction func stopButtonPressed(_ sender: UIButton) {
        musicPlayer.stop()
    }
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        musicPlayer.skipToNextItem()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func playGenre(genre: String) {
        musicPlayer.stop()
        
        let query = MPMediaQuery()
        let predicate = MPMediaPropertyPredicate(value: genre, forProperty: MPMediaItemPropertyGenre)
        
        query.addFilterPredicate(predicate)
        
        musicPlayer.setQueue(with: query)
        musicPlayer.shuffleMode = .songs
        musicPlayer.play()
    }
    

 
}
