import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let aButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.setTitle("A", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 32)
        button.backgroundColor = .systemPink
        button.addTarget(self, action: #selector(musicButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let bButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.setTitle("B", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 32)
        button.backgroundColor = .systemPurple
        button.addTarget(self, action: #selector(musicButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let cButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.setTitle("C", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 32)
        button.backgroundColor = .systemRed
        button.addTarget(self, action: #selector(musicButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let dButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.setTitle("D", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 32)
        button.backgroundColor = .systemOrange
        button.addTarget(self, action: #selector(musicButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let eButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.setTitle("E", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 32)
        button.backgroundColor = .systemYellow
        button.addTarget(self, action: #selector(musicButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let fButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.setTitle("F", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 32)
        button.backgroundColor = .systemGreen
        button.addTarget(self, action: #selector(musicButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let gButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.setTitle("G", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 32)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(musicButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        setupUI()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let buttons = [aButton, bButton, cButton, dButton, eButton, fButton, gButton]
        view.addSubview(stackView)
        view.backgroundColor = .white
        var count: CGFloat = 0
        for button in buttons {
            count += 5
            let svView = UIView()
            svView.translatesAutoresizingMaskIntoConstraints = false
            stackView.addArrangedSubview(svView)
            svView.addSubview(button)
            
            NSLayoutConstraint.activate([
                button.topAnchor.constraint(equalTo: svView.topAnchor),
                button.leadingAnchor.constraint(equalTo: svView.leadingAnchor, constant: count),
                button.trailingAnchor.constraint(equalTo: svView.trailingAnchor, constant: -count),
                button.bottomAnchor.constraint(equalTo: svView.bottomAnchor)
            ])
            
        }
    }
    private func setupUI(){
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    @objc func musicButtonTapped(_ sender: UIButton) {
        
        let url = Bundle.main.url(forResource: sender.currentTitle, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}
