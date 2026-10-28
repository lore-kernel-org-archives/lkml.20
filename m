Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793200952;
	b=qJVRfaivI2827JMiuBpz1ZXA8ChRBo542P3eGCU2eTTHvYIxYfUk21ckPuPTM1n7g0Pd
	 2TzlXMBa4Sgy1O5lnH/VqgMMCHViALJWv3OuSFWvRi3BiwxC3gWjt4Ac2lMK121jrI4ry
	 FMllYDsmdeyETHpYcpv5Bc2berWR14TZBVKl/9op1xkY+vO5ZHpYqN85crCdExel84hHA
	 8h0SuqHAzbNR+YYJB5OjYqgSn7KEgp7IqsY8c8vk/bwB2aovUY2XoFZK4SAbOObu7sA+2
	 7lKhS2hLpsX1xIUTksfKvc809Ml6/KuHfmcLYhwKlWGfL69eeDG7vEweGFofzakIlgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793200952;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:Date:Subject:MIME-Version:Content-Transfer-Encoding:Message-Id:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=Lphv0iOlH1BZ2T7unl+dBC9bPboucvJ/EUXIbjyRLUA=;
	b=fGGkEFAtQOmvAZpzIT7YVAlhzN+Jit1VICzlac3n0o4KhXpDWLacKQyhj3TKakieJ1SG
	 FUwtVn9wbBAqDxQnQu+xaGo+ImgTnx6Wq20fJ4oQC/ryOk4IIvxmjExIlI396PVL0zqdv
	 KcNA8R7G0YUid+JOl5NRFOAXbMCwlHGAsL7LOSopvuwCaIQKj5976yy0gzLYu4vLmyE4w
	 KtMRrXYt/2r+FM822uBanFh346+mnmbCLDZEspBeUX3K0vp+U0oxhLvcv+Wk8WaU6Z6rK
	 xG1rgaFmMC7aGhB4LnLFiunb8USTYZpx+q1a0q7KGKwY1TI2J53UDkjMBJyeFOekbWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=O5kSnDVR;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F72606AB00
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:22:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79F72606AB00
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=O5kSnDVR
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261028152229euoutp02769d0efbf2d76048ed14e3852a975477~iusNM_R751485914859euoutp02S
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:22:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261028152229euoutp02769d0efbf2d76048ed14e3852a975477~iusNM_R751485914859euoutp02S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793200949;
	bh=Lphv0iOlH1BZ2T7unl+dBC9bPboucvJ/EUXIbjyRLUA=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=O5kSnDVRbNo6nbIHH/Vt1zeQj+xv9ANF9b7feWjeSiYln6LxMwha0V0Yjr4XkoYWq
	 +Kr47ZvOCG+SNyAZZZCxmb4I0HqeagMkJ1FR7GQpwjheasKU++/UKktjru0klP0ipu
	 gEzQzjdtqMBcwyKEKEvERp9SmDwqGQACD8fdPPQI=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261028152228eucas1p23d9dcfc3ecb88236aa76f56b4d1dc8e4~iusMWvV0r3066330663eucas1p2t;
	Wed, 28 Oct 2026 15:22:28 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261028152227eusmtip12a84e1e1420a8333b33e058139e02d10~iusLcDkX62111121111eusmtip1j;
	Wed, 28 Oct 2026 15:22:27 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Wed, 28 Oct 2026 16:21:43 +0100
Subject: [PATCH v6 3/5] phy: rockchip: inno-hdmi: Use the common Innosilicon
 PHY helpers
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
Message-Id: <20261028-jh7110-inno-hdmi-phy-v6-3-f3379684d97e@samsung.com>
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
	Joshua Peisach <jpeisach@ubuntu.com>, Byron Stanoszek <gandalf@winds.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=13127;
	i=m.wilczynski@samsung.com; h=from:subject:message-id;
	bh=Pmg/TVJTephOzaL1HlBDtcGIt5ah1YEDtuV0LfwAY3g=;
	b=owGbwMvMwCGWumv6zndzRCIZT6slMWQ9Eja4wna0yTO5vDL05vzoWQe1G6w/qhz65Pl/0yJVZ
	97MGYaXO0pZGMQ4GGTFFFnObow2kvzH8LT8+ONfMHNYmUCGMHBxCsBEAtMZGc4uYfp6yk+5Z1J1
	t4F18E7H5W+4lHwzDn1ySpMy4eGc68TI0DvBJaviSG77R7WoGt59Dcy/F+UyfAqIdL+zKfhG1Ps
	eDgA=
X-Developer-Key: i=m.wilczynski@samsung.com; a=openpgp;
	fpr=CDB15B3219FE00E577C7E3FA65BA97B9EE9C1459
X-CMS-MailID: 20261028152228eucas1p23d9dcfc3ecb88236aa76f56b4d1dc8e4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261028152228eucas1p23d9dcfc3ecb88236aa76f56b4d1dc8e4
X-EPHeader: CA
X-CMS-RootMailID: 20261028152228eucas1p23d9dcfc3ecb88236aa76f56b4d1dc8e4
References: <20261028-jh7110-inno-hdmi-phy-v6-0-f3379684d97e@samsung.com>
	<CGME20261028152228eucas1p23d9dcfc3ecb88236aa76f56b4d1dc8e4@eucas1p2.samsung.com>

The RK3328 pre-PLL programming, its table lookup and its recalc_rate and
determine_rate implementations are the generic Innosilicon ones, so drop
the local copies and use the shared helpers instead.

The RK3228 pre-PLL sits at different register addresses, so it keeps its
own register level code and only shares the table lookup.

The now unused RK3328 pre-PLL register macros go with it, as does the
local pre-PLL config lookup wrapper; both call sites already have the
TMDS clock to hand and call inno_hdmi_phy_pre_pll_lookup() directly.

The RK3328 recalc_rate used to log the pre-PLL output as "vco". The
shared helper logs it too, and reports the actual VCO frequency
alongside the rate, which is the value with the 1.4-3.2 GHz constraint.

The register writes, their order and the values written are unchanged.
No functional change intended.

Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Reviewed-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Tested-by: Byron Stanoszek <gandalf@winds.org>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 drivers/phy/rockchip/Kconfig                  |   1 +
 drivers/phy/rockchip/phy-rockchip-inno-hdmi.c | 169 ++++----------------------
 2 files changed, 26 insertions(+), 144 deletions(-)

diff --git a/drivers/phy/rockchip/Kconfig b/drivers/phy/rockchip/Kconfig
index 14698571b607590dc0e7a29f3b39eb9a5d4e3d25..9732c5be87717dc3ddbea1c60080952336a07af9 100644
--- a/drivers/phy/rockchip/Kconfig
+++ b/drivers/phy/rockchip/Kconfig
@@ -34,6 +34,7 @@ config PHY_ROCKCHIP_INNO_HDMI
 	depends on COMMON_CLK
 	depends on HAS_IOMEM
 	select GENERIC_PHY
+	select PHY_INNO_HDMI
 	help
 	  Enable this to support the Rockchip Innosilicon HDMI PHY.
 
diff --git a/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c b/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c
index c3d257a0f4a65b4c475ed7246568dd463b46ed86..809583a7030627832794ec0b08295549616f8f28 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c
@@ -17,6 +17,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
+#include <linux/phy/inno-hdmi-phy.h>
 #include <linux/phy/phy.h>
 #include <linux/slab.h>
 
@@ -130,42 +131,14 @@
 #define RK3328_INT_VSS_AGND_ESD_DET			BIT(1)
 #define RK3328_INT_AGND_VSS_ESD_DET			BIT(0)
 /* REG: 0xa0 */
-#define RK3328_PCLK_VCO_DIV_5_MASK			BIT(1)
-#define RK3328_PCLK_VCO_DIV_5(x)			UPDATE(x, 1, 1)
 #define RK3328_PRE_PLL_POWER_DOWN			BIT(0)
 /* REG: 0xa1 */
-#define RK3328_PRE_PLL_PRE_DIV_MASK			GENMASK(5, 0)
-#define RK3328_PRE_PLL_PRE_DIV(x)			UPDATE(x, 5, 0)
 /* REG: 0xa2 */
-/* unset means center spread */
-#define RK3328_SPREAD_SPECTRUM_MOD_DOWN			BIT(7)
-#define RK3328_SPREAD_SPECTRUM_MOD_DISABLE		BIT(6)
-#define RK3328_PRE_PLL_FRAC_DIV_DISABLE			UPDATE(3, 5, 4)
-#define RK3328_PRE_PLL_FB_DIV_11_8_MASK			GENMASK(3, 0)
-#define RK3328_PRE_PLL_FB_DIV_11_8(x)			UPDATE((x) >> 8, 3, 0)
 /* REG: 0xa3 */
-#define RK3328_PRE_PLL_FB_DIV_7_0(x)			UPDATE(x, 7, 0)
 /* REG: 0xa4*/
-#define RK3328_PRE_PLL_TMDSCLK_DIV_C_MASK		GENMASK(1, 0)
-#define RK3328_PRE_PLL_TMDSCLK_DIV_C(x)			UPDATE(x, 1, 0)
-#define RK3328_PRE_PLL_TMDSCLK_DIV_B_MASK		GENMASK(3, 2)
-#define RK3328_PRE_PLL_TMDSCLK_DIV_B(x)			UPDATE(x, 3, 2)
-#define RK3328_PRE_PLL_TMDSCLK_DIV_A_MASK		GENMASK(5, 4)
-#define RK3328_PRE_PLL_TMDSCLK_DIV_A(x)			UPDATE(x, 5, 4)
 /* REG: 0xa5 */
-#define RK3328_PRE_PLL_PCLK_DIV_B_SHIFT			5
-#define RK3328_PRE_PLL_PCLK_DIV_B_MASK			GENMASK(6, 5)
-#define RK3328_PRE_PLL_PCLK_DIV_B(x)			UPDATE(x, 6, 5)
-#define RK3328_PRE_PLL_PCLK_DIV_A_MASK			GENMASK(4, 0)
-#define RK3328_PRE_PLL_PCLK_DIV_A(x)			UPDATE(x, 4, 0)
 /* REG: 0xa6 */
-#define RK3328_PRE_PLL_PCLK_DIV_C_SHIFT			5
-#define RK3328_PRE_PLL_PCLK_DIV_C_MASK			GENMASK(6, 5)
-#define RK3328_PRE_PLL_PCLK_DIV_C(x)			UPDATE(x, 6, 5)
-#define RK3328_PRE_PLL_PCLK_DIV_D_MASK			GENMASK(4, 0)
-#define RK3328_PRE_PLL_PCLK_DIV_D(x)			UPDATE(x, 4, 0)
 /* REG: 0xa9 */
-#define RK3328_PRE_PLL_LOCK_STATUS			BIT(0)
 /* REG: 0xaa */
 #define RK3328_POST_PLL_POST_DIV_ENABLE			GENMASK(3, 2)
 #define RK3328_POST_PLL_REFCLK_SEL_TMDS			BIT(1)
@@ -218,11 +191,8 @@
 #define RK3328_TMDS_TERM_RESIST_1000			BIT(1)
 #define RK3328_TMDS_TERM_RESIST_2000			BIT(0)
 /* REG: 0xd1 */
-#define RK3328_PRE_PLL_FRAC_DIV_23_16(x)		UPDATE((x) >> 16, 7, 0)
 /* REG: 0xd2 */
-#define RK3328_PRE_PLL_FRAC_DIV_15_8(x)			UPDATE((x) >> 8, 7, 0)
 /* REG: 0xd3 */
-#define RK3328_PRE_PLL_FRAC_DIV_7_0(x)			UPDATE(x, 7, 0)
 
 struct inno_hdmi_phy_drv_data;
 
@@ -240,6 +210,8 @@ struct inno_hdmi_phy {
 	const struct inno_hdmi_phy_drv_data *plat_data;
 	int chip_version;
 
+	struct inno_hdmi_phy_pre_pll pre_pll;
+
 	/* clk provider */
 	struct clk_hw hw;
 	struct clk *phyclk;
@@ -248,21 +220,6 @@ struct inno_hdmi_phy {
 	unsigned long opts_tmds_char_rate;
 };
 
-struct pre_pll_config {
-	unsigned long pixclock;
-	unsigned long tmdsclock;
-	u8 prediv;
-	u16 fbdiv;
-	u8 tmds_div_a;
-	u8 tmds_div_b;
-	u8 tmds_div_c;
-	u8 pclk_div_a;
-	u8 pclk_div_b;
-	u8 pclk_div_c;
-	u8 pclk_div_d;
-	u8 vco_div_5_en;
-	u32 fracdiv;
-};
 
 struct post_pll_config {
 	unsigned long tmdsclock;
@@ -291,7 +248,7 @@ struct inno_hdmi_phy_drv_data {
 	const struct phy_config		*phy_cfg_table;
 };
 
-static const struct pre_pll_config pre_pll_cfg_table[] = {
+static const struct inno_hdmi_phy_pre_pll_config pre_pll_cfg_table[] = {
 	{ 25175000,  25175000,  3,  125, 3, 1, 1,  1, 3, 3,  4, 0, 0xe00000},
 	{ 25175000,  31468750,  1,   41, 0, 3, 3,  1, 3, 3,  4, 0, 0xf5554f},
 	{ 27000000,  27000000,  1,   36, 0, 3, 3,  1, 2, 3,  4, 0,      0x0},
@@ -603,7 +560,7 @@ static irqreturn_t inno_hdmi_phy_rk3328_irq(int irq, void *dev_id)
 static int inno_hdmi_phy_validate(struct phy *phy, enum phy_mode mode,
 				  int submode, union phy_configure_opts *opts)
 {
-	const struct pre_pll_config *cfg = pre_pll_cfg_table;
+	const struct inno_hdmi_phy_pre_pll_config *cfg = pre_pll_cfg_table;
 	unsigned long tmdsclock;
 
 	if (!(mode == PHY_MODE_HDMI && submode == PHY_HDMI_MODE_TMDS))
@@ -717,23 +674,6 @@ static const struct phy_ops inno_hdmi_phy_ops = {
 	.validate = inno_hdmi_phy_validate,
 };
 
-static const
-struct pre_pll_config *inno_hdmi_phy_get_pre_pll_cfg(struct inno_hdmi_phy *inno,
-						     unsigned long rate)
-{
-	const struct pre_pll_config *cfg = pre_pll_cfg_table;
-	unsigned long tmdsclock = inno_hdmi_phy_get_tmdsclk(inno, rate);
-
-	for (; cfg->pixclock != 0; cfg++)
-		if (cfg->pixclock == rate && cfg->tmdsclock == tmdsclock)
-			break;
-
-	if (cfg->pixclock == 0)
-		return ERR_PTR(-EINVAL);
-
-	return cfg;
-}
-
 static int inno_hdmi_phy_rk3228_clk_is_prepared(struct clk_hw *hw)
 {
 	struct inno_hdmi_phy *inno = to_inno_hdmi_phy(hw);
@@ -797,7 +737,7 @@ unsigned long inno_hdmi_phy_rk3228_clk_recalc_rate(struct clk_hw *hw,
 static int inno_hdmi_phy_rk3228_clk_determine_rate(struct clk_hw *hw,
 						   struct clk_rate_request *req)
 {
-	const struct pre_pll_config *cfg = pre_pll_cfg_table;
+	const struct inno_hdmi_phy_pre_pll_config *cfg = pre_pll_cfg_table;
 
 	req->rate = (req->rate / 1000) * 1000;
 
@@ -818,7 +758,7 @@ static int inno_hdmi_phy_rk3228_clk_set_rate(struct clk_hw *hw,
 					     unsigned long parent_rate)
 {
 	struct inno_hdmi_phy *inno = to_inno_hdmi_phy(hw);
-	const struct pre_pll_config *cfg;
+	const struct inno_hdmi_phy_pre_pll_config *cfg;
 	unsigned long tmdsclock = inno_hdmi_phy_get_tmdsclk(inno, rate);
 	u32 v;
 	int ret;
@@ -829,7 +769,7 @@ static int inno_hdmi_phy_rk3228_clk_set_rate(struct clk_hw *hw,
 	if (inno->pixclock == rate && inno->tmdsclock == tmdsclock)
 		return 0;
 
-	cfg = inno_hdmi_phy_get_pre_pll_cfg(inno, rate);
+	cfg = inno_hdmi_phy_pre_pll_lookup(&inno->pre_pll, rate, tmdsclock);
 	if (IS_ERR(cfg))
 		return PTR_ERR(cfg);
 
@@ -915,39 +855,9 @@ unsigned long inno_hdmi_phy_rk3328_clk_recalc_rate(struct clk_hw *hw,
 						   unsigned long parent_rate)
 {
 	struct inno_hdmi_phy *inno = to_inno_hdmi_phy(hw);
-	unsigned long frac;
-	u8 nd, no_a, no_b, no_d;
-	u64 vco;
-	u16 nf;
-
-	nd = inno_read(inno, 0xa1) & RK3328_PRE_PLL_PRE_DIV_MASK;
-	nf = ((inno_read(inno, 0xa2) & RK3328_PRE_PLL_FB_DIV_11_8_MASK) << 8);
-	nf |= inno_read(inno, 0xa3);
-	vco = parent_rate * nf;
-
-	if (!(inno_read(inno, 0xa2) & RK3328_PRE_PLL_FRAC_DIV_DISABLE)) {
-		frac = inno_read(inno, 0xd3) |
-		       (inno_read(inno, 0xd2) << 8) |
-		       (inno_read(inno, 0xd1) << 16);
-		vco += DIV_ROUND_CLOSEST(parent_rate * frac, (1 << 24));
-	}
-
-	if (inno_read(inno, 0xa0) & RK3328_PCLK_VCO_DIV_5_MASK) {
-		do_div(vco, nd * 5);
-	} else {
-		no_a = inno_read(inno, 0xa5) & RK3328_PRE_PLL_PCLK_DIV_A_MASK;
-		no_b = inno_read(inno, 0xa5) & RK3328_PRE_PLL_PCLK_DIV_B_MASK;
-		no_b >>= RK3328_PRE_PLL_PCLK_DIV_B_SHIFT;
-		no_b += 2;
-		no_d = inno_read(inno, 0xa6) & RK3328_PRE_PLL_PCLK_DIV_D_MASK;
-
-		do_div(vco, (nd * (no_a == 1 ? no_b : no_a) * no_d * 2));
-	}
 
-	inno->pixclock = DIV_ROUND_CLOSEST((unsigned long)vco, 1000) * 1000;
-
-	dev_dbg(inno->dev, "%s rate %lu vco %llu\n",
-		__func__, inno->pixclock, vco);
+	inno->pixclock = inno_hdmi_phy_pre_pll_recalc_rate(&inno->pre_pll,
+							   parent_rate);
 
 	return inno->pixclock;
 }
@@ -955,20 +865,9 @@ unsigned long inno_hdmi_phy_rk3328_clk_recalc_rate(struct clk_hw *hw,
 static int inno_hdmi_phy_rk3328_clk_determine_rate(struct clk_hw *hw,
 						   struct clk_rate_request *req)
 {
-	const struct pre_pll_config *cfg = pre_pll_cfg_table;
-
-	req->rate = (req->rate / 1000) * 1000;
-
-	for (; cfg->pixclock != 0; cfg++)
-		if (cfg->pixclock == req->rate)
-			break;
-
-	if (cfg->pixclock == 0)
-		return -EINVAL;
-
-	req->rate = cfg->pixclock;
+	struct inno_hdmi_phy *inno = to_inno_hdmi_phy(hw);
 
-	return 0;
+	return inno_hdmi_phy_pre_pll_determine_rate(&inno->pre_pll, req);
 }
 
 static int inno_hdmi_phy_rk3328_clk_set_rate(struct clk_hw *hw,
@@ -976,9 +875,8 @@ static int inno_hdmi_phy_rk3328_clk_set_rate(struct clk_hw *hw,
 					     unsigned long parent_rate)
 {
 	struct inno_hdmi_phy *inno = to_inno_hdmi_phy(hw);
-	const struct pre_pll_config *cfg;
+	const struct inno_hdmi_phy_pre_pll_config *cfg;
 	unsigned long tmdsclock = inno_hdmi_phy_get_tmdsclk(inno, rate);
-	u32 val;
 	int ret;
 
 	dev_dbg(inno->dev, "%s rate %lu tmdsclk %lu\n",
@@ -987,39 +885,15 @@ static int inno_hdmi_phy_rk3328_clk_set_rate(struct clk_hw *hw,
 	if (inno->pixclock == rate && inno->tmdsclock == tmdsclock)
 		return 0;
 
-	cfg = inno_hdmi_phy_get_pre_pll_cfg(inno, rate);
+	cfg = inno_hdmi_phy_pre_pll_lookup(&inno->pre_pll, rate, tmdsclock);
 	if (IS_ERR(cfg))
 		return PTR_ERR(cfg);
 
-	inno_update_bits(inno, 0xa0, RK3328_PRE_PLL_POWER_DOWN,
-			 RK3328_PRE_PLL_POWER_DOWN);
+	inno_hdmi_phy_pre_pll_power_down(&inno->pre_pll, true);
+	inno_hdmi_phy_pre_pll_configure(&inno->pre_pll, cfg);
+	inno_hdmi_phy_pre_pll_power_down(&inno->pre_pll, false);
 
-	/* Configure pre-pll */
-	inno_update_bits(inno, 0xa0, RK3328_PCLK_VCO_DIV_5_MASK,
-			 RK3328_PCLK_VCO_DIV_5(cfg->vco_div_5_en));
-	inno_write(inno, 0xa1, RK3328_PRE_PLL_PRE_DIV(cfg->prediv));
-
-	val = RK3328_SPREAD_SPECTRUM_MOD_DISABLE;
-	if (!cfg->fracdiv)
-		val |= RK3328_PRE_PLL_FRAC_DIV_DISABLE;
-	inno_write(inno, 0xa2, RK3328_PRE_PLL_FB_DIV_11_8(cfg->fbdiv) | val);
-	inno_write(inno, 0xa3, RK3328_PRE_PLL_FB_DIV_7_0(cfg->fbdiv));
-	inno_write(inno, 0xa5, RK3328_PRE_PLL_PCLK_DIV_A(cfg->pclk_div_a) |
-		   RK3328_PRE_PLL_PCLK_DIV_B(cfg->pclk_div_b));
-	inno_write(inno, 0xa6, RK3328_PRE_PLL_PCLK_DIV_C(cfg->pclk_div_c) |
-		   RK3328_PRE_PLL_PCLK_DIV_D(cfg->pclk_div_d));
-	inno_write(inno, 0xa4, RK3328_PRE_PLL_TMDSCLK_DIV_C(cfg->tmds_div_c) |
-		   RK3328_PRE_PLL_TMDSCLK_DIV_A(cfg->tmds_div_a) |
-		   RK3328_PRE_PLL_TMDSCLK_DIV_B(cfg->tmds_div_b));
-	inno_write(inno, 0xd3, RK3328_PRE_PLL_FRAC_DIV_7_0(cfg->fracdiv));
-	inno_write(inno, 0xd2, RK3328_PRE_PLL_FRAC_DIV_15_8(cfg->fracdiv));
-	inno_write(inno, 0xd1, RK3328_PRE_PLL_FRAC_DIV_23_16(cfg->fracdiv));
-
-	inno_update_bits(inno, 0xa0, RK3328_PRE_PLL_POWER_DOWN, 0);
-
-	/* Wait for Pre-PLL lock */
-	ret = inno_poll(inno, 0xa9, val, val & RK3328_PRE_PLL_LOCK_STATUS,
-			1000, 10000);
+	ret = inno_hdmi_phy_pre_pll_wait_locked(&inno->pre_pll, 10000);
 	if (ret) {
 		dev_err(inno->dev, "Pre-PLL locking failed\n");
 		return ret;
@@ -1418,6 +1292,13 @@ static int inno_hdmi_phy_probe(struct platform_device *pdev)
 	if (IS_ERR(inno->regmap))
 		return PTR_ERR(inno->regmap);
 
+	/* The PHY block starts the register space on these SoCs. */
+	inno->pre_pll.dev = inno->dev;
+	inno->pre_pll.regmap = inno->regmap;
+	inno->pre_pll.offset = 0;
+	inno->pre_pll.table = pre_pll_cfg_table;
+	inno->pre_pll.table_size = ARRAY_SIZE(pre_pll_cfg_table);
+
 	/* only the newer rk3328 hdmiphy has an interrupt */
 	inno->irq = platform_get_irq(pdev, 0);
 	if (inno->irq > 0) {

-- 
2.34.1

