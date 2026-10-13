Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6614535FCB
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 18:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791915285; cv=none; b=tobknVX00+xdYgzii1XLfT9TXOo3jSYHWwLyLk1SghzB4u8swqUiE9NxaDSUs+ahB2WSakTYXPY/cogqG6z+A2Zf0N0oT15VRm6tiKwoiUWq0E6c5Ca1DItaxHb3QzCk/9NsC8W4ghmbYWueXVT/Mzl350AhXlLJyRSdzUEXt3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791915285; c=relaxed/simple;
	bh=ypcKL7OHA/Mp3aidesnI7PkLRF47Uxbg+Hs698A49cI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dKF4bPCWnC1DmmxcEoZH/ZQxvIPijbiuCCNu6fhhvHLwMlII+4w8Gr1aLrGEFxQ2HOsJ2/0vVm0/ELpha95dsmuBWNnd0QuHFkQNaAs33lbf+62xmt2BffxyDOAOf1R8VxTeB/kllIUuSKV3D3cwW1DlPt0gPW2JBspekNeLYec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EC8uSwS9; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EC8uSwS9"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49fbb2acc90so28454915e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791915280; x=1792520080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R1c6v+GzYwmvzitf8Fx6L18lOJ1Tc1khL5KUR7+u7xo=;
        b=EC8uSwS9H0/vCLn8CQm3+o5UqysR4iRnzZSn6mIca20ZUmwnwBmwvqjEUubFnjiCvp
         i50n30G9OctJsMlt2NIIRKNf/cIF/vO3sKgHItRIwbrnCcVwp2cMDRUF4ORZtbrR596y
         l0s0AB5kaJY80skd8xnvQ1mHXO8GMrgyARsl3hEDEPuXgxhziH2p0k1uHacfvmgzhLXO
         7CD8Fp4jLxf2aVUYJAZB28W/RnVs1oQljzwd8B4bvOuNI0aDrcg0BqLLJwj4cwawSkSL
         DqmADe6B5Ku8zADwupebyV/ICkdUGGtmG+fg9r7EomNdqafz6OupiLJbfgrOMPNnL11g
         AsKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791915280; x=1792520080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R1c6v+GzYwmvzitf8Fx6L18lOJ1Tc1khL5KUR7+u7xo=;
        b=l7V4mPV1QxPOYaCmwuFbbrF5FQ1MxNzwc4lUM4jikDWRvH1u5phHNzG0bZWPCl2Sny
         DuiJznEgAaQtL/hTcNipi970WGro/y1Lrzo6XGgUoakRMY2vs5E54Xlz2MIeSjNkLjXZ
         6TaK48VBNvdjbPa8fj5UOpDFcET7oTy+bG1P5X1/EQyfq2dlOw0fdJxSKxrV8vUs52bf
         QEEZIUmUZ8u0NMNz3BXx711GkAy8UjmiGAv9cig9GUGImPQJxFgd/waqtDgGPZiEr4Gj
         P7lPErg/I1sTJTBw80JqLrjRSiQ5+w6USAUvVHwcET7z+eTb90UT/3SmTNpTh55ah+mC
         Xszw==
X-Gm-Message-State: AFq9FYIS8DE52gEEYsaB0/bj45fB6Huad+huocwgs3sN/nfIZLxr2Les
	YUzOWVWgRI6RzdmsHH9//nkWtWxDbb1ei0xnBx8e/uoWKS0D9qXaUnN0
X-Gm-Gg: AYBFou3hjf87sY1hT+Mmios1MK4jsNF9GQ8dTTilMH4ucDgIbtVxr8MqcdOTvstv3+g
	RaQ6FXwYOBifERW+AXjH1uS6W1EJQUq+2OagZr57NKXq4s5LG2mgkh35ZT+IwuObqx9QaC3uIML
	GIVCnFD8CN6P4tPrZJGG2b2iZQo1c4DmBhd1fwHgfJleNJq7Z2HTB4ia+ZHYmUhluwaQ8TyVYVy
	VTlouma82fX0Fk9Qvo78WVwBXf3pxgaaF294HEkq1OoE4oDI9TBSXmyi1lNpC2+aU+VNOSLFlXx
	T3K1M/KJFYIWQju/vzH88j7np0/ZEfyRcklqkZ64pdtBuvxcsRdLZi6s+BG547V5aTPRiVIY3DD
	CnBGafrEUCaT8CnGpO6EkgxqTdi7gQJZm/aqLPJZ5T4pw4mvtJrFc2fs/KOfBo2Jg0Wn3HGrpJV
	FRRybdDrBk91c0Be8fCgIo6iPieqMS7cnVO0HTVod2XCDINzrlKB/F7QL8bo6/93qyeHHejug4m
	rfPjjEnlOrxHtz4ub0=
X-Received: by 2002:a05:600c:4e11:b0:4a1:7f41:b9dc with SMTP id 5b1f17b1804b1-4a18e4d67famr268817885e9.23.1791915279782;
        Tue, 13 Oct 2026 11:14:39 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf1358asm383933345e9.4.2026.10.13.11.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 11:14:39 -0700 (PDT)
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
Subject: [PATCH v2 7/7] regulator: lp872x: Use macro to fill regulator descriptor
Date: Tue, 13 Oct 2026 21:14:17 +0300
Message-ID: <20261013181417.492252-8-clamor95@gmail.com>
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

Switch to using the macro for filling the LP872x regulator descriptor
to improve readability.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/regulator/lp872x.c | 275 ++++++++-----------------------------
 1 file changed, 61 insertions(+), 214 deletions(-)

diff --git a/drivers/regulator/lp872x.c b/drivers/regulator/lp872x.c
index 633ac1da1de62..8b95c2cbb0237 100644
--- a/drivers/regulator/lp872x.c
+++ b/drivers/regulator/lp872x.c
@@ -468,82 +468,59 @@ static const struct regulator_ops lp8725_buck_ops = {
 	.get_current_limit = regulator_get_current_limit_regmap,
 };
 
+#define LP872X_LDO(_id, match, supply, _volt_table, _vsel_reg,		\
+		   _enable_reg, _enable_mask) {				\
+	.name = (match),						\
+	.supply_name = (supply),					\
+	.of_match = (match),						\
+	.id = _id,							\
+	.ops = &lp872x_ldo_ops,						\
+	.n_voltages = ARRAY_SIZE(_volt_table),				\
+	.volt_table = _volt_table,					\
+	.type = REGULATOR_VOLTAGE,					\
+	.owner = THIS_MODULE,						\
+	.vsel_reg = _vsel_reg,						\
+	.vsel_mask = LP872X_VOUT_M,					\
+	.enable_reg = _enable_reg,					\
+	.enable_mask = _enable_mask,					\
+}
+
+#define LP8720_LDO(ids, match, supply, _volt_table)			\
+	LP872X_LDO(LP8720_ID_##ids, match, supply, _volt_table,		\
+		   LP872X_##ids##_VOUT, LP8720_ENABLE, LP872X_EN_##ids##_M)
+
+#define LP8725_LDO(ids, match, supply)					\
+	LP872X_LDO(LP8725_ID_##ids, match, supply, lp872x_ldo_vtbl,	\
+		   LP872X_##ids##_VOUT, LP8725_LDO_CTRL, LP872X_EN_##ids##_M)
+
+#define LP8725_LILO(ids, match, supply)					\
+	LP872X_LDO(LP8725_ID_##ids, match, supply, lp8725_lilo_vtbl,	\
+		   LP8725_##ids##_VOUT, LP8725_LDO_CTRL, LP8725_EN_##ids##_M)
+
+#define LP8725_BUCK(ids, match) {					\
+	.name = (match),						\
+	.supply_name = "vinb",						\
+	.of_match = (match),						\
+	.id = LP8725_ID_##ids,						\
+	.ops = &lp8725_buck_ops,					\
+	.n_voltages = ARRAY_SIZE(lp8725_buck_vtbl),			\
+	.volt_table = lp8725_buck_vtbl,					\
+	.type = REGULATOR_VOLTAGE,					\
+	.owner = THIS_MODULE,						\
+	.enable_reg = LP872X_GENERAL_CFG,				\
+	.enable_mask = LP8725_##ids##_EN_M,				\
+	.curr_table = lp8725_buck_uA,					\
+	.n_current_limits = ARRAY_SIZE(lp8725_buck_uA),			\
+	.csel_reg = LP8725_##ids##_VOUT2,				\
+	.csel_mask = LP8725_BUCK_CL_M,					\
+}
+
 static const struct regulator_desc lp8720_regulator_desc[] = {
-	{
-		.name = "ldo1",
-		.supply_name = "vbatt",
-		.of_match = of_match_ptr("ldo1"),
-		.id = LP8720_ID_LDO1,
-		.ops = &lp872x_ldo_ops,
-		.n_voltages = ARRAY_SIZE(lp872x_ldo_vtbl),
-		.volt_table = lp872x_ldo_vtbl,
-		.type = REGULATOR_VOLTAGE,
-		.owner = THIS_MODULE,
-		.vsel_reg = LP872X_LDO1_VOUT,
-		.vsel_mask = LP872X_VOUT_M,
-		.enable_reg = LP8720_ENABLE,
-		.enable_mask = LP872X_EN_LDO1_M,
-	},
-	{
-		.name = "ldo2",
-		.supply_name = "vin1",
-		.of_match = of_match_ptr("ldo2"),
-		.id = LP8720_ID_LDO2,
-		.ops = &lp872x_ldo_ops,
-		.n_voltages = ARRAY_SIZE(lp872x_ldo_vtbl),
-		.volt_table = lp872x_ldo_vtbl,
-		.type = REGULATOR_VOLTAGE,
-		.owner = THIS_MODULE,
-		.vsel_reg = LP872X_LDO2_VOUT,
-		.vsel_mask = LP872X_VOUT_M,
-		.enable_reg = LP8720_ENABLE,
-		.enable_mask = LP872X_EN_LDO2_M,
-	},
-	{
-		.name = "ldo3",
-		.supply_name = "vin1",
-		.of_match = of_match_ptr("ldo3"),
-		.id = LP8720_ID_LDO3,
-		.ops = &lp872x_ldo_ops,
-		.n_voltages = ARRAY_SIZE(lp872x_ldo_vtbl),
-		.volt_table = lp872x_ldo_vtbl,
-		.type = REGULATOR_VOLTAGE,
-		.owner = THIS_MODULE,
-		.vsel_reg = LP872X_LDO3_VOUT,
-		.vsel_mask = LP872X_VOUT_M,
-		.enable_reg = LP8720_ENABLE,
-		.enable_mask = LP872X_EN_LDO3_M,
-	},
-	{
-		.name = "ldo4",
-		.supply_name = "vin2",
-		.of_match = of_match_ptr("ldo4"),
-		.id = LP8720_ID_LDO4,
-		.ops = &lp872x_ldo_ops,
-		.n_voltages = ARRAY_SIZE(lp8720_ldo4_vtbl),
-		.volt_table = lp8720_ldo4_vtbl,
-		.type = REGULATOR_VOLTAGE,
-		.owner = THIS_MODULE,
-		.vsel_reg = LP872X_LDO4_VOUT,
-		.vsel_mask = LP872X_VOUT_M,
-		.enable_reg = LP8720_ENABLE,
-		.enable_mask = LP872X_EN_LDO4_M,
-	},
-	{
-		.name = "ldo5",
-		.supply_name = "vin2",
-		.of_match = of_match_ptr("ldo5"),
-		.id = LP8720_ID_LDO5,
-		.ops = &lp872x_ldo_ops,
-		.n_voltages = ARRAY_SIZE(lp872x_ldo_vtbl),
-		.volt_table = lp872x_ldo_vtbl,
-		.type = REGULATOR_VOLTAGE,
-		.owner = THIS_MODULE,
-		.vsel_reg = LP872X_LDO5_VOUT,
-		.vsel_mask = LP872X_VOUT_M,
-		.enable_reg = LP8720_ENABLE,
-		.enable_mask = LP872X_EN_LDO5_M,
-	},
+	LP8720_LDO(LDO1, "ldo1", "vbatt", lp872x_ldo_vtbl),
+	LP8720_LDO(LDO2, "ldo2", "vin1", lp872x_ldo_vtbl),
+	LP8720_LDO(LDO3, "ldo3", "vin1", lp872x_ldo_vtbl),
+	LP8720_LDO(LDO4, "ldo4", "vin2", lp8720_ldo4_vtbl),
+	LP8720_LDO(LDO5, "ldo5", "vin2", lp872x_ldo_vtbl),
 	{
 		.name = "buck",
 		.supply_name = "vinb",
@@ -560,145 +537,15 @@ static const struct regulator_desc lp8720_regulator_desc[] = {
 };
 
 static const struct regulator_desc lp8725_regulator_desc[] = {
-	{
-		.name = "ldo1",
-		.supply_name = "vin1",
-		.of_match = of_match_ptr("ldo1"),
-		.id = LP8725_ID_LDO1,
-		.ops = &lp872x_ldo_ops,
-		.n_voltages = ARRAY_SIZE(lp872x_ldo_vtbl),
-		.volt_table = lp872x_ldo_vtbl,
-		.type = REGULATOR_VOLTAGE,
-		.owner = THIS_MODULE,
-		.vsel_reg = LP872X_LDO1_VOUT,
-		.vsel_mask = LP872X_VOUT_M,
-		.enable_reg = LP8725_LDO_CTRL,
-		.enable_mask = LP872X_EN_LDO1_M,
-	},
-	{
-		.name = "ldo2",
-		.supply_name = "vin2",
-		.of_match = of_match_ptr("ldo2"),
-		.id = LP8725_ID_LDO2,
-		.ops = &lp872x_ldo_ops,
-		.n_voltages = ARRAY_SIZE(lp872x_ldo_vtbl),
-		.volt_table = lp872x_ldo_vtbl,
-		.type = REGULATOR_VOLTAGE,
-		.owner = THIS_MODULE,
-		.vsel_reg = LP872X_LDO2_VOUT,
-		.vsel_mask = LP872X_VOUT_M,
-		.enable_reg = LP8725_LDO_CTRL,
-		.enable_mask = LP872X_EN_LDO2_M,
-	},
-	{
-		.name = "ldo3",
-		.supply_name = "vin2",
-		.of_match = of_match_ptr("ldo3"),
-		.id = LP8725_ID_LDO3,
-		.ops = &lp872x_ldo_ops,
-		.n_voltages = ARRAY_SIZE(lp872x_ldo_vtbl),
-		.volt_table = lp872x_ldo_vtbl,
-		.type = REGULATOR_VOLTAGE,
-		.owner = THIS_MODULE,
-		.vsel_reg = LP872X_LDO3_VOUT,
-		.vsel_mask = LP872X_VOUT_M,
-		.enable_reg = LP8725_LDO_CTRL,
-		.enable_mask = LP872X_EN_LDO3_M,
-	},
-	{
-		.name = "ldo4",
-		.supply_name = "vin3",
-		.of_match = of_match_ptr("ldo4"),
-		.id = LP8725_ID_LDO4,
-		.ops = &lp872x_ldo_ops,
-		.n_voltages = ARRAY_SIZE(lp872x_ldo_vtbl),
-		.volt_table = lp872x_ldo_vtbl,
-		.type = REGULATOR_VOLTAGE,
-		.owner = THIS_MODULE,
-		.vsel_reg = LP872X_LDO4_VOUT,
-		.vsel_mask = LP872X_VOUT_M,
-		.enable_reg = LP8725_LDO_CTRL,
-		.enable_mask = LP872X_EN_LDO4_M,
-	},
-	{
-		.name = "ldo5",
-		.supply_name = "vin3",
-		.of_match = of_match_ptr("ldo5"),
-		.id = LP8725_ID_LDO5,
-		.ops = &lp872x_ldo_ops,
-		.n_voltages = ARRAY_SIZE(lp872x_ldo_vtbl),
-		.volt_table = lp872x_ldo_vtbl,
-		.type = REGULATOR_VOLTAGE,
-		.owner = THIS_MODULE,
-		.vsel_reg = LP872X_LDO5_VOUT,
-		.vsel_mask = LP872X_VOUT_M,
-		.enable_reg = LP8725_LDO_CTRL,
-		.enable_mask = LP872X_EN_LDO5_M,
-	},
-	{
-		.name = "lilo1",
-		.supply_name = "vinlilo1",
-		.of_match = of_match_ptr("lilo1"),
-		.id = LP8725_ID_LILO1,
-		.ops = &lp872x_ldo_ops,
-		.n_voltages = ARRAY_SIZE(lp8725_lilo_vtbl),
-		.volt_table = lp8725_lilo_vtbl,
-		.type = REGULATOR_VOLTAGE,
-		.owner = THIS_MODULE,
-		.vsel_reg = LP8725_LILO1_VOUT,
-		.vsel_mask = LP872X_VOUT_M,
-		.enable_reg = LP8725_LDO_CTRL,
-		.enable_mask = LP8725_EN_LILO1_M,
-	},
-	{
-		.name = "lilo2",
-		.supply_name = "vinlilo2",
-		.of_match = of_match_ptr("lilo2"),
-		.id = LP8725_ID_LILO2,
-		.ops = &lp872x_ldo_ops,
-		.n_voltages = ARRAY_SIZE(lp8725_lilo_vtbl),
-		.volt_table = lp8725_lilo_vtbl,
-		.type = REGULATOR_VOLTAGE,
-		.owner = THIS_MODULE,
-		.vsel_reg = LP8725_LILO2_VOUT,
-		.vsel_mask = LP872X_VOUT_M,
-		.enable_reg = LP8725_LDO_CTRL,
-		.enable_mask = LP8725_EN_LILO2_M,
-	},
-	{
-		.name = "buck1",
-		.supply_name = "vinb",
-		.of_match = of_match_ptr("buck1"),
-		.id = LP8725_ID_BUCK1,
-		.ops = &lp8725_buck_ops,
-		.n_voltages = ARRAY_SIZE(lp8725_buck_vtbl),
-		.volt_table = lp8725_buck_vtbl,
-		.type = REGULATOR_VOLTAGE,
-		.owner = THIS_MODULE,
-		.enable_reg = LP872X_GENERAL_CFG,
-		.enable_mask = LP8725_BUCK1_EN_M,
-		.curr_table = lp8725_buck_uA,
-		.n_current_limits = ARRAY_SIZE(lp8725_buck_uA),
-		.csel_reg = LP8725_BUCK1_VOUT2,
-		.csel_mask = LP8725_BUCK_CL_M,
-	},
-	{
-		.name = "buck2",
-		.supply_name = "vinb",
-		.of_match = of_match_ptr("buck2"),
-		.id = LP8725_ID_BUCK2,
-		.ops = &lp8725_buck_ops,
-		.n_voltages = ARRAY_SIZE(lp8725_buck_vtbl),
-		.volt_table = lp8725_buck_vtbl,
-		.type = REGULATOR_VOLTAGE,
-		.owner = THIS_MODULE,
-		.enable_reg = LP872X_GENERAL_CFG,
-		.enable_mask = LP8725_BUCK2_EN_M,
-		.curr_table = lp8725_buck_uA,
-		.n_current_limits = ARRAY_SIZE(lp8725_buck_uA),
-		.csel_reg = LP8725_BUCK2_VOUT2,
-		.csel_mask = LP8725_BUCK_CL_M,
-	},
+	LP8725_LDO(LDO1, "ldo1", "vin1"),
+	LP8725_LDO(LDO2, "ldo2", "vin2"),
+	LP8725_LDO(LDO3, "ldo3", "vin2"),
+	LP8725_LDO(LDO4, "ldo4", "vin3"),
+	LP8725_LDO(LDO5, "ldo5", "vin3"),
+	LP8725_LILO(LILO1, "lilo1", "vinlilo1"),
+	LP8725_LILO(LILO2, "lilo2", "vinlilo2"),
+	LP8725_BUCK(BUCK1, "buck1"),
+	LP8725_BUCK(BUCK2, "buck2"),
 };
 
 static int lp872x_init_dvs(struct lp872x *lp)
-- 
2.53.0

