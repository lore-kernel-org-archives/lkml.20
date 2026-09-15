Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551F73515F1
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459234; cv=none; b=UEKN1DlcCIvILsHezo+/Eg/IJd62ahVlxiwRuuCnQL3F1vOkp+S1Xp6YiLX6K014rDByleY2JplMcy6KlCC26KnA03xsWd8nu+Vq/IxZUOy15tNu1IZSg6jbQWOuqqHUVJcObzLnqHp8aPseHSGwE603S9O5O3tHh+DY3PL++G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459234; c=relaxed/simple;
	bh=KTgZMvg4dulJZHvYNEIoy011mnzTSGSayGEdve6hAJE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rg//UDHvoKa0ojAszu0rwGaJukgCzNLGWXvRGSRVV8zqJJqgdzSdzNiDTCaf95pWGcNVle+TU6hfLntjPrEBlV/WA9peRj8rpWq0s5L+pMuj4ZbZE5o/uWLJufG2HsPwZzbkpd1iB+mKWCP+aLnbRLVNBVRDH3ELMoU2Yhvq0Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VWdXzhkH; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VWdXzhkH"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e71cdb22bso18183425e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789459230; x=1790064030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xfw0WXqsQI2eC5dBxcA9xLNGEmKqYt2MXCmmX8Bocyo=;
        b=VWdXzhkHVit+KwBomAQib3RZmw09rFkgPTMN8czAJDxWWGYTmkFxA+Zv6Y24jTlunr
         o8SDDlOOa1Nw4yh8h+HyCZTQgYSPcxhv+P+oe5B8UL/BKHhDwRlugCXGrMC3Hs6mrGQG
         hviYZW10GMGT/mM72t/D94MRP2+ZQv7Xq0Ea55C+frqsVTLHCeMJsCyp3x5+XkIenZT3
         Wfz6CQ4TpV1uakvwTXBhn5AG4D2uafPNrEfMJRZIqXTLDb8bOiTKzXDkpbvViN49hY9F
         pfFS4IgcPhlA1t+mwryrnXcFERjngSoAZe5QzPTH89GqqqiFxzH4Ed6WNiG6+Sn5OeTc
         xNoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789459230; x=1790064030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xfw0WXqsQI2eC5dBxcA9xLNGEmKqYt2MXCmmX8Bocyo=;
        b=P4+uPCe7GzlYmNkqe/5vhS/zD9wuGelLk+EvwX3t0ODSPhjNRG+DBr14GVOznNyTt3
         L4Zh4gM1QJwHLxsbaymtvd858s/6rcXWHGLiabXoGRHPPMSd+hOcwjamtRS+76gslvMd
         Kl7vJVc8gW063WVL3fNHu4cS4z3fo5mr7S5oVdniWtgLmmDNwtVYYmgvWe6r655sy3Po
         cydr9jbcTtMDqE6d+19NwhE5xv1FheirDPguJfVFYiAPYa/kZzYnJxR2m93tUZOv1nPI
         D8qeh9R2pDH6kwcy/Us9q/4ngYmW59jLnx5xmuXsY8EINeOlsDdz27IxRFfIwqWzrRre
         a6wA==
X-Forwarded-Encrypted: i=1; AKwUvByujDyl47dPG2/aqAC5ByuSth6Ofbegn7z7T4s2IwRJTv67KKtl7ZWOV6B85bR6Mu2m28LpFpIMruRh9uw=@vger.kernel.org
X-Gm-Message-State: AFuF++k7oI0VEi5/8mme8yK8zFLqbP2HhlplSqbyFfPNKVg0Yqu60x8S
	KvddXghV1ikfCT/mJAxuWRRheAChOknVVHz7tNujACIxqLZDTi+wzvhH
X-Gm-Gg: AYBFou2EOLvFoYxyfkCwtctHEOok7jIg/fISWJeidaAxym88oDsiUG1+SS2PO5v7WHn
	XsT3aWwA6JWA8O5QIw+pZnB7RFqJQSfidpuuqML/UROVcav8j4DR4rfy5JwsJwIw7ZXcCDe6VMa
	bzXM6LRvpYVesTbmgPSox5MtjVvFpza1/xooeFZX8xiMB1aU6AjESBG8u58qaIKo8YQIcnrgtdv
	aAwXEHryDQDnRsQqqpJm+c2nFVnXDdCJS5vyXyHA5wEv/i3SPAaSf0wlTF1usTNuBTYP0H0Hdcy
	ffXiwlpeCf/9e1bnjLYiBRmGAgtJbVUCTsGU1LpPkJCcj4YPJVmZtUVeqVB5CeHYG7o3snH8pJN
	Nn80gxaGLE+52K7W4r3TkH7Z1902G6RKICU1i8G2ofRtu93e9EeomUsGloevD1mDwwqCemvS5to
	2C28tyUGQa+UMilVMTmV+gIdTEzsIlhtOovLihxY5KFh/8mEd7x1qip+b3EUvKmf7ZbUCI85zFr
	FL2YqOq29G5Cz6GhFI=
X-Received: by 2002:a05:600c:c8a:b0:493:aa0a:45ad with SMTP id 5b1f17b1804b1-49e7a6386d4mr71308795e9.2.1789459230005;
        Tue, 15 Sep 2026 01:00:30 -0700 (PDT)
Received: from fedora ([154.182.99.41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d6bf4desm64112155e9.15.2026.09.15.01.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:00:29 -0700 (PDT)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: jic23@kernel.org,
	gregkh@linuxfoundation.org,
	nuno.sa@analog.com,
	Michael.Hennerich@analog.com
Cc: dlechner@baylibre.com,
	andy@kernel.org,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	joshua.crofts1@gmail.com,
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Subject: [PATCH v7 3/3] staging: iio: adc: ad7816: Fix DMA safety issues in SPI transfers
Date: Tue, 15 Sep 2026 10:59:39 +0300
Message-ID: <20260915075939.18180-4-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260915075939.18180-1-abdelnasserhussein11@gmail.com>
References: <20260915075939.18180-1-abdelnasserhussein11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SPI operations in this driver are not DMA safe:
1. spi_read() uses a stack-allocated buffer.
2. spi_write() in ad7816_spi_read() uses a struct member that shares a
   cacheline with other variables.
3. spi_write() in ad7816_spi_write() passes a stack parameter by
   reference.

Fix these violations by replacing all spi_read() and spi_write() calls
with spi_write_then_read(). This safely handles DMA by internally
allocating a bounce buffer for the transfers, avoiding cacheline
sharing issues without needing dedicated aligned buffers.
This implicitly corrects the size argument in read to sizeof(buf).

Fixes: 7024425db64a ("staging: iio: adc: new driver for AD7816 devices")
Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
 drivers/staging/iio/adc/ad7816.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
index c18093ca8a82..f76f0215119a 100644
--- a/drivers/staging/iio/adc/ad7816.c
+++ b/drivers/staging/iio/adc/ad7816.c
@@ -74,7 +74,7 @@ static int ad7816_spi_read(struct ad7816_chip_info *chip, u16 *data)
 
 	gpiod_set_value(chip->rdwr_pin, 1);
 	gpiod_set_value(chip->rdwr_pin, 0);
-	ret = spi_write(spi_dev, &chip->channel_id, sizeof(chip->channel_id));
+	ret = spi_write_then_read(spi_dev, &chip->channel_id, sizeof(chip->channel_id), NULL, 0);
 	if (ret < 0) {
 		dev_err(&spi_dev->dev, "SPI channel setting error\n");
 		return ret;
@@ -96,7 +96,7 @@ static int ad7816_spi_read(struct ad7816_chip_info *chip, u16 *data)
 
 	gpiod_set_value(chip->rdwr_pin, 0);
 	gpiod_set_value(chip->rdwr_pin, 1);
-	ret = spi_read(spi_dev, &buf, sizeof(*data));
+	ret = spi_write_then_read(spi_dev, NULL, 0, &buf, sizeof(buf));
 	if (ret < 0) {
 		dev_err(&spi_dev->dev, "SPI data read error\n");
 		return ret;
@@ -116,7 +116,7 @@ static int ad7816_spi_write(struct ad7816_chip_info *chip, u8 data)
 
 	gpiod_set_value(chip->rdwr_pin, 1);
 	gpiod_set_value(chip->rdwr_pin, 0);
-	ret = spi_write(spi_dev, &data, sizeof(data));
+	ret = spi_write_then_read(spi_dev, &data, sizeof(data), NULL, 0);
 	if (ret < 0)
 		dev_err(&spi_dev->dev, "SPI oti data write error\n");
 
-- 
2.54.0

