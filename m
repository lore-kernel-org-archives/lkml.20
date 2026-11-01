Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793572339;
	b=rl7hXr8sY0orXg5zgcoGVUEhRtJT9Ob+LgWc0yx7mvfEe+SQY+VUGEquD0uQnGmyuNmN
	 FD8XxQy6dDhBxjy6ZxDCPfXdHNDUwKHIGBjcAQrCO7PVdMuxdWKhOHscoilGx5mv7ELTR
	 7ELFmvAxoXGaVI+fOyWZG5XpVOyFIh5Q4LFlUuDHXqV+ToW4QDubRQaCIVHYgJzcLFV0t
	 e9AJL5+EVUIE1AHYY+ghziOTkxWmm1D0EGJsivURaA4rwRDvJenaCZAn+mHp2/jqy/O3G
	 xhD7rHBaALTTHCfweAeSN7b1ldS23Gu72X84JsI7tzj/kebGY8GdLhmJCFXZcXoyxEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793572339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TS5Dan/nb4cmKxpfEwON69wlnKqem2VsrIBuzvRoE1s=;
	b=m9q6g0ZqIFCYuNfkaMSLHKbVIEWrTTfMk3fTxbzZvlQrhlHpE3H84SY75jcIgrrh+2dB
	 QmFJ0IolRAbM6BGDvkRdfat3YgPpvPshiiJ/PYwJ4mOMb9/j51Qd7i7tdckMS7h5cMFqh
	 Omj5lKoeIzK80QLpdSNP3bI+pZNzr7KWiL3Np23Cx+1TW5TTMTIKo2pXv3bB66Hu8yULS
	 GX87ScPfxYb+Jiwfwvj/NUjwIMnPLxPaCtzDjSgwK62lyNcVHyoVUqOKBAknyrcAuZk2g
	 1erujxaohEaojx6zkE3o3c6G5TNEn1m7IDtNnXNKppWr8drOeKcGVXIDImtuxgDTm4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sIIzce1T;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DBF606A32D
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 22:32:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40DBF606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sIIzce1T
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so7230775e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 14:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793572338; x=1794177138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TS5Dan/nb4cmKxpfEwON69wlnKqem2VsrIBuzvRoE1s=;
        b=sIIzce1TQw73QbNOA97j5ibiT2rdrv6yjPmb1JS7AQ6FNgJd5/0CYoIErLSeuGJLIE
         JNw1vB4ibgkWUt+EjcKBTHyoD37K8edwRwzfs3mVeIWmkVrDIiPZzodlBRmVDGzFNf8u
         LYmDcuJ13o3LG7t7y6EAAyXOHAdatp/HUFkQabrVBz4HScCk1DRGrqW5FLo7QnZebwOA
         oWH+RjX3Vx2cmznh/4rH95EcV6SqLs2MAO+OJF9jF7EThkJ6JKEn6mHFYINHfhJc+UXr
         Fv4PHUvO4SgpQr/WDVOpnzNp+z91xi8ovsTk3kRcyy+ksliCC9xIh00Eq5sQMN3Ycy2B
         26hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793572338; x=1794177138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TS5Dan/nb4cmKxpfEwON69wlnKqem2VsrIBuzvRoE1s=;
        b=yh5yJhcv878vTVz5lhfNFUF054yX3yoLSVz2Z+qgwlE/PrEmRXrZkwd90V9Bcpd9FY
         35QGRiYEq7GEfTIKOz1W9dGWgULizEWXd9zrEPjlt/nCGR1JQ0K1QTbqQ5xL6X6KlxKH
         7bW0+ZRcFixTeO0RZpli7zQHsnl0z8rY6AAQ6/052TNRjISEzIEMRGdxdxwQDFh5x5gq
         vsf9yiewulvYw4iFljK26AslLlDT/yIPdNyMC1+6Ch2JK9qh0kLqCA94U9DxRWoQd8ff
         mD2KRe0xF/VlmdZw+lXBWHfFfwvWCrJMeFSB+hCoaqFnHOfiw/S3lI7kHn+bWFQUaVAy
         AoYg==
X-Forwarded-Encrypted: i=1; AKwUvBzsOQJlBhZg0E8/sdOiTRsuTpaYRSyBRy0p9JXUsxtd66f1NmBT6fJhFLQrn++6ZUI3XqFtczwwL5rjQD4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIk5uF/ra4UMozBduyKqsHaJ9pKyAMm7jic4UAKqOhMXIi5RNym
	U5L4qeiO1rcdsf2Fog4Jq9dSgsL3bQTaEu6mYlgnh12dVtV2e4BMvbqH
X-Gm-Gg: AYBFou02aKgpLopdSEO/uagk1jXA7bH5QNDU8rj3rPe/zjuiA/2+DOkyMHLd714eAgm
	R3fSg2kgvKQ8bfFYCGTYmg0OoiWqZ8rDsSY9Zo808q419rFHVZLSLx3Dk0hnvIK2uiqqwdtTTlo
	b0KVnnhLATBJTlrOiVaaCzSlAd40iGGxnMZbiYHZL01aMYL4UVS9LQpJW7tYbhshKx4yuvGXtEh
	uxHOPyfo7FTUev3+l5rmBwMCRCZrIQel63o2eRXNqDoTMnTNA4WtRzyly4h0ruJki1os3dkv8Vp
	3OiPKjHt5S870RAGHg3rJ2fkk/uD/Ain4rMXKKOTzBNCOsqfbvV/pLzk83LXgnaVdQVVVLpkf8z
	gJtJGm95UqrWwPwPXp5N04ddj4lK1cutOo5RjyrO1jBwnjY+Ma303cfIuDWUj2fBxDIRl8q0Sc+
	S48qPpv8QxYFF5YXo5urfZRe2G4R2dKIegqkIfXA3sW88FVqvT9qn/eh6qr7YuqWhhU21ZMmiZa
	Lx3TQqhatpdQYEBZKlf2WMiuDBWqO1U89ssgPjWA18ueNlAofxtZt+bb4TxglnBJ1JS3WMrQWE1
	YFVVfflKXcLng99Xko97wIYxfGD+CJrG3N0YYoz2KRDd7vhiYbglIZvQYKj7xabAa6wAm+djC9h
	7xzBNFM+N
X-Received: by 2002:a05:600c:4454:b0:4a3:5a7b:6002 with SMTP id 5b1f17b1804b1-4ac17d19777mr188166415e9.28.1793572337774;
        Sun, 01 Nov 2026 14:32:17 -0800 (PST)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78f95sm14904805f8f.28.2026.11.01.14.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:32:16 -0800 (PST)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Andreas Kemnade <andreas@kemnade.info>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/7] hwmon: sy7636a: read the temperature only while the rails are on
Date: Sun,  1 Nov 2026 22:31:23 +0000
Message-ID: <20261101223125.302001-6-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261101223125.302001-1-pmazzini@gmail.com>
References: <20261101223125.302001-1-pmazzini@gmail.com>
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

The driver enables VCOM at probe, which keeps the panel's high voltage
rails on for good, and gets a dummy regulator if it probes before the
regulator exists. Read the temperature only while the rails are on, when
the chip samples it, and return -ENODATA otherwise. Read power good with
it in one transfer, so the value can not be from before the first sample
or after the rails went off. Register it under the chip name, as the
TPS65185 and FP9931 drivers do.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 drivers/hwmon/sy7636a-hwmon.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/hwmon/sy7636a-hwmon.c b/drivers/hwmon/sy7636a-hwmon.c
index f01f368d68e5..475aff997c2d 100644
--- a/drivers/hwmon/sy7636a-hwmon.c
+++ b/drivers/hwmon/sy7636a-hwmon.c
@@ -14,7 +14,6 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
-#include <linux/regulator/machine.h>
 
 #include <linux/mfd/sy7636a.h>
 
@@ -22,14 +21,22 @@ static int sy7636a_read(struct device *dev, enum hwmon_sensor_types type,
 			u32 attr, int channel, long *temp)
 {
 	struct regmap *regmap = dev_get_drvdata(dev);
-	int ret, reg_val;
-
-	ret = regmap_read(regmap,
-			  SY7636A_REG_TERMISTOR_READOUT, &reg_val);
+	u8 buf[2];
+	int ret;
+
+	/*
+	 * Read power good and the thermistor in one transfer: the thermistor is
+	 * only sampled while the rails are on, and power good comes after the
+	 * first sample
+	 */
+	ret = regmap_bulk_read(regmap, SY7636A_REG_FAULT_FLAG, buf, sizeof(buf));
 	if (ret)
 		return ret;
 
-	*temp = (s8)reg_val * 1000;
+	if (!(buf[0] & SY7636A_FAULT_FLAG_PG))
+		return -ENODATA;
+
+	*temp = (s8)buf[1] * 1000;
 
 	return 0;
 }
@@ -72,12 +79,8 @@ static int sy7636a_sensor_probe(struct platform_device *pdev)
 	if (!regmap)
 		return -EPROBE_DEFER;
 
-	err = devm_regulator_get_enable(&pdev->dev, "vcom");
-	if (err)
-		return err;
-
 	hwmon_dev = devm_hwmon_device_register_with_info(&pdev->dev,
-							 "sy7636a_temperature", regmap,
+							 "sy7636a", regmap,
 							 &sy7636a_chip_info, NULL);
 
 	if (IS_ERR(hwmon_dev)) {
-- 
2.52.0

