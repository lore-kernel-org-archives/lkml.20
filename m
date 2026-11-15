Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794762715;
	b=c5HSfWfaStupVBtEHXo3ULIgoRmpkSjW+JSX/HlzBnYA4X7pYS4+7tbakIcX186UuPnp
	 Ym1RZeIQGkaUZCizqc8pnikN5tNg1BO47/ocBjysJCcAtRc28sVIrbvfWhW9LggC2oGOy
	 nigjisQ8Puvr0vNffuzXwKDiri9/IA/P/4w5ZgMJaO8iwcsN6wMPnimKlt8WPnXPfBJ/W
	 k9Op0fiyZDKYcum9yyj0/eltDp6eJJDi4ZBOwySsYalY311Fag3E6SiAhoQcVEkV3wxxR
	 VSem67ptvCnY8mqAkiz5XnS+0Ni6+fY7x0dUkq/bZuKgu7J+Kjsb7MBYFYx1YLAQgew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794762715;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1tukaZvHPKGtp9Qd7dr/p8pq5HB7/Uqv0SbgQ15dkdw=;
	b=ja5c0qHf6lgrU3evhljLWTGY/w9HPKwI7rI8z5YrvB+YSaa28fwe5kZxk5RTKhgicbGV
	 agMHx6kPWBBZurQtDa7axmkrB+o67ZS7D+4IKxp9N9rVxCeqYLTYqiqvmxcT48pAUkx5w
	 16y+t8UgfeQ79Bt00N2SeoCq8lhmlqm94BCoUZyD79uJwoSXhfUZ2kFWhc7XOgRS5kms4
	 Ec7pCeXaJUHNYZmyyZ16GXgz40CqOvywZgHwX/cYsjKsNvN4xgk9qhICgg21dkHZjgPfU
	 G8knwmsfIhvXHy1nLir+DrHigGffCi/uRULaPA+u9J36TmrCQZaNWE9jxoAo+k+SwyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b="SoqjX/4J";
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96878606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 17:11:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96878606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=SoqjX/4J
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so1470735e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mgcrea.io; s=google; t=1794762713; x=1795367513; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1tukaZvHPKGtp9Qd7dr/p8pq5HB7/Uqv0SbgQ15dkdw=;
        b=SoqjX/4J1c1z4z7vDGrZpXr2eeXkBLhqzqpXhr0g2md7j9Qe8foH8tQ4v+gCupHzQh
         6hm3dzrkiTASJ04bJrY0/ylPJTk9MoN7HaNhF6nXilEmcsxsLLIk+4fHCURXM6bn1anS
         RIv+or456SRcDrKcU42wfHORm3Ug40cHMVbHFBW2puAwBm24amyDiC10ZDSF0ZYU0yT2
         tmx0rK/dqXpQ3DtkKxQLwzWUsGqNThHxb/nYn1HzdUGmQE+GfHnMByRsfVNR7QWhHuFo
         YtzaE66Fqtrj3zY8xKoCJjzUHWa13ylbDbdVx6MI6lhPoP4br43k4ZnoUZC/tBsBLfve
         80QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794762713; x=1795367513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1tukaZvHPKGtp9Qd7dr/p8pq5HB7/Uqv0SbgQ15dkdw=;
        b=Ri1/4J8mmldnaeJcPMRCgBAgigHyoex1DibghxchPrCWVDlpeX4FIeSYn2q5IuZitQ
         ZJt685gqmmnlXy+XwqK7v2ghwkhHQumZr1Zcygk6UFcVhyx/qBitUXuZi2cVOL7n+tnQ
         z1XS75GY8YMkXkKUE8fk6SvGyQSJQqYIy9h84SiJWjNRVlJaG3Alf2gm+527V9ZC5ECY
         HcyKJs5IbbGrB1G7xhfimB1swCBETr0UzLWN2JPu3nAaIPqWYc+T7VgVyXhG+ILzuCmb
         mH+SpDWADbpTl9swLTFKvOBjsJ4KuSoZvrcZpt8lOHPHMNsU9HibRon6x+Wocqxh+0b6
         8kIQ==
X-Forwarded-Encrypted: i=1; AL+hErHLaTG3fxDY8tqMvimYz90LUPyiUJzEBGlmIi/OCyehcciVk93zZoXre+UAnyeO/ATFu1f5kHs0c+M/fK0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8dNt3EOTB5ADYohg2PKUD6RnF3ILi3eRVadVgxmQCekqvobriN
	+cAd8p0X9XdpAB/z0UyTaTdxOnWt1qdOymCWnBB6rcM8vWLDRsbukLqIHV7+rGEtcUN6xBUmQpX
	y/TMDrTI=
X-Gm-Gg: AYBFou0d1EsbAH6lt9OXlwEX/tr+6fRFKVOs8cdLy5+ujKlTScF/djwxfLLJJMXd500
	Ue5ERswfj1x5GgCS5wuQl/PJ6KGKD9I1jLZW7ISNMM4jnSqBEddrmGR/wSu4KzypS+lwuKJXBQd
	glEPjY0ehh6JDtfGpJlKJTAh272+6KZ/iaLjxb8abQWwmk7TZZM8Q0Ac0iyQyrXjpHhg0JVAAEm
	oocJY12kPaiQLDTD1vClKdiDNK3ObftZVEYjb8mvSbBxcM7zfVJD7FnY+z/UUs3x52ZX2zmyhDy
	cL69CgT6JojxJg6n8xY/fYHESu3IcHl3Y7LckwhVx/hprw9EJb59adBu2GGrgpiz5hPpd9Ka/3j
	RGdWEP90lCbHRlLLmVyrfaxz5JL41S5RdcfPZFArvROO6kfPDyFt4madCG5pS4j4WyywHUITm0n
	/lJclZkbEtDj3pPWjDcN4dxeFh2Jj+TkhEOZlTt7uDnuE0Aj1ZoBe3d25cxXkyILTTldcHaMMUP
	IhK/OZ+SinvWkI9C/oLCSf8ye8V2T545Ie5kbAlv9PNYeC3DfBf3D1R/PxNFD9RVFy23/JUHd73
	w1N0aQOy5DuWAcPB9xXSjqrk5oeu0kG54IsstRy+PPzt99UQs4PkYDasHx3TVUqqjIXLD7oL3yW
	iOKQWaWDP
X-Received: by 2002:a05:600d:2:b0:4b0:a307:46f8 with SMTP id 5b1f17b1804b1-4bb55a57c2cmr134550295e9.10.1794762713016;
        Sun, 15 Nov 2026 09:11:53 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:b9ad:41d3:c29c:11b4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ac0e1esm205418705e9.3.2026.11.15.09.11.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 15 Nov 2026 09:11:52 -0800 (PST)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Lee Jones <lee@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>
Cc: Olivier Louvignes <olivier@mgcrea.io>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/7] mfd: axp20x: Add support for the AXP2101
Date: Sun, 15 Nov 2026 18:11:45 +0100
Message-ID: <20261115171150.64431-3-olivier@mgcrea.io>
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

The AXP2101 is an X-Powers PMIC with five DC-DC converters, several
LDOs, a charger and a fuel gauge, used on the HiBy R1 among others. Add
it to the axp20x core with its register map and interrupts, and cells
for the regulators, the USB power supply and the battery charger. It
powers off through bit 0 of COMM_CFG (0x10), not AXP20X_OFF_CTRL.

There is no datasheet behind this: the register map comes from the
GPL-2.0 AXP2101 driver of the hiby-custom-kernel project
(github.com/Jepl4r/hiby-custom-kernel), an open replacement for HiBy's
closed module, and was checked against the chip's state on a running R1.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 drivers/mfd/axp20x-i2c.c   |   2 +
 drivers/mfd/axp20x.c       | 107 +++++++++++++++++++++++++++++++++-
 include/linux/mfd/axp20x.h | 114 +++++++++++++++++++++++++++++++++++++
 3 files changed, 221 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/axp20x-i2c.c b/drivers/mfd/axp20x-i2c.c
index 5c93136f977e..c1f7bb8e3a14 100644
--- a/drivers/mfd/axp20x-i2c.c
+++ b/drivers/mfd/axp20x-i2c.c
@@ -69,6 +69,7 @@ static const struct of_device_id axp20x_i2c_of_match[] = {
 	{ .compatible = "x-powers,axp717", .data = (void *)AXP717_ID },
 	{ .compatible = "x-powers,axp803", .data = (void *)AXP803_ID },
 	{ .compatible = "x-powers,axp806", .data = (void *)AXP806_ID },
+	{ .compatible = "x-powers,axp2101", .data = (void *)AXP2101_ID },
 	{ .compatible = "x-powers,axp15060", .data = (void *)AXP15060_ID },
 	{ },
 };
@@ -86,6 +87,7 @@ static const struct i2c_device_id axp20x_i2c_id[] = {
 	{ "axp717" },
 	{ "axp803" },
 	{ "axp806" },
+	{ "axp2101" },
 	{ "axp15060" },
 	{ }
 };
diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
index 4d770e718716..2d2c5ded02c3 100644
--- a/drivers/mfd/axp20x.c
+++ b/drivers/mfd/axp20x.c
@@ -48,6 +48,7 @@ static const char * const axp20x_model_names[] = {
 	[AXP806_ID] = "AXP806",
 	[AXP809_ID] = "AXP809",
 	[AXP813_ID] = "AXP813",
+	[AXP2101_ID] = "AXP2101",
 	[AXP15060_ID] = "AXP15060",
 };
 
@@ -218,6 +219,34 @@ static const struct regmap_access_table axp313a_volatile_table = {
 	.n_yes_ranges = ARRAY_SIZE(axp313a_volatile_ranges),
 };
 
+static const struct regmap_range axp2101_writeable_ranges[] = {
+	regmap_reg_range(AXP2101_COMM_CFG, AXP2101_LOW_BATT_WARN),
+	regmap_reg_range(AXP2101_PWROFF_EN, AXP2101_FAST_PWRON_CTRL),
+	regmap_reg_range(AXP2101_ADC_CH_EN, AXP2101_ADC_CH_EN),
+	regmap_reg_range(AXP2101_IRQ0_EN, AXP2101_IRQ2_STATE),
+	regmap_reg_range(AXP2101_TS_PIN_CFG, AXP2101_BTN_CHG_CFG),
+	regmap_reg_range(AXP2101_DCDC_OUTPUT_CONTROL, AXP2101_DLDO2_CONTROL),
+	regmap_reg_range(AXP2101_GAUGE_CFG, AXP2101_GAUGE_CFG),
+};
+
+static const struct regmap_range axp2101_volatile_ranges[] = {
+	regmap_reg_range(AXP2101_PMU_STATUS_1, AXP2101_PMU_STATUS_2),
+	regmap_reg_range(AXP2101_PWRON_STATUS, AXP2101_PWROFF_STATUS),
+	regmap_reg_range(AXP2101_BATT_V_H, AXP2101_DIE_TEMP_L),
+	regmap_reg_range(AXP2101_IRQ0_STATE, AXP2101_IRQ2_STATE),
+	regmap_reg_range(AXP2101_BATT_PERCENT_DATA, AXP2101_TTF_L),
+};
+
+static const struct regmap_access_table axp2101_writeable_table = {
+	.yes_ranges = axp2101_writeable_ranges,
+	.n_yes_ranges = ARRAY_SIZE(axp2101_writeable_ranges),
+};
+
+static const struct regmap_access_table axp2101_volatile_table = {
+	.yes_ranges = axp2101_volatile_ranges,
+	.n_yes_ranges = ARRAY_SIZE(axp2101_volatile_ranges),
+};
+
 static const struct regmap_range axp717_writeable_ranges[] = {
 	regmap_reg_range(AXP717_PMU_FAULT, AXP717_MODULE_EN_CONTROL_1),
 	regmap_reg_range(AXP717_MIN_SYS_V_CONTROL, AXP717_BOOST_CONTROL),
@@ -456,6 +485,15 @@ static const struct regmap_config axp323_regmap_config = {
 	.cache_type = REGCACHE_MAPLE,
 };
 
+static const struct regmap_config axp2101_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.wr_table = &axp2101_writeable_table,
+	.volatile_table = &axp2101_volatile_table,
+	.max_register = AXP2101_TTF_L,
+	.cache_type = REGCACHE_MAPLE,
+};
+
 static const struct regmap_config axp717_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
@@ -663,6 +701,33 @@ static const struct regmap_irq axp313a_regmap_irqs[] = {
 	INIT_REGMAP_IRQ(AXP313A, DIE_TEMP_HIGH,		0, 0),
 };
 
+static const struct regmap_irq axp2101_regmap_irqs[] = {
+	INIT_REGMAP_IRQ(AXP2101, BATT_UNDER_TEMP_WORK,	0, 0),
+	INIT_REGMAP_IRQ(AXP2101, BATT_OVER_TEMP_WORK,	0, 1),
+	INIT_REGMAP_IRQ(AXP2101, BATT_UNDER_TEMP_CHG,	0, 2),
+	INIT_REGMAP_IRQ(AXP2101, BATT_OVER_TEMP_CHG,	0, 3),
+	INIT_REGMAP_IRQ(AXP2101, GAUGE_NEW_SOC,		0, 4),
+	INIT_REGMAP_IRQ(AXP2101, GAUGE_WDOG,		0, 5),
+	INIT_REGMAP_IRQ(AXP2101, SOC_DROP_LVL1,		0, 6),
+	INIT_REGMAP_IRQ(AXP2101, SOC_DROP_LVL2,		0, 7),
+	INIT_REGMAP_IRQ(AXP2101, PEK_RIS_EDGE,		1, 0),
+	INIT_REGMAP_IRQ(AXP2101, PEK_FAL_EDGE,		1, 1),
+	INIT_REGMAP_IRQ(AXP2101, PEK_LONG,		1, 2),
+	INIT_REGMAP_IRQ(AXP2101, PEK_SHORT,		1, 3),
+	INIT_REGMAP_IRQ(AXP2101, BATT_REMOVAL,		1, 4),
+	INIT_REGMAP_IRQ(AXP2101, BATT_PLUGIN,		1, 5),
+	INIT_REGMAP_IRQ(AXP2101, VBUS_REMOVAL,		1, 6),
+	INIT_REGMAP_IRQ(AXP2101, VBUS_PLUGIN,		1, 7),
+	INIT_REGMAP_IRQ(AXP2101, BATT_OVER_V,		2, 0),
+	INIT_REGMAP_IRQ(AXP2101, CHARG_TIMER,		2, 1),
+	INIT_REGMAP_IRQ(AXP2101, DIE_TEMP_HIGH,		2, 2),
+	INIT_REGMAP_IRQ(AXP2101, CHARG,			2, 3),
+	INIT_REGMAP_IRQ(AXP2101, CHARG_DONE,		2, 4),
+	INIT_REGMAP_IRQ(AXP2101, BATT_OVER_CURR,	2, 5),
+	INIT_REGMAP_IRQ(AXP2101, LDO_OVER_CURR,		2, 6),
+	INIT_REGMAP_IRQ(AXP2101, WDOG_EXPIRE,		2, 7),
+};
+
 static const struct regmap_irq axp717_regmap_irqs[] = {
 	INIT_REGMAP_IRQ(AXP717, SOC_DROP_LVL2,		0, 7),
 	INIT_REGMAP_IRQ(AXP717, SOC_DROP_LVL1,		0, 6),
@@ -884,6 +949,17 @@ static const struct regmap_irq_chip axp313a_regmap_irq_chip = {
 	.num_regs		= 1,
 };
 
+static const struct regmap_irq_chip axp2101_regmap_irq_chip = {
+	.name			= "axp2101_irq_chip",
+	.status_base		= AXP2101_IRQ0_STATE,
+	.ack_base		= AXP2101_IRQ0_STATE,
+	.unmask_base		= AXP2101_IRQ0_EN,
+	.init_ack_masked	= true,
+	.irqs			= axp2101_regmap_irqs,
+	.num_irqs		= ARRAY_SIZE(axp2101_regmap_irqs),
+	.num_regs		= 3,
+};
+
 static const struct regmap_irq_chip axp717_regmap_irq_chip = {
 	.name			= "axp717_irq_chip",
 	.status_base		= AXP717_IRQ0_STATE,
@@ -1061,6 +1137,21 @@ static const struct mfd_cell axp313a_cells[] = {
 	MFD_CELL_RES("axp313a-pek", axp313a_pek_resources),
 };
 
+static const struct resource axp2101_usb_power_supply_resources[] = {
+	DEFINE_RES_IRQ_NAMED(AXP2101_IRQ_VBUS_PLUGIN, "VBUS_PLUGIN"),
+	DEFINE_RES_IRQ_NAMED(AXP2101_IRQ_VBUS_REMOVAL, "VBUS_REMOVAL"),
+};
+
+/* No driver handles its fuel gauge yet. */
+static const struct mfd_cell axp2101_cells[] = {
+	MFD_CELL_NAME("axp20x-regulator"),
+	MFD_CELL_OF("axp20x-usb-power-supply",
+		    axp2101_usb_power_supply_resources, NULL, 0, 0,
+		    "x-powers,axp2101-usb-power-supply"),
+	MFD_CELL_OF("axp20x-battery-power-supply",
+		    NULL, NULL, 0, 0, "x-powers,axp2101-battery-power-supply"),
+};
+
 static const struct mfd_cell axp717_cells[] = {
 	MFD_CELL_NAME("axp20x-regulator"),
 	MFD_CELL_RES("axp20x-pek", axp717_pek_resources),
@@ -1241,19 +1332,25 @@ static const struct mfd_cell axp_regulator_only_cells[] = {
 static int axp20x_power_off(struct sys_off_data *data)
 {
 	struct axp20x_dev *axp20x = data->cb_data;
-	unsigned int shutdown_reg;
+	unsigned int shutdown_reg, shutdown_bit;
 
 	switch (axp20x->variant) {
 	case AXP323_ID:
 	case AXP313A_ID:
 		shutdown_reg = AXP313A_SHUTDOWN_CTRL;
+		shutdown_bit = AXP20X_OFF;
+		break;
+	case AXP2101_ID:
+		shutdown_reg = AXP2101_COMM_CFG;
+		shutdown_bit = AXP2101_SOFT_PWROFF;
 		break;
 	default:
 		shutdown_reg = AXP20X_OFF_CTRL;
+		shutdown_bit = AXP20X_OFF;
 		break;
 	}
 
-	regmap_set_bits(axp20x->regmap, shutdown_reg, AXP20X_OFF);
+	regmap_set_bits(axp20x->regmap, shutdown_reg, shutdown_bit);
 
 	/* Give capacitors etc. time to drain to avoid kernel panic msg. */
 	mdelay(500);
@@ -1325,6 +1422,12 @@ int axp20x_match_device(struct axp20x_dev *axp20x)
 		axp20x->regmap_cfg = &axp717_regmap_config;
 		axp20x->regmap_irq_chip = &axp717_regmap_irq_chip;
 		break;
+	case AXP2101_ID:
+		axp20x->nr_cells = ARRAY_SIZE(axp2101_cells);
+		axp20x->cells = axp2101_cells;
+		axp20x->regmap_cfg = &axp2101_regmap_config;
+		axp20x->regmap_irq_chip = &axp2101_regmap_irq_chip;
+		break;
 	case AXP803_ID:
 		axp20x->nr_cells = ARRAY_SIZE(axp803_cells);
 		axp20x->cells = axp803_cells;
diff --git a/include/linux/mfd/axp20x.h b/include/linux/mfd/axp20x.h
index b352661d99a1..21db12a4156d 100644
--- a/include/linux/mfd/axp20x.h
+++ b/include/linux/mfd/axp20x.h
@@ -25,6 +25,7 @@ enum axp20x_variants {
 	AXP806_ID,
 	AXP809_ID,
 	AXP813_ID,
+	AXP2101_ID,
 	AXP15060_ID,
 	NR_AXP20X_VARIANTS,
 };
@@ -116,6 +117,74 @@ enum axp20x_variants {
 #define AXP313A_IRQ_STATE		0x21
 #define AXP323_DCDC_MODE_CTRL2		0x22
 
+#define AXP2101_PMU_STATUS_1		0x00
+#define AXP2101_PMU_STATUS_2		0x01
+#define AXP2101_CHIP_ID			0x03
+#define AXP2101_COMM_CFG		0x10
+#define AXP2101_BATFET_CTRL		0x12
+#define AXP2101_DIE_TEMP_CTRL		0x13
+#define AXP2101_MIN_SYS_V_CTRL		0x14
+#define AXP2101_VIN_DPM			0x15
+#define AXP2101_IIN_LIM			0x16
+#define AXP2101_GAUGE_RESET		0x17
+#define AXP2101_MODULE_EN		0x18
+#define AXP2101_WDT_CTRL		0x19
+#define AXP2101_LOW_BATT_WARN		0x1a
+#define AXP2101_PWRON_STATUS		0x20
+#define AXP2101_PWROFF_STATUS		0x21
+#define AXP2101_PWROFF_EN		0x22
+#define AXP2101_DCDC_OVP_UVP		0x23
+#define AXP2101_VSYS_V_POWEROFF		0x24
+#define AXP2101_PWROK_SEQ		0x25
+#define AXP2101_SLEEP_WAKEUP		0x26
+#define AXP2101_IRQ_LEVEL_OFF_ON	0x27
+#define AXP2101_FAST_PWRON_CFG0		0x28
+#define AXP2101_FAST_PWRON_CTRL		0x2b
+#define AXP2101_ADC_CH_EN		0x30
+#define AXP2101_BATT_V_H		0x34
+#define AXP2101_DIE_TEMP_L		0x3d
+#define AXP2101_IRQ0_EN			0x40
+#define AXP2101_IRQ1_EN			0x41
+#define AXP2101_IRQ2_EN			0x42
+#define AXP2101_IRQ0_STATE		0x48
+#define AXP2101_IRQ1_STATE		0x49
+#define AXP2101_IRQ2_STATE		0x4a
+#define AXP2101_TS_PIN_CFG		0x50
+#define AXP2101_TS_HYSL2H		0x52
+#define AXP2101_JEITA_CFG		0x58
+#define AXP2101_IPRECHG_SET		0x61
+#define AXP2101_ICC_CHG_SET		0x62
+#define AXP2101_ITERM_CHG_SET		0x63
+#define AXP2101_CV_CHG_SET		0x64
+#define AXP2101_CHGLED_CFG		0x69
+#define AXP2101_BTN_CHG_CFG		0x6a
+#define AXP2101_DCDC_OUTPUT_CONTROL	0x80
+#define AXP2101_DCDC_FORCE_PWM		0x81
+#define AXP2101_DCDC1_CONTROL		0x82
+#define AXP2101_DCDC2_CONTROL		0x83
+#define AXP2101_DCDC3_CONTROL		0x84
+#define AXP2101_DCDC4_CONTROL		0x85
+#define AXP2101_DCDC5_CONTROL		0x86
+#define AXP2101_DCDC_MODE_CTRL		0x87
+#define AXP2101_LDO0_OUTPUT_CONTROL	0x90
+#define AXP2101_LDO1_OUTPUT_CONTROL	0x91
+#define AXP2101_ALDO1_CONTROL		0x92
+#define AXP2101_ALDO2_CONTROL		0x93
+#define AXP2101_ALDO3_CONTROL		0x94
+#define AXP2101_ALDO4_CONTROL		0x95
+#define AXP2101_BLDO1_CONTROL		0x96
+#define AXP2101_BLDO2_CONTROL		0x97
+#define AXP2101_CPUSLDO_CONTROL		0x98
+#define AXP2101_DLDO1_CONTROL		0x99
+#define AXP2101_DLDO2_CONTROL		0x9a
+#define AXP2101_GAUGE_CFG		0xa2
+#define AXP2101_BATT_PERCENT_DATA	0xa4
+#define AXP2101_TTE_H			0xa6
+#define AXP2101_TTF_L			0xa9
+
+/* Bit 0 of COMM_CFG powers the PMIC off. */
+#define AXP2101_SOFT_PWROFF		BIT(0)
+
 #define AXP717_ON_INDICATE		0x00
 #define AXP717_PMU_STATUS_2		0x01
 #define AXP717_BC_DETECT		0x05
@@ -498,6 +567,24 @@ enum {
 	AXP313A_REG_ID_MAX,
 };
 
+enum {
+	AXP2101_DCDC1 = 0,
+	AXP2101_DCDC2,
+	AXP2101_DCDC3,
+	AXP2101_DCDC4,
+	AXP2101_DCDC5,
+	AXP2101_ALDO1,
+	AXP2101_ALDO2,
+	AXP2101_ALDO3,
+	AXP2101_ALDO4,
+	AXP2101_BLDO1,
+	AXP2101_BLDO2,
+	AXP2101_DLDO1,
+	AXP2101_DLDO2,
+	AXP2101_CPUSLDO,
+	AXP2101_REG_ID_MAX,
+};
+
 enum {
 	AXP717_DCDC1 = 0,
 	AXP717_DCDC2,
@@ -819,6 +906,33 @@ enum axp313a_irqs {
 	AXP313A_IRQ_PEK_RIS_EDGE,
 };
 
+enum axp2101_irqs {
+	AXP2101_IRQ_BATT_UNDER_TEMP_WORK,
+	AXP2101_IRQ_BATT_OVER_TEMP_WORK,
+	AXP2101_IRQ_BATT_UNDER_TEMP_CHG,
+	AXP2101_IRQ_BATT_OVER_TEMP_CHG,
+	AXP2101_IRQ_GAUGE_NEW_SOC,
+	AXP2101_IRQ_GAUGE_WDOG,
+	AXP2101_IRQ_SOC_DROP_LVL1,
+	AXP2101_IRQ_SOC_DROP_LVL2,
+	AXP2101_IRQ_PEK_RIS_EDGE,
+	AXP2101_IRQ_PEK_FAL_EDGE,
+	AXP2101_IRQ_PEK_LONG,
+	AXP2101_IRQ_PEK_SHORT,
+	AXP2101_IRQ_BATT_REMOVAL,
+	AXP2101_IRQ_BATT_PLUGIN,
+	AXP2101_IRQ_VBUS_REMOVAL,
+	AXP2101_IRQ_VBUS_PLUGIN,
+	AXP2101_IRQ_BATT_OVER_V,
+	AXP2101_IRQ_CHARG_TIMER,
+	AXP2101_IRQ_DIE_TEMP_HIGH,
+	AXP2101_IRQ_CHARG,
+	AXP2101_IRQ_CHARG_DONE,
+	AXP2101_IRQ_BATT_OVER_CURR,
+	AXP2101_IRQ_LDO_OVER_CURR,
+	AXP2101_IRQ_WDOG_EXPIRE,
+};
+
 enum axp717_irqs {
 	AXP717_IRQ_VBUS_FAULT,
 	AXP717_IRQ_VBUS_OVER_V,
-- 
2.39.5

