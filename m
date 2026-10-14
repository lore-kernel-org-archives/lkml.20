Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E358A344D8C
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791975398; cv=none; b=RxMPOd6ietsTuKg2TlbqmDo2U85oCPYLJJgPuJ2B9UwccgC4l1iCVUOpniCg5YCOR8MiCQBZz7JODp3qY2il/ejWzQMiPq7y9FKeoH0p5YQIBuC+g3PB9UWLE5+xm99lkXYTXUT1M5qxB95ErqkKZM3AfxbMGO3iCyhTYqvxVlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791975398; c=relaxed/simple;
	bh=I4W1oBOW70rZbETdibQfUVo4ly3sAm3uCSUKq0yd3EA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LvOGMxZhoX/a2QVnwVsg7ca565HuO6uncpqFjo4hoOqwRNcVXpAcIKPyIdEK8Nh1/i/Vd/LUHzOJOdurFg8xFYwKp4f/rUj0oIs5cdNdCfXJ+Zts1U9cYgfEZw+qx//jwbDRGpZntt1dTW8YjSEPyysh4i8RSS+JyX8F1d9upP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WmSTpbJ/; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WmSTpbJ/"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48afe75f055so295070f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791975395; x=1792580195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zPHEdS90glsg1krHN0zA7UOVAf+2NQvXNCjI6VwnN5A=;
        b=WmSTpbJ/v8qxlupDB4sx6pMYDNLPjFOW1hE8hjxNefOe8HX1Zm0V5Nz1WGxtn8OP/l
         wNDc/jYp0dkcKFFCvD5VinVnrxiiTceIVTQMjOvHuuLehxgUkamy1xB0PzoKfViU37TQ
         0DWSGNBz374Qcn3cNVRJOY/Dww/OyVbGt/5ZN3d/5rc+UfuXqrqBB2T3N+30N/bseRra
         /NAx0Mw0OusM9yVTo1iApHh+RUh1lBhvXXHs5q/CfcRKS3ZyqPSNicFf/rpz5mW5mlwJ
         JUOBecsPqghIV85RHox9HwqJXpY/XVET8N8gIOkCj7e/wYL6XPI76vvVc8LrHykxN1RB
         kQ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791975395; x=1792580195;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zPHEdS90glsg1krHN0zA7UOVAf+2NQvXNCjI6VwnN5A=;
        b=NLYeqz6Kunit9DU9y0gSMB7esZ0l7b7Pbz20ySC2jTUu3KKgAR375wP98ISVxr3Eux
         47KI2loPXSsPkbQDWb56oXcqdowTYO6+mrvH8RDXie/y2aSlKkYSlmO+rsbUlxLxFfQ+
         dnfXCH8xmKeLgfDxCB20kWl/x4yCQKahZZO7GsNQLtKgE0RJBzHzhosDKW5zw+od7Hj+
         rZtxG9Z3a3ks18PkdYjiqXC5Zl2dNBAtHEURcUS2R3+Tef0SV8FySueQsKdIqTuL7q3z
         7NTueQ/uYcn3kybiIt5gHQjX0uUTEsvtqFj6XK1a+fCT7H+MrSdjdwPMofuKfpF8zIg5
         Bc9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxTytGEilWDhpQij6GR53tVJ/5Tb4SRZsSZkF741uJRwWi0296vBc150AvKt7yFDNmPA0OrKqLm+/2lXqU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJs/UzgMZblNRpapRctvEGjaLQiXfXCOgkNdS/vP3DYLfvL6DL6
	OOtUduiCpeYRv+SKZ+ptWf4SOtKVSwHod7NZCS0WI/FlTM+WW0K+3lfmikAZyw==
X-Gm-Gg: AYBFou0OGlDDd8VjECB9yoyqto64dOqKCq4y8N/Q6nj0IcKL5CDiVnp3Mmx2t2OtlFS
	lU4LBO3cQaeW9ScmPLrCYU0GwJYLIiehlTPAGQCUD/NfHqgtYaIL4IdW2p++YXxyoVNjN6hrTqP
	jr4t3KniZ8gtxCE0tggXTaPi8zd04MC1xjbWOisSWDmL19NZ1MPjfVq5dkp0/2wj2O2fNZjeKGy
	JIZV20k666DSFdCaHxQrOjSXw6HauCP1ukC5N/EpQWBr5EYxNWB0tHE8zK8W6VK7usA4onWcAND
	DU3RQsuq0ecDI2AXyTVBxxdNTbR7KZdL9YyWiAFCh5AYR22XCSzvjKHEQzFQmCW6ATVP7AFO60i
	5eCy3EcA2R1Dptrtx0Kj37UEZxHkJKtq/XG70okj4sZdaNXiKtexaiN3djJlbPh/8wNBN0pMNZT
	XVLYZzXnGVTI9LQlvEaWMSb0sQypRTLVvTixaW+NF/VM7ppur9YYvnDmnH9M9oZm2BzkDfQKUYw
	KIo0lrdYwzXYCWjRSS6bqWgxlxR7dQ1x186bmduhNdalVe1zTs=
X-Received: by 2002:a05:600c:46cc:b0:4a1:688d:a41c with SMTP id 5b1f17b1804b1-4a18e4c06a8mr290167455e9.25.1791975394835;
        Wed, 14 Oct 2026 03:56:34 -0700 (PDT)
Received: from DESKTOP-IR7J1S9.localdomain ([154.121.24.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaa9f9sm11281588f8f.19.2026.10.14.03.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 03:56:34 -0700 (PDT)
From: Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gmail.com>
To: Tyler Hicks <code@tyhicks.com>
Cc: Thorsten Blum <blum@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gmail.com>
Subject: [PATCH v2] ecryptfs: replace ecryptfs_from_hex() with hex2bin()
Date: Wed, 14 Oct 2026 11:56:34 +0100
Message-ID: <20261014105634.2858-1-drifabdelmalekmohamedsaid@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ecryptfs_from_hex() relied on the deprecated simple_strtoul(). Rather
than patching it to use kstrtoul(), its intended replacement, remove it
entirely and switch all call sites to the generic hex2bin() helper
from <linux/hex.h>, which already provides the same functionality.

Update call sites with the (u8 *) casts required by hex2bin()'s
signature.

All call sites guarantee that src is at least 2*dst_size bytes,
but nothing guarantees that src is valid hex, and also hex2bin's return
value needs to be checked, so we add a fail early check to call sites.

Signed-off-by: Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gmail.com>
---
v2:
 - Added fail early check for hex2bin's return value
 - Fixed doubline empty lines
v1:https://lore.kernel.org/ecryptfs/20260829194528.5652-1-drifabdelmalekmohamedsaid@gmail.com/
 fs/ecryptfs/crypto.c          | 19 -------------------
 fs/ecryptfs/ecryptfs_kernel.h |  2 --
 fs/ecryptfs/keystore.c        | 20 +++++++++++++++++---
 3 files changed, 17 insertions(+), 24 deletions(-)

diff --git a/fs/ecryptfs/crypto.c b/fs/ecryptfs/crypto.c
index e67119b6029c..059294df4b38 100644
--- a/fs/ecryptfs/crypto.c
+++ b/fs/ecryptfs/crypto.c
@@ -29,25 +29,6 @@
 #define DECRYPT		0
 #define ENCRYPT		1
 
-/**
- * ecryptfs_from_hex
- * @dst: Buffer to take the bytes from src hex; must be at least of
- *       size (src_size / 2)
- * @src: Buffer to be converted from a hex string representation to raw value
- * @dst_size: size of dst buffer, or number of hex characters pairs to convert
- */
-void ecryptfs_from_hex(char *dst, char *src, int dst_size)
-{
-	int x;
-	char tmp[3] = { 0, };
-
-	for (x = 0; x < dst_size; x++) {
-		tmp[0] = src[x * 2];
-		tmp[1] = src[x * 2 + 1];
-		dst[x] = (unsigned char)simple_strtol(tmp, NULL, 16);
-	}
-}
-
 static int ecryptfs_crypto_api_algify_cipher_name(char **algified_name,
 						  const char *cipher_name,
 						  const char *chaining_modifier)
diff --git a/fs/ecryptfs/ecryptfs_kernel.h b/fs/ecryptfs/ecryptfs_kernel.h
index 58165928ed1e..0efda4cea71d 100644
--- a/fs/ecryptfs/ecryptfs_kernel.h
+++ b/fs/ecryptfs/ecryptfs_kernel.h
@@ -47,8 +47,6 @@ ecryptfs_to_hex(char *dst, char *src, size_t src_size)
 	*end = '\0';
 }
 
-extern void ecryptfs_from_hex(char *dst, char *src, int dst_size);
-
 struct ecryptfs_key_record {
 	unsigned char type;
 	size_t enc_key_size;
diff --git a/fs/ecryptfs/keystore.c b/fs/ecryptfs/keystore.c
index 51651314b7a6..4aaf62e61f3a 100644
--- a/fs/ecryptfs/keystore.c
+++ b/fs/ecryptfs/keystore.c
@@ -18,6 +18,7 @@
 #include <linux/random.h>
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
+#include <linux/hex.h>
 #include "ecryptfs_kernel.h"
 
 /*
@@ -713,9 +714,14 @@ ecryptfs_write_tag_70_packet(char *dest, size_t *remaining_bytes,
 		goto out_free_unlock;
 	}
 	s->i += s->packet_size_len;
-	ecryptfs_from_hex(&dest[s->i],
+	rc = hex2bin((u8 *)&dest[s->i],
 			  mount_crypt_stat->global_default_fnek_sig,
 			  ECRYPTFS_SIG_SIZE);
+	if (rc) {
+		printk(KERN_ERR "%s: Invalid fnek sig [%s]; rc = [%d]\n",
+			   __func__, mount_crypt_stat->global_default_fnek_sig, rc);
+		goto out_free_unlock;
+	}
 	s->i += ECRYPTFS_SIG_SIZE;
 	s->cipher_code = ecryptfs_code_for_cipher_string(
 		mount_crypt_stat->global_default_fn_cipher_name,
@@ -2015,8 +2021,12 @@ write_tag_1_packet(char *dest, size_t *remaining_bytes,
 	int rc = 0;
 
 	(*packet_size) = 0;
-	ecryptfs_from_hex(key_rec->sig, auth_tok->token.private_key.signature,
+	rc = hex2bin((u8 *)key_rec->sig, auth_tok->token.private_key.signature,
 			  ECRYPTFS_SIG_SIZE);
+	if (rc) {
+		printk(KERN_ERR "Invalid token private key signature; rc = [%d]\n", rc);
+		goto out;
+	}
 	encrypted_session_key_valid = 0;
 	for (i = 0; i < crypt_stat->key_size; i++)
 		encrypted_session_key_valid |=
@@ -2179,8 +2189,12 @@ write_tag_3_packet(char *dest, size_t *remaining_bytes,
 	int rc = 0;
 
 	(*packet_size) = 0;
-	ecryptfs_from_hex(key_rec->sig, auth_tok->token.password.signature,
+	rc = hex2bin((u8 *)key_rec->sig, auth_tok->token.password.signature,
 			  ECRYPTFS_SIG_SIZE);
+	if (rc) {
+		printk(KERN_ERR "Invalid token password signature; rc = [%d]\n", rc);
+		goto out;
+	}
 	rc = ecryptfs_get_tfm_and_mutex_for_cipher_name(&tfm, &tfm_mutex,
 							crypt_stat->cipher);
 	if (unlikely(rc)) {
-- 
2.43.0

