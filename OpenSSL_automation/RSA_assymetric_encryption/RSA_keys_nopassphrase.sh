echo "[+] Generate rsa key with no passphrase"
openssl genrsa -out private2.pem 2048

openssl rsa -noout -text -in private2.pem

echo "[+] Digital sign a text"
openssl dgst -sha256 -binary secret-file > secret.hash

openssl pkeyutl -sign -inkey private2.pem -in secret.hash > signature

