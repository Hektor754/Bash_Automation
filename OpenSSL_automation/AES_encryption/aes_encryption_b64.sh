echo "[+] Encryption with AES but with base 64 : "
openssl aes-256-cbc -a -in secret-file -out secret-fileASCII.enc -pass pass:mylabpass

echo "[+] Open and see the file : "
cat secret-fileASCII.enc