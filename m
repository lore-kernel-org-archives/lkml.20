Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792749851;
	b=0zgW7ZQythRt8IX+AR1lOky4dbjNzTK/x3KAK9Ykqic6DilrS5q9hwdWDsLdqgqYTuIm
	 rx1r4eqGW56BrQvOAbCA+XWmj3vmJ4bAI7472YBJq9QcsjHzk7YrgpFlB9GoxDSmNAcU0
	 Yote12QzqZ7XMwxAo9OcxMm/eo7L4kBJI3or0xnk9sCYIKUR5ggB/nYBWyd9BEsrIQnOl
	 C2N5AzU7JU7jAvp6t1JhZb4sCYDTBTLXRrwDwpqkxDLI1FFSJcKect/MEH3SX4inBlDTd
	 WRR9TOmjF+9XuUhWbT5yXw6wvlfDzrYKZDN69qq1PIhbcHCLMAZ0daM8FfNOmqB7f9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792749851;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=V73NaMs9YDFcFhqg19NWf/Od15pS09vKG0mvNkd46xk=;
	b=G333DEEQY/VZutmZtpQlGBZRqADrjeOT57cY5dY9qGgUVlf4s0oOZgWAzI6S4nWH2EhT
	 lmCGMKsHGOav+mu79Mhm//TIcDI8Nk8pxz5iqQKMSBhv0AN3Uobhf9skiZyzUm6GUvF3R
	 zIgJ1C/hL15+icHwGCxgroT9Rf+wmXrRDRu7JPRJrSqc84PW9k+z34Sa2padMVi2tYQUh
	 nUdZlqtAnHb1+Ho92Rg0LX/hZD3Sr1G0JnxjyR5jqK1kqcOormqafzLmSeyMcrjvEc/Xc
	 XJHx1XaSMrMFzhPjFRtGK6GcA2mH5w0+mMSwL2ihfLDXqN8uJ5/bpDIqPk9a/L9sO9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=pD3ENHEX;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0813160A2609
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:04:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0813160A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=pD3ENHEX
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1df146015so4838845e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792749849; x=1793354649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V73NaMs9YDFcFhqg19NWf/Od15pS09vKG0mvNkd46xk=;
        b=pD3ENHEX/0beLyGYcidz17WJZ0uTeiJwWm32ILa9UJGSjlt0hcIIZm0wY5dOoAYnMU
         OSpxOO6qinL9sisdZeYyp7ufwhEm+3BAp1rQJjdg8cO+Hon10yq7etn39shzsPVpPpFj
         NPQ9DxejOV7jlU3p7N896Ca3CrzNnVSP6IitLLhICBrvtBweSt8mWweHwLUDxVZvNn+Y
         +i2eMDnqfblrDYsB4bb7ttQKRqvBULEM0wkXH0aVvI755H1GfQIrkZBn9DrjUs3yEUx0
         MsWLVdhz5uphzF+05i3NBb30uc+kET3QgbkHlMj5MXNSL5Z+dyeqdsOdXxhZbQ6bFzE7
         JiEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792749849; x=1793354649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V73NaMs9YDFcFhqg19NWf/Od15pS09vKG0mvNkd46xk=;
        b=YjobJmAs+tmZo3S3/YwqJm9Ud3HFYGaJgSC7oMxkskCxV6bCQpkBpYhPus092xvlyO
         i0ujYVf6K8fJEaUoZKJZBZb+qESym5nLnGr/1Yxdby87pmQcBu6JRONnR3oEG8gGmpsG
         SyFbPIs9/CfTWjKDKmo3mk01+l0P14wOdHTJ5TW3NMBtDo385T2vs4Dp78KPXUvMAzR3
         JrGJseh3fcgcl17VN9HN4LxeyyMDRMmP7mmO6wkW9NpkZNLKnfwDJ1YG7vLKApS3gFWC
         +kFHpSDW9knQzFILULaC0TJSU1iP8cWNRVVFgw85X+BoBxh0boX8sGuT8/Cb3WeMTh9P
         eB4g==
X-Forwarded-Encrypted: i=1; AKwUvByj+AKZJzX6xam1UViprFzt2AY2xBqMZb1MXYVvGpU8wvQtWDhzzUqwib0l95zNbmDNnSz80q7jyBlXdzk=@vger.kernel.org
X-Gm-Message-State: AFq9FYK27m2foJZmpqCgLb3bJzztBJrRwn4uw197evGsn84QDHIN6qQY
	1+geWLJzn4yAxhnYMvqvUk06ezD3mTPH1zzO7Mnohi1EyiPCyMjzMh9ttV6lvoLvxI0=
X-Gm-Gg: AYBFou2sXebGQJbRCeYnfGYr2bLV0uY7zKCnkp8PVzOSwPKPtl6hjhMlt556voCeQvK
	G9pAaeeQu2CzpFDu3ku0Jfr/1SnTr7AoX+yAhl/bmtTavFWnSJWCkjxEZ7hjgNS8y70cIAs95LB
	nilYKYR5ZjjRQLC9XteYKziRRakZ09fmQ2pes6os6CHb0BM0yMRBv/A3Dltu/tmrYOVj3Z/O1pF
	WpsKTt623WvbDhi91qrnEWbENV0QgeAhlhiVxGGSrRnJK7RZSjX4GEmUdeKEAvzC1shU5xIRhdd
	pQkHly2geut02eX+l0KWu+mnu/bXHq8gF4xchpp+DHa039nAW2Uqpq2y9OCPRKMj9bu5C/h2zMY
	x2HGTB+FPxW7949Ii/CF3doXQ4F88/nww6YQQiWN5eV21KBoagA5MrtTLZTTsFhLUzWJgboIrTf
	TCKvxsXwLFW0QwdXQ/QL7R6ehqmHTLlKb7nOIhlm895wvdFaX1p5L2c58oaFafmn/UEry/pSQBu
	lD7v0Kn2gNKFgwKlfGZ62/5B2FYb2I9rUo6K9Gn5aaHQ82ds150bBLjjzkp2zslEo8JRnfls62I
	6//ObPvCyfvV1g==
X-Received: by 2002:a05:600c:3151:b0:4a1:cf60:dcc3 with SMTP id 5b1f17b1804b1-4a211cd5ea8mr28366505e9.29.1792749848033;
        Fri, 23 Oct 2026 03:04:08 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9c3:9990:6877:44a0:5297:9502])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21045df9dsm75761435e9.8.2026.10.23.03.04.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 Oct 2026 03:04:07 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Lee Jones <lee@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>
Cc: Olivier Louvignes <olivier@mgcrea.io>,
	Sebastian Reichel <sre@kernel.org>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] power: supply: axp20x_usb_power: Add support for the AXP2101
Date: Fri, 23 Oct 2026 12:03:59 +0200
Message-ID: <20261023100401.67592-6-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261023100401.67592-1-olivier@mgcrea.io>
References: <20261023100401.67592-1-olivier@mgcrea.io>
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
index e951b2b64b25..594f0492b18a 100644
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

