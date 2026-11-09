Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794243522;
	b=M9btMn9AcsuM6geXXbdmEkI75FI/4ApAVK3isJJIqic7wZbSE8miJpgEOm1GP0TUtEJS
	 QtJgQdCE+I5arMxvOq0P1EjIIt+ohc/xSc9VIr5UjGRpTCI4mhnZBkd4vZYYbF7h3fGew
	 NWXGzrmeMdM3blTovMhqa+BM3/QaTENI4O8U/blkvkWUCu22uj3IOvy6V8d8FtYxwCIMC
	 buXNiwCcihQtH+aZSUVf9u++DO37knGQsZRfNO5lXs+nQDEPGUeVK0xWnubL6QXUlWFRb
	 Viw0lmDn2kOzThWD+jR4dm2xyInx7sBOAQyHXXbjATFkU+i4lVmo+yVkQ4CTnNbSUNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243522;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8nH9XBvOrIjxAwP+5FR56uEJV1OKa47NfQAPenOGI40=;
	b=UhntXzs6yXYU7EiQezWyCwUGFVQLflZ8I8eDZ9jJJu9IFfOmniXfGfpJC0aB2tgomuy5
	 MU1owge4j5rZVybCaEfEe1/VjPV0vE22Z5gQcE6u6kKQNB2FvK7ermCrxf5XEDSPIGaR2
	 0LIBNOVprsQXBppL9BGobAl6ynJ3QTNJRj4OG+XP7HkveH+XQFojSDfFu1KtqhF7KFk+q
	 70kcHn/sNwfp6IxSUfmUqaXr2ErV7z+O+Puxe/66f0j1VBtC4Eht97h+hZR4ER2SuflJS
	 PtNGQDb6MPnvbe+dDvP1C87LcLi8kzhVDyAS0WaWJVy0gr4gFPcWims1Lo90iUa7UGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nYp+iQLk;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC95360A2608
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:58:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC95360A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nYp+iQLk
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b094e649d3so691984a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794243521; x=1794848321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8nH9XBvOrIjxAwP+5FR56uEJV1OKa47NfQAPenOGI40=;
        b=nYp+iQLk+Z56YW/HSJa2WSNMGSYOMBRrORWbn8n57fQlP3tflrj/nQJd8gsR5+xDfu
         u4cfQblbzxUy2vVt3GHNpXrVzExQig+33nDLbPCmQfgmoHDux01DFer3FF1NAbwTYq7E
         BV/d6K0GjstvnJLeIZTsLGlG8WJkFHZTzgIHqlPHKQCA7wBBcUY5JFfInSYFInohq52j
         57FEeZlprF5fpyaFTQxvlWzJ8IwT+17yG2VV6TzFDhISfdZSOP9jsU4oc1zt8Y1L6OJq
         j3HMdo2UbpZUiBVzvpMC9oHxgWg683aq0KDWdZp85dktNn1DclT2xaPlh1mX1FDP85jZ
         90sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794243521; x=1794848321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8nH9XBvOrIjxAwP+5FR56uEJV1OKa47NfQAPenOGI40=;
        b=jp+rwxfR/c84kYZuMnBPmv4OkkUQkLqv2Bd0g9mwSybOct8fpaxhOScuHrV7IOkxxc
         vs38ipmlUMtGhQqW0fNow3EC+I/TB/EJf3h76XA4rmo5gesZgoDAnCG6r3902TMLRA4T
         FX8QhXZG4wEGBHbPEbeomUiOBaS9TUIZkkNWV16RxO+Mlaa2Gm/tDYsCOXGp1pNdF1RV
         Z8Qe6jffMJG9B8XGJa6Si/0xLb4gcYrWlv1eKeWzxlaPERjEcTOh63hqz6SQtAGQvkBE
         GLgF8ZkpNOj6KBLzNL1ayKNCzIp8I6U5ombF6s2CqrZ5wvgjdbGDMdE9c5x2W+I1YlVb
         lyeQ==
X-Forwarded-Encrypted: i=1; AL+hErHQPcRX+rZOVB3wdiC9gd+VwppEQN0LTMZajz3184htdhMzfOuj0odIcXdbqjiS7gK8Nde6teVch1Ws2GM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Q4h/MgDl46hWn2m0NYgWbF1ggyednqXO25+K8SjXCD+379oCR
	xniDMKp264S4p29BwSZ6SP74vqC0mkm7rM0w55Bg07m0zL6HI4sRBdta
X-Gm-Gg: AYBFou0yyshC1r5pPxXNKTOAqYnUBuXsjqXpCctaDqMshDhc3v+03P5x6XPb63oQxSJ
	Zf6sxniBsvTEl/LsS+fKDxyvuiblJEFxO59zZZATZ4zuZAExcQMnMI3ek3oLRXckrGLFlf3ZJKe
	v5KUeQWpohTgBpdmAAovRkGbynroG5FckhU1fs46BIrS658fwVfCq8A1zHYFILFMJ11Oc6DnfBh
	9z9bySmKJfRADiQaULw/ePZ0W1bye5+dLHvvU7sQpNURJtNMPv1G5bEeY3MjfKgPgnFFukN17K9
	RSXYhSqWw7wnDO+BA765ELeY6LgqpZFvCyPM/GlvcjOtIrpxuGosJd+qqqk/3tau7n64LskSiIr
	JsptpXzXl3i31VACkJJ/O8CHOWcr9VfrshQJJ0bBDlVqwBeHv9tDViQUTU/R9ZokqWPn7hrYlQq
	weSHV0gc56jcbuRwSZSdiYNcs3Kt4dqDObPALjb6psTxzjtjF+HmkCBE/4rWrY0kOLF+TdSv/kk
	EAWHa7bO0CH+mu7LMV5zS9mNsDixp6glDf17LOHw4M6zpPROJOGTx5r33D2PUqFNM6fl+NQypWF
	Nup0VZylF9hBM9ygI8ndQLWNxOy/dI+i/6HsH9mJFC2HD6VUOhprREp0nJNNruap19Ixb+G6ueX
	+POy6V6NbtIC8fH6q32z00Xt3tg==
X-Received: by 2002:a17:90b:2b86:b0:3aa:fdad:7d6e with SMTP id 98e67ed59e1d1-3b166cc0430mr231963a91.10.1794243521079;
        Mon, 09 Nov 2026 08:58:41 -0800 (PST)
Received: from debian.ari ([152.56.156.124])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16779cf05sm138766a91.3.2026.11.09.08.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:58:40 -0800 (PST)
From: Archit Anant <architanant5@gmail.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com,
	andy@kernel.org,
	nuno.sa@analog.com,
	u.kleine-koenig@baylibre.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	joshua.crofts1@gmail.com
Subject: [PATCH v6 10/11] iio: adc: ti-ads1015: inline ads1015_set_conv_mode()
Date: Mon,  9 Nov 2026 22:28:04 +0530
Message-Id: <20261109165805.31160-5-architanant5@gmail.com>
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

The ads1015_set_conv_mode() helper function is a single-line wrapper
around regmap_update_bits().

Since the function is simple and only called during initialization and
power management state transitions, the wrapper is unnecessary. Remove
it and inline the regmap_update_bits() logic directly at the call sites
to improve code readability and traceabilty.

Where applicable, introduce a local 'map' pointer to keep the
inlined function calls concise.

Suggested-by: Jonathan Cameron <jic23@kernel.org>
Signed-off-by: Archit Anant <architanant5@gmail.com>
---
 drivers/iio/adc/ti-ads1015.c | 32 +++++++++++++++++---------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/drivers/iio/adc/ti-ads1015.c b/drivers/iio/adc/ti-ads1015.c
index 93a8318e950e2..2c3ba1b91aac4 100644
--- a/drivers/iio/adc/ti-ads1015.c
+++ b/drivers/iio/adc/ti-ads1015.c
@@ -932,21 +932,16 @@ static void ads1015_get_channels_config(struct i2c_client *client)
 	}
 }
 
-static int ads1015_set_conv_mode(struct ads1015_data *data, int mode)
-{
-	return regmap_update_bits(data->regmap, ADS1015_CFG_REG,
-				  ADS1015_CFG_MOD_MASK,
-				  mode << ADS1015_CFG_MOD_SHIFT);
-}
-
 static void ads1015_power_down(void *p)
 {
 	struct ads1015_data *data = p;
+	struct regmap *map = data->regmap;
 	int ret;
 
-	ret = ads1015_set_conv_mode(data, ADS1015_SINGLESHOT);
+	ret = regmap_update_bits(map, ADS1015_CFG_REG, ADS1015_CFG_MOD_MASK,
+				 ADS1015_SINGLESHOT << ADS1015_CFG_MOD_SHIFT);
 	if (ret)
-		dev_warn(regmap_get_device(data->regmap),
+		dev_warn(regmap_get_device(map),
 			 "Failed to power down (%pe)\n", ERR_PTR(ret));
 }
 
@@ -956,6 +951,7 @@ static int ads1015_probe(struct i2c_client *client)
 	struct device *dev = &client->dev;
 	struct iio_dev *indio_dev;
 	struct ads1015_data *data;
+	struct regmap *map;
 	int ret;
 	int i;
 
@@ -1007,8 +1003,9 @@ static int ads1015_probe(struct i2c_client *client)
 	data->regmap = devm_regmap_init_i2c(client, chip->has_comparator ?
 					    &ads1015_regmap_config :
 					    &tla2024_regmap_config);
-	if (IS_ERR(data->regmap))
-		return dev_err_probe(dev, PTR_ERR(data->regmap),
+	map = data->regmap;
+	if (IS_ERR(map))
+		return dev_err_probe(dev, PTR_ERR(map),
 				     "Failed to allocate register map\n");
 
 	ret = devm_iio_triggered_buffer_setup(dev, indio_dev, NULL,
@@ -1041,7 +1038,7 @@ static int ads1015_probe(struct i2c_client *client)
 			return -EINVAL;
 		}
 
-		ret = regmap_update_bits(data->regmap, ADS1015_CFG_REG,
+		ret = regmap_update_bits(map, ADS1015_CFG_REG,
 					cfg_comp_mask, cfg_comp);
 		if (ret)
 			return ret;
@@ -1054,7 +1051,8 @@ static int ads1015_probe(struct i2c_client *client)
 			return ret;
 	}
 
-	ret = ads1015_set_conv_mode(data, ADS1015_CONTINUOUS);
+	ret = regmap_update_bits(map, ADS1015_CFG_REG, ADS1015_CFG_MOD_MASK,
+				 ADS1015_CONTINUOUS << ADS1015_CFG_MOD_SHIFT);
 	if (ret)
 		return ret;
 
@@ -1077,17 +1075,21 @@ static int ads1015_runtime_suspend(struct device *dev)
 {
 	struct iio_dev *indio_dev = i2c_get_clientdata(to_i2c_client(dev));
 	struct ads1015_data *data = iio_priv(indio_dev);
+	struct regmap *map = data->regmap;
 
-	return ads1015_set_conv_mode(data, ADS1015_SINGLESHOT);
+	return regmap_update_bits(map, ADS1015_CFG_REG, ADS1015_CFG_MOD_MASK,
+				  ADS1015_SINGLESHOT << ADS1015_CFG_MOD_SHIFT);
 }
 
 static int ads1015_runtime_resume(struct device *dev)
 {
 	struct iio_dev *indio_dev = i2c_get_clientdata(to_i2c_client(dev));
 	struct ads1015_data *data = iio_priv(indio_dev);
+	struct regmap *map = data->regmap;
 	int ret;
 
-	ret = ads1015_set_conv_mode(data, ADS1015_CONTINUOUS);
+	ret = regmap_update_bits(map, ADS1015_CFG_REG, ADS1015_CFG_MOD_MASK,
+				 ADS1015_CONTINUOUS << ADS1015_CFG_MOD_SHIFT);
 	if (!ret)
 		data->conv_invalid = true;
 
-- 
2.39.5

