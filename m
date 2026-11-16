Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794814808;
	b=ryiy0gslOSWzPjuVs23roYR15Ds4tdvKKrlJKZY1Q4PhtY66sfVPHlv9h6xuokA1q63M
	 E9hOKrmcbATBnMBejmEQXJcN0YpDTjOdr/Xl7IwweKMYgLdFkpopy5mBeDPrC36LQQfMa
	 N92VoVKwBCa+NZBh76PWM/jDJ2owsG+gudYNrMSL4Fe9Frr6BzepoWXYLqcS7nogH7Uy4
	 32TBqG9y23lI99wu1yVXIbnMYwilnharcR46F4p4QXAtPaVfw5IynhQ7d1VazpvCbpayL
	 HCHcT03SYNWM532O6ty5rLC3iFMCJo3WTK2ix5H/gw6aw9n5Ou6MnKmvblxTDxdsMRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814808;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=K2w/2CDC2TQ1Gy2kBRj5SIsyUDp+bZj79HyJVKV4fFY=;
	b=PTMMELMijMPKQIwxij8iq6WxPs0PmqvxCRPVbC1p+vi2tTAIdJ6GmpnJPZaRu4X68oG7
	 Romb/Hg4OBNxifaHfEridfizl7ZD7eIv4R+tB2hMLZrH/rwb1f2sQWeLQBriYuSS3C87l
	 vO91Fk1r76hkDkW8LBHgtEWMi4HKDY5qaOJmOUezyMjOTYe/7coT61R73ce4ZGw5PSNXa
	 Hq9+6cho+Xk2quZ9HWRQLruQ12F72jsho32FqfFWlwE//AnqWbNeTIEE/5fiyCM//J6zG
	 0/szfqI6zKxBjd/pzFgNs5F8s/UXu96F6kxwZiPwBvtgETdIkYA+JZn/cDwR4x3v8Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XwhtmVeP;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893A360A6F4F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:40:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 893A360A6F4F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XwhtmVeP
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-490a0e72588so1360546f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794814807; x=1795419607; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K2w/2CDC2TQ1Gy2kBRj5SIsyUDp+bZj79HyJVKV4fFY=;
        b=XwhtmVePSoW4ae88yfpklI2685ThGLON8Vae5F60PxB7bNdIc73nqLCuhfTQKGLX3K
         MafXWZ25JILHW46tV95+18InQfqQ/HDpX7CznXUbZPpErL/9rWJP2KjyhhgutR7FIznT
         0BfCxVy47quRScwTDiaChO0d/jhqK3fGD/ApRDAnN1nSqel3PWpIpnqfypy9WJvtpBT1
         c3iMXraGoGW6zMzTHSoVcKuHQNokpNn0YnW+N6ndXMMcactjL5d8Ix0T/1VsLb86e4rf
         V5uKY8Ux/CY0WROYf6ZDkKpK3dOOkx5eEz+/QJSPq1eMaQanRMVfsI0yuN7QmsMNfBjX
         dRAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794814807; x=1795419607;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K2w/2CDC2TQ1Gy2kBRj5SIsyUDp+bZj79HyJVKV4fFY=;
        b=gN+FuLvbaDcfY729uQebkCMnKNgBU5QFvoh8NL/G5gfsksvwpsBJbeNtYkpom8+wZK
         TQMRtupNr/qt/3Ihs4yKM9xllr7zzXWrRSDlOXX22Da6+Nif5UwPSRbVwhy6K5W5aDjT
         1o4UJ2x4QWIi/Mg0ajLmhDaxsaDVOahLZt9OFvJh6dKJAaso0HSbvwN6jZ9iP5Z0YAS3
         jgeHawEd4imsJk74YBY4ftyrJ5X23uf69/orgUuhRT8Y/EykYjQPJ6/ReDMDrLhLaRoN
         VAW6rWeg4N8jk67CghRuEX1o23EwA8ZPMiZeNxfXK21bNUeOeXN3rQ5gKHN31EHYZY3T
         KFwA==
X-Forwarded-Encrypted: i=1; AL+hErGYq4egJxbMNy3sdqITWKUK1O2yHMtPVaC1GdHdQbEMHSDbq1IrK5GPJhX2Ge39VDZ0pQp+Upm6cQp6m14=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hbdQWXR5O21eKX08N9l7oRmfuQXT7liccmqkbKrWXKo7kZSRC
	Ko0mObloEDH0LoRNXv02JV3Kv4kU2tC7x1DXs53GQ6SzUBndG/E/F4I9
X-Gm-Gg: AYBFou1yQCut2OyRWai63peLTY2Y8qzyzIn5uM6S1jbHNKGWyZvaMenBWlCeDpZ/qLU
	MWoH7UAJirgf/VLm2vQlOo2D2rh4LfZNgnXh9mYvosH11T9w2Q/6wtjdRh9ER96FXk1QF7Ucful
	meOTAYHM53u+hmyA8JMXVUyPGizlirc2cHs+5ALM6k2XCOUYZeyAEyL0hTIDVkFdUsXYPZ7H6Xv
	EpL4oRntP+zcXBOZADKtqdEdHub80cVTn73NdnoEw3wUSRKgxGa+VhsDzuJAF9xR0+eXCkurgz6
	iOJh7tEop7qyCoSjfkHCRIBjUYP6iS7iztkDxiHqzm/40Ek2Hm8C9Se6bbNCXRKPYzBYoEMW2U/
	HcH5C+Rr+VTU2+EQaiZB6tQ84YeQ7FZU3mm6rEMu5LW19MZBcMIcc96qyRWg0CF/84kbEI1fPB+
	YLTsOJTzWKVoJMX2w81M1yqd9He7alhSth9KEDpzGF/5C4/0TzfCekRqDmAFEUIP3cpduLlgxQy
	uLzZXnqw5Je+b6qon345N0ej6x6iM4bgvRuyvCMnVAUR1qAtG/s9zfgH8/lq/0iCjIvlxGsUdUM
	qYjP69qGOQ==
X-Received: by 2002:a05:6000:4022:b0:491:971a:c568 with SMTP id ffacd0b85a97d-49c712ac9b2mr24706400f8f.10.1794814806766;
        Sun, 15 Nov 2026 23:40:06 -0800 (PST)
Received: from dl360p ([130.61.107.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c603f4d29sm20354115f8f.35.2026.11.15.23.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:40:06 -0800 (PST)
From: =?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
To: Sebastian Reichel <sre@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
Subject: [PATCH v1 3/3] power: supply: s2mu005-battery: add S2MU106 support
Date: Mon, 16 Nov 2026 10:40:00 +0300
Message-ID: <20261116074000.355176-4-tadilhusrev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116074000.355176-1-tadilhusrev@gmail.com>
References: <20261116074000.355176-1-tadilhusrev@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Samsung S2MU106 PMIC fuel gauge uses the same STATUS/RVBAT/RCURCC/
RSOC registers and scaling as the S2MU005, so the same read paths apply.
It does not, however, share the MONOUT average-monitoring path: reading
the averaged voltage and current through it returns bogus values on the
S2MU106. Introduce a per-variant descriptor so the S2MU106 exposes only
the instantaneous voltage, current, capacity and status, and derive the
status from the instantaneous current alone when the average is absent.

Tested on a Samsung Galaxy XCover5 (Exynos850): voltage, state of charge
and the sign of the charge current track the stock readings; the gauge
has no alert line wired, which the preceding patch already accommodates.

Signed-off-by: Adil Hüsrev Tepe <tadilhusrev@gmail.com>
---
 drivers/power/supply/s2mu005-battery.c | 61 ++++++++++++++++++++++----
 1 file changed, 52 insertions(+), 9 deletions(-)

diff --git a/drivers/power/supply/s2mu005-battery.c b/drivers/power/supply/s2mu005-battery.c
index 9798a62ff..a1bd9ffdd 100644
--- a/drivers/power/supply/s2mu005-battery.c
+++ b/drivers/power/supply/s2mu005-battery.c
@@ -38,6 +38,7 @@ struct s2mu005_fg {
 	struct regmap *regmap;
 	struct power_supply *psy;
 	struct mutex monout_mutex;
+	bool has_monout;
 };
 
 static const struct regmap_config s2mu005_fg_regmap_config = {
@@ -168,16 +169,18 @@ static int s2mu005_fg_get_capacity(struct s2mu005_fg *priv, int *value)
 
 static int s2mu005_fg_get_status(struct s2mu005_fg *priv, int *value)
 {
-	int current_now, current_avg, capacity;
+	int current_now, current_avg = -1, capacity;
 	int ret;
 
 	ret = s2mu005_fg_get_current_now(priv, &current_now);
 	if (ret < 0)
 		return ret;
 
-	ret = s2mu005_fg_get_current_avg(priv, &current_avg);
-	if (ret < 0)
-		return ret;
+	if (priv->has_monout) {
+		ret = s2mu005_fg_get_current_avg(priv, &current_avg);
+		if (ret < 0)
+			return ret;
+	}
 
 	/*
 	 * Verify both current values reported to reduce inaccuracies due to
@@ -240,12 +243,47 @@ static const struct power_supply_desc s2mu005_fg_desc = {
 	.get_property = s2mu005_fg_get_property,
 };
 
+/*
+ * The S2MU106 fuel gauge shares the direct STATUS/RVBAT/RCURCC/RSOC
+ * registers and their scaling, but not the MONOUT average-monitoring path,
+ * so the averaged voltage and current are not exposed on it.
+ */
+static const enum power_supply_property s2mu106_fg_properties[] = {
+	POWER_SUPPLY_PROP_VOLTAGE_NOW,
+	POWER_SUPPLY_PROP_CURRENT_NOW,
+	POWER_SUPPLY_PROP_CAPACITY,
+	POWER_SUPPLY_PROP_STATUS,
+};
+
+static const struct power_supply_desc s2mu106_fg_desc = {
+	.name = "s2mu106-fuel-gauge",
+	.type = POWER_SUPPLY_TYPE_BATTERY,
+	.properties = s2mu106_fg_properties,
+	.num_properties = ARRAY_SIZE(s2mu106_fg_properties),
+	.get_property = s2mu005_fg_get_property,
+};
+
+struct s2mu005_fg_variant {
+	const struct power_supply_desc *desc;
+	bool has_monout;
+};
+
+static const struct s2mu005_fg_variant s2mu005_fg_variant = {
+	.desc = &s2mu005_fg_desc,
+	.has_monout = true,
+};
+
+static const struct s2mu005_fg_variant s2mu106_fg_variant = {
+	.desc = &s2mu106_fg_desc,
+	.has_monout = false,
+};
+
 static int s2mu005_fg_i2c_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct s2mu005_fg *priv;
 	struct power_supply_config psy_cfg = {};
-	const struct power_supply_desc *psy_desc;
+	const struct s2mu005_fg_variant *variant;
 	int ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -264,11 +302,12 @@ static int s2mu005_fg_i2c_probe(struct i2c_client *client)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to initialize MONOUT mutex\n");
 
-	psy_desc = device_get_match_data(dev);
+	variant = device_get_match_data(dev);
+	priv->has_monout = variant->has_monout;
 
 	psy_cfg.drv_data = priv;
 	psy_cfg.fwnode = dev_fwnode(dev);
-	priv->psy = devm_power_supply_register(priv->dev, psy_desc, &psy_cfg);
+	priv->psy = devm_power_supply_register(priv->dev, variant->desc, &psy_cfg);
 	if (IS_ERR(priv->psy))
 		return dev_err_probe(dev, PTR_ERR(priv->psy),
 				     "failed to register power supply subsystem\n");
@@ -276,7 +315,7 @@ static int s2mu005_fg_i2c_probe(struct i2c_client *client)
 	if (client->irq > 0) {
 		ret = devm_request_threaded_irq(priv->dev, client->irq, NULL,
 						s2mu005_handle_irq, IRQF_ONESHOT,
-						psy_desc->name, priv);
+						variant->desc->name, priv);
 		if (ret)
 			return dev_err_probe(dev, ret, "failed to request IRQ\n");
 	}
@@ -287,7 +326,11 @@ static int s2mu005_fg_i2c_probe(struct i2c_client *client)
 static const struct of_device_id s2mu005_fg_of_match_table[] = {
 	{
 		.compatible = "samsung,s2mu005-fuel-gauge",
-		.data = &s2mu005_fg_desc,
+		.data = &s2mu005_fg_variant,
+	},
+	{
+		.compatible = "samsung,s2mu106-fuel-gauge",
+		.data = &s2mu106_fg_variant,
 	},
 	{ }
 };
-- 
2.53.0

