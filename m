Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B7A3F12EF
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788768546; cv=none; b=MSIPAXAbUvNC7JlS+XGeEWWfIVxK3qMcn/hzAqvR1ywPs/9O3BhADaUBTwL1N7HOyegdZaKzsuYi7mOOWX1n33XUylMzupD3HUfCEy9Avgn9ty7ofk0JGID+JsRvNFW+Us726fg4XS/fVSG1gzeilmo+vm8d/AYRg5OBL1AqSNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788768546; c=relaxed/simple;
	bh=rPz0xDbTD8p93bPYQVOUv/fwKoXoM0jlUbzg+c/kUYI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fPRyVc91v5gqQAqR7c1rZib1mflRKJkYGzUV5L6G/xC3mz2Thuta3DfDLybC+bUfiEmJ064oTJu/gLvbwCet5W760MNazwX2DEFA965vwUlsLy3B5gEL08mthEBPmFk/W9oh8c1H1qoIKdo6MsRizR6LJ2W3b1hbPZGDNfA7Tl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b2QJLDaW; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b2QJLDaW"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d9201076b3so36965545ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 01:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788768542; x=1789373342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yeQPHr3k4W49mwlDeTXOdB54qRtzTpZiMlZNmTvTcKk=;
        b=b2QJLDaWtOwAeCdAyQq+EXIKcHu1+G7XBDuUcNpbJj9UnGf2VdW4t75KDjVC4m6weT
         0QcZ9EeihuBVuic0TxRogjsVH0ZP2P3On63qa2dyJZD6i5F95Nnxv11+1YDEYlgfAyzJ
         IZ1zopuHAjG9JWSfVi9gD8alfGKIlQgePj3N9+zjs13kAx4dAVS/S61YUvIbqvB4ymb4
         1t/DQulFbzDcykGaXhc01c2USCOPkUHYcTD9w/1Ak8sKqlGJn103e7QXv8EAugAn2dNV
         GFo4djWo19MEaA7t03wIzUwNJBhLxg+lzbbWP9H77IduYn9DRXVF3K4QX3m5lfKc++5t
         Yd4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788768542; x=1789373342;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yeQPHr3k4W49mwlDeTXOdB54qRtzTpZiMlZNmTvTcKk=;
        b=fLWg8tjmzAiuIEjQ+XN9dL58dwlOuZT4SoBAo0r3vA7cQis2T8kJvo0CVu696V3izD
         FgSkElbrvz5uZ+yJCL1RLNkXapDiHA9Mk6+O5Si+A9wNB4L5wdi+oVZToIbRXVnW0H/4
         v+fPPpVL7JVMQKtztXSBeB1gymTarvQ77sWjmydugTUsfPSHQBnB5Lws4RXMBOlvzj+D
         l6X2kLuNphwSTn7IkTpZzp6NhTslMCcnnbI6psnolAB6sp+5yhgfZOXJqTze01ER5gH4
         W2GKDYxub8kiXiB6DBkSQ8VVDIygRcUTwWy9BBxm2YBKikvA1u/bzXhZuyNewy2jfyBY
         Jf2A==
X-Forwarded-Encrypted: i=1; AKwUvBzB3dHOJZX2XrD1PYPlw8Z6xQnQ/H63InMqJxkePxbQqif4GH52JxgTj+i+427491jbEMF2mzqbmpcmYic=@vger.kernel.org
X-Gm-Message-State: AFuF++k1TS9l1xpy0awt5hytysWPrkZUBEAuDZkqtXFh176Zu1CJYMug
	/+0oiJ38Fu4onkORhdUNaeyutN0sHoMPm0Nh0rMwK09pwFTSlhJKRGaH
X-Gm-Gg: AYBFou2tJ9vRHO3dvYpRy0Rg92+KGS1xlBbWrJf2Uk/Xgd2/FddooDcVt7EaZO/RiHP
	105wct2qTUqUMRZYNeb/jtO5Pvq1AtE0IFsvb6iqfKWb+9n4NrZKXhcWP2XLaye3BoP7Ed3/Cih
	qDVjS7YRKwSFWYFOrWTxUicV1jsT+MitdFVnSQwz5KxQHsHzclyPnYrYKnRqa7bAT7QwcbKFlev
	npVRu5ps/81PSX/qYdjTZAjwx8FJrbJu9kkc3wfBVRU3UL2OwoyBMtqY/1FamfGYbPEC3paNYcn
	DzJBg6p9Mn64jV54dw3HgErgo5wFkMQghReDlyTwvPyCRxtYt8AYPcHHlOl3teGBd+kgnjoj8L5
	jyWxBXe5tv4pKUPLjbyxaNIazu7mNSOHpagBntSzuvkPWEitjmLZtOW8Y1g5nla2x0ltneQbffQ
	tkAs/zPn2hgQ7euQLRwMjF7iLiT7CL7U2J1vrhH4GLNOad6qLNcTc1/MKNyrhu7BZIndjJOnsYV
	ft66R6Scp68HDdQxyGf8jU2CKvbWFZ/C7syI51epg9XOtgxcLy9X41riE/Z20n84w==
X-Received: by 2002:a17:903:4683:b0:2cf:c543:2c7e with SMTP id d9443c01a7336-2db125a16fdmr355053065ad.10.1788768541992;
        Mon, 07 Sep 2026 01:09:01 -0700 (PDT)
Received: from cs00-MS-7C09.. (2001-b400-e332-0a85-7dbb-93aa-5d32-f5d9.emome-ip6.hinet.net. [2001:b400:e332:a85:7dbb:93aa:5d32:f5d9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae36adsm40617015ad.76.2026.09.07.01.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:09:00 -0700 (PDT)
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
Subject: [PATCH v1] hwmon: (lm75) Add support for Nuvoton NCT7715
Date: Mon,  7 Sep 2026 16:08:30 +0800
Message-ID: <20260907080831.11281-1-syhuang3@nuvoton.com>
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
limit register layout, but its 16-bit configuration register is
transmitted most-significant byte first. Add support for the NCT7715,
including byte-swapped SMBus accesses for its configuration register.

Handle its conversion-rate field and shutdown bit separately, since
their bit positions differ from the standard LM75 layout.

Signed-off-by: Sheng-Yuan Huang <syhuang3@nuvoton.com>
---
 .../devicetree/bindings/hwmon/lm75.yaml       |  1 +
 Documentation/hwmon/lm75.rst                  |  6 ++
 drivers/hwmon/lm75.c                          | 57 ++++++++++++++++++-
 3 files changed, 62 insertions(+), 2 deletions(-)

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
index 2d2d752aeac9..0b55f6b7c68d 100644
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
 
+#define NCT7715_CONFIG_RESOLUTION_12_BIT	GENMASK(14, 13)
+#define NCT7715_CONFIG_SHUTDOWN			BIT(8)
+#define NCT7715_CONFIG_CONVERSION_RATE_MASK	GENMASK(7, 6)
+#define NCT7715_CONFIG_EXTENDED_MODE		BIT(4)
+#define NCT7715_CONFIG_RATE_0_25HZ		0
+#define NCT7715_CONFIG_RATE_1HZ			BIT(6)
+#define NCT7715_CONFIG_RATE_4HZ			BIT(7)
+#define NCT7715_CONFIG_RATE_8HZ			GENMASK(7, 6)
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
@@ -609,6 +644,8 @@ static int lm75_i2c_reg_read(void *context, unsigned int reg, unsigned int *val)
 	if (reg == LM75_REG_CONF) {
 		if (!data->params->config_reg_16bits)
 			ret = i2c_smbus_read_byte_data(client, LM75_REG_CONF);
+		else if (data->kind == nct7715)
+			ret = i2c_smbus_read_word_swapped(client, LM75_REG_CONF);
 		else
 			ret = i2c_smbus_read_word_data(client, LM75_REG_CONF);
 	} else {
@@ -628,8 +665,11 @@ static int lm75_i2c_reg_write(void *context, unsigned int reg, unsigned int val)
 	if (reg == PCT2075_REG_IDLE ||
 	    (reg == LM75_REG_CONF && !data->params->config_reg_16bits))
 		return i2c_smbus_write_byte_data(client, reg, val);
-	else if (reg == LM75_REG_CONF)
+	else if (reg == LM75_REG_CONF) {
+		if (data->kind == nct7715)
+			return i2c_smbus_write_word_swapped(client, reg, val);
 		return i2c_smbus_write_word_data(client, reg, val);
+	}
 	return i2c_smbus_write_word_swapped(client, reg, val);
 }
 
@@ -848,6 +888,7 @@ static const struct i2c_device_id lm75_i2c_ids[] = {
 	{ .name = "max31725", .driver_data = max31725 },
 	{ .name = "max31726", .driver_data = max31725 },
 	{ .name = "mcp980x", .driver_data = mcp980x },
+	{ .name = "nct7715", .driver_data = nct7715 },
 	{ .name = "p3t1750", .driver_data = p3t1750 },
 	{ .name = "p3t1755", .driver_data = p3t1755 },
 	{ .name = "pct2075", .driver_data = pct2075 },
@@ -972,6 +1013,10 @@ static const struct of_device_id lm75_of_match[] = {
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
@@ -1129,13 +1174,21 @@ static int lm75_suspend(struct device *dev)
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

