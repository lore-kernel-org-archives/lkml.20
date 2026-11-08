Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794130590;
	b=jVrJZFhUjcSiDpCayzXTr/U8de0PRX2QBrmYfM/wipuyFUjXQuMS2mzsrh2GzU495HvJ
	 o5til27SEXoHZ4GgBIvzJiEl1Qj0IlqSivP2sMFdsOmhJLbP+EolBCE6cAs2hFgsGYMbV
	 CYDBDEwmR72TPIDHnf0g4I9F328a914COGDk1R8ytWMt78mKfyr2srkURFlaLjfV7XuZV
	 ec7auV5B1zu7uHyE8aEiPAxBemAjSzFQNL3ZMxQF8QkT/0/JGF3b0Rp536izFfZgTehhe
	 BACxLAXp0UiV8t3X2UPlB+mMG4c7n58f0uoCRqXzQYIbxnVnHtDLtyFAtsYWfMZdVqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794130590;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jWj9GcN12wF6GVmoc3mTX/JL3hD/rE4SBB8EMeezmfs=;
	b=IphCf/P3EOeitwZVO4T4j9hrLS9A8hR3bzXFRiEe1D9mCYTCMeUwMyvasruePrpi/8rx
	 V2DHPGbntN52YS0Mn9//79YZOUG3eS+N6jfkQtIAvq5hXO5lq4Ft/hdVdzB2f4lfv06Hi
	 HPCI7wldZ/t3lB1q0hR5x/YVP52YU+3RADAluhq+dMOcM95OW90BV+6lm/pF409X/1LcH
	 GsSgYNBjH7pTxi0S1brfE0BpiOrOnDnyi3RqFEfKUmZvNXkADG2nZHPNCNpTf5uo8iqOM
	 dKwEEjbsQc8DCwWm1prlzyAeVnOgSHtJQIqy8/x87Gtjh8YLncqCBtxrOW7ki6gCeAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qW7Sak7N;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE644606A32A
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 09:36:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE644606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qW7Sak7N
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so3146995e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 01:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794130588; x=1794735388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jWj9GcN12wF6GVmoc3mTX/JL3hD/rE4SBB8EMeezmfs=;
        b=qW7Sak7N7mfnFO4DbT0GvoKrTDAllqcuQ5TC7s2RrR4J8vvTiExlj78z+7Q5/jShIk
         y3kBEQFgwHoA74XlsfwN3Q55MwTHNMShx7Lo1RicUnglFJZYQnPddFVmaNRessaaWYuG
         meFunsigD/sgeHWK2wdksn+MAaFVEBGYTc8Qen6TYoLvw2Jt/5HjevTxNaIQ89BV/hLP
         9JB/KLl3PYGFLwCHwEA0DwTcUtrjHYY+nGhIO5DZsoeQbPXe2dOxeddroQ+xLBlgMvD7
         c2FirGBjJhL/LXGR2mT51l2t90v6Xv3YFY+T0L3Obs59ZAKMBa2nU7a4chdRABtBU31w
         6grA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794130588; x=1794735388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jWj9GcN12wF6GVmoc3mTX/JL3hD/rE4SBB8EMeezmfs=;
        b=ahJFiGshmJczB+2eG62HDPM4YDDVBiziFE3qHoDMYvOEel4LOjZBN5xcVxVNbKG/0q
         wDgQDGriLKxpH5zFPVyLxJ6Lc0Z0bfn5QmVGNjwQBFygFPHwJG+eYWX1BCKNQeZgXIm+
         7BCK3TdfpqLTjseOhFKZTlfXkOcD78x43DadDAdYTjm7xSrqQb2ZgRC9dfxzkUeZIXuj
         5VZmaLDsM+3QW7uQL0t9Avc4CeA7stfHgr0iDH0LdPinrVLq8pOT+PInqaO9VV8Bwr6m
         ri9JvUy2aFvW6FGoXmxHdaNuxbUsxEof0F6i8Y0KZc41mM6V06b/tuRE1e8LrOKtav1m
         8G5A==
X-Forwarded-Encrypted: i=1; AL+hErGoTdY+Dns3zfOOZ0qKlP+Sz9vngJKO4VE/NfjSNnUXeoD1VDz8rObBNMCfvfVSlX7X0pnBcizN6GtgNuQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+eB1zpkFWHFSp5fQSbBsAFAqJimAImFRudNnxnEp6Up85ZQjna
	188ke1X6MgYOSVnDptWX/27FRIkeuX8oz/ahuaQ6wXwAMqft+5aSj6mI
X-Gm-Gg: AYBFou2cxkPIQ0Infx4JKjWVK38ttSbvKaOvzVUNqxeNPQ8dx4tWAHrEYISDy4QVoQu
	O4aRvA7wUkaIxahCeehLnxSgZ1ZW68NGM7baYRCDsnZo/Tv0v5fRevWwfC/ZTRgMhvmTwxNPkno
	WsQS3s76SApGWjWlArEDHzDKeHb9f0HkatYCYFpYqBBv4bP+OSE4ObGK1L6uPrMJgk2Cxfb6NeX
	eLlTubW+79FvuS60sVGDoCDLPEpCHkDr+we6AE40nZpxN6iuT3MlRK0y250rScUelyu0yVKp/5R
	GHuToXg3UEhys4Az4YjunRWO3GIBbH61Z5YYSu/R/L58yALv1+4Jd5rCr46EdljWyezglJ9R0XD
	Jf1MvZ2tAkGigbrh7Fvc+oU8J3FHjENMyTevOeBwpXXH4MdDyyw0uGYdE99WaGKrHRFt5EGO5wR
	ngzd/b0Pq8q6t6Zvc4dlXpakYU5GD1+HgEiuzNpoME9hgQJplHvCHSuqaHNDf7CdRGAvwNfJGLw
	jKjZlj2W4ZvCrPl2yeOm2FXjLqgh1X5t9OpJisbUGRy4xYSaklhnEwejDsKhc8vgSMxYuzEM9c+
	12hkcV4HhwwXSoOovJ9sv9sHeUjYKl6/QSYpCnqDkFDwd/Hklt63s1XBYjhbtL4=
X-Received: by 2002:a05:600c:190c:b0:4a2:5ca:767f with SMTP id 5b1f17b1804b1-4b94d7630b0mr19917325e9.4.1794130588173;
        Sun, 08 Nov 2026 01:36:28 -0800 (PST)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e6eca30asm141650355e9.7.2026.11.08.01.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 01:36:27 -0800 (PST)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Andreas Kemnade <andreas@kemnade.info>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/5] regulator: sy7636a: don't wait for power good if already on
Date: Sun,  8 Nov 2026 09:35:58 +0000
Message-ID: <20261108093602.329554-2-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261108093602.329554-1-pmazzini@gmail.com>
References: <20261108093602.329554-1-pmazzini@gmail.com>
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

A boot-on regulator is already on when the core enables it, so there is
no power good edge and the enable waits for the full timeout. Return
early if power good is already set.

Fixes: 9037a00f3845 ("regulator: sy7636a: wait for power good on enable")
Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 drivers/regulator/sy7636a-regulator.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/regulator/sy7636a-regulator.c b/drivers/regulator/sy7636a-regulator.c
index f87144e921da..6269c50348ac 100644
--- a/drivers/regulator/sy7636a-regulator.c
+++ b/drivers/regulator/sy7636a-regulator.c
@@ -90,6 +90,10 @@ static int sy7636a_enable(struct regulator_dev *rdev)
 	if (ret)
 		return ret;
 
+	/* already on, e.g. a boot-on regulator left on by the bootloader */
+	if (gpiod_get_value_cansleep(data->pgood_gpio) > 0)
+		return 0;
+
 	wait_for_completion_timeout(&data->pgood_completion,
 				    msecs_to_jiffies(PGOOD_TIMEOUT_MSECS));
 	ret = gpiod_get_value_cansleep(data->pgood_gpio);
-- 
2.52.0

