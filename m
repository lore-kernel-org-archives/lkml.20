Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956816;
	b=mXFN6UXrE1h9oqUykhIXvxozUH1RfflCihb0IKwZJezbOQAR6zPk5GnG1zjQ/05uSQ/K
	 PqnfyRo7kXpDQl+cgBpomlDqyOFNn+dlFWak7k7o/6niThhdC3EXKbbnYW/k8c9cdudki
	 7fjv9D174y5CmuUEvZx1/6pV0Ft4TTA8M0Cq+XyagEP3yKhChcFoEUHKEypMcoapKlW8J
	 KUKr3o9hioNoQil253+CIJQbRBVf2un4IcCojl6TVJ01SLk/3V834MCL+QbVtm3zHfjdr
	 K051zukKogJbUOr5WMRGy1KF2FyJTepNPVd/3C4ZxZ+ZCCegmylfHJYxgNNfETfMbsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956816;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dZugLSOdu0FLGpp/MgQnmUnwUibKQyTiyxJla4Bqexo=;
	b=LrusIWDWqopm9FVsvfKvEXAiRQuv8nif/wAtsH0TpPp8ZKPCK3IaRlT76s6N3Y2t/8VE
	 2pTVrIOTyhb39rim2TirCtmrn837iP8BnzgCP27wotPOj1+cbmak0O3DKYJX89S40m29n
	 P5MUvIgZmOulOSvMlaaZVmrhStjl9B3zWNhrNZcK9w18tR91dGpJW7ThKZT0cFMnLHOIV
	 cNcwywDG6rMDWyw3rXHVdp4WINNhzVGgY8Gr7hb3T+wKgZ1RcMzSxaoT1MxUdKslCMDq9
	 Fa6IZYEmQ7NK3jr0Dyuxd7rCELfxnqLYk+/xbM6UVeCsFAbqa0Wwxlj5aPqR2l8RxIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sjn4V8kt;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0727F606EEAD
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:20:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0727F606EEAD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sjn4V8kt
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so2625765e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 01:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793956814; x=1794561614; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dZugLSOdu0FLGpp/MgQnmUnwUibKQyTiyxJla4Bqexo=;
        b=sjn4V8kty+ukrgxiKO05KJH0jk88LQaMbKl7/81iWghp9XfU8iZCmjAYrCWuGWms03
         k8PGWNlR3m9CYE/rcvfYZUAEiGP9GGfdq7t1xSlgZLXfoGzIiPOFmduFXNVjmVYQupKN
         ULTS6hJsS/el4aR+SPyu+7mVxu6PUkLO+8Ga5opDDEJYtUz78cKWEXe0yGOSk1YZnpaw
         EqDj4qRDO979FF6l/y8v4Lu09aza7mFEHrVn+QDOlQvn4JRDa8BcnQwrK7WXa1JlI1ne
         OJzUO6fYgCCW3mXs7tfEQ7FXTjJXRJ0pqBvpTAKgKlTd97PuVDSyf3502wUnjSch0l3i
         ZUVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793956814; x=1794561614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dZugLSOdu0FLGpp/MgQnmUnwUibKQyTiyxJla4Bqexo=;
        b=0/83FwjAQFWUqubKXlJZecW9NDLQuh3PWSUbEGxYTUduEFlnTUGlltJJ7qKplnCSeW
         EWTD4TBxk48tHm8urq9iCfnIBphQ+2/CfhmrVOYWfiGvB50HaYe1eY4U/y5gf76ny7HX
         r8uJ8AKRYUxpDh1kfjPArgK2ghkxu2RDAA8Qw8fNmdXXw8mcPLzYJeoBfM3lDHRJlXmH
         86kwU4C4rC7AvxJUWT6PrE0mowBJi6RZdAd2Ab53wEzJzGWeSOCQ4a3Joov9J57fTEbQ
         fcp0rrYdK1u7GoUuRn61sJlOtkBXXC6JkXWStPd8xNObgcIlFQJR6lhdQQNXPp1Q7DyV
         G+Lg==
X-Forwarded-Encrypted: i=1; AKwUvBxTtUJ5FI0nxBZnrz/r1NRiWw1UryZ0DH3SZHEzq4d0un6Xb9UY65bMnKN3RIY0GyGbHj3cL9nGTfgusYU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+owtqywDWzqTp7Uuo9Up6XO9hS6VJ9sjEKDCxLj3JcFJpR3Sm8
	R2ejxYU+ueJ5Z4LWR8rzGvA6WBtJqNqRR7vicXQ+oyZ+aF79pluB2Pq8
X-Gm-Gg: AYBFou1LcvmRSBP5z5oDtr4ONJf1Kpv5gsmJXveXAjzVcddMRptWHq1i7Kz0jJo8Qnv
	BUm5v8KDwGJroS3zNiqSnxWzyCf0inEzY+yyo/5SAYFMJ7yKKwXCuGzRIJIo66uoZnTs+aQRWzL
	XcNjFKM78XjYl46DlS/lBQkxGV/xIh7pRGxpzO/Godvc871mT1EmDiNN6Qg5jG0YwlNH4Rr8wl1
	7q21vqZmW81XcM2eYpRfchQqRfSDs27lqQCIYpnKNqBTTxE7kg4jB0PmsuBCOdTrwHic7hFLmZ+
	ocLikjaHPwz/PjOq81njcxfU49Ssl808EYN+ZEH01IvypOMXHRxPAVsCGQ350rNgZe/7pA6DtOn
	9PIPfTPRz7bWX9OQyHAhbMGX729/YOiLjv8K4eWdLlVOEOqj0e40mB0208dQL+HW2EAlKj3FaZh
	cDF5uZpoQ+2vaZsq7qA8Lm0W4JWFJLD5cHUinTMxtemCGrHbWbqIE+/RlOn1QM6Z/cuM6FRKjuq
	c022qNQ5yEqaMI61XfcgCISh25zCHE3PHv07C287CKx6j9SlJE9Lt55kRxySutyXH42JB1sUUs2
	t0KlMNMlSuajX6+DWUz2JBZSyyghqFYSmvtsp/wH0rxAsTO+oWnrARxG8iZxoFLFOjsygt3etBq
	cYl2qWqPkzQ==
X-Received: by 2002:a05:600c:3d05:b0:4a2:883:4adb with SMTP id 5b1f17b1804b1-4b6dfba86fbmr30238265e9.22.1793956814129;
        Fri, 06 Nov 2026 01:20:14 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b57203a98fsm108358935e9.4.2026.11.06.01.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:20:13 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Esben Haabendal <esben@geanix.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pan Chuang <panchuang@vivo.com>,
	Hemanth Selam <hemanth.selam@gmail.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Nikita Travkin <nikita@trvn.ru>
Cc: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] iio: light: ltr501: Switch to modern match mechanism
Date: Fri,  6 Nov 2026 11:19:41 +0200
Message-ID: <20261106091943.35783-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106091943.35783-1-clamor95@gmail.com>
References: <20261106091943.35783-1-clamor95@gmail.com>
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

Remove the chip enum, break the chip list structure into individual
elements, and pass each element using i2c_get_match_data().

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/iio/light/ltr501.c | 165 +++++++++++++++++--------------------
 1 file changed, 74 insertions(+), 91 deletions(-)

diff --git a/drivers/iio/light/ltr501.c b/drivers/iio/light/ltr501.c
index cc5d7af44d77c..d5ce6468a229b 100644
--- a/drivers/iio/light/ltr501.c
+++ b/drivers/iio/light/ltr501.c
@@ -90,14 +90,6 @@ struct ltr501_samp_table {
 
 #define LTR501_RESERVED_GAIN -1
 
-enum {
-	ltr301,
-	ltr303,
-	ltr329,
-	ltr501,
-	ltr559,
-};
-
 struct ltr501_gain {
 	int scale;
 	int uscale;
@@ -1178,62 +1170,64 @@ static const struct iio_info ltr501_info = {
 	.write_event_config = &ltr501_write_event_config,
 };
 
-static const struct ltr501_chip_info ltr501_chip_info_tbl[] = {
-	[ltr301] = {
-		.partid = 0x08,
-		.als_gain = ltr501_als_gain_tbl,
-		.als_gain_tbl_size = ARRAY_SIZE(ltr501_als_gain_tbl),
-		.als_mode_active = BIT(0) | BIT(1),
-		.als_gain_mask = BIT(3),
-		.als_gain_shift = 3,
-		.channels = ltr301_channels,
-		.no_channels = ARRAY_SIZE(ltr301_channels),
-	},
-	[ltr303] = {
-		.partid = 0x0A,
-		.als_gain = ltr559_als_gain_tbl,
-		.als_gain_tbl_size = ARRAY_SIZE(ltr559_als_gain_tbl),
-		.als_mode_active = BIT(0),
-		.als_gain_mask = BIT(2) | BIT(3) | BIT(4),
-		.als_gain_shift = 2,
-		.channels = ltr301_channels,
-		.no_channels = ARRAY_SIZE(ltr301_channels),
-	},
-	[ltr329] = {
-		.partid = 0x0A,
-		.als_gain = ltr559_als_gain_tbl,
-		.als_gain_tbl_size = ARRAY_SIZE(ltr559_als_gain_tbl),
-		.als_mode_active = BIT(0),
-		.als_gain_mask = BIT(2) | BIT(3) | BIT(4),
-		.als_gain_shift = 2,
-		.no_irq_support = true,
-		.channels = ltr301_channels,
-		.no_channels = ARRAY_SIZE(ltr301_channels),
-	},
-	[ltr501] = {
-		.partid = 0x08,
-		.als_gain = ltr501_als_gain_tbl,
-		.als_gain_tbl_size = ARRAY_SIZE(ltr501_als_gain_tbl),
-		.ps_gain = ltr501_ps_gain_tbl,
-		.ps_gain_tbl_size = ARRAY_SIZE(ltr501_ps_gain_tbl),
-		.als_mode_active = BIT(0) | BIT(1),
-		.als_gain_mask = BIT(3),
-		.als_gain_shift = 3,
-		.channels = ltr501_channels,
-		.no_channels = ARRAY_SIZE(ltr501_channels),
-	},
-	[ltr559] = {
-		.partid = 0x09,
-		.als_gain = ltr559_als_gain_tbl,
-		.als_gain_tbl_size = ARRAY_SIZE(ltr559_als_gain_tbl),
-		.ps_gain = ltr559_ps_gain_tbl,
-		.ps_gain_tbl_size = ARRAY_SIZE(ltr559_ps_gain_tbl),
-		.als_mode_active = BIT(0),
-		.als_gain_mask = BIT(2) | BIT(3) | BIT(4),
-		.als_gain_shift = 2,
-		.channels = ltr501_channels,
-		.no_channels = ARRAY_SIZE(ltr501_channels),
-	},
+static const struct ltr501_chip_info ltr301_chip_info_tbl = {
+	.partid = 0x08,
+	.als_gain = ltr501_als_gain_tbl,
+	.als_gain_tbl_size = ARRAY_SIZE(ltr501_als_gain_tbl),
+	.als_mode_active = BIT(0) | BIT(1),
+	.als_gain_mask = BIT(3),
+	.als_gain_shift = 3,
+	.channels = ltr301_channels,
+	.no_channels = ARRAY_SIZE(ltr301_channels),
+};
+
+static const struct ltr501_chip_info ltr303_chip_info_tbl = {
+	.partid = 0x0A,
+	.als_gain = ltr559_als_gain_tbl,
+	.als_gain_tbl_size = ARRAY_SIZE(ltr559_als_gain_tbl),
+	.als_mode_active = BIT(0),
+	.als_gain_mask = BIT(2) | BIT(3) | BIT(4),
+	.als_gain_shift = 2,
+	.channels = ltr301_channels,
+	.no_channels = ARRAY_SIZE(ltr301_channels),
+};
+
+static const struct ltr501_chip_info ltr329_chip_info_tbl = {
+	.partid = 0x0A,
+	.als_gain = ltr559_als_gain_tbl,
+	.als_gain_tbl_size = ARRAY_SIZE(ltr559_als_gain_tbl),
+	.als_mode_active = BIT(0),
+	.als_gain_mask = BIT(2) | BIT(3) | BIT(4),
+	.als_gain_shift = 2,
+	.no_irq_support = true,
+	.channels = ltr301_channels,
+	.no_channels = ARRAY_SIZE(ltr301_channels),
+};
+
+static const struct ltr501_chip_info ltr501_chip_info_tbl = {
+	.partid = 0x08,
+	.als_gain = ltr501_als_gain_tbl,
+	.als_gain_tbl_size = ARRAY_SIZE(ltr501_als_gain_tbl),
+	.ps_gain = ltr501_ps_gain_tbl,
+	.ps_gain_tbl_size = ARRAY_SIZE(ltr501_ps_gain_tbl),
+	.als_mode_active = BIT(0) | BIT(1),
+	.als_gain_mask = BIT(3),
+	.als_gain_shift = 3,
+	.channels = ltr501_channels,
+	.no_channels = ARRAY_SIZE(ltr501_channels),
+};
+
+static const struct ltr501_chip_info ltr559_chip_info_tbl = {
+	.partid = 0x09,
+	.als_gain = ltr559_als_gain_tbl,
+	.als_gain_tbl_size = ARRAY_SIZE(ltr559_als_gain_tbl),
+	.ps_gain = ltr559_ps_gain_tbl,
+	.ps_gain_tbl_size = ARRAY_SIZE(ltr559_ps_gain_tbl),
+	.als_mode_active = BIT(0),
+	.als_gain_mask = BIT(2) | BIT(3) | BIT(4),
+	.als_gain_shift = 2,
+	.channels = ltr501_channels,
+	.no_channels = ARRAY_SIZE(ltr501_channels),
 };
 
 static int ltr501_write_contr(struct ltr501_data *data, u8 als_val, u8 ps_val)
@@ -1393,14 +1387,11 @@ static int ltr501_powerdown(struct ltr501_data *data)
 
 static int ltr501_probe(struct i2c_client *client)
 {
-	const struct i2c_device_id *id = i2c_client_get_device_id(client);
 	static const char * const regulator_names[] = { "vdd", "vddio" };
 	struct ltr501_data *data;
 	struct iio_dev *indio_dev;
 	struct regmap *regmap;
-	const void *ddata = NULL;
-	int partid, chip_idx;
-	const char *name;
+	int partid;
 	int ret;
 
 	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*data));
@@ -1480,18 +1471,10 @@ static int ltr501_probe(struct i2c_client *client)
 	if (ret < 0)
 		return ret;
 
-	if (id) {
-		name = id->name;
-		chip_idx = id->driver_data;
-	} else {
-		name = iio_get_acpi_device_name_and_data(&client->dev, &ddata);
-		chip_idx = (intptr_t)ddata;
-	}
-	if (!name)
+	data->chip_info = i2c_get_match_data(client);
+	if (!data->chip_info)
 		return -ENODEV;
 
-	data->chip_info = &ltr501_chip_info_tbl[chip_idx];
-
 	if ((partid >> 4) != data->chip_info->partid)
 		return -ENODEV;
 
@@ -1502,7 +1485,7 @@ static int ltr501_probe(struct i2c_client *client)
 	indio_dev->info = &ltr501_info;
 	indio_dev->channels = data->chip_info->channels;
 	indio_dev->num_channels = data->chip_info->no_channels;
-	indio_dev->name = name;
+	indio_dev->name = client->name;
 	indio_dev->modes = INDIO_DIRECT_MODE;
 
 	ret = ltr501_init(data);
@@ -1573,29 +1556,29 @@ static int ltr501_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(ltr501_pm_ops, ltr501_suspend, ltr501_resume);
 
 static const struct acpi_device_id ltr_acpi_match[] = {
-	{ "LTER0301", ltr301 },
+	{ "LTER0301", .driver_data = (kernel_ulong_t)&ltr301_chip_info_tbl },
 	/* https://www.catalog.update.microsoft.com/Search.aspx?q=lter0303 */
-	{ "LTER0303", ltr303 },
+	{ "LTER0303", .driver_data = (kernel_ulong_t)&ltr303_chip_info_tbl },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, ltr_acpi_match);
 
 static const struct i2c_device_id ltr501_id[] = {
-	{ .name = "ltr301", .driver_data = ltr301 },
-	{ .name = "ltr303", .driver_data = ltr303 },
-	{ .name = "ltr329", .driver_data = ltr329 },
-	{ .name = "ltr501", .driver_data = ltr501 },
-	{ .name = "ltr559", .driver_data = ltr559 },
+	{ .name = "ltr301", .driver_data = (kernel_ulong_t)&ltr301_chip_info_tbl },
+	{ .name = "ltr303", .driver_data = (kernel_ulong_t)&ltr303_chip_info_tbl },
+	{ .name = "ltr329", .driver_data = (kernel_ulong_t)&ltr329_chip_info_tbl },
+	{ .name = "ltr501", .driver_data = (kernel_ulong_t)&ltr501_chip_info_tbl },
+	{ .name = "ltr559", .driver_data = (kernel_ulong_t)&ltr559_chip_info_tbl },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ltr501_id);
 
 static const struct of_device_id ltr501_of_match[] = {
-	{ .compatible = "liteon,ltr301", },
-	{ .compatible = "liteon,ltr303", },
-	{ .compatible = "liteon,ltr329", },
-	{ .compatible = "liteon,ltr501", },
-	{ .compatible = "liteon,ltr559", },
+	{ .compatible = "liteon,ltr301", .data = &ltr301_chip_info_tbl },
+	{ .compatible = "liteon,ltr303", .data = &ltr303_chip_info_tbl },
+	{ .compatible = "liteon,ltr329", .data = &ltr329_chip_info_tbl },
+	{ .compatible = "liteon,ltr501", .data = &ltr501_chip_info_tbl },
+	{ .compatible = "liteon,ltr559", .data = &ltr559_chip_info_tbl },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, ltr501_of_match);
-- 
2.53.0

