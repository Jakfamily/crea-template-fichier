#!/usr/bin/env ruby

# Demande à l'utilisateur de saisir le nom du dossier
puts "Entrez le nom du dossier :"
folder_name = gets.chomp

# Vérifie que le nom du dossier est valide
if folder_name.empty?
  puts "Nom de dossier invalide"
  exit
end

# Crée le dossier
system("mkdir #{folder_name}")

# Se déplace dans le dossier
Dir.chdir(folder_name) do
  # Crée le fichier Gemfile avec les gems de THP
  File.open("Gemfile", "w") do |f|
    f.puts "source 'https://rubygems.org'"
    f.puts "gem 'rspec'"
    f.puts "gem 'pry'"
    f.puts "gem 'dotenv'"
    f.puts "gem 'rubocop'"
    f.puts "gem 'nokogiri'"
    f.puts "gem 'httparty'"
    f.puts "gem 'faker'"
    # Ajouter d'autres gems si nécessaire
  end
  
  # Initialise le repository git
  system("git init")

  # Crée le fichier .env et l'ajoute au fichier gitignore
  File.open(".env", "w") do |f|
    f.puts "# Mettez vos variables d'environnement ici"
  end
  system("echo '.env' >> .gitignore")

  # Crée le dossier lib
  system("mkdir lib")

  # Initialise rspec
  system("rspec --init")

  # Crée le fichier README.md
  File.open("README.md", "w") do |f|
    f.puts "# #{folder_name}"
    f.puts "This is a Ruby program"
  end

  # Crée le fichier rubocop.yml avec les paramètres souhaités
  File.open(".rubocop.yml", "w") do |f|
    f.puts "inherit_from:"
    f.puts "  - http://relaxed.ruby.style/rubocop.yml"
    f.puts ""
    f.puts "AllCops:"
    f.puts "  DisplayStyleGuide: true"
    f.puts "  DisplayCopNames: true"
    f.puts "  Exclude:"
    f.puts "    - 'db/schema.rb'"
    f.puts "    - 'vendor/**/*'"
    f.puts "    - 'config/environments/*.rb'"
    f.puts "    - 'bin/*'"
    f.puts ""
    f.puts "Rails:"
    f.puts "  Enabled: True"
    f.puts ""
    f.puts "Metrics/BlockLength:"
    f.puts "  Exclude:"
    f.puts "    - 'spec/**/*.rb'"
    f.puts "    - 'Guardfile'"
    f.puts "    - 'vendor/bundle'"
  end
end

# Crée l'alias pour l'exécution du script
system('alias mkdirruby="ruby /home/jakfamily/crea-template-fichier/mkdirruby.rb"')
system('mkdirruby')

