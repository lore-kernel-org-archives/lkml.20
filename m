Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794243527;
	b=SL+ts8ZTDiI3jLyht/vk2p2AQAp1Z3izblp730bKbOpQvPAe2x8IslhB6dZOMfDf6iJ6
	 6tm58zLcZlg5+eDI/A79cPMAU/0wRo0hiBmhRFtWe8ZU+g30OUYqjYO2CA9A0iEoDdZPU
	 ovRKNGF3NrwthAHbnAJRPQSS1GYhO2Hgwxm8dCvG5sLxWxeQO9jvGMny2yv91G+6tTXET
	 0wuE7Adk+pMHpkcI2Jf/5GlyLLQ3bC6/B0k8EAQhhySzRgGdj/2vGqjW0hh27cXb8oljI
	 r9PJEhq+dRcPRpotDMauiX4GTDLG7LtuAUATls1WCKTMluCBDGC3b9wKGzNbMJljJnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243527;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8/HNQ5vYcgTpt1NwnhKJpNsJpmPigqkI4i1xzO0yhCg=;
	b=SBVOXMtaBbX0xa0N8d+icWB2Jv9xrjq69iZa+P2on4C/TfjI+cloNjZhkQXt6auKGHd8
	 MmDb20tIITkt9whiHjgp+oj2JejflqWsQA/jUpaaMTs7rsoqdJl7BJiMBNHE4532DAhi2
	 vtP2ZWDJvzsJhV+RZIwGWc3HUWkKKBNZijNGDphRvR+jMZuShjNfx0eTDtiYonSKSGssP
	 lgByJ1/rzXjWky7yy4+SBabAB94IbJ3dbunGJRchJD38ek9pkEIXb4ETEul1OX47P2lNe
	 ySLO09d1rLdgUEyV0Z6slslD/3Qpn89gNawzEq+JJj4n6kGhfXqCYK66f9vCsh37VNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F9PxNa02;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FA0606A893
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:58:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5FA0606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F9PxNa02
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b0d09df973so813866a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794243526; x=1794848326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8/HNQ5vYcgTpt1NwnhKJpNsJpmPigqkI4i1xzO0yhCg=;
        b=F9PxNa02IQYsdEPu/mDyLSJnDwZoSJn32tH+i4ySBoh4U8pdLcagmNFeTs2/k0cMGH
         AAXAVz/w0+8v890SDCsXJ/PBryG1I2icI1SuVfDAEjCchS+Ry1HwOp6czszb9kGKMVRP
         B6+yAuOtmBREQKgEVfMKRgu+KiM8oHoYqGsmA6PChF9agf2SrdRJd6tkpTnTU94BtTJe
         2teq1U6YGkK+v9bR6ePcfAo0Ld3qk1hmmSyWxqIoNoTBsKekazEJxrFvDqPuOnLcGQgT
         NtYm1K43scX15XAUD2pFLmHsSom+dz8R8FyaP+SoG3PVL3yHDHThM8jgyHzqxrMHle67
         Liig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794243526; x=1794848326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8/HNQ5vYcgTpt1NwnhKJpNsJpmPigqkI4i1xzO0yhCg=;
        b=VNWxLP3gBDBO+QE/1hxv0svu2QsH14OLch/IlNYubd/17rBK6SpgWQjPgacYxpaPJq
         3WetTItK3G9F8YlRKBwbiJGbdTt2qUCTNtPeYW2ewzqRjhN/kKXsEonk4SXxK+mRKywK
         XyuD02RDU+ZTdvzF8NsUX47vkgN9cqfxFssnuud9QefBUtzRu/4ghBHAYEnK6PG7MmoX
         CwfVGQz+OlHoZ5SFZyP8P5udqxSDRoVEPgx3YhY/scrJuLtbZkLto5jKSSDLxUv105BH
         CSCXTGwnB8rQU64D6sqQuCEcvmWjdcJv7WOon+MqP81MYtrSR/GFRWcbCZy3CcnisXPv
         b0KA==
X-Forwarded-Encrypted: i=1; AL+hErHNixtJIb0XvUflsQrXvrbsTBwsNa5tjrmr4MlgeORaNTo2xg8wfy8xbVvWyoKusxsW4tBzM48FGW6Ar0A=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hF1yXqYbAVn6ICN5WeMVgCHRSHIhS9hcjo/GCCDYp3aQBkWuR
	iSA1yp11pf9Uuzh6aVudUcYzRxx8zUA6TFkNkUpb+bTz9yrCAMpuZkl1
X-Gm-Gg: AYBFou3iW49+SlBPj3Jb0oSSbVlaHT2Ge/c3hhxYZ5j7AlxDcZwJtz7B2zhRfTRbeSh
	OukB/uKg6/bAD4gnbgNSFjGSmrKZHBjo1DGL3IphpKleCTJKvVcZ1a1rirBa0QfajlMVry76BhG
	6DLuovGuYTv0lOflcahbVo37CW88Lh0egfbWyDEhGsy95PpY1xFZrLNArHsvfvCi0BYJ1xrkxBo
	JEaw/5LLxSU0wgrv/VRcDej6hnmKMACbt14R+RnvGeAjoZdbhQYMAytfv6Vki/XfFRRXWzskN1U
	39hCv+KBVkytLHsIQZ1ldD1OS7vLNG6abQ1TOqUve8cSZPNSPZWUwXw23bbJGUSZB6JheCBFuEJ
	DPPXCuImn1vLMfP6pY0BolYIvGdBPx1G47OJJ8Zs6oX0uNxCO47fyE4lpL4cqVskiqBfmbx1NAg
	BCy43eRm65MgHGFxeZmQw3sn7H4xuNbBbMbxi7zJTm6iqBvW8jNSazURqh2Kq05f8I3y38lXgke
	iIOP3pP4Ex1217rQtwXdJ1pse0YT+NPv2wVEv4gJrXasMVxyNE8iErlNHbaVKv3GnO05ajjaR6X
	tyG21uXCxtJGz6dDHPBi8kz/WJfVMsfTAivFDz2Kc3NwY+0NfJPM7ujyc8AjipvugNNI5uDEubj
	Mdfqlomb6nEu/B+QZIXEgReearA==
X-Received: by 2002:a17:90b:1b0d:b0:3a8:9b79:e6ea with SMTP id 98e67ed59e1d1-3b166fd89a3mr183071a91.59.1794243525989;
        Mon, 09 Nov 2026 08:58:45 -0800 (PST)
Received: from debian.ari ([152.56.156.124])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16779cf05sm138766a91.3.2026.11.09.08.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:58:45 -0800 (PST)
From: Archit Anant <architanant5@gmail.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com,
	andy@kernel.org,
	nuno.sa@analog.com,
	u.kleine-koenig@baylibre.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	joshua.crofts1@gmail.com,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v6 11/11] iio: adc: ti-ads1015: Replace custom shift macros with FIELD_PREP/GET
Date: Mon,  9 Nov 2026 22:28:05 +0530
Message-Id: <20261109165805.31160-6-architanant5@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261109165805.31160-1-architanant5@gmail.com>
References: <20261109165805.31160-1-architanant5@gmail.com>
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

The driver currently uses custom _SHIFT macros and manual bitwise
operations to read and write to the configuration register.

Modernize the bitwise logic by replacing all manual shifts with the
standard FIELD_PREP() and FIELD_GET() macros from <linux/bitfield.h>.
This improves readability and prevents potential bitwise errors.

Remove the now-unused _SHIFT macros from the top of the file.

Suggested-by: Jonathan Cameron <jic23@kernel.org>
Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Archit Anant <architanant5@gmail.com>
---
 drivers/iio/adc/ti-ads1015.c | 79 ++++++++++++++++++++----------------
 1 file changed, 44 insertions(+), 35 deletions(-)

diff --git a/drivers/iio/adc/ti-ads1015.c b/drivers/iio/adc/ti-ads1015.c
index 2c3ba1b91aac4..8f7ec61314363 100644
--- a/drivers/iio/adc/ti-ads1015.c
+++ b/drivers/iio/adc/ti-ads1015.c
@@ -11,6 +11,7 @@
  *	* 0x4B - ADDR connected to SCL
  */
 
+#include <linux/bitfield.h>
 #include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/i2c.h>
@@ -38,15 +39,6 @@
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
@@ -382,17 +374,24 @@ int ads1015_get_adc_result(struct ads1015_data *data, int chan, int *val)
 
 	pga = data->channel_data[chan].pga;
 	dr = data->channel_data[chan].data_rate;
-	mask = ADS1015_CFG_MUX_MASK | ADS1015_CFG_PGA_MASK |
-		ADS1015_CFG_DR_MASK;
-	cfg = chan << ADS1015_CFG_MUX_SHIFT | pga << ADS1015_CFG_PGA_SHIFT |
-		dr << ADS1015_CFG_DR_SHIFT;
 
 	if (ads1015_event_channel_enabled(data)) {
-		mask |= ADS1015_CFG_COMP_QUE_MASK | ADS1015_CFG_COMP_MODE_MASK;
-		cfg |= data->thresh_data[chan].comp_queue <<
-				ADS1015_CFG_COMP_QUE_SHIFT |
-			data->comp_mode <<
-				ADS1015_CFG_COMP_MODE_SHIFT;
+		mask = ADS1015_CFG_COMP_QUE_MASK | ADS1015_CFG_COMP_MODE_MASK |
+		       ADS1015_CFG_MUX_MASK | ADS1015_CFG_PGA_MASK |
+		       ADS1015_CFG_DR_MASK;
+		cfg = FIELD_PREP(ADS1015_CFG_MUX_MASK, chan) |
+		      FIELD_PREP(ADS1015_CFG_PGA_MASK, pga) |
+		      FIELD_PREP(ADS1015_CFG_DR_MASK, dr) |
+		      FIELD_PREP(ADS1015_CFG_COMP_QUE_MASK,
+				 data->thresh_data[chan].comp_queue) |
+		      FIELD_PREP(ADS1015_CFG_COMP_MODE_MASK,
+				 data->comp_mode);
+	} else {
+		mask = ADS1015_CFG_MUX_MASK | ADS1015_CFG_PGA_MASK |
+			ADS1015_CFG_DR_MASK;
+		cfg = FIELD_PREP(ADS1015_CFG_MUX_MASK, chan) |
+		      FIELD_PREP(ADS1015_CFG_PGA_MASK, pga) |
+		      FIELD_PREP(ADS1015_CFG_DR_MASK, dr);
 	}
 
 	cfg = (old & ~mask) | (cfg & mask);
@@ -403,7 +402,7 @@ int ads1015_get_adc_result(struct ads1015_data *data, int chan, int *val)
 		data->conv_invalid = true;
 	}
 	if (data->conv_invalid) {
-		dr_old = (old & ADS1015_CFG_DR_MASK) >> ADS1015_CFG_DR_SHIFT;
+		dr_old = FIELD_GET(ADS1015_CFG_DR_MASK, old);
 		conv_time = DIV_ROUND_UP(USEC_PER_SEC, data_rate[dr_old]);
 		conv_time += DIV_ROUND_UP(USEC_PER_SEC, data_rate[dr]);
 		conv_time += conv_time / 10; /* 10% internal clock inaccuracy */
@@ -731,7 +730,9 @@ static int ads1015_enable_event_config(struct ads1015_data *data,
 static int ads1015_disable_event_config(struct ads1015_data *data,
 	const struct iio_chan_spec *chan, int comp_mode)
 {
-	struct device *dev = regmap_get_device(data->regmap);
+	struct regmap *map = data->regmap;
+	struct device *dev = regmap_get_device(map);
+	unsigned int val;
 	int ret;
 
 	if (!ads1015_event_channel_enabled(data))
@@ -744,10 +745,9 @@ static int ads1015_disable_event_config(struct ads1015_data *data,
 			comp_mode == ADS1015_CFG_COMP_MODE_WINDOW)
 		return 0;
 
-	ret = regmap_update_bits(data->regmap, ADS1015_CFG_REG,
-				ADS1015_CFG_COMP_QUE_MASK,
-				ADS1015_CFG_COMP_DISABLE <<
-					ADS1015_CFG_COMP_QUE_SHIFT);
+	val = FIELD_PREP(ADS1015_CFG_COMP_QUE_MASK, ADS1015_CFG_COMP_DISABLE);
+	ret = regmap_update_bits(map, ADS1015_CFG_REG,
+				 ADS1015_CFG_COMP_QUE_MASK, val);
 	if (ret)
 		return ret;
 
@@ -936,10 +936,12 @@ static void ads1015_power_down(void *p)
 {
 	struct ads1015_data *data = p;
 	struct regmap *map = data->regmap;
+	unsigned int val;
 	int ret;
 
-	ret = regmap_update_bits(map, ADS1015_CFG_REG, ADS1015_CFG_MOD_MASK,
-				 ADS1015_SINGLESHOT << ADS1015_CFG_MOD_SHIFT);
+	val = FIELD_PREP(ADS1015_CFG_MOD_MASK, ADS1015_SINGLESHOT);
+	ret = regmap_update_bits(map, ADS1015_CFG_REG,
+				 ADS1015_CFG_MOD_MASK, val);
 	if (ret)
 		dev_warn(regmap_get_device(map),
 			 "Failed to power down (%pe)\n", ERR_PTR(ret));
@@ -951,6 +953,7 @@ static int ads1015_probe(struct i2c_client *client)
 	struct device *dev = &client->dev;
 	struct iio_dev *indio_dev;
 	struct ads1015_data *data;
+	unsigned int cfg_mode;
 	struct regmap *map;
 	int ret;
 	int i;
@@ -1020,19 +1023,20 @@ static int ads1015_probe(struct i2c_client *client)
 		unsigned int cfg_comp_mask = ADS1015_CFG_COMP_QUE_MASK |
 			ADS1015_CFG_COMP_LAT_MASK | ADS1015_CFG_COMP_POL_MASK;
 		unsigned int cfg_comp =
-			ADS1015_CFG_COMP_DISABLE << ADS1015_CFG_COMP_QUE_SHIFT |
-			1 << ADS1015_CFG_COMP_LAT_SHIFT;
+			FIELD_PREP(ADS1015_CFG_COMP_QUE_MASK,
+				   ADS1015_CFG_COMP_DISABLE) |
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
@@ -1051,8 +1055,9 @@ static int ads1015_probe(struct i2c_client *client)
 			return ret;
 	}
 
+	cfg_mode = FIELD_PREP(ADS1015_CFG_MOD_MASK, ADS1015_CONTINUOUS);
 	ret = regmap_update_bits(map, ADS1015_CFG_REG, ADS1015_CFG_MOD_MASK,
-				 ADS1015_CONTINUOUS << ADS1015_CFG_MOD_SHIFT);
+				 cfg_mode);
 	if (ret)
 		return ret;
 
@@ -1076,9 +1081,11 @@ static int ads1015_runtime_suspend(struct device *dev)
 	struct iio_dev *indio_dev = i2c_get_clientdata(to_i2c_client(dev));
 	struct ads1015_data *data = iio_priv(indio_dev);
 	struct regmap *map = data->regmap;
+	unsigned int val;
 
+	val = FIELD_PREP(ADS1015_CFG_MOD_MASK, ADS1015_SINGLESHOT);
 	return regmap_update_bits(map, ADS1015_CFG_REG, ADS1015_CFG_MOD_MASK,
-				  ADS1015_SINGLESHOT << ADS1015_CFG_MOD_SHIFT);
+				  val);
 }
 
 static int ads1015_runtime_resume(struct device *dev)
@@ -1086,10 +1093,12 @@ static int ads1015_runtime_resume(struct device *dev)
 	struct iio_dev *indio_dev = i2c_get_clientdata(to_i2c_client(dev));
 	struct ads1015_data *data = iio_priv(indio_dev);
 	struct regmap *map = data->regmap;
+	unsigned int val;
 	int ret;
 
+	val = FIELD_PREP(ADS1015_CFG_MOD_MASK, ADS1015_CONTINUOUS);
 	ret = regmap_update_bits(map, ADS1015_CFG_REG, ADS1015_CFG_MOD_MASK,
-				 ADS1015_CONTINUOUS << ADS1015_CFG_MOD_SHIFT);
+				 val);
 	if (!ret)
 		data->conv_invalid = true;
 
-- 
2.39.5

