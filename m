Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794731882;
	b=QKVJGYlaWu1VhW9zkeNmpNkj9sUo2T2q5eUotDBUjUjLs+1pVCFtGx2ILtzS/qEGYPJs
	 ob9zswRsjFOEq6nTcYphsHlvy+I1UEsQjNMSRuxr6MpM9QAAeJMbjU19cChbeZz3/00Wm
	 gDUji8Z3G4rz2+DVCRxe2ARUIdA7/Z5aZ1iSl1zbSdszvcS7WS3/6dLQHzDe524Awzedd
	 DVHKijvq+r60V6IqlldxK7eg2JhZAXCImdimbYTR8GttxMyEBT9+xTvYQksx/8WwMW2qN
	 ZtUK1S/zM7pcDVZhFCqGAcP3sYZ1gdovh7YYcjvFkvTNOk0pduQYr9k/5f5G1zt0UcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794731882;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wahMUn7lkVoWLk+//TfvQSoTRo4HIjxmomQS8JoF+OY=;
	b=J3T+Pa3DL/ionps3NK/3+NYTMMwsDZzsaueT1MY/j68DgfiF7CAIh7iWU1iC1gcGFB4d
	 qTrWA0HdmfcmyX62PKGuDZDrqXVgcl60MHe4G8GZ2Zloqusv7ihB8bz5L40KAHswmFxIk
	 qn+IP9skug2gL0fPOj0tNwL/xgNyHGi3L05qWnL8EKTLXpSkMvytFYu5oLhMWwyO78YXC
	 O9d8qrnbFEq2d0rPztSAGb3H3hUZyD1KYi2TOBcgpLYlFhPq6UpgVfe3j0Jfl6IlV7trJ
	 pZfPucFO3Dz93QQ0HkbTF5nso12+TjpBykyxNaG7RctiT+FA7h71LuWsWqSusl7t8oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MTfaI9aE;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5ABE606A893
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 08:38:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5ABE606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MTfaI9aE
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so377786566b.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 00:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794731880; x=1795336680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wahMUn7lkVoWLk+//TfvQSoTRo4HIjxmomQS8JoF+OY=;
        b=MTfaI9aEMF3OzLwQVnQbXB8NyMbTdlt3VND41vNLrCTmCfPF9BCy39d4WkJgLAeJOI
         2N9YmMo8KQZ9xzD+hZOfWSuWNaUtCzSbSJrxxHav11/L71i3grd6uZBVTP6yIPaXyvuq
         RCuyac7ucKuGafA1SPmrjFWUhICKaKuTSQVoJCv7HeYnJ9R9SYUobo9ib1cGcGUXPqjo
         plguW7aljmVl4kKihHq/n4dei3RdXe1gsodt7cHz8bnTT2HHtmWrmctSuBO/CXRiz3ai
         sDPew9ELe6H3Y0o7JIoxA2gFrOeC9V3fDENJZ1Te8KfwzZotDgsPsuXUtMmwBoSSmuB8
         IbSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794731880; x=1795336680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wahMUn7lkVoWLk+//TfvQSoTRo4HIjxmomQS8JoF+OY=;
        b=NYzjWjZ0LMaUM1ZvXMPhuCkflbXrInkiIhu0GOaTDLucNnilrFIZ08PzaMo6xQyRAb
         b5qSkRRQeeLPpVetU2J2+mcKxii6EU7h0fj/wGpiexHhw8HIM0Bqqj1aJXaxNC2h4m6L
         saUoIzXV4KDo0+x1k2IRw/z+/jpYBMFt6q7z6AALADKaXkICU2Sk0VkIBUDmzN10a9yH
         eGK52NWYJeX3Fo0k4o+RDi39Y1AKzfi6IoFMdPWIyJAnmEaX8tXBmNuezO79amcsdXkt
         /Lo6MmBRYSY9uIQfcK47HomfLSmK70I84/bakVj3XbOTgcw1AP/U5BExyQ3mgZg8vTTD
         18Tg==
X-Forwarded-Encrypted: i=1; AL+hErEFinzwHJb5sXnZLTkAtsFzuNguM2zw93G41I0z0x9vUiI8UmMYt/5ItMLP8Py/dzgQpwOUvpEOL3xRKU8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+9nsNo8wG/1xxw1ohfoyBiDnaExyKbIIOfodLUUzx3tNnnvQEX
	Vh71utGoYB5e/EK0ZONiuem7yEO0OeTETOQ30jZXbyBlb3GruI0T6UiO
X-Gm-Gg: AYBFou2/fOlr8iK+yLvkgdwp01MggmgzzNOtFN0Tbn7XIfob1XA/YVvgTe9/QYTUWXN
	KeCUZ27GM0G/5ECHB6nLszjjVeulmAIoqU/BevdUY5bEEsLGF6MvE2PwpgL13aE7RCBkqtqcsTG
	7XVD8iAKkk3VSrivVtH5BrxgpRa/6LN2+RRU3S5Yw3a+wYhbIM9mNLX7n+ODTQ8MYJiX/WqA78o
	7HVHjXS7iUp31AMLza6TWLfL7U2LVEhA3f8sxIkF6/KRCAZSIDjI3tSR/Lb6x2ceKDuACGDXh5X
	IbB1X6k366M+tIWnRcmVKxqJcLoyED5ODXcxPulA8+F7iotKQQ5ksrPJ8On7JXPVjuAkI2pu4ri
	W+Jfl/vVw7PttpmNLj/UVhK5FaDlOGo3ev29Txma1XVkDiFabH0lZHmrPoyhtJ1gndpFJsGqG4D
	Ya9sIf4tl+wgyUojSWT3JBl60AxMXzc/biHCHJo943DPVvD+3w2voZ5NaJkySfew3DAzr/19lRe
	ZInEg/1RAWC0lCmLVksyaXHOqLpt9uWK0q9ZprzQ2RHTMw06xC3S457Jmq2g4Xrs8zK9I7oqWmn
	LksZAS4aKn417xZN346Ik1MA0B4qrS/6++Sp7AjCu1vSqifhupO6TgPqK0eBvb4uayLM6RO9paw
	TlS/5gP/kmw==
X-Received: by 2002:a17:907:d10:b0:c4c:ddd1:cffa with SMTP id a640c23a62f3a-c5096398ae2mr615143166b.29.1794731880219;
        Sun, 15 Nov 2026 00:38:00 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5ad9esm284815666b.2.2026.11.15.00.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:37:59 -0800 (PST)
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
Subject: [PATCH v4 2/4] iio: light: ltr501: Switch to modern match mechanism
Date: Sun, 15 Nov 2026 10:37:39 +0200
Message-ID: <20261115083741.62140-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261115083741.62140-1-clamor95@gmail.com>
References: <20261115083741.62140-1-clamor95@gmail.com>
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

Preserve the iio_dev name configuration and replace the
iio_get_acpi_device_name_and_data() call with a simple dev_name(), since
the former is just a wrapper for the latter in this use case.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/iio/light/ltr501.c | 164 +++++++++++++++++--------------------
 1 file changed, 74 insertions(+), 90 deletions(-)

diff --git a/drivers/iio/light/ltr501.c b/drivers/iio/light/ltr501.c
index 3662aed5225bc..bf3cc32a55c3c 100644
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
@@ -1398,9 +1392,7 @@ static int ltr501_probe(struct i2c_client *client)
 	struct ltr501_data *data;
 	struct iio_dev *indio_dev;
 	struct regmap *regmap;
-	const void *ddata = NULL;
-	int partid, chip_idx;
-	const char *name;
+	int partid;
 	int j = 0;
 	int ret;
 
@@ -1481,18 +1473,10 @@ static int ltr501_probe(struct i2c_client *client)
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
 
@@ -1512,7 +1496,7 @@ static int ltr501_probe(struct i2c_client *client)
 	indio_dev->info = &ltr501_info;
 	indio_dev->channels = data->chip_info->channels;
 	indio_dev->num_channels = data->chip_info->no_channels;
-	indio_dev->name = name;
+	indio_dev->name = id ? id->name : dev_name(&client->dev);
 	indio_dev->modes = INDIO_DIRECT_MODE;
 
 	ret = ltr501_init(data);
@@ -1583,29 +1567,29 @@ static int ltr501_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(ltr501_pm_ops, ltr501_suspend, ltr501_resume);
 
 static const struct acpi_device_id ltr_acpi_match[] = {
-	{ .id = "LTER0301", .driver_data = ltr301 },
+	{ .id = "LTER0301", .driver_data = (kernel_ulong_t)&ltr301_chip_info_tbl },
 	/* https://www.catalog.update.microsoft.com/Search.aspx?q=lter0303 */
-	{ .id = "LTER0303", .driver_data = ltr303 },
+	{ .id = "LTER0303", .driver_data = (kernel_ulong_t)&ltr303_chip_info_tbl },
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

