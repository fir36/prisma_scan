# WARNING: Hardcoded credentials (should trigger Prisma Cloud)
AWS_ACCESS_KEY_ID = "AKIAXXXXXXXXEXAMPLE"
AWS_SECRET_ACCESS_KEY = "wJalrXUtnFEMI/K7MDENG/EXAMPLEKEY"

# API Key exposed in plain text
API_KEY = "12345-abcde-67890-fghij"

# Base64-encoded secret (Prisma Cloud might flag this)
ENCODED_SECRET = "c2VjcmV0X3Bhc3N3b3JkMTIzNDU="  # Base64 for "secret_password12345"

# Placeholder database credentials
DB_USERNAME = "admin"
DB_PASSWORD = "P@ssw0rd123"

print("Configuration loaded.")
