Received: from mail-oo2-f8.google.com (mail-oo2-f8.google.com [74.125.231.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3F4368D51
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789538538; cv=none; b=U4EYL92MGnPDpsYiA08bKvOoNeN96663A7lLhfEjwcM7uSBuAujxk3Y+55NUyF8EHobn9GNb+V0jJkX5wjaihoPPmBfARakEs4FAV+ardv/+iIy8u4n5tulfr/z93R4o/H09NQ9PffWtxrmcrPQLX/opumbkuocC6AUtYz8sijA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789538538; c=relaxed/simple;
	bh=QtnN1VmI5eAp1/vplHXPNiC+TdYA9B46pb5dMjTnTjA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gsuoNY4118WBY88958bHR1g0Mz7Rk3/kfMicYLjSJJvDcn236JoncFSxJNa5wBcbb6YMJq2RR0ss0Mk2j7zLoAV+G0PcoqkZTmyfBEEcHLJvFoC8+F2hWwGMVkGmCz8VaGm2fPES35qPvM8jDJa3siRxBWgbvKTYgPiQHxCKg8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dwiOrbvS; arc=none smtp.client-ip=74.125.231.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dwiOrbvS"
Received: by mail-oo2-f8.google.com with SMTP id 006d021491bc7-6b12d30261cso1550471eaf.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 23:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789538534; x=1790143334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=01Gsn6SA0GWpWLJimbg+eGD0lykV1gDY4ThDaTnwEKw=;
        b=dwiOrbvSa9CbTmUbS1v8t7ZkOb7Gi2LD0Z8tx9PncUOzeQUgc19q1n3iIpg0PJetLd
         BwKTNufRiSVBOzVWWZRLEprpKv3Ju04HRBEfsdtpuLEHX2S49Y6ndGBPT13d07xCOabE
         QuXbTw1p6PC5eUBsnMiF5oNxTNvX7jNcb9cdZjvKJuQCxAowwRIQPlvVtuWImgBLSVAj
         v2U2jQV0jrQkAHd7xYYxv4i3tLV2PxHsbyJNU0uxpDfhfcUmBYA7ooffiP0p9rFFIHqn
         nJ6AHN3Jct5XwMtL8VmzSWYvjhoGacrh3To8wmNgRl9RYaCWHa57sq1IcbQ4JKS46sOc
         ap0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789538534; x=1790143334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=01Gsn6SA0GWpWLJimbg+eGD0lykV1gDY4ThDaTnwEKw=;
        b=AvucShGaj6uE+tyT66V8b2UkXI31IbIPNYltdGl7GubGVSia29euVZAPoNJNJei9VF
         lqFOXh79WgSGDAgfIh5WOJ7NcPWZ+5fAhvJDWO/LyUF++NeGJG9WFSPq5C8tJuVrjDST
         pQ2jx+pux/UyvgIKGs0T1ecRpyqw/+UOGvVeErTqhdwPF2LSdI/V5IHecDSLsWqR698f
         l394jr1WaxNKJzKeJCZJQs58I7Rh7elqO1WrrFlnzdcXJ02I+mrjKCu8PjT/optmKwm4
         V7dAUXZnqGjSh823UpZ/ztUNmBqNt+mtwgfZawtk4EPJ0Jfyevpby/2XYtOZVnrFwAqI
         C4aA==
X-Forwarded-Encrypted: i=1; AKwUvBwb3vQzUI9G7NXqVZ+ody3R2QaW0DjPTEyDiXMwEhkjBNAk0Md5OX+rxYjHni2mswxXnt851ADSe0yWSTA=@vger.kernel.org
X-Gm-Message-State: AFuF++nQjzjNPDfIXIWTyZKTydLIbx3zatWTON04BG6y8OFxSqh164eQ
	WmBqDmhngyFaA1cY3NUbCgq+sKbg/VUyTkfWM4g8mDxtKPwHsAxrMJvj
X-Gm-Gg: AYBFou1WUUBAf9r3joFoCITOqdqLx1C2gOe5Tq/AbceHXX6joeMkWslu59X2jKhrJvO
	Q0Wwyz77dKwLIRXmBH3cv8+sMUADse1WS1Vn4VaglZvFXB3yD118oocnewQAAgnJdpXieK9eRRl
	C9EGrwawsFUCtGtifi5f4ksguWacsTwZ3VAbhMBw5K8wGp0sjaniHlAwu0wTisAEUHGmVkHmnBe
	ahnSWFFpseefQXLd5sS0XzVscHY9Y5q5Ml8u+Pd7KzrU8kWNHrJUvzFloAmfaUAk5QwAKmLkQ9L
	qGG5efnDP3si+d11POiPEQfQErZcCVIR6BfoBcL9iDpvQWM374QHgg+2d2gZGCV8IoBVdTozbHZ
	uIloV5fFXNcb1W4xPp/IC1shQXjPN2Be/tV5H3uJ66bQpyMvPZCDxCMDBddRoktA47duehHuDPw
	ccd0wxwAu8HrhQYmTisQymRe8aAB5zgPU3Fg/5Fj9EvCDxRj53EI246lGFBC1uZDADJetRaU7/Q
	lQT7D9VyKIKMMP+fXPG
X-Received: by 2002:a05:6820:178b:b0:6c1:65dc:6903 with SMTP id 006d021491bc7-6c7d3cee609mr1666889eaf.45.1789538534410;
        Tue, 15 Sep 2026 23:02:14 -0700 (PDT)
Received: from DESKTOP-M0MLFVC.localdomain ([165.99.41.153])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5aa1194sm5150929eec.14.2026.09.15.23.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 23:02:13 -0700 (PDT)
From: Shehryar Ahmad <shehryar.amd@gmail.com>
To: linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@analog.com
Cc: Shehryar Ahmad <shehryar.amd@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Michael Hennerich <Michael.Hennerich@analog.com>
Subject: [PATCH v3 5/7] iio: accel: adis16201: add ADIS16203 support
Date: Wed, 16 Sep 2026 10:55:35 +0500
Message-ID: <20260916055547.15206-6-shehryar.amd@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916055547.15206-1-shehryar.amd@gmail.com>
References: <20260916055547.15206-1-shehryar.amd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add ADIS16203 from staging to mainline ADIS16201. ADIS16203 shares same
SPI protocol and register addresses. Differing parameters are handled by
adis16201_chip_info structure.

ADIS16203 specific support includes DIAG_STAT_SELFTEST_FAIL_BIT, which
is supported only on ADIS16203, a separate channel array and separate
adis_data struct.

Kconfig is updated accordingly.

Signed-off-by: Shehryar Ahmad <shehryar.amd@gmail.com>
---
 drivers/iio/accel/Kconfig     |  7 +++---
 drivers/iio/accel/adis16201.c | 46 +++++++++++++++++++++++++++++++++--
 2 files changed, 48 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/accel/Kconfig b/drivers/iio/accel/Kconfig
index 4094299e2..141ac9842 100644
--- a/drivers/iio/accel/Kconfig
+++ b/drivers/iio/accel/Kconfig
@@ -7,13 +7,14 @@
 menu "Accelerometers"
 
 config ADIS16201
-	tristate "Analog Devices ADIS16201 Dual-Axis Digital Inclinometer and Accelerometer"
+	tristate "ADIS16201 Digital Inclinometer and similar"
 	depends on SPI
 	select IIO_ADIS_LIB
 	select IIO_ADIS_LIB_BUFFER if IIO_BUFFER
 	help
-	  Say Y here to build support for Analog Devices adis16201 dual-axis
-	  digital inclinometer and accelerometer.
+	  Say Y here to build support for Analog Devices Digital Inclinometers:
+	  - ADIS16201
+	  - ADIS16203
 
 	  To compile this driver as a module, say M here: the module will
 	  be called adis16201.
diff --git a/drivers/iio/accel/adis16201.c b/drivers/iio/accel/adis16201.c
index 592dc6451..6d5a7b696 100644
--- a/drivers/iio/accel/adis16201.c
+++ b/drivers/iio/accel/adis16201.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * ADIS16201 Dual-Axis Digital Inclinometer and Accelerometer
+ * ADIS16201 Digital Inclinometer and similar
  *
  * Copyright 2010 Analog Devices Inc.
  */
@@ -63,6 +63,7 @@
 #define ADIS16201_DIAG_STAT_REG				0x3C
 #define  ADIS16201_DIAG_STAT_ALARM2			BIT(9)
 #define  ADIS16201_DIAG_STAT_ALARM1			BIT(8)
+#define  ADIS16203_DIAG_STAT_SELFTEST_FAIL_BIT		5
 #define  ADIS16201_DIAG_STAT_SPI_FAIL_BIT		3
 #define  ADIS16201_DIAG_STAT_FLASH_UPT_FAIL_BIT		2
 /* Power supply above 3.625 V */
@@ -231,6 +232,15 @@ static const struct iio_chan_spec adis16201_channels[] = {
 	IIO_CHAN_SOFT_TIMESTAMP(7),
 };
 
+static const struct iio_chan_spec adis16203_channels[] = {
+	ADIS_INCLI_CHAN(X, ADIS16201_XINCL_OUT_REG, ADIS16201_SCAN_INCLI_X,
+			BIT(IIO_CHAN_INFO_CALIBBIAS), 0, 14),
+	ADIS_SUPPLY_CHAN(ADIS16201_SUPPLY_OUT_REG, ADIS16201_SCAN_SUPPLY, 0, 12),
+	ADIS_AUX_ADC_CHAN(ADIS16201_AUX_ADC_REG, ADIS16201_SCAN_AUX_ADC, 0, 12),
+	ADIS_TEMP_CHAN(ADIS16201_TEMP_OUT_REG, ADIS16201_SCAN_TEMP, 0, 12),
+	IIO_CHAN_SOFT_TIMESTAMP(7),
+};
+
 static const struct iio_info adis16201_info = {
 	.read_raw = adis16201_read_raw,
 	.write_raw = adis16201_write_raw,
@@ -238,6 +248,7 @@ static const struct iio_info adis16201_info = {
 };
 
 static const char * const adis16201_status_error_msgs[] = {
+	[ADIS16203_DIAG_STAT_SELFTEST_FAIL_BIT] = "Self test failure",
 	[ADIS16201_DIAG_STAT_SPI_FAIL_BIT] = "SPI failure",
 	[ADIS16201_DIAG_STAT_FLASH_UPT_FAIL_BIT] = "Flash update failed",
 	[ADIS16201_DIAG_STAT_POWER_HIGH_BIT] = "Power supply above 3.625V",
@@ -268,6 +279,25 @@ static const struct adis_data adis16201_data = {
 		BIT(ADIS16201_DIAG_STAT_POWER_LOW_BIT),
 };
 
+static const struct adis_data adis16203_data = {
+	.read_delay = 20,
+	.msc_ctrl_reg = ADIS16201_MSC_CTRL_REG,
+	.glob_cmd_reg = ADIS16201_GLOB_CMD_REG,
+	.diag_stat_reg = ADIS16201_DIAG_STAT_REG,
+
+	.self_test_mask = ADIS16201_MSC_CTRL_SELF_TEST_EN,
+	.self_test_reg = ADIS16201_MSC_CTRL_REG,
+	.self_test_no_autoclear = true,
+	.timeouts = &adis16201_timeouts,
+
+	.status_error_msgs = adis16201_status_error_msgs,
+	.status_error_mask = BIT(ADIS16203_DIAG_STAT_SELFTEST_FAIL_BIT) |
+		BIT(ADIS16201_DIAG_STAT_SPI_FAIL_BIT) |
+		BIT(ADIS16201_DIAG_STAT_FLASH_UPT_FAIL_BIT) |
+		BIT(ADIS16201_DIAG_STAT_POWER_HIGH_BIT) |
+		BIT(ADIS16201_DIAG_STAT_POWER_LOW_BIT),
+};
+
 static const struct adis16201_chip_info adis16201_chip_data = {
 	.arr_channels = adis16201_channels,
 	.incli_scale_val2 = 100000,
@@ -278,6 +308,16 @@ static const struct adis16201_chip_info adis16201_chip_data = {
 	.data = &adis16201_data,
 };
 
+static const struct adis16201_chip_info adis16203_chip_data = {
+	.arr_channels = adis16203_channels,
+	.incli_scale_val2 = 25000,
+	.write_mask_incli = GENMASK(13, 0),
+	.read_bits_incli = 14,
+	.num_channels = ARRAY_SIZE(adis16203_channels),
+	.name = "adis16203",
+	.data = &adis16203_data,
+};
+
 static int adis16201_probe(struct spi_device *spi)
 {
 	struct iio_dev *indio_dev;
@@ -318,12 +358,14 @@ static int adis16201_probe(struct spi_device *spi)
 
 static const struct of_device_id adis16201_of_match[] = {
 	{ .compatible = "adi,adis16201", .data = &adis16201_chip_data },
+	{ .compatible = "adi,adis16203", .data = &adis16203_chip_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, adis16201_of_match);
 
 static const struct spi_device_id adis16201_ids[] = {
 	{ .name = "adis16201", .driver_data = (kernel_ulong_t)&adis16201_chip_data },
+	{ .name = "adis16203", .driver_data = (kernel_ulong_t)&adis16203_chip_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(spi, adis16201_ids);
@@ -339,6 +381,6 @@ static struct spi_driver adis16201_driver = {
 module_spi_driver(adis16201_driver);
 
 MODULE_AUTHOR("Barry Song <21cnbao@gmail.com>");
-MODULE_DESCRIPTION("Analog Devices ADIS16201 Dual-Axis Digital Inclinometer and Accelerometer");
+MODULE_DESCRIPTION("Analog Devices ADIS16201 Inclinometer and similar");
 MODULE_LICENSE("GPL v2");
 MODULE_IMPORT_NS("IIO_ADISLIB");
-- 
2.43.0

