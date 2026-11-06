Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793973565;
	b=L6PbU/uos/P+CkDq/WXUWrj0FJwOAo7rmWZpdc2ZPZmCZbwxlcuHHpvCAfi3B2ApFOlM
	 ur+ofzPAtHzrloGTTNVNoobqtals7u2UT6nwJbX76HeWLfXYiNIsKSZBQkK9vR7KBjn2I
	 m4SkKYWN0lXmJ4pJ5rt2RHuoCGcxPlgDxTwYKEW9LnMoChGyE0OyTZ65ez8p7cse3u97N
	 M/ZgeeF2pR8IxeW0Yg6BCys5Z4cNoB/sPzN1FmmiNjDaWj9TLyzdbKMBDKtd0DtOnOB6q
	 7jWyzWVvpGXS/H9i1RsqMix4eAHTYCBGLNHg5fpBkku4KoeB8bxUIu4X1hpb7MWbX0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973565;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:Date:Subject:MIME-Version:Content-Transfer-Encoding:Message-Id:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=llkM+kWjK23VRkrM9onL8oWydj7+hJRmNotdg5lIzz0=;
	b=Ev24iuLMflT8CxLIvhY7lZRo+Uc7GW/SZuXXcf7EiHC79BJQsgKSQXsBGAq3yM+VUpmD
	 1Gx/8KNyn8lULP3UGfdaM2eYCsqRyT1xbbmaLCNM4p8z7tDu62OYv7sIVwVHHck/GLN+M
	 mHrlJt+3VrX1E7MfUGWmG8VkO20Y7eouIBTO7S66iK5NQr/HidmMxXi136IrE+OQTTiHq
	 f3xct4omgGyb0Ns5dP9p0nlPq6EuqTLtbC9eYE6n/+/UHkLsEDRBI2KdzxWshyvUk7nkZ
	 IMilkEJBpdyDi8nWrFiiZasy57WEQOknLgb3mjVGPCwT8jurxvKtvwSG9Q7kPgZXY1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=kO1WcNXq;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6C36082BF8;
	Fri,  6 Nov 2026 13:59:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D6C36082BF8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=kO1WcNXq
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261106135923euoutp02e280376781a971a30a06b53f45c1ada4~leXNtl1gm2548725487euoutp02d;
	Fri,  6 Nov 2026 13:59:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261106135923euoutp02e280376781a971a30a06b53f45c1ada4~leXNtl1gm2548725487euoutp02d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793973563;
	bh=llkM+kWjK23VRkrM9onL8oWydj7+hJRmNotdg5lIzz0=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=kO1WcNXqqwi4HWdY3s3870CoISQI3bqnDlmUPr/JXKGG7dH2LHK7JkPUHu4/dJsDm
	 qOIkT3bOdkDb75dEA/hlzG6FP0kz0tuof19LzOGp20t/1H58jk0jNXBUFPdKZGdu2c
	 HPycu1mTFKlsZDkYMBQeCtIqCKeQ/1FTznC0A/nQ=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261106135922eucas1p1c1bbe20725aff455ed61806af734baa5~leXNeo8pM0699706997eucas1p1Z;
	Fri,  6 Nov 2026 13:59:22 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261106135920eusmtip139c532a491ef0e5bab924eaa3bfd7c00~leXLjOkLV0076100761eusmtip1S;
	Fri,  6 Nov 2026 13:59:20 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Fri, 06 Nov 2026 14:58:51 +0100
Subject: [PATCH v7 17/19] drm/bridge: starfive: Add JH7110 HDMI controller
 driver
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
Message-Id: <20261106-jh7110-clean-send-v7-17-68f7ea9913db@samsung.com>
In-Reply-To: <20261106-jh7110-clean-send-v7-0-68f7ea9913db@samsung.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,  Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,  Andrzej Hajda
	<andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,  Laurent Pinchart
	<Laurent.pinchart@ideasonboard.com>,  Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,  Luca Ceresoli
	<luca.ceresoli@bootlin.com>,  Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,  Philipp Zabel
	<p.zabel@pengutronix.de>,  Emil Renner Berthing <kernel@esmil.dk>,  Hal Feng
	<hal.feng@starfivetech.com>, Heiko Stuebner <heiko@sntech.de>,  Paul
	Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,  Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,  Dominique
	Belhachemi <db@domibel.de>, Andy Yan <andyshrk@163.com>,  David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,  Yakir Yang
	<kuankuan.y@gmail.com>,  Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>,  Michal Wilczynski
	<m.wilczynski@samsung.com>,  Conor Dooley <conor@kernel.org>, William Qiu
	<william.qiu@starfivetech.com>,  Xingyu Wu <xingyu.wu@starfivetech.com>,
	Sandy Huang <hjc@rock-chips.com>,  Manivannan Sadhasivam <mani@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,  Marek
	Szyprowski <m.szyprowski@samsung.com>,  Maud Spierings
	<maud_spierings@murena.io>,  Graham Markall <hello@big-grey.co.uk>,  Icenowy
	Zheng <zhengxingda@iscas.ac.cn>,  Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	Joshua Peisach <jpeisach@ubuntu.com>,  =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=
	<u.kleine-koenig@baylibre.com>,  Cristian Ciocaltea
	<cristian.ciocaltea@collabora.com>,  Byron Stanoszek <gandalf@winds.org>,
	OOHehir <oo.hehir@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=13997;
	i=m.wilczynski@samsung.com; h=from:subject:message-id;
	bh=nNWs/xUcgcUBHvK6FVVGKl/Hp+raRlqXedXeMrXccT0=;
	b=owGbwMvMwCGWumv6zndzRCIZT6slMWS9vSvuqX41Xc/8/r+Lvx/ErVuVuD5shdRV4bvWBle3v
	p6s19Dxs6OUhUGMg0FWTJHl7MZoI8l/DE/Ljz/+BTOHlQlkCAMXpwBMZJk+I8P304nrahsLSsyv
	KNoUOh5Uk4nMLyuwOfz1da9icd6Gfk9Ghus7i7Lb+Z5fD2rmUc3YtsV19l7ernjmY4vPeF160v1
	uAicA
X-Developer-Key: i=m.wilczynski@samsung.com; a=openpgp;
	fpr=CDB15B3219FE00E577C7E3FA65BA97B9EE9C1459
X-CMS-MailID: 20261106135922eucas1p1c1bbe20725aff455ed61806af734baa5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261106135922eucas1p1c1bbe20725aff455ed61806af734baa5
X-EPHeader: CA
X-CMS-RootMailID: 20261106135922eucas1p1c1bbe20725aff455ed61806af734baa5
References: <20261106-jh7110-clean-send-v7-0-68f7ea9913db@samsung.com>
	<CGME20261106135922eucas1p1c1bbe20725aff455ed61806af734baa5@eucas1p1.samsung.com>

Add the HDMI controller (bridge) driver for the StarFive JH7110.

This driver binds to the starfive,jh7110-inno-hdmi-controller node. It
gets its register access, module and bus clocks from voutcrg, and
consumes the pixel clock and the PHY from its hdmi_phy sibling.

The driver calls the generic inno_hdmi_probe function, which picks up
the regmap shared with the PHY from the parent device and registers a
DRM bridge. The .enable hook is responsible for setting the PHY's pixel
clock rate via clk_set_rate() and powering on the PHY via
phy_power_on().

The DC8200 has two panels, each exposing a DP and a DPI interface, and a
mux in the video output system controller picks which of them drives the
HDMI transmitter. It comes out of reset on panel 0 / DPI, which happens
to be what the default wiring needs, so nothing has had to program it so
far. Derive it from the port graph instead, taking the panel from the
remote port number and the interface from the remote endpoint number, so
that a board describing a different output is honoured.

The generic driver holds the clock it looks up as the register access
clock enabled for its lifetime, and derives the DDC divider from that
clock's rate, so point it at the system clock. Naming the pixel clock
there instead would keep the PHY pre-PLL powered from probe onwards and
size the divider from the wrong rate.

The PHY can only generate the discrete set of pixel clocks described by
its pre-PLL table, so .mode_valid rejects any mode clk_round_rate()
cannot satisfy. Without it such a mode would be advertised to userspace
and the modeset would appear to succeed while the display stayed blank.

.enable returns early when the rate is unsupported or the PHY fails to
power on, so track whether the pixel clock was actually enabled and let
.disable tear down only what was brought up, otherwise the clock
refcount underflows.

The clocks and the reset are torn down through devm rather than from
.remove, so that they outlive the bridge that inno_hdmi_probe() adds with
devm_drm_bridge_add(). Releasing them in .remove runs before devres
unwinds and would leave the bridge registered with its clocks already
gated.

Tested-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Tested-by: Byron Stanoszek <gandalf@winds.org>
Tested-by: OOHehir <oo.hehir@gmail.com>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 drivers/gpu/drm/bridge/Kconfig            |  11 ++
 drivers/gpu/drm/bridge/Makefile           |   1 +
 drivers/gpu/drm/bridge/jh7110-inno-hdmi.c | 297 ++++++++++++++++++++++++++++++
 3 files changed, 309 insertions(+)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 34bcee88170317a4796178452ab5d2e673daf1fd..9c2a37ac816bbca843534662a08307a6bb37e6f8 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -357,6 +357,17 @@ config DRM_SOLOMON_SSD2825
 	  Say M here if you want to support this hardware as a module.
 	  The module will be named "ssd2825".
 
+config DRM_STARFIVE_JH7110_INNO_HDMI
+	tristate "Starfive JH7110 Innosilicon HDMI bridge"
+	depends on OF
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	select DRM_INNO_HDMI
+	help
+	  Enable support for the StarFive JH7110 specific implementation
+	  of the Innosilicon HDMI controller.
+	  This driver acts as a glue layer between the JH7110 HDMI subsystem
+	  parent driver and the generic Innosilicon HDMI bridge driver.
+
 config DRM_THINE_THC63LVD1024
 	tristate "Thine THC63LVD1024 LVDS decoder bridge"
 	depends on OF
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index 15cc821d85b7ea6f3cdc313f3e521b028de567d7..5d843f4ad7ed50b28cb75286c5e22789d91a0836 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -30,6 +30,7 @@ obj-$(CONFIG_DRM_SIL_SII8620) += sil-sii8620.o
 obj-$(CONFIG_DRM_SII902X) += sii902x.o
 obj-$(CONFIG_DRM_SII9234) += sii9234.o
 obj-$(CONFIG_DRM_SIMPLE_BRIDGE) += simple-bridge.o
+obj-$(CONFIG_DRM_STARFIVE_JH7110_INNO_HDMI) += jh7110-inno-hdmi.o
 obj-$(CONFIG_DRM_SOLOMON_SSD2825) += ssd2825.o
 obj-$(CONFIG_DRM_THEAD_TH1520_DW_HDMI) += th1520-dw-hdmi.o
 obj-$(CONFIG_DRM_THINE_THC63LVD1024) += thc63lvd1024.o
diff --git a/drivers/gpu/drm/bridge/jh7110-inno-hdmi.c b/drivers/gpu/drm/bridge/jh7110-inno-hdmi.c
new file mode 100644
index 0000000000000000000000000000000000000000..a0283f83ddc93e3e6c9e9192b73dca9a63f9d9ab
--- /dev/null
+++ b/drivers/gpu/drm/bridge/jh7110-inno-hdmi.c
@@ -0,0 +1,297 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) StarFive Technology Co., Ltd.
+ * Copyright (c) 2025 Samsung Electronics Co., Ltd.
+ * Author: Michal Wilczynski <m.wilczynski@samsung.com>
+ *
+ * HDMI controller (bridge) driver for the StarFive JH7110 HDMI subsystem.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/cleanup.h>
+#include <linux/clk.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/of_graph.h>
+#include <linux/platform_device.h>
+#include <linux/phy/phy.h>
+#include <linux/regmap.h>
+#include <linux/reset.h>
+
+#include <drm/bridge/inno_hdmi.h>
+#include <drm/drm_modes.h>
+
+/* dom_vout_syscon: HDMI pixel data mapping */
+#define VOUT_SYSCFG_4			0x4
+#define VOUT_HDMI_DP_BIT_DEPTH		BIT(25)
+#define VOUT_HDMI_DP_YUV_MODE		GENMASK(27, 26)
+#define VOUT_HDMI_DP_YUV_MODE_RGB	3
+#define VOUT_HDMI_DPI_BIT_DEPTH		GENMASK(29, 28)
+#define VOUT_HDMI_DPI_BIT_DEPTH_8BIT	0
+#define VOUT_HDMI_DPI_DP_SEL		BIT(30)
+
+/* u2_display_panel_mux feeds HDMI_Ctrl, see the block diagram in 5.1 */
+#define VOUT_SYSCFG_8			0x8
+#define VOUT_HDMI_PANEL_SEL		BIT(4)
+
+enum stf_hdmi_ctrl_clocks { CLK_SYS = 0, CLK_M, CLK_B, CLK_PCLK, CLK_CTRL_NUM };
+
+struct stf_inno_hdmi_controller {
+	struct clk_bulk_data clks[CLK_CTRL_NUM];
+	struct reset_control *tx_rst;
+	struct phy *phy;
+	bool enabled;
+};
+
+static enum drm_mode_status
+inno_hdmi_starfive_mode_valid(struct device *dev,
+			      const struct drm_display_mode *mode)
+{
+	struct stf_inno_hdmi_controller *ctrl = dev_get_drvdata(dev);
+	unsigned long pixelclk = mode->clock * 1000;
+	long rounded;
+
+	/*
+	 * The PHY can only generate the discrete set of pixel clocks described
+	 * by its pre-PLL table, and clk_round_rate() fails for anything else.
+	 * Reject those modes here: without this the modeset would appear to
+	 * succeed while the PHY never produces a signal.
+	 */
+	rounded = clk_round_rate(ctrl->clks[CLK_PCLK].clk, pixelclk);
+	if (rounded != pixelclk)
+		return MODE_NOCLOCK;
+
+	return MODE_OK;
+}
+
+static void inno_hdmi_starfive_enable(struct device *dev,
+				      struct drm_display_mode *mode)
+{
+	struct stf_inno_hdmi_controller *ctrl = dev_get_drvdata(dev);
+	int ret;
+
+	/*
+	 * 1. Set the pixel clock rate. This calls the PHY driver's .set_rate op.
+	 */
+	ret = clk_set_rate(ctrl->clks[CLK_PCLK].clk, mode->clock * 1000);
+	if (ret) {
+		dev_err(dev, "Failed to set pclk rate %d: %d\n",
+			mode->clock * 1000, ret);
+		return;
+	}
+
+	/*
+	 * 2. Enable the pixel clock. This calls the PHY driver's .prepare op.
+	 */
+	ret = clk_prepare_enable(ctrl->clks[CLK_PCLK].clk);
+	if (ret) {
+		dev_err(dev, "Failed to enable pclk: %d\n", ret);
+		return;
+	}
+
+	/*
+	 * 3. Power on the PHY. This calls the PHY driver's .power_on op,
+	 * which configures the Post-PLL and analog blocks.
+	 */
+	ret = phy_power_on(ctrl->phy);
+	if (ret) {
+		dev_err(dev, "Failed to power on PHY: %d\n", ret);
+		clk_disable_unprepare(ctrl->clks[CLK_PCLK].clk);
+		return;
+	}
+
+	ctrl->enabled = true;
+}
+
+static void inno_hdmi_starfive_disable(struct device *dev)
+{
+	struct stf_inno_hdmi_controller *ctrl = dev_get_drvdata(dev);
+
+	/*
+	 * .enable bails out early if the pixel clock rate is unsupported or
+	 * the PHY fails to power on, leaving pclk and the PHY untouched.
+	 * Only tear down what was actually brought up, otherwise the clock
+	 * refcount underflows.
+	 */
+	if (!ctrl->enabled)
+		return;
+
+	phy_power_off(ctrl->phy);
+	clk_disable_unprepare(ctrl->clks[CLK_PCLK].clk);
+	ctrl->enabled = false;
+}
+
+/*
+ * The DC8200 has two panels, each exposing a DP and a DPI interface, and a mux
+ * in dom_vout_syscon picks which of them drives the HDMI transmitter. Derive
+ * the mux setting from the port graph: the remote port number selects the
+ * DC8200 panel, and the remote endpoint number the interface on that panel
+ * (0 for DPI, 1 for DP). Both drive 8-bit RGB, the only format this driver
+ * currently produces.
+ */
+static int stf_inno_hdmi_setup_mux(struct device *dev)
+{
+	struct of_endpoint endpoint;
+	struct regmap *syscon;
+	u32 mask, val;
+	int ret;
+
+	syscon = syscon_regmap_lookup_by_phandle(dev->of_node,
+						 "starfive,vout-syscon");
+	if (IS_ERR(syscon))
+		return dev_err_probe(dev, PTR_ERR(syscon),
+				     "Failed to get vout syscon\n");
+
+	struct device_node *ep __free(device_node) =
+		of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
+	if (!ep)
+		return dev_err_probe(dev, -ENODEV, "No input endpoint\n");
+
+	struct device_node *remote __free(device_node) =
+		of_graph_get_remote_endpoint(ep);
+	if (!remote)
+		return dev_err_probe(dev, -ENODEV,
+				     "Input endpoint is not connected\n");
+
+	ret = of_graph_parse_endpoint(remote, &endpoint);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to parse the remote endpoint\n");
+
+	if (endpoint.port > 1 || endpoint.id > 1)
+		return dev_err_probe(dev, -EINVAL,
+				     "Unsupported DC8200 output %u/%u\n",
+				     endpoint.port, endpoint.id);
+
+	/* Data mapping: 8-bit RGB on whichever interface is in use. */
+	mask = VOUT_HDMI_DPI_DP_SEL | VOUT_HDMI_DP_BIT_DEPTH |
+	       VOUT_HDMI_DP_YUV_MODE | VOUT_HDMI_DPI_BIT_DEPTH;
+	val = FIELD_PREP(VOUT_HDMI_DPI_DP_SEL, endpoint.id) |
+	      FIELD_PREP(VOUT_HDMI_DP_YUV_MODE, VOUT_HDMI_DP_YUV_MODE_RGB) |
+	      FIELD_PREP(VOUT_HDMI_DPI_BIT_DEPTH, VOUT_HDMI_DPI_BIT_DEPTH_8BIT);
+
+	ret = regmap_update_bits(syscon, VOUT_SYSCFG_4, mask, val);
+	if (ret)
+		return ret;
+
+	/* Which DC8200 panel drives the HDMI transmitter. */
+	return regmap_update_bits(syscon, VOUT_SYSCFG_8, VOUT_HDMI_PANEL_SEL,
+				  FIELD_PREP(VOUT_HDMI_PANEL_SEL,
+					     endpoint.port));
+}
+
+static void stf_inno_hdmi_clk_disable(void *data)
+{
+	struct stf_inno_hdmi_controller *ctrl = data;
+
+	clk_bulk_disable_unprepare(CLK_CTRL_NUM - 1, ctrl->clks);
+}
+
+static void stf_inno_hdmi_rst_assert(void *data)
+{
+	reset_control_assert(data);
+}
+
+static int starfive_inno_hdmi_controller_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct stf_inno_hdmi_controller *ctrl;
+	const struct inno_hdmi_plat_data *plat_data;
+	struct inno_hdmi *inno;
+	int ret;
+
+	ctrl = devm_kzalloc(dev, sizeof(*ctrl), GFP_KERNEL);
+	if (!ctrl)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, ctrl);
+
+	ctrl->phy = devm_phy_get(dev, NULL);
+	if (IS_ERR(ctrl->phy))
+		return dev_err_probe(dev, PTR_ERR(ctrl->phy), "Failed to get PHY\n");
+
+	ctrl->tx_rst = devm_reset_control_get_exclusive(dev, NULL);
+	if (IS_ERR(ctrl->tx_rst))
+		return dev_err_probe(dev, PTR_ERR(ctrl->tx_rst), "failed to get tx reset\n");
+
+	/* Populate the clock names this controller *consumes* */
+	ctrl->clks[CLK_SYS].id = "pclk";
+	ctrl->clks[CLK_M].id = "mclk";
+	ctrl->clks[CLK_B].id = "bclk";
+	ctrl->clks[CLK_PCLK].id = "pixel"; /* Generated by the PHY */
+
+	ret = devm_clk_bulk_get(dev, CLK_CTRL_NUM, ctrl->clks);
+	if (ret)
+		return dev_err_probe(dev, ret, "Unable to get controller clocks\n");
+
+	/*
+	 * Tear the clocks and the reset down through devm, so that they outlive
+	 * everything registered after them. The bridge is added with
+	 * devm_drm_bridge_add(), and unwinding in the wrong order would leave it
+	 * registered while its clocks are already gated.
+	 *
+	 * The pixel clock is enabled on demand during modeset.
+	 */
+	ret = clk_bulk_prepare_enable(CLK_CTRL_NUM - 1, ctrl->clks);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(dev, stf_inno_hdmi_clk_disable, ctrl);
+	if (ret)
+		return ret;
+
+	ret = reset_control_deassert(ctrl->tx_rst);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(dev, stf_inno_hdmi_rst_assert,
+				       ctrl->tx_rst);
+	if (ret)
+		return ret;
+
+	ret = stf_inno_hdmi_setup_mux(dev);
+	if (ret)
+		return ret;
+
+	plat_data = of_device_get_match_data(dev);
+
+	/* Hand off to the generic library to create the bridge. */
+	inno = inno_hdmi_probe(pdev, plat_data);
+	if (IS_ERR(inno))
+		return PTR_ERR(inno);
+
+	return 0;
+}
+
+static const struct inno_hdmi_plat_ops stf_inno_hdmi_plat_ops = {
+	.enable = inno_hdmi_starfive_enable,
+	.disable = inno_hdmi_starfive_disable,
+	.mode_valid = inno_hdmi_starfive_mode_valid,
+};
+
+static const struct inno_hdmi_plat_data stf_inno_hdmi_plat_data = {
+	.ops = &stf_inno_hdmi_plat_ops,
+	.reg_clk_source_tmds = true,
+	.supported_hdmi_ver = HDMI_VERSION_1_4,
+};
+
+static const struct of_device_id starfive_hdmi_controller_dt_ids[] = {
+	{ .compatible = "starfive,jh7110-inno-hdmi-controller",
+	  .data = &stf_inno_hdmi_plat_data },
+	{}
+};
+MODULE_DEVICE_TABLE(of, starfive_hdmi_controller_dt_ids);
+
+static struct platform_driver starfive_inno_hdmi_controller_driver = {
+	.probe = starfive_inno_hdmi_controller_probe,
+	.driver = {
+		.name = "starfive-inno-hdmi-controller",
+		.of_match_table = starfive_hdmi_controller_dt_ids,
+	},
+};
+module_platform_driver(starfive_inno_hdmi_controller_driver);
+
+MODULE_AUTHOR("Michal Wilczynski <m.wilczynski@samsung.com>");
+MODULE_DESCRIPTION("StarFive INNO HDMI Controller Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1

