Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794762717;
	b=pqIZPgN7xgA8fLYDl393nIDjUpXJstGvOXMm3tWP9b2g4eyBMpUaFje9LuR60pAy2x/M
	 V0cOhe/v1ED5rHjL9e3V9sOkWcMIJc8ih3hrMRB5tkz5+oTtj5aSZjFJHFzwzSCLF31PP
	 56zXRMa5+cvsjO9noleJL+fM+d7JkTUe/zevQwbPntdpcxzDZK4hutiWTFUM1jZkC3yff
	 F2B6+Vm4tvvysoebbo8DPDIUNSz3GF0rmuSbsAKcFVuDnK5Bc0ov3uz7Vv8wEo3bswOfR
	 ZCGHLEUPALhpchyv07RTZrWacYmVRCN1Fte79kVXtla4Ovw6MMXmXeOjjn7r//fw/TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794762717;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SUty3Kjk027prBqeBhkvRnDD2NB+WzecWQp5Zz75x3E=;
	b=GB3dP9VwvcX9V+6WhCmUwtcyfknLZvBhfnjsHDEsxo6s6mooxiJBgQLdVRvYWjrTcpfh
	 gZDpQajykLjV7qfwhx5e5TravSqioL2cQb6+guKvB6MEhRgZwcAGNvmy4vtT9sVoMOUpW
	 L/UFsn4gh0lm4zT43zciybBE087yq0vn68O2HSjTKa7YD20hLjlzyZyDIhCNwwr9b0/tE
	 vpgAxKVS+nCE4zYHFvkf+BvWE98shXL8iz685v3uE581dLAxn9gy5XrC0Z/f96Zda60Ni
	 W2DQkizu1MEph0rdsQLSiBK1DLwvJfQf6V82Zmjx8gMz5gpa+RJQ1O9YGypYhH/qXJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=vIs2Q9XU;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3DBC60A2611
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 17:11:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3DBC60A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=vIs2Q9XU
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so26560325e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mgcrea.io; s=google; t=1794762715; x=1795367515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SUty3Kjk027prBqeBhkvRnDD2NB+WzecWQp5Zz75x3E=;
        b=vIs2Q9XUhBhVuTcjvNhBkD3l9qFdWXRMs/W9gTAbX5hXU8JKMUKqjAXaU8QFpHI4rY
         rUNHqYIbTIDcAtmV/gEXpdl5JSZWRL8yAoKCjpaHx+F3vfcwy1QRtrI1FbqLsIjyaJa/
         kCzNWJt/wv64zOYp/CuG68sCjZNHi/sP0H6VKOja5VOk6q7WsNsBjGRkOk0bv0T4YEsB
         XmUrVQjeOrG5CxF7qUTWuHh0TlMj5KaX3usTSwq/qjl2aseuEAguTxkoea8X13HWXeRB
         kFXLBf+YujGBioMjFlXVFBMrMfIKq410C47EvtevCdM37CSMv8VHWJTLyC8diEl+mr+X
         L+AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794762715; x=1795367515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SUty3Kjk027prBqeBhkvRnDD2NB+WzecWQp5Zz75x3E=;
        b=u1URPBSLu3Xz4Fgzw/2skvoxsRm8A0TdhJ28mfO2BFvj7FoC384tN22NJkf2Cb/8Z/
         y8yU40/3HFsMUYKPAwN653dLg5Xdv+q6o5JAvDaCrIke0e29bawHz8ARP1fyhAHG1D6q
         BDgf0HUYI7/JXlgv7ZoO7WkRkwGDkfxqKB5HC3NFeX1djQ+TyXEoDhMDQJdUyJWYdlRN
         0q86T+71FjO30J6ygRI3MBrubDt/Sjsq1X1q76AiONXBlestdT0YepP8xPP/OofsUELf
         dc8fAXTMtaSzqRTlhs6wgcZZV1fTcDVKLRicrhyN5yJTOZTYkMTovV7zUD1ryqWNzF3h
         AFsw==
X-Forwarded-Encrypted: i=1; AL+hErEIa5qcEUQ4/q/zqq7cvu5XWMsBw5bge0idCh7S0VMn8UbqmOz7e/Ha0bOvr211i2Dsb9/zEJc6dxc6gG8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bDDQM+eJG1Djsp5VA70xGOGQmfumFttGlY1BCDRknF1XQJbNO
	BFpOY8roUlKSAyZ/1GePxyIhwwTkmg1Rl7unPCWVM2pvtPKAoaAu2+GtOPOFtjvOaY8=
X-Gm-Gg: AYBFou0noLX7amf1mVNkZd+HwLloQtgJ5FBBxtzz0nggPvIbWi04v1OTMSAeYMXD5wp
	p1y1j7zf9ifYz4CURXRXPiwjI+nvOn5iJGxerT9fxZyvFP8wjqdyiyUMPOAfYgeMhhmFWbH08s0
	zxoL+Ooo8oj+hJsEIufvBxte5OBXa7V7NtTkAt/QMhB8Wm8xWZaIjGTqROE83N9CUGTMjHoj9Dh
	gdFzbfo5OjE33DY2ndFl80qANKwj/mNLfZpFnRQ+ycX7X+DTl2ai4Nxp6pDX9sjHPBhy3ly+T8Y
	eiQda6yrCt92RYQTPOhJ8sYYsScgOvyh5bXE3D9U6fBU0sdrcrLSCxQ7xeS3dYeQn3Imu+QZJVz
	SR9GrYzP90lRTrZJFhc3VWH9/4CU2/d1i6tPTZ58sIvbB8J6tlhc/6sJ1l0QEoKobCTNw8piWjo
	vtlpKR5vup/T0aNYUhpYlDxzD6FbJ8mPFYxEDnZWToLzRt2ofILslIObGII039YrTMO187EcbY2
	QQJmaENNZKe7pX6Dk48AKv8g5rJmkhxJ8QOaOUIv43GQykomBx+c0ZmbvcyUUk7ylX2XpcPGQX0
	VpYAsuL/dkIi1eeaW9xPe5Xog/6wxc2y9caO1fgGh2uFYZkgly3Mb8Go0GAtjA==
X-Received: by 2002:a05:600c:3b16:b0:4a2:1960:6fa with SMTP id 5b1f17b1804b1-4bb55a6116bmr181649815e9.4.1794762714846;
        Sun, 15 Nov 2026 09:11:54 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:b9ad:41d3:c29c:11b4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ac0e1esm205418705e9.3.2026.11.15.09.11.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 15 Nov 2026 09:11:54 -0800 (PST)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Lee Jones <lee@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>
Cc: Olivier Louvignes <olivier@mgcrea.io>,
	Sebastian Reichel <sre@kernel.org>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/7] power: supply: axp20x_usb_power: Add support for the AXP2101
Date: Sun, 15 Nov 2026 18:11:48 +0100
Message-ID: <20261115171150.64431-6-olivier@mgcrea.io>
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

Report whether VBUS is present (bit 5 of the first status register) and
the input current limit (100 mA to 2 A, in IIN_LIM), and update on the
VBUS plug-in and removal interrupts. Nothing is written: the AXP2101's
VBUS input needs no set-up for that.

Tested on a HiBy R1: unplugging and replugging the cable gives one
VBUS_REMOVAL and one VBUS_PLUGIN interrupt, and "online" goes 1, 0, 1.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 drivers/power/supply/axp20x_usb_power.c | 86 +++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/drivers/power/supply/axp20x_usb_power.c b/drivers/power/supply/axp20x_usb_power.c
index 7625366104bc..926f9c3f1239 100644
--- a/drivers/power/supply/axp20x_usb_power.c
+++ b/drivers/power/supply/axp20x_usb_power.c
@@ -31,6 +31,7 @@
 #define AXP20X_PWR_STATUS_VBUS_USED	BIT(4)
 
 #define AXP717_PWR_STATUS_VBUS_GOOD	BIT(5)
+#define AXP2101_PWR_STATUS_VBUS_GOOD	BIT(5)
 
 #define AXP20X_USB_STATUS_VBUS_VALID	BIT(2)
 
@@ -172,6 +173,24 @@ static void axp717_usb_power_poll_vbus(struct work_struct *work)
 	power->old_status = val;
 }
 
+static void axp2101_usb_power_poll_vbus(struct work_struct *work)
+{
+	struct axp20x_usb_power *power =
+		container_of(work, struct axp20x_usb_power, vbus_detect.work);
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(power->regmap, AXP2101_PMU_STATUS_1, &val);
+	if (ret)
+		return;
+
+	val &= AXP2101_PWR_STATUS_VBUS_GOOD;
+	if (val != power->old_status)
+		power_supply_changed(power->supply);
+
+	power->old_status = val;
+}
+
 static int axp20x_get_usb_type(struct axp20x_usb_power *power,
 			       union power_supply_propval *val)
 {
@@ -315,6 +334,42 @@ static int axp20x_usb_power_get_property(struct power_supply *psy,
 	return 0;
 }
 
+/* Input current limits of AXP2101_IIN_LIM; 6 and 7 are reserved. */
+static const int axp2101_usb_curr_lim_table[] = {
+	100000, 500000, 900000, 1000000, 1500000, 2000000,
+};
+
+static int axp2101_usb_power_get_property(struct power_supply *psy,
+					  enum power_supply_property psp,
+					  union power_supply_propval *val)
+{
+	struct axp20x_usb_power *power = power_supply_get_drvdata(psy);
+	unsigned int v;
+	int ret;
+
+	switch (psp) {
+	case POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT:
+		ret = regmap_field_read(power->curr_lim_fld, &v);
+		if (ret)
+			return ret;
+		if (v >= ARRAY_SIZE(axp2101_usb_curr_lim_table))
+			return -EINVAL;
+		val->intval = axp2101_usb_curr_lim_table[v];
+		break;
+	case POWER_SUPPLY_PROP_ONLINE:
+	case POWER_SUPPLY_PROP_PRESENT:
+		ret = regmap_read(power->regmap, AXP2101_PMU_STATUS_1, &v);
+		if (ret)
+			return ret;
+		val->intval = !!(v & AXP2101_PWR_STATUS_VBUS_GOOD);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int axp717_usb_power_get_property(struct power_supply *psy,
 	enum power_supply_property psp, union power_supply_propval *val)
 {
@@ -643,6 +698,12 @@ static enum power_supply_property axp22x_usb_power_properties[] = {
 	POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT,
 };
 
+static enum power_supply_property axp2101_usb_power_properties[] = {
+	POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT,
+	POWER_SUPPLY_PROP_ONLINE,
+	POWER_SUPPLY_PROP_PRESENT,
+};
+
 static enum power_supply_property axp717_usb_power_properties[] = {
 	POWER_SUPPLY_PROP_HEALTH,
 	POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT,
@@ -682,6 +743,14 @@ static const struct power_supply_desc axp22x_usb_power_desc = {
 	.set_property = axp20x_usb_power_set_property,
 };
 
+static const struct power_supply_desc axp2101_usb_power_desc = {
+	.name = "axp20x-usb",
+	.type = POWER_SUPPLY_TYPE_USB,
+	.properties = axp2101_usb_power_properties,
+	.num_properties = ARRAY_SIZE(axp2101_usb_power_properties),
+	.get_property = axp2101_usb_power_get_property,
+};
+
 static const struct power_supply_desc axp717_usb_power_desc = {
 	.name = "axp20x-usb",
 	.type = POWER_SUPPLY_TYPE_USB,
@@ -722,6 +791,11 @@ static const char * const axp22x_irq_names[] = {
 	"VBUS_REMOVAL",
 };
 
+static const char * const axp2101_irq_names[] = {
+	"VBUS_PLUGIN",
+	"VBUS_REMOVAL",
+};
+
 static const char * const axp717_irq_names[] = {
 	"VBUS_PLUGIN",
 	"VBUS_REMOVAL",
@@ -815,6 +889,15 @@ static const struct axp_data axp223_data = {
 	.axp20x_cfg_adc_reg = axp20x_configure_adc_registers,
 };
 
+static const struct axp_data axp2101_data = {
+	.power_desc	= &axp2101_usb_power_desc,
+	.irq_names	= axp2101_irq_names,
+	.num_irq_names	= ARRAY_SIZE(axp2101_irq_names),
+	.curr_lim_fld	= REG_FIELD(AXP2101_IIN_LIM, 0, 2),
+	.vbus_needs_polling = false,
+	.axp20x_read_vbus = &axp2101_usb_power_poll_vbus,
+};
+
 static const struct axp_data axp717_data = {
 	.power_desc     = &axp717_usb_power_desc,
 	.irq_names      = axp717_irq_names,
@@ -1056,6 +1139,9 @@ static const struct of_device_id axp20x_usb_power_match[] = {
 	}, {
 		.compatible = "x-powers,axp717-usb-power-supply",
 		.data = &axp717_data,
+	}, {
+		.compatible = "x-powers,axp2101-usb-power-supply",
+		.data = &axp2101_data,
 	}, {
 		.compatible = "x-powers,axp813-usb-power-supply",
 		.data = &axp813_data,
-- 
2.39.5

