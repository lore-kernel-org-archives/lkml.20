Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DC7318BA6
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 05:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791695738; cv=none; b=SbluwvP8xf3r8PRvR398xFyKqOEGJKOFCUzWiWAkgU89+RQqda3hGVkeUXFri11AvPtav1r3h66lDCNOk3Cc4lKHlTMY61x30fPFugH4G3ishRjveHMpP5peO36v1/GnqFHmd34hCUMahOmbwF/VhbLX+DRCHWJg0OESqHOs1yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791695738; c=relaxed/simple;
	bh=9BunIciQcKJsll7WyEutsDEQR74br6ZN/XmTthqtjSY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CX4pEmzCHAk0pPz77odXPajxCU9xp9r17CIOHGGfri0du4fhRqfFijJbYz4v2+HOSq17k6su3eefGEAV9d5/rNFmgf8lw0xlnieiWOsSV6wn45QKxR9hJ9FGM8g7r9XoMU/zspzijJUWLgXXSp7lYz6FKrNDszQly4TN+Cl985Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gkx+ZtL+; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gkx+ZtL+"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3282db206d3so3535519eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 22:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791695736; x=1792300536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H3Xv76cxiscF9BmNse8Pdd0IVkWBwffvOMSzyozEsUU=;
        b=Gkx+ZtL+GEuzt3snJ2cgpKjhMSwt/cN7MmSa5H2axjHfR0x7V+fz/0w+p3LMVuxSmn
         +hGB/EVto2ORFN5ytisA5l8HM8c9Sdy3Ju5qkuHHN5HF/yVG4KqT8VLrC/ZhDLkCC74U
         eL8yzLrNVAFaInNcrYToSMTv8wqs41iDgLkzBA0GW1/X5w/Wpux+pQpIB7HgZKqwI7pK
         ffee2w3iDsv1ExcDbwaMKTZpXDZtdoAVmd9DWDahG4mLp+kavklzc0/AWi0Dgr8rk5FG
         6n3a0HPndTJJTBABK/MSFPUn0TZajG9uLs9HKrKcdJ1orxBOGDYroWchNf6rLaoKv00W
         yyzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791695736; x=1792300536;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H3Xv76cxiscF9BmNse8Pdd0IVkWBwffvOMSzyozEsUU=;
        b=wrJo83C8MLjJGTgkvB3MtNcmfhOYYNiNHQ7lbdvQh/aDAofloWifi0EvF34/xyL3w5
         by7X6lcaIKJ68o9vY9l22UCcjLmQ3QuOq1vV4rVIjyihu/jYosoxZYWxE02AnLpg0w1P
         6nSSkJ5pe4NdMDWy/BgX4YmMYCVEUpJz/npSgqt5v6Nax96jyeBuo0+OJH57Vfdp/+Ot
         z30daXRJeoDJnWORUtqoH7n/5QuMn8OYk6BjTAe9oiT2YlBLOQPrrfTpGBnMZL+DzOHI
         KjkN5K61Scy9aVVyUyX/vEv5naYUqaWEGwOOmHoOOQyBiYJIu7kUm+qVlECO5hHcsRcs
         NaEg==
X-Forwarded-Encrypted: i=1; AKwUvByc1dYNBCQWd0LATqhf1rHtGJv5s0ts/5Ezf1qW5DFRHJuQKeZxlHffJbN4k827IYsbDSkzneMKdqjzeHg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKj7EvKMbVm0Qr5aaVdDk0MGd5uLiE5zySA+G9pY5VOMime+Xs
	HsOkpulM88ZRCpDHg63t1zzov+DeZgJBTWzf8qMzfGaXeFXhoJV61j0j
X-Gm-Gg: AYBFou0wTiaUgIQNUwhc5oqjpWdyjvMFWWmLQ2PbGK/JG93RHQq2ia3ohd2p282S2og
	WU8iV+1grvNKida5jRJZUOtvplfVEmaoyJ8+d1AnvQPmaIKLCkP1ziCCoU8WV9CUiXJ5E/3Kj5r
	G+YeZWUrgYYa9pV3Lij9cH8wCTojPPnTFXtny49EMBwS7vivESCnYZlV3sPCymimk7GJEUPh9aZ
	9hApJ7vr7zQoXulIGo/Lf1OhPQ2boVXz3dsJr0SZGQg3Y86uifmARrHmtCcdjh7xg0JeXhRnukv
	ZX+SbNzcb5aVSlRVsH3CWImyOC9gGf8gxrQ+tYq2kTV+H28Wo75lXDPVJ9DrScoi2zbvKzefdtm
	+YwoLJ7rbChEDzCtmqk0Ly2CDwL4CEy4fUqKtHLf+0kEtTaBb/9ZeOwnB8rBafkY1Qwu6WXIl1p
	+BfyTIjegmZvfPxfmHAJXra4yCe+Px8q0TlD46PAXf4oJVNeUnSlj327CoRi5NyPrBF+eK0Ygho
	I7uIt5eqRYe6dI=
X-Received: by 2002:a05:7300:4306:b0:34e:67d0:bbb9 with SMTP id 5a478bee46e88-3537e0368fdmr13315398eec.29.1791695736039;
        Sat, 10 Oct 2026 22:15:36 -0700 (PDT)
Received: from kernel ([45.251.35.97])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb2954bsm21382050eec.26.2026.10.10.22.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 22:15:35 -0700 (PDT)
From: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
To: ebiggers@kernel.org,
	ardb@kernel.org,
	Jason@zx2c4.com
Cc: skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
Subject: [PATCH] lib/crypto: sha1: use put_unaligned_be64() for length encoding
Date: Sun, 11 Oct 2026 10:45:24 +0530
Message-ID: <20261011051524.6703-1-raizudeen.kerneldev@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SHA1 final code in __sha1_final() and hmac_sha1_final() writes the
64-bit message bit length of the SHA1 padding using direct access
pointer casts:

`*(__be64 *)&ctx->buf[SHA1_BLOCK_SIZE - 8] = cpu_to_be64(bitcount);`
`*(__be32 *)&ctx->sha_ctx.buf[SHA1_BLOCK_SIZE - 4] =
	 cpu_to_be32(8 * (SHA1_BLOCK_SIZE + SHA1_DIGEST_SIZE));`

The rest of this file already uses the unaligned access helpers like
get_unaligned_be32() for reading input and put_unaligned_be32() for writing
the digest, for all structured buffer accesses. Replace both casts with
put_unaligned_be64() for consistency.

In hmac_sha1_final(), this also writes the full 64-bit length field
explicitly rather than writing only 32 bits and relying on a preceding
memset() to zero the upper 32 bits. The resulting bytes are identical,
nothing changes functionally.

Signed-off-by: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
---
 lib/crypto/sha1.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/crypto/sha1.c b/lib/crypto/sha1.c
index b687b89d97cb..17d97160d578 100644
--- a/lib/crypto/sha1.c
+++ b/lib/crypto/sha1.c
@@ -183,7 +183,7 @@ static void __sha1_final(struct sha1_ctx *ctx, u8 out[SHA1_DIGEST_SIZE])
 		partial = 0;
 	}
 	memset(&ctx->buf[partial], 0, SHA1_BLOCK_SIZE - 8 - partial);
-	*(__be64 *)&ctx->buf[SHA1_BLOCK_SIZE - 8] = cpu_to_be64(bitcount);
+	put_unaligned_be64(bitcount, &ctx->buf[SHA1_BLOCK_SIZE - 8]);
 	sha1_blocks(&ctx->state, ctx->buf, 1);
 
 	for (size_t i = 0; i < SHA1_DIGEST_SIZE; i += 4)
@@ -267,8 +267,8 @@ void hmac_sha1_final(struct hmac_sha1_ctx *ctx, u8 out[SHA1_DIGEST_SIZE])
 	memset(&ctx->sha_ctx.buf[SHA1_DIGEST_SIZE], 0,
 	       SHA1_BLOCK_SIZE - SHA1_DIGEST_SIZE);
 	ctx->sha_ctx.buf[SHA1_DIGEST_SIZE] = 0x80;
-	*(__be32 *)&ctx->sha_ctx.buf[SHA1_BLOCK_SIZE - 4] =
-		cpu_to_be32(8 * (SHA1_BLOCK_SIZE + SHA1_DIGEST_SIZE));
+	put_unaligned_be64((u64)8 * (SHA1_BLOCK_SIZE + SHA1_DIGEST_SIZE),
+			&ctx->sha_ctx.buf[SHA1_BLOCK_SIZE - 8]);
 
 	/* Compute the outer hash, which gives the HMAC value. */
 	sha1_blocks(&ctx->ostate, ctx->sha_ctx.buf, 1);
-- 
2.53.0

