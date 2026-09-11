Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F29408026
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789111638; cv=none; b=KWsZEa6y+VkAGtYJeWnDnuWfiUBgrQqbB6zZw4lLYl2DDafkuZmor4unb5c012jBZ/QObCfVeW0Z4WGssK1qttpofuPmcm8Wa81yiXMTtdQ8ia2MG2rQeIDIm5UAsgXHbPhTmIkVLu8vnJrIRkY5yzPW9WFtuVutemOUe6yN/eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789111638; c=relaxed/simple;
	bh=9LCSHI9dJmXTshg5eLes8LVmGe5qn+MubAPy/BL7Mt4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JCfn7Uq0a1j9WqiN4YDzlGy25Iltnky1A2SFWFiKBByj8T33wouxGCn7GYT9lvYbKIvTpNookTL73yp6yG5O8i03blSTU5wjZva8qhLZ0RM3EBx/C26un6hnrTMyq0jV7/LGNerW40CA400o0yKTeRB17X9/uuERNfmcutbysSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B4JcEx1h; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B4JcEx1h"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-ca12086c06eso644382a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 00:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789111635; x=1789716435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DSWkYiMfJ8v4uw6eOjZdWs71agTehwoYxv/jnWrsoXU=;
        b=B4JcEx1hDuSeKhTCHtTabCuKYgIH2g1jqjeZEGicQhEfBs19FV412SZ7oQLe6ZAstv
         6/Lpw1pAzRyHhXgXN7IcsEZtCFQ5g9KUewU63yAQpj2gRty8gW2sfcZ41J9k+fR+GAzn
         0TKO/gj9ZKebxkpmsYN9QIswrz/7qQeaDJxAbSKxKgtOZafiUvMmZfq59niCYoc/V8xZ
         6ELbYNoGP8TI2kvV1pixABVQifDPpbbo0B0+nCMkeDJKY+HPX25JdDJSTRhK14ZrPOfh
         ykgrD7GDpbqMPH1fbFDJHn5Zd94ZwhNBjf3+E8Jsd/idMaW3jZABGNQy63th1VyhmSy4
         Xv6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789111635; x=1789716435;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DSWkYiMfJ8v4uw6eOjZdWs71agTehwoYxv/jnWrsoXU=;
        b=MyA7kXgm0PkvwlZKzy/P3Ie5KryzGBueMiKOGNJMNHjcp6NJ+hfTchsZ9GMcprHgym
         XctymVUgpF2PSh6rRA51G/InNF7Q+i1XTlVqBRefRkljsVlvL2lH4CY6mG7zHCVTd/l9
         c4w9GJBdgi2TyZNOdMPe33w45EmJ+NbJKNIvUSb6IwnsrTDwwmcTHmOtEOxbfcEBdlZz
         1Ub+7M6W/ryIa4DhWWzMI8mruTo7Kvma5BQC9dcWOBmngfJibTN0b6p/ctJYKEuLQqVB
         SZvoXnDdPdEhlH5JFUNmQtxTrRZWXHvhqr3AiIIAQCE8lKbB+I0neRbDfDo1C6FMBC2Q
         yZPA==
X-Forwarded-Encrypted: i=1; AKwUvBzkWglb1XBlE+w1ZEpnHMvoZCX+8LQMlwwtChxbUo4laOLxqiYR+6aRYYxE1CH/xOsu/cxzShvEaQfUYhw=@vger.kernel.org
X-Gm-Message-State: AFuF++kYa55LXWa008Lm0418U49iKIZc9O4T3kbtyAxY0FaJoDGaEE3b
	CxOmiQJgKS0NNhIPOtXxCKonML1fXy2NDKmsr46xoWnbMlV4v4vdT/Tc
X-Gm-Gg: AYBFou1GyZqyMkTX/YTz9FnRpH4iYogXCkQPrviRts9fRZ8WTOe5xmSVNyDIRPWsfGh
	/vMBH5hI7D9Nz2u+hCpx74SnL9qTKVag4CXRxMnIRrbvhSBZl8brnMVaO/AMDhZ2FWMwXHQxJVo
	ej+eCOoP9GZsAqtUqFceLfz7x/fTMfcZtx8SHJgbFY8MU1HN4sBX+beQeutWika+0uxudwjbsIj
	a6OkHeM0+G8Eh5Mn0n8X1dZOk/+TRxbfq9judcUByJ7q3V224zV1a+ExPNYwMVDA18cTrTvUUPG
	VW3iUyFTrjC8QiNohUK2+Qb4d3ynM8wne88P5ata1YVGyOQfeEU0VQOu/PFZij8b7KQ7Lp+7J7/
	59O2Ms2wDkMjCtzlP3eccaBVfSjME8YtdJCLw+XXjiyEiAAbFofOFLlgoK9T1S2Q4wHkkm5/Ovc
	DEgisz9hR59EeA9E6URrD7RMIq6wL7wrfU73Q+hotdfb+seJs1q+liIaE7Sj9piTxf5otUuKR15
	2y3mrzCT6MHKg/Tmt3jU9nr2SHtf3li5W9DLda24w37D/3cHqB0vrLeE0ypwKn2Fi3xRWPSyoCK
X-Received: by 2002:a05:6a21:e58d:b0:3d3:ae0f:5268 with SMTP id adf61e73a8af0-3daed38e438mr5837524637.20.1789111634934;
        Fri, 11 Sep 2026 00:27:14 -0700 (PDT)
Received: from cs00-MS-7C09.. (2001-b400-e381-6723-6ed9-0e2b-d17e-b72e.emome-ip6.hinet.net. [2001:b400:e381:6723:6ed9:e2b:d17e:b72e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e9a8a9sm4023136eec.13.2026.09.11.00.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 00:27:14 -0700 (PDT)
From: hsyemail2@gmail.com
X-Google-Original-From: syhuang3@nuvoton.com
To: Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org
Cc: Sheng-Yuan Huang <syhuang3@nuvoton.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jean Delvare <jdelvare@suse.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v2] hwmon: (lm75) Add support for Nuvoton NCT7715
Date: Fri, 11 Sep 2026 15:26:53 +0800
Message-ID: <20260911072654.15722-1-syhuang3@nuvoton.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sheng-Yuan Huang <syhuang3@nuvoton.com>

The Nuvoton NCT7715 is compatible with the LM75 temperature and
limit register layout. Add support for the NCT7715, including its
16-bit configuration register.

Handle its conversion-rate field and shutdown bit separately, since
their bit positions differ from the standard LM75 layout.

Signed-off-by: Sheng-Yuan Huang <syhuang3@nuvoton.com>
---
v2:
- Use the standard SMBus word representation for the NCT7715
  configuration register, removing the NCT7715-specific byte swapping
  and updating its configuration masks accordingly.

 .../devicetree/bindings/hwmon/lm75.yaml       |  1 +
 Documentation/hwmon/lm75.rst                  |  6 +++
 drivers/hwmon/lm75.c                          | 52 ++++++++++++++++++-
 3 files changed, 57 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/lm75.yaml b/Documentation/devicetree/bindings/hwmon/lm75.yaml
index b48bf3fd721f..832a8c5d83e9 100644
--- a/Documentation/devicetree/bindings/hwmon/lm75.yaml
+++ b/Documentation/devicetree/bindings/hwmon/lm75.yaml
@@ -31,6 +31,7 @@ properties:
       - nxp,p3t1750
       - nxp,p3t1755
       - nxp,pct2075
+      - nuvoton,nct7715
       - st,stds75
       - st,stlm75
       - microchip,tcn75
diff --git a/Documentation/hwmon/lm75.rst b/Documentation/hwmon/lm75.rst
index ca46754e028b..fac0b8f29ddc 100644
--- a/Documentation/hwmon/lm75.rst
+++ b/Documentation/hwmon/lm75.rst
@@ -150,6 +150,12 @@ Supported chips:
 
                https://ams.com/documents/20143/36005/AS6200_DS000449_4-00.pdf
 
+  * Nuvoton NCT7715
+
+    Prefix: 'nct7715'
+
+    Addresses scanned: none
+
 Author: Frodo Looijaard <frodol@dds.nl>
 
 Description
diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
index 2d2d752aeac9..ad7128629e56 100644
--- a/drivers/hwmon/lm75.c
+++ b/drivers/hwmon/lm75.c
@@ -39,6 +39,7 @@ enum lm75_type {		/* keep sorted in alphabetical order */
 	max6626,
 	max31725,
 	mcp980x,
+	nct7715,
 	p3t1750,
 	p3t1755,
 	pct2075,
@@ -107,6 +108,15 @@ static const unsigned short normal_i2c[] = { 0x48, 0x49, 0x4a, 0x4b, 0x4c,
 #define LM75_REG_MAX		0x03
 #define PCT2075_REG_IDLE	0x04
 
+#define NCT7715_CONFIG_RESOLUTION_12_BIT	GENMASK(6, 5)
+#define NCT7715_CONFIG_SHUTDOWN			BIT(0)
+#define NCT7715_CONFIG_CONVERSION_RATE_MASK	GENMASK(15, 14)
+#define NCT7715_CONFIG_EXTENDED_MODE		BIT(12)
+#define NCT7715_CONFIG_RATE_0_25HZ		0
+#define NCT7715_CONFIG_RATE_1HZ			BIT(14)
+#define NCT7715_CONFIG_RATE_4HZ			BIT(15)
+#define NCT7715_CONFIG_RATE_8HZ			GENMASK(15, 14)
+
 struct lm75_data {
 	const char *label;
 	struct regmap			*regmap;
@@ -122,6 +132,10 @@ struct lm75_data {
 /*-----------------------------------------------------------------------*/
 
 static const u8 lm75_sample_set_masks[] = { 0 << 5, 1 << 5, 2 << 5, 3 << 5 };
+static const u16 nct7715_sample_set_masks[] = {
+	NCT7715_CONFIG_RATE_8HZ, NCT7715_CONFIG_RATE_4HZ,
+	NCT7715_CONFIG_RATE_1HZ, NCT7715_CONFIG_RATE_0_25HZ
+};
 
 #define LM75_ALERT_POLARITY_HIGH_8_BIT	(BIT(2))
 #define LM75_ALERT_POLARITY_HIGH_16_BIT	(BIT(2) << 8)
@@ -259,6 +273,15 @@ static const struct lm75_params device_params[] = {
 		.sample_times = (unsigned int []){ 30, 60, 120, 240 },
 		.resolutions = (u8 []) {9, 10, 11, 12 },
 	},
+	[nct7715] = {
+		.config_reg_16bits = true,
+		.set_mask = NCT7715_CONFIG_RESOLUTION_12_BIT,
+		.clr_mask = NCT7715_CONFIG_EXTENDED_MODE,
+		.default_resolution = 12,
+		.default_sample_time = 250,
+		.num_sample_times = 4,
+		.sample_times = (unsigned int []){ 125, 250, 1000, 4000 },
+	},
 	[tmp100] = {
 		.set_mask = 3 << 5,	/* 12-bit mode */
 		.clr_mask = 1 << 7,	/* not one-shot mode */
@@ -354,6 +377,11 @@ static inline long lm75_reg_to_mc(s16 temp, u8 resolution)
 static inline int lm75_write_config(struct lm75_data *data, u16 set_mask,
 				    u16 clr_mask)
 {
+	if (data->kind == nct7715)
+		return regmap_update_bits(data->regmap, LM75_REG_CONF,
+					  clr_mask | set_mask | NCT7715_CONFIG_SHUTDOWN,
+					  set_mask);
+
 	return regmap_update_bits(data->regmap, LM75_REG_CONF,
 				  clr_mask | set_mask | LM75_SHUTDOWN, set_mask);
 }
@@ -486,6 +514,13 @@ static int lm75_update_interval(struct device *dev, long val)
 		if (data->params->resolutions)
 			data->resolution = data->params->resolutions[index];
 		break;
+	case nct7715:
+		err = lm75_write_config(data, nct7715_sample_set_masks[index],
+					NCT7715_CONFIG_CONVERSION_RATE_MASK);
+		if (err)
+			return err;
+		data->sample_time = data->params->sample_times[index];
+		break;
 	case tmp112:
 	case as6200:
 		err = regmap_update_bits(data->regmap, LM75_REG_CONF,
@@ -770,7 +805,7 @@ static int lm75_generic_probe(struct device *dev, const char *name,
 	data->orig_conf = status;
 
 	/* Enforce polarity active-low (default) or active-high (devicetree) */
-	if (!data->params->config_reg_16bits)
+	if (!data->params->config_reg_16bits || data->kind == nct7715)
 		pol_mask = LM75_ALERT_POLARITY_HIGH_8_BIT;
 	else
 		pol_mask = LM75_ALERT_POLARITY_HIGH_16_BIT;
@@ -848,6 +883,7 @@ static const struct i2c_device_id lm75_i2c_ids[] = {
 	{ .name = "max31725", .driver_data = max31725 },
 	{ .name = "max31726", .driver_data = max31725 },
 	{ .name = "mcp980x", .driver_data = mcp980x },
+	{ .name = "nct7715", .driver_data = nct7715 },
 	{ .name = "p3t1750", .driver_data = p3t1750 },
 	{ .name = "p3t1755", .driver_data = p3t1755 },
 	{ .name = "pct2075", .driver_data = pct2075 },
@@ -972,6 +1008,10 @@ static const struct of_device_id lm75_of_match[] = {
 		.compatible = "nxp,pct2075",
 		.data = (void *)pct2075
 	},
+	{
+		.compatible = "nuvoton,nct7715",
+		.data = (void *)nct7715
+	},
 	{
 		.compatible = "st,stds75",
 		.data = (void *)stds75
@@ -1129,13 +1169,21 @@ static int lm75_suspend(struct device *dev)
 {
 	struct lm75_data *data = dev_get_drvdata(dev);
 
-	return regmap_update_bits(data->regmap, LM75_REG_CONF, LM75_SHUTDOWN, LM75_SHUTDOWN);
+	if (data->kind == nct7715)
+		return regmap_update_bits(data->regmap, LM75_REG_CONF,
+					  NCT7715_CONFIG_SHUTDOWN,
+					  NCT7715_CONFIG_SHUTDOWN);
+	return regmap_update_bits(data->regmap, LM75_REG_CONF,
+				  LM75_SHUTDOWN, LM75_SHUTDOWN);
 }
 
 static int lm75_resume(struct device *dev)
 {
 	struct lm75_data *data = dev_get_drvdata(dev);
 
+	if (data->kind == nct7715)
+		return regmap_update_bits(data->regmap, LM75_REG_CONF,
+					  NCT7715_CONFIG_SHUTDOWN, 0);
 	return regmap_update_bits(data->regmap, LM75_REG_CONF, LM75_SHUTDOWN, 0);
 }
 
-- 
2.43.0

