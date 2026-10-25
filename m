Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792945481;
	b=If4fX3SlaZicgZtjlvTlZpnpTYS9tdhDYNeDGzkmwfIKsfNhbQCWuXzBxbsaiGeHW5pl
	 MFzmaXirX3bbSrj6oRpP/xLZlSlm+AqsyoaWyZSr0wNnT6Ns6ZsV/2kenNffCdbH3bZSx
	 +bYV+AHY20KbRKcHpIPosWaiDCMt9hPRJ7nd3IgLCawV4Bh1proJPCr0tDgjiqB0mg8Z5
	 ND4oeR/sEdzDV3v5O+gebvbRk9j2unb5kiEFJtM7LT1/vNHGU0K7gRSgwbqTa0sKDkEvi
	 s0e8dOlIGm7kHS27fogERGknC18XLBPheGsUnHxvDNiPHh15qc91myU1k9UMoBtDJcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792945481;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=XUkVMSiASkmNFrRQeR8nF5trqMqh9ex+6xCQXRsqNmo=;
	b=Rn0Pz2/mS2F76tr2H7Eyji2ZuOGc+7vy3eWD0Fy70isOUpcNCTjhygFs/zKAKoNljV+B
	 eVuPWZ305Z5LGNU8XxuCBgP/k6dbjPlrcAvZjTo7RV5SCG9VFm1J/Gk9dpvIcnQxkZGec
	 q59C8P6czIsz2ksrhxzHiduK6Ctwc53hgDFsr2IeGxfLOl62cwrV/NM8WCy2vf22uVN/T
	 e/tqxaChgJF/40B4ETj2tEA52FANVgypLZpWfQtFA6R7cl89eGsdb6/Tn/KwXVeCo9ySW
	 d4YFyB8dXtON2cMclaKJDM2nOoYykTQ55wHXYVWxSLY+2MM7BUho67X7yrpdDQ5rylQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="rZow2g/+";
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BE9606A320
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 16:24:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57BE9606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rZow2g/+
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so3798959eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 09:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792945479; x=1793550279; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XUkVMSiASkmNFrRQeR8nF5trqMqh9ex+6xCQXRsqNmo=;
        b=rZow2g/+8owKK6WUdP5s8U02T3eYny6fEANENAP11vcfUzPAPcmNLwjuUsTurnVHEM
         sVF/cBAqaIqGY2M3gY9yuRW9tWcvQy+3NImTNLpn16fYjPa+lu5YnNCImssKLix7lsz7
         pghXh/ekOu0SI0ZEkdIBLD0PzIpR+E8p9GRKparSFDree6XIHC8zKsjRtuGas39FNzps
         M7JyFtmh7ZtWAyh1fzA2mNnWhqO02lfAIjjK5xv8wQYW6reuMT4po0EO5s8iz3DQ1XCJ
         7/Ik6JOPNks11UMAPk1de1h565J3QJi1B5yLvvk5i0sD1uj25SSLiOeJc8wvWVUaXc4u
         lIJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792945479; x=1793550279;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XUkVMSiASkmNFrRQeR8nF5trqMqh9ex+6xCQXRsqNmo=;
        b=vcSzRb49Z0qwywoK3cDaluyhjB5FXe2GaHPvecsPAAZJGV7jcuSsQqwZjp1B3odtie
         AmMsG4JnbjL7/yNwtfnJyY7DoXVINN2FKqd/YNWEGMuLRJJHmh/CbkYo8ZhIvb/3BmAe
         mTztCSmfog0dNQn4R2mwRZfb1ZEsa9x6BXNMpDMsqxP99HoqrwMVLO1xS4SjvL1EBMkv
         Ma3rYmw7+XG0o0bUKwD15vA7AT2mxNANWHsuOSn9Lot53ruURlganv10ssg/8REE/qih
         HasC1qX/birAOTrac54o74jDdX8B2j/UDPSFl7aQgkalYjRsnCLFTO0bc8gL9lAyKdJ/
         04Hw==
X-Forwarded-Encrypted: i=1; AKwUvBwTlsCLpqsKzhP5kYpnT7OZXD7Rlf1wu0i7lsbk5fRkBcYwATX25xqPxX89F1kX3iFoEA78Auc28NW/iSc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIu6RjWmqOR7R6T0HFujkdGjQSxAL+EpSjCwkKD2m51IJ/5EI5K
	xcHKNoGJ+UGu8JD2B44VQC9iTfBil3me0BPF3q0GpAy67AN8qPdbjnwcI5dPdeCS5u5z7g==
X-Gm-Gg: AYBFou2MHVXJAX4ZHzQ02rjCOBW6ri24pwr14q6auD32gUDncAXFW4AwuPPypjIa5KR
	I1aOUz6YcBmalalXS4MBMGGKYR5Qzrw0lDOp56IQm8TULTU4F963GsyEDDlWzysIWMMbSwaBFJ1
	Q16hopE6nsqALIoZl7EB1I3/t0gQvDN76ZiJyCieQGqUeu3iTPN+FRwqG6ndGf2SRjmQ2GeJ8dC
	rI+T3HTQWN2qlKP/1TvhqHYRFv2qDGZOOZ3WvPY2mk1UZzdJrD7lhYFMH2NFk/2Gqwd3tbPfUco
	oYNo1JEb0y1k95/5b+ninSTtv9yPynD9w2JaW+ZMHFkamlholHOsu+mwOgVdgMmpk5mMpY/wzvA
	7XPhX/9yQQUHPp8Vs6SeHSg8/wgI77HzEvxtUN1S4VYsjFCXiTgy2HxT78NHy91smTY1NJasCH8
	TMk0OvudVzNwxXLNoyHGnERr57uaKcPm7y7cYKF9ukqRYcVgIOyHdy1afyjKWc/ZbbNMtSMXb3R
	cAqwzRdSK1vkQglvIvTmb4kyQLpMBkM/J1uMoP/VIlHfwVDsNGb2C5jPpvvKOc3KOvYK7pJn3iw
	in7CqE+u8osR7/iMUiSMBmSI89BMwckLJcEm6w==
X-Received: by 2002:a05:701b:428d:10b0:16a:f5cd:365 with SMTP id a92af1059eb24-199292eea46mr7033256c88.5.1792945479156;
        Sun, 25 Oct 2026 09:24:39 -0700 (PDT)
Received: from [127.0.0.2] ([2401:4900:7b93:fac6:22d5:5a09:b572:da26])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19a3736d16fsm16385722c88.12.2026.10.25.09.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 09:24:38 -0700 (PDT)
From: Ramshouriesh R <rshouriesh@gmail.com>
Date: Sun, 25 Oct 2026 21:54:18 +0530
Subject: [PATCH v8 2/3] media: i2c: hm1092: add Himax HM1092 mono NIR
 sensor driver
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261025-hm1092-driver-v8-2-9cd575c366cf@gmail.com>
References: <20261025-hm1092-driver-v8-0-9cd575c366cf@gmail.com>
In-Reply-To: <20261025-hm1092-driver-v8-0-9cd575c366cf@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Jake Steinman <j@metarealtyinc.ca>, 
 Eduard Kulyk <kulikeduard89@gmail.com>, Ray Strode <halfline@gmail.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ramshouriesh R <rshouriesh@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=29574; i=rshouriesh@gmail.com;
 h=from:subject:message-id; bh=XVLUYNjW25xerOsSKxs/S9MDB/FDMjHUMrT6B5AEUUg=;
 b=owEBbQKS/ZANAwAKARWVil4RHAXeAcsmYgBq3i0z8hxpKZz/G4+7Aumk3DCOYracHn9RYeP35
 BHD1UJLsLOJAjMEAAEKAB0WIQS/0QuzNKVfvUNlNAkVlYpeERwF3gUCat4tMwAKCRAVlYpeERwF
 3kEAD/9qGsfav55onlXKkunTBkGTjqg0fjSU89GpF2OTppYVpP17tCJt4aaRsI8Dn8y8IynMWg8
 N8AsdVDtKqWXB7N7hPpqf4FB1abVe22FkSCpGXbVsUEDJlN7VndrKySRVNQrf/FKAXTCICeh6fA
 chfJ12DcmjdJHKwgpbPnoO1TgwjIrxJ8Q1Xxvgn2f9u1DZcm46WbN1rCgAeLLHan9jJqU5dmPwP
 c0Hi1mTyVYvNNX5WqY//ZQuslGeQ0/DBDV4JVxoC/Ifs2OTzkWJ1KSYMMF2Sn7aaiDXClNHUnBL
 h/xZCpwdMWgKKCqHdfp4X1u4gWpWSChaDr3qwE62LtZD7GUlP9uBd8D7oRdB3L6rPj7FAMu2tUn
 0/B98Dd+l10g/uiZuwHiB7JPH8WkhKiD18b4rmYrKUZrHw0mNwJvCrK/nj+MI8RcgSRH7y0A6Ds
 LPWFbrNt7zcoATerfwAKN6TtIaiaUQky7qkuIf3IE29O/3RQAWVBYoxOSupeuCsL/H+9gxftg1z
 jH54xVvQZd2d1m0gBzy+Zrl0GmmTNFkkWTavz9s71FtoUQ1GlFCePBz0kmQekSjFpeOGmdGSOBT
 19Eb0UB7vvS9+CJs5NUTg6kOzB4HuenLE97xCXtz0T0QqDup39E4Ooh6bobXWr26Sh9EQVFXVQk
 uADcqdJAEzLJAPw==
X-Developer-Key: i=rshouriesh@gmail.com; a=openpgp;
 fpr=BFD10BB334A55FBD4365340915958A5E111C05DE

Add a V4L2 subdev driver for the Himax HM1092, a 1 megapixel monochrome
near-infrared image sensor with a single-lane MIPI CSI-2 interface,
typically used as the face-authentication IR camera on laptops.

The driver supports the sensor's 560x360 10-bit mono mode, test patterns,
exposure, analogue gain and digital gain controls, and the standard
fwnode properties (orientation and rotation). It also reports the
1296x736 native pixel array, the 1280x720 active array and the mode's
1150x718 crop.

The vendor Windows configuration supplies a 24 MHz external clock and
programs the MIPI PLL with a divide-by-12 pre-divider and a multiply-by-90
multiplier. This gives a 180 MHz CSI-2 DDR link frequency, a 360 Mbit/s
single-lane bit rate and a 36 MHz pixel rate. With HTS 1616 and VTS 750,
the resulting frame rate is approximately 29.7 frames per second.

The exposure, analogue gain and digital gain register layout was
independently identified by Jake Steinman. Program multi-byte controls as
separate high- and low-byte writes, and bracket exposure and gain updates
with the sensor's group hold. The exposure default is 500 lines, selected
from illuminated captures on an ASUS Zenbook A14 and programmed by the
init sequence so the hardware and control states agree. The controls were
exercised on that system, including full-range exposure and analogue gain
tests and digital gain endpoint updates while streaming.

Assisted-by: Claude:claude-opus-5
Co-developed-by: Jake Steinman <j@metarealtyinc.ca>
Signed-off-by: Jake Steinman <j@metarealtyinc.ca>
Link: https://lore.kernel.org/r/20260727131252.1580332-1-j@metarealtyinc.ca
Link: https://lore.kernel.org/r/20260727154058.2350497-1-j@metarealtyinc.ca
Signed-off-by: Ramshouriesh R <rshouriesh@gmail.com>
---
 MAINTAINERS                |   7 +
 drivers/media/i2c/Kconfig  |  11 +
 drivers/media/i2c/Makefile |   1 +
 drivers/media/i2c/hm1092.c | 870 +++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 889 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c5519d67b6f4..fcba2a83baa9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11969,6 +11969,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/himax,hm1246.yaml
 F:	drivers/media/i2c/hm1246.c
 
+HIMAX HM1092 SENSOR DRIVER
+M:	Ramshouriesh R <rshouriesh@gmail.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/himax,hm1092.yaml
+F:	drivers/media/i2c/hm1092.c
+
 HIMAX HX83112B TOUCHSCREEN SUPPORT
 M:	Job Noorman <job@noorman.info>
 L:	linux-input@vger.kernel.org
diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 7de2d095c969..24ea80676849 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -137,6 +137,17 @@ config VIDEO_HI847
           To compile this driver as a module, choose M here: the
           module will be called hi847.
 
+config VIDEO_HM1092
+	tristate "Himax HM1092 sensor support"
+	select V4L2_CCI_I2C
+	help
+	  This is a Video4Linux2 sensor driver for the Himax HM1092
+	  monochrome near-infrared CMOS image sensor, used as the
+	  face-authentication IR camera on laptops.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called hm1092.
+
 config VIDEO_HM1246
 	tristate "Himax HM1246 sensor support"
 	depends on OF
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index 59e31af457cd..b25b9d73a04d 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -45,6 +45,7 @@ obj-$(CONFIG_VIDEO_GC2145) += gc2145.o
 obj-$(CONFIG_VIDEO_HI556) += hi556.o
 obj-$(CONFIG_VIDEO_HI846) += hi846.o
 obj-$(CONFIG_VIDEO_HI847) += hi847.o
+obj-$(CONFIG_VIDEO_HM1092) += hm1092.o
 obj-$(CONFIG_VIDEO_HM1246) += hm1246.o
 obj-$(CONFIG_VIDEO_I2C) += video-i2c.o
 obj-$(CONFIG_VIDEO_IMX111) += imx111.o
diff --git a/drivers/media/i2c/hm1092.c b/drivers/media/i2c/hm1092.c
new file mode 100644
index 000000000000..400e9ded2166
--- /dev/null
+++ b/drivers/media/i2c/hm1092.c
@@ -0,0 +1,870 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Himax HM1092 monochrome near-infrared image sensor driver.
+ *
+ * Copyright (c) 2026 Ramshouriesh R <rshouriesh@gmail.com>
+ */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
+#include <media/v4l2-cci.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
+
+/*
+ * CSI-2 D-PHY link frequency (DDR, i.e. half the per-lane bit rate).
+ *
+ * The vendor Windows configuration supplies a 24 MHz EXTCLK and programs the
+ * MIPI PLL pre-divider to 12 (0x030d = 0x0c) and multiplier to 90
+ * (0x030f = 0x5a):
+ *   link freq  = 24000000 * 90 / 12          = 180000000
+ *   bit rate   = link freq * 2               = 360000000 bps
+ *   pixel_rate = bit rate * 1 lane / 10 bpp  = 36000000 pixels/s
+ */
+#define HM1092_LINK_FREQ		180000000ULL
+#define HM1092_MCLK			24000000
+#define HM1092_BITS_PER_SAMPLE		10
+
+#define HM1092_REG_STREAM		CCI_REG8(0x0100)
+#define HM1092_STREAM_STANDBY		0x00
+#define HM1092_STREAM_ON		0x01
+
+#define HM1092_REG_TEST_PATTERN		CCI_REG8(0x0601)
+#define HM1092_TEST_PATTERN_MAX		4
+
+/*
+ * Exposure is a 16-bit value in lines and analogue gain an 8-bit register.
+ * Digital gain is a 10-bit value in 2.8 fixed point (0x100 is unity) split
+ * across 0x020e/0x020f; bits above bit 9 are ignored by the sensor.
+ * The register layout is not documented publicly; it was recovered from the
+ * vendor Windows driver. The exposure default (500) was selected from
+ * illuminated hardware tests and is also programmed by the init sequence at
+ * 0x0202/0x0203.
+ */
+#define HM1092_REG_EXPOSURE_H		CCI_REG8(0x0202)
+#define HM1092_REG_EXPOSURE_L		CCI_REG8(0x0203)
+#define HM1092_EXPOSURE_MIN		2
+#define HM1092_EXPOSURE_MARGIN		21
+#define HM1092_EXPOSURE_STEP		1
+#define HM1092_EXPOSURE_DEFAULT		500
+
+#define HM1092_REG_ANALOGUE_GAIN	CCI_REG8(0x0205)
+#define HM1092_ANALOGUE_GAIN_MIN	0
+#define HM1092_ANALOGUE_GAIN_MAX	0xff
+#define HM1092_ANALOGUE_GAIN_STEP	1
+#define HM1092_ANALOGUE_GAIN_DEFAULT	0
+
+#define HM1092_REG_DIGITAL_GAIN_H	CCI_REG8(0x020e)
+#define HM1092_REG_DIGITAL_GAIN_L	CCI_REG8(0x020f)
+#define HM1092_DIGITAL_GAIN_MIN		0x0100
+#define HM1092_DIGITAL_GAIN_MAX		0x03ff
+#define HM1092_DIGITAL_GAIN_STEP	1
+#define HM1092_DIGITAL_GAIN_DEFAULT	0x0100
+
+#define HM1092_REG_GROUP_HOLD		CCI_REG8(0x0104)
+#define HM1092_GROUP_HOLD_START		0x01
+#define HM1092_GROUP_HOLD_END		0x00
+
+/*
+ * Pixel array geometry. The vendor specifies a 1280x720 active array; the
+ * full array including the surrounding dummy/optical-black pixels is 1296x736
+ * (8 pixels of margin on each side). The crop bounds cover the full array,
+ * since a readout window may include the margin; the default crop is the
+ * active array. The single fixed mode reads a window out of the active array
+ * (X_ADDR [0x0030..0x04ad], Y_ADDR [0x0008..0x02d5]); subsequent internal
+ * processing produces the 560x360 output.
+ */
+#define HM1092_NATIVE_WIDTH		1296U
+#define HM1092_NATIVE_HEIGHT		736U
+#define HM1092_ACTIVE_LEFT		8U
+#define HM1092_ACTIVE_TOP		8U
+#define HM1092_ACTIVE_WIDTH		1280U
+#define HM1092_ACTIVE_HEIGHT		720U
+#define HM1092_CROP_LEFT		48U
+#define HM1092_CROP_TOP			8U
+#define HM1092_CROP_WIDTH		1150U
+#define HM1092_CROP_HEIGHT		718U
+
+static const struct cci_reg_sequence hm1092_init_regs[] = {
+	{ CCI_REG8(0x0103), 0x00 },
+	{ CCI_REG8(0x030a), 0x05 },
+	{ CCI_REG8(0x030d), 0x0c },
+	{ CCI_REG8(0x030f), 0x5a },
+	{ CCI_REG8(0x0307), 0x00 },
+	{ CCI_REG8(0x0309), 0x01 },
+	{ CCI_REG8(0x0387), 0x01 },
+	{ CCI_REG8(0x0100), 0x02 },
+	{ CCI_REG8(0x4265), 0x02 },
+	{ CCI_REG8(0x4002), 0x2b },
+	{ CCI_REG8(0x4001), 0x00 },
+	{ CCI_REG8(0x0101), 0x03 },
+	{ CCI_REG8(0x4024), 0x40 },
+	{ CCI_REG8(0x0203), 0xf4 },
+	{ CCI_REG8(0x0202), 0x01 },
+	{ CCI_REG8(0x0341), 0xee },
+	{ CCI_REG8(0x0340), 0x02 },
+	{ CCI_REG8(0x0343), 0x50 },
+	{ CCI_REG8(0x0342), 0x06 },
+	{ CCI_REG8(0x0345), 0x30 },
+	{ CCI_REG8(0x0344), 0x00 },
+	{ CCI_REG8(0x0349), 0xad },
+	{ CCI_REG8(0x0348), 0x04 },
+	{ CCI_REG8(0x0347), 0x08 },
+	{ CCI_REG8(0x0346), 0x00 },
+	{ CCI_REG8(0x034b), 0xd5 },
+	{ CCI_REG8(0x034a), 0x02 },
+	{ CCI_REG8(0x5015), 0xb3 },
+	{ CCI_REG8(0x0350), 0x53 },
+	{ CCI_REG8(0x0361), 0x30 },
+	{ CCI_REG8(0x0360), 0x00 },
+	{ CCI_REG8(0x034d), 0x30 },
+	{ CCI_REG8(0x034c), 0x02 },
+	{ CCI_REG8(0x034f), 0x68 },
+	{ CCI_REG8(0x034e), 0x01 },
+	{ CCI_REG8(0x0390), 0x03 },
+	{ CCI_REG8(0x0383), 0x00 },
+	{ CCI_REG8(0x0387), 0x10 },
+	{ CCI_REG8(0x50dd), 0x01 },
+	{ CCI_REG8(0x50cb), 0x21 },
+	{ CCI_REG8(0x5005), 0x28 },
+	{ CCI_REG8(0x5004), 0x40 },
+	{ CCI_REG8(0x5007), 0x28 },
+	{ CCI_REG8(0x5006), 0x40 },
+	{ CCI_REG8(0x5011), 0x00 },
+	{ CCI_REG8(0x501d), 0x4c },
+	{ CCI_REG8(0x5013), 0x03 },
+	{ CCI_REG8(0x4131), 0x01 },
+	{ CCI_REG8(0x5283), 0x03 },
+	{ CCI_REG8(0x5282), 0xff },
+	{ CCI_REG8(0x5010), 0x20 },
+	{ CCI_REG8(0x4132), 0x20 },
+	{ CCI_REG8(0x50d5), 0xe0 },
+	{ CCI_REG8(0x50d7), 0x12 },
+	{ CCI_REG8(0x50bb), 0x14 },
+	{ CCI_REG8(0x50b7), 0x00 },
+	{ CCI_REG8(0x50b9), 0xff },
+	{ CCI_REG8(0x50b8), 0x70 },
+	{ CCI_REG8(0x50ba), 0xff },
+	{ CCI_REG8(0x50fa), 0x02 },
+	{ CCI_REG8(0x50b4), 0x00 },
+	{ CCI_REG8(0x50a2), 0x0b },
+	{ CCI_REG8(0x50ad), 0x07 },
+	{ CCI_REG8(0x50ac), 0x24 },
+	{ CCI_REG8(0x50af), 0x40 },
+	{ CCI_REG8(0x50ae), 0x20 },
+	{ CCI_REG8(0x50ab), 0x07 },
+	{ CCI_REG8(0x50aa), 0x22 },
+	{ CCI_REG8(0x50a7), 0x00 },
+	{ CCI_REG8(0x50a6), 0x00 },
+	{ CCI_REG8(0x5099), 0x11 },
+	{ CCI_REG8(0x509b), 0x03 },
+	{ CCI_REG8(0x50b3), 0x04 },
+	{ CCI_REG8(0x50a0), 0x30 },
+	{ CCI_REG8(0x5098), 0x00 },
+	{ CCI_REG8(0x52f2), 0x53 },
+	{ CCI_REG8(0x5209), 0x0c },
+	{ CCI_REG8(0x5216), 0x02 },
+	{ CCI_REG8(0x521e), 0x01 },
+	{ CCI_REG8(0x50e8), 0x00 },
+	{ CCI_REG8(0x5200), 0x60 },
+	{ CCI_REG8(0x5202), 0x00 },
+	{ CCI_REG8(0x5201), 0x80 },
+	{ CCI_REG8(0x5203), 0x01 },
+	{ CCI_REG8(0x5208), 0x0b },
+	{ CCI_REG8(0x520d), 0x40 },
+	{ CCI_REG8(0x520c), 0x15 },
+	{ CCI_REG8(0x5215), 0x04 },
+	{ CCI_REG8(0x50ea), 0x74 },
+	{ CCI_REG8(0x5214), 0x28 },
+	{ CCI_REG8(0x5218), 0x07 },
+	{ CCI_REG8(0x5217), 0x01 },
+	{ CCI_REG8(0x0310), 0x00 },
+	{ CCI_REG8(0x4b31), 0x06 },
+	{ CCI_REG8(0x4b3b), 0x02 },
+	{ CCI_REG8(0x4b45), 0x01 },
+	{ CCI_REG8(0x4b44), 0x0c },
+	{ CCI_REG8(0x4b47), 0x00 },
+	{ CCI_REG8(0x5101), 0x13 },
+	{ CCI_REG8(0x5100), 0x03 },
+	{ CCI_REG8(0x5103), 0x33 },
+	{ CCI_REG8(0x5102), 0x23 },
+	{ CCI_REG8(0x5105), 0x42 },
+	{ CCI_REG8(0x5104), 0x43 },
+	{ CCI_REG8(0x5106), 0x40 },
+	{ CCI_REG8(0x5119), 0x00 },
+	{ CCI_REG8(0x5118), 0x00 },
+	{ CCI_REG8(0x511b), 0x00 },
+	{ CCI_REG8(0x511a), 0x00 },
+	{ CCI_REG8(0x511d), 0x00 },
+	{ CCI_REG8(0x511c), 0x00 },
+	{ CCI_REG8(0x511e), 0x00 },
+	{ CCI_REG8(0x5131), 0x23 },
+	{ CCI_REG8(0x5130), 0x13 },
+	{ CCI_REG8(0x5133), 0x43 },
+	{ CCI_REG8(0x5132), 0x33 },
+	{ CCI_REG8(0x5135), 0x40 },
+	{ CCI_REG8(0x5134), 0x42 },
+	{ CCI_REG8(0x5136), 0x40 },
+	{ CCI_REG8(0x5149), 0x01 },
+	{ CCI_REG8(0x5148), 0x01 },
+	{ CCI_REG8(0x514b), 0x01 },
+	{ CCI_REG8(0x514a), 0x01 },
+	{ CCI_REG8(0x514d), 0x01 },
+	{ CCI_REG8(0x514c), 0x01 },
+	{ CCI_REG8(0x514e), 0x01 },
+	{ CCI_REG8(0x51c0), 0x00 },
+	{ CCI_REG8(0x51c6), 0x00 },
+	{ CCI_REG8(0x51cc), 0x00 },
+	{ CCI_REG8(0x51d2), 0x00 },
+	{ CCI_REG8(0x51d8), 0x00 },
+	{ CCI_REG8(0x51c1), 0x81 },
+	{ CCI_REG8(0x51c7), 0x81 },
+	{ CCI_REG8(0x51cd), 0x81 },
+	{ CCI_REG8(0x51d3), 0x81 },
+	{ CCI_REG8(0x51d9), 0x81 },
+	{ CCI_REG8(0x51c2), 0xec },
+	{ CCI_REG8(0x51c8), 0xec },
+	{ CCI_REG8(0x51ce), 0xec },
+	{ CCI_REG8(0x51d4), 0xec },
+	{ CCI_REG8(0x51da), 0xec },
+	{ CCI_REG8(0x51c3), 0x00 },
+	{ CCI_REG8(0x51c9), 0x00 },
+	{ CCI_REG8(0x51cf), 0x00 },
+	{ CCI_REG8(0x51d5), 0x00 },
+	{ CCI_REG8(0x51db), 0x00 },
+	{ CCI_REG8(0x51c4), 0x55 },
+	{ CCI_REG8(0x51ca), 0x55 },
+	{ CCI_REG8(0x51d0), 0x54 },
+	{ CCI_REG8(0x51d6), 0x53 },
+	{ CCI_REG8(0x51dc), 0x53 },
+	{ CCI_REG8(0x51c5), 0x44 },
+	{ CCI_REG8(0x51cb), 0x24 },
+	{ CCI_REG8(0x51d1), 0x24 },
+	{ CCI_REG8(0x51d7), 0x14 },
+	{ CCI_REG8(0x51dd), 0x14 },
+	{ CCI_REG8(0x51e0), 0x09 },
+	{ CCI_REG8(0x51e2), 0x04 },
+	{ CCI_REG8(0x51e4), 0x08 },
+	{ CCI_REG8(0x51e6), 0x08 },
+	{ CCI_REG8(0x51e1), 0x03 },
+	{ CCI_REG8(0x51e3), 0x03 },
+	{ CCI_REG8(0x51e5), 0x07 },
+	{ CCI_REG8(0x51e8), 0x04 },
+	{ CCI_REG8(0x51e7), 0x07 },
+	{ CCI_REG8(0x51e9), 0x46 },
+	{ CCI_REG8(0x51eb), 0x62 },
+	{ CCI_REG8(0x51ea), 0x43 },
+	{ CCI_REG8(0x51ed), 0x00 },
+	{ CCI_REG8(0x51ec), 0x61 },
+	{ CCI_REG8(0x51ee), 0x00 },
+	{ CCI_REG8(0x5206), 0x80 },
+	{ CCI_REG8(0x3110), 0x02 },
+	{ CCI_REG8(0x3704), 0x02 },
+	{ CCI_REG8(0x3704), 0x02 },
+	{ CCI_REG8(0x4b20), 0x9e },
+	{ CCI_REG8(0x4b18), 0x00 },
+	{ CCI_REG8(0x4b3e), 0x00 },
+	{ CCI_REG8(0x4b0e), 0x0e },
+	{ CCI_REG8(0x4800), 0xac },
+	{ CCI_REG8(0x0104), 0x01 },
+	{ CCI_REG8(0x0104), 0x00 },
+	{ CCI_REG8(0x4801), 0xae },
+	{ CCI_REG8(0x0000), 0x00 },
+	{ CCI_REG8(0x0037), 0x30 },
+};
+
+struct hm1092_mode {
+	u32 width;
+	u32 height;
+	u32 hts;
+	u32 vts;
+};
+
+static const struct hm1092_mode hm1092_mode_560x360 = {
+	.width = 560,
+	.height = 360,
+	.hts = 0x0650,
+	.vts = 0x02ee,
+};
+
+static const char * const hm1092_supply_names[] = {
+	"dovdd",
+	"avdd",
+	"dvdd",
+};
+
+/*
+ * The available HM1092 documentation does not describe the test patterns.
+ * Their names are based on observed output from hardware testing; the
+ * register and mode values were reverse-engineered from the Windows driver.
+ */
+static const char * const hm1092_test_pattern_menu[] = {
+	"Disabled",
+	"Solid Color Fill",
+	"Standard Color Bars",
+	"Fade To Grey Color Bars",
+	"Pseudorandom data",
+};
+
+static const s64 hm1092_link_freq_menu[] = {
+	HM1092_LINK_FREQ,
+};
+
+struct hm1092 {
+	struct device *dev;
+	struct v4l2_subdev sd;
+	struct media_pad pad;
+	struct v4l2_ctrl_handler ctrl_handler;
+	struct regmap *regmap;
+	struct clk *img_clk;
+	struct gpio_desc *reset;
+	struct regulator_bulk_data supplies[ARRAY_SIZE(hm1092_supply_names)];
+	struct v4l2_ctrl *link_freq;
+	struct v4l2_ctrl *pixel_rate;
+	struct v4l2_ctrl *hblank;
+	struct v4l2_ctrl *vblank;
+	struct v4l2_ctrl *exposure;
+	u8 mipi_lanes;
+};
+
+static inline struct hm1092 *to_hm1092(struct v4l2_subdev *sd)
+{
+	return container_of(sd, struct hm1092, sd);
+}
+
+static int hm1092_set_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct hm1092 *hm1092 = container_of(ctrl->handler, struct hm1092,
+					     ctrl_handler);
+	int release_ret;
+	int ret = 0;
+
+	/*
+	 * The control value is cached by the framework and (re)applied from
+	 * hm1092_enable_streams() once the device is powered up for streaming.
+	 */
+	ret = pm_runtime_get_if_in_use(hm1092->dev);
+	if (ret <= 0)
+		return ret;
+
+	ret = 0;
+
+	switch (ctrl->id) {
+	case V4L2_CID_EXPOSURE:
+	case V4L2_CID_ANALOGUE_GAIN:
+	case V4L2_CID_DIGITAL_GAIN:
+		ret = cci_write(hm1092->regmap, HM1092_REG_GROUP_HOLD,
+				HM1092_GROUP_HOLD_START, NULL);
+		if (ret)
+			break;
+
+		if (ctrl->id == V4L2_CID_EXPOSURE) {
+			cci_write(hm1092->regmap, HM1092_REG_EXPOSURE_H,
+				  ctrl->val >> 8, &ret);
+			cci_write(hm1092->regmap, HM1092_REG_EXPOSURE_L,
+				  ctrl->val & 0xff, &ret);
+		} else if (ctrl->id == V4L2_CID_ANALOGUE_GAIN) {
+			cci_write(hm1092->regmap, HM1092_REG_ANALOGUE_GAIN,
+				  ctrl->val, &ret);
+		} else {
+			cci_write(hm1092->regmap, HM1092_REG_DIGITAL_GAIN_H,
+				  ctrl->val >> 8, &ret);
+			cci_write(hm1092->regmap, HM1092_REG_DIGITAL_GAIN_L,
+				  ctrl->val & 0xff, &ret);
+		}
+
+		release_ret = cci_write(hm1092->regmap, HM1092_REG_GROUP_HOLD,
+					HM1092_GROUP_HOLD_END, NULL);
+		if (!ret)
+			ret = release_ret;
+		break;
+	case V4L2_CID_TEST_PATTERN:
+		ret = cci_write(hm1092->regmap, HM1092_REG_TEST_PATTERN,
+				ctrl->val, NULL);
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	pm_runtime_put(hm1092->dev);
+
+	return ret;
+}
+
+static const struct v4l2_ctrl_ops hm1092_ctrl_ops = {
+	.s_ctrl = hm1092_set_ctrl,
+};
+
+static int hm1092_init_controls(struct hm1092 *hm1092)
+{
+	struct v4l2_ctrl_handler *ctrl_hdlr = &hm1092->ctrl_handler;
+	const struct hm1092_mode *mode = &hm1092_mode_560x360;
+	struct v4l2_fwnode_device_properties props;
+	s64 hblank, pixel_rate;
+	int ret;
+
+	ret = v4l2_fwnode_device_parse(hm1092->dev, &props);
+	if (ret)
+		return ret;
+
+	v4l2_ctrl_handler_init(ctrl_hdlr, 9);
+
+	hm1092->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr,
+						   &hm1092_ctrl_ops,
+						   V4L2_CID_LINK_FREQ,
+						   0, 0,
+						   hm1092_link_freq_menu);
+
+	pixel_rate = div_u64(HM1092_LINK_FREQ * 2 * hm1092->mipi_lanes,
+			     HM1092_BITS_PER_SAMPLE);
+	hm1092->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &hm1092_ctrl_ops,
+					       V4L2_CID_PIXEL_RATE, 0,
+					       pixel_rate, 1, pixel_rate);
+
+	hblank = mode->hts - mode->width;
+	hm1092->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &hm1092_ctrl_ops,
+					   V4L2_CID_HBLANK, hblank, hblank, 1,
+					   hblank);
+
+	hm1092->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &hm1092_ctrl_ops,
+					   V4L2_CID_VBLANK,
+					   mode->vts - mode->height,
+					   0xffff - mode->height, 1,
+					   mode->vts - mode->height);
+
+	hm1092->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &hm1092_ctrl_ops,
+					     V4L2_CID_EXPOSURE,
+					     HM1092_EXPOSURE_MIN,
+					     mode->vts -
+					     HM1092_EXPOSURE_MARGIN,
+					     HM1092_EXPOSURE_STEP,
+					     HM1092_EXPOSURE_DEFAULT);
+
+	v4l2_ctrl_new_std(ctrl_hdlr, &hm1092_ctrl_ops,
+			  V4L2_CID_ANALOGUE_GAIN,
+			  HM1092_ANALOGUE_GAIN_MIN,
+			  HM1092_ANALOGUE_GAIN_MAX,
+			  HM1092_ANALOGUE_GAIN_STEP,
+			  HM1092_ANALOGUE_GAIN_DEFAULT);
+
+	v4l2_ctrl_new_std(ctrl_hdlr, &hm1092_ctrl_ops,
+			  V4L2_CID_DIGITAL_GAIN,
+			  HM1092_DIGITAL_GAIN_MIN,
+			  HM1092_DIGITAL_GAIN_MAX,
+			  HM1092_DIGITAL_GAIN_STEP,
+			  HM1092_DIGITAL_GAIN_DEFAULT);
+
+	v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &hm1092_ctrl_ops,
+				     V4L2_CID_TEST_PATTERN,
+				     ARRAY_SIZE(hm1092_test_pattern_menu) - 1,
+				     0, 0, hm1092_test_pattern_menu);
+
+	v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &hm1092_ctrl_ops, &props);
+
+	if (ctrl_hdlr->error) {
+		ret = ctrl_hdlr->error;
+		goto err_free;
+	}
+
+	hm1092->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+	hm1092->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+	hm1092->vblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+
+	hm1092->sd.ctrl_handler = ctrl_hdlr;
+
+	return 0;
+
+err_free:
+	v4l2_ctrl_handler_free(ctrl_hdlr);
+
+	return ret;
+}
+
+static void hm1092_update_pad_format(struct v4l2_mbus_framefmt *fmt)
+{
+	fmt->width = hm1092_mode_560x360.width;
+	fmt->height = hm1092_mode_560x360.height;
+	fmt->code = MEDIA_BUS_FMT_Y10_1X10;
+	fmt->field = V4L2_FIELD_NONE;
+	fmt->colorspace = V4L2_COLORSPACE_RAW;
+	fmt->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+	fmt->quantization = V4L2_QUANTIZATION_DEFAULT;
+	fmt->xfer_func = V4L2_XFER_FUNC_NONE;
+}
+
+static int hm1092_enable_streams(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state,
+				 u32 pad, u64 streams_mask)
+{
+	struct hm1092 *hm1092 = to_hm1092(sd);
+	int ret;
+
+	ret = pm_runtime_resume_and_get(hm1092->dev);
+	if (ret)
+		return ret;
+
+	ret = cci_multi_reg_write(hm1092->regmap, hm1092_init_regs,
+				  ARRAY_SIZE(hm1092_init_regs), NULL);
+	if (ret) {
+		dev_err(hm1092->dev, "failed to write init registers\n");
+		goto out;
+	}
+
+	ret = __v4l2_ctrl_handler_setup(hm1092->sd.ctrl_handler);
+	if (ret)
+		goto out;
+
+	ret = cci_write(hm1092->regmap, HM1092_REG_STREAM,
+			HM1092_STREAM_ON, NULL);
+	if (ret)
+		dev_err(hm1092->dev, "failed to start streaming\n");
+
+out:
+	if (ret)
+		pm_runtime_put(hm1092->dev);
+
+	return ret;
+}
+
+static int hm1092_disable_streams(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state,
+				  u32 pad, u64 streams_mask)
+{
+	struct hm1092 *hm1092 = to_hm1092(sd);
+	int ret;
+
+	ret = cci_write(hm1092->regmap, HM1092_REG_STREAM,
+			HM1092_STREAM_STANDBY, NULL);
+	pm_runtime_put(hm1092->dev);
+
+	return ret;
+}
+
+static int hm1092_enum_mbus_code(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state,
+				 struct v4l2_subdev_mbus_code_enum *code)
+{
+	if (code->index)
+		return -EINVAL;
+
+	code->code = MEDIA_BUS_FMT_Y10_1X10;
+
+	return 0;
+}
+
+static int hm1092_enum_frame_size(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state,
+				  struct v4l2_subdev_frame_size_enum *fse)
+{
+	if (fse->index)
+		return -EINVAL;
+
+	if (fse->code != MEDIA_BUS_FMT_Y10_1X10)
+		return -EINVAL;
+
+	fse->min_width = hm1092_mode_560x360.width;
+	fse->max_width = hm1092_mode_560x360.width;
+	fse->min_height = hm1092_mode_560x360.height;
+	fse->max_height = hm1092_mode_560x360.height;
+
+	return 0;
+}
+
+static int hm1092_get_selection(struct v4l2_subdev *sd,
+				const struct v4l2_subdev_client_info *ci,
+				struct v4l2_subdev_state *state,
+				struct v4l2_subdev_selection *sel)
+{
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP:
+		sel->r.left = HM1092_CROP_LEFT;
+		sel->r.top = HM1092_CROP_TOP;
+		sel->r.width = HM1092_CROP_WIDTH;
+		sel->r.height = HM1092_CROP_HEIGHT;
+		return 0;
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+		sel->r.left = HM1092_ACTIVE_LEFT;
+		sel->r.top = HM1092_ACTIVE_TOP;
+		sel->r.width = HM1092_ACTIVE_WIDTH;
+		sel->r.height = HM1092_ACTIVE_HEIGHT;
+		return 0;
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+	case V4L2_SEL_TGT_NATIVE_SIZE:
+		sel->r.left = 0;
+		sel->r.top = 0;
+		sel->r.width = HM1092_NATIVE_WIDTH;
+		sel->r.height = HM1092_NATIVE_HEIGHT;
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int hm1092_init_state(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *state)
+{
+	hm1092_update_pad_format(v4l2_subdev_state_get_format(state, 0));
+
+	return 0;
+}
+
+static const struct v4l2_subdev_video_ops hm1092_video_ops = {
+	.s_stream = v4l2_subdev_s_stream_helper,
+};
+
+static const struct v4l2_subdev_pad_ops hm1092_pad_ops = {
+	.get_fmt = v4l2_subdev_get_fmt,
+	.enum_mbus_code = hm1092_enum_mbus_code,
+	.enum_frame_size = hm1092_enum_frame_size,
+	.get_selection = hm1092_get_selection,
+	.enable_streams = hm1092_enable_streams,
+	.disable_streams = hm1092_disable_streams,
+};
+
+static const struct v4l2_subdev_ops hm1092_subdev_ops = {
+	.video = &hm1092_video_ops,
+	.pad = &hm1092_pad_ops,
+};
+
+static const struct media_entity_operations hm1092_entity_ops = {
+	.link_validate = v4l2_subdev_link_validate,
+};
+
+static const struct v4l2_subdev_internal_ops hm1092_internal_ops = {
+	.init_state = hm1092_init_state,
+};
+
+static int hm1092_check_hwcfg(struct hm1092 *hm1092)
+{
+	struct v4l2_fwnode_endpoint bus_cfg = {
+		.bus = {
+			.mipi_csi2 = {
+				.num_data_lanes = 1,
+			},
+		},
+		.bus_type = V4L2_MBUS_CSI2_DPHY,
+	};
+	struct device *dev = hm1092->dev;
+	struct fwnode_handle *ep, *fwnode = dev_fwnode(dev);
+	unsigned long link_freq_bitmap;
+	int ret;
+
+	ep = fwnode_graph_get_endpoint_by_id(fwnode, 0, 0, 0);
+	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
+	fwnode_handle_put(ep);
+	if (ret)
+		return dev_err_probe(dev, ret, "parsing endpoint failed\n");
+
+	ret = v4l2_link_freq_to_bitmap(dev, bus_cfg.link_frequencies,
+				       bus_cfg.nr_of_link_frequencies,
+				       hm1092_link_freq_menu,
+				       ARRAY_SIZE(hm1092_link_freq_menu),
+				       &link_freq_bitmap);
+	if (ret)
+		goto out;
+
+	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 1) {
+		ret = dev_err_probe(dev, -EINVAL,
+				    "only 1 data lane is supported, got %u\n",
+				    bus_cfg.bus.mipi_csi2.num_data_lanes);
+		goto out;
+	}
+
+	hm1092->mipi_lanes = bus_cfg.bus.mipi_csi2.num_data_lanes;
+
+out:
+	v4l2_fwnode_endpoint_free(&bus_cfg);
+	return ret;
+}
+
+static int hm1092_get_pm_resources(struct hm1092 *hm1092)
+{
+	hm1092->reset = devm_gpiod_get_optional(hm1092->dev, "reset",
+						GPIOD_OUT_HIGH);
+	if (IS_ERR(hm1092->reset))
+		return dev_err_probe(hm1092->dev, PTR_ERR(hm1092->reset),
+				     "failed to get reset gpio\n");
+
+	for (unsigned int i = 0; i < ARRAY_SIZE(hm1092_supply_names); i++)
+		hm1092->supplies[i].supply = hm1092_supply_names[i];
+
+	return devm_regulator_bulk_get(hm1092->dev,
+				       ARRAY_SIZE(hm1092_supply_names),
+				       hm1092->supplies);
+}
+
+static int hm1092_power_off(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct hm1092 *hm1092 = to_hm1092(sd);
+
+	gpiod_set_value_cansleep(hm1092->reset, 1);
+	clk_disable_unprepare(hm1092->img_clk);
+	regulator_bulk_disable(ARRAY_SIZE(hm1092_supply_names),
+			       hm1092->supplies);
+
+	return 0;
+}
+
+static int hm1092_power_on(struct device *dev)
+{
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
+	struct hm1092 *hm1092 = to_hm1092(sd);
+	int ret;
+
+	/*
+	 * Power-up sequence:
+	 *   1. enable all rails (~3 ms ramp)
+	 *   2. hold reset asserted
+	 *   3. start MCLK and let the sensor clock for ~1 ms
+	 *   4. release reset and wait 18 ms for the sensor to come up
+	 */
+	ret = regulator_bulk_enable(ARRAY_SIZE(hm1092_supply_names),
+				    hm1092->supplies);
+	if (ret)
+		return ret;
+	fsleep(3000);
+
+	gpiod_set_value_cansleep(hm1092->reset, 1);
+
+	ret = clk_prepare_enable(hm1092->img_clk);
+	if (ret) {
+		regulator_bulk_disable(ARRAY_SIZE(hm1092_supply_names),
+				       hm1092->supplies);
+		return ret;
+	}
+	fsleep(1000);
+
+	gpiod_set_value_cansleep(hm1092->reset, 0);
+	fsleep(18000);
+
+	return 0;
+}
+
+static void hm1092_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct hm1092 *hm1092 = to_hm1092(sd);
+
+	v4l2_async_unregister_subdev(sd);
+	v4l2_subdev_cleanup(sd);
+	media_entity_cleanup(&sd->entity);
+	v4l2_ctrl_handler_free(sd->ctrl_handler);
+	pm_runtime_disable(hm1092->dev);
+	if (!pm_runtime_status_suspended(hm1092->dev)) {
+		hm1092_power_off(hm1092->dev);
+		pm_runtime_set_suspended(hm1092->dev);
+	}
+}
+
+static int hm1092_probe(struct i2c_client *client)
+{
+	struct hm1092 *hm1092;
+	unsigned long freq;
+	int ret;
+
+	hm1092 = devm_kzalloc(&client->dev, sizeof(*hm1092), GFP_KERNEL);
+	if (!hm1092)
+		return -ENOMEM;
+
+	hm1092->dev = &client->dev;
+
+	hm1092->img_clk = devm_v4l2_sensor_clk_get(hm1092->dev, NULL);
+	if (IS_ERR(hm1092->img_clk))
+		return dev_err_probe(hm1092->dev, PTR_ERR(hm1092->img_clk),
+				     "failed to get imaging clock\n");
+
+	freq = clk_get_rate(hm1092->img_clk);
+	if (freq != HM1092_MCLK)
+		return dev_err_probe(hm1092->dev, -EINVAL,
+				     "external clock %lu is not supported\n",
+				     freq);
+
+	v4l2_i2c_subdev_init(&hm1092->sd, client, &hm1092_subdev_ops);
+
+	ret = hm1092_check_hwcfg(hm1092);
+	if (ret)
+		return ret;
+
+	ret = hm1092_get_pm_resources(hm1092);
+	if (ret)
+		return ret;
+
+	hm1092->regmap = devm_cci_regmap_init_i2c(client, 16);
+	if (IS_ERR(hm1092->regmap))
+		return PTR_ERR(hm1092->regmap);
+
+	ret = hm1092_init_controls(hm1092);
+	if (ret)
+		return ret;
+
+	hm1092->sd.internal_ops = &hm1092_internal_ops;
+	hm1092->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	hm1092->sd.entity.ops = &hm1092_entity_ops;
+	hm1092->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
+	hm1092->pad.flags = MEDIA_PAD_FL_SOURCE;
+	ret = media_entity_pads_init(&hm1092->sd.entity, 1, &hm1092->pad);
+	if (ret)
+		goto err_ctrls;
+
+	hm1092->sd.state_lock = hm1092->ctrl_handler.lock;
+	ret = v4l2_subdev_init_finalize(&hm1092->sd);
+	if (ret)
+		goto err_entity;
+
+	/*
+	 * The sensor is left powered off; runtime PM brings it up on demand
+	 * from hm1092_enable_streams(). There is no I2C access during probe
+	 * (e.g. a chip-ID read) that would require it to be powered here.
+	 */
+	pm_runtime_enable(hm1092->dev);
+
+	ret = v4l2_async_register_subdev_sensor(&hm1092->sd);
+	if (ret)
+		goto err_subdev;
+
+	return 0;
+
+err_subdev:
+	pm_runtime_disable(hm1092->dev);
+	v4l2_subdev_cleanup(&hm1092->sd);
+
+err_entity:
+	media_entity_cleanup(&hm1092->sd.entity);
+
+err_ctrls:
+	v4l2_ctrl_handler_free(hm1092->sd.ctrl_handler);
+
+	return ret;
+}
+
+static DEFINE_RUNTIME_DEV_PM_OPS(hm1092_pm_ops, hm1092_power_off,
+				 hm1092_power_on, NULL);
+
+static const struct of_device_id hm1092_of_match[] = {
+	{ .compatible = "himax,hm1092" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, hm1092_of_match);
+
+static struct i2c_driver hm1092_i2c_driver = {
+	.driver = {
+		.name = "hm1092",
+		.pm = pm_ptr(&hm1092_pm_ops),
+		.of_match_table = hm1092_of_match,
+	},
+	.probe = hm1092_probe,
+	.remove = hm1092_remove,
+};
+
+module_i2c_driver(hm1092_i2c_driver);
+
+MODULE_DESCRIPTION("Himax HM1092 monochrome NIR image sensor driver");
+MODULE_LICENSE("GPL");

-- 
2.55.0

