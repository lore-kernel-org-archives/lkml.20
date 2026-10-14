Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005BA565103
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792000475; cv=none; b=TPQEcOOFMCEYt0dwyRqlcpLc6Ih28ECgffTouki8wJEYuiMUNUNpkXl1LxGj0QjQS7qQukxWVWAyXc+BnSzG5tr+u+bc8BfPRR6/P2sVMl/bs/oRuPI4eVBHETF33FI3HWAbdLs+rChvOUjyAQZPNq4uaAgaaHSvJuf2mqQXKMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792000475; c=relaxed/simple;
	bh=q5/nFl33gIb+9G5q0LLySt9WYEgi6UVRbmHdychN4jI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NuFHrWxzmCZWIUSC5Og1xj1neeMVyOUev7bWGeJhAtLEh6orHTxG2xeraj98ttR1eHfgSbAvOHHno6tNox7NURBhEaWm7Y/G3m0qBKiwOkDqe+02tXPGHZYQtRbRVtyKkgDrd8Ldp1ymfq9rXOahIXgwQeMv7nb6yvkERP60D74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=iyMaSeY7; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="iyMaSeY7"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a180fbeef5so40348515e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792000469; x=1792605269; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ofz43bU5BaD/krhSBxiucOpWcoFRBOUIEn5p3otWsSA=;
        b=iyMaSeY7QTrNzJCbftB/sNpnStLF1Jw7/rovlZzWdWWTRcVp8bvDMp3UsOAaI00pDr
         OVVE1ZAs36Lh2Q7vRZ7UJqrDUfotSoqDRXEGe3DEcVhYTfmhrw/A9geAuyPy7aN/P3Jp
         YsIMtq82jB1xMeCBZbr2xrcd3KWYdS9DVdTt4+Maar1cmB1ukH75GNMhytZpXkqYcxMG
         bSxQ8xBl/A2vCBcCPjUSHGbcmBQAdi5Y4w5ZOSI581x8wu3qrpRB8Wdra2wtOSaxthbL
         5nsk8bkkKCdGcbJ7jkI0qI6A6uaev7Z0z8uYMzDIGAWJHOqapgEiR8cd26r1iRedCfkM
         xEYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792000469; x=1792605269;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ofz43bU5BaD/krhSBxiucOpWcoFRBOUIEn5p3otWsSA=;
        b=KJxR7AYGu5ap6OBlyT6+c1Rslcf+BjEjWR1rTzOhgOU5USLZdZpzT9kdArbYcPSbNX
         mY2ONkpoR4HbTp/io8p8z1p3yEDO77Y6p+tPTaRk+yjgvEW8p/VnWUCSPNuYKF1hPGII
         drWcQDYIqr+5J3rs7xhJm5osXuJH0ksEduc+3rJRSYYQDj0SY3whC4nUk5oBGYds9WgB
         TjVTR8mGxAjxOQgHNgkJgrcIWPrBoav9b08ma+4bkrNSY4+FTvw5FSh3SVEDcVDVtSnJ
         n6xHvBGcbGNxH6nf1V2eArb6YAarOgX11nHl0asYiTG/YB3/NN4n2RUV0hYlwY3RMUlw
         Evlw==
X-Forwarded-Encrypted: i=1; AKwUvBwQtcRjUgAb9yCU9xOw/Xa6yKs6JSrFy4+36T7vGXsr3Ny9VBMU41gj/D+xzeNAtfK4bQKP2PNqCllwy3U=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRdqYUYd+xL/jeaV56FMFiT6SR8OufH5CG9UQRPvRdZka4kgny
	+llf25+fTZKf5R5ZlwkDlCTo26MTgFIcAL4LckFbsZ3BjtvBQI0QgJQmrf+CKzU/Qik=
X-Gm-Gg: AYBFou1DwcmSICDzDEyOZ0oQYQwnBeTYY+p5bdrpiOcHNk+qoVlbsqrOUh4SwstpyqV
	fjedtiWy04rdKujRWueAc6x6J+RVetaXal1qCwBITvDk0mq2FPvl6tyYU8hxG+0d75SaIVwXNxn
	7bo50kO762pNurAVpWjEOX0nKysVyNIJinvl/opn3eLpFK6Zg3KVb3uZVFhEOd8xH2pdgONW5sr
	2YjVOHPEngNZLPEsAabmvCWo11vfq+XZPcuwaXSU8JN9GfTaGaK0PNO7yfwlxNvpeNrtewlPQF0
	/4IaxnTmPb22MmlpUURGQIyn/fk9eXOpPcMWZbSyEGfsx6ARRyH3CLoMIETSj7pHMqriPV3piam
	zHk7VVXB1N8CP47oQUdm/FlG4mGgb1goFd25yrbdkKIMjPjTKpz/xlHRbUu2scFGyaBmJBuuxyw
	4jPKAiYl+b5JBisOsp4xNsCLWfDBA+L1yUrNvvrEcd8jysYE9wiXG1ruGhTyqUAvlRoNI7SCyXb
	a3sgJSrF8LFpgqvisb3PA9UNp5hUYAffvqzizEaa14Aa13PpQ==
X-Received: by 2002:a05:600c:1909:b0:4a1:722a:d2a3 with SMTP id 5b1f17b1804b1-4a18e4a3f5amr367764315e9.23.1792000468962;
        Wed, 14 Oct 2026 10:54:28 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1bd986095sm8188395e9.7.2026.10.14.10.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:54:28 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 14 Oct 2026 18:54:22 +0100
Subject: [PATCH v3 01/14] media: imx678: Rework into generic Starvis 2
 sensor driver.
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-media-starvis2-v3-1-c958362b5d06@raspberrypi.com>
References: <20261014-media-starvis2-v3-0-c958362b5d06@raspberrypi.com>
In-Reply-To: <20261014-media-starvis2-v3-0-c958362b5d06@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

The register layout and programming model for multiple of the
Sony Starvis2 sensors is identical, so prepare for supporting
those by renaming all common parts of the driver to a starvis2_
prefix, and renaming the driver.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 MAINTAINERS                                     |  14 +-
 drivers/media/i2c/Kconfig                       |  19 +-
 drivers/media/i2c/Makefile                      |   2 +-
 drivers/media/i2c/{imx678.c => sony-starvis2.c} | 773 ++++++++++++------------
 4 files changed, 422 insertions(+), 386 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 760791e3635f..bba095bc1a63 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25640,13 +25640,6 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/sony,imx576.yaml
 F:	drivers/media/i2c/imx576.c
 
-SONY IMX678 SENSOR DRIVER
-M:	Jai Luthra <jai.luthra@ideasonboard.com>
-L:	linux-media@vger.kernel.org
-S:	Maintained
-F:	Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
-F:	drivers/media/i2c/imx678.c
-
 SONY MEMORYSTICK SUBSYSTEM
 M:	Maxim Levitsky <maximlevitsky@gmail.com>
 M:	Alex Dubov <oakad@yahoo.com>
@@ -25657,6 +25650,13 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git
 F:	drivers/memstick/
 F:	include/linux/memstick.h
 
+SONY STARVIS 2 SENSOR DRIVER
+M:	Jai Luthra <jai.luthra@ideasonboard.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
+F:	drivers/media/i2c/sony-starvis2.c
+
 SONY VAIO CONTROL DEVICE DRIVER
 M:	Mattia Dongili <malattia@linux.it>
 L:	platform-driver-x86@vger.kernel.org
diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 7de2d095c969..8c43ae77b47e 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -324,13 +324,11 @@ config VIDEO_IMX576
 config VIDEO_IMX678
 	tristate "Sony IMX678 sensor support"
 	depends on GPIOLIB
-	select V4L2_CCI_I2C
+	select VIDEO_SONY_STARVIS2
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
-	  IMX678 camera.
-
-	  To compile this driver as a module, choose M here: the
-	  module will be called imx678.
+	  IMX678 camera. This sensor is now supported by the common
+	  Sony Starvis 2 sensor driver.
 
 config VIDEO_MAX9271_LIB
 	tristate
@@ -879,6 +877,17 @@ config VIDEO_S5KJN5
 	  To compile this driver as a module, choose M here: the
 	  module will be called s5kjn5.
 
+config VIDEO_SONY_STARVIS2
+	tristate "Sony Starvis 2 sensor support"
+	depends on GPIOLIB
+	select V4L2_CCI_I2C
+	help
+	  This is a Video4Linux2 sensor driver for the Sony Starvis
+	  2 image sensors.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called sony-starvis2.
+
 config VIDEO_T4KA3
 	tristate "Toshiba T4KA3 sensor support"
 	depends on ACPI || COMPILE_TEST
diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
index 59e31af457cd..609208dabd07 100644
--- a/drivers/media/i2c/Makefile
+++ b/drivers/media/i2c/Makefile
@@ -64,7 +64,6 @@ obj-$(CONFIG_VIDEO_IMX412) += imx412.o
 obj-$(CONFIG_VIDEO_IMX415) += imx415.o
 obj-$(CONFIG_VIDEO_IMX471) += imx471.o
 obj-$(CONFIG_VIDEO_IMX576) += imx576.o
-obj-$(CONFIG_VIDEO_IMX678) += imx678.o
 obj-$(CONFIG_VIDEO_IR_I2C) += ir-kbd-i2c.o
 obj-$(CONFIG_VIDEO_ISL7998X) += isl7998x.o
 obj-$(CONFIG_VIDEO_IT6625) += it6625.o
@@ -146,6 +145,7 @@ obj-$(CONFIG_VIDEO_SAA7127) += saa7127.o
 obj-$(CONFIG_VIDEO_SAA717X) += saa717x.o
 obj-$(CONFIG_VIDEO_SAA7185) += saa7185.o
 obj-$(CONFIG_VIDEO_SONY_BTF_MPX) += sony-btf-mpx.o
+obj-$(CONFIG_VIDEO_SONY_STARVIS2) += sony-starvis2.o
 obj-$(CONFIG_VIDEO_ST_MIPID02) += st-mipid02.o
 obj-$(CONFIG_VIDEO_T4KA3) += t4ka3.o
 obj-$(CONFIG_VIDEO_TC358743) += tc358743.o
diff --git a/drivers/media/i2c/imx678.c b/drivers/media/i2c/sony-starvis2.c
similarity index 56%
rename from drivers/media/i2c/imx678.c
rename to drivers/media/i2c/sony-starvis2.c
index 8413fd44d657..b4733990d03a 100644
--- a/drivers/media/i2c/imx678.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -1,8 +1,13 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * V4L2 driver for Sony IMX678
+ * V4L2 driver for Sony Starvis 2 sensors
  *
- * Diagonal 8.86 mm (Type 1/1.8) CMOS image sensor with 8.40 M effective pixels.
+ * Many of the Sony Starvis 2 sensors share a common register layout, so
+ * many can be supported by a common driver.
+ *
+ * Currently supported are:
+ * IMX678: Diagonal 8.86 mm (Type 1/1.8) CMOS image sensor with 8.40 M effective
+ *         pixels.
  *
  * Copyright (C) 2026 Ideas On Board Oy.
  *
@@ -26,25 +31,25 @@
 #include <media/v4l2-subdev.h>
 
 /* Standby or streaming mode */
-#define IMX678_REG_MODE_SELECT          CCI_REG8(0x3000)
-#define IMX678_MODE_STANDBY             0x01
-#define IMX678_MODE_STREAMING           0x00
-#define IMX678_STREAM_DELAY_US          25000
-#define IMX678_STREAM_DELAY_RANGE_US    1000
+#define STARVIS2_REG_MODE_SELECT          CCI_REG8(0x3000)
+#define STARVIS2_MODE_STANDBY             0x01
+#define STARVIS2_MODE_STREAMING           0x00
+#define STARVIS2_STREAM_DELAY_US          25000
+#define STARVIS2_STREAM_DELAY_RANGE_US    1000
 
 /* XVS/XHS sync control */
-#define IMX678_REG_XMSTA                CCI_REG8(0x3002)
-#define IMX678_REG_XXS_DRV              CCI_REG8(0x30a6)
-#define IMX678_REG_XXS_OUTSEL           CCI_REG8(0x30a4)
+#define STARVIS2_REG_XMSTA                CCI_REG8(0x3002)
+#define STARVIS2_REG_XXS_DRV              CCI_REG8(0x30a6)
+#define STARVIS2_REG_XXS_OUTSEL           CCI_REG8(0x30a4)
 
 /* Clk selection */
-#define IMX678_REG_INCK_SEL             CCI_REG8(0x3014)
+#define STARVIS2_REG_INCK_SEL             CCI_REG8(0x3014)
 
 /* Link Speed */
-#define IMX678_REG_DATARATE_SEL         CCI_REG8(0x3015)
+#define STARVIS2_REG_DATARATE_SEL         CCI_REG8(0x3015)
 
 /* Lane Count */
-#define IMX678_REG_LANEMODE             CCI_REG8(0x3040)
+#define STARVIS2_REG_LANEMODE             CCI_REG8(0x3040)
 
 /*
  * The internal readout clock runs at 74.25 MHz. In one cycle the AD reads 8
@@ -54,22 +59,22 @@
 #define IMX678_PIX_PER_CLK		8
 
 /* VMAX - Frame Length in Lines */
-#define IMX678_REG_VMAX                 CCI_REG24_LE(0x3028)
-#define IMX678_VMAX_MAX                 0xfffff
+#define STARVIS2_REG_VMAX                 CCI_REG24_LE(0x3028)
+#define STARVIS2_VMAX_MAX                 0xfffff
 #define IMX678_VMAX_DEFAULT             2250
 
 /* HMAX - Line Length in Cycles (8 Pixels) */
-#define IMX678_REG_HMAX                 CCI_REG16_LE(0x302c)
-#define IMX678_HMAX_MAX                 0xffff
+#define STARVIS2_REG_HMAX                 CCI_REG16_LE(0x302c)
+#define STARVIS2_HMAX_MAX                 0xffff
 
 /* SHR internal */
-#define IMX678_REG_SHR                  CCI_REG24_LE(0x3050)
-#define IMX678_SHR_MIN                  8
+#define STARVIS2_REG_SHR                  CCI_REG24_LE(0x3050)
+#define STARVIS2_SHR_MIN                  8
 
 /* Exposure control */
-#define IMX678_EXPOSURE_MIN             2
-#define IMX678_EXPOSURE_STEP            1
-#define IMX678_EXPOSURE_DEFAULT         1000
+#define STARVIS2_EXPOSURE_MIN             2
+#define STARVIS2_EXPOSURE_STEP            1
+#define STARVIS2_EXPOSURE_DEFAULT         1000
 
 /*
  * Analogue gain control
@@ -77,63 +82,63 @@
  * Values from 101 to 240 are valid but correspond to additional digital gain
  * (0.3dB - 42dB) so don't expose it to userspace
  */
-#define IMX678_REG_GAIN			CCI_REG16_LE(0x3070)
-#define IMX678_ANA_GAIN_MIN_NORMAL      0
-#define IMX678_ANA_GAIN_MAX_NORMAL      100
-#define IMX678_ANA_GAIN_STEP            1
-#define IMX678_ANA_GAIN_DEFAULT         0
+#define STARVIS2_REG_GAIN			CCI_REG16_LE(0x3070)
+#define STARVIS2_ANA_GAIN_MIN_NORMAL      0
+#define STARVIS2_ANA_GAIN_MAX_NORMAL      100
+#define STARVIS2_ANA_GAIN_STEP            1
+#define STARVIS2_ANA_GAIN_DEFAULT         0
 
 /* Crop */
-#define IMX678_REG_WINMODE		CCI_REG8(0x3018)
-#define IMX678_REG_PIX_HST		CCI_REG16_LE(0x303c)
-#define IMX678_REG_PIX_HWIDTH		CCI_REG16_LE(0x303e)
-#define IMX678_REG_PIX_VST		CCI_REG16_LE(0x3044)
-#define IMX678_REG_PIX_VWIDTH		CCI_REG16_LE(0x3046)
+#define STARVIS2_REG_WINMODE		CCI_REG8(0x3018)
+#define STARVIS2_REG_PIX_HST		CCI_REG16_LE(0x303c)
+#define STARVIS2_REG_PIX_HWIDTH		CCI_REG16_LE(0x303e)
+#define STARVIS2_REG_PIX_VST		CCI_REG16_LE(0x3044)
+#define STARVIS2_REG_PIX_VWIDTH		CCI_REG16_LE(0x3046)
 
 /* Flip */
-#define IMX678_REG_WINMODEH             CCI_REG8(0x3020)
-#define IMX678_REG_WINMODEV             CCI_REG8(0x3021)
+#define STARVIS2_REG_WINMODEH             CCI_REG8(0x3020)
+#define STARVIS2_REG_WINMODEV             CCI_REG8(0x3021)
 
 /* Sensor Identification */
-#define IMX678_REG_MONOCHROME		CCI_REG8(0x4d18)
-#define IMX678_TYPE			BIT(0)
+#define STARVIS2_REG_MONOCHROME		CCI_REG8(0x4d18)
+#define STARVIS2_TYPE			BIT(0)
 #define IMX678_REG_MODULE_ID		CCI_REG16_LE(0x4d1c)
 #define IMX678_ID			0x02a6
-#define IMX678_MODULE_ID_DELAY		80000
+#define STARVIS2_MODULE_ID_DELAY	80000
 
 /* Common configuration registers */
-#define IMX678_REG_WDMODE               CCI_REG8(0x301a)
-#define IMX678_REG_ADDMODE              CCI_REG8(0x301b)
-#define IMX678_REG_THIN_V_EN            CCI_REG8(0x301c)
-#define IMX678_REG_VCMODE               CCI_REG8(0x301e)
-#define IMX678_REG_ADBIT                CCI_REG8(0x3022)
-#define IMX678_REG_MDBIT                CCI_REG8(0x3023)
-#define IMX678_REG_GAIN_PGC_FIDMD       CCI_REG8(0x3400)
+#define STARVIS2_REG_WDMODE               CCI_REG8(0x301a)
+#define STARVIS2_REG_ADDMODE              CCI_REG8(0x301b)
+#define STARVIS2_REG_THIN_V_EN            CCI_REG8(0x301c)
+#define STARVIS2_REG_VCMODE               CCI_REG8(0x301e)
+#define STARVIS2_REG_ADBIT                CCI_REG8(0x3022)
+#define STARVIS2_REG_MDBIT                CCI_REG8(0x3023)
+#define STARVIS2_REG_GAIN_PGC_FIDMD       CCI_REG8(0x3400)
 
 /* Test pattern generator */
-#define IMX678_REG_TPG_EN_DUOUT		CCI_REG8(0x30e0)
-#define IMX678_REG_TPG_PATSEL_DUOUT	CCI_REG8(0x30e2)
-#define IMX678_TPG_ALL_000		0
-#define IMX678_TPG_ALL_FFF		1
-#define IMX678_TPG_ALL_555		2
-#define IMX678_TPG_ALL_AAA		3
-#define IMX678_TPG_TOG_555_AAA		4
-#define IMX678_TPG_TOG_AAA_555		5
-#define IMX678_TPG_TOG_000_555		6
-#define IMX678_TPG_TOG_555_000		7
-#define IMX678_TPG_TOG_000_FFF		8
-#define IMX678_TPG_TOG_FFF_000		9
-#define IMX678_TPG_H_COLOR_BARS		10
-#define IMX678_TPG_V_COLOR_BARS		11
-#define IMX678_REG_TPG_COLORWIDTH	CCI_REG8(0x30e4)
-#define IMX678_TPG_COLORWIDTH_80PIX	0
-#define IMX678_TPG_COLORWIDTH_160PIX	1
-#define IMX678_TPG_COLORWIDTH_320PIX	2
-#define IMX678_TPG_COLORWIDTH_640PIX	3
-
-#define IMX678_REG_INTERFACE_SEL	CCI_REG8(0x4e3c)
-#define IMX678_INTERFACE_2L_4L		0x07
-#define IMX678_INTERFACE_8L_2x4L	0x7f
+#define STARVIS2_REG_TPG_EN_DUOUT		CCI_REG8(0x30e0)
+#define STARVIS2_REG_TPG_PATSEL_DUOUT	CCI_REG8(0x30e2)
+#define STARVIS2_TPG_ALL_000		0
+#define STARVIS2_TPG_ALL_FFF		1
+#define STARVIS2_TPG_ALL_555		2
+#define STARVIS2_TPG_ALL_AAA		3
+#define STARVIS2_TPG_TOG_555_AAA	4
+#define STARVIS2_TPG_TOG_AAA_555	5
+#define STARVIS2_TPG_TOG_000_555	6
+#define STARVIS2_TPG_TOG_555_000	7
+#define STARVIS2_TPG_TOG_000_FFF	8
+#define STARVIS2_TPG_TOG_FFF_000	9
+#define STARVIS2_TPG_H_COLOR_BARS	10
+#define STARVIS2_TPG_V_COLOR_BARS	11
+#define STARVIS2_REG_TPG_COLORWIDTH	CCI_REG8(0x30e4)
+#define STARVIS2_TPG_COLORWIDTH_80PIX	0
+#define STARVIS2_TPG_COLORWIDTH_160PIX	1
+#define STARVIS2_TPG_COLORWIDTH_320PIX	2
+#define STARVIS2_TPG_COLORWIDTH_640PIX	3
+
+#define STARVIS2_REG_INTERFACE_SEL	CCI_REG8(0x4e3c)
+#define STARVIS2_INTERFACE_2L_4L	0x07
+#define STARVIS2_INTERFACE_8L_2x4L	0x7f
 
 /* Minimum output resolution */
 #define IMX678_PIXEL_ARRAY_MIN_WIDTH	1040
@@ -146,7 +151,7 @@
 #define IMX678_CROP_VST_ALIGN		4
 
 /* Subdev pads */
-#define IMX678_SOURCE_PAD		0
+#define STARVIS2_SOURCE_PAD		0
 
 /* IMX678 native and active pixel array size. */
 static const struct v4l2_rect imx678_native_area = {
@@ -163,73 +168,73 @@ static const struct v4l2_rect imx678_active_area = {
 	.height = 2180,
 };
 
-enum imx678_type {
-	IMX678_COLOR = 0,
-	IMX678_MONOCHROME = 1,
+enum starvis2_type {
+	STARVIS2_COLOR = 0,
+	STARVIS2_MONOCHROME = 1,
 };
 
-struct imx678_model_info {
-	enum imx678_type type;
+struct starvis2_model_info {
+	enum starvis2_type type;
 	const u32 *codes;
 	unsigned int num_codes;
 };
 
-enum imx678_lanemode {
-	IMX678_LANEMODE_2L = 1,
-	IMX678_LANEMODE_4L = 3,
+enum starvis2_lanemode {
+	STARVIS2_LANEMODE_2L = 1,
+	STARVIS2_LANEMODE_4L = 3,
 };
 
 /* Link frequency setup (DDR: lane rate = 2 x link freq) */
 enum {
-	IMX678_LINK_FREQ_297MHZ,
-	IMX678_LINK_FREQ_360MHZ,
-	IMX678_LINK_FREQ_445MHZ,
-	IMX678_LINK_FREQ_594MHZ,
-	IMX678_LINK_FREQ_720MHZ,
-	IMX678_LINK_FREQ_891MHZ,
-	IMX678_LINK_FREQ_1039MHZ,
-	IMX678_LINK_FREQ_1188MHZ,
+	STARVIS2_LINK_FREQ_297MHZ,
+	STARVIS2_LINK_FREQ_360MHZ,
+	STARVIS2_LINK_FREQ_445MHZ,
+	STARVIS2_LINK_FREQ_594MHZ,
+	STARVIS2_LINK_FREQ_720MHZ,
+	STARVIS2_LINK_FREQ_891MHZ,
+	STARVIS2_LINK_FREQ_1039MHZ,
+	STARVIS2_LINK_FREQ_1188MHZ,
 };
 
 static const u8 link_freqs_reg_value[] = {
-	[IMX678_LINK_FREQ_297MHZ]  = 0x07,
-	[IMX678_LINK_FREQ_360MHZ]  = 0x06,
-	[IMX678_LINK_FREQ_445MHZ]  = 0x05,
-	[IMX678_LINK_FREQ_594MHZ]  = 0x04,
-	[IMX678_LINK_FREQ_720MHZ]  = 0x03,
-	[IMX678_LINK_FREQ_891MHZ]  = 0x02,
-	[IMX678_LINK_FREQ_1039MHZ] = 0x01,
-	[IMX678_LINK_FREQ_1188MHZ] = 0x00,
+	[STARVIS2_LINK_FREQ_297MHZ]  = 0x07,
+	[STARVIS2_LINK_FREQ_360MHZ]  = 0x06,
+	[STARVIS2_LINK_FREQ_445MHZ]  = 0x05,
+	[STARVIS2_LINK_FREQ_594MHZ]  = 0x04,
+	[STARVIS2_LINK_FREQ_720MHZ]  = 0x03,
+	[STARVIS2_LINK_FREQ_891MHZ]  = 0x02,
+	[STARVIS2_LINK_FREQ_1039MHZ] = 0x01,
+	[STARVIS2_LINK_FREQ_1188MHZ] = 0x00,
 };
 
 static const u64 link_freqs[] = {
-	[IMX678_LINK_FREQ_297MHZ]  = 297000000,
-	[IMX678_LINK_FREQ_360MHZ]  = 360000000,
-	[IMX678_LINK_FREQ_445MHZ]  = 445500000,
-	[IMX678_LINK_FREQ_594MHZ]  = 594000000,
-	[IMX678_LINK_FREQ_720MHZ]  = 720000000,
-	[IMX678_LINK_FREQ_891MHZ]  = 891000000,
-	[IMX678_LINK_FREQ_1039MHZ] = 1039500000,
-	[IMX678_LINK_FREQ_1188MHZ] = 1188000000,
+	[STARVIS2_LINK_FREQ_297MHZ]  = 297000000,
+	[STARVIS2_LINK_FREQ_360MHZ]  = 360000000,
+	[STARVIS2_LINK_FREQ_445MHZ]  = 445500000,
+	[STARVIS2_LINK_FREQ_594MHZ]  = 594000000,
+	[STARVIS2_LINK_FREQ_720MHZ]  = 720000000,
+	[STARVIS2_LINK_FREQ_891MHZ]  = 891000000,
+	[STARVIS2_LINK_FREQ_1039MHZ] = 1039500000,
+	[STARVIS2_LINK_FREQ_1188MHZ] = 1188000000,
 };
 
 static const u16 min_hmax_4lane[] = {
-	[IMX678_LINK_FREQ_297MHZ] = 1584,
-	[IMX678_LINK_FREQ_360MHZ] = 1320,
-	[IMX678_LINK_FREQ_445MHZ] = 1100,
-	[IMX678_LINK_FREQ_594MHZ] =  792,
-	[IMX678_LINK_FREQ_720MHZ] =  660,
-	[IMX678_LINK_FREQ_891MHZ] =  550,
-	[IMX678_LINK_FREQ_1039MHZ] = 550,
-	[IMX678_LINK_FREQ_1188MHZ] = 550,
+	[STARVIS2_LINK_FREQ_297MHZ] = 1584,
+	[STARVIS2_LINK_FREQ_360MHZ] = 1320,
+	[STARVIS2_LINK_FREQ_445MHZ] = 1100,
+	[STARVIS2_LINK_FREQ_594MHZ] =  792,
+	[STARVIS2_LINK_FREQ_720MHZ] =  660,
+	[STARVIS2_LINK_FREQ_891MHZ] =  550,
+	[STARVIS2_LINK_FREQ_1039MHZ] = 550,
+	[STARVIS2_LINK_FREQ_1188MHZ] = 550,
 };
 
-struct imx678_inck_cfg {
+struct starvis2_inck_cfg {
 	u32 xclk_hz;   /* platform clock rate  */
 	u8  inck_sel;  /* value for reg        */
 };
 
-static const struct imx678_inck_cfg imx678_inck_table[] = {
+static const struct starvis2_inck_cfg starvis2_inck_table[] = {
 	{ 74250000, 0x00 },
 	{ 37125000, 0x01 },
 	{ 72000000, 0x02 },
@@ -240,7 +245,7 @@ static const struct imx678_inck_cfg imx678_inck_table[] = {
 	{ 13500000, 0x07 },
 };
 
-static const char * const imx678_tpg_menu[] = {
+static const char * const starvis2_tpg_menu[] = {
 	"Disabled",
 	"All 000h",
 	"All FFFh",
@@ -256,28 +261,28 @@ static const char * const imx678_tpg_menu[] = {
 	"Vertical color bars",
 };
 
-static const int imx678_tpg_val[] = {
-	IMX678_TPG_ALL_000,
-	IMX678_TPG_ALL_000,
-	IMX678_TPG_ALL_FFF,
-	IMX678_TPG_ALL_555,
-	IMX678_TPG_ALL_AAA,
-	IMX678_TPG_TOG_555_AAA,
-	IMX678_TPG_TOG_AAA_555,
-	IMX678_TPG_TOG_000_555,
-	IMX678_TPG_TOG_555_000,
-	IMX678_TPG_TOG_000_FFF,
-	IMX678_TPG_TOG_FFF_000,
-	IMX678_TPG_H_COLOR_BARS,
-	IMX678_TPG_V_COLOR_BARS,
+static const int starvis2_tpg_val[] = {
+	STARVIS2_TPG_ALL_000,
+	STARVIS2_TPG_ALL_000,
+	STARVIS2_TPG_ALL_FFF,
+	STARVIS2_TPG_ALL_555,
+	STARVIS2_TPG_ALL_AAA,
+	STARVIS2_TPG_TOG_555_AAA,
+	STARVIS2_TPG_TOG_AAA_555,
+	STARVIS2_TPG_TOG_000_555,
+	STARVIS2_TPG_TOG_555_000,
+	STARVIS2_TPG_TOG_000_FFF,
+	STARVIS2_TPG_TOG_FFF_000,
+	STARVIS2_TPG_H_COLOR_BARS,
+	STARVIS2_TPG_V_COLOR_BARS,
 };
 
 /* Common configuration */
 static const struct cci_reg_sequence common_regs[] = {
-	{ IMX678_REG_THIN_V_EN, 0x00 },
-	{ IMX678_REG_VCMODE, 0x01 },
+	{ STARVIS2_REG_THIN_V_EN, 0x00 },
+	{ STARVIS2_REG_VCMODE, 0x01 },
 	{ CCI_REG8(0x306b), 0x00 },
-	{ IMX678_REG_GAIN_PGC_FIDMD, 0x01 },
+	{ STARVIS2_REG_GAIN_PGC_FIDMD, 0x01 },
 	{ CCI_REG8(0x3460), 0x22 },
 	{ CCI_REG8(0x355a), 0x64 },
 	{ CCI_REG8(0x3a02), 0x7a },
@@ -643,9 +648,9 @@ static const struct cci_reg_sequence common_regs[] = {
 	{ CCI_REG8(0x47c1), 0x01 },
 	{ CCI_REG8(0x47c2), 0x3e },
 	{ CCI_REG8(0x47c3), 0x01 },
-	{ IMX678_REG_WDMODE, 0x00 },
-	{ IMX678_REG_MDBIT, 0x01 },
-	{ IMX678_REG_XXS_DRV, 0x00 },
+	{ STARVIS2_REG_WDMODE, 0x00 },
+	{ STARVIS2_REG_MDBIT, 0x01 },
+	{ STARVIS2_REG_XXS_DRV, 0x00 },
 };
 
 static const u32 codes_bayer[] = {
@@ -656,30 +661,30 @@ static const u32 codes_monochrome[] = {
 	MEDIA_BUS_FMT_Y12_1X12,
 };
 
-static const struct imx678_model_info imx678_aaqr_info = {
-	.type = IMX678_COLOR,
+static const struct starvis2_model_info imx678_aaqr_info = {
+	.type = STARVIS2_COLOR,
 	.codes = codes_bayer,
 	.num_codes = ARRAY_SIZE(codes_bayer),
 };
 
-static const struct imx678_model_info imx678_aamr_info = {
-	.type = IMX678_MONOCHROME,
+static const struct starvis2_model_info imx678_aamr_info = {
+	.type = STARVIS2_MONOCHROME,
 	.codes = codes_monochrome,
 	.num_codes = ARRAY_SIZE(codes_monochrome),
 };
 
-static const char * const imx678_supply_name[] = {
+static const char * const starvis2_supply_name[] = {
 	"avdd",  /* Analog (3.3V) supply */
 	"dvdd",  /* Digital Core (1.1V) supply */
 	"ovdd",  /* IF (1.8V) supply */
 };
 
-struct imx678 {
+struct starvis2 {
 	struct v4l2_subdev sd;
 	struct media_pad pad;
 	struct regmap *cci;
 
-	const struct imx678_model_info *info;
+	const struct starvis2_model_info *info;
 
 	struct clk *xclk;
 	u32 xclk_freq;
@@ -688,11 +693,12 @@ struct imx678 {
 	u8 inck_sel_val;
 
 	/* Link configurations */
-	enum imx678_lanemode lane_mode;
+	enum starvis2_lanemode lane_mode;
 	unsigned long link_freq_bitmap;
 
 	struct gpio_desc *reset_gpio;
-	struct regulator_bulk_data supplies[ARRAY_SIZE(imx678_supply_name)];
+	struct regulator_bulk_data supplies[ARRAY_SIZE(starvis2_supply_name)];
+	bool common_regs_written;
 
 	struct v4l2_ctrl_handler ctrl_handler;
 
@@ -705,49 +711,49 @@ struct imx678 {
 	u32 vmax;
 };
 
-static inline struct imx678 *to_imx678(struct v4l2_subdev *_sd)
+static inline struct starvis2 *to_starvis2(struct v4l2_subdev *_sd)
 {
-	return container_of_const(_sd, struct imx678, sd);
+	return container_of_const(_sd, struct starvis2, sd);
 }
 
-static u32 imx678_default_mbus_code(struct imx678 *imx678)
+static u32 starvis2_default_mbus_code(struct starvis2 *starvis2)
 {
-	return imx678->info->codes[0];
+	return starvis2->info->codes[0];
 }
 
-static bool imx678_mbus_code_supported(struct imx678 *imx678, u32 code)
+static bool starvis2_mbus_code_supported(struct starvis2 *starvis2, u32 code)
 {
-	for (unsigned int i = 0; i < imx678->info->num_codes; i++) {
-		if (imx678->info->codes[i] == code)
+	for (unsigned int i = 0; i < starvis2->info->num_codes; i++) {
+		if (starvis2->info->codes[i] == code)
 			return true;
 	}
 
 	return false;
 }
 
-static int imx678_set_ctrl(struct v4l2_ctrl *ctrl)
+static int starvis2_set_ctrl(struct v4l2_ctrl *ctrl)
 {
-	struct imx678 *imx678 = container_of_const(ctrl->handler, struct
-						   imx678, ctrl_handler);
-	struct i2c_client *client = v4l2_get_subdevdata(&imx678->sd);
+	struct starvis2 *starvis2 = container_of_const(ctrl->handler, struct
+						       starvis2, ctrl_handler);
+	struct i2c_client *client = v4l2_get_subdevdata(&starvis2->sd);
 	const struct v4l2_mbus_framefmt *format;
 	struct v4l2_subdev_state *state;
 	int ret = 0;
 
-	state = v4l2_subdev_get_locked_active_state(&imx678->sd);
-	format = v4l2_subdev_state_get_format(state, IMX678_SOURCE_PAD);
+	state = v4l2_subdev_get_locked_active_state(&starvis2->sd);
+	format = v4l2_subdev_state_get_format(state, STARVIS2_SOURCE_PAD);
 
 	if (ctrl->id == V4L2_CID_VBLANK) {
-		u32 current_exposure = imx678->exposure->cur.val;
+		u32 current_exposure = starvis2->exposure->cur.val;
 
-		imx678->vmax = format->height + ctrl->val;
+		starvis2->vmax = format->height + ctrl->val;
 
 		current_exposure = clamp_t(u32, current_exposure,
-					   IMX678_EXPOSURE_MIN,
-					   imx678->vmax - IMX678_SHR_MIN);
-		ret = __v4l2_ctrl_modify_range(imx678->exposure,
-					       IMX678_EXPOSURE_MIN,
-					       imx678->vmax - IMX678_SHR_MIN,
+					   STARVIS2_EXPOSURE_MIN,
+					   starvis2->vmax - STARVIS2_SHR_MIN);
+		ret = __v4l2_ctrl_modify_range(starvis2->exposure,
+					       STARVIS2_EXPOSURE_MIN,
+					       starvis2->vmax - STARVIS2_SHR_MIN,
 					       1, current_exposure);
 		if (ret)
 			return ret;
@@ -762,38 +768,41 @@ static int imx678_set_ctrl(struct v4l2_ctrl *ctrl)
 
 	switch (ctrl->id) {
 	case V4L2_CID_VBLANK:
-		cci_write(imx678->cci, IMX678_REG_VMAX, imx678->vmax, &ret);
+		cci_write(starvis2->cci, STARVIS2_REG_VMAX, starvis2->vmax,
+			  &ret);
 		fallthrough; /* SHR = VMAX - exposure, so update it */
 	case V4L2_CID_EXPOSURE: {
-		u32 shr = imx678->vmax - imx678->exposure->val;
+		u32 shr = starvis2->vmax - starvis2->exposure->val;
 
-		cci_write(imx678->cci, IMX678_REG_SHR, shr, &ret);
+		cci_write(starvis2->cci, STARVIS2_REG_SHR, shr, &ret);
 		break;
 	}
 	case V4L2_CID_ANALOGUE_GAIN:
-		cci_write(imx678->cci, IMX678_REG_GAIN, ctrl->val, &ret);
+		cci_write(starvis2->cci, STARVIS2_REG_GAIN, ctrl->val, &ret);
 		break;
 	case V4L2_CID_HBLANK: {
 		u32 hmax = (format->width + ctrl->val) / IMX678_PIX_PER_CLK;
 
-		cci_write(imx678->cci, IMX678_REG_HMAX, hmax, &ret);
+		cci_write(starvis2->cci, STARVIS2_REG_HMAX, hmax, &ret);
 		break;
 	}
 	case V4L2_CID_TEST_PATTERN: {
-		cci_write(imx678->cci, IMX678_REG_TPG_COLORWIDTH,
-			  IMX678_TPG_COLORWIDTH_160PIX, &ret);
-		cci_write(imx678->cci, IMX678_REG_TPG_PATSEL_DUOUT,
-			  imx678_tpg_val[ctrl->val], &ret);
-		cci_write(imx678->cci, IMX678_REG_TPG_EN_DUOUT,
+		cci_write(starvis2->cci, STARVIS2_REG_TPG_COLORWIDTH,
+			  STARVIS2_TPG_COLORWIDTH_160PIX, &ret);
+		cci_write(starvis2->cci, STARVIS2_REG_TPG_PATSEL_DUOUT,
+			  starvis2_tpg_val[ctrl->val], &ret);
+		cci_write(starvis2->cci, STARVIS2_REG_TPG_EN_DUOUT,
 			  (ctrl->val) ? 1 : 0,
 			  &ret);
 		break;
 	}
 	case V4L2_CID_HFLIP:
-		cci_write(imx678->cci, IMX678_REG_WINMODEH, ctrl->val, &ret);
+		cci_write(starvis2->cci, STARVIS2_REG_WINMODEH, ctrl->val,
+			  &ret);
 		break;
 	case V4L2_CID_VFLIP:
-		cci_write(imx678->cci, IMX678_REG_WINMODEV, ctrl->val, &ret);
+		cci_write(starvis2->cci, STARVIS2_REG_WINMODEV, ctrl->val,
+			  &ret);
 		break;
 	default:
 		dev_warn(&client->dev,
@@ -807,35 +816,35 @@ static int imx678_set_ctrl(struct v4l2_ctrl *ctrl)
 	return ret;
 }
 
-static const struct v4l2_ctrl_ops imx678_ctrl_ops = {
-	.s_ctrl = imx678_set_ctrl,
+static const struct v4l2_ctrl_ops starvis2_ctrl_ops = {
+	.s_ctrl = starvis2_set_ctrl,
 };
 
-static int imx678_enum_mbus_code(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_state *sd_state,
-				 struct v4l2_subdev_mbus_code_enum *code)
+static int starvis2_enum_mbus_code(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *sd_state,
+				   struct v4l2_subdev_mbus_code_enum *code)
 {
-	struct imx678 *imx678 = to_imx678(sd);
+	struct starvis2 *starvis2 = to_starvis2(sd);
 
-	if (code->index >= imx678->info->num_codes)
+	if (code->index >= starvis2->info->num_codes)
 		return -EINVAL;
 
-	code->code = imx678->info->codes[code->index];
+	code->code = starvis2->info->codes[code->index];
 
 	return 0;
 }
 
-static int imx678_enum_frame_size(struct v4l2_subdev *sd,
-				  struct v4l2_subdev_state *sd_state,
-				  struct v4l2_subdev_frame_size_enum *fse)
+static int starvis2_enum_frame_size(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_state *sd_state,
+				    struct v4l2_subdev_frame_size_enum *fse)
 {
-	struct imx678 *imx678 = to_imx678(sd);
+	struct starvis2 *starvis2 = to_starvis2(sd);
 	const struct v4l2_rect *crop;
 
 	if (fse->index)
 		return -EINVAL;
 
-	if (!imx678_mbus_code_supported(imx678, fse->code))
+	if (!starvis2_mbus_code_supported(starvis2, fse->code))
 		return -EINVAL;
 
 	crop = v4l2_subdev_state_get_crop(sd_state, fse->pad);
@@ -848,10 +857,10 @@ static int imx678_enum_frame_size(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int imx678_get_selection(struct v4l2_subdev *sd,
-				const struct v4l2_subdev_client_info *ci,
-				struct v4l2_subdev_state *sd_state,
-				struct v4l2_subdev_selection *sel)
+static int starvis2_get_selection(struct v4l2_subdev *sd,
+				  const struct v4l2_subdev_client_info *ci,
+				  struct v4l2_subdev_state *sd_state,
+				  struct v4l2_subdev_selection *sel)
 {
 	switch (sel->target) {
 	case V4L2_SEL_TGT_CROP:
@@ -871,18 +880,18 @@ static int imx678_get_selection(struct v4l2_subdev *sd,
 	return -EINVAL;
 }
 
-static int imx678_init_state(struct v4l2_subdev *sd,
-			     struct v4l2_subdev_state *state)
+static int starvis2_init_state(struct v4l2_subdev *sd,
+			       struct v4l2_subdev_state *state)
 {
-	struct imx678 *imx678 = to_imx678(sd);
+	struct starvis2 *starvis2 = to_starvis2(sd);
 	struct v4l2_mbus_framefmt *format;
 	struct v4l2_rect *crop;
 
-	crop = v4l2_subdev_state_get_crop(state, IMX678_SOURCE_PAD);
+	crop = v4l2_subdev_state_get_crop(state, STARVIS2_SOURCE_PAD);
 	*crop = imx678_active_area;
 
-	format = v4l2_subdev_state_get_format(state, IMX678_SOURCE_PAD);
-	format->code = imx678_default_mbus_code(imx678);
+	format = v4l2_subdev_state_get_format(state, STARVIS2_SOURCE_PAD);
+	format->code = starvis2_default_mbus_code(starvis2);
 	format->width = imx678_active_area.width;
 	format->height = imx678_active_area.height;
 	format->field = V4L2_FIELD_NONE;
@@ -894,50 +903,55 @@ static int imx678_init_state(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int imx678_write_common(struct imx678 *imx678)
+static int starvis2_write_common(struct starvis2 *starvis2)
 {
 	int ret = 0;
 
-	cci_multi_reg_write(imx678->cci, common_regs, ARRAY_SIZE(common_regs),
+	cci_multi_reg_write(starvis2->cci, common_regs, ARRAY_SIZE(common_regs),
 			    &ret);
 
-	cci_write(imx678->cci, IMX678_REG_INCK_SEL, imx678->inck_sel_val, &ret);
-	cci_write(imx678->cci, IMX678_REG_DATARATE_SEL,
-		  link_freqs_reg_value[__ffs(imx678->link_freq_bitmap)], &ret);
-	cci_write(imx678->cci, IMX678_REG_LANEMODE, imx678->lane_mode, &ret);
-
-	cci_write(imx678->cci, IMX678_REG_INTERFACE_SEL, IMX678_INTERFACE_2L_4L,
+	cci_write(starvis2->cci, STARVIS2_REG_INCK_SEL, starvis2->inck_sel_val,
+		  &ret);
+	cci_write(starvis2->cci, STARVIS2_REG_DATARATE_SEL,
+		  link_freqs_reg_value[__ffs(starvis2->link_freq_bitmap)],
+		  &ret);
+	cci_write(starvis2->cci, STARVIS2_REG_LANEMODE, starvis2->lane_mode,
 		  &ret);
 
+	cci_write(starvis2->cci, STARVIS2_REG_INTERFACE_SEL,
+		  STARVIS2_INTERFACE_2L_4L, &ret);
+
+	starvis2->common_regs_written = true;
+
 	return ret;
 }
 
-static int imx678_program_window(struct imx678 *imx678,
-				 const struct v4l2_rect *crop)
+static int starvis2_program_window(struct starvis2 *starvis2,
+				   const struct v4l2_rect *crop)
 {
 	int ret = 0;
 
-	cci_write(imx678->cci, IMX678_REG_ADDMODE, 0x00, &ret);
-	cci_write(imx678->cci, IMX678_REG_WINMODE,
+	cci_write(starvis2->cci, STARVIS2_REG_ADDMODE, 0x00, &ret);
+	cci_write(starvis2->cci, STARVIS2_REG_WINMODE,
 		  v4l2_rect_equal(crop, &imx678_active_area) ? 0x00 : 0x04,
 		  &ret);
-	cci_write(imx678->cci, IMX678_REG_PIX_HST,
+	cci_write(starvis2->cci, STARVIS2_REG_PIX_HST,
 		  crop->left - imx678_active_area.left, &ret);
-	cci_write(imx678->cci, IMX678_REG_PIX_HWIDTH, crop->width, &ret);
-	cci_write(imx678->cci, IMX678_REG_PIX_VST,
+	cci_write(starvis2->cci, STARVIS2_REG_PIX_HWIDTH, crop->width, &ret);
+	cci_write(starvis2->cci, STARVIS2_REG_PIX_VST,
 		  crop->top - imx678_active_area.top, &ret);
-	cci_write(imx678->cci, IMX678_REG_PIX_VWIDTH, crop->height, &ret);
-	cci_write(imx678->cci, IMX678_REG_ADBIT, 0x01, &ret);
+	cci_write(starvis2->cci, STARVIS2_REG_PIX_VWIDTH, crop->height, &ret);
+	cci_write(starvis2->cci, STARVIS2_REG_ADBIT, 0x01, &ret);
 
 	return ret;
 }
 
-static int imx678_enable_streams(struct v4l2_subdev *sd,
-				 struct v4l2_subdev_state *state, u32 pad,
-				 u64 mask)
+static int starvis2_enable_streams(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *state, u32 pad,
+				   u64 mask)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	struct imx678 *imx678 = to_imx678(sd);
+	struct starvis2 *starvis2 = to_starvis2(sd);
 	const struct v4l2_rect *crop;
 	int ret;
 
@@ -945,25 +959,34 @@ static int imx678_enable_streams(struct v4l2_subdev *sd,
 	if (ret < 0)
 		return ret;
 
+	if (!starvis2->common_regs_written) {
+		ret = starvis2_write_common(starvis2);
+		if (ret) {
+			dev_err(&client->dev, "%s failed to write common registers\n",
+				__func__);
+			goto err_rpm_put;
+		}
+	}
+
 	crop = v4l2_subdev_state_get_crop(state, pad);
-	ret = imx678_program_window(imx678, crop);
+	ret = starvis2_program_window(starvis2, crop);
 	if (ret) {
 		dev_err(&client->dev, "%s failed to set mode\n", __func__);
 		goto err_rpm_put;
 	}
 
-	ret = __v4l2_ctrl_handler_setup(imx678->sd.ctrl_handler);
+	ret = __v4l2_ctrl_handler_setup(starvis2->sd.ctrl_handler);
 	if (ret) {
 		dev_err(&client->dev, "%s failed to apply user values\n",
 			__func__);
 		goto err_rpm_put;
 	}
 
-	cci_write(imx678->cci, IMX678_REG_MODE_SELECT, IMX678_MODE_STREAMING,
-		  &ret);
-	usleep_range(IMX678_STREAM_DELAY_US, IMX678_STREAM_DELAY_US +
-		     IMX678_STREAM_DELAY_RANGE_US);
-	cci_write(imx678->cci, IMX678_REG_XMSTA, 0x00, &ret);
+	cci_write(starvis2->cci, STARVIS2_REG_MODE_SELECT,
+		  STARVIS2_MODE_STREAMING, &ret);
+	usleep_range(STARVIS2_STREAM_DELAY_US, STARVIS2_STREAM_DELAY_US +
+		     STARVIS2_STREAM_DELAY_RANGE_US);
+	cci_write(starvis2->cci, STARVIS2_REG_XMSTA, 0x00, &ret);
 
 	if (ret) {
 		dev_err(&client->dev, "%s failed to start streaming\n",
@@ -979,19 +1002,19 @@ static int imx678_enable_streams(struct v4l2_subdev *sd,
 	return ret;
 }
 
-static int imx678_disable_streams(struct v4l2_subdev *sd,
-				  struct v4l2_subdev_state *state,
-				  u32 pad, u64 mask)
+static int starvis2_disable_streams(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_state *state,
+				    u32 pad, u64 mask)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	struct imx678 *imx678 = to_imx678(sd);
+	struct starvis2 *starvis2 = to_starvis2(sd);
 	int ret = 0;
 
 	/* Master mode disable */
-	cci_write(imx678->cci, IMX678_REG_XMSTA, 0x01, &ret);
+	cci_write(starvis2->cci, STARVIS2_REG_XMSTA, 0x01, &ret);
 	/* Standby */
-	cci_write(imx678->cci, IMX678_REG_MODE_SELECT, IMX678_MODE_STANDBY,
-		  &ret);
+	cci_write(starvis2->cci, STARVIS2_REG_MODE_SELECT,
+		  STARVIS2_MODE_STANDBY, &ret);
 	if (ret)
 		dev_err(&client->dev, "%s failed to stop stream\n", __func__);
 
@@ -1000,15 +1023,15 @@ static int imx678_disable_streams(struct v4l2_subdev *sd,
 	return ret;
 }
 
-static int imx678_power_on(struct device *dev)
+static int starvis2_power_on(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
-	struct imx678 *imx678 = to_imx678(sd);
+	struct starvis2 *starvis2 = to_starvis2(sd);
 	int ret;
 
-	ret = regulator_bulk_enable(ARRAY_SIZE(imx678_supply_name),
-				    imx678->supplies);
+	ret = regulator_bulk_enable(ARRAY_SIZE(starvis2_supply_name),
+				    starvis2->supplies);
 	if (ret) {
 		dev_err(&client->dev, "%s: failed to enable regulators\n",
 			__func__);
@@ -1017,11 +1040,11 @@ static int imx678_power_on(struct device *dev)
 
 	fsleep(1); /* Tlow > 500ns */
 
-	gpiod_set_value_cansleep(imx678->reset_gpio, 0);
+	gpiod_set_value_cansleep(starvis2->reset_gpio, 0);
 
 	fsleep(1); /* T3 > 1us */
 
-	ret = clk_prepare_enable(imx678->xclk);
+	ret = clk_prepare_enable(starvis2->xclk);
 	if (ret) {
 		dev_err(&client->dev, "%s: failed to enable clock\n",
 			__func__);
@@ -1030,7 +1053,7 @@ static int imx678_power_on(struct device *dev)
 
 	fsleep(20); /* T4 > 20us */
 
-	ret = imx678_write_common(imx678);
+	ret = starvis2_write_common(starvis2);
 	if (ret) {
 		dev_err(&client->dev, "%s failed to write registers\n",
 			__func__);
@@ -1040,35 +1063,37 @@ static int imx678_power_on(struct device *dev)
 	return 0;
 
 clk_off:
-	clk_disable_unprepare(imx678->xclk);
+	clk_disable_unprepare(starvis2->xclk);
 
 reg_off:
-	gpiod_set_value_cansleep(imx678->reset_gpio, 1);
-	regulator_bulk_disable(ARRAY_SIZE(imx678_supply_name),
-			       imx678->supplies);
+	gpiod_set_value_cansleep(starvis2->reset_gpio, 1);
+	regulator_bulk_disable(ARRAY_SIZE(starvis2_supply_name),
+			       starvis2->supplies);
 
 	return ret;
 }
 
-static int imx678_power_off(struct device *dev)
+static int starvis2_power_off(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
-	struct imx678 *imx678 = to_imx678(sd);
+	struct starvis2 *starvis2 = to_starvis2(sd);
+
+	clk_disable_unprepare(starvis2->xclk);
+	gpiod_set_value_cansleep(starvis2->reset_gpio, 1);
+	regulator_bulk_disable(ARRAY_SIZE(starvis2_supply_name),
+			       starvis2->supplies);
 
-	clk_disable_unprepare(imx678->xclk);
-	gpiod_set_value_cansleep(imx678->reset_gpio, 1);
-	regulator_bulk_disable(ARRAY_SIZE(imx678_supply_name),
-			       imx678->supplies);
+	starvis2->common_regs_written = false;
 
 	return 0;
 }
 
-static int imx678_identify_model(struct imx678 *imx678)
+static int starvis2_identify_model(struct starvis2 *starvis2)
 {
-	struct i2c_client *client = v4l2_get_subdevdata(&imx678->sd);
-	const struct imx678_model_info *info;
-	enum imx678_type detected;
+	struct i2c_client *client = v4l2_get_subdevdata(&starvis2->sd);
+	const struct starvis2_model_info *info;
+	enum starvis2_type detected;
 	int ret = 0;
 	u64 val = 0;
 
@@ -1078,10 +1103,10 @@ static int imx678_identify_model(struct imx678 *imx678)
 	 * This sensor's ID registers become accessible 80ms after coming out
 	 * of STANDBY mode.
 	 */
-	cci_write(imx678->cci, IMX678_REG_MODE_SELECT, 0, &ret);
-	fsleep(IMX678_MODULE_ID_DELAY);
+	cci_write(starvis2->cci, STARVIS2_REG_MODE_SELECT, 0, &ret);
+	fsleep(STARVIS2_MODULE_ID_DELAY);
 
-	cci_read(imx678->cci, IMX678_REG_MODULE_ID, &val, &ret);
+	cci_read(starvis2->cci, IMX678_REG_MODULE_ID, &val, &ret);
 
 	if (ret) {
 		dev_err(&client->dev,
@@ -1095,7 +1120,7 @@ static int imx678_identify_model(struct imx678 *imx678)
 		return -ENXIO;
 	}
 
-	cci_read(imx678->cci, IMX678_REG_MONOCHROME, &val, &ret);
+	cci_read(starvis2->cci, STARVIS2_REG_MONOCHROME, &val, &ret);
 
 	if (ret) {
 		dev_err(&client->dev,
@@ -1103,55 +1128,57 @@ static int imx678_identify_model(struct imx678 *imx678)
 		return ret;
 	}
 
-	detected = val & IMX678_TYPE;
+	detected = val & STARVIS2_TYPE;
 
 	/* Prefer to use sensor type specified in device tree */
 	if (info) {
-		imx678->info = info;
+		starvis2->info = info;
 		if (detected != info->type)
 			dev_err(&client->dev,
 				"detected %s sensor, DT specifies %s; using DT value\n",
-				detected == IMX678_COLOR ? "color" : "mono",
-				info->type == IMX678_COLOR ? "color" : "mono");
+				detected == STARVIS2_COLOR ? "color" : "mono",
+				info->type == STARVIS2_COLOR ? "color" : "mono");
 	} else {
-		imx678->info = detected == IMX678_MONOCHROME ?
+		starvis2->info = detected == STARVIS2_MONOCHROME ?
 			       &imx678_aamr_info : &imx678_aaqr_info;
 		dev_info(&client->dev,
 			 "sensor type missing in DT; detected %s sensor\n",
-			 detected == IMX678_MONOCHROME ? "mono" : "color");
+			 detected == STARVIS2_MONOCHROME ? "mono" : "color");
 	}
 
 	return 0;
 }
 
-static const struct v4l2_subdev_video_ops imx678_video_ops = {
+static const struct v4l2_subdev_video_ops starvis2_video_ops = {
 	.s_stream = v4l2_subdev_s_stream_helper,
 };
 
-static const struct v4l2_subdev_pad_ops imx678_pad_ops = {
-	.enum_mbus_code = imx678_enum_mbus_code,
+static const struct v4l2_subdev_pad_ops starvis2_pad_ops = {
+	.enum_mbus_code = starvis2_enum_mbus_code,
 	.get_fmt = v4l2_subdev_get_fmt,
-	.get_selection = imx678_get_selection,
-	.enum_frame_size = imx678_enum_frame_size,
-	.enable_streams = imx678_enable_streams,
-	.disable_streams = imx678_disable_streams,
+	.get_selection = starvis2_get_selection,
+	.enum_frame_size = starvis2_enum_frame_size,
+	.enable_streams = starvis2_enable_streams,
+	.disable_streams = starvis2_disable_streams,
 };
 
-static const struct v4l2_subdev_ops imx678_subdev_ops = {
-	.video = &imx678_video_ops,
-	.pad = &imx678_pad_ops,
+static const struct v4l2_subdev_ops starvis2_subdev_ops = {
+	.video = &starvis2_video_ops,
+	.pad = &starvis2_pad_ops,
 };
 
-static const struct v4l2_subdev_internal_ops imx678_internal_ops = {
-	.init_state = imx678_init_state,
+static const struct v4l2_subdev_internal_ops starvis2_internal_ops = {
+	.init_state = starvis2_init_state,
 };
 
-static int imx678_init_controls(struct imx678 *imx678)
+static int starvis2_init_controls(struct starvis2 *starvis2)
 {
 	struct v4l2_ctrl_handler *ctrl_hdlr;
-	const u32 hmax_4lane = min_hmax_4lane[__ffs(imx678->link_freq_bitmap)];
-	const u32 lane_scale = imx678->lane_mode == IMX678_LANEMODE_2L ? 2 : 1;
-	struct i2c_client *client = v4l2_get_subdevdata(&imx678->sd);
+	const u32 hmax_4lane =
+			min_hmax_4lane[__ffs(starvis2->link_freq_bitmap)];
+	const u32 lane_scale =
+			starvis2->lane_mode == STARVIS2_LANEMODE_2L ? 2 : 1;
+	struct i2c_client *client = v4l2_get_subdevdata(&starvis2->sd);
 	struct v4l2_fwnode_device_properties props;
 	struct v4l2_ctrl *link_freq;
 	s32 hblank, max_hblank, vblank, max_vblank;
@@ -1162,66 +1189,66 @@ static int imx678_init_controls(struct imx678 *imx678)
 	if (ret < 0)
 		return ret;
 
-	ctrl_hdlr = &imx678->ctrl_handler;
+	ctrl_hdlr = &starvis2->ctrl_handler;
 	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 11);
 	if (ret)
 		return ret;
 
-	imx678->vmax = IMX678_VMAX_DEFAULT;
+	starvis2->vmax = IMX678_VMAX_DEFAULT;
 	hmax = hmax_4lane * lane_scale;
 
 	/* PIXEL_RATE is fixed and read-only */
-	v4l2_ctrl_new_std(ctrl_hdlr, &imx678_ctrl_ops, V4L2_CID_PIXEL_RATE,
+	v4l2_ctrl_new_std(ctrl_hdlr, &starvis2_ctrl_ops, V4L2_CID_PIXEL_RATE,
 			  IMX678_PIXEL_RATE, IMX678_PIXEL_RATE, 1,
 			  IMX678_PIXEL_RATE);
 
 	/* LINK_FREQ is also read only */
-	link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, &imx678_ctrl_ops,
+	link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, &starvis2_ctrl_ops,
 					   V4L2_CID_LINK_FREQ,
 					   ARRAY_SIZE(link_freqs) - 1,
-					   __ffs(imx678->link_freq_bitmap),
+					   __ffs(starvis2->link_freq_bitmap),
 					   link_freqs);
 
 	if (link_freq)
 		link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
-	vblank = imx678->vmax - imx678_active_area.height;
-	max_vblank = IMX678_VMAX_MAX - imx678_active_area.height;
-	imx678->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx678_ctrl_ops,
-					   V4L2_CID_VBLANK, vblank, max_vblank,
-					   2, vblank);
+	vblank = starvis2->vmax - imx678_active_area.height;
+	max_vblank = STARVIS2_VMAX_MAX - imx678_active_area.height;
+	starvis2->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &starvis2_ctrl_ops,
+					     V4L2_CID_VBLANK, vblank, max_vblank,
+					     2, vblank);
 
 	hblank = hmax * IMX678_PIX_PER_CLK - imx678_active_area.width;
-	max_hblank = IMX678_HMAX_MAX * IMX678_PIX_PER_CLK -
+	max_hblank = STARVIS2_HMAX_MAX * IMX678_PIX_PER_CLK -
 		     imx678_active_area.width;
-	imx678->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx678_ctrl_ops,
-					   V4L2_CID_HBLANK, hblank, max_hblank,
-					   IMX678_PIX_PER_CLK, hblank);
-
-	imx678->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &imx678_ctrl_ops,
-					     V4L2_CID_EXPOSURE,
-					     IMX678_EXPOSURE_MIN,
-					     IMX678_VMAX_DEFAULT -
-					     IMX678_SHR_MIN,
-					     IMX678_EXPOSURE_STEP,
-					     IMX678_EXPOSURE_DEFAULT);
-
-	v4l2_ctrl_new_std(ctrl_hdlr, &imx678_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
-			  IMX678_ANA_GAIN_MIN_NORMAL,
-			  IMX678_ANA_GAIN_MAX_NORMAL, IMX678_ANA_GAIN_STEP,
-			  IMX678_ANA_GAIN_DEFAULT);
-
-	v4l2_ctrl_new_std(ctrl_hdlr, &imx678_ctrl_ops, V4L2_CID_HFLIP,
+	starvis2->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &starvis2_ctrl_ops,
+					     V4L2_CID_HBLANK, hblank, max_hblank,
+					     IMX678_PIX_PER_CLK, hblank);
+
+	starvis2->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &starvis2_ctrl_ops,
+					       V4L2_CID_EXPOSURE,
+					       STARVIS2_EXPOSURE_MIN,
+					       IMX678_VMAX_DEFAULT -
+					       STARVIS2_SHR_MIN,
+					       STARVIS2_EXPOSURE_STEP,
+					       STARVIS2_EXPOSURE_DEFAULT);
+
+	v4l2_ctrl_new_std(ctrl_hdlr, &starvis2_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
+			  STARVIS2_ANA_GAIN_MIN_NORMAL,
+			  STARVIS2_ANA_GAIN_MAX_NORMAL, STARVIS2_ANA_GAIN_STEP,
+			  STARVIS2_ANA_GAIN_DEFAULT);
+
+	v4l2_ctrl_new_std(ctrl_hdlr, &starvis2_ctrl_ops, V4L2_CID_HFLIP,
 			  0, 1, 1, 0);
-	v4l2_ctrl_new_std(ctrl_hdlr, &imx678_ctrl_ops, V4L2_CID_VFLIP,
+	v4l2_ctrl_new_std(ctrl_hdlr, &starvis2_ctrl_ops, V4L2_CID_VFLIP,
 			  0, 1, 1, 0);
 
-	v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &imx678_ctrl_ops,
+	v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &starvis2_ctrl_ops,
 				     V4L2_CID_TEST_PATTERN,
-				     ARRAY_SIZE(imx678_tpg_menu) - 1, 0, 0,
-				     imx678_tpg_menu);
+				     ARRAY_SIZE(starvis2_tpg_menu) - 1, 0, 0,
+				     starvis2_tpg_menu);
 
-	v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &imx678_ctrl_ops, &props);
+	v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &starvis2_ctrl_ops, &props);
 
 	if (ctrl_hdlr->error) {
 		ret = ctrl_hdlr->error;
@@ -1231,12 +1258,12 @@ static int imx678_init_controls(struct imx678 *imx678)
 		return ret;
 	}
 
-	imx678->sd.ctrl_handler = ctrl_hdlr;
+	starvis2->sd.ctrl_handler = ctrl_hdlr;
 
 	return 0;
 }
 
-static int imx678_check_hwcfg(struct device *dev, struct imx678 *imx678)
+static int starvis2_check_hwcfg(struct device *dev, struct starvis2 *starvis2)
 {
 	struct fwnode_handle *endpoint;
 	struct v4l2_fwnode_endpoint ep_cfg = {
@@ -1257,10 +1284,10 @@ static int imx678_check_hwcfg(struct device *dev, struct imx678 *imx678)
 
 	switch (ep_cfg.bus.mipi_csi2.num_data_lanes) {
 	case 2:
-		imx678->lane_mode = IMX678_LANEMODE_2L;
+		starvis2->lane_mode = STARVIS2_LANEMODE_2L;
 		break;
 	case 4:
-		imx678->lane_mode = IMX678_LANEMODE_4L;
+		starvis2->lane_mode = STARVIS2_LANEMODE_4L;
 		break;
 	default:
 		dev_err(dev,
@@ -1271,7 +1298,7 @@ static int imx678_check_hwcfg(struct device *dev, struct imx678 *imx678)
 	ret = v4l2_link_freq_to_bitmap(dev, ep_cfg.link_frequencies,
 				       ep_cfg.nr_of_link_frequencies,
 				       link_freqs, ARRAY_SIZE(link_freqs),
-				       &imx678->link_freq_bitmap);
+				       &starvis2->link_freq_bitmap);
 
 error_out:
 	v4l2_fwnode_endpoint_free(&ep_cfg);
@@ -1280,95 +1307,95 @@ static int imx678_check_hwcfg(struct device *dev, struct imx678 *imx678)
 	return ret;
 }
 
-static int imx678_probe(struct i2c_client *client)
+static int starvis2_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
-	struct imx678 *imx678;
+	struct starvis2 *starvis2;
 	int ret, i;
 
-	imx678 = devm_kzalloc(&client->dev, sizeof(*imx678), GFP_KERNEL);
-	if (!imx678)
+	starvis2 = devm_kzalloc(&client->dev, sizeof(*starvis2), GFP_KERNEL);
+	if (!starvis2)
 		return -ENOMEM;
 
-	v4l2_i2c_subdev_init(&imx678->sd, client, &imx678_subdev_ops);
+	v4l2_i2c_subdev_init(&starvis2->sd, client, &starvis2_subdev_ops);
 
-	imx678->cci = devm_cci_regmap_init_i2c(client, 16);
-	if (IS_ERR(imx678->cci))
-		return dev_err_probe(dev, PTR_ERR(imx678->cci),
+	starvis2->cci = devm_cci_regmap_init_i2c(client, 16);
+	if (IS_ERR(starvis2->cci))
+		return dev_err_probe(dev, PTR_ERR(starvis2->cci),
 				     "failed to init CCI\n");
 
-	if (imx678_check_hwcfg(dev, imx678))
+	if (starvis2_check_hwcfg(dev, starvis2))
 		return -EINVAL;
 
-	imx678->xclk = devm_v4l2_sensor_clk_get(dev, NULL);
-	if (IS_ERR(imx678->xclk))
-		return dev_err_probe(dev, PTR_ERR(imx678->xclk),
+	starvis2->xclk = devm_v4l2_sensor_clk_get(dev, NULL);
+	if (IS_ERR(starvis2->xclk))
+		return dev_err_probe(dev, PTR_ERR(starvis2->xclk),
 				     "failed to get xclk\n");
 
-	imx678->xclk_freq = clk_get_rate(imx678->xclk);
+	starvis2->xclk_freq = clk_get_rate(starvis2->xclk);
 
-	for (i = 0; i < ARRAY_SIZE(imx678_inck_table); ++i) {
-		if (imx678_inck_table[i].xclk_hz == imx678->xclk_freq) {
-			imx678->inck_sel_val = imx678_inck_table[i].inck_sel;
+	for (i = 0; i < ARRAY_SIZE(starvis2_inck_table); ++i) {
+		if (starvis2_inck_table[i].xclk_hz == starvis2->xclk_freq) {
+			starvis2->inck_sel_val = starvis2_inck_table[i].inck_sel;
 			break;
 		}
 	}
 
-	if (i == ARRAY_SIZE(imx678_inck_table))
+	if (i == ARRAY_SIZE(starvis2_inck_table))
 		return dev_err_probe(dev, -EINVAL,
 				     "unsupported XCLK rate %u Hz\n",
-				     imx678->xclk_freq);
+				     starvis2->xclk_freq);
 
-	for (i = 0; i < ARRAY_SIZE(imx678_supply_name); i++)
-		imx678->supplies[i].supply = imx678_supply_name[i];
+	for (i = 0; i < ARRAY_SIZE(starvis2_supply_name); i++)
+		starvis2->supplies[i].supply = starvis2_supply_name[i];
 
 	ret = devm_regulator_bulk_get(&client->dev,
-				      ARRAY_SIZE(imx678_supply_name),
-				      imx678->supplies);
+				      ARRAY_SIZE(starvis2_supply_name),
+				      starvis2->supplies);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to get regulators\n");
 
-	imx678->reset_gpio = devm_gpiod_get_optional(dev, "reset",
-						     GPIOD_OUT_HIGH);
-	if (IS_ERR(imx678->reset_gpio))
-		return dev_err_probe(dev, PTR_ERR(imx678->reset_gpio),
+	starvis2->reset_gpio = devm_gpiod_get_optional(dev, "reset",
+						       GPIOD_OUT_HIGH);
+	if (IS_ERR(starvis2->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(starvis2->reset_gpio),
 				     "failed to get reset GPIO\n");
 
-	ret = imx678_power_on(dev);
+	ret = starvis2_power_on(dev);
 	if (ret)
 		return ret;
 
-	ret = imx678_identify_model(imx678);
+	ret = starvis2_identify_model(starvis2);
 	if (ret)
 		goto error_power_off;
 
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
 
-	ret = imx678_init_controls(imx678);
+	ret = starvis2_init_controls(starvis2);
 	if (ret)
 		goto error_pm_runtime;
 
-	imx678->sd.internal_ops = &imx678_internal_ops;
-	imx678->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
-	imx678->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
+	starvis2->sd.internal_ops = &starvis2_internal_ops;
+	starvis2->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	starvis2->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
 
-	imx678->pad.flags = MEDIA_PAD_FL_SOURCE;
+	starvis2->pad.flags = MEDIA_PAD_FL_SOURCE;
 
-	ret = media_entity_pads_init(&imx678->sd.entity, 1, &imx678->pad);
+	ret = media_entity_pads_init(&starvis2->sd.entity, 1, &starvis2->pad);
 	if (ret) {
 		dev_err_probe(dev, ret, "failed to init entity pads\n");
 		goto error_handler_free;
 	}
 
-	imx678->sd.state_lock = imx678->ctrl_handler.lock;
-	ret = v4l2_subdev_init_finalize(&imx678->sd);
+	starvis2->sd.state_lock = starvis2->ctrl_handler.lock;
+	ret = v4l2_subdev_init_finalize(&starvis2->sd);
 	if (ret < 0) {
 		dev_err_probe(dev, ret, "subdev init error\n");
 		goto error_media_entity;
 	}
 
-	ret = v4l2_async_register_subdev_sensor(&imx678->sd);
+	ret = v4l2_async_register_subdev_sensor(&starvis2->sd);
 	if (ret < 0) {
 		dev_err_probe(dev, ret,
 			      "failed to register sensor sub-device\n");
@@ -1380,45 +1407,45 @@ static int imx678_probe(struct i2c_client *client)
 	return 0;
 
 error_subdev_cleanup:
-	v4l2_subdev_cleanup(&imx678->sd);
+	v4l2_subdev_cleanup(&starvis2->sd);
 
 error_media_entity:
-	media_entity_cleanup(&imx678->sd.entity);
+	media_entity_cleanup(&starvis2->sd.entity);
 
 error_handler_free:
-	v4l2_ctrl_handler_free(imx678->sd.ctrl_handler);
+	v4l2_ctrl_handler_free(starvis2->sd.ctrl_handler);
 
 error_pm_runtime:
 	pm_runtime_disable(&client->dev);
 	pm_runtime_set_suspended(&client->dev);
 
 error_power_off:
-	imx678_power_off(&client->dev);
+	starvis2_power_off(&client->dev);
 
 	return ret;
 }
 
-static void imx678_remove(struct i2c_client *client)
+static void starvis2_remove(struct i2c_client *client)
 {
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
-	struct imx678 *imx678 = to_imx678(sd);
+	struct starvis2 *starvis2 = to_starvis2(sd);
 
 	v4l2_async_unregister_subdev(sd);
 	v4l2_subdev_cleanup(sd);
 	media_entity_cleanup(&sd->entity);
-	v4l2_ctrl_handler_free(imx678->sd.ctrl_handler);
+	v4l2_ctrl_handler_free(starvis2->sd.ctrl_handler);
 
 	pm_runtime_disable(&client->dev);
 	if (!pm_runtime_status_suspended(&client->dev))
-		imx678_power_off(&client->dev);
+		starvis2_power_off(&client->dev);
 	pm_runtime_set_suspended(&client->dev);
 }
 
-static const struct dev_pm_ops imx678_pm_ops = {
-	SET_RUNTIME_PM_OPS(imx678_power_off, imx678_power_on, NULL)
+static const struct dev_pm_ops starvis2_pm_ops = {
+	SET_RUNTIME_PM_OPS(starvis2_power_off, starvis2_power_on, NULL)
 };
 
-static const struct of_device_id imx678_of_match[] = {
+static const struct of_device_id starvis2_of_match[] = {
 	{ .compatible = "sony,imx678-aamr", .data = &imx678_aamr_info },
 	{ .compatible = "sony,imx678-aaqr", .data = &imx678_aaqr_info },
 	/* for non-conforming DTs that rely on runtime check */
@@ -1426,22 +1453,22 @@ static const struct of_device_id imx678_of_match[] = {
 	{ /* sentinel */ }
 };
 
-MODULE_DEVICE_TABLE(of, imx678_of_match);
+MODULE_DEVICE_TABLE(of, starvis2_of_match);
 
-static struct i2c_driver imx678_i2c_driver = {
+static struct i2c_driver starvis2_i2c_driver = {
 	.driver = {
-		.name = "imx678",
-		.of_match_table = imx678_of_match,
-		.pm = pm_ptr(&imx678_pm_ops),
+		.name = "starvis2",
+		.of_match_table = starvis2_of_match,
+		.pm = pm_ptr(&starvis2_pm_ops),
 	},
-	.probe = imx678_probe,
-	.remove = imx678_remove,
+	.probe = starvis2_probe,
+	.remove = starvis2_remove,
 };
 
-module_i2c_driver(imx678_i2c_driver);
+module_i2c_driver(starvis2_i2c_driver);
 
 MODULE_AUTHOR("Will Whang <will@willwhang.com>");
 MODULE_AUTHOR("Tetsuya NOMURA <tetsuya.nomura@soho-enterprise.com>");
 MODULE_AUTHOR("Jai Luthra <jai.luthra@ideasonboard.com>");
-MODULE_DESCRIPTION("Sony imx678 sensor driver");
+MODULE_DESCRIPTION("Sony Starvis 2 sensor driver");
 MODULE_LICENSE("GPL");

-- 
2.34.1

