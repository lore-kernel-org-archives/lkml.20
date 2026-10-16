Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7474E50A8
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792164951; cv=none; b=odmBYn/01U0/fj3PV8G3d/0ETuXa15GNHR8Q6azwJltR75tUkUoMFVvvOoBEak0jDDqAK5KsZcDpCWR2YgtGZ/lC2n1w65YQvwesFvulHzsZ6oOrFe72AZuXQgrxJGzftrwZXS9WqM0WC25F12mZIVSNtf3pZ2osIVZNoilW7ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792164951; c=relaxed/simple;
	bh=soEJUcf6Zqz2jasqOFp58lNAVKlpo3tP2BABoOIr4xg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S1uYT0FbE1OVB54+mwAWl11LuTjKzRjHlGIGwRRSOJsgyz5mmdLUxLHS88xDL4ugJAzj4rx5XmEWnk6NWYhiAa6nDqEUQ4tbwECpOsUxQNul3Fs7YBzjvPy04kGWmeew1KTBLfbCamfXG8nWxZz9EkOSeRbA11FutOgv32WQLu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GSK3nend; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GSK3nend"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so8864617a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792164945; x=1792769745; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0KUByoJ7Jszc59ymEPvEMXS00rMMAwmxOssOSfMzf9A=;
        b=GSK3nendQpUtCaPLvPEwGCF+Xs41HShimL9CaxRUboeKC0otLCKj4CuWVLNl9BU1DI
         sfbHZGLJswlJcxSZhKa/unlXiz4RtQqE/ZxRxCxacgeBIeuFtLxVGPV1hEnn3fOhzPpI
         jdcoel6rHKa1XIPB+BokXaMUb95M1zyQVoO0SS8wkKTqw3vQK7ZESARufcJJmTf2xzDK
         yZ3IZiPd4kOQGDxxQPfr5ZfBY5ibbRP30jZG8p8APsrEWhWpKjWvdQpvav54eQ+8OJw7
         ruAAcQeQX1yS4VX/JJYBQVgpeyE3Pp/3hvIBckyasS/o/w9LzeJS72gdNUoEf4gtw4sD
         VTiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792164945; x=1792769745;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0KUByoJ7Jszc59ymEPvEMXS00rMMAwmxOssOSfMzf9A=;
        b=BW9xkpTFbcEaEeL2PX9uWSYyp6Znw3MakmvdMlLWvwMS7kjAJyIa0IhRpm61m3q0kE
         cCSJCTN55kbgnaxxKCEfMabgOmid+t2OGsrNKD6P6ATc2goI7k/SYYxNf95D36MSrS82
         0sx3JwZ1THOG44AqGO2LJMwBOJ0rib7AiT0kCe6CrqxT8p4wMNjCCRhENFWIGvq9Xt5/
         gTkPIR0BSLS37EINxzU1tvMzZVDOP72a3XretaV1HWL+QWIwzYBZMZnRGhLzvAnFk3IB
         ttydwOuZ0oJ96JZ9Q5JuNYwOQ8yFMz4z1hV8BZIE7e2wemDYrZqgRUitLW+R+lXLtGUh
         16Ig==
X-Forwarded-Encrypted: i=1; AKwUvBwxyd68DwHacI8bvHRrP2NLUDLW9w5SF+Xyeb5hxFoeV1eq1j1pnPFaSGkkukWHCEVXTCyqx4Te1+4YKmM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJXFwjOKJ9AfnetPuYdGcrgPiNnztX/EIf9EddJ1wp3I5NzZ3bi
	Pc7wnirUTL9Q2wT54Sc1gFc7lX70Ip/NYvlwtFNZtavqcfl/f+Vuq1VhQ7ZxTO2b
X-Gm-Gg: AYBFou0hiS8OiDgiMvHR038KMLHaXwPtY3fGBYYZbf9dv3w4czIgTl3sWRzOnRjger7
	Vi+o9zultjfHAZI2XxxoEolIO0NWHAMKtWb9lXU+lfZ/RJd5c3Gmg7mgIftVJ9E2IspWXNVwkIO
	blQXNDznjYvKzgu0P/ow79Rzn1FTAZjhTPwC73ADUEEzpp+cp0tJU34rfBXIfpXAANAhcB5h9fo
	bk3TYaviY707WobYctj1Zs6Wd1VEjAeh6ACoIlZxbHHw8B6eOgs185ybtkyB4sFX6CMALnEMeqV
	0a3lPOy/h9eaEbHcl8zWBZvydHpi6J9yYY314ACV9iGT3yoEFsDffhvs1ms4IryAd0w6gOi2EFd
	haLoRxi0WLc+PnAosp1CUYvq2H/29X3LUfI5RIcy9J8QNGoLuRzDB62yP14yymanHJ/mxpMs2Pq
	EZO/53KtZN5FTprF+8bs2mYlPKdU+qoPtn3sogrjvJoRFctYxAR2O/xjvn8KwrL/DQADcYO8aZX
	2h2PYDTmTzyptXQ97JduL85CyZh5SlyPQQl20Wy+zA+8B0ymyr/ZV7e2w1AItE+Pq+mzTj1+JIi
	2y6M0jdjL8OhoGJs6/SRiaxlEf0=
X-Received: by 2002:a05:6402:44da:b0:6aa:ff76:3076 with SMTP id 4fb4d7f45d1cf-6b17c2b619fmr14419032a12.32.1792164944496;
        Fri, 16 Oct 2026 08:35:44 -0700 (PDT)
Received: from M-K2012N0113010.localdomain ([88.119.128.229])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1b113dsm999067a12.10.2026.10.16.08.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 08:35:44 -0700 (PDT)
From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	linux-iio@vger.kernel.org
Cc: Eddie James <eajames@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rupesh Majhi <zoone.rupert@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paulius Zaleckas <paulius.zaleckas@gmail.com>
Subject: [PATCH v4 5/5] iio: pressure: dps310: add Zilltek ZTS8032 support
Date: Fri, 16 Oct 2026 18:35:33 +0300
Message-ID: <20261016153533.3701000-6-paulius.zaleckas@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261016153533.3701000-1-paulius.zaleckas@gmail.com>
References: <20261016153533.3701000-1-paulius.zaleckas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Zilltek ZTS8032 has the DPS310 register map, scale factors and
compensation, with these differences:

- two more pressure coefficients, c31 and c40 at 0x22-0x25, adding
  c40 * Praw_sc^4 + c31 * Traw_sc * Praw_sc^3 to the polynomial
- TMP_EXT is MEAS_CFG bit 3, and the temperature coefficients are for
  the internal sensor (COEF_SRCE reads 0x06). TMP_CFG bit 7 is the top
  bit of a 4-bit TMP_RATE, so the DPS310 TMP_EXT write would select a
  25/16 Hz background rate instead of the external sensor.
- product ID 0x11 instead of 0x10, the driver does not check it

Add its chip data, reading 22 coefficient bytes and leaving TMP_CFG at
0, a Horner step for each of c40 and c31, and the I2C and OF IDs.

Tested on a ZTS8032 over I2C: in_pressure_input is within 1 Pa of the
datasheet formula evaluated from the raw and coefficient registers at
every oversampling rate from 1 to 128, and TMP_CFG reads 0x00 after
probe.

Assisted-by: LLM
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 drivers/iio/pressure/Kconfig  |  6 ++++--
 drivers/iio/pressure/dps310.c | 33 ++++++++++++++++++++++++++++++---
 2 files changed, 34 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/pressure/Kconfig b/drivers/iio/pressure/Kconfig
index cef8b90b9ae7..21363d542c38 100644
--- a/drivers/iio/pressure/Kconfig
+++ b/drivers/iio/pressure/Kconfig
@@ -115,8 +115,10 @@ config DPS310
 	select IIO_BUFFER
 	select IIO_TRIGGERED_BUFFER
 	help
-	  Support for the Infineon DPS310 digital barometric pressure sensor.
-	  It can be accessed over I2C bus.
+	  Support for the following digital barometric pressure sensors:
+	  - Infineon DPS310
+	  - Zilltek ZTS8032
+	  They can be accessed over I2C bus.
 
 	  This driver can also be built as a module.  If so, the module will be
 	  called dps310.
diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index d0a2f6c6ec48..a97e82843dcd 100644
--- a/drivers/iio/pressure/dps310.c
+++ b/drivers/iio/pressure/dps310.c
@@ -7,6 +7,10 @@
  *
  * https://www.infineon.com/dgdl/?fileId=5546d462576f34750157750826c42242
  *
+ * The Zilltek ZTS8032 is register compatible, with two more pressure
+ * calibration coefficients (c31, c40) and temperature calibrated against
+ * the internal sensor.
+ *
  * Temperature calculation:
  *   c0 * 0.5 + c1 * T_raw / kT °C
  *
@@ -63,8 +67,9 @@
 #define  DPS310_RESET_MAGIC	0x09
 #define DPS310_COEF_BASE	0x10
 #define DPS310_COEF_LEN		18
+#define ZTS8032_COEF_LEN	22
 
-#define MAX_COEF_LEN		18
+#define MAX_COEF_LEN		22
 
 /* Make sure sleep time is <= 30ms for usleep_range */
 #define DPS310_POLL_SLEEP_US(t)		min(30000, (t) / 8)
@@ -93,6 +98,7 @@ struct dps310_chip_info {
 	const char *name;
 	u8 tmp_cfg;	/* TMP_CFG at startup: sensor the coefficients are for */
 	u8 coef_len;
+	bool has_c31_c40;
 };
 
 static const struct dps310_chip_info dps310_chip_info = {
@@ -101,6 +107,14 @@ static const struct dps310_chip_info dps310_chip_info = {
 	.coef_len = DPS310_COEF_LEN,
 };
 
+/* TMP_CFG bit 7 is a rate bit here; the internal sensor is the default */
+static const struct dps310_chip_info zts8032_chip_info = {
+	.name = "zts8032",
+	.tmp_cfg = 0,
+	.coef_len = ZTS8032_COEF_LEN,
+	.has_c31_c40 = true,
+};
+
 struct dps310_data {
 	struct i2c_client *client;
 	struct regmap *regmap;
@@ -109,6 +123,7 @@ struct dps310_data {
 
 	s32 c0, c1;
 	s32 c00, c10, c20, c30, c01, c11, c21;
+	s32 c31, c40;
 	s32 pressure_raw;
 	s32 temp_raw;
 	bool timeout_recovery_failed;
@@ -211,6 +226,11 @@ static int dps310_get_coefs(struct dps310_data *data)
 	c30 = (coef[16] << 8) | coef[17];
 	data->c30 = sign_extend32(c30, 15);
 
+	if (data->info->has_c31_c40) {
+		data->c31 = sign_extend32((coef[18] << 8) | coef[19], 15);
+		data->c40 = sign_extend32((coef[20] << 8) | coef[21], 15);
+	}
+
 	return 0;
 }
 
@@ -712,10 +732,15 @@ static int dps310_calculate_pressure(struct dps310_data *data, int *val)
 	if (rc)
 		return rc;
 
-	/* Section 4.9.1 of the DPS310 spec, Horner form to avoid overflow */
-	if (!dps310_horner_step(&prs, data->c30, p, kp) ||
+	/*
+	 * Section 4.9.1 of the DPS310 spec, Horner form to avoid overflow.
+	 * c40 and c31 are ZTS8032 only and zero on the DPS310.
+	 */
+	if (!dps310_horner_step(&prs, data->c40, p, kp) ||
+	    !dps310_horner_step(&prs, data->c30, p, kp) ||
 	    !dps310_horner_step(&prs, data->c20, p, kp) ||
 	    !dps310_horner_step(&prs, data->c10, p, kp) ||
+	    !dps310_horner_step(&tmp, data->c31, p, kp) ||
 	    !dps310_horner_step(&tmp, data->c21, p, kp) ||
 	    !dps310_horner_step(&tmp, data->c11, p, kp) ||
 	    !dps310_horner_step(&tmp, data->c01, t, kt))
@@ -1039,12 +1064,14 @@ static int dps310_probe(struct i2c_client *client)
 
 static const struct i2c_device_id dps310_id[] = {
 	{ .name = "dps310", .driver_data = (kernel_ulong_t)&dps310_chip_info },
+	{ .name = "zts8032", .driver_data = (kernel_ulong_t)&zts8032_chip_info },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, dps310_id);
 
 static const struct of_device_id dps310_of_match[] = {
 	{ .compatible = "infineon,dps310", .data = &dps310_chip_info },
+	{ .compatible = "zilltek,zts8032", .data = &zts8032_chip_info },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, dps310_of_match);
-- 
2.55.0

