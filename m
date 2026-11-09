Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794243212;
	b=xx9L0q7GiLFOcxXtUn4TJGNFUimAT+6Gc2j59BpCUjkEpAajsVNJ71Jt8lQ2HqJVYvd9
	 USyR0FKkJngG8gcytxaUbBeqVWZvOeOzPZCvMQdWq5Db/QDso6bCILlerADrc7PMxRYbI
	 /xRN9Z3pZLKfRU5B4p85JwboVwphV6dc7U+hUJQTOVBVIm+2fmgx+VPe/MyUgjTxT4LDc
	 DiyBSqHlPUZuSmFO0d6bQIP2eqULw0/8eyP1ntk662XBfDo2ELHls5h7MxKCf5QRR78bh
	 IEtgo4TzhhVG48bAaq7HgpcgCKb7cc08sl/mpNAsYwOLbx0ojiXTkUOqE11KD4gQsMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243212;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=n/o+KdlAQOdJoFsrUVk4Pwcg9WiRwxYqGqB2UYDqVSg=;
	b=a/Oy92yEeZ2dM0bVaalwjgiQo0uT9rBhLfQYd+Lt8R2xbauBvpw6zzXr9LJUcohrHm6M
	 CPm5BDN4ncbm1aWr//UDHOnP+MoHVrChm1AbV4FZ63HVyvyim6wT6kSazeyHwsGCvEDhd
	 z2IpdOUVOIRuclg5kuudxK8Nl2SgPWgW8uh7awqHF+iXG0Ebwk/fT9KnjB6Nrf7zdr5yL
	 zTOp+UcRef0RNGyDLDLypW1AqI7dNKig10lSFIacGVxBZ9Qtr+qv2JzfeaRuki4OntgIL
	 1Bka/ZSUoNfj+K3poxgRO8tQQ1jys3xPI8k4IBCo10B/sXBIE4zQa4ZoBk6yIow8ygg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cZyuxNP8;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE568606A334
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:53:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE568606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cZyuxNP8
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cdd89d84521so100427a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794243211; x=1794848011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n/o+KdlAQOdJoFsrUVk4Pwcg9WiRwxYqGqB2UYDqVSg=;
        b=cZyuxNP8L3fSZDzQFMRV88CjDipkL4TLG7usKIljDDTCMMhj5bbbCZc6nNe67iSjcV
         qtzF/4NoXCejqWlHjSJvSvzWzVYiEN2l8Fn+qiGGx0b2Ata+ypjaVrihNTp2WwUVrMVa
         TkNomnzlOAWzpeaOeAtxQHliE0o6hWVKhN2tZESrmAOCN81kF1qK40EkJBTtSBKysmux
         wbR47QtuFg8ZVQ/r81PxQTwyzHnyKBjoy04F86cshlMh/Yy66aQ5uVAC8p8w4DFvb157
         F3qhxi4Zf1BUCvsFmvpbyGq/4bV6P2b3PnR5qY54zZscPN7oKZEky6glBx6EDqKCZCjB
         qqVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794243211; x=1794848011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n/o+KdlAQOdJoFsrUVk4Pwcg9WiRwxYqGqB2UYDqVSg=;
        b=QhPRMGXkcRUZ2doZGyNNKzw24VSlpIrikmhqLZd8QSuSGrmcJ/yFmJYxV3QrZoARsm
         MIthBBxqM1XythmoG35gcGYxZGJQzV+1HDoGMYopc/YPlE43vurYq2HUxpWH7z5lCOen
         KICviqXXzzHphxEDQCvtHZlDH796XqAIt/lRPS3aWO3p5WwMtZ4Smoce4yRXRYsAuQX6
         Ucajj00hZ8ZSUvcZo8YK7xFVTKDt9Qw5x/OzAB2bVVlH/doXJ8/aL1MywLToJEdnI6RP
         CrUpApbkOq/K4K3AFrkRR7YeTL++JvfIN+1yZ8mNsuhIbiiA8NFha9hp0F2CpSOQXRqc
         suDg==
X-Forwarded-Encrypted: i=1; AL+hErH/NW4k61OY4j076kr9p1VXXc4XJhs58wIn0elY1G+8Q5SVGGPylDC/tugAJqrrgRAjMWmfDBnD7eXhGnk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4Ol48gYmsQPOmX6mXRu0KzTc5EIr5W8hRCJn0TlQY3qsyAXDw
	jggvi0SEH0KP6tecRWMaLQ5v7Dzp7HzFedDEioUPCjnJajd8ASgLSwDPlrd2xYcT
X-Gm-Gg: AYBFou2KdwiluT+7208Qp5Re4+K9F/pC9UBSz1uil9BrsXPrJrEronvtsAf31rOGznT
	nbWOzslyY2ypWvk/Bl+9NEZJgeyecVCzrlsdDiTDXy0qHNwVpJdtbP3M92O5gTLDWYpH3C1X4UN
	GUgkUbGxSaWsI77TjUj1/Ir6Dk5Jlhr+4Muyt/MSQCfRXXKmhbCv6n6elP97BmT/jXOUCun2Wrv
	pLOWso6To7kz9UYRvD4046ROA+yc1jdCyhNkJtSZ5Rx09jJNre4XV4WZ2u8ZdA2SwzxXeN5xsAV
	LQ6F6ZmbDrS3Rx+0/NotLYZlTEMk7AjlGOfZpY/4gHgUgtxFtPmnTr7MdAUX8Kl4LPI1ohLZPjh
	5XAKDqgWULUqcPJGz4SqBk99uGHMztrNN27r8JIhaZ425xMZ6Wf1UNmS7jQEzKOmaXG6kcRo6KX
	RC3PXAAXucA8elz26l5NlqyoBPL2WtucsVK8nhgcxx4qa/USbt+zi450VvpU9Nd1dmM2Cx6Thfx
	38IxNYKL/By9QezvUgujcFCNJ3c/lYBjpEHUJ/RH6RfrVsZVllt3ZCCJISJ8ezhVmFMs7VToNPX
	ld04wijGPiWpcYqTmZDWCCZGsZJb5xfaTGgPRJV1Yg7q+i+Px7LN82QtCG1iTpWDeL/cZ5na/9e
	dadga
X-Received: by 2002:a17:90b:5688:b0:3ac:9ad9:6afe with SMTP id 98e67ed59e1d1-3b167a2c765mr50121a91.39.1794243210983;
        Mon, 09 Nov 2026 08:53:30 -0800 (PST)
Received: from debian.ari ([152.56.156.124])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1034718f8sm6455688a91.4.2026.11.09.08.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:53:29 -0800 (PST)
From: Archit Anant <architanant5@gmail.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com,
	andy@kernel.org,
	nuno.sa@analog.com,
	u.kleine-koenig@baylibre.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	joshua.crofts1@gmail.com,
	Archit Anant <architanant5@gmail.com>
Subject: [PATCH v6 04/11] iio: adc: ti-ads1015: return -ENODATA when match data is missing
Date: Mon,  9 Nov 2026 22:21:32 +0530
Message-Id: <20261109165139.30803-5-architanant5@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261109165139.30803-1-architanant5@gmail.com>
References: <20261109165139.30803-1-architanant5@gmail.com>
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

When i2c_get_match_data() returns NULL, it indicates that driver match
data is absent rather than an invalid argument being provided.

Return -ENODATA instead of -EINVAL to more accurately reflect the failure.

Signed-off-by: Archit Anant <architanant5@gmail.com>
---
 drivers/iio/adc/ti-ads1015.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/adc/ti-ads1015.c b/drivers/iio/adc/ti-ads1015.c
index af3ba6b75c410..d18a2ac1205ff 100644
--- a/drivers/iio/adc/ti-ads1015.c
+++ b/drivers/iio/adc/ti-ads1015.c
@@ -974,7 +974,7 @@ static int ads1015_probe(struct i2c_client *client)
 
 	chip = i2c_get_match_data(client);
 	if (!chip)
-		return dev_err_probe(&client->dev, -EINVAL, "Unknown chip\n");
+		return dev_err_probe(dev, -ENODATA, "Unknown chip\n");
 
 	indio_dev = devm_iio_device_alloc(dev, sizeof(*data));
 	if (!indio_dev)
-- 
2.39.5

