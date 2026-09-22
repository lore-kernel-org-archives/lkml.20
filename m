Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8CB3E51D4
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790054238; cv=none; b=l6BowzpliEA9TAuHmI8LQ/gN7nhym1sAoYBHwnaVBLGpzwrmBZEvYDetWFBRIh5j3YcmpgwYFZ0qUTz1ztD+/o3lS6yYnxSciX6/dWZFrRR0VNU5Knggnlbv2vWaRKCrLfR7Y5aUd5K5R5tAsTswWslW16lMaf1FsNfH8eaLM1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790054238; c=relaxed/simple;
	bh=A3i2cfGnNeXe3VK7tWQw8db/YdEXjMvobLDdQsMlEUc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oAN8ZAWDGB/4cr8UBKBq2ImVNn0X2i23ssKBpI3OvBWHyX9rgzD3aPMUGrWe5xwyLIlOwgLAbFhO5kQkRyZUX1RRZYiX7ZktJY7hGeSDHLd70u6Re/hpL457Br+0RmQ9NO+vtHInnKuTyiOvQxrUIgNEhn+2Q/nqABGZOB+6cvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ORFWwpiB; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ORFWwpiB"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485b1d2874fso1328342f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790054234; x=1790659034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NlrXH2S4Gx6RyWaX9xgNBU26d2RYRNGe8s5uLAI9foA=;
        b=ORFWwpiBHeq1hUBE+1sV6pezoUoJ/KJ1wvavgzxBnecI8LLvlF8JW8zu7eF1NhK2uQ
         XGH3EWZIfD8NKaiMq3mPvxAbuh3Yju9pIyzsC9e1f+764yKPAFkaEpjjQLSqW3IEflBL
         HuSUkSmafQV5+gs4/H4O70RXEFk5StO70stm9tH9oC4uDGl2jlOUpvnmIrz/RZgEJNvp
         yHAYhsnO/Cnwzq2IJBxyoUEbq+3XKmGBxlQfWipH3Bs5bSNbCxZZLQJ5aZWe8QqF8nmS
         u/3SNysYU5iEkIZl1OubHr4Zh7JZ1R3DYbCFCLu44Lc0OmR4WbloKDO7pEqMcPSCAnVD
         x5Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790054234; x=1790659034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NlrXH2S4Gx6RyWaX9xgNBU26d2RYRNGe8s5uLAI9foA=;
        b=mmYP6rBhbQ1x5c3P397ZlZy6hlpKXQWztzmZVfbvxtJf0oO3bP/Xhv+z3Til5aNgnY
         dFMWINvwcXCuFe8bP/jyrmBBoIS+Z/6xr+2rpddJCDRFl2lP3XHQkWtAdVCX3uXWVA6Z
         lp/VSel4BgxQ/0mtC5Cg7RwEEH2QySwZS3FPcajuUUoWTiTuWzFY6sBzuspETrZTWeYa
         +GgS29eU9xSisfrOM2ZUntL7+nrC/ikdvs3pTbuGgwLPakbSoIQKiq4zKtK1nOCF+C/j
         rs4ppQVZK/9R1xxZ4QS9A5dQ0fDdHr6pGiEku5p0VuuJ6JvJB0KwM8IQJz7nWUTVQydH
         jGOQ==
X-Forwarded-Encrypted: i=1; AKwUvBza0F2E/XpDS5Gs12DarkWra/HkxM60+vsMeu5smlP9kHQA0WaTIwzm9EFwvEqZwetgmpz4yairfx+mqNE=@vger.kernel.org
X-Gm-Message-State: AFuF++l30s+Q0PeLIHp4Or5ncUTRH42lJT0F/hD2q1DvE12qohPTmS2j
	Yz2XSZT/g7rWZeFI2juWOP47cu6D1yVKtH5fLlIE9TFSKGxVZcV7rsT8
X-Gm-Gg: AYBFou0wkNA1ZeXPmhLEvY7qR9+Y3BMxS74e8D9dGVznCkKPGpxavx70Mm0PQrvhxKa
	wkcZGQMkQOd+z61mf0l8bPXTPlIAY5XrHXb64hiqm0mgR2XBAuFHZlWFj6LXkZOkoY574u9uQoR
	a8j60NjfrrdSsVEQhepMCMT6u53uSLdPbdCno3dJHN4U/biI8xR15wcUnFL4KvPvO7+YwMp1+On
	7xAueXCgoLISf6cNJCgatilg4eCrVlXn+q1ZXC3xH7q6Vgj4zsY6gjnx4NC7Tc96NncD8N/tqcg
	78YUQ6UoMt+jtoSRE9Gmo1bZbPPIpXo0stby0hY8+hmQ53AJbTBSBXGTp9ExHGHIT4kHAY+GE7t
	P0MLIYoCzY3B3cJvzxczbVgW0qPUr3AnhzybEbAPbPbxXjoNdaC9Bkcu1wN+EjUTQViW5odsg5K
	dfuxs8RoAszFRYNsGh/olS0YCCr/rraokYZ1azEm1C6nXecp43x9atlKD79C938wzUDsa0f3K6c
	H+a34y7iaKVSUZp0DISmSNDXTKVJbR5/8vBz6sPnK7wdL+Kpk4KXFkI5dx+gLedKnpFhR7PZV/w
	Y0lVGg+F5za0hgu3WFU68PBAp2Y568rgbX7OvDsSj7SCYfuHLNSUTM2gaiSB3qVb6N9uXiAqtiR
	raoizeQ==
X-Received: by 2002:a05:600c:4f90:b0:49b:8f5e:51fb with SMTP id 5b1f17b1804b1-49fd8853515mr26364115e9.3.1790054234219;
        Mon, 21 Sep 2026 22:17:14 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a5e6-3401-ecdc-1e24-2e52-02d6.310.pool.telefonica.de. [2a02:3100:a5e6:3401:ecdc:1e24:2e52:2d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdaa99b8bsm17264935e9.1.2026.09.21.22.17.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 21 Sep 2026 22:17:12 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Cyrille Pitchen <cyrille.pitchen@atmel.com>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] crypto: atmel: handle authenc requests without plaintext
Date: Tue, 22 Sep 2026 07:17:04 +0200
Message-Id: <20260922051705.15329-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Authenc permits a nonempty associated-data string with no plaintext.  The
Atmel driver accepts such a request, has SHA process the associated data,
and then unconditionally asks AES DMA to transfer zero bytes.  The Atmel
DMA engines reject the zero-length descriptor, so the valid request fails,
normally with -ENOMEM.

Skip the AES transfer when textlen is zero and proceed directly to SHA
finalization.

Once an HMAC transform has cached its inner and outer states, SHA can
complete this path synchronously.  The forced ahash completion callback
then invokes the AES finalizer through a void function and discards its
return value.  This loses -EBADMSG for a mismatched tag and reports
successful decryption.

For synchronous SHA completion, release the SHA device without invoking
the ahash callback and call the AES finalizer directly.  Its result then
propagates through the synchronous call chain.  Keep the existing callback
path for asynchronous completion.

On a SAM9X75, the unpatched driver failed valid AAD-only requests and
returned success for a bad tag after the transform had been used once. With
this change, bad tags return -EBADMSG for both fresh and reused transforms.

Fixes: 89a82ef87e01 ("crypto: atmel-authenc - add support to authenc(hmac(shaX), Y(aes)) modes")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/crypto/atmel-aes.c |  2 ++
 drivers/crypto/atmel-sha.c | 14 ++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/crypto/atmel-aes.c b/drivers/crypto/atmel-aes.c
index 50d97cef75b89..89594b96e28ce 100644
--- a/drivers/crypto/atmel-aes.c
+++ b/drivers/crypto/atmel-aes.c
@@ -1826,6 +1826,8 @@ static int atmel_aes_authenc_transfer(struct atmel_aes_dev *dd, int err,
 		dd->is_async = true;
 	if (err)
 		return atmel_aes_complete(dd, err);
+	if (!rctx->textlen)
+		return atmel_aes_authenc_digest(dd);
 
 	/* Prepare src and dst scatter-lists to transfer cipher/plain texts. */
 	src = scatterwalk_ffwd(rctx->src, req->src, req->assoclen);
diff --git a/drivers/crypto/atmel-sha.c b/drivers/crypto/atmel-sha.c
index 48f54b6155042..f1a37d315dd0f 100644
--- a/drivers/crypto/atmel-sha.c
+++ b/drivers/crypto/atmel-sha.c
@@ -2383,11 +2383,25 @@ static int atmel_sha_authenc_final_done(struct atmel_sha_dev *dd)
 {
 	struct ahash_request *req = dd->req;
 	struct atmel_sha_authenc_reqctx *authctx = ahash_request_ctx(req);
+	atmel_aes_authenc_fn_t cb;
+	struct atmel_aes_dev *aes_dev;
 	size_t i, num_words = authctx->digestlen / sizeof(u32);
 
 	for (i = 0; i < num_words; ++i)
 		authctx->digest[i] = atmel_sha_read(dd, SHA_REG_DIGEST(i));
 
+	if (!dd->is_async) {
+		/*
+		 * Return the AES finalizer's status directly for synchronous requests.
+		 * The ahash callback cannot propagate it.
+		 */
+		cb = authctx->cb;
+		aes_dev = authctx->aes_dev;
+		dd->force_complete = false;
+		(void)atmel_sha_complete(dd, 0);
+		return cb(aes_dev, 0, false);
+	}
+
 	return atmel_sha_complete(dd, 0);
 }
 

base-commit: f0100363d8c374bd8e9ea7c9ba02744f0b802ca4
-- 
2.53.0

