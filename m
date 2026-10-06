Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A041749E134
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 15:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791301494; cv=none; b=bEp9SBeNizWRg0m3wRPTbqXLYTN3l2/Fa3t6Asns/EPCvQm4R1/qEfrOaaZMG1TG9g0SaF4/7VSr5c2mR7BQPehRBVWVWzLDIvZYgMNsLuMKichRzQKJHs4iDDDs0obMCYn1EyWIhYlfqxy0hxUX1H+tZbqO7dAVHYwyrLn2tZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791301494; c=relaxed/simple;
	bh=dKlQacMir1ApaDAGC8DxFBjOYGKy//CZvezCT/HIEII=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jCkneR/G/Tp66vscsaTPHFiiIfIB511rBEtp7fozWd9D5IOo1x76piSs2SdERbXr42aHCsGa124weP3+dTeNT56wewYr2H7G19BGSpveRXGk3sYBv8VR1rT3H2gbX2VofjVqis34GpibnBLFTHQ1pPciUWp8JqyxoDKsZdnquWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BQhVbJbp; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BQhVbJbp"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48c14a06c95so730343f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 08:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791301488; x=1791906288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AUaSIS8wHeIRIGqtBybQnix8JEVHTTvzxonmZPvVHuo=;
        b=BQhVbJbpC8KPKGhhvFnSM8AVPuVHQR4I6DU1CV7tPnUOw2CsENuMv8d+0YBXhN+LuS
         +NM3717qvDv4Iv+vjOtli5gO5HuIg96gNvwqZeZBEJCVsqfzLVTiaSFh8zeC+gQPEXn7
         RE/gGiUFce3Qd4qT0Dxhk5tzYZlHUaqiy2gQAEKnUzzMEm+tulA7PvWaY3yWs6P54VEp
         FqV4gFvd/HN1r/xWUkKnYwLcjXDke7hdF4jV4hKKum4z+l9DfZ9S4qnYuR2ZDMGlZLkH
         ZRbKW0acWgsKWCQK4DzDOHs82EewnpaOzwy1tCMLyz5JIzWBRnkTyS+L9oUL8LvhgqRy
         Jlvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791301488; x=1791906288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AUaSIS8wHeIRIGqtBybQnix8JEVHTTvzxonmZPvVHuo=;
        b=pQouXe0Bg9AG6xvpTAV3TMP1vHIbmjEr51dTxOYcm2v3NKnp32m1S+JLO1eOlFqmFE
         2lWR9vxwOC0QLq3ctt6R2bp0Efoyc7NUkvBPKm9WQHBFwgBKtklQYDQGOTqiK7AIlngt
         uJR/3rc6UuoW3vek+/pcl4Miud8Lj9N5ZCiNpEVMrDtaTSGneDzBTUyQmFG9RLF/vfBC
         FOfSNDe9RhqHTox08Cybxe471huyBoiiIWvEwvgzclr3BY30uEfknpXLZlE7CWnV4Zly
         W61+vYodQ3X+xGTuD1xqK0s6vkGgIV715Dina7rD2v6S/I2JlK2Zlv9+TaXIrsf2H+Lp
         XHqw==
X-Gm-Message-State: AFq9FYJc7sRYo1Kkj8NSKbbf+wyxhlTuPHG8LD4Vw9tmlXgUS55Z5TX2
	65ZBv965i/8nnTgsYBJ6OHTG7p3iKSCFfFgj7+Ir/9kjQ5a7rr1xUgi9
X-Gm-Gg: AYBFou3eMhKl+g7rSH7hWTILFFJOmEfE3iT/ejogkBUqe3ZtOveVnBtw1UDshOnwKK6
	3Y9Ngo/ethnbodg0Iw4wBw2r/L8DqcbIHkLyddOZw2JPTC4OAVAbK/+8iS182eP3bAeyzUw2kNG
	Fzmand50AfgoNIluA6Adbe7q/4k4TzXRwFKt7xpWXAOOVSANh8ojNUcXlwZmNKq0X1Wi1Z1xWat
	/oIeCgSo8LgI7uIJRPmh7btC7wfABK8aHdxTmBTDN7by/2e3fnJbiHAz3YJmjg9DMudqTtNics2
	68iGxYIM8ZIUgTomxINixqiWZgBF6xZ2MqYK1k9YfCfO90EYjT/fKzHXlp7ftoXZFHP+N182x0j
	HpbTveRyZQYQP9ZlOXrGY7A/drWJBfI95vAHosuNkmZsHN/CCIOdRZ4HeUxvyOL2jS2JbZoMcaN
	e80V+55rGvfpzVnyzu8cJ1uYRuf8q1Zs9aKzjk1WWfYDpyNgq9dJr2L6CIHTPF44Sg0X7Mbpda3
	/jkXIapTFdIN6wVU+c=
X-Received: by 2002:a05:6000:1786:b0:48c:571a:a197 with SMTP id ffacd0b85a97d-48c6d1c3e55mr3237214f8f.25.1791301488280;
        Tue, 06 Oct 2026 08:44:48 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71c0b6e6sm327615f8f.14.2026.10.06.08.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 08:44:47 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 5/7] regulator: lp872x: Remove platform_data based probing
Date: Tue,  6 Oct 2026 18:44:29 +0300
Message-ID: <20261006154431.318936-6-clamor95@gmail.com>
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

The platform_data-based probing is tightly integrated into the lp872x
driver structure itself; removing just the platform data support is
impossible without remodeling major parts of the probe sequence.

The lp872x_platform_data structure was removed, and its contents were
incorporated into the driver private structure and lp872x_chip_info (which
holds differences between the LP8720 and LP8725). The
lp872x_populate_pdata_from_dt() helper was removed: general Device Tree
parsing code was integrated directly into the probe function, and
DVS-related code was consolidated into lp872x_init_dvs().
lp872x_hw_enable() and lp872x_config() helpers were folded into probe().
i2c_client_get_device_id() was switched to i2c_get_match_data(). Finally,
of_regulator_match structures were dropped, and
lp872x_regulator_register() was upgraded to rely on the core regulator
registration framework.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/regulator/lp872x.c | 320 ++++++++++---------------------------
 1 file changed, 84 insertions(+), 236 deletions(-)

diff --git a/drivers/regulator/lp872x.c b/drivers/regulator/lp872x.c
index 1e16d7e8361a0..3d95ca7fa0246 100644
--- a/drivers/regulator/lp872x.c
+++ b/drivers/regulator/lp872x.c
@@ -14,7 +14,7 @@
 #include <linux/delay.h>
 #include <linux/regulator/driver.h>
 #include <linux/platform_device.h>
-#include <linux/of.h>
+#include <linux/property.h>
 #include <linux/regulator/machine.h>
 #include <linux/regulator/of_regulator.h>
 
@@ -92,8 +92,6 @@
 /* dump registers in regmap-debugfs */
 #define MAX_REGISTERS			0x0F
 
-#define LP872X_MAX_REGULATORS		9
-
 #define LP8720_ENABLE_DELAY		200
 #define LP8725_ENABLE_DELAY		30000
 
@@ -130,31 +128,22 @@ enum lp872x_dvs_sel {
 	SEL_V2,
 };
 
-struct lp872x_dvs {
-	struct gpio_desc *gpio;
-	enum lp872x_dvs_sel vsel;
-	enum gpiod_flags init_state;
-};
-
-struct lp872x_regulator_data {
-	enum lp872x_regulator_id id;
-	struct regulator_init_data *init_data;
-};
-
-struct lp872x_platform_data {
-	u8 general_config;
-	bool update_config;
-	struct lp872x_regulator_data regulator_data[LP872X_MAX_REGULATORS];
-	struct lp872x_dvs *dvs;
-	struct gpio_desc *enable_gpio;
+struct lp872x_chip_info {
+	const struct regulator_desc *rdesc;
+	int num_regulators;
+	enum lp872x_id chipid;
 };
 
 struct lp872x {
 	struct regmap *regmap;
 	struct device *dev;
-	enum lp872x_id chipid;
-	struct lp872x_platform_data *pdata;
-	int num_regulators;
+
+	struct gpio_desc *enable_gpio;
+	struct gpio_desc *dvs_gpio;
+
+	const struct lp872x_chip_info *info;
+
+	enum lp872x_dvs_sel vsel;
 	enum gpiod_flags dvs_pin;
 };
 
@@ -206,7 +195,7 @@ static const unsigned int lp8725_buck_uA[] = {
 
 static int lp872x_get_timestep_usec(struct lp872x *lp)
 {
-	enum lp872x_id chip = lp->chipid;
+	enum lp872x_id chip = lp->info->chipid;
 	u32 val, mask, shift;
 	int *time_usec, size, ret;
 	int lp8720_time_usec[] = { 25, 50 };
@@ -344,10 +333,9 @@ static int lp872x_buck_set_voltage_sel(struct regulator_dev *rdev,
 	struct lp872x *lp = rdev_get_drvdata(rdev);
 	enum lp872x_regulator_id buck = rdev_get_id(rdev);
 	u32 addr, mask = LP872X_VOUT_M;
-	struct lp872x_dvs *dvs = lp->pdata ? lp->pdata->dvs : NULL;
 
-	if (dvs && dvs->gpio)
-		lp872x_set_dvs(lp, dvs->vsel, dvs->gpio);
+	if (lp->dvs_gpio)
+		lp872x_set_dvs(lp, lp->vsel, lp->dvs_gpio);
 
 	addr = lp872x_select_buck_vout_addr(lp, buck);
 	if (!lp872x_is_valid_buck_addr(addr))
@@ -700,110 +688,45 @@ static const struct regulator_desc lp8725_regulator_desc[] = {
 
 static int lp872x_init_dvs(struct lp872x *lp)
 {
-	struct lp872x_dvs *dvs = lp->pdata ? lp->pdata->dvs : NULL;
-	enum gpiod_flags pinstate;
+	struct device *dev = lp->dev;
 	u32 mask[] = { LP8720_EXT_DVS_M, LP8725_DVS1_M | LP8725_DVS2_M };
 	u32 default_dvs_mode[] = { LP8720_DEFAULT_DVS, LP8725_DEFAULT_DVS };
+	u8 dvs_state;
 
-	if (!dvs)
-		goto set_default_dvs_mode;
-
-	if (!dvs->gpio)
-		goto set_default_dvs_mode;
-
-	pinstate = dvs->init_state;
-	dvs->gpio = devm_gpiod_get_optional(lp->dev, "ti,dvs", pinstate);
-
-	if (IS_ERR(dvs->gpio)) {
-		dev_err(lp->dev, "gpio request err: %ld\n", PTR_ERR(dvs->gpio));
-		return PTR_ERR(dvs->gpio);
-	}
-
-	lp->dvs_pin = pinstate;
-
-	return 0;
-
-set_default_dvs_mode:
-	return regmap_update_bits(lp->regmap, LP872X_GENERAL_CFG, mask[lp->chipid],
-				  default_dvs_mode[lp->chipid]);
-}
-
-static int lp872x_hw_enable(struct lp872x *lp)
-{
-	if (!lp->pdata)
-		return -EINVAL;
-
-	if (!lp->pdata->enable_gpio)
-		return 0;
+	device_property_read_u8(dev, "ti,dvs-vsel", (u8 *)&lp->vsel);
+	device_property_read_u8(dev, "ti,dvs-state", &dvs_state);
+	lp->dvs_pin = dvs_state ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW;
 
-	/* Always set enable GPIO high. */
-	lp->pdata->enable_gpio = devm_gpiod_get_optional(lp->dev, "enable", GPIOD_OUT_HIGH);
-	if (IS_ERR(lp->pdata->enable_gpio)) {
-		dev_err(lp->dev, "gpio request err: %ld\n", PTR_ERR(lp->pdata->enable_gpio));
-		return PTR_ERR(lp->pdata->enable_gpio);
+	lp->dvs_gpio = devm_gpiod_get_optional(dev, "dvs", lp->dvs_pin);
+	if (IS_ERR(lp->dvs_gpio)) {
+		dev_err(dev, "gpio request err: %ld\n", PTR_ERR(lp->dvs_gpio));
+		return PTR_ERR(lp->dvs_gpio);
 	}
 
-	/* Each chip has a different enable delay. */
-	if (lp->chipid == LP8720)
-		usleep_range(LP8720_ENABLE_DELAY, 1.5 * LP8720_ENABLE_DELAY);
-	else
-		usleep_range(LP8725_ENABLE_DELAY, 1.5 * LP8725_ENABLE_DELAY);
+	if (!lp->dvs_gpio)
+		return regmap_update_bits(lp->regmap, LP872X_GENERAL_CFG,
+					  mask[lp->info->chipid],
+					  default_dvs_mode[lp->info->chipid]);
 
 	return 0;
 }
 
-static int lp872x_config(struct lp872x *lp)
-{
-	struct lp872x_platform_data *pdata = lp->pdata;
-	int ret;
-
-	if (!pdata || !pdata->update_config)
-		goto init_dvs;
-
-	ret = regmap_write(lp->regmap, LP872X_GENERAL_CFG, pdata->general_config);
-	if (ret)
-		return ret;
-
-init_dvs:
-	return lp872x_init_dvs(lp);
-}
-
-static struct regulator_init_data
-*lp872x_find_regulator_init_data(int id, struct lp872x *lp)
-{
-	struct lp872x_platform_data *pdata = lp->pdata;
-	int i;
-
-	if (!pdata)
-		return NULL;
-
-	for (i = 0; i < lp->num_regulators; i++) {
-		if (pdata->regulator_data[i].id == id)
-			return pdata->regulator_data[i].init_data;
-	}
-
-	return NULL;
-}
-
 static int lp872x_regulator_register(struct lp872x *lp)
 {
-	const struct regulator_desc *desc;
+	const struct regulator_desc *desc = lp->info->rdesc;
+	int num_regulators = lp->info->num_regulators;
 	struct regulator_config cfg = { };
+	struct device *dev = lp->dev;
 	struct regulator_dev *rdev;
-	int i;
-
-	for (i = 0; i < lp->num_regulators; i++) {
-		desc = (lp->chipid == LP8720) ? &lp8720_regulator_desc[i] :
-						&lp8725_regulator_desc[i];
 
-		cfg.dev = lp->dev;
-		cfg.init_data = lp872x_find_regulator_init_data(desc->id, lp);
-		cfg.driver_data = lp;
-		cfg.regmap = lp->regmap;
+	cfg.dev = dev;
+	cfg.driver_data = lp;
+	cfg.regmap = lp->regmap;
 
-		rdev = devm_regulator_register(lp->dev, desc, &cfg);
+	for (int i = 0; i < num_regulators; i++) {
+		rdev = devm_regulator_register(dev, &desc[i], &cfg);
 		if (IS_ERR(rdev)) {
-			dev_err(lp->dev, "regulator register err");
+			dev_err(dev, "regulator register err");
 			return PTR_ERR(rdev);
 		}
 	}
@@ -817,152 +740,77 @@ static const struct regmap_config lp872x_regmap_config = {
 	.max_register = MAX_REGISTERS,
 };
 
-#ifdef CONFIG_OF
-
-#define LP872X_VALID_OPMODE	(REGULATOR_MODE_FAST | REGULATOR_MODE_NORMAL)
-
-static struct of_regulator_match lp8720_matches[] = {
-	{ .name = "ldo1", .driver_data = (void *)LP8720_ID_LDO1, },
-	{ .name = "ldo2", .driver_data = (void *)LP8720_ID_LDO2, },
-	{ .name = "ldo3", .driver_data = (void *)LP8720_ID_LDO3, },
-	{ .name = "ldo4", .driver_data = (void *)LP8720_ID_LDO4, },
-	{ .name = "ldo5", .driver_data = (void *)LP8720_ID_LDO5, },
-	{ .name = "buck", .driver_data = (void *)LP8720_ID_BUCK, },
-};
-
-static struct of_regulator_match lp8725_matches[] = {
-	{ .name = "ldo1", .driver_data = (void *)LP8725_ID_LDO1, },
-	{ .name = "ldo2", .driver_data = (void *)LP8725_ID_LDO2, },
-	{ .name = "ldo3", .driver_data = (void *)LP8725_ID_LDO3, },
-	{ .name = "ldo4", .driver_data = (void *)LP8725_ID_LDO4, },
-	{ .name = "ldo5", .driver_data = (void *)LP8725_ID_LDO5, },
-	{ .name = "lilo1", .driver_data = (void *)LP8725_ID_LILO1, },
-	{ .name = "lilo2", .driver_data = (void *)LP8725_ID_LILO2, },
-	{ .name = "buck1", .driver_data = (void *)LP8725_ID_BUCK1, },
-	{ .name = "buck2", .driver_data = (void *)LP8725_ID_BUCK2, },
-};
-
-static struct lp872x_platform_data
-*lp872x_populate_pdata_from_dt(struct device *dev, enum lp872x_id which)
-{
-	struct device_node *np = dev->of_node;
-	struct lp872x_platform_data *pdata;
-	struct of_regulator_match *match;
-	int num_matches;
-	int count;
-	int i;
-	u8 dvs_state;
-
-	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
-	if (!pdata)
-		return ERR_PTR(-ENOMEM);
-
-	of_property_read_u8(np, "ti,general-config", &pdata->general_config);
-	pdata->update_config = of_property_read_bool(np, "ti,update-config");
-
-	pdata->dvs = devm_kzalloc(dev, sizeof(struct lp872x_dvs), GFP_KERNEL);
-	if (!pdata->dvs)
-		return ERR_PTR(-ENOMEM);
-
-	of_property_read_u8(np, "ti,dvs-vsel", (u8 *)&pdata->dvs->vsel);
-	of_property_read_u8(np, "ti,dvs-state", &dvs_state);
-	pdata->dvs->init_state = dvs_state ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW;
-
-	if (of_get_child_count(np) == 0)
-		goto out;
-
-	switch (which) {
-	case LP8720:
-		match = lp8720_matches;
-		num_matches = ARRAY_SIZE(lp8720_matches);
-		break;
-	case LP8725:
-		match = lp8725_matches;
-		num_matches = ARRAY_SIZE(lp8725_matches);
-		break;
-	default:
-		goto out;
-	}
-
-	count = of_regulator_match(dev, np, match, num_matches);
-	if (count <= 0)
-		goto out;
-
-	for (i = 0; i < num_matches; i++) {
-		pdata->regulator_data[i].id =
-				(uintptr_t)match[i].driver_data;
-		pdata->regulator_data[i].init_data = match[i].init_data;
-	}
-out:
-	return pdata;
-}
-#else
-static struct lp872x_platform_data
-*lp872x_populate_pdata_from_dt(struct device *dev, enum lp872x_id which)
-{
-	return NULL;
-}
-#endif
-
 static int lp872x_probe(struct i2c_client *cl)
 {
-	const struct i2c_device_id *id = i2c_client_get_device_id(cl);
+	struct device *dev = &cl->dev;
 	struct lp872x *lp;
-	struct lp872x_platform_data *pdata;
+	u8 general_config;
 	int ret;
-	static const int lp872x_num_regulators[] = {
-		[LP8720] = LP8720_NUM_REGULATORS,
-		[LP8725] = LP8725_NUM_REGULATORS,
-	};
-
-	if (cl->dev.of_node) {
-		pdata = lp872x_populate_pdata_from_dt(&cl->dev,
-					      (enum lp872x_id)id->driver_data);
-		if (IS_ERR(pdata))
-			return PTR_ERR(pdata);
-	} else {
-		pdata = dev_get_platdata(&cl->dev);
-	}
 
-	lp = devm_kzalloc(&cl->dev, sizeof(struct lp872x), GFP_KERNEL);
+	lp = devm_kzalloc(dev, sizeof(*lp), GFP_KERNEL);
 	if (!lp)
 		return -ENOMEM;
 
-	lp->num_regulators = lp872x_num_regulators[id->driver_data];
+	lp->info = i2c_get_match_data(cl);
+	if (!lp->info)
+		return -ENODEV;
 
 	lp->regmap = devm_regmap_init_i2c(cl, &lp872x_regmap_config);
-	if (IS_ERR(lp->regmap)) {
-		ret = PTR_ERR(lp->regmap);
-		dev_err(&cl->dev, "regmap init i2c err: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(lp->regmap))
+		return dev_err_probe(dev, PTR_ERR(lp->regmap),
+				     "Failed to init regmap\n");
 
-	lp->dev = &cl->dev;
-	lp->pdata = pdata;
-	lp->chipid = id->driver_data;
+	lp->dev = dev;
 	i2c_set_clientdata(cl, lp);
 
-	ret = lp872x_hw_enable(lp);
-	if (ret)
-		return ret;
+	/* Always set enable GPIO high. */
+	lp->enable_gpio = devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_HIGH);
+	if (IS_ERR(lp->enable_gpio))
+		return dev_err_probe(dev, PTR_ERR(lp->enable_gpio),
+				     "Failed to request gpio\n");
+
+	/* Each chip has a different enable delay. */
+	if (lp->info->chipid == LP8720)
+		usleep_range(LP8720_ENABLE_DELAY, 1.5 * LP8720_ENABLE_DELAY);
+	else
+		usleep_range(LP8725_ENABLE_DELAY, 1.5 * LP8725_ENABLE_DELAY);
 
-	ret = lp872x_config(lp);
+	device_property_read_u8(dev, "ti,general-config", &general_config);
+	if (device_property_read_bool(dev, "ti,update-config")) {
+		ret = regmap_write(lp->regmap, LP872X_GENERAL_CFG, general_config);
+		if (ret)
+			return ret;
+	}
+
+	ret = lp872x_init_dvs(lp);
 	if (ret)
 		return ret;
 
 	return lp872x_regulator_register(lp);
 }
 
-static const struct of_device_id lp872x_dt_ids[] __maybe_unused = {
-	{ .compatible = "ti,lp8720", },
-	{ .compatible = "ti,lp8725", },
+static const struct lp872x_chip_info lp8720_data = {
+	.rdesc = lp8720_regulator_desc,
+	.num_regulators = LP8720_NUM_REGULATORS,
+	.chipid = LP8720,
+};
+
+static const struct lp872x_chip_info lp8725_data = {
+	.rdesc = lp8725_regulator_desc,
+	.num_regulators = LP8725_NUM_REGULATORS,
+	.chipid = LP8725,
+};
+
+static const struct of_device_id lp872x_dt_ids[] = {
+	{ .compatible = "ti,lp8720", .data = &lp8720_data },
+	{ .compatible = "ti,lp8725", .data = &lp8725_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, lp872x_dt_ids);
 
 static const struct i2c_device_id lp872x_ids[] = {
-	{ .name = "lp8720", .driver_data = LP8720 },
-	{ .name = "lp8725", .driver_data = LP8725 },
+	{ .name = "lp8720", .driver_data = (kernel_ulong_t)&lp8720_data },
+	{ .name = "lp8725", .driver_data = (kernel_ulong_t)&lp8725_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lp872x_ids);
@@ -971,7 +819,7 @@ static struct i2c_driver lp872x_driver = {
 	.driver = {
 		.name = "lp872x",
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
-		.of_match_table = of_match_ptr(lp872x_dt_ids),
+		.of_match_table = lp872x_dt_ids,
 	},
 	.probe = lp872x_probe,
 	.id_table = lp872x_ids,
-- 
2.53.0

