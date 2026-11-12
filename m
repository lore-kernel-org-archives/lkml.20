Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794516788;
	b=Ui64SHcGvlxI6t8EQa6Z43v9vZ/qzOMQrHWpHZelQwr+8cMPMagHShx3f7SMlhXRpWwZ
	 gD8nUNDFcVIC1KHNyb+X6fdOZcYtXGX3vNCj6QnpIns8AEZxs0Aox1Iqxl4zqkHUwTIpF
	 6yCuqSI5X2oNrHGEEghqgE7Nz2jgOvJNrHeTB05FmO0irljKHA373wJVM1Ac9Eaf6NKR9
	 pQL+wlfRxVNx06Q5IblqekMqKX00LNNFOc2VAjh7/gXH/tO5IO0dadIxr+/3i1cORi04Y
	 M7NigYStDxWrBYMajeKl04M11gZhewxPIlXowbXlr50AxCX3L7ux+Nauq6floHx4r9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794516788;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=J9Xq00oiLiGc2yCeGUcv5F3wCwBZ2E2IXMCXnDTbHcs=;
	b=FJ5ONGSL/L5uSc41QsOPed7l+Z2wOKnBrjXPnbfUuDEYDeKTZ/QBte/3rY1g14I9h4JD
	 RRr1Cl1JKrwBmx8L0FAj7y3AAEujBMOh8XuWVAhNKPnuqtqL9ZD9hbEPG58TXnW/Kx/wu
	 yShKcx9VpQ4wzwRBWzG4prCKN7JHwDFu32wdsgsXwgD26jSt0FewEn2kECGY36Ln405Cp
	 kTUg+22qPJJHlAwEcC4u9HrV8jGa0IM//PHx8/4OiPxIGSegYCHCpcgx4GZhoQd11eaja
	 5+x7E0a3m4mjsuTMw69PLqbM7loMUNyyHy1GdthilVFUwA8HeztQ95a0TwrdVUTFXJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jj11fDnO;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E5B606A33D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 20:53:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48E5B606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jj11fDnO
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so2758915e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794516787; x=1795121587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J9Xq00oiLiGc2yCeGUcv5F3wCwBZ2E2IXMCXnDTbHcs=;
        b=jj11fDnOHoMXE1/1iA5tdgvmutB9Kx9RAGeGlas9T56PIvka3YiTIr1T8DvxL405yx
         edBIGR9Dqg7gXrdCX1sDfyYgcbSVInLCtEFOpwQ56gp212OdAs8OOnKiuex0efKuv4+7
         pQsQaX4Jxwgdm8G/RcDhPWnL78DLcmTZsUHlZKKZnQ606IRDHnaGtfnJ4WCV00ybXIq6
         mdvDEsEeBAu2nxbDKOOgKZXRctvzlaB9Nkpay+TLLTNhbhdTp5rZZKhDneiHl2NRD3SN
         uCtcBMnVIhgHAlvqPtVUH42Up9nNQKrvlQdW8eEJZZSAFt+BM+N4OurBmSbCFnVkJVv/
         TjnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794516787; x=1795121587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J9Xq00oiLiGc2yCeGUcv5F3wCwBZ2E2IXMCXnDTbHcs=;
        b=05ujFOaPwTCvgOUOItM23Nh8oDcOsvARTxiOBi71gSEq4Syv3ANyb6dSqZF3uMoXEH
         9BgdWd+GwaUFIEx54PreiFApz/351wt03XF/H7KwrnQ6LGljE+8cyGLNSyvPxVS8Dmel
         QDKi+f5A8VC/zDmlG9exSFy2juYrS/2aI7TUlRGh51/kxqCydfR9X2kkxY9AZ+xKPd4I
         jYeTQZGwQVa3BCRlk+grHy55abwhFhF+SPzKwswOEJPSM/SkmqYgViVx0M7jSiI+BPMD
         B8XMysM7OA3Jv2zpuc11v2oBy+yIFZA7ycqs6UZdIdITDMPjYUOt98fD+HA2e0Z86iR3
         cMgw==
X-Forwarded-Encrypted: i=1; AL+hErHaX3BWCQFxWBlQ/sWchl6noewh/pkenr4rDPOxGON7fF+Lm5M9EGuSr2wOC3XaOHBwm46HYr2Fs19JqOU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Q/FmiwrV+ecVQNZztdHNv1MOUen1hVkxJQKMQB3cmxnsqYRGr
	FmNjFn1gIKf0oD1PxVycJXrpu7Oekz4P4dWvSbVQ8khv3eEGLnpOcvKniw+oO5w6na7fuc4/
X-Gm-Gg: AYBFou2gPe8RwwYmhec83iwhHW0HjPlWCoSCX4UcaqW46eEI6Qx6ETTQpXzx8QfGxHi
	1V0KFWYeM1j9lIDyCNxeC/3VgUQQ7gPYYZ022GDfVm+s9YXh1ZM0CGaiZlP7IXqzCqc2BzCKYkY
	VFM+/bBxa2NhFmPsP+7apAN/eaWc44xsYHxkCZteL4sRM2n/7ZVYKEw99qschjG4RICD51eTmGS
	2MnIvrOe5TT10tJ10T7sa9Y/S2/y9mqSUbSwOC7LN20wY3EOu5klYIV7hQOWutxNloG1wBJVBtQ
	q/rPDCgGTmp58GdJOdjAzoNDoBUORLzwy4NUtcrCGtaW4yU5iUA+epVqP+ZhH/M3bswCiMYslQR
	Cs69bPTF+AHNI6WP88LB1LTwhSxgU6IrW/XPiiB3LNmsiYlIefAO9vkT7m29zMl/69Wa1CnIxnh
	3/Z94X5p44gj13FiAgNocdWPhg/xbfFTYa848CTFu7OYC8zftGYZMboEnI5qu72PLRsUQSSY8E5
	yb+syviIN6uAlB5HD2a5dRKOx+kyakn8OgtWIyNop1qXZ51TpEj4hN2L3YXrNfwrW9j9DSGP7IQ
	qV7lODvsQzKt70QJZY2bPqLTRphyQlZgCKVLQiZ32Rnmi3zibdywpK7VG3M/U9TnkepDnHDOWc6
	2FOAFox61
X-Received: by 2002:a05:600c:8010:b0:4a7:9025:5c3b with SMTP id 5b1f17b1804b1-4bb55a6a5f0mr9195935e9.19.1794516786608;
        Thu, 12 Nov 2026 12:53:06 -0800 (PST)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae501bsm8695655e9.10.2026.11.12.12.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 12:53:06 -0800 (PST)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Andreas Kemnade <andreas@kemnade.info>,
	Mark Brown <broonie@kernel.org>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] hwmon: sy7636a: read the temperature only while the rails are on
Date: Thu, 12 Nov 2026 20:52:27 +0000
Message-ID: <20261112205228.42630-2-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112205228.42630-1-pmazzini@gmail.com>
References: <20261112205228.42630-1-pmazzini@gmail.com>
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
rails on for good. Read the temperature only while the rails are on, when
the chip samples it, and return -ENODATA otherwise. Read power good with
it in one transfer, so the value can not be from before the first sample
or after the rails went off.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 drivers/hwmon/sy7636a-hwmon.c | 35 ++++++++++++++++++++++++-----------
 1 file changed, 24 insertions(+), 11 deletions(-)

diff --git a/drivers/hwmon/sy7636a-hwmon.c b/drivers/hwmon/sy7636a-hwmon.c
index a0d0b4119bb3..a8bfbf1716a1 100644
--- a/drivers/hwmon/sy7636a-hwmon.c
+++ b/drivers/hwmon/sy7636a-hwmon.c
@@ -9,26 +9,43 @@
  */
 
 #include <linux/auxiliary_bus.h>
+#include <linux/bits.h>
 #include <linux/err.h>
 #include <linux/hwmon.h>
 #include <linux/module.h>
 #include <linux/regmap.h>
-#include <linux/regulator/machine.h>
 
-#define SY7636A_REG_TERMISTOR_READOUT	0x08
+#define SY7636A_REG_FAULT_FLAG		0x07
+#define SY7636A_FAULT_FLAG_PG		BIT(0)
 
 static int sy7636a_read(struct device *dev, enum hwmon_sensor_types type,
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
+	 * The thermistor is sampled while ON_OFF is set, but the first sample
+	 * is only ready after the ADC sampling and conversion time (ADC_SPL +
+	 * ADC_DEL in the datasheet); until then it holds its reset value, 0.
+	 * PG is only set once all rails are up, after the first sample, so
+	 * read it in the same transfer and report the temperature only while
+	 * it is set.
+	 *
+	 * With ON_OFF set but PG low (rails still ramping up, or a fault), no
+	 * temperature is reported even if one may be available. That is
+	 * accepted: the display driver reads the temperature only while it
+	 * holds the rails on, after power good.
+	 */
+	ret = regmap_bulk_read(regmap, SY7636A_REG_FAULT_FLAG, buf, sizeof(buf));
 	if (ret)
 		return ret;
 
-	*temp = reg_val * 1000;
+	if (!(buf[0] & SY7636A_FAULT_FLAG_PG))
+		return -ENODATA;
+
+	*temp = (s8)buf[1] * 1000;
 
 	return 0;
 }
@@ -72,10 +89,6 @@ static int sy7636a_sensor_probe(struct auxiliary_device *adev,
 	if (!regmap)
 		return -ENODEV;
 
-	err = devm_regulator_get_enable(&adev->dev, "vcom");
-	if (err)
-		return err;
-
 	hwmon_dev = devm_hwmon_device_register_with_info(&adev->dev,
 							 "sy7636a_temperature", regmap,
 							 &sy7636a_chip_info, NULL);
-- 
2.52.0

