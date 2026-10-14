Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C9A49B1F3
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791969091; cv=none; b=Bm0fROw5B8mW4O2SnLNvyehXgB9qbgw0HG9H90W8V/7VRlywapuWAhdNTk993sbvQA45fNqjze2Z55no1z4ALxCM1BvOQ8PkFyx//HlDI5cSoQ+RAplsi18WPSkLx9S+zyaolWUqgZylxs+/qqSFriuPwp6z7LK/Qw2JVYpn75E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791969091; c=relaxed/simple;
	bh=nAu7LIZANKaIdRP2tQMSLxV1Uz3IqfRUrBNPtyD2LKk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Uv2Jbyz0hPDx2HS8MgrQiMD8arKFo/wpKnGyB5dBZ2UhoP6yzZPwaUTfIUAIA4wKdafUsYUyqQj3qVug5gLv1A6g7CZc/hTe4gDtUenN/H7sjMq9Pt9NS9h0icGkybWvg3COicjh2h4iasmlcf3G3O/586gnJBxg+fMTzTk6uus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vl1LuPOk; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vl1LuPOk"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48b042c0759so2907759f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 02:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791969080; x=1792573880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vONfw/TZke4lqika6uARsXYGMHvc3TAPnV1C0jVfP8U=;
        b=Vl1LuPOkmEbtCbMN9IrHQr0OB4tPADhvq3vyu9LEQyKhSxzMy2/P4PXllfbIrVJ/Wg
         1Jve5zsYMdQ2ScJmD87GxY6F+yq8O86j5ZuIkIwoTzIxqqnwbsVeyNGg18YijMZzD59s
         RcunAjdvFFheHw5QfjySzkqEu0c7PJNdwhxLRnZPY1vgBnjewSbVVR9rdA5PWIkWg18Z
         R2zubpUm9eaWRpdAPYE8sD9C1vjMbcguqtk6FVPFKn3Tez16ReLRghIzt7mHc4jKOQzD
         BHhf/WcP8hVwL8OZpy0VuSLeTMWccSJADYuT1QfkAmp0KaNGT/i6E4IYYbMEe3MB254H
         y7iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791969080; x=1792573880;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vONfw/TZke4lqika6uARsXYGMHvc3TAPnV1C0jVfP8U=;
        b=Y44mzOG5av3G3JeVlCL9NNyh/iGIZHxUiTu8PDhhJHDaOqTy2fIhC2QZhXkFZ2SYmL
         AMpVmvfe8SNgmGsJNvU6DEJc5vcO09bmaDuhlVx/6YfDVJ754qBiVdNz0pfOfS3GP+N2
         UnI/+EQxf5ZznBiGUx13gd0Sno6OerYdpIJf+Fh0s49NiTtb8nQLOLhrqGNI0wYMg1E2
         m4ikLPrw1U+PjmbORMNKkFygJsHOYigHcK0TDcCe0T0bX0lw+6U2QZ6i88uIpS578zo4
         0CwFRU0BBdUuiag8RsCuLUcJo09FVKaTUURIa9wauJVVxxDBwQiKg8i4msKz74yXH09V
         4OWA==
X-Forwarded-Encrypted: i=1; AKwUvByILYgU6ZBr4kclZWu/nvS9anL69QcDDsLT03aQZsoS8RmWzPryf2/gHM0oSn+KK13vgHI3xSoqmO0r5tw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJoYRTQXyTy7uStRNAPnBluTeAXFnR2+sGcrhRRCK0HRg8W7jFj
	cZL1af9+HzUUUnKRVAB4AkHGpI7GYUcBZLUkLtI4GwM4uvbqQR5q2TO4kFDEBQ==
X-Gm-Gg: AYBFou0uXS+hW8QOVOXIIFHAypWg/IqTpXooLqe783gKn9IlQj3axBWbr70g5Z4ntHw
	gnXWpsT5b2vWDaDOah7HJiLftfu9aN8ByEiWCmn6pD+/qv7HvqdEoXqSYmTKqM+Kzyj4VroL3i0
	ndMmG9lbdL2oPfQLFDoAcYH4j63b+zjO56WcmCOiat8RCo+Ebml2E3EB9qFkt4ojS/LJiHylAPv
	QUwmIUU4p3RAaw2pmMf214lRG8Gu4SugeGQb/H++jtIcJoesUDXKOTqFgEDpCgVhE93xC3Rl3G+
	dNJFKIhGfLdfy3MrkxC8YU0ygWGNcXvD524k9AVRqE7DCj1XhnXf/0sdZCfyqZQHncCZcrSUcJx
	ppOLuHjMDh4yCWMVQvNAjqcUIcST8VJHim5kRA/iinZysMxToKG5lkyC72/ljUyrbKTjm5Q8omj
	RxBYlFNLja0WQt7lzmJAlZnSyLQkZrHH4gYOAVLCh1LRf+k50IKCj6AEsGVO7EWlHCxdna5+Str
	oZcQrCXKzq1jpr1jaQ=
X-Received: by 2002:a05:600c:4ecc:b0:49c:fa21:e749 with SMTP id 5b1f17b1804b1-4a18e4d55f2mr339497015e9.31.1791969080038;
        Wed, 14 Oct 2026 02:11:20 -0700 (PDT)
Received: from fedora ([154.183.128.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18beacd2csm468876155e9.14.2026.10.14.02.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 02:11:19 -0700 (PDT)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: jic23@kernel.org
Cc: gregkh@linuxfoundation.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	u.kleine-koenig@baylibre.com,
	joshua.crofts1@gmail.com,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Subject: [PATCH v3] staging: iio: adt7316: use kstrtobool() for sysfs boolean parsing
Date: Wed, 14 Oct 2026 12:11:11 +0300
Message-ID: <20261014091111.20059-1-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace manual character checks (e.g., buf[0] == '1') with the standard
kstrtobool() API in sysfs store functions.

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>
Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
---
Changes in v3:
- Change _adt7316_store_enabled() parameter type from int to bool to match callers (Andy Shevchenko).
- Update adt7316_disable() and adt7316_enable() to pass false/true instead of 0/1 (Andy Shevchenko).

Changes in v2:
- Include <linux/kstrtox.h>.
- Rename the boolean variable from 'req' to 'val' for clarity.
- Add Reviewed-by tag from Joshua Crofts.

 drivers/staging/iio/addac/adt7316.c | 101 ++++++++++++++++++++++------
 1 file changed, 81 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/iio/addac/adt7316.c b/drivers/staging/iio/addac/adt7316.c
index 20f6052cc7fb..ec1c33ad5ace 100644
--- a/drivers/staging/iio/addac/adt7316.c
+++ b/drivers/staging/iio/addac/adt7316.c
@@ -17,6 +17,7 @@
 #include <linux/i2c.h>
 #include <linux/rtc.h>
 #include <linux/module.h>
+#include <linux/kstrtox.h>
 
 #include <linux/iio/iio.h>
 #include <linux/iio/events.h>
@@ -220,7 +221,7 @@ static ssize_t adt7316_show_enabled(struct device *dev,
 }
 
 static ssize_t _adt7316_store_enabled(struct adt7316_chip_info *chip,
-				      int enable)
+				      bool enable)
 {
 	u8 config1;
 	int ret;
@@ -246,12 +247,12 @@ static ssize_t adt7316_store_enabled(struct device *dev,
 {
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);
-	int enable;
+	bool enable;
+	int ret;
 
-	if (buf[0] == '1')
-		enable = 1;
-	else
-		enable = 0;
+	ret = kstrtobool(buf, &enable);
+	if (ret)
+		return ret;
 
 	if (_adt7316_store_enabled(chip, enable) < 0)
 		return -EIO;
@@ -285,13 +286,18 @@ static ssize_t adt7316_store_select_ex_temp(struct device *dev,
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);
 	u8 config1;
+	bool val;
 	int ret;
 
 	if ((chip->id & ID_FAMILY_MASK) != ID_ADT75XX)
 		return -EPERM;
 
+	ret = kstrtobool(buf, &val);
+	if (ret)
+		return ret;
+
 	config1 = chip->config1 & (~ADT7516_SEL_EX_TEMP);
-	if (buf[0] == '1')
+	if (val)
 		config1 |= ADT7516_SEL_EX_TEMP;
 
 	ret = chip->bus.write(chip->bus.client, ADT7316_CONFIG1, config1);
@@ -482,10 +488,15 @@ static ssize_t adt7316_store_disable_averaging(struct device *dev,
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);
 	u8 config2;
+	bool val;
 	int ret;
 
+	ret = kstrtobool(buf, &val);
+	if (ret)
+		return ret;
+
 	config2 = chip->config2 & (~ADT7316_DISABLE_AVERAGING);
-	if (buf[0] == '1')
+	if (val)
 		config2 |= ADT7316_DISABLE_AVERAGING;
 
 	ret = chip->bus.write(chip->bus.client, ADT7316_CONFIG2, config2);
@@ -521,10 +532,15 @@ static ssize_t adt7316_store_enable_smbus_timeout(struct device *dev,
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);
 	u8 config2;
+	bool val;
 	int ret;
 
+	ret = kstrtobool(buf, &val);
+	if (ret)
+		return ret;
+
 	config2 = chip->config2 & (~ADT7316_EN_SMBUS_TIMEOUT);
-	if (buf[0] == '1')
+	if (val)
 		config2 |= ADT7316_EN_SMBUS_TIMEOUT;
 
 	ret = chip->bus.write(chip->bus.client, ADT7316_CONFIG2, config2);
@@ -559,10 +575,15 @@ static ssize_t adt7316_store_powerdown(struct device *dev,
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);
 	u8 config1;
+	bool val;
 	int ret;
 
+	ret = kstrtobool(buf, &val);
+	if (ret)
+		return ret;
+
 	config1 = chip->config1 & (~ADT7316_PD);
-	if (buf[0] == '1')
+	if (val)
 		config1 |= ADT7316_PD;
 
 	ret = chip->bus.write(chip->bus.client, ADT7316_CONFIG1, config1);
@@ -597,10 +618,15 @@ static ssize_t adt7316_store_fast_ad_clock(struct device *dev,
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);
 	u8 config3;
+	bool val;
 	int ret;
 
+	ret = kstrtobool(buf, &val);
+	if (ret)
+		return ret;
+
 	config3 = chip->config3 & (~ADT7316_ADCLK_22_5);
-	if (buf[0] == '1')
+	if (val)
 		config3 |= ADT7316_ADCLK_22_5;
 
 	ret = chip->bus.write(chip->bus.client, ADT7316_CONFIG3, config3);
@@ -640,13 +666,18 @@ static ssize_t adt7316_store_da_high_resolution(struct device *dev,
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);
 	u8 config3;
+	bool val;
 	int ret;
 
 	if (chip->id == ID_ADT7318 || chip->id == ID_ADT7519)
 		return -EPERM;
 
+	ret = kstrtobool(buf, &val);
+	if (ret)
+		return ret;
+
 	config3 = chip->config3 & (~ADT7316_DA_HIGH_RESOLUTION);
-	if (buf[0] == '1')
+	if (val)
 		config3 |= ADT7316_DA_HIGH_RESOLUTION;
 
 	ret = chip->bus.write(chip->bus.client, ADT7316_CONFIG3, config3);
@@ -685,12 +716,17 @@ static ssize_t adt7316_store_AIN_internal_Vref(struct device *dev,
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);
 	u8 config3;
+	bool val;
 	int ret;
 
 	if ((chip->id & ID_FAMILY_MASK) != ID_ADT75XX)
 		return -EPERM;
 
-	if (buf[0] != '1')
+	ret = kstrtobool(buf, &val);
+	if (ret)
+		return ret;
+
+	if (!val)
 		config3 = chip->config3 & (~ADT7516_AIN_IN_VREF);
 	else
 		config3 = chip->config3 | ADT7516_AIN_IN_VREF;
@@ -728,10 +764,15 @@ static ssize_t adt7316_store_enable_prop_DACA(struct device *dev,
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);
 	u8 config3;
+	bool val;
 	int ret;
 
+	ret = kstrtobool(buf, &val);
+	if (ret)
+		return ret;
+
 	config3 = chip->config3 & (~ADT7316_EN_IN_TEMP_PROP_DACA);
-	if (buf[0] == '1')
+	if (val)
 		config3 |= ADT7316_EN_IN_TEMP_PROP_DACA;
 
 	ret = chip->bus.write(chip->bus.client, ADT7316_CONFIG3, config3);
@@ -767,10 +808,15 @@ static ssize_t adt7316_store_enable_prop_DACB(struct device *dev,
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);
 	u8 config3;
+	bool val;
 	int ret;
 
+	ret = kstrtobool(buf, &val);
+	if (ret)
+		return ret;
+
 	config3 = chip->config3 & (~ADT7316_EN_EX_TEMP_PROP_DACB);
-	if (buf[0] == '1')
+	if (val)
 		config3 |= ADT7316_EN_EX_TEMP_PROP_DACB;
 
 	ret = chip->bus.write(chip->bus.client, ADT7316_CONFIG3, config3);
@@ -967,10 +1013,15 @@ static ssize_t adt7316_store_DA_AB_Vref_bypass(struct device *dev,
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);
 	u8 dac_config;
+	bool val;
 	int ret;
 
+	ret = kstrtobool(buf, &val);
+	if (ret)
+		return ret;
+
 	dac_config = chip->dac_config & (~ADT7316_VREF_BYPASS_DAC_AB);
-	if (buf[0] == '1')
+	if (val)
 		dac_config |= ADT7316_VREF_BYPASS_DAC_AB;
 
 	ret = chip->bus.write(chip->bus.client, ADT7316_DAC_CONFIG, dac_config);
@@ -1006,10 +1057,15 @@ static ssize_t adt7316_store_DA_CD_Vref_bypass(struct device *dev,
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);
 	u8 dac_config;
+	bool val;
 	int ret;
 
+	ret = kstrtobool(buf, &val);
+	if (ret)
+		return ret;
+
 	dac_config = chip->dac_config & (~ADT7316_VREF_BYPASS_DAC_CD);
-	if (buf[0] == '1')
+	if (val)
 		dac_config |= ADT7316_VREF_BYPASS_DAC_CD;
 
 	ret = chip->bus.write(chip->bus.client, ADT7316_DAC_CONFIG, dac_config);
@@ -1969,10 +2025,15 @@ static ssize_t adt7316_set_int_enabled(struct device *dev,
 	struct iio_dev *dev_info = dev_to_iio_dev(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);
 	u8 config1;
+	bool val;
 	int ret;
 
+	ret = kstrtobool(buf, &val);
+	if (ret)
+		return ret;
+
 	config1 = chip->config1 & (~ADT7316_INT_EN);
-	if (buf[0] == '1')
+	if (val)
 		config1 |= ADT7316_INT_EN;
 
 	ret = chip->bus.write(chip->bus.client, ADT7316_CONFIG1, config1);
@@ -2084,7 +2145,7 @@ static int adt7316_disable(struct device *dev)
 	struct iio_dev *dev_info = dev_get_drvdata(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);
 
-	return _adt7316_store_enabled(chip, 0);
+	return _adt7316_store_enabled(chip, false);
 }
 
 static int adt7316_enable(struct device *dev)
@@ -2092,7 +2153,7 @@ static int adt7316_enable(struct device *dev)
 	struct iio_dev *dev_info = dev_get_drvdata(dev);
 	struct adt7316_chip_info *chip = iio_priv(dev_info);
 
-	return _adt7316_store_enabled(chip, 1);
+	return _adt7316_store_enabled(chip, true);
 }
 
 EXPORT_GPL_SIMPLE_DEV_PM_OPS(adt7316_pm_ops, adt7316_disable, adt7316_enable);
-- 
2.54.0

