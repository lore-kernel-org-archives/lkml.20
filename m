Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794762718;
	b=KhOjKDOAam0Vv+2GMAx1M+6wFdKZM9sD+DTQksBanLoNs/gUblESfMYP6Kf/W6imVm0z
	 VDjla70jk+GK2mDejVtO/GWiNTwJTck/eH0QoG7Z4XZPSFTRuu/cyjzUHETZ4mDTpFWEO
	 U2qdwMcgkMobxVE9p6UgFcZo/+iqYgdvhg4pCeCnoMtJw6u+s4pYhTdyS9tpEbplx5LNt
	 hPj2uWeZoNPF0M+4OOuhjsZANLADO4x1ABMhlMXqWPq/yjVZibFpMLiu+bXfpCeR9dL/m
	 atpPZ+OFx80Z7w6+6Uc3H68PU0pKUzaqdJvvjzek6MaG/dkFh49x+lvV7YrXkaLEIIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794762718;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ao2Id+ZznnSDg+FFLuqKxplyLfneYX8BayVWraQ+T6M=;
	b=WP0NdCqDAFniMPrhW7qDFSZr41xQuMIQgcDClyK4RoY/PQ/+KAlfunCZ57cLg71hfXt+
	 rP1gPI8pexLUQOtobPuIxttPyXKl11UuD9YXQdlOZl+wsR8t8SOlXAr7nN+9rtGeOOMwQ
	 gVysR7Y2y67DjZkWojBHo7XQWPKJYXsNHhEyPapHenlL+uCqeuGhlqz35lOlUeRzS65s4
	 B/HHXaMZ3DzvZupdztLMQi2GoNUkesVxIKMhZAeOI5Xxwjlkzhm3KLJd+puVPT4pIb+hh
	 sOqbWUSmDl3a4DQ82KvYdUu8/8F6yGWkjJ8aZZ2pqKWCzAEF+bK44QERnoZTmXnVJUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=kTPdDYdG;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4E460A2630
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 17:11:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A4E460A2630
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=kTPdDYdG
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso13029135e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mgcrea.io; s=google; t=1794762716; x=1795367516; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ao2Id+ZznnSDg+FFLuqKxplyLfneYX8BayVWraQ+T6M=;
        b=kTPdDYdGvk0LV04VocHx5ufsv8yqqttQJbMermaWYommkrP/TYRWGn/EWGkZn0yQa3
         QZhxISa2ZEfEqSoxHUr8NyAUez/oNYW3mcXBxDVScy1gVwHAPrhsEzzHsV6nTQ17BTFJ
         wwjoMxks3ULx3itUR6gvyMD3bdCQ3hdoWy4+tIGZPE8PC/izlL6Giv2WNg1NakXCJTCb
         NWfgsf5FBM/lm0kLRp9wnFOMvhV9pxYRsrgWexLl+Jq5mLzPkc1nR+7VvYM1It49mR5F
         gI6SKmQn7ZmmYRSenX+5ex1xHIuUWZga7/LgSASwrVVdonfnvQh0j/Aqjfo6pHxCqFkE
         3eHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794762716; x=1795367516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ao2Id+ZznnSDg+FFLuqKxplyLfneYX8BayVWraQ+T6M=;
        b=xl+cw/wmgOcOO1oE12o/ysCn3oTxLYmXD/Giv1O/30aM1VR1gfxcNTS1LzP61kmuGg
         x5X6QHoRevRs9hS5uPszkoakDYKdANDBc3DWq+FSm0f3bPFE69VvgXf71JVJpGonT9/t
         Oo946SYFjS1G3tAwhp17Ce3IYcJW5QTO3v0KbjteHOTmZqabJlNBRIfJPkN+1e5DIUDu
         EKivIe6n+MO7FnqzNTUvkQZlt4BtKj26gQoKNPqV3GHvSJVfNa+mRvKYc3iIR6AoyVWi
         R6LjT2Li3lx1v6jPGatszzTWtgUBm0SGQxNsOKB/FYaEOshHLTshhHS+b6FEaM1bx8DX
         /hLg==
X-Forwarded-Encrypted: i=1; AL+hErHFLKmeBnvAFl+aSSWRE49//PYG804H41zRgnjzwlGqcqhzWVWgjk/9B7c8SlfBYcIMAooo8PnjdDHFNBg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TZRxpME8uede+jFtPfS4pk1fQ8ZBzaEJUlN4qQe3YDb9I5rKq
	KdPJQfsBor/DpvsOr47DVYM6/IiQRpnFLGeuVUoOPNuPpS5JRMmJWfkmT9Pc5bwLTMQ=
X-Gm-Gg: AYBFou385Qo9DxM0nALycBWzqC7mo6/0JWbDgzDp/yQnz+/sghczrUFx696+gW+eWIB
	eI1YZ+/OKZFjC4aQ20jck+PqqQBu+gHFEH4aZDigYdpvFi+JCMGRq493eeocwlRtwA2E71rQMvZ
	10Lq5h+HdkXhY60949yvB/drvrMUE/vVBW8Eh4lhy5rOIW/CO0CVb/Mia0+MUMww2eHIGorloxY
	0vv++0b4jZO4KyfT5cY+UI1kdCdGttL8zjbG0C85zVTBSFXvWw2ioaqTPTfcQe83F3KgT0xGGNo
	Y9ljy+sJ0zBQqB0Eka7YoIyhrRs4IY1G9qP08muLbooFl0JM9BngIc2aduq5cbz6jlMvz7XhpQH
	yxb9Skdz33vi0YX8IS2pSPVTGxq+H4tXk4+m6eL9ciAzjZAIJet+3GFzHZRdkBoK8OMNsTeCAGS
	VXNmwRPT6lEpmVs1t4YFj+9/RzuouRkZzxaNc70oYegvEbNRGv/KL/9RP9i0QRY91X0LP+uSpqy
	g3HicNXCu12wI/D2F07H3IAT58Ul6if+u7S/4+TVgOC84rYnBfGLv322kGFFw4hLLf7z9ywJsVf
	ZsEQxHXcqpI0jWN87u6MaEzAEZzqFX/lTz/dRxCQygzmKryBwPrZ7KVMpBgrV+bbVPiHrAalXQn
	vtCL+RD0=
X-Received: by 2002:a05:600c:483:b0:4a1:7c56:d4e2 with SMTP id 5b1f17b1804b1-4bb55a4f499mr122046405e9.16.1794762716057;
        Sun, 15 Nov 2026 09:11:56 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:b9ad:41d3:c29c:11b4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ac0e1esm205418705e9.3.2026.11.15.09.11.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 15 Nov 2026 09:11:55 -0800 (PST)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Lee Jones <lee@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>
Cc: Olivier Louvignes <olivier@mgcrea.io>,
	Sebastian Reichel <sre@kernel.org>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/7] power: supply: axp20x_battery: Add support for the AXP2101
Date: Sun, 15 Nov 2026 18:11:50 +0100
Message-ID: <20261115171150.64431-8-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261115171150.64431-1-olivier@mgcrea.io>
References: <20261115171150.64431-1-olivier@mgcrea.io>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Program the AXP2101's charger from the monitored battery: the end of
charge voltage (CV_CHG_SET, 4.0 to 4.4 V), the constant charge current
(ICC_CHG_SET, 25 mA steps to 200 mA then 100 mA steps to 1 A), and the
termination and precharge currents (25 mA steps). Report whether the
battery is present, the charge state (precharge, constant current or
constant voltage charging, done, or by the current direction) and the
settings.

The supply is read-only and reports no capacity: the AXP2101's own fuel
gauge needs a battery model, and the HiBy R1 uses a CW2015 for that.

Tested on a HiBy R1: the charger registers read back as the stock
firmware's values after boot, and the status is Full on USB,
Discharging unplugged and Charging after a replug.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 drivers/power/supply/axp20x_battery.c | 221 ++++++++++++++++++++++++++
 1 file changed, 221 insertions(+)

diff --git a/drivers/power/supply/axp20x_battery.c b/drivers/power/supply/axp20x_battery.c
index c119014b319a..b26056c4d019 100644
--- a/drivers/power/supply/axp20x_battery.c
+++ b/drivers/power/supply/axp20x_battery.c
@@ -91,6 +91,26 @@
 
 #define AXP717_TS_PIN_DISABLE		BIT(4)
 
+#define AXP2101_PWR_OP_BATT_PRESENT	BIT(3)
+#define AXP2101_PWR_STATUS_MASK		GENMASK(6, 5)
+#define AXP2101_PWR_STATUS_BAT_STANDBY	0
+#define AXP2101_PWR_STATUS_BAT_CHRG	1
+#define AXP2101_PWR_STATUS_BAT_DISCHRG	2
+#define AXP2101_CHRG_STATE_MASK		GENMASK(2, 0)
+#define AXP2101_CHRG_STATE_TRICKLE	0
+#define AXP2101_CHRG_STATE_PRECHARGE	1
+#define AXP2101_CHRG_STATE_CC		2
+#define AXP2101_CHRG_STATE_CV		3
+#define AXP2101_CHRG_STATE_DONE		4
+/* CV_CHG_SET: end of charge voltage selector, 1 to 5 for 4.0 to 4.4 V. */
+#define AXP2101_CHRG_CV_VOLT_MASK	GENMASK(2, 0)
+#define AXP2101_ICC_MASK		GENMASK(4, 0)
+#define AXP2101_ICC_MAX_SEL		16	/* 1 A; 17 to 31 are reserved */
+#define AXP2101_ITERM_MASK		GENMASK(3, 0)
+#define AXP2101_ITERM_ENABLE		BIT(4)
+#define AXP2101_IPRECHG_MASK		GENMASK(3, 0)
+#define AXP2101_CURRENT_STEP		25000
+
 struct axp20x_batt_ps;
 
 struct axp_data {
@@ -213,6 +233,44 @@ static int axp717_battery_get_max_voltage(struct axp20x_batt_ps *axp20x_batt,
 	}
 }
 
+/* End of charge voltages of CV_CHG_SET selectors 0 to 7; 0, 6 and 7 are reserved. */
+static const int axp2101_cv_uv[] = {
+	0, 4000000, 4100000, 4200000, 4350000, 4400000, 0, 0,
+};
+
+static int axp2101_battery_get_max_voltage(struct axp20x_batt_ps *axp20x_batt,
+					   int *val)
+{
+	int ret, reg;
+
+	ret = regmap_read(axp20x_batt->regmap, AXP2101_CV_CHG_SET, &reg);
+	if (ret)
+		return ret;
+
+	*val = axp2101_cv_uv[reg & AXP2101_CHRG_CV_VOLT_MASK];
+	return *val ? 0 : -EINVAL;
+}
+
+static int axp2101_battery_set_max_voltage(struct axp20x_batt_ps *axp20x_batt,
+					   int val)
+{
+	int sel;
+
+	for (sel = 0; sel < ARRAY_SIZE(axp2101_cv_uv); sel++)
+		if (axp2101_cv_uv[sel] && axp2101_cv_uv[sel] == val)
+			return regmap_update_bits(axp20x_batt->regmap,
+						  AXP2101_CV_CHG_SET,
+						  AXP2101_CHRG_CV_VOLT_MASK, sel);
+
+	return -EINVAL;
+}
+
+/* CONSTANT_CHARGE_CURRENT: 25 mA steps up to 200 mA, then 100 mA steps. */
+static int axp2101_ccc_from_sel(unsigned int sel)
+{
+	return sel <= 8 ? sel * 25000 : 200000 + (sel - 8) * 100000;
+}
+
 static int axp813_battery_get_max_voltage(struct axp20x_batt_ps *axp20x_batt,
 					  int *val)
 {
@@ -425,6 +483,89 @@ static int axp20x_battery_get_prop(struct power_supply *psy,
 	return 0;
 }
 
+static int axp2101_battery_get_prop(struct power_supply *psy,
+				    enum power_supply_property psp,
+				    union power_supply_propval *val)
+{
+	struct axp20x_batt_ps *axp20x_batt = power_supply_get_drvdata(psy);
+	int ret, reg;
+
+	switch (psp) {
+	case POWER_SUPPLY_PROP_PRESENT:
+	case POWER_SUPPLY_PROP_ONLINE:
+		ret = regmap_read(axp20x_batt->regmap, AXP2101_PMU_STATUS_1,
+				  &reg);
+		if (ret)
+			return ret;
+
+		val->intval = !!(reg & AXP2101_PWR_OP_BATT_PRESENT);
+		return 0;
+
+	case POWER_SUPPLY_PROP_STATUS:
+		ret = regmap_read(axp20x_batt->regmap, AXP2101_PMU_STATUS_2,
+				  &reg);
+		if (ret)
+			return ret;
+
+		switch (FIELD_GET(AXP2101_CHRG_STATE_MASK, reg)) {
+		case AXP2101_CHRG_STATE_PRECHARGE:
+		case AXP2101_CHRG_STATE_CC:
+		case AXP2101_CHRG_STATE_CV:
+			val->intval = POWER_SUPPLY_STATUS_CHARGING;
+			return 0;
+		case AXP2101_CHRG_STATE_DONE:
+			val->intval = POWER_SUPPLY_STATUS_FULL;
+			return 0;
+		}
+
+		/* Trickle charging or not charging: by the current direction. */
+		switch (FIELD_GET(AXP2101_PWR_STATUS_MASK, reg)) {
+		case AXP2101_PWR_STATUS_BAT_STANDBY:
+			val->intval = POWER_SUPPLY_STATUS_NOT_CHARGING;
+			return 0;
+		case AXP2101_PWR_STATUS_BAT_CHRG:
+			val->intval = POWER_SUPPLY_STATUS_CHARGING;
+			return 0;
+		case AXP2101_PWR_STATUS_BAT_DISCHRG:
+			val->intval = POWER_SUPPLY_STATUS_DISCHARGING;
+			return 0;
+		default:
+			val->intval = POWER_SUPPLY_STATUS_UNKNOWN;
+			return 0;
+		}
+
+	case POWER_SUPPLY_PROP_CONSTANT_CHARGE_CURRENT_MAX:
+		ret = regmap_read(axp20x_batt->regmap, AXP2101_ICC_CHG_SET,
+				  &reg);
+		if (ret)
+			return ret;
+
+		val->intval = axp2101_ccc_from_sel(FIELD_GET(AXP2101_ICC_MASK,
+							     reg));
+		return 0;
+
+	case POWER_SUPPLY_PROP_VOLTAGE_MAX:
+		return axp2101_battery_get_max_voltage(axp20x_batt,
+						       &val->intval);
+
+	case POWER_SUPPLY_PROP_CHARGE_TERM_CURRENT:
+		ret = regmap_read(axp20x_batt->regmap, AXP2101_ITERM_CHG_SET,
+				  &reg);
+		if (ret)
+			return ret;
+
+		if (!(reg & AXP2101_ITERM_ENABLE))
+			val->intval = 0;
+		else
+			val->intval = FIELD_GET(AXP2101_ITERM_MASK, reg) *
+				      AXP2101_CURRENT_STEP;
+		return 0;
+
+	default:
+		return -EINVAL;
+	}
+}
+
 static int axp717_battery_get_prop(struct power_supply *psy,
 				   enum power_supply_property psp,
 				   union power_supply_propval *val)
@@ -852,6 +993,15 @@ static enum power_supply_property axp20x_battery_props[] = {
 	POWER_SUPPLY_PROP_CAPACITY,
 };
 
+static enum power_supply_property axp2101_battery_props[] = {
+	POWER_SUPPLY_PROP_PRESENT,
+	POWER_SUPPLY_PROP_ONLINE,
+	POWER_SUPPLY_PROP_STATUS,
+	POWER_SUPPLY_PROP_CONSTANT_CHARGE_CURRENT_MAX,
+	POWER_SUPPLY_PROP_VOLTAGE_MAX,
+	POWER_SUPPLY_PROP_CHARGE_TERM_CURRENT,
+};
+
 static enum power_supply_property axp717_battery_props[] = {
 	POWER_SUPPLY_PROP_PRESENT,
 	POWER_SUPPLY_PROP_ONLINE,
@@ -895,6 +1045,15 @@ static const struct power_supply_desc axp209_batt_ps_desc = {
 	.set_property = axp20x_battery_set_prop,
 };
 
+/* Read-only: the charge settings come from the monitored battery. */
+static const struct power_supply_desc axp2101_batt_ps_desc = {
+	.name = "axp20x-battery",
+	.type = POWER_SUPPLY_TYPE_BATTERY,
+	.properties = axp2101_battery_props,
+	.num_properties = ARRAY_SIZE(axp2101_battery_props),
+	.get_property = axp2101_battery_get_prop,
+};
+
 static const struct power_supply_desc axp717_batt_ps_desc = {
 	.name = "axp20x-battery",
 	.type = POWER_SUPPLY_TYPE_BATTERY,
@@ -978,6 +1137,57 @@ static void axp209_set_battery_info(struct platform_device *pdev,
 	}
 }
 
+static int axp2101_bat_cfg_iio_channels(struct platform_device *pdev,
+					struct axp20x_batt_ps *axp_batt)
+{
+	return 0;
+}
+
+/*
+ * Programs the charger from the monitored battery: end of charge voltage,
+ * constant charge current, termination and precharge currents. What the
+ * battery doesn't give is left as it is.
+ */
+static void axp2101_set_battery_info(struct platform_device *pdev,
+				     struct axp20x_batt_ps *axp_batt,
+				     struct power_supply_battery_info *info)
+{
+	int cv = info->constant_charge_voltage_max_uv;
+	int ccc = info->constant_charge_current_max_ua;
+	int iterm = info->charge_term_current_ua;
+	int iprechg = info->precharge_current_ua;
+	unsigned int sel;
+
+	if (cv > 0 && axp2101_battery_set_max_voltage(axp_batt, cv))
+		dev_err(&pdev->dev, "unsupported charge voltage %d uV\n", cv);
+
+	if (ccc > 0) {
+		if (ccc <= 200000)
+			sel = ccc / AXP2101_CURRENT_STEP;
+		else
+			sel = min((ccc - 200000) / 100000 + 8,
+				  AXP2101_ICC_MAX_SEL);
+		axp_batt->max_ccc = axp2101_ccc_from_sel(sel);
+		regmap_update_bits(axp_batt->regmap, AXP2101_ICC_CHG_SET,
+				   AXP2101_ICC_MASK, sel);
+	}
+
+	if (iterm > 0) {
+		sel = min(iterm / AXP2101_CURRENT_STEP,
+			  (int)FIELD_MAX(AXP2101_ITERM_MASK));
+		regmap_update_bits(axp_batt->regmap, AXP2101_ITERM_CHG_SET,
+				   AXP2101_ITERM_MASK | AXP2101_ITERM_ENABLE,
+				   sel | AXP2101_ITERM_ENABLE);
+	}
+
+	if (iprechg > 0) {
+		sel = min(iprechg / AXP2101_CURRENT_STEP,
+			  (int)FIELD_MAX(AXP2101_IPRECHG_MASK));
+		regmap_update_bits(axp_batt->regmap, AXP2101_IPRECHG_SET,
+				   AXP2101_IPRECHG_MASK, sel);
+	}
+}
+
 static void axp717_set_battery_info(struct platform_device *pdev,
 				    struct axp20x_batt_ps *axp_batt,
 				    struct power_supply_battery_info *info)
@@ -1047,6 +1257,14 @@ static const struct axp_data axp221_data = {
 	.set_bat_info = axp209_set_battery_info,
 };
 
+static const struct axp_data axp2101_data = {
+	.bat_ps_desc = &axp2101_batt_ps_desc,
+	.get_max_voltage = axp2101_battery_get_max_voltage,
+	.set_max_voltage = axp2101_battery_set_max_voltage,
+	.cfg_iio_chan = axp2101_bat_cfg_iio_channels,
+	.set_bat_info = axp2101_set_battery_info,
+};
+
 static const struct axp_data axp717_data = {
 	.ccc_scale = 64000,
 	.ccc_offset = 0,
@@ -1082,6 +1300,9 @@ static const struct of_device_id axp20x_battery_ps_id[] = {
 	}, {
 		.compatible = "x-powers,axp717-battery-power-supply",
 		.data = (void *)&axp717_data,
+	}, {
+		.compatible = "x-powers,axp2101-battery-power-supply",
+		.data = (void *)&axp2101_data,
 	}, {
 		.compatible = "x-powers,axp813-battery-power-supply",
 		.data = (void *)&axp813_data,
-- 
2.39.5

