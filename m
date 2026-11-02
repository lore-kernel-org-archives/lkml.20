Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793615377;
	b=UntSGlvd075J+cu+ceVYjBNbHQMIbm8D9WDfvvWggxcYHynWp7scYEuGundgaP0QIS52
	 4xely0qGzoMfJOqR7tELpaZW5RkNbWVd9KqfYXJbbxvyFzD4TfsOqrmJyZnRyFGVMYXbG
	 N0i6aVz1YzpWZnPAJ4lDPK6ohfb1b8ocKFyHo2BaBOYBDuHvSDfN27j9JMGA4ebLTXxaX
	 xhZEr2+iqGLR55FemCkyTGxQtPtPF28KpbvN714mky+O9SIeGV7mDG4BZ6vL0NB0U2U56
	 qdsl/pPERFbTHxYHWjfSeWI9xm13r8ydIwS5gUSC6TXVEVFh9CJGuMaaE4ZNlmIIHOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793615377;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=2g8W3ETaHx4LWIZXfdo/BzC4gENfM1DlibzNB6wFyU8=;
	b=EM2Zia1azFeq4oqRcxoF16UseZNN0Ix7qXOypaBGIQgczkDnxNMghC2pFTO5LUhZHsMZ
	 AUd+Q7trvZzauY21JcY5aUUhqPA3mnLTBiIg2yhI6yhuhNumdc7q/7TYAKzVko44PlRNW
	 XqegvFfNtTtVSCC4viFMzr6PvURgjRgWsPO707kD46bmw+9C2wQyHRNppTdCIcrCs1Vbc
	 ELsQlkDV+vBWQzYU6KBNjfSmzpJQQxDjFUwyQsjNjp4RQpz0HIwH8/9W9vcwekq3WPoyn
	 SZMUD9szXtEpn2oyX8cQXG6aWJYbWdyYeZQzQ0W5Wiw0v6kknRHtErkX52Qq6n+ItTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=7tMotJTO;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB620606A338
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:29:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB620606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=7tMotJTO
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48df4e9d2d4so1421723f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 02:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1793615375; x=1794220175; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2g8W3ETaHx4LWIZXfdo/BzC4gENfM1DlibzNB6wFyU8=;
        b=7tMotJTOq/Y2bTCoX7qWwIJGYtH4MrsuNi1rXeOB95rWT7XUP7tuMPZmts/TZi9qxA
         oB/6FwSqkLilyUVeNt9dGeel5QMaC+lu3kKAmaGDogmrd0Dyjmz0TqHvhZrxoluV6pUw
         fWEcF+SqEY3t/6krV4/uOONyv9E6dCuO0vvLGnpSTYvhiqHinR/iJUP0HjxH2RNwmLlP
         5cmL5//TLZYwWWRYTU6CMAKnEfsorg/RbrDrE/jdo/wvndawZVu6Ub2EYub+CI6A/ryl
         za0g/y66GymYv3s+Ganm7I/1E8Rnmjkxuxd25oOSg9gWfRLpPXjVjwCocU+PjGP0CIky
         ZXVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793615375; x=1794220175;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2g8W3ETaHx4LWIZXfdo/BzC4gENfM1DlibzNB6wFyU8=;
        b=QARhJ7TJsZXmze9nMLKRVNKn/i31vrDvVzVz2hGhtYZmHI0z6A3QqrWdYh1H4mjRWy
         fdtBgO+YfRVd9khfQ6AahbSxxmUPLcaTOUe3Gt7LaO0s0pvxIhgwJX7yInSi2N8+Z3WJ
         r34tT7hpDUoZBd1Uffd2mdz5QUhEekXz3OuEx0liH6LxOOhF7Wyd1gcKrd0NM/tVY4o8
         69IBLzH0OJlbLxTBC118DlCLEfGUbBjmXtEjMErXSYPI2TH5H/sgXLACaGgHyoqIB6Wn
         NJWFYWoz6PPn9O2RW2SShmUlp5AK0lZCppxjxklcCthaDnZ3GrDdGqay9SiKZzywbhWQ
         uiIw==
X-Gm-Message-State: APuU4Z9kbvWFudYBSU3J73v8jsk9JwvNN6uWi69IZg62vZ8+hIFspA/7
	rOi11O4KCc9R6ovu1jh/cdBQB2TXzokWE4bjcCu6eY/J5gf32G2CtW3M5I4qtOt1hWM=
X-Gm-Gg: AYBFou3pmrgnrfVTaGs8nkj/NRk0h7LMCgHzblUFRyjU+Y9TP78Z4lDuqYaYuFrFsmh
	byO5+HOOpXKLugHJsc5nGTMbyZbrYC9bpfkF+PnRm1dEc9vwfVGmxmI0KGZtTJobEc13L7DwJoY
	zU66+M3aJkWWYyIgMrQXqG+n4Vfci/awPKNuOQV6sdewfvV/IBs7AAqhntCZ02gCGQE5mhI++GX
	kdBd90tWI82vaEstTI6UCU2sUcRyND+5AJRJ+qoM7TNklnfMBHxRWroZ/GcGZJ3AjQvuVxytYRy
	hR9jbwVOx9ACzXXUn09ZN4YSC3xq2M6kzWVhsxIIyad5Wy5EzcG66KO9YiTQOJuDoL178HexCqS
	L8jYLhJDr9mUB0gV8n1MGNtudMubrLB7LmbigHZl+n2S/pU8Yp8BpWU3lkPN+HIb6+k4/cXAB2i
	SUA+tuygFKF0uJj+GDgeVDjsxQzwljxfp5LUzwJADmbsLW1rDjqAMfXA3NUPxZLvrD8RO+0Ufse
	j4mPgrjOC+sfPXC3uMangbtad+m5voBOHEumiDj40FiFjCRVZw3idkWAfF7XG5uGA6VtN8uJSXa
	CPxCtu+mo91591yosDX+FMAA3fm8a19RCjq0FNbryM/UgVSsZfKBRQ+6x1Kr40DBhHrrrxbRBhD
	2xweGO2X5LGHfEP+mVVhElMyMVd4aO+VV
X-Received: by 2002:a5d:5f41:0:b0:48e:68d5:818d with SMTP id ffacd0b85a97d-48e6e2eb83emr23377378f8f.16.1793615375000;
        Mon, 02 Nov 2026 02:29:35 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8bd8esm19341891f8f.42.2026.11.02.02.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:29:34 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 02 Nov 2026 14:29:06 +0400
Subject: [PATCH v9 3/3] regulator: bq257xx: Add support for BQ25792
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-bq25792-v9-3-65f223e95fbc@flipper.net>
References: <20261102-bq25792-v9-0-65f223e95fbc@flipper.net>
In-Reply-To: <20261102-bq25792-v9-0-65f223e95fbc@flipper.net>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Chris Morgan <macromorgan@hotmail.com>, Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5222; i=alchark@flipper.net;
 h=from:subject:message-id; bh=4r0QGKzroYYx2OGLOWmo55cGImyDxPVcas64mdZp+dE=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWS9SGM2DXww16lEx8/4mP5UoT7ZXbYth/WkF9ZUsVVtM
 Il7eMSuYyILgxgXg6WYIsvcb0tspxrxzdrl4fEVZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKk2FWD4pzQn7hNPysxHTO0b3ZgqWEMa63UWrtmTZ963ZvHG3Z8P3Gf4p3FL5YB
 yZ+drOwkji4ybid9qriyYXbhDNOSu6ZPfx+9uZAAA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Add support for TI BQ25792, an integrated battery charger and buck/boost
regulator. This enables VBUS output from the charger's boost converter
for use in USB OTG applications, supporting 2.8-22V output at up to 3.32A
with 10mV and 40mA resolution.

Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/regulator/bq257xx-regulator.c | 102 +++++++++++++++++++++++++++++++++-
 1 file changed, 100 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/bq257xx-regulator.c b/drivers/regulator/bq257xx-regulator.c
index 321c3a5c322a..93a8572f1471 100644
--- a/drivers/regulator/bq257xx-regulator.c
+++ b/drivers/regulator/bq257xx-regulator.c
@@ -31,6 +31,32 @@ static int bq25703_vbus_get_cur_limit(struct regulator_dev *rdev)
 	return FIELD_GET(BQ25703_OTG_CUR_MASK, reg) * BQ25703_OTG_CUR_STEP_UA;
 }
 
+static int bq25792_vbus_get_cur_limit(struct regulator_dev *rdev)
+{
+	struct regmap *regmap = rdev_get_regmap(rdev);
+	int ret;
+	unsigned int reg;
+
+	ret = regmap_read(regmap, BQ25792_REG0D_IOTG_REGULATION, &reg);
+	if (ret)
+		return ret;
+	return FIELD_GET(BQ25792_REG0D_IOTG_MASK, reg) * BQ25792_OTG_CUR_STEP_UA;
+}
+
+static int bq25792_vbus_get_voltage_sel(struct regulator_dev *rdev)
+{
+	struct regmap *regmap = rdev_get_regmap(rdev);
+	__be16 reg;
+	int ret;
+
+	ret = regmap_raw_read(regmap, BQ25792_REG0B_VOTG_REGULATION,
+			      &reg, sizeof(reg));
+	if (ret)
+		return ret;
+
+	return FIELD_GET(BQ25792_REG0B_VOTG_MASK, be16_to_cpu(reg));
+}
+
 /*
  * Check if the minimum current and maximum current requested are
  * sane values, then set the register accordingly.
@@ -54,6 +80,38 @@ static int bq25703_vbus_set_cur_limit(struct regulator_dev *rdev,
 			    FIELD_PREP(BQ25703_OTG_CUR_MASK, reg));
 }
 
+static int bq25792_vbus_set_cur_limit(struct regulator_dev *rdev,
+				      int min_uA, int max_uA)
+{
+	struct regmap *regmap = rdev_get_regmap(rdev);
+	unsigned int reg;
+
+	if ((min_uA > BQ25792_OTG_CUR_MAX_UA) ||
+	    (max_uA < BQ25792_OTG_CUR_MIN_UA))
+		return -EINVAL;
+
+	reg = min(max_uA, BQ25792_OTG_CUR_MAX_UA) / BQ25792_OTG_CUR_STEP_UA;
+
+	/* Catch rounding errors since our step is 40000uA. */
+	if ((reg * BQ25792_OTG_CUR_STEP_UA) < min_uA)
+		return -EINVAL;
+
+	return regmap_update_bits(regmap, BQ25792_REG0D_IOTG_REGULATION,
+				  BQ25792_REG0D_IOTG_MASK,
+				  FIELD_PREP(BQ25792_REG0D_IOTG_MASK, reg));
+}
+
+static int bq25792_vbus_set_voltage_sel(struct regulator_dev *rdev,
+					unsigned int sel)
+{
+	struct regmap *regmap = rdev_get_regmap(rdev);
+	__be16 reg;
+
+	reg = cpu_to_be16(FIELD_PREP(BQ25792_REG0B_VOTG_MASK, sel));
+	return regmap_raw_write(regmap, BQ25792_REG0B_VOTG_REGULATION,
+				&reg, sizeof(reg));
+}
+
 static int bq25703_vbus_enable(struct regulator_dev *rdev)
 {
 	struct bq257xx_reg_data *pdata = rdev_get_drvdata(rdev);
@@ -101,6 +159,34 @@ static const struct regulator_desc bq25703_vbus_desc = {
 	.vsel_mask = BQ25703_OTG_VOLT_MASK,
 };
 
+static const struct regulator_ops bq25792_vbus_ops = {
+	/* No GPIO for enabling the OTG regulator */
+	.enable = regulator_enable_regmap,
+	.disable = regulator_disable_regmap,
+	.is_enabled = regulator_is_enabled_regmap,
+	.list_voltage = regulator_list_voltage_linear,
+	.get_voltage_sel = bq25792_vbus_get_voltage_sel,
+	.set_voltage_sel = bq25792_vbus_set_voltage_sel,
+	.get_current_limit = bq25792_vbus_get_cur_limit,
+	.set_current_limit = bq25792_vbus_set_cur_limit,
+};
+
+static const struct regulator_desc bq25792_vbus_desc = {
+	.name = "vbus",
+	.of_match = of_match_ptr("vbus"),
+	.regulators_node = of_match_ptr("regulators"),
+	.type = REGULATOR_VOLTAGE,
+	.owner = THIS_MODULE,
+	.ops = &bq25792_vbus_ops,
+	.min_uV = BQ25792_OTG_VOLT_MIN_UV,
+	.uV_step = BQ25792_OTG_VOLT_STEP_UV,
+	.n_voltages = BQ25792_OTG_VOLT_NUM_VOLT,
+	.enable_mask = BQ25792_REG12_EN_OTG,
+	.enable_reg = BQ25792_REG12_CHARGER_CONTROL_3,
+	.enable_val = BQ25792_REG12_EN_OTG,
+	.disable_val = 0,
+};
+
 /* Get optional GPIO for OTG regulator enable. */
 static void bq257xx_reg_dt_parse_gpio(struct platform_device *pdev)
 {
@@ -141,6 +227,7 @@ static void bq257xx_reg_dt_parse_gpio(struct platform_device *pdev)
 static int bq257xx_regulator_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	struct bq257xx_device *bq = dev_get_drvdata(pdev->dev.parent);
 	struct bq257xx_reg_data *pdata;
 	struct regulator_config cfg = {};
 	struct regulator_dev *rdev;
@@ -151,10 +238,21 @@ static int bq257xx_regulator_probe(struct platform_device *pdev)
 	if (!pdata)
 		return -ENOMEM;
 
-	pdata->desc = bq25703_vbus_desc;
+	switch (bq->type) {
+	case BQ25703A:
+		pdata->desc = bq25703_vbus_desc;
+		break;
+	case BQ25792:
+		pdata->desc = bq25792_vbus_desc;
+		break;
+	default:
+		return dev_err_probe(&pdev->dev, -EINVAL,
+				     "Unsupported device type\n");
+	}
 
 	platform_set_drvdata(pdev, pdata);
-	bq257xx_reg_dt_parse_gpio(pdev);
+	if (bq->type == BQ25703A)
+		bq257xx_reg_dt_parse_gpio(pdev);
 
 	cfg.dev = &pdev->dev;
 	cfg.driver_data = pdata;

-- 
2.56.0

