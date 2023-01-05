//
//  HeroHeaderUIView.swift
//  MovieWatchlist
//
//  Created by Vlada Misici on 21.12.2022.
//

import UIKit

class HeroHeaderUIView: UIView {

    private let watchlistButton: UIButton = {
        let button = UIButton()
        button.setTitle("Save", for: .normal)
        button.layer.borderColor = UIColor.systemBackground.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        return button
    }()
    
    private let playButton: UIButton = {
        let button = UIButton()
        button.setTitle("Play", for: .normal)
        button.layer.borderColor = UIColor.systemBackground.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        return button
    }()
    
    private let heroImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "callSaul")
        return imageView
    }()
    
    private func addGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.systemBackground.cgColor
        ]
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
    }
    override init(frame: CGRect){
        super.init(frame: frame)
        addSubview(heroImageView)
        addGradient()
        addSubview(playButton)
        addSubview(watchlistButton)
        applyConstraints()
    }
    
    private func applyConstraints() {
        let playButtonConstraints = [
            playButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 80),
            playButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            playButton.widthAnchor.constraint(equalToConstant: 100)
        ]
        let watchlistButtonConstraints = [
            watchlistButton.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -80),
            watchlistButton.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -50),
            watchlistButton.widthAnchor.constraint(equalToConstant: 100)
        ]
        
        NSLayoutConstraint.activate(playButtonConstraints)
        NSLayoutConstraint.activate(watchlistButtonConstraints)
    }
    
    public func configure(with model: TitleViewModel) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.posterURL)") else {
            return
        }
        
        heroImageView.sd_setImage(with: url, completed: nil)
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        heroImageView.frame = bounds
    }
    
    required init?(coder: NSCoder){
        fatalError()
    }

}
