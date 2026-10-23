Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792749847;
	b=bEdfzxFtPapsxolhgscKSyMhMtXxVwJTGswuLxN8DV2c8MuSAkeyjsrJesZyjP6Yrx7A
	 KMyb9Vs1LqLHa1paJeqKNOMoLr3KTK83fxOXT64VY7NaIsy6C7z7UjiYdDH0wlNqQOPjw
	 pFwQIz4pom5IZejDgNAnP9+FvkvbKXBE4y/1UGetv6uu0PSoo3CZbXNRGFV2+heUtWiI5
	 33Vl+3rURqDMtzRTavToOsKUhgrdiOKt4dJzBdHyXtbU9xhHioAZqsuQVWtu4mfLFS3n0
	 09YWMOA3lmqmOVvxJ9h9x1WgBoR7fTvjgPnGGJrx4GJ1nq9HzoQlFH9DSFMKK+p5CDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792749847;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PX3KcKkPiXcv0Y2mOMZujm7DSv6RPKY/AoyLVqqsKhk=;
	b=eB1QL9/lyxWv4nuvCpdq9KA7wqZE6eSLqJVbSCzlwDhoN9GrbJRQF2WP3I/7SKnRQf8j
	 eVV6cBXGddUDvGJ3ciVl/0Gw32X6J8xOd0VkbmOBEURdkwLv9ztCCEQdmefRP+TQLLkvr
	 5PElPjoXxmFj3rUPhtC2ZpP0ULQ/epaKrTMLH41425Hg2atuKHs9N/6/5GHpHPKw0am6f
	 xAt6JbUSvRSYh3dJ2SeSkgXugoptVznMIG8jbwtNXrgIbpoEDPygiNW5HEpcXeqkjGSp1
	 QbGfH6iWn7XJoNpE8CalgCckokgezSpHwhAKxQfICvCvbrfbeNlpeGcX0MfeaoGT3Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=MaPSk8Du;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57C6606A322
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:04:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A57C6606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=MaPSk8Du
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so5616375e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792749845; x=1793354645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PX3KcKkPiXcv0Y2mOMZujm7DSv6RPKY/AoyLVqqsKhk=;
        b=MaPSk8DuUVkbscT4q7ppFKICeL78cEc3w2OIJJ3t8dQmpmFIw0AbEIFDvfZVm7+R9H
         ijJUklk8TXOgLD5HDAUA/zRn7sCU77jccaAuU7o8MAUyjAEmtHeb9fvaDDAEWOHc2hOr
         RZsRDziyAPeKzplxTBoccqy7bW2egYihST04b9lM5EQ71tHgr66iZGuzko4KU2SewNmN
         HWQ/8tkfjEPwZpfDd2HW+VOekOe4yrldIXhzw5Ijcrz2p4XpJuSsodzR4MFCM1//JfIy
         DczlDDl/Qzhg35X4b5A2RQNflwlIlQSBKpIhmTAXbRvxdbKpD0MSfVxzqAWNm5uzB9FL
         AWbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792749845; x=1793354645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PX3KcKkPiXcv0Y2mOMZujm7DSv6RPKY/AoyLVqqsKhk=;
        b=sEfB8h0RS9HsBQ47bCvWAcsrYt/fSn2e8/gI+2s2UbZYUrhM9If1Pqrdmur+X9FfUV
         AfhWzmFihNBnRcLYxJ9FPAyT4AhKCHEdIQvZ6nBe+uJZC0ykqZb4sN+kslL85PLXmGbY
         kL2lsnwd6A/AXlBC8PnCuW47Txoj3gxUC3h5DbakbKTbD356U0iQjUeKYKdx/IKBf/wE
         6HnOmCN6lXN0hHN5lVa6g74JPOqCrRByTYVnNY8Serzb+0YCrTcy3cj7d9m9Demu9XMC
         qt4jjlTY1gQd0ceCFTQYTGh9X/yrIDfaJvaf79uugeHkpdhidSWWDyqj91qve/goyY0g
         IvVQ==
X-Forwarded-Encrypted: i=1; AKwUvBwV9UGam2K3XW73AMqsfhceXygrwElTV0z6jmKIZAQD20StFuC3SbCj08jlzEsRxUrko1mwQQSp62r6W8c=@vger.kernel.org
X-Gm-Message-State: AFq9FYI2W+b0SFCV/hBGDrxu9zYPdQkutkbUzCT/wO9e/KMtGTBJWcli
	+AKjSIquzoYykNSmxlwGIOXYsLo4DEW+SfXVBVoZwNH51cTnxF/5F8H+WpzPkdQIf3Y=
X-Gm-Gg: AYBFou1by2RvIA3t7popE6yKRzYBtjJOdeLO6Q6qCFQdUPwZjYI60XauWTlyRCxByYy
	0JzTBfbQjXVclS0q6bqYzD0/2lB69BM3Cnd6EF0nSa4HSI8/CEAKNFS0cOJnKxQe9vnOzcUMvzn
	T8rxp1vyBkSfWalNAot0+JiAfaq6jF5wO5OwDZvrzbI2jdgJPY4FqIKHkVn1NPy8eFNIY8i1HNc
	46jDhQ45hi9gN6jQPZkX1sX5M2DsBGQ9Ug+iCU7VZjRDrTHIWHTlAfz94a6vAUzbnCmjxLllTkw
	brYiKTwsKYY1H2EOt+F5rBooPkv3JYvCWWgSb+9dZDszg3gubaOj+Tbr5C00DR4BmSXmFZxSvca
	x91mtvND54PQKzSjmRn23FK96QNaI/5tNo98f47bx+uHpQJ2Sj5111f46fSkOlB9Kc/6mDE9oTk
	qjFQlESMug8smwCOuVzwBPZqqIX7NfQDfkhIq0XQfs/XdIjgSDLiKsizkI31K7gwVoqYNSlOtBF
	0FiFxIFYqyv0iz940z7uEZnOM/Iuw3sjYB1X8NpstSKVz8EMyNNAKMJdLWrO+MWe9wkSf3g6r74
	yHhuZmDCWBR/
X-Received: by 2002:a05:600c:8286:b0:4a2:16c0:f5e with SMTP id 5b1f17b1804b1-4a216c01029mr12632535e9.10.1792749844715;
        Fri, 23 Oct 2026 03:04:04 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9c3:9990:6877:44a0:5297:9502])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21045df9dsm75761435e9.8.2026.10.23.03.04.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 Oct 2026 03:04:04 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Lee Jones <lee@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>
Cc: Olivier Louvignes <olivier@mgcrea.io>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] mfd: axp20x: Add support for the AXP2101
Date: Fri, 23 Oct 2026 12:03:56 +0200
Message-ID: <20261023100401.67592-3-olivier@mgcrea.io>
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
index 50df66de24e0..b87d7ef5ba45 100644
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
@@ -1061,6 +1137,21 @@ static struct mfd_cell axp313a_cells[] = {
 	MFD_CELL_RES("axp313a-pek", axp313a_pek_resources),
 };
 
+static const struct resource axp2101_usb_power_supply_resources[] = {
+	DEFINE_RES_IRQ_NAMED(AXP2101_IRQ_VBUS_PLUGIN, "VBUS_PLUGIN"),
+	DEFINE_RES_IRQ_NAMED(AXP2101_IRQ_VBUS_REMOVAL, "VBUS_REMOVAL"),
+};
+
+/* No driver handles its fuel gauge yet. */
+static struct mfd_cell axp2101_cells[] = {
+	MFD_CELL_NAME("axp20x-regulator"),
+	MFD_CELL_OF("axp20x-usb-power-supply",
+		    axp2101_usb_power_supply_resources, NULL, 0, 0,
+		    "x-powers,axp2101-usb-power-supply"),
+	MFD_CELL_OF("axp20x-battery-power-supply",
+		    NULL, NULL, 0, 0, "x-powers,axp2101-battery-power-supply"),
+};
+
 static struct mfd_cell axp717_cells[] = {
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

