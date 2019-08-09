# Setup
font_dir=01_train_font
input_dir=02_train_text
tif_dir=11_output_tif

# Clean old data
rm -rf $tif_dir

# Create directory for tif
mkdir $tif_dir

# Get font list
mapfile -t font_list < <(text2image --list_available_fonts --fonts_dir $font_dir | awk '{split($0,a,":");gsub(/^[ \t]+|[ \t]+$/, "", a[2]);print a[2]}')

# Repeat by input text
for file in $input_dir/*.txt; do
	# Repeat by font list
	for (( i=0; i<${#font_list[@]}; i++)); do 
		# echo ${font_list[i]}
		# echo $(basename ${file%.txt}).${font_list[i]// /_}
		text2image --text $file --outputbase $tif_dir/$(basename ${file%.txt}).${font_list[i]// /_} --font "${font_list[i]}" --fonts_dir $font_dir
	done
done

# Repert by input text
#cd $input_dir
#for file in $input_dir/*.txt; do
#	text2image --find_fonts --fonts_dir $font_dir --text $file --min_coverage .9 --outputbase $tif_dir/$(basename ${file%.txt})
#done

