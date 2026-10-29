Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793311604;
	b=0vNtDpCDSDFXn319liErksGRXjLsylMWF+HqlWMcmfQivW09L0mYgE032YX2/PJj4Q7L
	 0Sow5Mfx6Dgb29Zg+9SGN+r99F7EU8raSer++/1V3n17ZHcwiEGUqIR9AH/tNGC1VwyLW
	 nQ8AzLmfVT32tQP5erHmJrPiy4mXLQYPd7PIDHoTDu7SX3NKnQy98pX4/cFfasI0fW6Rl
	 yd+8qK7rmBM1L5wz1cSKCaTkRLfCS5llU1tALGhDLvSi5ZL8Fd1tCCa7xDC4klCYIpsR3
	 ouDCNZb2Jl+kYxxdX0VpKNseF4MwYOwhAL5JKFYslOfL9TJjJnhHs8cCouHmfZOcs8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793311604;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CM95CZe0g372W/3tOJOodM15hD4zC+QYzaoxnr6paYk=;
	b=euNAYb2E409exbLepcBIGYGsdOnqjyQ4H5ivTbId96bmi4Ycfit1pC5N5YkQdZNeJI1y
	 ROOG4K9BfhPH/eNEBnL0P0huBJqO/seBHmsNCZNuvNViRj1Mf6OqtVKB1eczZKmDp+JLU
	 0V76d3b2NiUDMIjPMkqShOYzzQ5lR6OypSDwXbqg7AoR9IypoY77U5O6uvNFLjs+FJNOP
	 Go6y+9BdWXV8gTqXWRTONVMAaBmKp4nN9yQBq1uHK0yroLb2J22HinRCd7SYWjgh64ODS
	 p0FUi79awLTutyruTnVTdxu/EBJe8FUdwK4FvtTkToTKKpC2JHUYxUTQsgTGZFSjt8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oZ5rRgMn;
	arc=none smtp.remote-ip=209.85.167.45
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670B260A261D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 22:06:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 670B260A261D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oZ5rRgMn
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5be42ae8eadso100570e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793311603; x=1793916403; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CM95CZe0g372W/3tOJOodM15hD4zC+QYzaoxnr6paYk=;
        b=oZ5rRgMn3RSuBdn/cBqQooDbj1WBhO5sSuLFa8BctNJFppk99D9r0krKoBHRV6Vi58
         0nKT2PAT8VAzmxnXWqY/XW8jwVghCEANdykJYtu3KIu7oNkEeUJYriw3t9rxP6ikgaiB
         vCLcG334yObsKLqnhsENfm+s8lEiWftQPZ5p9UkpNKgreDLpvfdrxkWas/PMPLJ6q8Nw
         gcl/biz9E1iL2KeM5+h5kSltnghWlxVX72XSlqv+F71YCLTieUcIYZhfBlOn2VnTkCOi
         h1/y1w+/rfKaYggLNqCkKdQQSeL5KEjYixURLpxPWSjw/dhbdJ2o7csZsrt91TsdSow1
         yjNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793311603; x=1793916403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CM95CZe0g372W/3tOJOodM15hD4zC+QYzaoxnr6paYk=;
        b=Pb/qS/V+xGKE6EYy8/K86QyNEs6rocaOR46paHOm2ZnUWzZ+dWyYJlnk4146u8xI8t
         luvoprgCFCGGwyfM5Lrfq3LE/EwD2GXET5C01kBZXfIO6TyzrC/vQccpVr3tLIneM8Dg
         RRCNd5/MBbrdaRaN03BifFYsrfWb1PnyExP5vj2uKzXP9Pxq+OPzBz45rCZ+F+gRcjuJ
         ixCHmh/0G9uV3hbf0pHUnQZKC5n5INERO1PnD12nfRvjGZBuZca/QUxBSa3sqfaYMIfL
         CUMSVvoVRf/zCshwjHmonFRYbJ8PP3RLNfYz5vaQapY+adFKaW5/ibrQMh/IuiE2mFRr
         twhg==
X-Forwarded-Encrypted: i=1; AKwUvByGLyrVLgjQqOpgcSXhbP1tMDu5SoW5zb7714toLFgt1Siz/mMCXS1VwnzKPcyEw7sxVv9Ql6peF2WLOeo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJDU/AGbQBzrR9QZylO/nDB5leCsW1nfm5O5cLmJASBaO6JbzCK
	GwtPOIniHIJFGpAomZTBUa0p6RUoCycRf4pRHzmu1E9xMREzqHrNWyUD
X-Gm-Gg: AYBFou0Unxnr72VrF69uUNqxdwftcsFElSg27q8HsSNy4ROEtoJBRBIWMCA7o4RFkW9
	FB/TFjGzFa9wvn/obPhhwnM+pXutBLr/biWpUa2/RnYfqzRJl+6OrIGvm+IocdjV20QPstPVALb
	cH4aQUQQYQCMVMvnQY5EEjAqJjacuO6gjjnmsJgaVSrVpNvbdUPqwnt7D9YQg5X8YDGqss3Z3qB
	i70x2TVZ6XTNMRD2aCp6xa6VyFVzrZgQ+i5J/bDasH+KiT/JuxKYl+YuQjJJy1ujksORLAOMXdt
	HikcLgsaRhIlS/VtlO00NPf5rP+uGCG225gzZ5qwsK4+7vwOKVQd9r3v43vuuUkt3XoidOtatUe
	ud396QnsJSf6tho/3Q3TtQ4c7vwpaflsaeM9cgEuLAvHLD5MWSCLev01sC2cl6NGrir2+T6y89d
	VS4R7xlxR4L2mSzNS/HfknkR5NNJ+IVUfnpr/zXWZW9pJaEKGE4DGDkw1SJrUnRPqSbb83e8T/c
	jOFco9fX7lABhk2sN+/0W6Nj8LyoS92rFfgiY8hvOwBI9IVe9rh8fGckHCLwW2mwkPyvz1XS0nL
	7aMQS6FEg6BW0geHqgBz4FrVdY0C2M6uCoK+rd8GUxUIcJJdyW5ALEQlwCgZE1eDq6353VHbg/u
	zCmg/PyqKI4DdzVyMpWEyZgbve9VWvGh4fuuqbsk=
X-Received: by 2002:a05:6512:2311:b0:5bc:ddf0:d96 with SMTP id 2adb3069b0e04-5bfd957b9a7mr87098e87.59.1793311602508;
        Thu, 29 Oct 2026 15:06:42 -0700 (PDT)
Received: from yantra.. (nekmmqtmquaao4qwdoc-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:6842:e549:8c95:f73c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfd9c507adsm9605e87.65.2026.10.29.15.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 15:06:42 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	Jonathan Cameron <jic23@kernel.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Rupesh Majhi <zoone.rupert@gmail.com>
Cc: linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>,
	Paulius Zaleckas <paulius.zaleckas@gmail.com>
Subject: [PATCH 3/3] iio: pressure: dps310: keep the user's settings across a timeout reset
Date: Fri, 30 Oct 2026 00:06:35 +0200
Message-ID: <20261029220635.18816-4-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029220635.18816-1-zoone.rupert@gmail.com>
References: <20261029220635.18816-1-zoone.rupert@gmail.com>
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

When a sample never becomes ready, the driver resets the chip and runs
startup again, which writes the default rate and ratio. With 64x at
4 Hz set and the chip put in standby, the next read recovers, but both
channels are silently back to 1x at 1 Hz.

The register cache still holds the user's values. Write them back
after the reset, before measuring starts again, and move the defaults
out of dps310_startup() so only probe writes them.

A rate and ratio the chip cannot keep up with, such as 128x at 128 Hz,
now keep timing out instead of falling back to 1x at 1 Hz.

Fixes: 7b4ab4abcea4 ("iio: pressure: dps310: Reset chip after timeout")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260921183132.233136-1-zoone.rupert%40gmail.com
Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
Cc: Paulius Zaleckas <paulius.zaleckas@gmail.com>

 drivers/iio/pressure/dps310.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index 29778f25bb33..c364fbaeb3fe 100644
--- a/drivers/iio/pressure/dps310.c
+++ b/drivers/iio/pressure/dps310.c
@@ -306,10 +306,9 @@ static int dps310_temp_workaround(struct dps310_data *data)
 	return regmap_write(data->regmap, 0x0f, 0x00);
 }
 
-static int dps310_startup(struct dps310_data *data)
+static int dps310_set_defaults(struct dps310_data *data)
 {
 	int rc;
-	int ready;
 
 	/*
 	 * Set up pressure sensor in single sample, one measurement per second
@@ -328,10 +327,14 @@ static int dps310_startup(struct dps310_data *data)
 		return rc;
 
 	/* Temp and pressure shifts are disabled when PRC <= 8 */
-	rc = regmap_write_bits(data->regmap, DPS310_CFG_REG,
-			       DPS310_PRS_SHIFT_EN | DPS310_TMP_SHIFT_EN, 0);
-	if (rc)
-		return rc;
+	return regmap_write_bits(data->regmap, DPS310_CFG_REG,
+				 DPS310_PRS_SHIFT_EN | DPS310_TMP_SHIFT_EN, 0);
+}
+
+static int dps310_startup(struct dps310_data *data)
+{
+	int rc;
+	int ready;
 
 	/* MEAS_CFG doesn't update correctly unless first written with 0 */
 	rc = regmap_write_bits(data->regmap, DPS310_MEAS_CFG,
@@ -551,6 +554,12 @@ static int dps310_reset_reinit(struct dps310_data *data)
 	if (rc)
 		return rc;
 
+	/* Put back the configuration the reset cleared */
+	regcache_mark_dirty(data->regmap);
+	rc = regcache_sync_region(data->regmap, DPS310_PRS_CFG, DPS310_CFG_REG);
+	if (rc)
+		return rc;
+
 	return dps310_startup(data);
 }
 
@@ -1450,6 +1459,10 @@ static int dps310_probe(struct i2c_client *client)
 	if (rc)
 		return rc;
 
+	rc = dps310_set_defaults(data);
+	if (rc)
+		return rc;
+
 	rc = dps310_startup(data);
 	if (rc)
 		return rc;
-- 
2.43.0

