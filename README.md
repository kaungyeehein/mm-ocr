# mm-ocr

This project is data training for image to text recognization for Myanmar language by Tessearct 4.00 OCR Engine. 

## 1. Installation

### 1.1 Requirement

Test Enviroment is Ubuntu Bionic 18.04.

    sudo apt update
    sudo apt upgrade

*Note: If proxy is used, need to modify visudo.*

    sudo visudo
    
*Add following line to under of `Defaults env_reset`.*

    Default env_keep="http_proxy ftp_proxy"
    
**Tesseract 4 packages with LSTM engine and related traineddata.**

* [Ubuntu Bionic 18.04](https://packages.ubuntu.com/bionic/tesseract-ocr-all) 
* [Ubuntu Bionic 18.04 - PPA ](https://launchpad.net/~alex-p/+archive/ubuntu/tesseract-ocr?field.series_filter=bionic)

Add PPA repository.

    sudo add-apt-repository ppa:alex-p/tesseract-ocr
    sudo apt update
    
*Note: If proxy is used, need to add proxy to add PPA.*

    export http_proxy=http://username:password@proxy:port
    sudo su
    add-apt-repository ppa:alex-p/tesseract-ocr

### 1.2 Installing Tesseract

    sudo apt install tesseract-ocr
    sudo apt install libtesseract-dev
    sudo apt install tesseract-ocr-mya
    sudo apt install tesseract-ocr-script-mymr
    
*Note: Installationg directory is /usr/share/tesseract-ocr/4.00*
    
### 1.3 Running Tesseract

    tesseract input.jpg output -l eng+mya
    
## 2. Training

### 2.1 Install Additional Libraries Required

    sudo apt-get install libicu-dev
    sudo apt-get install libpango1.0-dev
    sudo apt-get install libcairo2-dev
    
### 2.2 Render text to image (auto)

Create the following directorys.

- `train\train_font` To place train font file. eg. `times.ttf`.
- `train\train_text` To input train text file. eg. `eng_txt0.txt`.
- `train\train_tif`  To output auto generated tif file and box file. eg. `*.tif`, `*.box`

Check list of avaliable fonts.

    cd training/
    text2image --list_available_fonts --fonts_dir='./train_font'

Command Option:

    text2image --text=[lang]_txt0.txt --outputbase=[lang].[fontname].exp0 --font='Font Name' --fonts_dir=/path/to/your/fonts

Command Example:
```Shell
N=1 # set accordingly to the number of files that you have (count from 0 to N)
for i in `seq 0 $N`; do
    text2image --text=./train_text/eng_txt$i.txt --outputbase=./train_tif/eng.time_new_roman_regular.exp$i --font='Times New Roman' --fonts_dir=./train_font
done
```
*Note: `eng.time_new_roman_regular.exp0.tif`, `eng.time_new_roman_regular.exp1.tif`, `eng.time_new_roman_regular.exp0.box` and `eng.time_new_roman_regular.exp1.box` are outputed to `train_tif` directory.*

### 2.3 Install qt-box-editor to check box file

Box file contain following format information.</br> 
`<symbol> <left> <bottom> <right> <top> <page>`</br>
Install `qt-box-editor` to check that is correct or not in GUI.

    sudo apt install qt-box-editor

Run qt-box-editor from command to correct character box file

    qt-box-editor
    
### 2.4 Install Myanmar language pack on Ubuntu

    sudo apt install ubuntu-restricted-extras
    check-language-support -l my
    sudo apt install language-pack-my
    
