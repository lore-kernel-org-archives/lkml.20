Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A574ED197
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791890515; cv=none; b=ZGTFrPHwZ8fVIvnXB/1rESo0Ayth8AuyFaKqqhW7lvTI8y3Ltha0uBqHvS4j3yPPew4eD+M3/oArg50grvuXkNiXkiCbB3pAgijUWYjOIZPRUCGdcWirkANMW5HNlTOcl3i8+cv1YPImqH1l6QeKXAIS4eo3xkN9UcWNeIopxoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791890515; c=relaxed/simple;
	bh=PORQCIEb1meIMWwZwjyqyYApPHgHJQkfRo4Bm7PxMd0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MYSwJH3olkPT4PxTAel0+ylp1i93yIqXY3BF3fWSMZwW0QpuD1kMXhLVOEjshAINrdZFLUfmXm2w2B0QKIBCycXtHzxC3Ak/JVylwiQFp6OWSnWITy9WKidYzfz2VXoKwQN/o/AlBbesa87MKmb60PQ7IWaTujBLcOMMfbFfV/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CawLYsez; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CawLYsez"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5bcb1f1358aso1895341e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 04:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791890509; x=1792495309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HdB4o2VSACwWE9ohOEzKPVPVDc5/vqu6bZ3fvhwm0Xg=;
        b=CawLYsezVS9MpWvPz1gj1F8rRtrwNgwSX5sJTQeZE4w49WxuNif1YPi8F6o3UY3H8w
         JnBptkiM+xMqPVubYdrzJLhMvwsxS2I3KSn1/l9aQDeoRYWSBF2E8hf7zmO41Ds+7tFR
         JsPVyW0otlU0tu7kzXLdn5aKaUDIpcC3N++FAmNaJ0v71Ogt8eQ0oS4w4qleAa1vuyDI
         6QmAHu8tpFj4BfjaxQ/J5rMO5X5ru2hEa/URPip+MDZRDNpZ1Nn9AnwDTsC7PzT1YsHR
         6Jk0kAVl2wzeGljZowmuH3h76hJY5RyvncubZGSMpUYIGLEdjtaeJFy6F6Y31tfUf85R
         9M9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791890509; x=1792495309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HdB4o2VSACwWE9ohOEzKPVPVDc5/vqu6bZ3fvhwm0Xg=;
        b=gAHhLQSTBElUE7IhXHjLVuU6WvsjzrzjnJOlGt2yn0Xx8UWRXvn18oeeJ0i1xYMiNY
         oGxd6ZAZkKajezH3VaMofbsZUeL/DAgjj9UPlK9nZp6qCm+qKmHMhgmnlDtFQE9pDhc9
         +FTLalDtHlcq7F2/2CmfLZPATKGnZ7JMDseaJLrUjZv54oLn5czAGm/VQH+4HspEfox+
         D3djVkZjF1XUK5nPb5gOHJrN/LS7AEyzmmUMDpGYyBtJblI9MF8OyX+2tcrfvSYD1dP6
         OoGLKxJcoa41pNnGemZBXxkUHQYuW3CbQc0vPswy96wPnHuV2C+JrGvNHqifjufQCmRJ
         t1jA==
X-Forwarded-Encrypted: i=1; AKwUvBwmNpZUz1xfrLH8GXEVlAou1pVnPvv46B+OHH80+qlbJdwzRSAIfeBkDJLCNCbUYPOZKx0ZNEmOUSxIjfQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIMuwsvteRY7FrVwCoCszopc1UaoZVliEirmR43MwuEMDvRhYIB
	W67o8pWYFtWtjqGqoHPzixFI9XU41gPYUlB4DMay4wIoCH7NetfBrLuR
X-Gm-Gg: AYBFou3E0tlwYc+1vmWhH3pp8DUQ+uhIGvWnc9+pusuCOye1uioCF+eiXzHw8pxlmIS
	U/ZZhQMNrGrm+n7MmqBkNuat1oFCvTTOKqWLNW33uVrwseadLEk0g0XQqTyLrmHy3AJ9i72U3k1
	kqL9qed88gRQ5GukNZMZEbOp2JXcJBSO6ixzVfWJqk9l42SxYiNqgclMb7XD71Cz5I8/YK3wV4M
	xCfA7WmKuVFGSDWI9Wa5qLy/HTkP8cdACKjeBPk3yEaJC08aygE/mnyGF9HzaTAkR6Kjaf5tpq/
	k42PNfLdmH8df4f1wHyg5Nj0A9nJE6IPiOCkggtXTNgkdKw0Gs3LiF5bqtgI37ohLr3R+bR/ihe
	B/04Q4ol5fw9uMJvNMLW8ZCmNFBgHgKFSVtlj5Lbate6ZhlVfzUSheqoSdg8dEBfIxB70L35nHG
	4HyFUJdzMThOgQt0t/nuHi2lbcDl+2+yJ4UXjsMVJ0dLOhttIkv215uP8qfskjU+ARyfUPj0Ia+
	AaLydv9zDAjk+Gvp+2L1ECZTEC/I1CbHdYSHWsbOEYDppUzoYROGO+fHYG4jYyUpzIkepKiW783
	kdBORPZUmk0qyuhXIbAa1a+xuHk=
X-Received: by 2002:a05:6512:3045:b0:5bc:bb39:1b2b with SMTP id 2adb3069b0e04-5bcde8c1e35mr4217997e87.50.1791890508824;
        Tue, 13 Oct 2026 04:21:48 -0700 (PDT)
Received: from M-K2012N0113010.localdomain ([88.119.128.229])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcf8a3970asm1116148e87.79.2026.10.13.04.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 04:21:48 -0700 (PDT)
From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	linux-iio@vger.kernel.org
Cc: Eddie James <eajames@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rupesh Majhi <zoone.rupert@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paulius Zaleckas <paulius.zaleckas@gmail.com>
Subject: [PATCH v2 4/6] iio: pressure: dps310: add per-chip data
Date: Tue, 13 Oct 2026 14:21:22 +0300
Message-ID: <20261013112124.1878296-5-paulius.zaleckas@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261013112124.1878296-1-paulius.zaleckas@gmail.com>
References: <20261013112124.1878296-1-paulius.zaleckas@gmail.com>
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
Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 drivers/iio/pressure/dps310.c | 34 ++++++++++++++++++++++++++--------
 1 file changed, 26 insertions(+), 8 deletions(-)

diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index 3bc690cc8609..0d558edff5ab 100644
--- a/drivers/iio/pressure/dps310.c
+++ b/drivers/iio/pressure/dps310.c
@@ -61,6 +61,7 @@
 #define DPS310_RESET		0x0c
 #define  DPS310_RESET_MAGIC	0x09
 #define DPS310_COEF_BASE	0x10
+#define DPS310_COEF_LEN		18
 
 /* Make sure sleep time is <= 30ms for usleep_range */
 #define DPS310_POLL_SLEEP_US(t)		min(30000, (t) / 8)
@@ -85,10 +86,23 @@ static const int scale_factors[] = {
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
@@ -148,13 +162,13 @@ static const struct iio_chan_spec dps310_channels[] = {
 static int dps310_get_coefs(struct dps310_data *data)
 {
 	int rc;
-	u8 coef[18];
+	u8 coef[DPS310_COEF_LEN];
 	u32 c0, c1;
 	u32 c00, c10, c20, c30, c01, c11, c21;
 
 	/* Read all sensor calibration coefficients from the COEF registers. */
 	rc = regmap_bulk_read(data->regmap, DPS310_COEF_BASE, coef,
-			      sizeof(coef));
+			      data->info->coef_len);
 	if (rc < 0)
 		return rc;
 
@@ -251,10 +265,10 @@ static int dps310_startup(struct dps310_data *data)
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
 
@@ -983,7 +997,11 @@ static int dps310_probe(struct i2c_client *client)
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
@@ -1022,13 +1040,13 @@ static int dps310_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id dps310_id[] = {
-	{ .name = DPS310_DEV_NAME },
+	{ .name = "dps310", .driver_data = (kernel_ulong_t)&dps310_chip_info },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, dps310_id);
 
 static const struct acpi_device_id dps310_acpi_match[] = {
-	{ "IFX3100" },
+	{ "IFX3100", (kernel_ulong_t)&dps310_chip_info },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, dps310_acpi_match);
-- 
2.55.0

