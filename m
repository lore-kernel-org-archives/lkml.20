Received: from mail-pz2-f31.google.com (mail-pz2-f31.google.com [74.125.228.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3915C51B161
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790788379; cv=none; b=RgGX0s5/J1CIDRq2MRHqmXONhEzY+1RBKne+zTkeqZDv+oSvzKtwGAhNEF1vWI1G6dK2bNb9mUx26YT2O3TdbGLff5rhKZM28yA/NJQ+xEIZbJKnWX8ZoITDiwyrJAvw0yjpjndc0ZlZVYowhZEA8s2/OoMl9L712u+M/Yo1vcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790788379; c=relaxed/simple;
	bh=0WyjQ+EZUsUcqfNeOlxL3H7OfrO2zGvmDdfhd9wFSfM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DoGQ8pih/XUFAzp49+PlN0bS9gj//RfgtkyTXgTXccjGU7wvhuRdtX0OHaR89sUxhhv7X192HpaxREfD9qSd55rB5wWKaInGbVpKkRFZA8eYTmx/u4x/I5u2kHZVcPmyqOo3c7iqwzSP0QYP/eaKz51h8bvE5T5UwgIwg6C2LGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aWQlyvkX; arc=none smtp.client-ip=74.125.228.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aWQlyvkX"
Received: by mail-pz2-f31.google.com with SMTP id 41be03b00d2f7-cc7d7111700so478523a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790788377; x=1791393177; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P3gkqcJf9G0KUXQZxMjMRnR74+ZlcVG13gmjvfAtmwI=;
        b=aWQlyvkXio/0UABDqT7yD9aV1mrXxyE8iTppvZq/GTHY6eA7ArTjXKGQ4QPgTSaqhP
         zB8bCUk21I0eheukr7SMnWydt1xUvcNHJkibLzU1723iiFEyZaGC7x11GJTOQBKv9k8B
         /JB4t9D8qdjqJ0/7u23RuP0JkyFaATroa0/9/GIT5I/RMM/4mvGkRB7EErXauF6ELG7j
         hbRmruHOx6Eg11ureO5wVoJwP2AZF99NqqAcX5gM2a61V1rxsiiBXCG90bQlKJFMi2O1
         vOm1reyhSTWQb8EpnLa/Hn5nDVlWKqlILssp4ahDT9fOegkX0J1pm4VWlN8NvphcAuVZ
         PV9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790788377; x=1791393177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P3gkqcJf9G0KUXQZxMjMRnR74+ZlcVG13gmjvfAtmwI=;
        b=LrotvVgmVP5N4Fn7CgXyq68xBEsEmiJMgfQ6qKNojsXegofwzc1039P5q7ShcspSlm
         enrFlmhP8BN6+2nG5we1zX9aGCC8Ohq4EHRsgE0BCJrxEuDAJWps7V1sduGXlKT+9SSQ
         tOgVvRwfQHdk8zvjGCYQO8SbUnHoeDIl0cYC5Z3ous3CVKDN7bMhHf4Q2dmqKpo5h7O3
         TOExuqywuQVI4EZeGFBR6JGgFoFJ3v6ACnvbhBrzAbJBUYA2EjZmY4X8hzRytmV3xgIb
         emoLyhiAz5yPKsf3JLHCZIq2+YW5NsYwPUF01TI4c2bD9AUCe5sKgC6bUAt6ZuTl//sL
         qK4A==
X-Forwarded-Encrypted: i=1; AKwUvBzVNqY2YAqHqj+khsj/tZ3Gte9uWnMS+OOVqgggQyb2W8Yl2oSm8hFawpn6Pd6aeZFVlLpfRu/95iSL+qU=@vger.kernel.org
X-Gm-Message-State: AFuF++mNftqLzPhDLfrLx5R/2Dd5rSrRHeHYT1BP1YSJ5xsh8CEHQIWB
	emyMVLqONMcnQhCMMG+edahUZe/79GL63Y9t4UjZSlmlXiuWxIh39z/k
X-Gm-Gg: AYBFou2VQzCLHMp/bhB6rTHZtpoO21V5qVMvEKHAHO5FWi4V1Pua+QlF4HhH8s9c2Cm
	qmlZLFmlTTXBfgKIXBIHm6VTBZh3Ph2fMCyj4s4A6W9M6s4/5FR8ZcvoDEMckX6velI9jWq/pK6
	epS+zcNwbCc93qbDQ1nqvOyv7lQ724oibrBHGnLliis1OOqO7bmOBexkd2cEBBYROOKuk7WHm68
	q0Clyc8WWtxh32Zte08D5FXjEqSCOyFEajdnvHkvzVJYuB0dcNQnpUPo2TpFlU6izF/kkohc1Bz
	uJjatEevuUVKitKR40osnCWrT8CQIaU2hVJItnkVj9jcP812vVjR9woJIESi1Dr32Q2+PWvwvJt
	xLFZwbML8smqJSiG7JxULW9198UIlOBi7mUvsIZMZY5IIGcqRIKVBSFhLUR2NK2HqqbS+Yd71U2
	8+B+QJGG0busq3VL9LxBM1Vh7zOu1XvTVQrpzM3/KmKaA2xqdxPlhIZc2s20MQYLGhn+o6KkpF/
	z3tlY8g/erzc1TfSOMeKT7sh+lkEiXnjxd7PQIMZ7vcaBY6cA==
X-Received: by 2002:a05:6a21:492:b0:3de:6046:1e39 with SMTP id adf61e73a8af0-3de9e88de66mr2147141637.59.1790788377417;
        Wed, 30 Sep 2026 10:12:57 -0700 (PDT)
Received: from debian.ari ([152.58.182.146])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-887bc2bd404sm636872b3a.46.2026.09.30.10.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 10:12:57 -0700 (PDT)
From: Archit Anant <architanant5@gmail.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com,
	andy@kernel.org,
	nuno.sa@analog.com,
	u.kleine-koenig@baylibre.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Archit Anant <architanant5@gmail.com>
Subject: [PATCH v5 09/10] iio: adc: ti-ads1015: inline ads1015_set_conv_mode()
Date: Wed, 30 Sep 2026 22:42:03 +0530
Message-Id: <20260930171204.12863-10-architanant5@gmail.com>
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
 drivers/iio/adc/ti-ads1015.c | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/iio/adc/ti-ads1015.c b/drivers/iio/adc/ti-ads1015.c
index 9312822218df..2e8f89d16586 100644
--- a/drivers/iio/adc/ti-ads1015.c
+++ b/drivers/iio/adc/ti-ads1015.c
@@ -744,6 +744,7 @@ static int ads1015_enable_event_config(struct ads1015_data *data,
 static int ads1015_disable_event_config(struct ads1015_data *data,
 	const struct iio_chan_spec *chan, int comp_mode)
 {
+	struct regmap *map = data->regmap;
 	int ret;
 
 	if (!ads1015_event_channel_enabled(data))
@@ -756,7 +757,7 @@ static int ads1015_disable_event_config(struct ads1015_data *data,
 			comp_mode == ADS1015_CFG_COMP_MODE_WINDOW)
 		return 0;
 
-	ret = regmap_update_bits(data->regmap, ADS1015_CFG_REG,
+	ret = regmap_update_bits(map, ADS1015_CFG_REG,
 				ADS1015_CFG_COMP_QUE_MASK,
 				ADS1015_CFG_COMP_DISABLE <<
 					ADS1015_CFG_COMP_QUE_SHIFT);
@@ -921,19 +922,16 @@ static void ads1015_get_channels_config(struct i2c_client *client)
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
+	ret = regmap_update_bits(map, ADS1015_CFG_REG,
+				 ADS1015_CFG_MOD_MASK,
+				 ADS1015_SINGLESHOT << ADS1015_CFG_MOD_SHIFT);
+
 	if (ret)
 		dev_warn(regmap_get_device(data->regmap),
 			 "Failed to power down (%pe)\n", ERR_PTR(ret));
@@ -1036,7 +1034,9 @@ static int ads1015_probe(struct i2c_client *client)
 			return ret;
 	}
 
-	ret = ads1015_set_conv_mode(data, ADS1015_CONTINUOUS);
+	ret = regmap_update_bits(data->regmap, ADS1015_CFG_REG,
+				 ADS1015_CFG_MOD_MASK,
+				 ADS1015_CONTINUOUS << ADS1015_CFG_MOD_SHIFT);
 	if (ret)
 		return ret;
 
@@ -1059,17 +1059,23 @@ static int ads1015_runtime_suspend(struct device *dev)
 {
 	struct iio_dev *indio_dev = i2c_get_clientdata(to_i2c_client(dev));
 	struct ads1015_data *data = iio_priv(indio_dev);
+	struct regmap *map = data->regmap;
 
-	return ads1015_set_conv_mode(data, ADS1015_SINGLESHOT);
+	return regmap_update_bits(map, ADS1015_CFG_REG,
+				  ADS1015_CFG_MOD_MASK,
+				  ADS1015_SINGLESHOT << ADS1015_CFG_MOD_SHIFT);
 }
 
 static int ads1015_runtime_resume(struct device *dev)
 {
 	struct iio_dev *indio_dev = i2c_get_clientdata(to_i2c_client(dev));
 	struct ads1015_data *data = iio_priv(indio_dev);
+	struct regmap *map = data->regmap;
 	int ret;
 
-	ret = ads1015_set_conv_mode(data, ADS1015_CONTINUOUS);
+	ret = regmap_update_bits(map, ADS1015_CFG_REG,
+				 ADS1015_CFG_MOD_MASK,
+				 ADS1015_CONTINUOUS << ADS1015_CFG_MOD_SHIFT);
 	if (!ret)
 		data->conv_invalid = true;
 
-- 
2.39.5

