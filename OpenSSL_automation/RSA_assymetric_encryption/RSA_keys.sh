echo "[+] Generating 2048 long RSA key"
openssl genrsa -des3 -passout pass:mylabpass -out private.pem 2048

openssl rsa -in private.pem -passin pass:mylabpass -pubout -out public.pem