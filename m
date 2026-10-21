Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792581554;
	b=cirVjLmbirOUbM40h2lXD9Losiryd5YwlVZEhTnlvvIDp0+97CUPjYrWkEct/WjHwHeU
	 c/AgK5orX5T+CEQ16uzaLVI8kEWi7JtiY+5TO3Bt6q4iqfYyJk0jVczKWPDPDA0rSmeFV
	 VoBZwfnwY0Gibd8AlGFyX73kHVY9AqoBJP7zJWdfTXqC0KRO+70U5wraYYaWzZhr6pawO
	 M0Y6aQHoiO+cItXPB+LyNd4yfUNlNscVqfdyDrH5qXYIRDL99vkVODxmWN+zD4NrSPOpF
	 Zt7Jxsx3p+9PvZAm7GrM8Anyc47EVByn8voShXPn1iJDFlxbGZGbrdamd560cq+H43A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792581554;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=o4GqgC/8uo2HzaoUqlTv+3o9qdHmo/p865F4COeyagY=;
	b=xE6vZH27/ridEjkSx5zikR84F88DXU05pw9olQ1ifI05BOmZHT//cefV2xLlmrdtfNHH
	 zC6SBY7u05Z2CrXvRpwP3jh1+4BH2FS92zbn604rJnm0WpiVk9GBtN50Wwc+AEG89RmNk
	 shdv/wIos/OCCKqcLJpWHg0oKHVNTwe/wIF+I03yWg9LdJy4MlcEqPp45vy9e+voaJPwE
	 TM868OmbT+kUQONgJ57VaeoCgLPr28e4ojyS6wMcw5i7xKY9S9NSpoF1RkwC+3dtl7Uzn
	 RaLxzHyKcV2V9q29lUllRXys4P+OjUTmB/mFzAzIOKKJFUjQ+POY4CYb6ioTdQUUmqQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OdTQxZhU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBEC8606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:19:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBEC8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OdTQxZhU
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c45551fa84eso77160666b.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:19:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792581552; cv=none;
        d=google.com; s=arc-20260327;
        b=kZaoYkcf+sNJkMKgdcyZ2wDnq0b/YuK1bCtJVMMJsLI9PGeFmxabHT3rjRDuxa0hqP
         4ey1tEXdDuHMLMPm5oanfcxmmbSJ4fCVoBKTC+rgvFtswdd+97Zacbk/NjPKM17Jn47W
         JcFWW+ZVrmhwrzRioPawM88YjkWgvLWe110U3vVX5IfKIjP4cYSik02HIUzH4KD/3+Gp
         fCu5JrF6DeXJeyE3WKHuCjgh3LEgYdCexFvlRDx3Ju69d+pOlXoiBwfneExJT6ynV+Ys
         nNpr+O+/FogWbsglCI+T6krD6Q0obB8cxPLK9ZeC8gOWnr36N+CVT+C1evK2NKBmVfgF
         kA+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=o4GqgC/8uo2HzaoUqlTv+3o9qdHmo/p865F4COeyagY=;
        fh=0vs3t1yhArPOXoU+xsSWOlnCyZtFqYifyLOBqTdTW9Q=;
        b=PTQu68kGG0lZjxL5CV4dI3aHPFgg7OkOwMLt+d4QjvPEtb9qqqu9lxuMvZ0y/H2iEQ
         S6L/cJyfyzXDCN1qXiMgZ28y2yACptSOlluRTeSi1aMA4HrQ8i6Xtt+OTMbysjaoe/ue
         Knxa6LDDnQwsqRjIPoWwddKWP4dj+NjI4i4Y7xQhmibogZUQIz4fn4I2hWSjqp2n6fV9
         ZlP5MP0HEieMlxpJyWfeeEE/fCOqODuX74IeQqw/mMB9hrKfn/609TqHisYqYrGFSbZ8
         6I4LPfiA+UFWvzf/gSTJ3BB7bDbyVYpavJlchqmOnZUN1SN42KWoBadb2GS8PxM5b3OF
         hk8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792581552; x=1793186352; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o4GqgC/8uo2HzaoUqlTv+3o9qdHmo/p865F4COeyagY=;
        b=OdTQxZhUXfbcrZCBYp3yHotpszVXdULIYN/rEwoLPO4S/UQXkDoEiMZtH+Lnd7v+/8
         SasnUNOOtRk5YshNiHEHp7b79tptB8Pux5rAd5p+gu6x7K+ipvATspyXRo9kerLbAcy/
         jmPeS+dnfrT5Vz2wXz2eaHva9PEflF6U3Qm7AHmmA8Y2XkUKSMqGaWy4dT/GhPQljGCn
         UxTq5/j0/3rvY5XXNfuOq7fp4kcmXP00WMpdGdpjV6Le+U8zOGXMs0FY10wKNhU6F9y1
         Dd9kOwRxcQyFW8tHdUypMvlX5hx7pf9o1VU3DChJpHg1BS8gd65a0IP5prBmN/+VEAqs
         jCmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792581552; x=1793186352;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=o4GqgC/8uo2HzaoUqlTv+3o9qdHmo/p865F4COeyagY=;
        b=qt8G3I41kZlKPzBB4JeeL9DX5k4tEKefLbkZcRjiGRZYc+uVZ2UfVMyyeomnYD4UnN
         xAwbkSF/M9liESlCVHl3iyb7nQQPkKWowlwDqCf8atog6Iz7E0EqSwFUpiWdSsLzW9tF
         bLi/qdEhBYabVJn8pjAbIf5iLauAaoDu5ApJfRMeTdSNvBPZTimxuBiZ10+nEqedhIST
         sVndbm5zOpuA0mhgoq3W5MihaYSn8tjIYeOv4mEoqylbQlU7TgDe7jVRvFcPw75ng5cZ
         KUDOQzJedahoEkJMpv4DHtrKJ/rtKZf5wx8qk66nqapwHfMTa2DADRT9e5yjhgmIeGXU
         kndA==
X-Forwarded-Encrypted: i=1; AKwUvBw2bH2HVlYNATZ0NBX666IvIHxSB3+SrvdVtUq+mceQUndWyZX5nZWKmNSX0MkwpLTO3Itl9K/YbkuJ88k=@vger.kernel.org
X-Gm-Message-State: AFq9FYLhFqUAruAElc3Pv/LvpQ9Z8ynKp+7O28GaWRDKP85pHosdEHF7
	iw5hcWKCUdFNq3a7QUx/BhCDLX57Xn2jHvgK9SzXSP1TKiMvmtet2br7BP0wXAD6qU5k0qqLIJA
	pzWrAWpFsBD4DdmpKWQ5fQdjQDYD7Cv4=
X-Gm-Gg: AYBFou3QeQ+2wTVxY97icnA/oWolmT1nojBbF6pdVMmZooH7GgePl3vDfx1sZpkCukz
	PkzBB5pJpy1AdR4+fpP4vt+vv5vMganjYCjWEGLyDUElEz82hS4hRiI98LjmthRO3D3VVR/Ttls
	bx7peECa/yMtG5D2V6VWFNnGfjOuNfSjneF+ylEInBlG+CmO6eucY38CxiDthLMw2Da/GVS/+FA
	rrc/PcNCnoFR7imecvKVACX2aDH8K3luenV37GIvR4Z3Y3hglzd0d3Mpx3DcCpnrf/FI+fo2m18
	Qa/qcXFVM3hIGf9jCBxfNkn83NwDVjuhaQoJ9tVyPJYaZyJnLmItkYpW4ipcO2ZXN1JKg9dR41I
	L4YTK0A+XS7nqVWDlWRLdJyFMxvMe02BjuPEiVg==
X-Received: by 2002:a17:907:9608:b0:c28:599b:7782 with SMTP id
 a640c23a62f3a-c467959800cmr145664366b.21.1792581552020; Wed, 21 Oct 2026
 04:19:12 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: DRIF ABDELMALEK MOHAMED SAID <drifabdelmalekmohamedsaid@gmail.com>
Date: Wed, 21 Oct 2026 12:19:00 +0100
X-Gm-Features: AclHuK95cnmQUwRjUGBQFe8hBFruDLBNtySqrDloIqyCO5VZ-yqafKYk9aUkxq4
Message-ID: <CA+xk8n-n535aeZLEYeENYXzhrp54cBHtp5kGxt85qERk4ECd9Q@mail.gmail.com>
Subject: [PATCH v2] ecryptfs: replace ecryptfs_from_hex() with hex2bin()
To: Tyler Hicks <code@tyhicks.com>, Christian Brauner <brauner@kernel.org>
Cc: Thorsten Blum <blum@kernel.org>, Eric Biggers <ebiggers@kernel.org>, linux-kernel@vger.kernel.org, 
	ecryptfs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

ecryptfs_from_hex() relied on the deprecated simple_strtoul(). Rather
than patching it to use kstrtoul(), its intended replacement, remove it
entirely and switch all call sites to the generic hex2bin() helper
from <linux/hex.h>, which already provides the same functionality.

Update call sites with the (u8 *) casts required by hex2bin()'s
signature.

All call sites guarantee that src is at least 2*dst_size bytes,
but nothing guarantees that src is valid hex, and also hex2bin's return
value needs to be checked, so we add a fail early check to call sites.

Signed-off-by: Drif Abdelmalek Mohamed Said
<drifabdelmalekmohamedsaid@gmail.com>
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
 #define DECRYPT                0
 #define ENCRYPT                1

-/**
- * ecryptfs_from_hex
- * @dst: Buffer to take the bytes from src hex; must be at least of
- *       size (src_size / 2)
- * @src: Buffer to be converted from a hex string representation to raw value
- * @dst_size: size of dst buffer, or number of hex characters pairs to convert
- */
-void ecryptfs_from_hex(char *dst, char *src, int dst_size)
-{
-       int x;
-       char tmp[3] = { 0, };
-
-       for (x = 0; x < dst_size; x++) {
-               tmp[0] = src[x * 2];
-               tmp[1] = src[x * 2 + 1];
-               dst[x] = (unsigned char)simple_strtol(tmp, NULL, 16);
-       }
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
@@ -713,9 +714,14 @@ ecryptfs_write_tag_70_packet(char *dest, size_t
*remaining_bytes,
                goto out_free_unlock;
        }
        s->i += s->packet_size_len;
-       ecryptfs_from_hex(&dest[s->i],
+       rc = hex2bin((u8 *)&dest[s->i],
                          mount_crypt_stat->global_default_fnek_sig,
                          ECRYPTFS_SIG_SIZE);
+       if (rc) {
+               printk(KERN_ERR "%s: Invalid fnek sig [%s]; rc = [%d]\n",
+                          __func__,
mount_crypt_stat->global_default_fnek_sig, rc);
+               goto out_free_unlock;
+       }
        s->i += ECRYPTFS_SIG_SIZE;
        s->cipher_code = ecryptfs_code_for_cipher_string(
                mount_crypt_stat->global_default_fn_cipher_name,
@@ -2015,8 +2021,12 @@ write_tag_1_packet(char *dest, size_t *remaining_bytes,
        int rc = 0;

        (*packet_size) = 0;
-       ecryptfs_from_hex(key_rec->sig, auth_tok->token.private_key.signature,
+       rc = hex2bin((u8 *)key_rec->sig, auth_tok->token.private_key.signature,
                          ECRYPTFS_SIG_SIZE);
+       if (rc) {
+               printk(KERN_ERR "Invalid token private key signature;
rc = [%d]\n", rc);
+               goto out;
+       }
        encrypted_session_key_valid = 0;
        for (i = 0; i < crypt_stat->key_size; i++)
                encrypted_session_key_valid |=
@@ -2179,8 +2189,12 @@ write_tag_3_packet(char *dest, size_t *remaining_bytes,
        int rc = 0;

        (*packet_size) = 0;
-       ecryptfs_from_hex(key_rec->sig, auth_tok->token.password.signature,
+       rc = hex2bin((u8 *)key_rec->sig, auth_tok->token.password.signature,
                          ECRYPTFS_SIG_SIZE);
+       if (rc) {
+               printk(KERN_ERR "Invalid token password signature; rc
= [%d]\n", rc);
+               goto out;
+       }
        rc = ecryptfs_get_tfm_and_mutex_for_cipher_name(&tfm, &tfm_mutex,
                                                        crypt_stat->cipher);
        if (unlikely(rc)) {
--
2.43.0
