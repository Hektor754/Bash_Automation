echo "[+] produce a 56-byte pseudorandom number"
openssl rand -out des_keyXX 56

echo "[+] Here is the number : "
cat des_keyXX

echo "[+] Encryption with Triple DES using a 56-byte file key"
openssl des3 -e -a -kfile des_keyXX -in lab1.txt -out rfc3766XX.enc

echo "[+] Checkout encrypted file : "
cat rfc3766XX.enc