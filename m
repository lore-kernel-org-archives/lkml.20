Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E1A49E5C3
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 15:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791301490; cv=none; b=BfZhgiev8wxu/aeEAeTDYKmIBe+9iNzMaApW+wqot5CUkvdxuefTPCmt2/d0qdUmgfAPYZmCuC0GFXAy1NMMJZioQqiMHmvx//NfXvU4mgdaKqDaijaqDLssqWB/qNPXeToAH9cFSR43nzo7hzD6L+gAjCzhU1dKuqgn29sVlAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791301490; c=relaxed/simple;
	bh=RKicG9inSH59LqDyHLo+alN4W8WXccEJ9xYX8pNYrPM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uDHiSf/Tlnh7dmOME7NnNStkHVhnTxIz2bcgCOrX6JvZwgEIYjnE1Odg9FKKIFtEG8pjXbr2OH9DBbekQ18vU5UskL03wp/5gQiC8bXwv3lOwvhJO3g1TxNbd2Ew23JsvGrCqQKOC0X/uKoE/u6IzfVyOsJGkcTYc/mcnt3J+W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E7Eq+qId; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E7Eq+qId"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48c4be28b82so709893f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 08:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791301486; x=1791906286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=84RUWE34pMwpWgLCCXAmF9nLWAHAulXiL4Hx2352KFY=;
        b=E7Eq+qIdeWd7XGM4ku8Dc5vUQr4RksFpj6mFIVUKq6WOhxhlCJGI09CEkCPcKTFP0u
         4v6RAkQctT8VVa0lI2/ZBxOhU8exSjBmDh+vzqZCnNQu0UW21O/IL60CCndGrzdsreMT
         OXHfiXs79ZmgCYeqWr+tQxZx0//qG3RaQhiJwSnJFkgc0uKx8JmJB2Mlr8o9rkg5Y0mB
         lLZvGPW/n3er34Dh9fnxSM3U7UF9FGzsM3pWlAsMu0+w+SmeMiYdgggoOm7B8AdZdqvC
         onYqSYiRtMrze0vkOK0k9QUwmdysA1yBimHgaSutvFFrOa3OkS1UcXKQlHptRMITE1AI
         twXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791301486; x=1791906286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=84RUWE34pMwpWgLCCXAmF9nLWAHAulXiL4Hx2352KFY=;
        b=CCAgePpfjFti++2fg0NnH5r2ZCOubZim20eKFxsBGw2SlygLx390gwlMDDRkMMx3Am
         nusTfx33/yai9uAqZ/crp6Wnfb9cDF0fGIX14wNWn7B475U5jUlNyg3qBl3MZuy/Hp07
         I9uol4cDkxoUWXVisrZlb6do4aWjWLHQ9nrsHqx68oJjkgLLlyRXwRiXJIHNXHfEd5Bo
         iBgc7Y3ScTCoTDYNay0rHCOlJj1tXh+LuWh5TI2aZz7/PFUgYhnU8lvhM0ECyL8edCil
         ioPaInrloiyEeaH3TGuge7aQBWIFlrdculwPrCCTRIA+KuCi90zk1Mj/JwiTCFaSWOq3
         MUYA==
X-Gm-Message-State: AFq9FYKvDS7FoyyM0jtCweu/JPg3pEKYAYgVKg8wI38DtMWFCMJlEAox
	uNkmT49JlnETuiprDDOc++MDcLXCyYu2R03Pbt2BMR8jzWhCVrtLr+FN
X-Gm-Gg: AYBFou2XIiWx4cqN0J5MBcXLUaQftRBnj6ajItTQXhRD4AKZ+rCyiA0c/cBvaDa7HHB
	fYxqflErc7PLXowL/pY4YCkZcS+EFZ5xzruZjv3r2ydVI4/nxnK8XNTIGaP6q/DSNzSVv/5fZcu
	a9+R+zSeVNk0eaoSRLqGrltmUdiF5RjoZMLoYGNWKDSbxUC3gR+t1ssu/68F1dDRR1mdvcpgYJ9
	49XMGHmyKkyZT1+hzm+ORMC9QHtuzT73k4Ibzi0Wvq/a8+RaMbpT5Q9y8SVL7IDRKRXkO1HXvlN
	C9GbyvCzF61rM2nzOZ/4aa1m93qVsd6DEz++MekbXj10JdNzXHbu1ZGokIXD7EemVsV0W16sASo
	fPOd4phldOmiqXe7mkK8g9N7MiCb1S0aabPeP3A3UCXey3LjKFBjltAAJVV9aDbLQStqAgzrrX2
	BGSAOYri4qr064HJHVb1+pfh9fHigVii9ReMUNAXfFT9MFLlc55+dGMB/lpruvbO1/21aIlTp5b
	7RHvGZIACVtsvpP0g0=
X-Received: by 2002:a05:6000:200e:b0:48b:68:592e with SMTP id ffacd0b85a97d-48c6d0f214fmr3093766f8f.4.1791301485534;
        Tue, 06 Oct 2026 08:44:45 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71c0b6e6sm327615f8f.14.2026.10.06.08.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 08:44:44 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 3/7] regulator: lp872x: Fold driver header into driver file
Date: Tue,  6 Oct 2026 18:44:27 +0300
Message-ID: <20261006154431.318936-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261006154431.318936-1-clamor95@gmail.com>
References: <20261006154431.318936-1-clamor95@gmail.com>
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

