Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794131007;
	b=rQRhVmSz4TVoKcNV9MxnyZ3uX0Y8je8RIPNd3PwxfzH32JL0/hlE1yN2/q9Ym7wCeu03
	 IFrI3KC8dLFQVnTkBg9cgwlPlaGOlwleblxs+7RXHL0cERlMSkGZkms991MEjpm5KRHsV
	 5awAhSl33GHS2if3evyDGji2YfI9Y5oMof/agXBmD3YhZb+kAuu+AKZBIrkyG0aFj9BcU
	 BfeBShipiXo8W3yW8NJdqZWpk7Hvjh0aYabHmjlseFnWWO0c16/bAJ5WT8v1uIbND1+kM
	 9LS6OrT5p6iNCdZOEoNwA1eVt5lmtv2hxsPKlymU80a43fTN8ospI3D1PsLg5qN8NRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794131007;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ry/KcASImX2Qro/RekC3tlYb6nFcctVtkMKgMd6UWg8=;
	b=O1P7E5Lym33UsMlOpoPo0nrYwrOsOR/i/SxWdPknNsvl6e8dtsBKjGKL7OWSBmqVbhre
	 JDp4d34ZgG5neuPEMtNIAYHofzO118l4LWOYX6rK6Yd2A9TURhTM6tAzmirUf1MqZzY9V
	 VnRz1VIJGaGHEhori1yDBBIixuX6wQGDtRCnJpnZWO5e38mLgmS8j6WLv1uHHhwfSYC2P
	 eo55ovoyfgDuBVCz8rSUYsyFhrMBFP66+FsRkIYTecaHy2WQJscA0lOvFPU/R7kFCe/XJ
	 lVrqG91pDUyVwNBRAL3ZlyxM4jXUBmpc5iTr9JtaeZ6SuaUB5aInMbd95khUhW25MQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nQagUJ4p;
	arc=none smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1545A606A323
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 09:43:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1545A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nQagUJ4p
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b70d5b07faso15610a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 01:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794131004; x=1794735804; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ry/KcASImX2Qro/RekC3tlYb6nFcctVtkMKgMd6UWg8=;
        b=nQagUJ4pighTFDBSrqBc8msJxMU3ubpraesPMva19OsUN2TxmBsNKaZDlVAvtY/w7a
         lF4gyODLF6EfOZqFsi7kuzkiweqFxSOFXEcAYy/D8FBm4AP3wsBLF2mpBsUCSXe9eKLE
         pjaOCXIYmvpF7gmMqHRhMcGEh3ChC0wzZcZg10JuGECYcFcIlf9lyLPAeytmsYIrJ5Tu
         zzfHSD6ulS3/Ktj2UVFbzIBQ4qFdcKQIzL3nwpCEcxAGAf8DvnkyzPdv+IhwEiVVVfCW
         mRMaF4kXQ4F84vRvJY0GBep6QF8ayOgFs9Jr/U/7gihEaDeW8cwpKs34JsccY6XvwlqC
         4BEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794131004; x=1794735804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ry/KcASImX2Qro/RekC3tlYb6nFcctVtkMKgMd6UWg8=;
        b=rNpHP90UcYyW4Oq0tmT7iB9XDZIlFhBETAKFg+HDlvrvSfimApfH1dkQZct7oxt2RJ
         6D7edG33Ds4SLz2+cedn3Pz5alut6+7C7NEi4eEJ7vVP9cflFMENRYzlg1G8Tp11yuZJ
         e88gPzwvdFptZU93BIf+z0XU7/fV8MjixYIB8THX3r4J0WMSQJwRLs7/OhxDWLjJ3uR9
         Kkekd9dBlKR2TDolvhvwPlKySNlIQFxmMu0OQ9Ib1Cuw3LrzcZ0geUYY39KDmWxV3FYG
         SVr2BLhayApBhqenJxsJFUN+LGeJ4QHt4ADw6tUfjbw7fzCIQQ+Ho9dLQHMjDbLPRx+x
         Hr/w==
X-Forwarded-Encrypted: i=1; AL+hErGIBlBmT6iQwbij3oL/qT3satF4gMLhFr75LxjChq5NKiT8pbc0PIws6dxJmywF4Ig6/BmWf22xLN426LI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+q48WQSYiDPVbtPfH1i1bcVAZlhZnlvKC93fBvRR4ZMt3oO2Ij
	7d9rtVcqf/9Q+BlBWlLzEpx3y3sChzMi4c/3b5qy/Exowcw/gu6J1LuB
X-Gm-Gg: AYBFou1JvstgqVKTYOLrmGDxyF40x8vfBJtKCl5aAQsz5bV4IKtJ6fyNg8lCbTtAMTO
	GVi9wOHTsYNGExqYDkxfrTD6tbu++FdHiBgGqGLp+P9Lw0Tkb2S2hLkF/Y/peEHWTZTP9BlEn6L
	wGFM7CBGpEauDGybQwZinUK7mOu1aBK17vdP6dEvPm9ZIbZiT/o5UOUTBL4epXk8fHFak6uNj7F
	x0numZrAwLMYP5b8ZYQCXsUnMqVt0QnYwUKWDO2JzGJwJYy+lh6J321muj4Ebf2uhOZDQPbMGy9
	kGLcbTqcg8FylJcoyzeTcktkjvdRdFmOctj0PmQouaHBL5ud5eVz2WqOwAll6oGAw/B6tCfnziZ
	WZ8ODlOmVOkhBucViAQ1HHXK43Hzyv5v0zUcy1RwShix2uODcWhEgG2VwsbZNL5CMRhWxsxkH3g
	feFjyiPw2GP6S+RFNDU6cNMi7rsTZw6JdprAxcemZYN/JOQsMQqEA2/OZCDzKHkr9UK5OpyLd0z
	sRkTAx+eiLCY8WLu2vP4FVX+Wrw27uM0E7ElYUXnYBMvW15fd5Ipx3/DO0RjxeU7mBDKMgoEZ7l
	KM2y/MLpReeuVs9CzG1XyIiRekI8qEVwMpc7gikqoPeCxWCwS+YMwOlp5rtyrzwF4BFrswvUfLY
	4gWTxho6nHQ==
X-Received: by 2002:a05:6402:4486:b0:6af:a64f:bd44 with SMTP id 4fb4d7f45d1cf-6b722486333mr630783a12.45.1794131004175;
        Sun, 08 Nov 2026 01:43:24 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b721ea56f2sm436321a12.8.2026.11.08.01.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 01:43:21 -0800 (PST)
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
Subject: [PATCH v3 2/4] iio: light: ltr501: Switch to modern match mechanism
Date: Sun,  8 Nov 2026 11:42:51 +0200
Message-ID: <20261108094253.83899-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261108094253.83899-1-clamor95@gmail.com>
References: <20261108094253.83899-1-clamor95@gmail.com>
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
index 1ddd0dfd55ea2..ca6c8cffb4001 100644
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
@@ -1187,62 +1179,64 @@ static const struct iio_info ltr501_info = {
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
@@ -1407,9 +1401,7 @@ static int ltr501_probe(struct i2c_client *client)
 	struct ltr501_data *data;
 	struct iio_dev *indio_dev;
 	struct regmap *regmap;
-	const void *ddata = NULL;
-	int partid, chip_idx;
-	const char *name;
+	int partid;
 	int ret;
 
 	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*data));
@@ -1489,18 +1481,10 @@ static int ltr501_probe(struct i2c_client *client)
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
 
@@ -1511,7 +1495,7 @@ static int ltr501_probe(struct i2c_client *client)
 	indio_dev->info = &ltr501_info;
 	indio_dev->channels = data->chip_info->channels;
 	indio_dev->num_channels = data->chip_info->no_channels;
-	indio_dev->name = name;
+	indio_dev->name = id ? id->name : dev_name(&client->dev);
 	indio_dev->modes = INDIO_DIRECT_MODE;
 
 	ret = ltr501_init(data);
@@ -1582,29 +1566,29 @@ static int ltr501_resume(struct device *dev)
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

