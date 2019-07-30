# mm-ocr

This project is data training for image to text recognization for Myanmar language by Tessearct 4.00 OCR Engine. 

## 1. Installation

### 1.1 Requirement Enviroment
Run on Ubuntu Bionic 18.04.

    sudo apt update
    sudo apt upgrade
    
Tesseract 4 packages with LSTM engine and related traineddata.

* [Ubuntu Bionic 18.04](https://packages.ubuntu.com/bionic/tesseract-ocr-all) 
* [Ubuntu Bionic 18.04 - PPA ](https://launchpad.net/~alex-p/+archive/ubuntu/tesseract-ocr?field.series_filter=bionic)

Add PPA repository.

    sudo add-apt-repository ppa:alex-p/tesseract-ocr
    sudo apt update

### 1.2 Installing Tesseract

    sudo apt install tesseract-ocr
    sudo apt install libtesseract-dev
    sudo apt install tesseract-ocr-mya
    sudo apt install tesseract-ocr-script-mymr
    
Note: Installationg directory is /usr/share/tesseract-ocr/4.00
    
### 1.3 Running Tesseract

    tesseract input.jpg output -l eng+mya
    
