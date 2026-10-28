Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793200951;
	b=WUzKcoOyr7bSlBKgB/NSUVBUg3lBcna4Rlvg6WHerUwgQOsLWIppeV5dwW66Oj9Wm7L+
	 4euQg0e2+1/y8rYNYytgdGzhDFL+AI9NOvwyuNaflklHqZiGcp66GGVDurfsUlmObFDrx
	 Ey/lzljOVb7Nxn+2x/+qnuBtNoNVxP6Vtjq2Bdkb3xtPgUzwvd86OTeeRKctf+UEt7eGn
	 9WI2LsQ+QM9M36jNl9NCQ3XgQLoBlRbOV7D9g1B/+v/34iO8H2rje7SYkO9qeay6MZTFt
	 ldXZlkspWYp9GtKNYwLCZUiURlG/vOVcUbp5hywBKUCDFhN2JRwQp3ej11li7ppW4Rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793200951;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:Date:Subject:MIME-Version:Content-Transfer-Encoding:Message-Id:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=cIsRchAv6r5eG4F5kaILnTDI7qEdFvMQiF19drwPeho=;
	b=zjWeZrUG051iXWcGyLUprZffPTVYXpd7460fXQfgf2wzaWnlb9AaXSsLJZKQTT8X3Ary
	 xCO7y68LI69C1O+qA4+HcmQ4iDHa7hLmnq4r4Jla6WD9Kl9lgFTa+rI8JHCTDoBaqs8Y3
	 k6H/NPgxg2/EHneIqWqqPpM+zXFJtuQmB+o2YoE+VMniPFTavD5p4Q6nH8kVmMz8jMC/z
	 dIHua1T1mP92dOfF3b6NCBBqdrCuDgoCBSFEnzPwCX2DgOzDZHd0YjN7cAaw+LX3gZofZ
	 ssikhuEezQFscn7dyvtVpGOb7BdD9DOoQtnIMn3+0L31nH4ytGXv6DD+MqDFSNMuQkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=dOJRrB+T;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5AEB606C03D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:22:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5AEB606C03D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=dOJRrB+T
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261028152228euoutp029e106486817b78676e0ad61cbd95ec7d~iusMISGK61482414824euoutp02R
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:22:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261028152228euoutp029e106486817b78676e0ad61cbd95ec7d~iusMISGK61482414824euoutp02R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793200948;
	bh=cIsRchAv6r5eG4F5kaILnTDI7qEdFvMQiF19drwPeho=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=dOJRrB+TUoWbVvJYNJoczV5psEi2/IkGa160dNTYPD3CLLr1MJXSQisNKdJ7bioaf
	 HIdmIdqystHyeEZ3vUnlFJheOQi7X+mtnqQu9+KpQ2HzjaysFCbA3ciaWjVFIM3GDQ
	 PZXmvoHOKeF2sRXGkw13oeI5Youk5RH4A5hGoxcw=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261028152227eucas1p1ac945094a851893634a568a46cc2ee95~iusLYR71Y3045230452eucas1p1C;
	Wed, 28 Oct 2026 15:22:27 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261028152226eusmtip1eb42e7fa211ad3b0092304ea58863ba7~iusKe5yk72109921099eusmtip1y;
	Wed, 28 Oct 2026 15:22:26 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Wed, 28 Oct 2026 16:21:42 +0100
Subject: [PATCH v6 2/5] phy: Add common Innosilicon HDMI PHY helpers
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-jh7110-inno-hdmi-phy-v6-2-f3379684d97e@samsung.com>
In-Reply-To: <20261028-jh7110-inno-hdmi-phy-v6-0-f3379684d97e@samsung.com>
To: Vinod Koul <vkoul@kernel.org>,  Neil Armstrong
	<neil.armstrong@linaro.org>,  Manivannan Sadhasivam <mani@kernel.org>, Rob
	Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
	Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,  Emil Renner
	Berthing <kernel@esmil.dk>,  Hal Feng <hal.feng@starfivetech.com>, Dominique
	Belhachemi <db@domibel.de>,  Michal Wilczynski <m.wilczynski@samsung.com>,
	Andy Yan <andyshrk@163.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,  Marek
	Szyprowski <m.szyprowski@samsung.com>,  Icenowy Zheng
	<zhengxingda@iscas.ac.cn>,  Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	Joshua Peisach <jpeisach@ubuntu.com>, Byron Stanoszek <gandalf@winds.org>, 
	OOHehir <oo.hehir@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=17486;
	i=m.wilczynski@samsung.com; h=from:subject:message-id;
	bh=SzvSNmI439tHonM1PgdO0nvkfUna1MiSAUjP4DTUwrw=;
	b=owGbwMvMwCGWumv6zndzRCIZT6slMWQ9EjbQPXfbo//6Ab6u2/9euDdyfjrDLBWfsHDpLubLy
	nxyvta7O0pZGMQ4GGTFFFnObow2kvzH8LT8+ONfMHNYmUCGMHBxCsBEZLMYGc7kbQxuPnXl7Odd
	XjLflk7pPLeywEDkc1ux5ZyzDW+tX5YzMqzaeeZz4eSTf/LW8lu22E0ptZ/pE1DZcWveRuPViyS
	2bOYDAA==
X-Developer-Key: i=m.wilczynski@samsung.com; a=openpgp;
	fpr=CDB15B3219FE00E577C7E3FA65BA97B9EE9C1459
X-CMS-MailID: 20261028152227eucas1p1ac945094a851893634a568a46cc2ee95
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261028152227eucas1p1ac945094a851893634a568a46cc2ee95
X-EPHeader: CA
X-CMS-RootMailID: 20261028152227eucas1p1ac945094a851893634a568a46cc2ee95
References: <20261028-jh7110-inno-hdmi-phy-v6-0-f3379684d97e@samsung.com>
	<CGME20261028152227eucas1p1ac945094a851893634a568a46cc2ee95@eucas1p1.samsung.com>

The Innosilicon HDMI PHY IP is used by several SoCs. They differ in
where the PHY register block sits in the register space and in which
pixel clocks they support, but the pre-PLL programming sequence and the
layout of its registers are the same.

Add a small library holding that shared part: the pre-PLL configuration
table format, a lookup, clk_ops determine_rate and recalc_rate helpers,
and the pre-PLL register programming. Callers pass a regmap, a register
offset for the PHY block, and their own pixel clock table and its
size.

No driver uses it yet; the users are converted separately.

Reviewed-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Byron Stanoszek <gandalf@winds.org>
Tested-by: OOHehir <oo.hehir@gmail.com>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 drivers/phy/Kconfig               |   8 +
 drivers/phy/Makefile              |   1 +
 drivers/phy/phy-inno-hdmi.c       | 358 ++++++++++++++++++++++++++++++++++++++
 include/linux/phy/inno-hdmi-phy.h |  88 ++++++++++
 4 files changed, 455 insertions(+)

diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 19f3b7d12b7d492d16000fa52483dc5002590d7a..0e973b3b02a30704d339db9f15d4695bcbec1c75 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -168,6 +168,14 @@ config PHY_XGENE
 	help
 	  This option enables support for APM X-Gene SoC multi-purpose PHY.
 
+config PHY_INNO_HDMI
+	tristate
+	depends on GENERIC_PHY
+	select REGMAP
+	help
+	  Common helpers for the Innosilicon HDMI PHY, shared by the SoC
+	  drivers that instantiate it. Selected by those drivers.
+
 source "drivers/phy/allwinner/Kconfig"
 source "drivers/phy/amlogic/Kconfig"
 source "drivers/phy/apple/Kconfig"
diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
index d7aa516bcc49e7662c9c9db421833fe591dfbc05..e93c473dfc6d837ed6ba540f0b0204a0d68d25bf 100644
--- a/drivers/phy/Makefile
+++ b/drivers/phy/Makefile
@@ -7,6 +7,7 @@ obj-$(CONFIG_PHY_COMMON_PROPS)		+= phy-common-props.o
 obj-$(CONFIG_PHY_COMMON_PROPS_TEST)	+= phy-common-props-test.o
 obj-$(CONFIG_GENERIC_PHY)		+= phy-core.o
 obj-$(CONFIG_GENERIC_PHY_MIPI_DPHY)	+= phy-core-mipi-dphy.o
+obj-$(CONFIG_PHY_INNO_HDMI)		+= phy-inno-hdmi.o
 obj-$(CONFIG_PHY_AIROHA_PCIE)		+= phy-airoha-pcie.o
 obj-$(CONFIG_PHY_CAN_TRANSCEIVER)	+= phy-can-transceiver.o
 obj-$(CONFIG_PHY_ECONET_PCIE)		+= phy-econet-pcie.o
diff --git a/drivers/phy/phy-inno-hdmi.c b/drivers/phy/phy-inno-hdmi.c
new file mode 100644
index 0000000000000000000000000000000000000000..6900d4d83e46489e4bc47c5688421a3c0b9a2370
--- /dev/null
+++ b/drivers/phy/phy-inno-hdmi.c
@@ -0,0 +1,358 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Common helpers for the Innosilicon HDMI PHY.
+ *
+ * Copyright (c) 2017 Rockchip Electronics Co. Ltd.
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *
+ * Author: Zheng Yang <zhengyang@rock-chips.com>
+ * Author: Michal Wilczynski <m.wilczynski@samsung.com>
+ *
+ * Derived from drivers/phy/rockchip/phy-rockchip-inno-hdmi.c.
+ *
+ * The same PHY IP is used by several SoCs, which differ in where the PHY
+ * register block sits and in the pixel clock table they support, but share
+ * the pre-PLL programming sequence.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/export.h>
+#include <linux/iopoll.h>
+#include <linux/math64.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+
+#include <linux/phy/inno-hdmi-phy.h>
+
+#define INNO_PRE_PLL_CONTROL			0xa0
+#define INNO_PRE_PLL_POWER_DOWN			BIT(0)
+#define INNO_PCLK_VCO_DIV_5_MASK		BIT(1)
+#define INNO_PCLK_VCO_DIV_5(x)			FIELD_PREP(BIT(1), x)
+
+#define INNO_PRE_PLL_DIV_1			0xa1
+#define INNO_PRE_PLL_PRE_DIV_MASK		GENMASK(5, 0)
+#define INNO_PRE_PLL_PRE_DIV(x)			FIELD_PREP(GENMASK(5, 0), x)
+
+#define INNO_PRE_PLL_DIV_2			0xa2
+#define INNO_SPREAD_SPECTRUM_MOD_DISABLE	BIT(6)
+#define INNO_PRE_PLL_FRAC_DIV_DISABLE		FIELD_PREP(GENMASK(5, 4), 3)
+#define INNO_PRE_PLL_FB_DIV_11_8_MASK		GENMASK(3, 0)
+#define INNO_PRE_PLL_FB_DIV_11_8(x)		FIELD_PREP(GENMASK(3, 0), (x) >> 8)
+
+#define INNO_PRE_PLL_DIV_3			0xa3
+#define INNO_PRE_PLL_FB_DIV_7_0(x)		FIELD_PREP(GENMASK(7, 0), x)
+
+#define INNO_PRE_PLL_TMDSCLK_DIV		0xa4
+#define INNO_PRE_PLL_TMDSCLK_DIV_C(x)		FIELD_PREP(GENMASK(1, 0), x)
+#define INNO_PRE_PLL_TMDSCLK_DIV_B(x)		FIELD_PREP(GENMASK(3, 2), x)
+#define INNO_PRE_PLL_TMDSCLK_DIV_A(x)		FIELD_PREP(GENMASK(5, 4), x)
+
+#define INNO_PCLK_DIV_AB			0xa5
+#define INNO_PCLK_DIV_B_MASK			GENMASK(6, 5)
+#define INNO_PCLK_DIV_B(x)			FIELD_PREP(GENMASK(6, 5), x)
+#define INNO_PCLK_DIV_A_MASK			GENMASK(4, 0)
+#define INNO_PCLK_DIV_A(x)			FIELD_PREP(GENMASK(4, 0), x)
+
+#define INNO_PCLK_DIV_CD			0xa6
+#define INNO_PCLK_DIV_C(x)			FIELD_PREP(GENMASK(6, 5), x)
+#define INNO_PCLK_DIV_D_MASK			GENMASK(4, 0)
+#define INNO_PCLK_DIV_D(x)			FIELD_PREP(GENMASK(4, 0), x)
+
+#define INNO_PRE_PLL_LOCK_STATUS		0xa9
+#define INNO_PRE_PLL_LOCK			BIT(0)
+
+#define INNO_PRE_PLL_FRAC_DIV_23_16		0xd1
+#define INNO_PRE_PLL_FRAC_DIV_15_8		0xd2
+#define INNO_PRE_PLL_FRAC_DIV_7_0		0xd3
+#define INNO_PRE_PLL_FRAC_DIV(x)		FIELD_PREP(GENMASK(7, 0), x)
+
+#define INNO_FRAC_DIV_WIDTH			24
+
+static unsigned int inno_reg(const struct inno_hdmi_phy_pre_pll *pll,
+			     unsigned int reg)
+{
+	return (pll->offset + reg) * 4;
+}
+
+static void inno_write(const struct inno_hdmi_phy_pre_pll *pll,
+		       unsigned int reg, u8 val)
+{
+	regmap_write(pll->regmap, inno_reg(pll, reg), val);
+}
+
+static int inno_read(const struct inno_hdmi_phy_pre_pll *pll, unsigned int reg,
+		     unsigned int *val)
+{
+	return regmap_read(pll->regmap, inno_reg(pll, reg), val);
+}
+
+static void inno_update_bits(const struct inno_hdmi_phy_pre_pll *pll,
+			     unsigned int reg, u8 mask, u8 val)
+{
+	regmap_update_bits(pll->regmap, inno_reg(pll, reg), mask, val);
+}
+
+/**
+ * inno_hdmi_phy_pre_pll_lookup - find the settings for a pixel clock
+ * @pll: pre-PLL instance
+ * @pixclock: requested pixel clock, in Hz
+ * @tmdsclock: requested TMDS clock, in Hz
+ *
+ * Return: the matching table entry, or an ERR_PTR if the PHY cannot generate
+ * the requested combination.
+ */
+const struct inno_hdmi_phy_pre_pll_config *
+inno_hdmi_phy_pre_pll_lookup(const struct inno_hdmi_phy_pre_pll *pll,
+			     unsigned long pixclock, unsigned long tmdsclock)
+{
+	unsigned int i;
+
+	for (i = 0; i < pll->table_size; i++) {
+		const struct inno_hdmi_phy_pre_pll_config *cfg = &pll->table[i];
+
+		if (!cfg->pixclock)
+			continue;
+
+		if (cfg->pixclock == pixclock && cfg->tmdsclock == tmdsclock)
+			return cfg;
+	}
+
+	return ERR_PTR(-EINVAL);
+}
+EXPORT_SYMBOL_GPL(inno_hdmi_phy_pre_pll_lookup);
+
+/**
+ * inno_hdmi_phy_pre_pll_determine_rate - clk_ops.determine_rate helper
+ * @pll: pre-PLL instance
+ * @req: rate request, updated with the rate the PHY would produce
+ *
+ * The PHY can only generate the pixel clocks described by its table, so a
+ * request that does not appear there is rejected rather than rounded.
+ *
+ * Return: 0 on success, -EINVAL if the rate is not supported.
+ */
+int inno_hdmi_phy_pre_pll_determine_rate(const struct inno_hdmi_phy_pre_pll *pll,
+					 struct clk_rate_request *req)
+{
+	unsigned long rate = rounddown(req->rate, 1000);
+	unsigned int i;
+
+	for (i = 0; i < pll->table_size; i++) {
+		const struct inno_hdmi_phy_pre_pll_config *cfg = &pll->table[i];
+
+		if (!cfg->pixclock)
+			continue;
+
+		if (cfg->pixclock == rate) {
+			req->rate = cfg->pixclock;
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(inno_hdmi_phy_pre_pll_determine_rate);
+
+/**
+ * inno_hdmi_phy_pre_pll_recalc_rate - clk_ops.recalc_rate helper
+ * @pll: pre-PLL instance
+ * @parent_rate: rate of the reference clock, in Hz
+ *
+ * Return: the pixel clock the pre-PLL is currently programmed for, in Hz.
+ */
+unsigned long
+inno_hdmi_phy_pre_pll_recalc_rate(const struct inno_hdmi_phy_pre_pll *pll,
+				  unsigned long parent_rate)
+{
+	unsigned int control, div_1, div_2, div_3, pclk_div_ab, pclk_div_cd;
+	unsigned int frac_div_7_0, frac_div_15_8, frac_div_23_16, div;
+	u8 nd, no_a, no_b, no_d;
+	unsigned long frac, rate;
+	u64 vco, vco_rate;
+	u16 nf;
+	int ret;
+
+	ret = inno_read(pll, INNO_PRE_PLL_CONTROL, &control);
+	if (ret)
+		goto err;
+	ret = inno_read(pll, INNO_PRE_PLL_DIV_1, &div_1);
+	if (ret)
+		goto err;
+	ret = inno_read(pll, INNO_PRE_PLL_DIV_2, &div_2);
+	if (ret)
+		goto err;
+	ret = inno_read(pll, INNO_PRE_PLL_DIV_3, &div_3);
+	if (ret)
+		goto err;
+	ret = inno_read(pll, INNO_PCLK_DIV_AB, &pclk_div_ab);
+	if (ret)
+		goto err;
+	ret = inno_read(pll, INNO_PCLK_DIV_CD, &pclk_div_cd);
+	if (ret)
+		goto err;
+
+	nd = div_1 & INNO_PRE_PLL_PRE_DIV_MASK;
+	nf = (div_2 & INNO_PRE_PLL_FB_DIV_11_8_MASK) << 8;
+	nf |= div_3;
+	vco = parent_rate * nf;
+
+	if (!(div_2 & INNO_PRE_PLL_FRAC_DIV_DISABLE)) {
+		ret = inno_read(pll, INNO_PRE_PLL_FRAC_DIV_7_0, &frac_div_7_0);
+		if (ret)
+			goto err;
+		ret = inno_read(pll, INNO_PRE_PLL_FRAC_DIV_15_8, &frac_div_15_8);
+		if (ret)
+			goto err;
+		ret = inno_read(pll, INNO_PRE_PLL_FRAC_DIV_23_16,
+				&frac_div_23_16);
+		if (ret)
+			goto err;
+
+		frac = frac_div_7_0 | (frac_div_15_8 << 8) |
+		       (frac_div_23_16 << 16);
+		vco += DIV_ROUND_CLOSEST(parent_rate * frac,
+					 BIT(INNO_FRAC_DIV_WIDTH));
+	}
+
+	vco_rate = vco;
+
+	if (control & INNO_PCLK_VCO_DIV_5_MASK) {
+		div = nd * 5;
+	} else {
+		no_a = pclk_div_ab & INNO_PCLK_DIV_A_MASK;
+		no_b = FIELD_GET(INNO_PCLK_DIV_B_MASK, pclk_div_ab) + 2;
+		no_d = pclk_div_cd & INNO_PCLK_DIV_D_MASK;
+
+		div = nd * (no_a == 1 ? no_b : no_a) * no_d * 2;
+	}
+
+	/*
+	 * An unprogrammed pre-PLL reads its dividers back as zero, which would
+	 * leave do_div() dividing by it.
+	 */
+	if (!div) {
+		dev_dbg(pll->dev, "pre-PLL dividers read back as zero\n");
+		return 0;
+	}
+
+	do_div(vco, div);
+
+	rate = DIV_ROUND_CLOSEST((unsigned long)vco, 1000) * 1000;
+
+	/* The VCO is only in spec between 1.4 and 3.2 GHz, so log it. */
+	dev_dbg(pll->dev, "%s rate %lu vco %llu\n", __func__, rate, vco_rate);
+
+	return rate;
+
+err:
+	dev_err(pll->dev, "failed to read the pre-PLL registers: %d\n", ret);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(inno_hdmi_phy_pre_pll_recalc_rate);
+
+/**
+ * inno_hdmi_phy_pre_pll_configure - program the pre-PLL dividers
+ * @pll: pre-PLL instance
+ * @cfg: settings to program
+ *
+ * The caller is responsible for powering the pre-PLL down beforehand and back
+ * up afterwards, and for waiting for it to lock.
+ */
+void inno_hdmi_phy_pre_pll_configure(const struct inno_hdmi_phy_pre_pll *pll,
+				     const struct inno_hdmi_phy_pre_pll_config *cfg)
+{
+	u8 val;
+
+	inno_update_bits(pll, INNO_PRE_PLL_CONTROL, INNO_PCLK_VCO_DIV_5_MASK,
+			 INNO_PCLK_VCO_DIV_5(cfg->vco_div_5_en));
+	inno_write(pll, INNO_PRE_PLL_DIV_1, INNO_PRE_PLL_PRE_DIV(cfg->prediv));
+
+	val = INNO_SPREAD_SPECTRUM_MOD_DISABLE;
+	if (!cfg->fracdiv)
+		val |= INNO_PRE_PLL_FRAC_DIV_DISABLE;
+
+	inno_write(pll, INNO_PRE_PLL_DIV_2,
+		   INNO_PRE_PLL_FB_DIV_11_8(cfg->fbdiv) | val);
+	inno_write(pll, INNO_PRE_PLL_DIV_3,
+		   INNO_PRE_PLL_FB_DIV_7_0(cfg->fbdiv));
+
+	inno_write(pll, INNO_PCLK_DIV_AB,
+		   INNO_PCLK_DIV_A(cfg->pclk_div_a) |
+		   INNO_PCLK_DIV_B(cfg->pclk_div_b));
+	inno_write(pll, INNO_PCLK_DIV_CD,
+		   INNO_PCLK_DIV_C(cfg->pclk_div_c) |
+		   INNO_PCLK_DIV_D(cfg->pclk_div_d));
+
+	inno_write(pll, INNO_PRE_PLL_TMDSCLK_DIV,
+		   INNO_PRE_PLL_TMDSCLK_DIV_A(cfg->tmds_div_a) |
+		   INNO_PRE_PLL_TMDSCLK_DIV_B(cfg->tmds_div_b) |
+		   INNO_PRE_PLL_TMDSCLK_DIV_C(cfg->tmds_div_c));
+
+	inno_write(pll, INNO_PRE_PLL_FRAC_DIV_7_0,
+		   INNO_PRE_PLL_FRAC_DIV(cfg->fracdiv));
+	inno_write(pll, INNO_PRE_PLL_FRAC_DIV_15_8,
+		   INNO_PRE_PLL_FRAC_DIV(cfg->fracdiv >> 8));
+	inno_write(pll, INNO_PRE_PLL_FRAC_DIV_23_16,
+		   INNO_PRE_PLL_FRAC_DIV(cfg->fracdiv >> 16));
+}
+EXPORT_SYMBOL_GPL(inno_hdmi_phy_pre_pll_configure);
+
+/**
+ * inno_hdmi_phy_pre_pll_power_down - power the pre-PLL down or up
+ * @pll: pre-PLL instance
+ * @power_down: true to power down, false to power up
+ */
+void inno_hdmi_phy_pre_pll_power_down(const struct inno_hdmi_phy_pre_pll *pll,
+				      bool power_down)
+{
+	inno_update_bits(pll, INNO_PRE_PLL_CONTROL, INNO_PRE_PLL_POWER_DOWN,
+			 power_down ? INNO_PRE_PLL_POWER_DOWN : 0);
+}
+EXPORT_SYMBOL_GPL(inno_hdmi_phy_pre_pll_power_down);
+
+/**
+ * inno_hdmi_phy_pre_pll_is_locked - report whether the pre-PLL has locked
+ * @pll: pre-PLL instance
+ *
+ * Return: true if the pre-PLL has locked, false if it has not or if the lock
+ * status could not be read.
+ */
+bool inno_hdmi_phy_pre_pll_is_locked(const struct inno_hdmi_phy_pre_pll *pll)
+{
+	unsigned int val;
+	int ret;
+
+	ret = inno_read(pll, INNO_PRE_PLL_LOCK_STATUS, &val);
+	if (ret)
+		return false;
+
+	return val & INNO_PRE_PLL_LOCK;
+}
+EXPORT_SYMBOL_GPL(inno_hdmi_phy_pre_pll_is_locked);
+
+/**
+ * inno_hdmi_phy_pre_pll_wait_locked - wait for the pre-PLL to lock
+ * @pll: pre-PLL instance
+ * @timeout_us: how long to wait, in microseconds
+ *
+ * Return: 0 once locked, -ETIMEDOUT otherwise.
+ */
+int inno_hdmi_phy_pre_pll_wait_locked(const struct inno_hdmi_phy_pre_pll *pll,
+				      unsigned int timeout_us)
+{
+	unsigned int val;
+
+	return regmap_read_poll_timeout(pll->regmap,
+					inno_reg(pll, INNO_PRE_PLL_LOCK_STATUS),
+					val, val & INNO_PRE_PLL_LOCK,
+					1000, timeout_us);
+}
+EXPORT_SYMBOL_GPL(inno_hdmi_phy_pre_pll_wait_locked);
+
+MODULE_DESCRIPTION("Innosilicon HDMI PHY common helpers");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/phy/inno-hdmi-phy.h b/include/linux/phy/inno-hdmi-phy.h
new file mode 100644
index 0000000000000000000000000000000000000000..3fe0d965da1f32fc2ac8f871167c0c17045f4642
--- /dev/null
+++ b/include/linux/phy/inno-hdmi-phy.h
@@ -0,0 +1,88 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Common helpers for the Innosilicon HDMI PHY.
+ *
+ * Copyright (c) 2017 Rockchip Electronics Co. Ltd.
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ *
+ * Author: Zheng Yang <zhengyang@rock-chips.com>
+ * Author: Michal Wilczynski <m.wilczynski@samsung.com>
+ *
+ * Derived from drivers/phy/rockchip/phy-rockchip-inno-hdmi.c.
+ */
+
+#ifndef __PHY_INNO_HDMI_H__
+#define __PHY_INNO_HDMI_H__
+
+#include <linux/types.h>
+
+struct clk_rate_request;
+struct regmap;
+
+/**
+ * struct inno_hdmi_phy_pre_pll_config - pre-PLL settings for one pixel clock
+ * @pixclock: pixel clock this entry describes, in Hz
+ * @tmdsclock: TMDS clock this entry describes, in Hz
+ * @prediv: pre-PLL reference divider
+ * @fbdiv: pre-PLL feedback divider
+ * @tmds_div_a: TMDS clock divider A
+ * @tmds_div_b: TMDS clock divider B
+ * @tmds_div_c: TMDS clock divider C
+ * @pclk_div_a: pixel clock divider A
+ * @pclk_div_b: pixel clock divider B
+ * @pclk_div_c: pixel clock divider C
+ * @pclk_div_d: pixel clock divider D
+ * @vco_div_5_en: divide the VCO output by five
+ * @fracdiv: pre-PLL fractional divider, zero to use integer mode
+ */
+struct inno_hdmi_phy_pre_pll_config {
+	unsigned long pixclock;
+	unsigned long tmdsclock;
+	u8 prediv;
+	u16 fbdiv;
+	u8 tmds_div_a;
+	u8 tmds_div_b;
+	u8 tmds_div_c;
+	u8 pclk_div_a;
+	u8 pclk_div_b;
+	u8 pclk_div_c;
+	u8 pclk_div_d;
+	u8 vco_div_5_en;
+	u32 fracdiv;
+};
+
+/**
+ * struct inno_hdmi_phy_pre_pll - a pre-PLL instance
+ * @dev: device used for log messages
+ * @regmap: register map covering the PHY registers
+ * @offset: offset of the PHY register block, in units of the register index.
+ *	    Zero where the PHY block starts the register space, 0x100 on the
+ *	    StarFive JH7110 where it is preceded by the HDMI controller.
+ * @table: pixel clock table
+ * @table_size: number of entries in @table, including any sentinel
+ */
+struct inno_hdmi_phy_pre_pll {
+	struct device *dev;
+	struct regmap *regmap;
+	unsigned int offset;
+	const struct inno_hdmi_phy_pre_pll_config *table;
+	unsigned int table_size;
+};
+
+const struct inno_hdmi_phy_pre_pll_config *
+inno_hdmi_phy_pre_pll_lookup(const struct inno_hdmi_phy_pre_pll *pll,
+			     unsigned long pixclock, unsigned long tmdsclock);
+int inno_hdmi_phy_pre_pll_determine_rate(const struct inno_hdmi_phy_pre_pll *pll,
+					 struct clk_rate_request *req);
+unsigned long
+inno_hdmi_phy_pre_pll_recalc_rate(const struct inno_hdmi_phy_pre_pll *pll,
+				  unsigned long parent_rate);
+void inno_hdmi_phy_pre_pll_configure(const struct inno_hdmi_phy_pre_pll *pll,
+				     const struct inno_hdmi_phy_pre_pll_config *cfg);
+void inno_hdmi_phy_pre_pll_power_down(const struct inno_hdmi_phy_pre_pll *pll,
+				      bool power_down);
+bool inno_hdmi_phy_pre_pll_is_locked(const struct inno_hdmi_phy_pre_pll *pll);
+int inno_hdmi_phy_pre_pll_wait_locked(const struct inno_hdmi_phy_pre_pll *pll,
+				      unsigned int timeout_us);
+
+#endif /* __PHY_INNO_HDMI_H__ */

-- 
2.34.1

