Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793197609;
	b=Eao4+4mQaDov5xLO9iT8Wkj+R7e2xaScafx449F29HgvlB2P/Sx9MfIFlZ6seeGCEZ8Y
	 F6c/tMsJNMKayq3hS6x27K9A2Muxk+t6USqm1hcmK0f1zs2VsMllcf438kKty6YvTeue1
	 N4WGG6LNOqQxfYoMdJMfRwqHpq11/4Efk8eTQQTrpSPsHJiSggJ2IZYCWlb4Gd8w+Y2/H
	 0EgcKzVheli7q/LNqEZAGCDaCStWj1q9jzb87XvXrFTUYliFxcWiCNnJ69n7zRVnR+F+W
	 hQL6RGYrJPyrQiJMD/4vPj9SbN4b+EIeKfCFyvPRCs+ZPzpvLtSypWYAd7EmTx2LFlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793197609;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mAUpM9hp2JPWH7qVzCiMmZQ9MdNMzKuSufpGFP57zjI=;
	b=slMNq+XbGXqIdJc339nqY+IWA67E/s1U1D5Rh3k8zD/9fbiBAoByr73vhq77U1cxVe4d
	 0JMpE2GZuxbNBtewL6pGZcWpthwP1KOtnUomkJYC8E8maVW11zlCIlOJ3+dMuOb5BIUUt
	 joGvJ4tcAwH0lgb3d9LHqeaI1Ev/36rLqx6yAkU9ohL9+JpddSzPoBEE5IhzIWvLBl7iI
	 2PxfKdnrEP0mSMMICHAfCEWYCLeDP92p8aEDO5SDGpPW5cJJkszFv14Zntp43InQBX2UU
	 qyJk81/fTZqs6VmoZLd8EcuKnkcm8RT434mD+/y1/RM4FI6JTC7qT60Nl6uIYf0AnVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pdVan7rM;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437B4606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:26:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 437B4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pdVan7rM
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso2862562eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793197608; x=1793802408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mAUpM9hp2JPWH7qVzCiMmZQ9MdNMzKuSufpGFP57zjI=;
        b=pdVan7rMDZM7NKWH+O5IGlX1yGDtitzpKHJQxhL4R8ucesVs9X8Xcb30l6Jc5MZLJk
         GPjhbUTOJAjYFnyBmASUngPocuIpIqc+qR6vbklKDkpwAdrzSSllz3QXrmJpGRf7kIvO
         /0YCqMMljVU9dCUO+41AAKOehtwZ1ApgNSz39cjVHuDwcaVTFk8R3npdvuuvw0yUKyY+
         JyQzs23d53KMIVuHuUNr3unkc/qpAE0HwdNnOEGGeoCecqE+yDMCWTlGPx85xL2rtqZN
         oZfsERiBkL0aXBcHa/Dd+q8MCzJtuzdR9QfsHe5+EiRw6yjBNCJLnsMKBc5Yn+lCvAW1
         OYtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793197608; x=1793802408;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mAUpM9hp2JPWH7qVzCiMmZQ9MdNMzKuSufpGFP57zjI=;
        b=rSH3to9HDkPX3oo8sdWE2qgNDDR/ZMnkR3KzHr8pv5FpXfAKtrKsoOeojwlQN1jcwD
         WRsr7j2HwQRdPIAT910Uo7qCaXPmKiCpIVqvY9acjpm6rfxjHUun9/nU02KIRurljBf/
         Zw5wHyDciK3O5V6ZWvDzODr85HYqF/ztbhVpOlbs2OvREEPqVHmhkDa0ibswUKXj32AJ
         lJKEbsvqIgEDYF79PvCsq31ECUIWXggp0sngFkPXzGgNb1kG/eccbsS5b90U8ETn+LaM
         8nDHLggIQJoMdP8SsoVz4f/3LwFWqZadD9xuMxMAt7xAr2D2zy8p783DY0T/ZkZz0u1M
         t0UQ==
X-Forwarded-Encrypted: i=1; AKwUvBx2ydHycrlUGVsTLVj6Mqb10lk/+FoXC7/0i7a5dZX69uYBdK78bplAm78ldGjPHnpKmI8XtGXlYGWWSDU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKMvGHtFhaMYTiq3Q/W3hPWc7AQAI65QT4lYzZrls0oZUAQfZNI
	zhuBMeKGn/nDnamTK00eQ2d5xCnO515t93GfVDlbUdyZbKp0bbXCUNR0
X-Gm-Gg: AYBFou0y8cV1Avrqzyuw2nHYkEBCT1LLEnmAz0ZpFziyOgOswwl276V9x7SHl2lnJko
	QOoKw7aevYteZ2iKuXjTm5pZBKek5dWgOYqCu2UTx+bX1+me3mj02NQuocGxh5UCWWSLgbz4SIc
	60ECBpHzSvJ8hx2yKe5dsfw/H+HZJo8dzY1uXHnFMxjM9bLD8Oe6RNj0vpkLmmQ1bgKQyyQHCgp
	oyfs4l7rDO0hNjLZwnijOw1Vrq4nwSHwu20x1Pip7zSbKaAo4vJLNLgskxBpPk3OA3xJOUrGUwq
	C2wS7hBcuPafnXWDGKl6SJmrFq68q0UZlX0wLkiWUFZSspAiT5iUzCByl8HK1qJ0b/nCUI/J4cL
	TWj77p6TRblFkxJ86vqbnqX2IRZ4FItEzz9Co3d99ZAOOJpqHE1YZjse313i4TUeUcLrdEPwQcE
	9Q2xqZRw1GcrN8Ox7gmlvLi/7yerhmBQ9QyrOxlTyks99xqg/TL7d9XzrlHRdUomKCkiO/ZCvtq
	hSOxEp0vsLRGUfM4/7pn7RFErBhnIQJt4ZWiznEexdnbJ/IqWogxeItkyRedj8Q+4yj4PlQXvry
	c2wNqBpbZwqFK4bu+kDvgEvpuoAH4JmzO6iQc/5o4MJ1BryLVYudVP81CVZC0zEMq+g8nDk=
X-Received: by 2002:a05:7300:f0ce:b0:35d:d9a9:e455 with SMTP id 5a478bee46e88-36a203f3c8bmr3950191eec.21.1793197607827;
        Wed, 28 Oct 2026 07:26:47 -0700 (PDT)
Received: from kernel ([223.181.214.113])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a2398fa4csm8689638eec.24.2026.10.28.07.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 07:26:47 -0700 (PDT)
From: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
To: ebiggers@kernel.org
Cc: ardb@kernel.org,
	Jason@zx2c4.com,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
Subject: [PATCH] lib/crypto: aes: use memzero_explicit() instead of memset()
Date: Wed, 28 Oct 2026 19:56:36 +0530
Message-ID: <20261028142636.5888-1-raizudeen.kerneldev@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

aes_gcm_decrypt() and aes_ccm_decrypt() use plain memset() to wipe the
output buffer when authentication fails. But the compiler can optimize
that wipe away, so use memzero_explicit() instead of memset().

This matches every other sensitive wipes in this file, which already
uses memzero_explicit() for keystream blocks, tmp buffers, ctx
teardowns.

Signed-off-by: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
---
 lib/crypto/aes.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/crypto/aes.c b/lib/crypto/aes.c
index e1c191551736..7814ef525239 100644
--- a/lib/crypto/aes.c
+++ b/lib/crypto/aes.c
@@ -1733,7 +1733,7 @@ int aes_gcm_decrypt(u8 *dst, const u8 *src, size_t data_len, const u8 *authtag,
 		 * Clear the inauthentic decrypted data so that callers won't
 		 * receive it even if they fail to correctly handle errors.
 		 */
-		memset(dst, 0, data_len);
+		memzero_explicit(dst, data_len);
 	}
 	return err;
 }
@@ -2074,7 +2074,7 @@ int aes_ccm_decrypt(u8 *dst, const u8 *src, size_t data_len, const u8 *authtag,
 		 * Clear the inauthentic decrypted data so that callers won't
 		 * receive it even if they fail to correctly handle errors.
 		 */
-		memset(dst, 0, data_len);
+		memzero_explicit(dst, data_len);
 	}
 	return err;
 }
-- 
2.53.0

