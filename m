Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B06368D74
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792164950; cv=none; b=eAwI8OXBcWoxWwd1p309Kaynn5imSxyo0lDQIUPgP8GIbHno43qLEZ7fRCxylvqiPIhoxmwq89GU48gmTJEgPXJc/tPTYgytIqf4Ei7/pNpP0A0ft8+BqZZuCoFwgleeKfA44RyRzawj3Dkd0oq2lSsFYTSDU/7TcNs1QyqMTL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792164950; c=relaxed/simple;
	bh=q0rCLQwLWANoCwZTuKOTQdJ3Sjom9RaYYQjpvH2j/B8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fDAqbdpWq+bZoFAcXSEzrLGpdVMdUc+NxTc+0fSvIil63FYk92Aop6eZt/gl2WURsF0XgmQ3Zs1F2SMVntC/hK174+fk1+pw05+6KoSorhccgcgqzodohkdBGjRBA3fBPwwKl4xt/04lFMDIFf3PhP9hZj87VlLSfhP1YVR7Uu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fZJPVjxU; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fZJPVjxU"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b1cc392d8bso4456338a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792164942; x=1792769742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xgx0usfEr7KgB7QOLLHWV6JVGMcwvoEn5+G9c42TBac=;
        b=fZJPVjxUBYRRHK6Wov9jPa2V9voLbX9n7ClKUnN7LysmIdgC6uLKcI+u7yHHhuaaSY
         Ansjs4SWhj3UB7UPWayJ49upmDdLUkiDFVy6p8qGjy4Ne1ealc/WVOX5h0kFYHytP++5
         ipF8NNghaBFW+Y7xf5z8MGcRY7jMorz+zgdKbI5f+1G1UzhstCXw/OC70t5EH0yW6G7h
         9w6pWFs44EYY+hO1YitTjn7HHt3qpqRhvFDbd3U8r2dWIfVkhnRmQVI7mesmsY/hPyRL
         u6BO17cu6/gMaeodPllnKD2MLwt3cgDFuHFvfe8ctwuyWJtCPEw9goon0Qg7jqWCQPe7
         m35w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792164942; x=1792769742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xgx0usfEr7KgB7QOLLHWV6JVGMcwvoEn5+G9c42TBac=;
        b=jVK6t8RLU3Zj1LWw3v6wZdWNWdDZh+clRReuR7uTCGSvWIJWlecckB70uRA+idG+tf
         j6L97vXDOWZvNinZpFDL40gSAsXfNhizyn2Yd0oxUjuBIKHh3DAiBdIhhKA7N4sb6XW2
         Lm6Kknsc03LxaODiidOfeyVqXFm45u2wrNoBtZM1AWHucXClhEpLi0US3fzBinasKXVn
         M3FYqP0hkbuelSKKfc1Jyn47u/UdjWNeIGIktciwZjUOvCFZBB454u3iYWtQeBWbPDKj
         ylJRr1yfspaGjDQPbAHwDO67aOkBgRA9FhrWGq3A442K49J+EnXIPDBJexpo4zMS4BDm
         LqDA==
X-Forwarded-Encrypted: i=1; AKwUvBxDO+C60TbjgemXqfGgRUDtq9ODEqkYxURbaz6/9ZalSkZypURBiL7XEPngjhBhkkcnu/7iJZ2f2EfnnPg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXMzgE1GF+mdwGZUxVyFzlnDEWqkKWJmuLOv5oqHdC/ixMfQEF
	A/fmRMZFg2fxgjsGz8b++bOyeWxSGmmIIi7/G+TVMGxERzlD9qYr7meo
X-Gm-Gg: AYBFou2Mtm6XZPjvb9oQ6mD8Inwpv1GS5euRO5ioscvOPCE4sVjF/xYzLVjtD231dnp
	sNAqriaK5ejA0H+C+vIHj01Zh6q2+rH0TeIWx7jRnv0GEp/dlFrgrRvHgfI5jahWmvi6zZ6pqH2
	7Fr3UQFJMlQwtOWQZrLJ6G/98tgLvBXBj6upCmI27pmOpZDWFJ5jOMKSe5E4nP+Lepj72aTEikS
	b6HT769Spv4g6EDkGTvachgjh99LeD+LljrjZrPZPRflbedF4rXNPE97GgFyVJWU7sgOfB2nwYs
	e1qK8JJNOHOGGxR3tIVcUQXyeKJ4xp5zde+/Cgdpv1ak0aGzWcwLZKBd2TkEpQdu+Xii1ezJGvC
	sQrsNsZm8CUUQbUqryy3dQ7iwqjEMKCvX3vgui1/2iCbEKVnetfgKSpYiATAsKYoRzCEcup1bAE
	UjzXghTOCMlQQrAZ59tCu9RBkWe1U/tWUInDKFNtzQEjnIiXiVzCRfRNNkBnN3Yu4QcvtvxFjlA
	2B/CbVvKQrVZc8CeiFqLoBWWYTnyYIirtX0a/kcOVSfRTAT/rOflEmo26MCs6SuoF0ztQkzjEFJ
	16WRM5/6zWTx6P8x20Ia0xbZv3M4
X-Received: by 2002:a05:6402:2354:b0:6b1:bcde:9f32 with SMTP id 4fb4d7f45d1cf-6b1bcdea1d6mr13224245a12.7.1792164942131;
        Fri, 16 Oct 2026 08:35:42 -0700 (PDT)
Received: from M-K2012N0113010.localdomain ([88.119.128.229])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1b113dsm999067a12.10.2026.10.16.08.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 08:35:41 -0700 (PDT)
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
Subject: [PATCH v4 3/5] iio: pressure: dps310: add per-chip data
Date: Fri, 16 Oct 2026 18:35:31 +0300
Message-ID: <20261016153533.3701000-4-paulius.zaleckas@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261016153533.3701000-1-paulius.zaleckas@gmail.com>
References: <20261016153533.3701000-1-paulius.zaleckas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the coefficient count, the TMP_CFG startup value and the IIO device
name into a per-chip structure, passed through the I2C and ACPI match
data. This prepares for the Zilltek ZTS8032, which has two more
coefficients and a different TMP_CFG layout.

No functional change.

Assisted-by: LLM
Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 drivers/iio/pressure/dps310.c | 36 +++++++++++++++++++++++++++--------
 1 file changed, 28 insertions(+), 8 deletions(-)

diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index 1d0b3232db9e..f2a8698e1e30 100644
--- a/drivers/iio/pressure/dps310.c
+++ b/drivers/iio/pressure/dps310.c
@@ -62,6 +62,9 @@
 #define DPS310_RESET		0x0c
 #define  DPS310_RESET_MAGIC	0x09
 #define DPS310_COEF_BASE	0x10
+#define DPS310_COEF_LEN		18
+
+#define MAX_COEF_LEN		18
 
 /* Make sure sleep time is <= 30ms for usleep_range */
 #define DPS310_POLL_SLEEP_US(t)		min(30000, (t) / 8)
@@ -86,10 +89,23 @@ static const int scale_factors[] = {
 	2088960,
 };
 
+struct dps310_chip_info {
+	const char *name;
+	u8 tmp_cfg;	/* TMP_CFG at startup: sensor the coefficients are for */
+	u8 coef_len;
+};
+
+static const struct dps310_chip_info dps310_chip_info = {
+	.name = "dps310",
+	.tmp_cfg = DPS310_TMP_EXT,
+	.coef_len = DPS310_COEF_LEN,
+};
+
 struct dps310_data {
 	struct i2c_client *client;
 	struct regmap *regmap;
 	struct mutex lock;	/* Lock for sequential HW access functions */
+	const struct dps310_chip_info *info;
 
 	s32 c0, c1;
 	s32 c00, c10, c20, c30, c01, c11, c21;
@@ -149,13 +165,13 @@ static const struct iio_chan_spec dps310_channels[] = {
 static int dps310_get_coefs(struct dps310_data *data)
 {
 	int rc;
-	u8 coef[18];
+	u8 coef[MAX_COEF_LEN];
 	u32 c0, c1;
 	u32 c00, c10, c20, c30, c01, c11, c21;
 
 	/* Read all sensor calibration coefficients from the COEF registers. */
 	rc = regmap_bulk_read(data->regmap, DPS310_COEF_BASE, coef,
-			      sizeof(coef));
+			      data->info->coef_len);
 	if (rc < 0)
 		return rc;
 
@@ -252,10 +268,10 @@ static int dps310_startup(struct dps310_data *data)
 		return rc;
 
 	/*
-	 * Set up external (MEMS) temperature sensor in single sample, one
-	 * measurement per second mode
+	 * Set up the temperature sensor the coefficients are for in single
+	 * sample, one measurement per second mode
 	 */
-	rc = regmap_write(data->regmap, DPS310_TMP_CFG, DPS310_TMP_EXT);
+	rc = regmap_write(data->regmap, DPS310_TMP_CFG, data->info->tmp_cfg);
 	if (rc)
 		return rc;
 
@@ -979,7 +995,11 @@ static int dps310_probe(struct i2c_client *client)
 	data->client = client;
 	mutex_init(&data->lock);
 
-	iio->name = DPS310_DEV_NAME;
+	data->info = i2c_get_match_data(client);
+	if (!data->info)
+		return -ENODATA;
+
+	iio->name = data->info->name;
 	iio->channels = dps310_channels;
 	iio->num_channels = ARRAY_SIZE(dps310_channels);
 	iio->info = &dps310_info;
@@ -1018,13 +1038,13 @@ static int dps310_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id dps310_id[] = {
-	{ .name = DPS310_DEV_NAME },
+	{ .name = "dps310", .driver_data = (kernel_ulong_t)&dps310_chip_info },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, dps310_id);
 
 static const struct acpi_device_id dps310_acpi_match[] = {
-	{ "IFX3100" },
+	{ .id = "IFX3100", .driver_data = (kernel_ulong_t)&dps310_chip_info },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, dps310_acpi_match);
-- 
2.55.0

