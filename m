Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1A248F83B
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788781733; cv=none; b=Q6cfVBYFbS5rYiDa4Llst6l++oN4aGh+QCOFBgRETmkBXvfKR0G8QDVPuN1j9v8UjUK28MFavWmBACxuSenZftxTZhI5CBK0k5isVQ/Jr/VoQqts/rv9sct3jYVZbyeLhl8nNMEKSyiPenG0teQTsXD5GeVIdXruT6xoGZ0S7SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788781733; c=relaxed/simple;
	bh=QCLyoNALvtQOVUWWgKT4N38ewa9Qau0InNlSI5vyyo0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iL4wGBaO6HPXhOMmtrEcBuaLDsd2+AomDRtU3m8vHHq2uat2C9ozOVu5uoMURaXQSqEDjOWoyvxBYyftuo33yaDnN7yRFkxoygMo5Yx8gY8429s3RjzJo2rmkQf5prGhajpeNaEtp4bjhiUaU9K+KahVgk7ZuyqyyHy58LpECvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZL48wZOp; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZL48wZOp"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48444ec4fe2so2070221f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 04:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788781729; x=1789386529; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yRwhjp/IBhSw3Lk79MEayOHDigt6p4gE2z38qX/b6Cc=;
        b=ZL48wZOpti3aynBPWpPGynZI2qgKLY0zNS1fUFpcLIQglS6snJUPC4zfv2/wc3jXis
         3lb6IMLraiECt495MBm2vxbS7UI5hSpsQBrplJQXtohBmDJg+NXSOpCdKrscuP2eB9zD
         FaLr3nhMF269NK2VxFdDkJoy55ISpS/ie9o3s96bTCBGn+hvd76+Itl67qYzEYXjhXO4
         DGIX/h9uFH8jdlBVeXbFkI7IVSDwt3C21TSSuNUwan2fT8zYPUNnBTK+TMdI6NlZbn9C
         zlwCBAwBSakxKKhKHUzEJFLqioyY4TuYlNjSe/XAbu2Oha5CBbK/8qyYe3PuKFQMkhMG
         oqig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788781729; x=1789386529;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yRwhjp/IBhSw3Lk79MEayOHDigt6p4gE2z38qX/b6Cc=;
        b=LL94gLwcBHhTnZvftQqFWiTt+lEquXFJaEPDbGnHW2XOohdCRYfxWW3ZlrT4ESzjCy
         tgAkN3Y+QH9e4ScpXW7WM6s6Lg49rqOucxlq15b8XwUIS/VWDdwpu+hefbg0XUOGlfe3
         L4NY/dLQj26ooLot2D9XMLWhSTK4QT84ALnswUhpylAi1I6MKiP5IvSk0BZytUFrRiaO
         c2vXiIZHDCwwr9U9je+QwlZw/vlS4mkWP/Jq7dGCrAGOzugTWcJv3r+WlJCQTZl6lZLw
         RzsNLSYmh93xZS7OeOod1t+MBUEqMid3e10mkgG0NiZdKzVSVX1pzYJyzT7cR9LzAPXG
         Dbwg==
X-Forwarded-Encrypted: i=1; AKwUvBxA5mRK32tP/ypAvNY/EtaMrsba+/EItot6jlsXpC5dm4IiN+38O4b/iMR4+qQdMHdHhC6nA8TxhQDcndM=@vger.kernel.org
X-Gm-Message-State: AFuF++lFK0ApFTPDGguDv0DLQ7IajipPbX54Ent3PAc0p2V32m7863F6
	pvOnd9M+WFOhShxjA2ysv0zmYpfTBhe4pxfXUvYmEZPPrEBXiiCkxFQO
X-Gm-Gg: AYBFou2UjWYjLyVk8idNrZ/uQ3KxTmCymJhNonp1nIG34Guc8TY2bvwzFuZoLcNZE29
	WjRfSqJr7RYTP/PKidRh19fOAVBJCTEEh3e9PGaIk0dQADBbWrG8wMV1TeZNGGeUdbhfPUV2R50
	Omm9uM0UE10HMDhWc7rZzzz/YYo1VaIBGBTuuhwC/xvZlDkHkiia2mZ5hPDHAsDfOqFsesxT0jI
	3J8js1r4s3ujZSKdAJWerudZPzR2PG2QsqD6OGqd9mzdSdND4f7GGDiNrOW9ExuDL0L+xPM3yN1
	AQPXIx2mDL4FDLIZ+Q/QiJLf/Zenu+aQdtvXxnu6q+aUQwe8cm5HKR/CY8+3t6YoPY7vC6HyIql
	/dD7mt5Cdn4qwAwwChU8JLm4O6xH4CE+Eh0NbcIqZHEXSe07z7+g16jy+8Tgrq/1SMMdvvG0GoK
	1ZFAb0oe0zn2ODgdMbFDdLWNEF2GwjEFTI27xnbn+5OWoMHylDbvA1aBDeDExFYTpEHlSAd7/6Y
	axKgoL9UCZa064=
X-Received: by 2002:a05:6000:4819:b0:482:fc30:a1b4 with SMTP id ffacd0b85a97d-4858704686dmr48239266f8f.5.1788781729120;
        Mon, 07 Sep 2026 04:48:49 -0700 (PDT)
Received: from [127.0.1.1] ([2001:4bb8:178:2f30:d3da:48f5:116c:5642])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c5bc5sm29597421f8f.24.2026.09.07.04.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:48:48 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Mon, 07 Sep 2026 13:48:41 +0200
Subject: [PATCH v9 3/4] iio: light: veml6031x00: add support for triggered
 buffers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-veml6031x00-v9-3-8c93a6c66a4d@gmail.com>
References: <20260907-veml6031x00-v9-0-8c93a6c66a4d@gmail.com>
In-Reply-To: <20260907-veml6031x00-v9-0-8c93a6c66a4d@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
 Jonathan Cameron <jic23@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788781720; l=6221;
 i=javier.carrasco.cruz@gmail.com; s=20260111; h=from:subject:message-id;
 bh=QCLyoNALvtQOVUWWgKT4N38ewa9Qau0InNlSI5vyyo0=;
 b=Cbv5IaFVrWUqYWfX5NlAodENPaTLkLKbIgwak6PVWJ1L3B6K4pmUQWMKbME3NXvqwpArEsdWj
 bqb9dxGO7puA9S72MnCGxXkWLRFXO04tIDd3oGcJYYLQX9Hiqg2SI5s
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=Lge8w8xidNSf/INy7JAIbAW+Hezkp3nsBh2OjKL7lLU=

Add triggered buffer functionality for the two channels the device
provides (ALS and IR).

Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/iio/light/Kconfig       |   2 +
 drivers/iio/light/veml6031x00.c | 113 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 115 insertions(+)

diff --git a/drivers/iio/light/Kconfig b/drivers/iio/light/Kconfig
index 02291abeff60..462fff1ddef2 100644
--- a/drivers/iio/light/Kconfig
+++ b/drivers/iio/light/Kconfig
@@ -745,6 +745,8 @@ config VEML6031X00
 	tristate "VEML6031X00 ambient light sensor series"
 	select REGMAP_I2C
 	select IIO_GTS_HELPER
+	select IIO_BUFFER
+	select IIO_TRIGGERED_BUFFER
 	depends on I2C
 	help
 	  Say Y here if you want to build a driver for the Vishay VEML6031X00
diff --git a/drivers/iio/light/veml6031x00.c b/drivers/iio/light/veml6031x00.c
index f3772577a05d..3d5a27a0baae 100644
--- a/drivers/iio/light/veml6031x00.c
+++ b/drivers/iio/light/veml6031x00.c
@@ -13,6 +13,7 @@
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/i2c.h>
+#include <linux/interrupt.h>
 #include <linux/limits.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
@@ -25,6 +26,8 @@
 
 #include <linux/iio/iio.h>
 #include <linux/iio/iio-gts-helper.h>
+#include <linux/iio/triggered_buffer.h>
+#include <linux/iio/trigger_consumer.h>
 
 /* Device registers */
 #define VEML6031X00_REG_CONF0       0x00
@@ -42,6 +45,12 @@
 
 #define VEML6031X00_GAIN_SEL(pd_div4, gain) (((pd_div4) << 2) | (gain))
 
+enum veml6031x00_scan {
+	VEML6031X00_SCAN_ALS,
+	VEML6031X00_SCAN_IR,
+	VEML6031X00_SCAN_TIMESTAMP,
+};
+
 struct veml6031x00_rf {
 	struct regmap_field *gain;
 	struct regmap_field *it;
@@ -135,6 +144,13 @@ static const struct iio_chan_spec veml6031x00_channels[] = {
 				      BIT(IIO_CHAN_INFO_SCALE),
 		.info_mask_separate_available = BIT(IIO_CHAN_INFO_INT_TIME) |
 						BIT(IIO_CHAN_INFO_SCALE),
+		.scan_index = VEML6031X00_SCAN_ALS,
+		.scan_type = {
+			.format = IIO_SCAN_FORMAT_UNSIGNED_INT,
+			.realbits = 16,
+			.storagebits = 16,
+			.endianness = IIO_LE,
+		},
 	},
 	{
 		.type = IIO_INTENSITY,
@@ -142,7 +158,15 @@ static const struct iio_chan_spec veml6031x00_channels[] = {
 		.modified = 1,
 		.channel2 = IIO_MOD_LIGHT_IR,
 		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),
+		.scan_index = VEML6031X00_SCAN_IR,
+		.scan_type = {
+			.format = IIO_SCAN_FORMAT_UNSIGNED_INT,
+			.realbits = 16,
+			.storagebits = 16,
+			.endianness = IIO_LE,
+		},
 	},
+	IIO_CHAN_SOFT_TIMESTAMP(VEML6031X00_SCAN_TIMESTAMP),
 };
 
 static const struct regmap_range veml6031x00_readable_ranges[] = {
@@ -390,6 +414,10 @@ static int veml6031x00_single_read(struct iio_dev *iio, enum iio_chan_type type,
 		return -EINVAL;
 	}
 
+	IIO_DEV_ACQUIRE_DIRECT_MODE(iio, claim);
+	if (IIO_DEV_ACQUIRE_FAILED(claim))
+		return -EBUSY;
+
 	guard(mutex)(&data->scale_lock);
 
 	PM_RUNTIME_ACQUIRE_AUTOSUSPEND(regmap_get_device(data->regmap), pm);
@@ -453,6 +481,10 @@ static int veml6031x00_write_raw(struct iio_dev *iio,
 				 struct iio_chan_spec const *chan,
 				 int val, int val2, long mask)
 {
+	IIO_DEV_ACQUIRE_DIRECT_MODE(iio, claim);
+	if (IIO_DEV_ACQUIRE_FAILED(claim))
+		return -EBUSY;
+
 	switch (mask) {
 	case IIO_CHAN_INFO_INT_TIME:
 		return veml6031x00_set_it(iio, val, val2);
@@ -484,6 +516,80 @@ static const struct iio_info veml6031x00_info = {
 	.write_raw_get_fmt = veml6031x00_write_raw_get_fmt,
 };
 
+static int veml6031x00_buffer_preenable(struct iio_dev *iio)
+{
+	struct veml6031x00_data *data = iio_priv(iio);
+	struct device *dev = regmap_get_device(data->regmap);
+	int ret, it_usec;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		return ret;
+
+	ret = veml6031x00_get_it(data, &it_usec);
+	if (ret < 0) {
+		pm_runtime_put_autosuspend(dev);
+		return ret;
+	}
+
+	/*
+	 * Wait one integration period + 10% margin so the first triggered
+	 * read does not race with the sensor completing its first conversion
+	 * after power-on.
+	 */
+	fsleep(it_usec + (it_usec / 10));
+
+	return 0;
+}
+
+static int veml6031x00_buffer_postdisable(struct iio_dev *iio)
+{
+	struct veml6031x00_data *data = iio_priv(iio);
+
+	pm_runtime_put_autosuspend(regmap_get_device(data->regmap));
+
+	return 0;
+}
+
+static const struct iio_buffer_setup_ops veml6031x00_buffer_setup_ops = {
+	.preenable = veml6031x00_buffer_preenable,
+	.postdisable = veml6031x00_buffer_postdisable,
+};
+
+static irqreturn_t veml6031x00_trig_handler(int irq, void *p)
+{
+	struct iio_poll_func *pf = p;
+	struct iio_dev *iio = pf->indio_dev;
+	struct veml6031x00_data *data = iio_priv(iio);
+	struct regmap *map = data->regmap;
+	IIO_DECLARE_BUFFER_WITH_TS(__le16, scan, 2) = { };
+	unsigned int i;
+	int ch, ret;
+
+	if (test_bit(VEML6031X00_SCAN_ALS, iio->active_scan_mask) &&
+	    test_bit(VEML6031X00_SCAN_IR, iio->active_scan_mask)) {
+		ret = regmap_bulk_read(map, VEML6031X00_REG_ALS_L,
+				       scan, 2 * sizeof(*scan));
+		if (ret)
+			goto done;
+	} else {
+		i = 0;
+		iio_for_each_active_channel(iio, ch) {
+			ret = regmap_bulk_read(map, iio->channels[ch].address,
+					       &scan[i++], sizeof(*scan));
+			if (ret)
+				goto done;
+		}
+	}
+
+	iio_push_to_buffers_with_ts(iio, scan, sizeof(scan), pf->timestamp);
+
+done:
+	iio_trigger_notify_done(iio->trig);
+
+	return IRQ_HANDLED;
+}
+
 static int veml6031x00_validate_part_id(struct veml6031x00_data *data)
 {
 	struct regmap *map = data->regmap;
@@ -573,6 +679,13 @@ static int veml6031x00_probe(struct i2c_client *i2c)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to init IIO GTS\n");
 
+	ret = devm_iio_triggered_buffer_setup(dev, iio,
+					      iio_pollfunc_store_time,
+					      veml6031x00_trig_handler,
+					      &veml6031x00_buffer_setup_ops);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to register triggered buffer\n");
+
 	ret = devm_iio_device_register(dev, iio);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to register IIO device\n");

-- 
2.43.0

