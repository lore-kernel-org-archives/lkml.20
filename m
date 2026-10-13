Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134405349A2
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 18:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791915278; cv=none; b=FQ6JHMc+8SuGuHKonYCu2by4E4K/TrwTrK0YrF30B3TrIfeOiCFgdXcYCBra+AkrN2EkP/O3GWjOGr0WvijwTswZZyw7OwYcw3MPxqeFR3yTt9QwIdB91uMqOGriXJ4uwc9n8jEuixW6Vsqk25OxhN0K2u0WcDs8szAQeYX2CGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791915278; c=relaxed/simple;
	bh=RKicG9inSH59LqDyHLo+alN4W8WXccEJ9xYX8pNYrPM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FYs6nyz9eHvP89Et5hIiRSpIB19VlpJenfFd8Ko4X5qHI3nYqnzMHchLFVvm1xbqKmP+6pJcIMdc5NTZtgzmKUPBdDIL0xKaxjTTdPhIW8sE1IdSMVriycfQpYBKLt65YKjaKo9x+6nD0yHcBCOxTVSEcl/J6LiDRA8Nm2Zeu18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fpsa/SVQ; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fpsa/SVQ"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1af482519so7633555e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791915274; x=1792520074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=84RUWE34pMwpWgLCCXAmF9nLWAHAulXiL4Hx2352KFY=;
        b=Fpsa/SVQSIedAhcMPPs5DfXHs4aLvdVrgVma/wIQOWXuVp+uCZSeo+52ma0bhEqmId
         8UoS51ZMUJZw8ftgS0vmuU3aCuEWPQQQFJ6Bj//g2kpI42NVNwSHVJfPYgCtfDftwaJZ
         bsttjHbXFbd0U1hJ6PM/vvTUXntyFuN8E7Uv8W2CWnjDOKKOh1emu9Iv0A3e21BV/vqA
         oxoKHsZq8J2Lwm5P2elv+6r0xzx3OI1Op19hzgqdlsuxThApNgk7cCbPuAEYHy65FcLf
         VXvCDAXAQXmpDefvgGJtqif9rNyZqOozamEj3xe6qkZzbJZk4jx/7bXDrEbF+2FYMyk+
         dkww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791915274; x=1792520074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=84RUWE34pMwpWgLCCXAmF9nLWAHAulXiL4Hx2352KFY=;
        b=UeQw54cXyFmc4MU+9uhVkQcdqx1U6SYAKPu++IaqzrBHRzkKOT5wQ1bCvaGsQTmvpD
         adgtKPQ4W9cjFy+ICLoleJOUwiFFBTOTSzpadfU0O3cAvQv667t47J+ZSFJ2hDBYF8PM
         VQjD3v3ftDsHzDsNWcLEQilXBVw6lpguQ57/jUO7AndVJ+T/iHSAWk8cJvPs6xkJkRgE
         OSJnj/+OLZ4aCcrmWgGrhY5JC4FTNG25n2KSNTRw2c/bTpNcobpVR64qI320SGr/jPQo
         PHB5/XWJJmL3CsC12AuzpIWwRqLHnNKIjPRLBDrWA+b43IqMOkAPo/WZTqYqtdindV1a
         sIXw==
X-Gm-Message-State: AFq9FYImXIjo9G323ZbiBvW7Wiw5irGqAVNBm5US9DJLVW6Uj1Ro2bT8
	PqVN21XNoTEob5n0kg5/z4SICZC9+nvlWE4OFaMXyOEgg3vnxxRgKQVD
X-Gm-Gg: AYBFou3A6ajgkwhghZ+tnOsWtLe2nNyCj1YhFRO/C7T1oeQLRjY4hkSlwRZIx0xUF+V
	di49Bzp+ZUtXr8g/3MRiq9XYyub4SE0drq5VYhvxNM2A46X15LYLPkd9/b17Lo3ppkS3ffRiH7k
	Sbkz346ch8yLdshfd0tlhQK7DBdq/QLCKG+Llw32F4fQxfqLwJzfLqaq86XO1OOaJUFlDjeyj5i
	rUpw+9zR7wE4dyYFvZ9n/Appm+nynKwG/Ushypl95WcNlUfG08OauHNX9HO7Eowuxf4yvtfsqWy
	Aft5wDUvmKEnOyBjQAdmTbxV7hQqtigUmBsfpj2OmHjI+HPJBeeNA57ViLmOn0nI7KvCMxXiV34
	ip1iJHCpuqBcKsUNzPel/8oZBzhRgrS3YiX+dl6lgtc/hZ6I7jcIvo8voKJv+JPkNBZOhKxUKC0
	P/pAUD0fF4AshjT0PFjQiXHP1dIL72tDYMSi2yluHrwrp8i3w1t6ElZyJuCyzEEBqazAlb8LOFr
	H3EsSxUGWxjW7IiT4U=
X-Received: by 2002:a05:600c:154e:b0:49f:ffa2:1c72 with SMTP id 5b1f17b1804b1-4a18e49ad83mr263919055e9.11.1791915274061;
        Tue, 13 Oct 2026 11:14:34 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf1358asm383933345e9.4.2026.10.13.11.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 11:14:33 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Milo Kim <milo.kim@ti.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 3/7] regulator: lp872x: Fold driver header into driver file
Date: Tue, 13 Oct 2026 21:14:13 +0300
Message-ID: <20261013181417.492252-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013181417.492252-1-clamor95@gmail.com>
References: <20261013181417.492252-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove need in header file in preparation for pdata probing removal.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/regulator/lp872x.c       | 54 +++++++++++++++++++-
 include/linux/regulator/lp872x.h | 86 --------------------------------
 2 files changed, 53 insertions(+), 87 deletions(-)
 delete mode 100644 include/linux/regulator/lp872x.h

diff --git a/drivers/regulator/lp872x.c b/drivers/regulator/lp872x.c
index 5b2faddd8110f..13dce4dcdbe14 100644
--- a/drivers/regulator/lp872x.c
+++ b/drivers/regulator/lp872x.c
@@ -12,10 +12,10 @@
 #include <linux/err.h>
 #include <linux/gpio/consumer.h>
 #include <linux/delay.h>
-#include <linux/regulator/lp872x.h>
 #include <linux/regulator/driver.h>
 #include <linux/platform_device.h>
 #include <linux/of.h>
+#include <linux/regulator/machine.h>
 #include <linux/regulator/of_regulator.h>
 
 /* Registers : LP8720/8725 shared */
@@ -92,11 +92,63 @@
 /* dump registers in regmap-debugfs */
 #define MAX_REGISTERS			0x0F
 
+#define LP872X_MAX_REGULATORS		9
+
+#define LP8720_ENABLE_DELAY		200
+#define LP8725_ENABLE_DELAY		30000
+
 enum lp872x_id {
 	LP8720,
 	LP8725,
 };
 
+enum lp872x_regulator_id {
+	LP8720_ID_BASE,
+	LP8720_ID_LDO1 = LP8720_ID_BASE,
+	LP8720_ID_LDO2,
+	LP8720_ID_LDO3,
+	LP8720_ID_LDO4,
+	LP8720_ID_LDO5,
+	LP8720_ID_BUCK,
+
+	LP8725_ID_BASE,
+	LP8725_ID_LDO1 = LP8725_ID_BASE,
+	LP8725_ID_LDO2,
+	LP8725_ID_LDO3,
+	LP8725_ID_LDO4,
+	LP8725_ID_LDO5,
+	LP8725_ID_LILO1,
+	LP8725_ID_LILO2,
+	LP8725_ID_BUCK1,
+	LP8725_ID_BUCK2,
+
+	LP872X_ID_MAX,
+};
+
+enum lp872x_dvs_sel {
+	SEL_V1,
+	SEL_V2,
+};
+
+struct lp872x_dvs {
+	struct gpio_desc *gpio;
+	enum lp872x_dvs_sel vsel;
+	enum gpiod_flags init_state;
+};
+
+struct lp872x_regulator_data {
+	enum lp872x_regulator_id id;
+	struct regulator_init_data *init_data;
+};
+
+struct lp872x_platform_data {
+	u8 general_config;
+	bool update_config;
+	struct lp872x_regulator_data regulator_data[LP872X_MAX_REGULATORS];
+	struct lp872x_dvs *dvs;
+	struct gpio_desc *enable_gpio;
+};
+
 struct lp872x {
 	struct regmap *regmap;
 	struct device *dev;
diff --git a/include/linux/regulator/lp872x.h b/include/linux/regulator/lp872x.h
deleted file mode 100644
index b62e45aa1dd36..0000000000000
--- a/include/linux/regulator/lp872x.h
+++ /dev/null
@@ -1,86 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright 2012 Texas Instruments
- *
- * Author: Milo(Woogyom) Kim <milo.kim@ti.com>
- */
-
-#ifndef __LP872X_REGULATOR_H__
-#define __LP872X_REGULATOR_H__
-
-#include <linux/regulator/machine.h>
-#include <linux/platform_device.h>
-#include <linux/gpio/consumer.h>
-
-#define LP872X_MAX_REGULATORS		9
-
-#define LP8720_ENABLE_DELAY		200
-#define LP8725_ENABLE_DELAY		30000
-
-enum lp872x_regulator_id {
-	LP8720_ID_BASE,
-	LP8720_ID_LDO1 = LP8720_ID_BASE,
-	LP8720_ID_LDO2,
-	LP8720_ID_LDO3,
-	LP8720_ID_LDO4,
-	LP8720_ID_LDO5,
-	LP8720_ID_BUCK,
-
-	LP8725_ID_BASE,
-	LP8725_ID_LDO1 = LP8725_ID_BASE,
-	LP8725_ID_LDO2,
-	LP8725_ID_LDO3,
-	LP8725_ID_LDO4,
-	LP8725_ID_LDO5,
-	LP8725_ID_LILO1,
-	LP8725_ID_LILO2,
-	LP8725_ID_BUCK1,
-	LP8725_ID_BUCK2,
-
-	LP872X_ID_MAX,
-};
-
-enum lp872x_dvs_sel {
-	SEL_V1,
-	SEL_V2,
-};
-
-/**
- * lp872x_dvs
- * @gpio       : gpio descriptor for dvs control
- * @vsel       : dvs selector for buck v1 or buck v2 register
- * @init_state : initial dvs pin state
- */
-struct lp872x_dvs {
-	struct gpio_desc *gpio;
-	enum lp872x_dvs_sel vsel;
-	enum gpiod_flags init_state;
-};
-
-/**
- * lp872x_regdata
- * @id        : regulator id
- * @init_data : init data for each regulator
- */
-struct lp872x_regulator_data {
-	enum lp872x_regulator_id id;
-	struct regulator_init_data *init_data;
-};
-
-/**
- * lp872x_platform_data
- * @general_config    : the value of LP872X_GENERAL_CFG register
- * @update_config     : if LP872X_GENERAL_CFG register is updated, set true
- * @regulator_data    : platform regulator id and init data
- * @dvs               : dvs data for buck voltage control
- * @enable_gpio       : gpio descriptor for enable control
- */
-struct lp872x_platform_data {
-	u8 general_config;
-	bool update_config;
-	struct lp872x_regulator_data regulator_data[LP872X_MAX_REGULATORS];
-	struct lp872x_dvs *dvs;
-	struct gpio_desc *enable_gpio;
-};
-
-#endif
-- 
2.53.0

