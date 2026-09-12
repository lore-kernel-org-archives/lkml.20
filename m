Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB5B47D95E
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 13:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789219564; cv=none; b=R16SDKAVxUWRGlKJc/CSj8hbW4Y39oqCY8YTyVUQlUGXeq1sC2e3l7Kwb0hMomkgCG+4VZluInMSo8KnmC+GCSFblyU3rYKB5KQ8KxXMKkvxUokfKjBILKWWsQIsonW5Vv56lA/nIK2l1sy6Lztpf66gTNLXnIpB+6dfBuIGuuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789219564; c=relaxed/simple;
	bh=B82+6jWVF+uGKYVaZQYTIbzC69mj2Z9dpEdSNIoCiio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UlEjrtV5hvgcQurHjzfzbbz6Y9ZndMfTk4RzoprHvQ1SxljE682IAIGIj0IZg33UDYyZiiOUpIqUFr+m3zIgC1J/ZJmBl7kq4v/76jf5qDBmHfw92SImvvldpPB0m20fDqa4tKLV9F21AR+ntiwtudkQrFO/bOakyyt18mBeapU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TiSnupCS; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TiSnupCS"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843378fb37so205537f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 06:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789219560; x=1789824360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BQ4thKSalDZM2rC8wC0NqTstNC8+R0mxz6pCgagXex4=;
        b=TiSnupCS68OFMTXkq/3G4FXjie3Gf7f5F6lBMBhOpCr9no/jKVqyx2FXvG6lOmTet2
         q5MMOinX7dukLo1uEnUaB4Nc8GAF+wURehZ9gj8IrGauBfUjBn5H8F26Yk2I0+iVT0jS
         yhNXNPl4ohWC4uYHbY50SBxQgURVf9nIeJJ2FGrUr44s1NnfYzOAO2eKYrC74y2a8H6a
         SwqtRCDFeLlOkjgdbwGQQWtpTNRvRnaT3ZEMUb3KgSziMEz2iOACNVnPrAGYHbsWEqAk
         899kaDQ7SXFNLNYQC0IcoYnCU4cK0nlO3xXdsUK8WoEesSXxYQffE2v3CJZwcB/DbNlr
         JO+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789219560; x=1789824360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BQ4thKSalDZM2rC8wC0NqTstNC8+R0mxz6pCgagXex4=;
        b=Jla0RuX7DcSl1cNaeHVoLYyJeRLuHNiBFmU7NOB8VRG0ja1e5ruhbOthuMXaFKMc+x
         k2htLjwao3AwS2bkyhXjqLTDwUCBDDUPDSRekiyNR6T8z+ol8rtQwpa+8pOvQuyDWQNl
         g6/fW6t6gq5HSuyTsA1oK2CcLc+1iKXNJ1cGWpMMwvLBihMPudOrCmU2mqAwKlveseY2
         0LNTyPkTMelx/TM4lBVx6/J8n/128V5DYCpBBphbWvEWZaCEnPdR1xpi/BPdqlA2vQJx
         r/szjNh7NcThHRsbeASAtegZBJIZymLkPRKBk2OvKbZbakF9+H7tx+gP/1+RFgxLUbN3
         A63Q==
X-Forwarded-Encrypted: i=1; AKwUvBzuwmYTP5iSZ15Ly9UT5AnklwadRpqFXAaqwykferP2CoUNBlJow1yGXayLIo5Jq9dYFXyWo+L1O4TBZXM=@vger.kernel.org
X-Gm-Message-State: AFuF++lWzdj+MdY2ZXfLb1aLLMvSuwD1iWy4kHTAyNN4+fr+UTZRsQTp
	+ABzNaDUKMtICJwJRTim1I1uUrKJzZjYzb0H0zF81d2gkdGmz+6ZXmRF
X-Gm-Gg: AYBFou3Q/9+q1WNEK1a1tIWL7l8J40XxjKR5XKnlRh5yeVOTYNrQfnDcUcFvaUO4ZGJ
	gTkGEbfWg5WP5Dkpc6CWqOI0TFVRPet1PNQIfcwY1Eq3IKh1cqpyWsZXrpGVmcNZXryQT8Nga/o
	WreQOdEk8NbPNVRe0hAPBU2QAuVeveghiQ4+WBtbDlOQNSC2ioO2ypuBssZsGVqOSLYQVlEm4GY
	1j5I2/TTkg1uzJtjEug1AR6N4xveqsVBl+zxNwjZXiyYztJx3z38x0m8jjdL9JBV4uCtopiI7AY
	JEAS92YG7k7TTl52zWPLMuWEbQO9BOwOJ14273Daq1LzNqFEsJqEfYJ/7BV8vl2jb/HKHUCwsAi
	AbvPdfuNvhJcyKK0kEOjXRcwO1YluyLMV6dvGOPXhwy+qOmOXsu5zoD7yzrowlyHZpj4OviY/xe
	T9SLcy5Tp5zL/p4LAqri4ShcaHiTnzpdLCe4CteV93QMs4iA9En/EAnazFoLoYO8Eehdl2U8NG2
	zl1AApLsWHSa8ioyA==
X-Received: by 2002:a05:6000:5c8:b0:486:f301:1144 with SMTP id ffacd0b85a97d-486f6beaa59mr2718066f8f.2.1789219560279;
        Sat, 12 Sep 2026 06:26:00 -0700 (PDT)
Received: from fedora ([154.182.88.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ee8bsm12684503f8f.15.2026.09.12.06.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 06:25:59 -0700 (PDT)
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
Subject: [PATCH v6 2/3] staging: iio: adc: ad7816: Serialize SPI read operations
Date: Sat, 12 Sep 2026 16:25:16 +0300
Message-ID: <20260912132517.55686-3-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260912132517.55686-1-abdelnasserhussein11@gmail.com>
References: <20260912132517.55686-1-abdelnasserhussein11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ad7816_spi_read() function performs a sequence of GPIO state
changes followed by an SPI transfer. If multiple read operations
occur simultaneously, the GPIO state could be changed by one thread
while another is in the middle of a read. This leads to a race
condition where the sensor state is disrupted.

Introduce a mutex to serialize the read sequence, ensuring that the
GPIO toggling and the SPI transfer are treated as a single atomic
operation.

Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
 drivers/staging/iio/adc/ad7816.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
index 9e43ce83e071..acf26c5a267a 100644
--- a/drivers/staging/iio/adc/ad7816.c
+++ b/drivers/staging/iio/adc/ad7816.c
@@ -5,12 +5,14 @@
  * Copyright 2010 Analog Devices Inc.
  */
 
+#include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/gpio/consumer.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/list.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/slab.h>
 #include <linux/spi/spi.h>
 #include <linux/sysfs.h>
@@ -50,6 +52,7 @@ struct ad7816_chip_info {
 	u8  oti_data[AD7816_CS_MAX + 1];
 	u8  channel_id;	/* 0 always be temperature */
 	u8  mode;
+	struct mutex lock; /* protect device state during SPI transfers */
 };
 
 enum ad7816_type {
@@ -67,6 +70,8 @@ static int ad7816_spi_read(struct ad7816_chip_info *chip, u16 *data)
 	int ret;
 	__be16 buf;
 
+	guard(mutex)(&chip->lock);
+
 	gpiod_set_value(chip->rdwr_pin, 1);
 	gpiod_set_value(chip->rdwr_pin, 0);
 	ret = spi_write(spi_dev, &chip->channel_id, sizeof(chip->channel_id));
@@ -360,6 +365,10 @@ static int ad7816_probe(struct spi_device *spi_dev)
 		return -ENOMEM;
 	chip = iio_priv(indio_dev);
 
+	ret = devm_mutex_init(&spi_dev->dev, &chip->lock);
+	if (ret)
+		return ret;
+
 	chip->spi_dev = spi_dev;
 	for (i = 0; i <= AD7816_CS_MAX; i++)
 		chip->oti_data[i] = 203;
-- 
2.54.0

