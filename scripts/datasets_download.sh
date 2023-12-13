#check if gdown is installed
if ! command -v gdown &> /dev/null
then
    pip install gdown
fi

# for files, use "https://drive.google.com/uc?id=<FILE_ID>"
ANNOTATIONS_URL="https://drive.google.com/drive/folders/1E0B4tQdwnqCmQXvqHAaGAXvqu1-I926d"
DATASETS_URL="https://drive.google.com/drive/folders/14bYSFTiJtyGNDyCYkv6kGIx3jHyovZlS"
FRAMES_URL="https://drive.google.com/uc?id=1Mgy5-RYVHIPRSYzyqacpmweImIcc8Hfx"

# download datasets
gdown $ANNOTATIONS_URL -O data/HuPR --folder
# mv data/HuPR/annotations/hrnet_annot_test.json data/HuPR/hrnet_annot_test.json
# mv data/HuPR/annotations/hrnet_annot_train.json data/HuPR/hrnet_annot_train.json
# mv data/HuPR/annotations/hrnet_annot_val.json data/HuPR/hrnet_annot_val.json

# download frames.zip
gdown $FRAMES_URL -O data/HuPR/frames.zip

# let it like this for now
# use for loop next time
gdown $DATASETS_URL -O data/HuPR/ --folder

# unzip the zip files one by one then deletes it
if [ ! -d data/HuPR/frames ]; then
    for file in data/HuPR/*.zip; do
        unzip -d "${file%.zip}" "$file"
        rm "$file"
    done
fi