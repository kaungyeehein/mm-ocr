# Setup
font_dir=01_train_font
input_dir=02_train_text
tif_dir=03_output_tif

# Clean old data
rm -rf $tif_dir

# Create directory for tif
mkdir $tif_dir

text2image --list_available_fonts --fonts_dir $font_dir
echo $font_list

text2image --outputbase=mya.fontlist.txt --fonts_dir $font_dir --min_coverage .9 --render_per_font false

# Repert by input text
#cd $input_dir
#for f in *.txt; do
#	text2image --find_fonts --fonts_dir ../$font_dir --text $f --min_coverage .9 --render_per_font --outputbase ../$tif_dir/${f%.txt}
#done
