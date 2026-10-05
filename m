Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1579497B66
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 14:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791208970; cv=none; b=mvIuN4Gwm9T0SgToHtxEwb/glBPIEZpQy+B597gkV6Qhj86dUV64M0lbxrWo148y7Rt31P8oELDApa+7BmikCftyFUY6xDAMoqy1MkNO+IdFWp9njLRSzEwLOzqDfY1cN2Gqjg4PBpNn5GP6Ri81afUJhAJH4GxG8qKg2mbtCkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791208970; c=relaxed/simple;
	bh=pMMd6/UPo11Diabrckx/qcJqF9sXenxVy8juvAZsUGU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i1P7QiXnIJ3LYMDf2d6EQevvEL8tAtv7oV3f/DOOeSuGF9oCB38+bGGEGv1i4fGNHRF7Qf8IPZHv6OIUPeGBFHwCQdmeieApMbOCB6g1J9pYrKQvo47+DGLsK+Cex5g+kaW628AQITpsB70K6HtKyFyuMHk/EU6B1wiG29sckOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=FksBR+Uh; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="FksBR+Uh"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e79a408deso10598425e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 07:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1791208963; x=1791813763; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6kv0Zp6t3hSY7JC05CY5SGsv90094HCq+MNBv6ymamc=;
        b=FksBR+Uh/3F6vOCAng0rGzu4tgWD90gb/0mn6DdEhC1g2z6ztsOO7Rn01nHMiS5t/o
         9AagBkxaEiflktMqdplUc4o500E/e7aptZ4XHhh+EUrDFkCvdogzboffEWS7ohKrXHYn
         /ArtLq2SvHsnccKUls2akmqil+OH6JBxo39CQ/CCE7ITZXsrF1CA4fJb/Bou94aZyt67
         awEuLq06lAyIrpF7B2yJmDFk5NPxflSFH6NJXyf5muEBKKoKz7MppTHFaul47sPIlnEX
         l2xSc3FGNolxptGEu2XlT0qQgRi6oBi81otwLwt7GSyoFtEuIeMS8AsHNT/PD18mS6I/
         Maew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791208963; x=1791813763;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6kv0Zp6t3hSY7JC05CY5SGsv90094HCq+MNBv6ymamc=;
        b=agkjzrmAbtyVZpubTFWQLa5bjGBnsbKUqeY+1wyHpNqvgWqT+9owZ4Yt5yoQZCTxRO
         TueESFTv1+i0yvnsYYzFl4+4S7Zs+f6Hrl/+de949NPuwpVkx3JHlCkZ7meT1+0EnxQT
         GGrmU0EF09HzT8QjJuD8IzPw9qt7DZqtNw8u714jcX2FKpzZnFc1z9BwK+f2wKKdywkq
         eT2vso/NrB0MOuYi4zWACOczonq/FIRK7zFzGGLAcxlgKNPbAFAzWzoB19U8uSqp2nxD
         RxqM0bHtw4/nmT7Dg/fp3tZR2ued8M1cDRqypI5JmolID6zqLFgzYE5kpSaOa1K6RXOC
         mwaA==
X-Forwarded-Encrypted: i=1; AKwUvBxeS+7bW1wnFstuuRWY2VS44La9N5zUzNq0LmMo12sXHUydxRQSTnOJr4lj/UHSLzzN5TaoLhgRMAwVXcU=@vger.kernel.org
X-Gm-Message-State: AFuF++lj9WCZ7/PnzrmnhFR2k97bUDsYmhhWp1/HfuxqM7QDesnQ9A2+
	nCXGzZ1vCyCJt5Kw7gR0apBS2jpUQWbtlC2qfXR+V4Aa38G2pWgiAfS+2TP8g24o4o8ZbijQRCD
	PonG0l39liQ==
X-Gm-Gg: AYBFou3Z+vHBYOlPDIeLIRdikyoHxYC0bZF0vXmNqS4z4yROp+wt+u0sxA8bGX5NKPw
	U3hQ1fspwFvOoJfcD+Omd7RUOgYnx/laJCk8Qj1lyxUIAdaiF3POLbtDzypBJvdvKY+5C34VfQI
	z8f9C9QtyYcQ5ntB0/MrCwIop7/eXmUN4mBiGRkbuJw1up6/QDCC3L9Neh5Go1Ru8GWXh20QQ7A
	9cGDwq2R1yphMyLexlQctfm4FSurc3K0oDxcKCSNxAOXvqvu1rs1aKlv23GUPidI9ZkkztBdg66
	altKTCg6AmscPmpmd+WGk9Icc4TYuujPPt+dmOs/f9+I5KlseD6FVSmijZYQDAAqw2r1gfl/8Wr
	WLKyF8tKN+kPk0W9xc5qXV+4ns3QNrIJP0oRXMTsAmfbLI4Q80pfsdoEvJATUgtuxQO50I5XdK4
	27+tn6/g0E6r7ZqDTyP96MRDexW6vSNdOz2K6nFMuuT3c46r+gu8V90oO+81ShC3BXuQ1fdBm2z
	srulJ1p+24bRT8=
X-Received: by 2002:a05:600c:3501:b0:4a0:1723:2d8e with SMTP id 5b1f17b1804b1-4a0274f3bcdmr189768645e9.2.1791208961800;
        Mon, 05 Oct 2026 07:02:41 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:9c1b:24c4:d43:125f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a162e867e8sm324052715e9.15.2026.10.05.07.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 07:02:41 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Mon, 05 Oct 2026 15:01:57 +0100
Subject: [PATCH 01/12] iio: accel: use named initializers for
 acpi_device_id
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-acpi-iio-v1-1-2796f713945a@thegoodpenguin.co.uk>
References: <20261005-acpi-iio-v1-0-2796f713945a@thegoodpenguin.co.uk>
In-Reply-To: <20261005-acpi-iio-v1-0-2796f713945a@thegoodpenguin.co.uk>
To: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Petre Rodan <petre.rodan@subdimension.ro>, 
 Matteo Martelli <matteomartelli3@gmail.com>, 
 Marius Cristea <marius.cristea@microchip.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, 
 Alex Lanzano <lanzano.alex@gmail.com>, 
 Jagath Jog J <jagathjog1996@gmail.com>, 
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, 
 Kevin Tsai <ktsai@capellamicro.com>, Eddie James <eajames@linux.ibm.com>, 
 Marcelo Schmitt <marcelo.schmitt@analog.com>
Cc: linux@analog.com, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791208959; l=10960;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=pMMd6/UPo11Diabrckx/qcJqF9sXenxVy8juvAZsUGU=;
 b=NaRSy84FYIVk0a0ygFwLGrJsNtcHN9EL6ZRXKTMQSfKOpD45BuWJpTOj2WhfeCpId/rBwnFnG
 ZTF1/HzaAvYAXlogIi/F9LyEaUX4U+HmVfRB1aa5k13sp3qcu2gfSpf
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Use a designated initializer for the acpi_device_id fields which makes the
code more readable and consistent with how lists are initialized in the
rest of the kernel code base. Also drop explicitly setting fields to 0
where it is redundant.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/iio/accel/adxl345_i2c.c      |  2 +-
 drivers/iio/accel/adxl345_spi.c      |  2 +-
 drivers/iio/accel/bma220_spi.c       |  2 +-
 drivers/iio/accel/bmc150-accel-i2c.c | 24 ++++++++++++------------
 drivers/iio/accel/bmc150-accel-spi.c | 16 ++++++++--------
 drivers/iio/accel/da280.c            |  4 ++--
 drivers/iio/accel/kxcjk-1013.c       | 22 +++++++++++-----------
 drivers/iio/accel/mma7660.c          |  2 +-
 drivers/iio/accel/mma9551.c          |  2 +-
 drivers/iio/accel/mma9553.c          |  2 +-
 drivers/iio/accel/mxc4005.c          |  6 +++---
 drivers/iio/accel/mxc6255.c          |  4 ++--
 drivers/iio/accel/st_accel_i2c.c     |  4 ++--
 drivers/iio/accel/stk8ba50.c         |  2 +-
 14 files changed, 47 insertions(+), 47 deletions(-)

diff --git a/drivers/iio/accel/adxl345_i2c.c b/drivers/iio/accel/adxl345_i2c.c
index 511fb610436c..609b5d881097 100644
--- a/drivers/iio/accel/adxl345_i2c.c
+++ b/drivers/iio/accel/adxl345_i2c.c
@@ -57,7 +57,7 @@ static const struct of_device_id adxl345_of_match[] = {
 MODULE_DEVICE_TABLE(of, adxl345_of_match);
 
 static const struct acpi_device_id adxl345_acpi_match[] = {
-	{ "ADS0345", (kernel_ulong_t)&adxl345_i2c_info },
+	{ .id = "ADS0345", .driver_data = (kernel_ulong_t)&adxl345_i2c_info },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, adxl345_acpi_match);
diff --git a/drivers/iio/accel/adxl345_spi.c b/drivers/iio/accel/adxl345_spi.c
index 4fa1b04f75b6..e916ca9cc854 100644
--- a/drivers/iio/accel/adxl345_spi.c
+++ b/drivers/iio/accel/adxl345_spi.c
@@ -74,7 +74,7 @@ static const struct of_device_id adxl345_of_match[] = {
 MODULE_DEVICE_TABLE(of, adxl345_of_match);
 
 static const struct acpi_device_id adxl345_acpi_match[] = {
-	{ "ADS0345", (kernel_ulong_t)&adxl345_spi_info },
+	{ .id = "ADS0345", .driver_data = (kernel_ulong_t)&adxl345_spi_info },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, adxl345_acpi_match);
diff --git a/drivers/iio/accel/bma220_spi.c b/drivers/iio/accel/bma220_spi.c
index d6c1087cc3c0..5c4de5af69ac 100644
--- a/drivers/iio/accel/bma220_spi.c
+++ b/drivers/iio/accel/bma220_spi.c
@@ -30,7 +30,7 @@ static const struct spi_device_id bma220_spi_id[] = {
 };
 
 static const struct acpi_device_id bma220_acpi_id[] = {
-	{ "BMA0220", 0 },
+	{ .id = "BMA0220" },
 	{ }
 };
 MODULE_DEVICE_TABLE(spi, bma220_spi_id);
diff --git a/drivers/iio/accel/bmc150-accel-i2c.c b/drivers/iio/accel/bmc150-accel-i2c.c
index 336866aad20c..4041825c068d 100644
--- a/drivers/iio/accel/bmc150-accel-i2c.c
+++ b/drivers/iio/accel/bmc150-accel-i2c.c
@@ -14,8 +14,8 @@
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id bmc150_acpi_dual_accel_ids[] = {
-	{"BOSC0200"},
-	{"DUAL250E"},
+	{ .id = "BOSC0200" },
+	{ .id = "DUAL250E" },
 	{ }
 };
 
@@ -216,13 +216,13 @@ static void bmc150_accel_remove(struct i2c_client *client)
 }
 
 static const struct acpi_device_id bmc150_accel_acpi_match[] = {
-	{"BMA0255"},
-	{"BMA0280"},
-	{"BMA222"},
-	{"BMA222E"},
-	{"BMA250E"},
-	{"BMC150A"},
-	{"BMI055A"},
+	{ .id = "BMA0255" },
+	{ .id = "BMA0280" },
+	{ .id = "BMA222" },
+	{ .id = "BMA222E" },
+	{ .id = "BMA250E" },
+	{ .id = "BMC150A" },
+	{ .id = "BMI055A" },
 	/*
 	 * The "BOSC0200" identifier used here is not unique to devices using
 	 * bmc150. The same "BOSC0200" identifier is found in the ACPI tables
@@ -236,9 +236,9 @@ static const struct acpi_device_id bmc150_accel_acpi_match[] = {
 	 * seen. This allows the bmi323 driver to take over for ASUS ROG ALLY,
 	 * and other devices using the bmi323 chip.
 	 */
-	{"BOSC0200"},
-	{"BSBA0150"},
-	{"DUAL250E"},
+	{ .id = "BOSC0200" },
+	{ .id = "BSBA0150" },
+	{ .id = "DUAL250E" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, bmc150_accel_acpi_match);
diff --git a/drivers/iio/accel/bmc150-accel-spi.c b/drivers/iio/accel/bmc150-accel-spi.c
index 405bd7b2d199..8014d8caa4a4 100644
--- a/drivers/iio/accel/bmc150-accel-spi.c
+++ b/drivers/iio/accel/bmc150-accel-spi.c
@@ -39,14 +39,14 @@ static void bmc150_accel_remove(struct spi_device *spi)
 }
 
 static const struct acpi_device_id bmc150_accel_acpi_match[] = {
-	{"BMA0255"},
-	{"BMA0280"},
-	{"BMA222"},
-	{"BMA222E"},
-	{"BMA250E"},
-	{"BMC150A"},
-	{"BMI055A"},
-	{"BSBA0150"},
+	{ .id = "BMA0255" },
+	{ .id = "BMA0280" },
+	{ .id = "BMA222" },
+	{ .id = "BMA222E" },
+	{ .id = "BMA250E" },
+	{ .id = "BMC150A" },
+	{ .id = "BMI055A" },
+	{ .id = "BSBA0150" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, bmc150_accel_acpi_match);
diff --git a/drivers/iio/accel/da280.c b/drivers/iio/accel/da280.c
index 15acbe1c2cbd..d5ad981cfbc0 100644
--- a/drivers/iio/accel/da280.c
+++ b/drivers/iio/accel/da280.c
@@ -155,8 +155,8 @@ static const struct da280_match_data da226_match_data = { "da226", 2 };
 static const struct da280_match_data da280_match_data = { "da280", 3 };
 
 static const struct acpi_device_id da280_acpi_match[] = {
-	{ "NSA2513", (kernel_ulong_t)&da217_match_data },
-	{ "MIRAACC", (kernel_ulong_t)&da280_match_data },
+	{ .id = "NSA2513", .driver_data = (kernel_ulong_t)&da217_match_data },
+	{ .id = "MIRAACC", .driver_data = (kernel_ulong_t)&da280_match_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, da280_acpi_match);
diff --git a/drivers/iio/accel/kxcjk-1013.c b/drivers/iio/accel/kxcjk-1013.c
index 8994c9e8e048..73d23d36cc11 100644
--- a/drivers/iio/accel/kxcjk-1013.c
+++ b/drivers/iio/accel/kxcjk-1013.c
@@ -1649,19 +1649,19 @@ static const struct of_device_id kxcjk1013_of_match[] = {
 MODULE_DEVICE_TABLE(of, kxcjk1013_of_match);
 
 static const struct acpi_device_id kx_acpi_match[] = {
-	{ "KIOX0008", (kernel_ulong_t)&kxcj91008_info },
-	{ "KIOX0009", (kernel_ulong_t)&kxtj21009_info },
-	{ "KIOX000A", (kernel_ulong_t)&kxcj91008_info },
+	{ .id = "KIOX0008", .driver_data = (kernel_ulong_t)&kxcj91008_info },
+	{ .id = "KIOX0009", .driver_data = (kernel_ulong_t)&kxtj21009_info },
+	{ .id = "KIOX000A", .driver_data = (kernel_ulong_t)&kxcj91008_info },
 	/* KXCJ91008 in the display of a yoga 2-in-1 */
-	{ "KIOX010A", (kernel_ulong_t)&kxcj91008_kiox010a_info },
+	{ .id = "KIOX010A", .driver_data = (kernel_ulong_t)&kxcj91008_kiox010a_info },
 	/* KXCJ91008 in the base of a yoga 2-in-1 */
-	{ "KIOX020A", (kernel_ulong_t)&kxcj91008_kiox020a_info },
-	{ "KXCJ1008", (kernel_ulong_t)&kxcj91008_info },
-	{ "KXCJ1013", (kernel_ulong_t)&kxcjk1013_info },
-	{ "KXCJ9000", (kernel_ulong_t)&kxcj91008_info },
-	{ "KXJ2109",  (kernel_ulong_t)&kxtj21009_info },
-	{ "KXTJ1009", (kernel_ulong_t)&kxtj21009_info },
-	{ "SMO8500",  (kernel_ulong_t)&kxcj91008_smo8500_info },
+	{ .id = "KIOX020A", .driver_data = (kernel_ulong_t)&kxcj91008_kiox020a_info },
+	{ .id = "KXCJ1008", .driver_data = (kernel_ulong_t)&kxcj91008_info },
+	{ .id = "KXCJ1013", .driver_data = (kernel_ulong_t)&kxcjk1013_info },
+	{ .id = "KXCJ9000", .driver_data = (kernel_ulong_t)&kxcj91008_info },
+	{ .id = "KXJ2109", .driver_data = (kernel_ulong_t)&kxtj21009_info },
+	{ .id = "KXTJ1009", .driver_data = (kernel_ulong_t)&kxtj21009_info },
+	{ .id = "SMO8500", .driver_data = (kernel_ulong_t)&kxcj91008_smo8500_info },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, kx_acpi_match);
diff --git a/drivers/iio/accel/mma7660.c b/drivers/iio/accel/mma7660.c
index 38b4df76cff3..1ad7b2206e33 100644
--- a/drivers/iio/accel/mma7660.c
+++ b/drivers/iio/accel/mma7660.c
@@ -270,7 +270,7 @@ static const struct of_device_id mma7660_of_match[] = {
 MODULE_DEVICE_TABLE(of, mma7660_of_match);
 
 static const struct acpi_device_id mma7660_acpi_id[] = {
-	{"MMA7660", 0},
+	{ .id = "MMA7660" },
 	{ }
 };
 
diff --git a/drivers/iio/accel/mma9551.c b/drivers/iio/accel/mma9551.c
index 7e01427fd9c4..bb74dfa538b8 100644
--- a/drivers/iio/accel/mma9551.c
+++ b/drivers/iio/accel/mma9551.c
@@ -572,7 +572,7 @@ static const struct dev_pm_ops mma9551_pm_ops = {
 };
 
 static const struct acpi_device_id mma9551_acpi_match[] = {
-	{"MMA9551", 0},
+	{ .id = "MMA9551" },
 	{ }
 };
 
diff --git a/drivers/iio/accel/mma9553.c b/drivers/iio/accel/mma9553.c
index 8e7aaac89d47..202aa91518b5 100644
--- a/drivers/iio/accel/mma9553.c
+++ b/drivers/iio/accel/mma9553.c
@@ -1208,7 +1208,7 @@ static const struct dev_pm_ops mma9553_pm_ops = {
 };
 
 static const struct acpi_device_id mma9553_acpi_match[] = {
-	{"MMA9553", 0},
+	{ .id = "MMA9553" },
 	{ }
 };
 
diff --git a/drivers/iio/accel/mxc4005.c b/drivers/iio/accel/mxc4005.c
index a66fee828ec1..1559888e0995 100644
--- a/drivers/iio/accel/mxc4005.c
+++ b/drivers/iio/accel/mxc4005.c
@@ -561,9 +561,9 @@ static int mxc4005_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(mxc4005_pm_ops, mxc4005_suspend, mxc4005_resume);
 
 static const struct acpi_device_id mxc4005_acpi_match[] = {
-	{"MXC4005",	0},
-	{"MXC6655",	0},
-	{"MDA6655",	0},
+	{ .id = "MXC4005" },
+	{ .id = "MXC6655" },
+	{ .id = "MDA6655" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, mxc4005_acpi_match);
diff --git a/drivers/iio/accel/mxc6255.c b/drivers/iio/accel/mxc6255.c
index a9f41cf27ad9..7b4d63a8bde1 100644
--- a/drivers/iio/accel/mxc6255.c
+++ b/drivers/iio/accel/mxc6255.c
@@ -163,8 +163,8 @@ static int mxc6255_probe(struct i2c_client *client)
 }
 
 static const struct acpi_device_id mxc6255_acpi_match[] = {
-	{"MXC6225",	0},
-	{"MXC6255",	0},
+	{ .id = "MXC6225" },
+	{ .id = "MXC6255" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, mxc6255_acpi_match);
diff --git a/drivers/iio/accel/st_accel_i2c.c b/drivers/iio/accel/st_accel_i2c.c
index 99522a885d71..6d4b7d46869d 100644
--- a/drivers/iio/accel/st_accel_i2c.c
+++ b/drivers/iio/accel/st_accel_i2c.c
@@ -130,8 +130,8 @@ static const struct of_device_id st_accel_of_match[] = {
 MODULE_DEVICE_TABLE(of, st_accel_of_match);
 
 static const struct acpi_device_id st_accel_acpi_match[] = {
-	{"SMO8840", (kernel_ulong_t)LIS2DH12_ACCEL_DEV_NAME},
-	{"SMO8A90", (kernel_ulong_t)LNG2DM_ACCEL_DEV_NAME},
+	{ .id = "SMO8840", .driver_data = (kernel_ulong_t)LIS2DH12_ACCEL_DEV_NAME },
+	{ .id = "SMO8A90", .driver_data = (kernel_ulong_t)LNG2DM_ACCEL_DEV_NAME },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, st_accel_acpi_match);
diff --git a/drivers/iio/accel/stk8ba50.c b/drivers/iio/accel/stk8ba50.c
index 6c1e286c0a1d..2ae9a97524cc 100644
--- a/drivers/iio/accel/stk8ba50.c
+++ b/drivers/iio/accel/stk8ba50.c
@@ -528,7 +528,7 @@ static const struct i2c_device_id stk8ba50_i2c_id[] = {
 MODULE_DEVICE_TABLE(i2c, stk8ba50_i2c_id);
 
 static const struct acpi_device_id stk8ba50_acpi_id[] = {
-	{"STK8BA50", 0},
+	{ .id = "STK8BA50" },
 	{ }
 };
 

-- 
2.53.0

