echo "[+] Encrypting lab1.txt using Triple DES"
openssl des3 -e -in lab1.txt -out testDES.txt -pass pass:mylabpass

echo "[+] Decrypting testDES.txt to verify"
openssl des3 -d -in testDES.txt -out testDES1Dec.txt -pass pass:mylabpass

diff lab1.txt testDES1Dec.txt && echo "[~] Match confirmed"

echo "[+] Encrypting lab1.txt using Triple DES with an output in a base64 form"
openssl des3 -e -a -in lab1.txt -out testDESb.txt -pass pass:mylabpass

echo "[+] Decrypting testDESb.txt to verify"
openssl des3 -d -a -in testDESb.txt -out testDESbDec.txt -pass pass:mylabpass

diff lab1.txt testDESbDec.txt && echo "[~] Match confirmed"