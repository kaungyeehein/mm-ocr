# Setup
font_dir=01_train_font
input_dir=02_train_text
tif_dir=11_output_tif
#lstmf_dir=12_output_lstmf
lang_dir=21_lang_data

# Clean old data
rm -rf $tif_dir
#rm -rf $lstmf_dir
rm -rf $lang_dir

# Create directory for tif
mkdir $tif_dir
#mkdir $lstmf_dir
mkdir $lang_dir

# Get font list
mapfile -t font_list < <(text2image --list_available_fonts --fonts_dir $font_dir | awk '{split($0,a,":");gsub(/^[ \t]+|[ \t]+$/, "", a[2]);print a[2]}')

# Generate tif and box
for file in $input_dir/*.txt; do
	# Repeat by font list
	for (( i=0; i<${#font_list[@]}; i++)); do
		# echo ${font_list[i]}
		# echo $(basename ${file%.txt}).${font_list[i]// /_}
		text2image --text $file --outputbase $tif_dir/$(basename ${file%.txt}).${font_list[i]// /_} --font "${font_list[i]}" --fonts_dir $font_dir
	done
done

# Generate lstm-unicharset
for file in $tif_dir/*.box; do
	boxlist+=" ${file}"
done
unicharset_extractor --output_unicharset $lang_dir/mya.unicharset --norm_mode 2 $boxlist

# Generate three dawg files
wordlist2dawg $input_dir/mya.number.txt $lang_dir/mya.number-dawg $lang_dir/mya.unicharset
wordlist2dawg $input_dir/mya.punc.txt $lang_dir/mya.punc-dawg $lang_dir/mya.unicharset
wordlist2dawg $input_dir/mya.wordlist.txt $lang_dir/mya.word-dawg $lang_dir/mya.unicharset

# Generate lstmf
#for file in $tif_dir/*.tif; do
#	echo $file
#	tesseract $file $lstmf_dir/$(basename ${file%.tif}) lstm.train
#done

# Repert by input text
#cd $input_dir
#for file in $input_dir/*.txt; do
#	text2image --find_fonts --fonts_dir $font_dir --text $file --min_coverage .9 --outputbase $tif_dir/$(basename ${file%.txt})
#done

