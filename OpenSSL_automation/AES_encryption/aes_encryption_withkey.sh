for i in {1..5}; do
    echo "Hello World" | openssl aes-256-cbc -a -k mypass
done
echo "[+] Difference in every iteration because we salt it too:)"
