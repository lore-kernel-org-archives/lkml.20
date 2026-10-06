Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB92049E5C2
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 15:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791301499; cv=none; b=CQ7eo6hrD7A/rxj7GHdOU8dtjplhl71l7jRM3yXYP4n/FgmzMvWPFFf2Ox4phh5Pga7+pwHfKbUvbp3X7V3vrcrSuEE1i8npBuzeVp+MCeLlaTVJnJTD+Gtg6Dgbh7RFwhSdh4RrBgjlUM9pvXtdFJnBwDSBRKYbGsjYIAIT1WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791301499; c=relaxed/simple;
	bh=hD0P/D8ymZExaWeHcihiPgGR4gEN/s39kQmLT6Qnxs4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W5r84T7MqNQruVSH5C9BqhAxS5XHId07X+VW5u+4C2KBsF6vXoyDAb/VMYL0RNJITlmxyb8JPHfxHFqPRx3gZ2Pe92VMcvWNO+1s0i+/LwM5cRQggAiJAy3JE/HT+0rCFUg4lj4fI/cXRqlR3qeiHnh+m10Zk6VHAL6i5GJ8zZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sNrM6GFN; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sNrM6GFN"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48c4649b3aaso603302f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 08:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791301491; x=1791906291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jugYwZT00SmNIUhs0AFCUxAVecoTOg869yRBaBrGDrU=;
        b=sNrM6GFNJh27eBORcl/ypuDchkVgZnQVns+JPacnlhSYJxeNxdkxjiPQgzCAmk2etr
         rINNwZp1TP+wy5F4B85bJL21FX5zreipqfU881aQUHPn/wjAtoW6SBl9VQFn9j7Gm5AM
         UccdiyZhE9ljUBi64qi3E9PuAcmnQ9z/fWRadaoTiNai8tIOWKMhqn8Hj7wCHXEkfCDN
         aGEBxB7BqFNIaH8BNF0g1lrG+TDFsBJXhGUPdODhmF4enLTQA0r9kbaXerRrFqlp9aR/
         2TfIM0D4mAOBbdOZuWMGMw/Bd14OOrG8cTy0NxBt0m31ybQNPY9CzMNfvUE3xDO7PmOd
         BD7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791301491; x=1791906291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jugYwZT00SmNIUhs0AFCUxAVecoTOg869yRBaBrGDrU=;
        b=OqUwU5EaNNPXr7O4IZDWThg8XaRAhMVZPKM7eZFru9vSErdELWFZYxJJQvFP3OAm8w
         /xEY4+bmn9LsX5aRCc2jIAhqJuwsS5MA8XlR9jqAjEUOJgl+yRnFGu2HLPRBJUfL1RK/
         rkyQAn5WBQxKeX7cEui7d4tB29T+mynF7x0VBtlbF9W7DvAS+rFvm8ucVRBlYWrCkZlI
         Jl27LgqPo5YjFmaNOG0LAIKtoHKo8igxgYz4f3EZjef5ZtA9WRyj6TU7K5iL5RH0D87B
         OBISG5FlOQnzw97LYOTtug28Bn5WWc5WCNjiCJJTA4QmvImoE2G9GRpmqYliq3Kxz1fj
         LQaA==
X-Gm-Message-State: AFq9FYKdiF3wgF0Wa73I6C3J0MmNWul2vtKmavVgSPBdXj8ZCYMe155w
	S79YoKp5koQK4PsxEf5d4WxX/2FQgD631sShd2PImGsbP/J8RvPk8rjX
X-Gm-Gg: AYBFou1NnT5GfgHZX74igeO5mjioFOj9zPewg4e2gdQMpEYLakeNSMNJQOKXokIW9yL
	DQFutk6hnvo+BBEZZMuyW9IyVZ0uu63YMFFohgKNR7Rr0O9mKOFDuD3NCzRfmm0rTaDcPdm2fL6
	1Mvqbd3P6fsrJ0W9QyK/hZ0wTUGUuq41cJBHngMa5fn2DIbGpXpOLCJMrt++qGa7BlH8HC5xk/w
	EnGjE2HUpbykHGFj66yeILe0Hf/y1FvYRuKhAkDjilOlmT2RtmlvEMmzweNbGX2mDDO8Do4Y423
	YqL86ak0na213KPftl67ifJEAx4/y/ST/cnd/xzZlX2rrVxl7qtADi2G9wQI2GjrdmD/vk53p/e
	X2ssqTEZKF5xHTzYFh6FU+B1Xt0MAuYcTkV7vx/rXlSZr6sRgXmA4BMNa8WXPxmPIe3amhuTDrY
	zUD4Oj5J5ZZd0QgbM0iz5mSElJWEmhlxE8HRAuvFeCshbUg01x8tdPzaG6ByCHdE2ZklFC9nyRY
	SBOJm1La5h1KWSc1pE=
X-Received: by 2002:a05:6000:2401:b0:48c:4553:790b with SMTP id ffacd0b85a97d-48c6d1db60cmr3208108f8f.48.1791301491372;
        Tue, 06 Oct 2026 08:44:51 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71c0b6e6sm327615f8f.14.2026.10.06.08.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 08:44:50 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 7/7] regulator: lp872x: Use macro to fill regulator descriptor
Date: Tue,  6 Oct 2026 18:44:31 +0300
Message-ID: <20261006154431.318936-8-clamor95@gmail.com>
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

Switch to using the macro for filling the LP872x regulator descriptor
to improve readability.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/regulator/lp872x.c | 275 ++++++++-----------------------------
 1 file changed, 61 insertions(+), 214 deletions(-)

diff --git a/drivers/regulator/lp872x.c b/drivers/regulator/lp872x.c
index df19a5cc94d0d..2eae35228d006 100644
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

