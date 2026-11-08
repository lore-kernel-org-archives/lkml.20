Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794130596;
	b=aTmPyi2ixP9SM29Cy+homDsP5OCHJrLv/5BimvX5wXRIyyrwStTRR2Z+bECtjeZQFmKg
	 gHI+u8qDpXK6fV2r/hkvSjeWB0Fck6lWwDP84S4WWyQBCM16N3yDjbSKNkO1oJMtm9gbt
	 QlCYOuzVB/EXLtOf1toTnZDqcFo5CToqtY6YKVzG27Pr1Nm/6bSbNFVnfWLwmNJcPCsX6
	 LBz99gYFnBLBc/ZB+ZHsuqJi4q+IMsAPaFsHx43FDWgSAu1CeU+0DLVr/rcL3cncdJu5R
	 pSlgRCxZ9rv41QzrhClnavHvXILKa7p72cX2l5W9+XlnDKlKKNMieFiGEmL0eLQWIJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794130596;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fmCdZN7F+gZnp32CbSHIv9tAwBwiH8xmcnjC1W/VNEk=;
	b=sABe44RbtZgNnw4RlDG42LiwLAUA5WkwrNCyKDrS8myADnz0y0yP0wpvoVldmUIHfNab
	 BmkFxi/xVYBsDOgke5JOUAj361sQBTHrdcibPJTUAF3hBCn7ts7ESmpVh4S/mnFV7Eayx
	 w9QvirsbuBh36KuhQuYlpMKeL5CW2q59E7PyEbHoedlOTXZBcA5cel6K1TaeyyBjgaFRP
	 7USQQgTj0+cB9iDDLG6msMWv+rW9dK6dVMGjrBg37ugCQwatUwTvnRshfkjYq6WwEbH9f
	 JojZHFn7crs9HseCd3yXw8C7xB11Dt1M97TiFw6zePW9DvSv9jluyX6Hit38fOtxT3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a2UPCxol;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4BC606A339
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 09:36:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D4BC606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a2UPCxol
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so1675205e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 01:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794130595; x=1794735395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fmCdZN7F+gZnp32CbSHIv9tAwBwiH8xmcnjC1W/VNEk=;
        b=a2UPCxolXGQxRgQTZhIgNegf7wZNJJV5uLDURypcCBlgm3F9axunyEv1Pnk2FIs4F4
         dZT0HZuah4+k5WBy+R5kwJzvwjuPeI/aTdTJ1hY4RH26bCthgV0YX+NdaBYkRd+GqjqA
         W+s4PFV5yrH3AysyOFrNuPuGaVaeCGQfTxi46a+b4zw75225W9BbmF4xUyMQHshnOt/I
         XqNqYLpi+lYYXQa9TMxoqhRPBzhXLcK04sehoMx7WNjlIOM28GEeZ0uYnM2mgQCK36pb
         QP6m+P0ETqEh35dtYAQI1GlcP6O3qfiKhtKo4mPRVBRdnFgrhCFtLzaommFWzPe3lJnx
         xUZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794130595; x=1794735395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fmCdZN7F+gZnp32CbSHIv9tAwBwiH8xmcnjC1W/VNEk=;
        b=uTxhrKfpBl7fRmMmaCki/S9vivj0XEtMcRubzPP14MLUfLieJ3/eSERAIR/LxqI5Gn
         y8CacyScN58sEWpSUImweKDbnKv1Wexk+hAFZ884HDYyn74AzaviIbyOxQIcOYOSUrIf
         5lQgXof3CZxHrzdXhZX2YTKdB7RZVykQmm1bTLNsGLlMrUtKGXuUUwSi8oaJ9QbFqpgv
         p/kJFtbkZ+/p3un0biwS2zc4dXIAKvdBs9Q8f4LG8g2DpRf5euHuoV1M5N3K5cVYQZxO
         xfuWvfHbp59zvwiWwtAB8mYHvIll37XOkJeAHbeSwAUfQ7BGoVRtFWbEmlCRx4UOoIsu
         /HeA==
X-Forwarded-Encrypted: i=1; AL+hErFUNGY8OSH3ewFNvItCObDKNSodkRgutKbQcphwmq+ggg++gLCvAyepxlX3xrxmFSnCdzR+BhCeMak4O34=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TW0iPwn0k5uwqHjuW1UEqBPApdHF6Z0PTgbpyGDR5Qi67Kl9O
	fXuv1EfFy9eyt/pcdjSfDoR6PBHrZvuRcypmhFhOO4DhndtpGdufBLzm
X-Gm-Gg: AYBFou1ylG/aRImRzagAprqBOVq/XII+0q/LDrwI6fAEtqxiaW2ECqnnQKgCi8aagZ+
	JJ759Y13jNJGXTa0p4Kq+ihGoDurF8gjieJ6+M1bUpeJUGz+mD9C6i/ruG9Es5GnO4VJDry4cEW
	rnMJ/I5fsDYlZY54eBi1GGU9xpFu0ax+hpR/+bni5IWiJt8Xps8wvMiexpZbYxw9uM8+2j2EVp1
	5KvbGXxdkKtV25kpWd0dcyuMr+1versDrjNgtcAV00K/Pu4rJ4LrW8k7a8wRn9c9BVGDZPVLfZc
	2vzWG/O0mxjNBdp07C6BGKJNEb43C+Ep4+lD4nN2Qn3P9W5QwJ4nQInNRDQrN3ymTIW6cZihHNx
	f5fqcJh2oouS9fas27wdrzV3gpiY1NmBEnZ+24JE3VohvhA0eC70HdPoMLQxfNUZXQRPpEr83Zn
	nErqBp9jJzKnwr+mhCn6dEP66RIHItdYHADhokPQFYzwXKaqQGSxkFdxKXD+9/S/bSznx+Tfqdx
	+247EDmQVnRPPbzAXziLGY+XPnRX1fhVCr9EKmS5NkOpcgTuz/GY/Mvn4H/3X8Ny8P4eNH99fnv
	glKQgFml5Wa6F0P+MfLyvKH9CrZYLHOFDbWt0v36bZQhREQF0nLiBtXEoCJGpCvmO/5xO+5ik6a
	PaH9BlyB9
X-Received: by 2002:a05:600c:8b6d:b0:4a2:729:f7ce with SMTP id 5b1f17b1804b1-4b963c6d1dcmr19953865e9.8.1794130594642;
        Sun, 08 Nov 2026 01:36:34 -0800 (PST)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e6eca30asm141650355e9.7.2026.11.08.01.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 01:36:34 -0800 (PST)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Andreas Kemnade <andreas@kemnade.info>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/5] hwmon: sy7636a: read the temperature only while the rails are on
Date: Sun,  8 Nov 2026 09:36:01 +0000
Message-ID: <20261108093602.329554-5-pmazzini@gmail.com>
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

The driver enables VCOM at probe, which keeps the panel's high voltage
rails on for good. Read the temperature only while the rails are on, when
the chip samples it, and return -ENODATA otherwise. Read power good with
it in one transfer, so the value can not be from before the first sample
or after the rails went off. Register it under the chip name, as the
TPS65185 and FP9931 drivers do.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 drivers/hwmon/sy7636a-hwmon.c | 37 +++++++++++++++++++++++------------
 1 file changed, 25 insertions(+), 12 deletions(-)

diff --git a/drivers/hwmon/sy7636a-hwmon.c b/drivers/hwmon/sy7636a-hwmon.c
index a6b47452e29e..0c0601d47b87 100644
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
 
-	*temp = (s8)reg_val * 1000;
+	if (!(buf[0] & SY7636A_FAULT_FLAG_PG))
+		return -ENODATA;
+
+	*temp = (s8)buf[1] * 1000;
 
 	return 0;
 }
@@ -72,12 +89,8 @@ static int sy7636a_sensor_probe(struct auxiliary_device *adev,
 	if (!regmap)
 		return -ENODEV;
 
-	err = devm_regulator_get_enable(&adev->dev, "vcom");
-	if (err)
-		return err;
-
 	hwmon_dev = devm_hwmon_device_register_with_info(&adev->dev,
-							 "sy7636a_temperature", regmap,
+							 "sy7636a", regmap,
 							 &sy7636a_chip_info, NULL);
 
 	if (IS_ERR(hwmon_dev)) {
-- 
2.52.0

