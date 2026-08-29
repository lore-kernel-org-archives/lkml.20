Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E41233970F
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 04:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787979281; cv=none; b=Xc0Q/JMCj2HDrGNKeXbYeRdSKmW3ccyLumAUEFxTk95XDl/hF520RVYGeMkYepBzR6WXw4tlgKDfeqZI7vsRg9lSg8Suiu+xFm6KMsamGI3Y2lulrWk6tF53FMp82mCOBsEgLjg371FB9mmC7E4drQKoPWBYixLaD+MPLG4YMm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787979281; c=relaxed/simple;
	bh=e1hU0d61e7p2cPaLyPvJL5Pgg9YG8LD5tQKRy7MucZk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mAevzkSO0X/tbnIPK8e2uibJOIZfA8ymfjcFKKq6vrdDJvKYlGqLanpSMA2L+5ZlwYPVDPSQ7+zmF23pmnn3la8nL0WhfW03ePNjszk2QKSVaf5I/GsFtAYaC4bIZHtR+c3boYTOXq/GYmbqisOeyFDe84PC+YJk2jySAJdxVC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ip0zysSb; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ip0zysSb"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-482ddbc11aaso1338038f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 21:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787979278; x=1788584078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6h7QlRJbPGmBtyZJll3w8PHkLoVkTYXG4+bbNBuj1qw=;
        b=Ip0zysSbzKOW0+C0fLZGNQgcZmwcFurdOL6OaiLozi4xVCq7VwspXsCJN7ZDWgpici
         u55xSYLc46mPkgeV7NfupxHxzKPdiNbUFtdQUj9vP+cDAC0/UJRMvuio3q4o3ggGd3r+
         yKpmbp0ntbYNOSUMx8QiLagrRhhVxDml3yWb15RrcY0xWDcw1U4Vh8IVxzTAXmTZxlyC
         6QyB9RTcqzG2vjuSrDuvkvcg9SxUap0+oq04nXgo5qao4gYjhxjT+wxBjbh3QKItQoQ1
         mhFTHFLNQxWT79+BKPVCYAdDV8mJTrauhQojHOBKhwstCQVIDMLGXl7rG5rzpigHaklH
         rxVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787979278; x=1788584078;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6h7QlRJbPGmBtyZJll3w8PHkLoVkTYXG4+bbNBuj1qw=;
        b=oyQyda3Hs31a3f/x0Vj1St94sq8FnRinRsdAH6H6iFqAg1+Rk31a/A/PeG3nZhrUI7
         Xj86iJ6wSBPAUG01g4trZXXCuu21LMCNw5Jf5eEAUJts+0vJniI58NJ0lbIKFLRt6baF
         ByrOzsc2d8W1r3mZ39hWpmRmYTw97wBMMeO6hkDrzcBQ+uh6rQvzGX/DQ9Wn8/xyPPjc
         IfLsDBXs/cbsMBbifZhHnxq8OYIxhPgjqPusvwTRyxWKPH5IvJdJcVSBbiQHukhqBY6n
         1oRJXn/W0SBDgAB4IX4eNH6AROuUAW9+gk1vAIDI8T4pa4PMy4W8qlP1IYfWbNIsVV20
         02WQ==
X-Forwarded-Encrypted: i=1; AKwUvBxfEHTm4Yz6JJ/AwZ42QE/tp4CIafVb1kjyDTG5rcl/bdwSrPDZo5XePPeXOxhk5/KPyW7dUsGhdN8lx8g=@vger.kernel.org
X-Gm-Message-State: AFuF++k3r5sg5VHjhuCEMmHoVrOkxzKxPGL+w19k5RxFBvLyEEaxxskh
	yzpbR4e57tdJu5p/DDnBfNqusleMQ5IMWm1aAKONixPmBRYXGQz2BxxY
X-Gm-Gg: AYBFou0IPmTmAi/PwtB3jBgVj9FhGJco8kMgYJ6nSP4GybCXjmJkWdYIlP0HNE7ptLg
	A+2juT5mz0C62tCwUGQihmJ22raOr5HlOOEZ1uI1/znHFDqMAyWyrgnNLqs2PfzW0FeEyviqshF
	X9KyS2d2OUyvTu63EQ95VKCu0oH0oF5EmqpHRQt+MXBI4+jSpObFhEvCe3uvqqBXp8oKVgv5Zoo
	9GzxLD0zlGEQW7xXRZ81xXmS2tfgQRlKtvL6pOTrw8TUKoLPSR0KMmLVFaDKoG3gOPh6lzubBWQ
	nAbUMW9DloSitr784mo4ncToTvkMEP17QjIGzJQB0duA2D9ZOe5dczNlr7Ld9h99NXG00yM2/eI
	CdJr7m2Z1dPVHw1E7AuA8dpwp4PckD/hHB8dE2X1tCYhBe9B0Mj0XG89pi2kxADYab7aU4ouee/
	uA9uQxzMnI8nv4HUttu4X4r39KIianIxQ+yGs2MhiRFaknNbQyI314k7K+y9GftArfUCEHZN0iQ
	hw3fOfRo26Uig4yYPfN4U/Li43Nx4JUxqO+2aRmUjaPrsWQJE8yJYgoA3jaeR51Fvyuw05TWnMd
	4gXFBxjhmw9obryMD6GW
X-Received: by 2002:a05:6000:4a0f:b0:482:e451:680c with SMTP id ffacd0b85a97d-482f79a7553mr19353727f8f.8.1787979278069;
        Fri, 28 Aug 2026 21:54:38 -0700 (PDT)
Received: from localhost.localdomain (dynamic-077-007-015-136.77.7.pool.telefonica.de. [77.7.15.136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbac4e24sm8111368f8f.9.2026.08.28.21.54.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 28 Aug 2026 21:54:37 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] crypto: atmel-tdes - sync output bounce buffer before DMA
Date: Sat, 29 Aug 2026 06:53:16 +0200
Message-Id: <20260829045316.92931-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The slow path DMAs into a bounce buffer mapped once at probe with
DMA_FROM_DEVICE.  On reuse, nothing invalidates the CPU cache for it
before the DMA writes, so the copy-out can read stale data.

This was hidden by the copy-out calling dma_sync_single_for_device()
instead of dma_sync_single_for_cpu(): on ARM the misplaced for_device call
invalidates the cache, which is exactly what the missing pre-DMA sync
should have done.  Commit c8a9a647532f ("crypto: atmel-tdes - fix DMA sync
direction") corrected that call.  On ARM926 dma_unmap_area is a no-op, so
for_cpu does not invalidate and the SAM9X60 and SAM9X7 parts lost their
only invalidate.

With CONFIG_CRYPTO_SELFTESTS=y all four DES/TDES algorithms now fail on
SAM9X75:

  alg: skcipher: atmel-ecb-tdes encryption test failed (wrong result) on
  test vector 2, cfg="unaligned buffer, offset=1"

Sync the output buffer for the device before starting the DMA, in both
the PDC and DMA engine paths.

Fixes: c8a9a647532f ("crypto: atmel-tdes - fix DMA sync direction")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Tested on top of:

  crypto: atmel-tdes - zero-initialize device state
  https://lore.kernel.org/r/20260829035821.67220-1-kmehltretter@gmail.com/

Without that fix, on the tested SAM9X75 the DES/TDES self-tests hang on
their first requests before reaching this test vector, so the failure
fixed here is not observable on an otherwise unpatched tree.

The two patches are independent and apply in either order.

 drivers/crypto/atmel-tdes.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/crypto/atmel-tdes.c b/drivers/crypto/atmel-tdes.c
index 2756dab3f4c7..ed80423b4209 100644
--- a/drivers/crypto/atmel-tdes.c
+++ b/drivers/crypto/atmel-tdes.c
@@ -370,6 +370,8 @@ static int atmel_tdes_crypt_pdc(struct atmel_tdes_dev *dd,
 	if (!(dd->flags & TDES_FLAGS_FAST)) {
 		dma_sync_single_for_device(dd->dev, dma_addr_in, length,
 					   DMA_TO_DEVICE);
+		dma_sync_single_for_device(dd->dev, dma_addr_out, length,
+					   DMA_FROM_DEVICE);
 	}
 
 	len32 = DIV_ROUND_UP(length, sizeof(u32));
@@ -402,6 +404,8 @@ static int atmel_tdes_crypt_dma(struct atmel_tdes_dev *dd,
 	if (!(dd->flags & TDES_FLAGS_FAST)) {
 		dma_sync_single_for_device(dd->dev, dma_addr_in, length,
 					   DMA_TO_DEVICE);
+		dma_sync_single_for_device(dd->dev, dma_addr_out, length,
+					   DMA_FROM_DEVICE);
 	}
 
 	addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
-- 
2.39.5 (Apple Git-154)

