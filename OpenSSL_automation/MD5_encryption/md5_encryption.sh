echo "[+] Digest with md5, sha256, md4, sha1..."
openssl md5 secret-file

openssl dgst -sha256 secret-file

openssl dgst -md4 secret-file

openssl dgst -md5 secret-file

openssl dgst -sha1 secret-file

echo "[+] Calculate the digest of random data"
echo "Hello World" | openssl dgst -sha256

echo "Hello World" | openssl dgst -sha1

echo "Hello World" | openssl dgst -md5

echo "Hello World" | openssl dgst -md4

echo "[+] Create a file with 1000 randoms"
for i in {1..1000}; do echo $RANDOM; done > random.data

echo "[+] Calculate its digest with sha256"
openssl dgst -sha256 ./random.data

echo "[+] Changing a single byte on the random.data file"
$((RANDOM % 256)) | dd of=random.data bs=1 seek=$((RANDOM % 1000)) count=1 conv=notrunc

echo "[+] Calculate its digest with sha256"
openssl dgst -sha256 ./random.data

if [ "$(openssl dgst -sha256 shattered-1.pdf | awk '{print $2}')" = "$(openssl dgst -sha256 shattered-red.pdf) | awk '{print $2}')" ]; then
    echo "Hashes Match"
else
    echo "Hashes Differ"
fi

if [ "$(openssl dgst -sha1 shattered-1.pdf | awk '{print $2}')" = "$(openssl dgst -sha1 shattered-red.pdf) | awk '{print $2}')" ]; then
    echo "Hashes Match"
else
    echo "Hashes Differ"
fi