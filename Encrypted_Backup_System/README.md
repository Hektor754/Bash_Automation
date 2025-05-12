
# 🔐 Encrypted Backup Script

This script allows you to create encrypted backups of any folder on your system. It compresses the folder, encrypts it using AES-256 encryption, and moves the result to a secure backup location.

---

## 📂 Example Usage

```
bash backup.sh /home/user/Documents
```

### 🧾 What Happens:

1. The folder `/home/user/Documents` is validated.
2. It is compressed into a file like: `Documents_2025-05-12_14-30-00.tar.gz`
3. That archive is encrypted into: `Documents_2025-05-12_14-30-00.tar.gz.enc`
4. The encrypted file is moved to: `/home/yourname/backups/`

---

## 🔐 AES Key Setup

Before using the script, generate your AES key:

```
openssl rand -base64 32 > my_aes.key
```

> ⚠️ Keep this file safe! Without it, you cannot decrypt your backups.

---

## 🔓 To Decrypt Later

```
openssl enc -d -aes-256-cbc -in Documents_2025-05-12_14-30-00.tar.gz.enc -out recovered.tar.gz -pass file:./my_aes.key
```

Then extract with:

```
tar -xzf recovered.tar.gz
```

---

## 📝 Logging and Automation (Optional)

You can log backups manually:

```
echo "[$(date)] Backup created: filename.tar.gz.enc" >> /var/log/encrypted_backup.log
```

And schedule the script to run regularly with `cron`.

---

## ✅ Requirements

- Bash
- `tar`
- `openssl`
- Read/write permissions to target folders

## ❗ Disclaimer

The generated aes key is there only for demonstration. DO NOT use this key for encryption decryption or any other secure application