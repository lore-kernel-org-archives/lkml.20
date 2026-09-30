Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850B951D50F
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790788383; cv=none; b=K+QcnopFz80N9ZAVGFuKzVZ7ji00NOGFL2t9EFfbrtgv3O2yk9aDawimJxYY2pFavfqwWEhL7O+f+jPQ4f5MPpjld4Aq+nr//lbmY65Up3hxIMmhmTwAvnykEzXuzq9b9PzG7Rwe/bl7D0IuweqlCbcH1qQoInk84QnlUxv5dHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790788383; c=relaxed/simple;
	bh=hMX+oIIb55Cf3VNQseh7iXz0EyGuzALvNmlUogjFbfE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KXTBnkqvASps/YHzGnwZv3Zyq2yX3FSfvwHt8AAM7JKJV3Fjz6G6V5Wo2vSmKmdjuN3QCsj/nFBuYwbIgPVvGTd/yB+ARCDljRmr/nc5QPhf1ZoH1qFuRhsKkWPKrHuSCXiaLn026f0V0D0iVXzmgaERQfMW1qbUpSjWuEUYmZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AkOwk7d+; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AkOwk7d+"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc797656e5eso2786383a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790788382; x=1791393182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vp5xSWFJYyxfXZazr8hT5EWtXkbpTX2kBymGREXyXiU=;
        b=AkOwk7d+prmfMIouCXT5ZnsR77wjOheXJ8mXOnIR0e5Orjx6EVwaMJjzuZaE00xAD3
         YrlAWtBXfQhZEfVZOarM/yYZp9TmOfwq04i7Ym4ObZkZ9aUszHIgfitINGGw6PPFTsEv
         oBF6YKgKOFkBJSs1KdVNq2C9fZJD9eGbDH9CA/YA2xSmHAqQG7/vON/jujJFiMI78pkn
         RGGATUb74gFneVRey6mK4X1njxdPle8GmrzYrbwtTMS+FPnIaw1TuJvwWL3+ywYqgM5q
         0KGZ/zlxrSl3d2o0omtrpWqJkQafcB5hbup/882pvlALxNU9/d0ldk6UuUw9YG/AasDN
         KlkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790788382; x=1791393182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vp5xSWFJYyxfXZazr8hT5EWtXkbpTX2kBymGREXyXiU=;
        b=ZEeHGRKll/VsbzqhzINwATZIUAlfZaAgXClcYVjLCGnDxGXITFy6b+voc63kfXOfMZ
         rD5v0T6VyabmwJdElBkpajXhYdCUpMwz3gb6cndC8c8rlU/SZfM8/nsWasVP1lPG8QEU
         3XBJiKvyDYxjms4ISLOFuzZL6NZo2b3+Wt30FTEYRhaGrcZQcQU+88+x9//ei7Id/gYt
         1A/wkf1/sA6etafilMdTf6rv9J1eruOYIKM3w8DycP4LvsEmklnRBpIJN/pwd6FYSueD
         VhSVCxbhilG7V6110o3tbDf0216Hbd8FEayY8e/YpkELnnKzLJ+APlrWX3DTPeEciNGR
         1OEw==
X-Forwarded-Encrypted: i=1; AKwUvBy8zVXA9umeKwC64IFJ8zIZ17Oe9tgZo6CVsn+8X+onIMazE8UWIn7bNIBGzDaOr6OalLAIoHw7kakLpXs=@vger.kernel.org
X-Gm-Message-State: AFuF++ksaq7RwrJDJNtlEiIlkKpRd5+jVn/pyvWyBWzsEUkxH/AcmRjA
	c7SvQAp3yhGRbDMXUofjdVkozSCsMPn1asDuoI9iXap85MEM1L9/pECc
X-Gm-Gg: AYBFou0La7dYH+rcf0pken3+DShUTwqnGXwx8AU44RX2hq/eoCc7vEoNs9RlUDYFZuF
	i004kHy4zDerzRhgugRCDxIBuMEzumYSBRIZ3bCM+HHoIVKD5mGhk7CkRxbrH23QrVW+2y7JbZl
	QQDhotkEc3Gopw8JP7QkmHV3pU/3AdQWHicO5X+p11u8zfH2eJPL11EdSablKR3P9TbVovJBB2J
	Cxq9cpE0LGKx30g4aNE/t+lTI1QWE2EqD0J5fxu/P5thDIFkQmlt/OtAnfg0f0QM5YacZQtDkLG
	v5mEzCAPfY88NgetqlNKhboSK/W8IPpSI3MV584Peu8DAQNGEVLMkZ+FVOpraAkwCpEkwmIcvUR
	BfcHAHf40Xp9XZiDFlsStfGiACIEVzcX1mWfvYfFNksuVV5FT8ngGeCZ6dZQjj9ebdWPo4XilTz
	IyB1qk7skJ789Wm9leKtcba9KCrgKOWc/0VCiyHPG3ny1glpj9/EQa/weHbrz0TMuzJFNUiSN6M
	ed+sbH1c3C2BN8vBthq7hEj7q7N1ZinPu++532bTFt+RffrpA==
X-Received: by 2002:a05:6a00:c494:b0:888:71e:1694 with SMTP id d2e1a72fcca58-888071e1ffdmr75791b3a.8.1790788381640;
        Wed, 30 Sep 2026 10:13:01 -0700 (PDT)
Received: from debian.ari ([152.58.182.146])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-887bc2bd404sm636872b3a.46.2026.09.30.10.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 10:13:01 -0700 (PDT)
From: Archit Anant <architanant5@gmail.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com,
	andy@kernel.org,
	nuno.sa@analog.com,
	u.kleine-koenig@baylibre.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Archit Anant <architanant5@gmail.com>
Subject: [PATCH v5 10/10] iio: adc: ti-ads1015: replace custom shift macros with FIELD_PREP/GET
Date: Wed, 30 Sep 2026 22:42:04 +0530
Message-Id: <20260930171204.12863-11-architanant5@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260930171204.12863-1-architanant5@gmail.com>
References: <20260930171204.12863-1-architanant5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver currently uses custom _SHIFT macros and manual bitwise
operations to read and write to the configuration register.

Modernize the bitwise logic by replacing all manual shifts with the
standard FIELD_PREP() and FIELD_GET() macros from <linux/bitfield.h>.
This improves readability and prevents potential bitwise errors.

Remove the now-unused _SHIFT macros from the top of the file.

Suggested-by: Jonathan Cameron <jic23@kernel.org>
Signed-off-by: Archit Anant <architanant5@gmail.com>
---
 drivers/iio/adc/ti-ads1015.c | 68 ++++++++++++++++--------------------
 1 file changed, 30 insertions(+), 38 deletions(-)

diff --git a/drivers/iio/adc/ti-ads1015.c b/drivers/iio/adc/ti-ads1015.c
index 2e8f89d16586..cf94e9e6a6d2 100644
--- a/drivers/iio/adc/ti-ads1015.c
+++ b/drivers/iio/adc/ti-ads1015.c
@@ -11,6 +11,7 @@
  *	* 0x4B - ADDR connected to SCL
  */
 
+#include <linux/bitfield.h>
 #include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/i2c.h>
@@ -39,15 +40,6 @@
 #define ADS1015_LO_THRESH_REG	0x02
 #define ADS1015_HI_THRESH_REG	0x03
 
-#define ADS1015_CFG_COMP_QUE_SHIFT	0
-#define ADS1015_CFG_COMP_LAT_SHIFT	2
-#define ADS1015_CFG_COMP_POL_SHIFT	3
-#define ADS1015_CFG_COMP_MODE_SHIFT	4
-#define ADS1015_CFG_DR_SHIFT	5
-#define ADS1015_CFG_MOD_SHIFT	8
-#define ADS1015_CFG_PGA_SHIFT	9
-#define ADS1015_CFG_MUX_SHIFT	12
-
 #define ADS1015_CFG_COMP_QUE_MASK	GENMASK(1, 0)
 #define ADS1015_CFG_COMP_LAT_MASK	BIT(2)
 #define ADS1015_CFG_COMP_POL_MASK	BIT(3)
@@ -408,15 +400,16 @@ int ads1015_get_adc_result(struct ads1015_data *data, int chan, int *val)
 	dr = data->channel_data[chan].data_rate;
 	mask = ADS1015_CFG_MUX_MASK | ADS1015_CFG_PGA_MASK |
 		ADS1015_CFG_DR_MASK;
-	cfg = chan << ADS1015_CFG_MUX_SHIFT | pga << ADS1015_CFG_PGA_SHIFT |
-		dr << ADS1015_CFG_DR_SHIFT;
+	cfg = FIELD_PREP(ADS1015_CFG_MUX_MASK, chan) |
+	      FIELD_PREP(ADS1015_CFG_PGA_MASK, pga) |
+	      FIELD_PREP(ADS1015_CFG_DR_MASK, dr);
 
 	if (ads1015_event_channel_enabled(data)) {
 		mask |= ADS1015_CFG_COMP_QUE_MASK | ADS1015_CFG_COMP_MODE_MASK;
-		cfg |= data->thresh_data[chan].comp_queue <<
-				ADS1015_CFG_COMP_QUE_SHIFT |
-			data->comp_mode <<
-				ADS1015_CFG_COMP_MODE_SHIFT;
+		cfg |= FIELD_PREP(ADS1015_CFG_COMP_QUE_MASK,
+				  data->thresh_data[chan].comp_queue) |
+		       FIELD_PREP(ADS1015_CFG_COMP_MODE_MASK,
+				  data->comp_mode);
 	}
 
 	cfg = (old & ~mask) | (cfg & mask);
@@ -427,7 +420,7 @@ int ads1015_get_adc_result(struct ads1015_data *data, int chan, int *val)
 		data->conv_invalid = true;
 	}
 	if (data->conv_invalid) {
-		dr_old = (old & ADS1015_CFG_DR_MASK) >> ADS1015_CFG_DR_SHIFT;
+		dr_old = FIELD_GET(ADS1015_CFG_DR_MASK, old);
 		conv_time = DIV_ROUND_UP(USEC_PER_SEC, data_rate[dr_old]);
 		conv_time += DIV_ROUND_UP(USEC_PER_SEC, data_rate[dr]);
 		conv_time += conv_time / 10; /* 10% internal clock inaccuracy */
@@ -745,6 +738,7 @@ static int ads1015_disable_event_config(struct ads1015_data *data,
 	const struct iio_chan_spec *chan, int comp_mode)
 {
 	struct regmap *map = data->regmap;
+	unsigned int val;
 	int ret;
 
 	if (!ads1015_event_channel_enabled(data))
@@ -757,10 +751,8 @@ static int ads1015_disable_event_config(struct ads1015_data *data,
 			comp_mode == ADS1015_CFG_COMP_MODE_WINDOW)
 		return 0;
 
-	ret = regmap_update_bits(map, ADS1015_CFG_REG,
-				ADS1015_CFG_COMP_QUE_MASK,
-				ADS1015_CFG_COMP_DISABLE <<
-					ADS1015_CFG_COMP_QUE_SHIFT);
+	val = FIELD_PREP(ADS1015_CFG_COMP_QUE_MASK, ADS1015_CFG_COMP_DISABLE);
+	ret = regmap_update_bits(map, ADS1015_CFG_REG, ADS1015_CFG_COMP_QUE_MASK, val);
 	if (ret)
 		return ret;
 
@@ -926,11 +918,11 @@ static void ads1015_power_down(void *p)
 {
 	struct ads1015_data *data = p;
 	struct regmap *map = data->regmap;
+	unsigned int val;
 	int ret;
 
-	ret = regmap_update_bits(map, ADS1015_CFG_REG,
-				 ADS1015_CFG_MOD_MASK,
-				 ADS1015_SINGLESHOT << ADS1015_CFG_MOD_SHIFT);
+	val = FIELD_PREP(ADS1015_CFG_MOD_MASK, ADS1015_SINGLESHOT);
+	ret = regmap_update_bits(map, ADS1015_CFG_REG, ADS1015_CFG_MOD_MASK, val);
 
 	if (ret)
 		dev_warn(regmap_get_device(data->regmap),
@@ -943,6 +935,7 @@ static int ads1015_probe(struct i2c_client *client)
 	struct device *dev = &client->dev;
 	struct iio_dev *indio_dev;
 	struct ads1015_data *data;
+	unsigned int cfg_mode;
 	int ret;
 	int i;
 
@@ -1003,19 +996,19 @@ static int ads1015_probe(struct i2c_client *client)
 		unsigned int cfg_comp_mask = ADS1015_CFG_COMP_QUE_MASK |
 			ADS1015_CFG_COMP_LAT_MASK | ADS1015_CFG_COMP_POL_MASK;
 		unsigned int cfg_comp =
-			ADS1015_CFG_COMP_DISABLE << ADS1015_CFG_COMP_QUE_SHIFT |
-			1 << ADS1015_CFG_COMP_LAT_SHIFT;
+			FIELD_PREP(ADS1015_CFG_COMP_QUE_MASK, ADS1015_CFG_COMP_DISABLE) |
+			FIELD_PREP(ADS1015_CFG_COMP_LAT_MASK, 1);
 
 		switch (irq_trig) {
 		case IRQF_TRIGGER_FALLING:
 		case IRQF_TRIGGER_LOW:
-			cfg_comp |= ADS1015_CFG_COMP_POL_LOW <<
-					ADS1015_CFG_COMP_POL_SHIFT;
+			cfg_comp |= FIELD_PREP(ADS1015_CFG_COMP_POL_MASK,
+					       ADS1015_CFG_COMP_POL_LOW);
 			break;
 		case IRQF_TRIGGER_HIGH:
 		case IRQF_TRIGGER_RISING:
-			cfg_comp |= ADS1015_CFG_COMP_POL_HIGH <<
-					ADS1015_CFG_COMP_POL_SHIFT;
+			cfg_comp |= FIELD_PREP(ADS1015_CFG_COMP_POL_MASK,
+					       ADS1015_CFG_COMP_POL_HIGH);
 			break;
 		default:
 			return -EINVAL;
@@ -1034,9 +1027,8 @@ static int ads1015_probe(struct i2c_client *client)
 			return ret;
 	}
 
-	ret = regmap_update_bits(data->regmap, ADS1015_CFG_REG,
-				 ADS1015_CFG_MOD_MASK,
-				 ADS1015_CONTINUOUS << ADS1015_CFG_MOD_SHIFT);
+	cfg_mode = FIELD_PREP(ADS1015_CFG_MOD_MASK, ADS1015_CONTINUOUS);
+	ret = regmap_update_bits(data->regmap, ADS1015_CFG_REG, ADS1015_CFG_MOD_MASK, cfg_mode);
 	if (ret)
 		return ret;
 
@@ -1060,10 +1052,10 @@ static int ads1015_runtime_suspend(struct device *dev)
 	struct iio_dev *indio_dev = i2c_get_clientdata(to_i2c_client(dev));
 	struct ads1015_data *data = iio_priv(indio_dev);
 	struct regmap *map = data->regmap;
+	unsigned int val;
 
-	return regmap_update_bits(map, ADS1015_CFG_REG,
-				  ADS1015_CFG_MOD_MASK,
-				  ADS1015_SINGLESHOT << ADS1015_CFG_MOD_SHIFT);
+	val = FIELD_PREP(ADS1015_CFG_MOD_MASK, ADS1015_SINGLESHOT);
+	return regmap_update_bits(map, ADS1015_CFG_REG, ADS1015_CFG_MOD_MASK, val);
 }
 
 static int ads1015_runtime_resume(struct device *dev)
@@ -1071,11 +1063,11 @@ static int ads1015_runtime_resume(struct device *dev)
 	struct iio_dev *indio_dev = i2c_get_clientdata(to_i2c_client(dev));
 	struct ads1015_data *data = iio_priv(indio_dev);
 	struct regmap *map = data->regmap;
+	unsigned int val;
 	int ret;
 
-	ret = regmap_update_bits(map, ADS1015_CFG_REG,
-				 ADS1015_CFG_MOD_MASK,
-				 ADS1015_CONTINUOUS << ADS1015_CFG_MOD_SHIFT);
+	val = FIELD_PREP(ADS1015_CFG_MOD_MASK, ADS1015_CONTINUOUS);
+	ret = regmap_update_bits(map, ADS1015_CFG_REG, ADS1015_CFG_MOD_MASK, val);
 	if (!ret)
 		data->conv_invalid = true;
 
-- 
2.39.5

