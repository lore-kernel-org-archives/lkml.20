Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39ED2346ADB
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 19:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788032736; cv=none; b=lAuwuRWfu6XMmr5q9YV7/wZ+3HJrRBcyjnn76QrbFl0fAO8HDB7ur9nFORtNZNMPN8kx0RAw0csULpIahCTXHOS250xJgVownQUUGoMmDxwre4JeLKZ1aGriJ4eCwS8QMThBQVOUcf6r8sW8Fy0NO4scxRxj1dVsG+giRo6UxsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788032736; c=relaxed/simple;
	bh=Wn3lHpFAY3tGdDO9+6Ocxf7DHPNZxuJUQTAwBkAJHdQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=in59kazy8Rkdxe8wTLvXxQ7+ywSYSNxIuOOBOXdZ+lrgPf54k1Ct17/Zioh2PIw9Qw3gJOBdyB+6tWv3eT3orrlOs7LUGYoY4+PYByqgo1IgvINup3Ja44P4rZmLfZpQlRnjWE8jQNKI1wni1xBQJuKlxxRWETITmDhUxOt8RGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PjZBrQXp; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PjZBrQXp"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so20900175e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 12:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788032733; x=1788637533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/kbbSrwfc8m59jo6SWrl2+0hoNc0s7nX+Eqw6AC2OSo=;
        b=PjZBrQXpIE/Y6ZtlMOisqYJKpqKCLv2+TZ1lah29Ltt/vNmKaHbDbXBJCxpu3/DvoK
         Rr/uBTmLQT41Q33cyrIe7Sy3H9MukFvxsrS4Lee/QqkVfdWv48qXNda+p1346mQawReE
         augrgbXRFyC/BLguPRWOBoMS90k4XZZE5zjaAiQZfL91R8/Z7rGvk9uSW3aogAkFy5Da
         T0puCGTsTMZLNJMTmW4phN0HKzucaYqpODZxQ7lOXaE9iz7Oa2/L/63l+p6rJHAICD4l
         Fxp2zaUb2roXtuBH8ZTb871srxNF95vMol1LXOlTNheO2yHhEsaW1XoIcw/HFX7XvWLn
         +qKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788032733; x=1788637533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/kbbSrwfc8m59jo6SWrl2+0hoNc0s7nX+Eqw6AC2OSo=;
        b=hlBel9/FykL96gauqp4PT2Sai8pQL7WwQd8qpFqPQe33QsNzwD3SxkHz2NM63/X8A3
         Mju7Hx4gCcVvkOyeynuKgk/QEwlQVwVeZgN6SR3HzOUQ/nYfix/NueRJhBEC9XooilGZ
         /4PeCmlrCutrrk8Ixm4XyGELj4+zLuwjT2ACBPUGHcONZNo4xSzKdDNDXwHpbNBqStb6
         bAeytaQrbr03qtmnDdUwXApHc4vE+w/DKcN0lh+1lErKkruG8QQo8YyvqR6xOUJSLDnn
         N1qkQ+c3SxU1yBFl69apncMCy00B+WWA9T1ItFuVqqyZQuNr/FG+np82HsVvPThT/VY0
         9I7Q==
X-Forwarded-Encrypted: i=1; AHgh+RoOs5hSLAeJ6lWv8grnBXD1TCojeYIE/ZsBNQLUrnqLz6G/aOXn9bf5qhXfK9bb2ogk+AjmJEk+CCCGhX4=@vger.kernel.org
X-Gm-Message-State: AFuF++km3s0X4zWeBjVBE3lBpO1IPyPxydsvXixQ6B6O2t0m9m6UW6Kv
	QfPXZczHFUKkCAbXy6VJn66yxT+JtrXtcXpq/kgTWfryAt3ACuZTQ9Y0
X-Gm-Gg: AR+sD12FdH6OJsW49JmzPfGxH6af1zuMqfcAPswr9GwD4g/p6J7Hs0i/jAsr9J+FtrR
	8IicujPpf4gxQXnEvBM5fxF7KeTgs8LgZhj2kQhaETS139njkaPEW00KbvmrL8bSahzmkyUq4l7
	tVu3D6NhsK++fS5fnpKPo3M6H94/gs0Yk5WWAaELg6eBLWH9qONE743s9bgy+plL5T6lmWnHNEx
	cftJbCrQDZqmpQnJeSSttm6tL9Kl+EDyINvrA3r9S3qbomo3ArZDjqrKiMAahV9ph+yv5EAccEU
	uHouLHTYD9VZ+1hj7fyKCZWLfXtCmTmUG4LMV8Jgn9b+HiZlCs9WlAM8YsOS56vrkynS0borOi8
	q9L4jPaaeU0uuA5HLxuApyxTADZgyUgnVtK+ukLLJB1RH0ZVr2GDgOT+bITAMO1OEBXusRuxaFA
	hSFhch0fnqXuAo9DMv4vsk0coOKtl7JRxAjssM4WMo8ElhJhIiUarXpuSEwTOEwf9K2Gf7HmuuF
	Ye/hHOmbe/A5+2xadVWB5dwllL7sW+2BYy0Mlk=
X-Received: by 2002:a05:600c:c3ce:10b0:49c:a2f3:8cb0 with SMTP id 5b1f17b1804b1-49ca2f38f29mr128279955e9.5.1788032733065;
        Sat, 29 Aug 2026 12:45:33 -0700 (PDT)
Received: from DESKTOP-IR7J1S9.localdomain ([105.98.30.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b49cc6446sm208625785e9.7.2026.08.29.12.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 12:45:32 -0700 (PDT)
From: Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gmail.com>
To: Tyler Hicks <code@tyhicks.com>
Cc: Thorsten Blum <blum@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gmail.com>
Subject: [PATCH] ecryptfs: replace ecryptfs_from_hex() with hex2bin()
Date: Sat, 29 Aug 2026 20:45:28 +0100
Message-ID: <20260829194528.5652-1-drifabdelmalekmohamedsaid@gmail.com>
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

All call sites guarantee src is composed only of valid hex characters
and that src is at least 2*dst_size bytes, so hex2bin()'s stricter
error handling is never triggered here.

Signed-off-by: Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gmail.com>
---
 fs/ecryptfs/crypto.c          | 18 ------------------
 fs/ecryptfs/ecryptfs_kernel.h |  1 -
 fs/ecryptfs/keystore.c        |  7 ++++---
 3 files changed, 4 insertions(+), 22 deletions(-)

diff --git a/fs/ecryptfs/crypto.c b/fs/ecryptfs/crypto.c
index e67119b6029c..7e802fd631a6 100644
--- a/fs/ecryptfs/crypto.c
+++ b/fs/ecryptfs/crypto.c
@@ -29,24 +29,6 @@
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
 
 static int ecryptfs_crypto_api_algify_cipher_name(char **algified_name,
 						  const char *cipher_name,
diff --git a/fs/ecryptfs/ecryptfs_kernel.h b/fs/ecryptfs/ecryptfs_kernel.h
index 58165928ed1e..be91f7c3fc58 100644
--- a/fs/ecryptfs/ecryptfs_kernel.h
+++ b/fs/ecryptfs/ecryptfs_kernel.h
@@ -47,7 +47,6 @@ ecryptfs_to_hex(char *dst, char *src, size_t src_size)
 	*end = '\0';
 }
 
-extern void ecryptfs_from_hex(char *dst, char *src, int dst_size);
 
 struct ecryptfs_key_record {
 	unsigned char type;
diff --git a/fs/ecryptfs/keystore.c b/fs/ecryptfs/keystore.c
index 51651314b7a6..dcfb2e5fa88e 100644
--- a/fs/ecryptfs/keystore.c
+++ b/fs/ecryptfs/keystore.c
@@ -18,6 +18,7 @@
 #include <linux/random.h>
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
+#include <linux/hex.h>
 #include "ecryptfs_kernel.h"
 
 /*
@@ -713,7 +714,7 @@ ecryptfs_write_tag_70_packet(char *dest, size_t *remaining_bytes,
 		goto out_free_unlock;
 	}
 	s->i += s->packet_size_len;
-	ecryptfs_from_hex(&dest[s->i],
+	hex2bin((u8 *)&dest[s->i],
 			  mount_crypt_stat->global_default_fnek_sig,
 			  ECRYPTFS_SIG_SIZE);
 	s->i += ECRYPTFS_SIG_SIZE;
@@ -2015,7 +2016,7 @@ write_tag_1_packet(char *dest, size_t *remaining_bytes,
 	int rc = 0;
 
 	(*packet_size) = 0;
-	ecryptfs_from_hex(key_rec->sig, auth_tok->token.private_key.signature,
+	hex2bin((u8 *)key_rec->sig, auth_tok->token.private_key.signature,
 			  ECRYPTFS_SIG_SIZE);
 	encrypted_session_key_valid = 0;
 	for (i = 0; i < crypt_stat->key_size; i++)
@@ -2179,7 +2180,7 @@ write_tag_3_packet(char *dest, size_t *remaining_bytes,
 	int rc = 0;
 
 	(*packet_size) = 0;
-	ecryptfs_from_hex(key_rec->sig, auth_tok->token.password.signature,
+	hex2bin((u8 *)key_rec->sig, auth_tok->token.password.signature,
 			  ECRYPTFS_SIG_SIZE);
 	rc = ecryptfs_get_tfm_and_mutex_for_cipher_name(&tfm, &tfm_mutex,
 							crypt_stat->cipher);
-- 
2.43.0

