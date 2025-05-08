echo "[+] Encrypting secret-file with AES"
openssl aes-256-cbc -e -in secret-file -out secret-file.enc -pass pass:mylabpass

echo "[+] See the encrypted file content : "
cat secret-file.enc

echo "[+] Modifying encrypted file to hexadecimal..."
certutil -encodehex secret-file.enc HEXsecretfile
type HEXsecretfile

echo "[+] Decrypting secretfile..."
openssl aes-256-cbc -d -in secret-file.enc -out secret-file.dec -pass pass:mylabpass
cat secret-file.decrypted
diff secret-file secret-file.decrypted && echo "[~] Match confirmed!"