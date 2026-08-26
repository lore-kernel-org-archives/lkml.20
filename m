Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506F344BCB5
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787766560; cv=none; b=lmfhY0b4luPjl3kdqNwWYWmtg9Li4OkTNIQWRU4KT34JDKtD3TG/9/8xgFpQdQ6iJrh3NPf5HXcmJPPs7dDwtml3CzSkAamjDdTHfnxOtgx0TAngPf9GhwOjDCy30ESGkhtXjpITd/J+KdXKLPMN829Mh074xXU/JgLLtbu1/Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787766560; c=relaxed/simple;
	bh=Q1NMWTZHZoCaWcTGNegOnVcmjx3j1nxHd0XllpJrA9U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sf8/JNEgI2CoFIqYyKkDAtAjcAauC7uwbRGYbsxD6P93MWB8t6LfLt4wjfjGYq1VIwvwxlueIGaB71aY9UNAiN/tkJz7AyJu2P3WvL8bqRmL5kNLZ+uWr49QpAh+7WU91Zu+OI1fUQ4unfH2gWsRW5pWR4CZMU+pl9r9VqYA+/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QrjugKRl; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QrjugKRl"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c2020421077so194313466b.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 10:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787766545; x=1788371345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ARAdwhDNDxFZRDWiTEBCqUcC8KVPCfSSdPjh+soSuOU=;
        b=QrjugKRlB4oxm5PoKHg+FqcWA98VbmEyqSpZu2i4sTAEZR5uYYIPqfIpp/J7LeNmt7
         G6lWhaFvd1sq9zDkjYOFjC2yvyfQdoofXVjreRvRYoiU0mnQVOZKcLwGBtztGviNER7N
         GuBIgkvFVY/8eL96scLNreZKqDHJLwGaxA3UXjcxYf+25TvD1fV8NWz1iV/yqv5nqgYP
         /dq9LntD51yakm8DRgovo3Lh5J25AJSmZKHtUyBaBh2t09+ttCgU55jolYJq+F5pVuxq
         mIAm21suHdF2fOvzXgTGd9I/XKVXVR/sB0kzMcaIQ9NYuWk/f6gak3fsxwbxqnDoc06A
         bXyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787766545; x=1788371345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ARAdwhDNDxFZRDWiTEBCqUcC8KVPCfSSdPjh+soSuOU=;
        b=ieXpwiYabZd0Yu0aCjQW4pbE/k0FRUIVkSsK1uYwe6SmIPHxdE2M0stKY7pSLD+4Au
         ot0nh8+TRdhFaNLvGoCX6KoNmSb6gNndgHmcqhJM5m6ha2DxR3VHjOUKN71RcedM52Yz
         nihmndQ/hov8H1DlTbmfPM6qE5mrKb3RKcCbHstuoz8vyBIsETt9bSJuWpk+CsJ62PFh
         hvViJ/N0kePohlT3j2Gtj+xVpMgWYPP/UDrWMXomHpV99ZSIWjnY/PEElpEq40+FwdfC
         fh7G53OXxb5bZwxEtvfN3WuSaq7WiAoTmow5YgZREuAwrYUb4MdsqqGsN+kPRisgLRGF
         h95w==
X-Gm-Message-State: AFuF++m+J8AX10Op8YYdaOAgMvAqYtZf8VBXdtZTxSVJ+qz+eqtK2p6z
	DWt3wgTnQf1piIWgAMJxG8glRZFjf2A/c/OUTuiyZpM2xtXUwyDRPGjW
X-Gm-Gg: AR+sD12A75U8dj/v0gHnLh+VRAl0exZQPjwLEzyH/Biipw/PRhKpbmo4sZNuXq76N32
	ZI+QmEfezTh/5C4faCmwOxn3KZO0p5VQLo3S+fncNmUUnKNyGzxlSQmMJXsg5j+oOj8JvVnHeqa
	fwqvNKQBV2q0mU8pgAkkvVaGqls8xqlsSx072kC3NrvLxuvRzz3cw2tbKgw4BRxNJKWgucC0L23
	EPIZ9LysY08bZlnX0e7vK8j1TDW+S/LDNJJQ0l22XSUR1THaabs6IuHG7ZUmZrjtadJjWpfpYdg
	rvMmRqSPswNip+8uwsmppr4FWNJZfEDFR4McYchjvTuc/AwuX6rF+myfxoTnVpKEp4HSAEn3FhH
	jSzV8MzN9eR55KcvrHFXhxhs8Tg7Fr2GWk42eDLg9B7ZxSBo0EsAVq/fgG+9CfIjjliJ+utolvW
	PGE6Og6Y6+SqWurfaipunsS3Zjsbd3XFH76bLUpT7cIipwc+Wwg9PFMj+zWncluCQS9lnHaElOo
	HlnhNCuB0P/sTXT5kL8W4NS
X-Received: by 2002:a17:907:3c88:b0:c25:192:99ee with SMTP id a640c23a62f3a-c250c60afa1mr1011728166b.19.1787766544849;
        Wed, 26 Aug 2026 10:49:04 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:aa64:3da0:a259:ecd5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88ac7fsm777752766b.30.2026.08.26.10.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 10:49:04 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: [PATCH v3 07/13] drm: renesas: rz-du: Add support for RZ/G3L LVDS encoder
Date: Wed, 26 Aug 2026 18:48:41 +0100
Message-ID: <20260826174854.199139-8-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826174854.199139-1-biju.das.jz@bp.renesas.com>
References: <20260826174854.199139-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add support for the RZ/G3L LVDS encoder driver. It operates in single-link
mode with 4 lanes (Data) + 1 lane (Clock) and supports pixel clock rates
from 25 to 87 MHz. The LVDS module cannot be used at the same time as
MIPI-DSI. However, LVDS and the DSI interface share a peripheral clock and
the MIPI_DSI_PRESET_N reset signal. Also, the MIPI_DSI_CMN_RSTB and
MIPI_DSI_ARESET_N reset signals must be asserted before using the LVDS
module.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Tested-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Moved set duty cycle to DU encoder.
v1->v2:
 * No change.
v5[1]->v1:
 * Added clk.h as LVDS requires 4:7 duty clock and moved this handling to
   LVDS driver
 * Avoided accessing register in disable if clk is disabled.
v5[1]: https://lore.kernel.org/all/20260625172359.292631-3-biju.das.jz@bp.renesas.com/
v4->v5:
 * Added Kconfig functional dependency for DRM_RZG2L_DU
 * Dropped DRM_PANEL from DRM_RZG3L_LVDS config
 * Dropped unused headers of_device.h,of_graph.h and drm_panel.h
 * Dropped the unused macro LVDS_CMN_RST_PHY0_SEL_CH0
 * Used plain number for macro LVDS_0_PHY_CH_IO_EN0_MSK
 * Retained the tag as the above changes are trivial.
v3->v4:
 * Dropped the header files clk.h and syscon.h
 * Dropped next_bridge check in attach().
 * Dropped syscon for getting regmap.
 * Replaced the below macros to match with hardware manual:
	LVDS_0_CTL_FMT_SEL_MSK->LVDS_0_CTL_FMT_SEL0_MSK
	LVDS_0_PHY_CH_IO_EN_MSK->LVDS_0_PHY_CH_IO_EN0_MSK
	Replaced LVDS_0_PHY_CH_IO_EN->LVDS_0_PHY_CH_IO_EN0
 * Replaced atomic_reset()->atomic_create_state()
 * Dropped the tags as there are new changes.
v2->v3:
 * Collected tags.
v2->v2[1]:
 * Replace drm_atomic_state with drm_atomic_commit in
   rzg3l_lvds_atomic_{en,dis}able().
 * Drop local variable ret and dev_err() messages in
   rzg3l_lvds_atomic_enable(); use WARN_ON() instead to
   capture unexpected failures since atomic_enable should not fail.
 * Drop local variable next_bridge from rzg3l_lvds_probe().
[1] https://lore.kernel.org/all/20260524194457.479681-3-biju.das.jz@bp.renesas.com/
v1->v2:
 * Dropped unused function rzg3l_lvds_is_connected() and removed the 
   corresponding header file rzg3l_lvds.h
 * Dropped next_bridge from struct rzg3l_lvds instead using bridge's
   next_bridge.
 * Replaced pm_runtime_resume_and_get()->pm_runtime_get_sync() as
   atomic_enable doesn't fail and for each enable there always will be an
   atomic_disable() call.
 * Started using DEFINE_RUNTIME_DEV_PM_OPS for PM callback.
 * Replaced rzg3l_lvds_parse_dt() with devm_drm_of_get_bridge() in probe()
 * Started using reset_control_bulk_*() in rzg3l_lvds_pm_runtime_{suspend,
   resume}()
---
 drivers/gpu/drm/renesas/rz-du/Kconfig         |  13 +
 drivers/gpu/drm/renesas/rz-du/Makefile        |   1 +
 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c    | 295 ++++++++++++++++++
 .../gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h   |  25 ++
 4 files changed, 334 insertions(+)
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h

diff --git a/drivers/gpu/drm/renesas/rz-du/Kconfig b/drivers/gpu/drm/renesas/rz-du/Kconfig
index 7f2ef7137ae5..0dbe86bd65d0 100644
--- a/drivers/gpu/drm/renesas/rz-du/Kconfig
+++ b/drivers/gpu/drm/renesas/rz-du/Kconfig
@@ -26,3 +26,16 @@ config DRM_RZG2L_MIPI_DSI
 	def_tristate DRM_RZG2L_DU
 	depends on DRM_RZG2L_USE_MIPI_DSI
 	select DRM_MIPI_DSI
+
+config DRM_RZG3L_USE_LVDS
+	bool "RZ/G3L DU LVDS Encoder Support"
+	depends on DRM_BRIDGE && OF
+	depends on DRM_RZG2L_DU || COMPILE_TEST
+	default DRM_RZG2L_DU
+	help
+	  Enable support for the RZ/G3L Display Unit embedded LVDS encoder.
+
+config DRM_RZG3L_LVDS
+	def_tristate DRM_RZG2L_DU
+	depends on DRM_RZG3L_USE_LVDS
+	select DRM_KMS_HELPER
diff --git a/drivers/gpu/drm/renesas/rz-du/Makefile b/drivers/gpu/drm/renesas/rz-du/Makefile
index 2987900ea6b6..46decb7ac4f1 100644
--- a/drivers/gpu/drm/renesas/rz-du/Makefile
+++ b/drivers/gpu/drm/renesas/rz-du/Makefile
@@ -8,3 +8,4 @@ rzg2l-du-drm-$(CONFIG_VIDEO_RENESAS_VSP1)	+= rzg2l_du_vsp.o
 obj-$(CONFIG_DRM_RZG2L_DU)		+= rzg2l-du-drm.o
 
 obj-$(CONFIG_DRM_RZG2L_MIPI_DSI)	+= rzg2l_mipi_dsi.o
+obj-$(CONFIG_DRM_RZG3L_LVDS)		+= rzg3l_lvds.o
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c b/drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c
new file mode 100644
index 000000000000..2a7ae67ff08d
--- /dev/null
+++ b/drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c
@@ -0,0 +1,295 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * RZ/G3L LVDS Encoder Driver
+ *
+ * Copyright (C) 2026 Renesas Electronics Corporation
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/media-bus-format.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <linux/reset.h>
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_of.h>
+#include <drm/drm_probe_helper.h>
+
+#include "rzg3l_lvds_regs.h"
+
+enum rzg3l_lvds_mode {
+	RZG3L_LVDS_MODE_JEIDA = 0,
+	RZG3L_LVDS_MODE_JEIDA_MIRROR = 1,
+	RZG3L_LVDS_MODE_MODE2 = 2,
+	RZG3L_LVDS_MODE_MODE2_MIRROR = 3,
+	RZG3L_LVDS_MODE_VESA = 4,
+	RZG3L_LVDS_MODE_VESA_MIRROR = 5,
+	RZG3L_LVDS_MODE_MODE6 = 6,
+	RZG3L_LVDS_MODE_MODE6_MIRROR = 7,
+};
+
+struct rzg3l_lvds {
+	struct device *dev;
+	struct clk *dotclk;
+	struct reset_control *prstc;
+	struct reset_control *lvd_rstc;
+	struct regmap *regmap;
+	struct drm_bridge bridge;
+};
+
+#define bridge_to_rzg3l_lvds(b) \
+	container_of(b, struct rzg3l_lvds, bridge)
+
+static const struct regmap_config rzg3l_lvds_regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.max_register = LVDS_0_CTL_OFFSET,
+};
+
+/* -----------------------------------------------------------------------------
+ * Bridge
+ */
+
+static void rzg3l_lvds_atomic_enable(struct drm_bridge *bridge,
+				     struct drm_atomic_commit *state)
+{
+	struct rzg3l_lvds *lvds = bridge_to_rzg3l_lvds(bridge);
+	const struct drm_bridge_state *bridge_state;
+	u32 fmt;
+
+	/* Get the LVDS format from the bridge state. */
+	bridge_state = drm_atomic_get_new_bridge_state(state, bridge);
+	if (WARN_ON(!bridge_state))
+		return;
+
+	switch (bridge_state->output_bus_cfg.format) {
+	case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
+		fmt = RZG3L_LVDS_MODE_JEIDA;
+		break;
+	case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
+		fmt = RZG3L_LVDS_MODE_VESA;
+		break;
+	default:
+		fmt = RZG3L_LVDS_MODE_VESA;
+		dev_warn(lvds->dev, "Unsupported bus fmt 0x%04x\n",
+			 bridge_state->output_bus_cfg.format);
+		break;
+	}
+
+	if (WARN_ON(pm_runtime_get_sync(lvds->dev) < 0))
+		return;
+
+	regmap_update_bits(lvds->regmap, LVDS_0_PHY_OFFSET,
+			   LVDS_0_PHY_CH_EN_BGR, LVDS_0_PHY_CH_EN_BGR);
+	fsleep(20);
+
+	regmap_update_bits(lvds->regmap, LVDS_0_PHY_OFFSET,
+			   LVDS_0_PHY_CH_EN_LDO, LVDS_0_PHY_CH_EN_LDO);
+	fsleep(10);
+
+	regmap_write(lvds->regmap, LVDS_CMN, LVDS_CMN_RST_PHY0_SEL);
+	regmap_update_bits(lvds->regmap, LVDS_0_CTL_OFFSET,
+			   LVDS_0_CTL_FMT_SEL0_MSK,
+			   FIELD_PREP(LVDS_0_CTL_FMT_SEL0_MSK, fmt));
+	regmap_update_bits(lvds->regmap, LVDS_0_PHY_OFFSET,
+			   LVDS_0_PHY_CH_IO_EN0_MSK, LVDS_0_PHY_CH_IO_EN0);
+	regmap_write(lvds->regmap, LVDS_CMN,
+		     LVDS_CMN_RST_PHY0_SEL | LVDS_CMN_PHY_RESET);
+	fsleep(100);
+}
+
+static void rzg3l_lvds_atomic_disable(struct drm_bridge *bridge,
+				      struct drm_atomic_commit *state)
+{
+	struct rzg3l_lvds *lvds = bridge_to_rzg3l_lvds(bridge);
+	int ret;
+
+	PM_RUNTIME_ACQUIRE_IF_ENABLED(lvds->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret < 0)
+		goto pm_put_sync;
+
+	regmap_update_bits(lvds->regmap, LVDS_CMN, LVDS_CMN_PHY_RESET, 0);
+	regmap_update_bits(lvds->regmap, LVDS_0_PHY_OFFSET,
+			   LVDS_0_PHY_CH_IO_EN0_MSK, 0);
+	regmap_update_bits(lvds->regmap, LVDS_0_PHY_OFFSET,
+			   LVDS_0_PHY_CH_EN_LDO, 0);
+	regmap_update_bits(lvds->regmap, LVDS_0_PHY_OFFSET,
+			   LVDS_0_PHY_CH_EN_BGR, 0);
+
+pm_put_sync:
+	pm_runtime_put_sync(lvds->dev);
+}
+
+static int rzg3l_lvds_attach(struct drm_bridge *bridge,
+			     struct drm_encoder *encoder,
+			     enum drm_bridge_attach_flags flags)
+{
+	struct rzg3l_lvds *lvds = bridge_to_rzg3l_lvds(bridge);
+
+	return drm_bridge_attach(encoder, lvds->bridge.next_bridge, bridge, flags);
+}
+
+static enum drm_mode_status
+rzg3l_lvds_bridge_mode_valid(struct drm_bridge *bridge,
+			     const struct drm_display_info *info,
+			     const struct drm_display_mode *mode)
+{
+	if (mode->clock > 87000)
+		return MODE_CLOCK_HIGH;
+
+	if (mode->clock < 25000)
+		return MODE_CLOCK_LOW;
+
+	return MODE_OK;
+}
+
+static const struct drm_bridge_funcs rzg3l_lvds_bridge_ops = {
+	.attach = rzg3l_lvds_attach,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_create_state = drm_atomic_helper_bridge_create_state,
+	.atomic_enable = rzg3l_lvds_atomic_enable,
+	.atomic_disable = rzg3l_lvds_atomic_disable,
+	.mode_valid = rzg3l_lvds_bridge_mode_valid,
+};
+
+/* -----------------------------------------------------------------------------
+ * Power Management
+ */
+
+static int rzg3l_lvds_pm_runtime_suspend(struct device *dev)
+{
+	struct rzg3l_lvds *lvds = dev_get_drvdata(dev);
+	struct reset_control_bulk_data resets[] = {
+		{ .rstc = lvds->lvd_rstc },
+		{ .rstc = lvds->prstc },
+	};
+
+	return reset_control_bulk_assert(ARRAY_SIZE(resets), resets);
+}
+
+static int rzg3l_lvds_pm_runtime_resume(struct device *dev)
+{
+	struct rzg3l_lvds *lvds = dev_get_drvdata(dev);
+	struct reset_control_bulk_data resets[] = {
+		{ .rstc = lvds->lvd_rstc },
+		{ .rstc = lvds->prstc },
+	};
+
+	return reset_control_bulk_deassert(ARRAY_SIZE(resets), resets);
+}
+
+static DEFINE_RUNTIME_DEV_PM_OPS(rzg3l_lvds_pm_ops,
+				 rzg3l_lvds_pm_runtime_suspend,
+				 rzg3l_lvds_pm_runtime_resume, NULL);
+
+/* -----------------------------------------------------------------------------
+ * Probe & Remove
+ */
+
+static int rzg3l_lvds_probe(struct platform_device *pdev)
+{
+	struct reset_control *rstc, *arstc;
+	struct device *dev = &pdev->dev;
+	struct rzg3l_lvds *lvds;
+	void __iomem *base;
+	int ret;
+
+	lvds = devm_drm_bridge_alloc(dev, struct rzg3l_lvds, bridge,
+				     &rzg3l_lvds_bridge_ops);
+	if (IS_ERR(lvds))
+		return PTR_ERR(lvds);
+
+	lvds->dev = dev;
+	lvds->bridge.of_node = pdev->dev.of_node;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	lvds->regmap = devm_regmap_init_mmio(dev, base, &rzg3l_lvds_regmap_config);
+	if (IS_ERR(lvds->regmap))
+		return dev_err_probe(dev, PTR_ERR(lvds->regmap),
+				     "failed to init regmap\n");
+
+	lvds->dotclk = devm_clk_get(dev, "dotclk");
+	if (IS_ERR(lvds->dotclk))
+		return PTR_ERR(lvds->dotclk);
+
+	rstc = devm_reset_control_get_exclusive(dev, "rst");
+	if (IS_ERR(rstc))
+		return dev_err_probe(dev, PTR_ERR(rstc), "failed to get rst\n");
+
+	arstc = devm_reset_control_get_exclusive(dev, "arst");
+	if (IS_ERR(arstc))
+		return dev_err_probe(dev, PTR_ERR(arstc),
+				     "failed to get arst\n");
+
+	lvds->prstc = devm_reset_control_get_exclusive(dev, "prst");
+	if (IS_ERR(lvds->prstc))
+		return dev_err_probe(dev, PTR_ERR(lvds->prstc),
+				     "failed to get prst\n");
+
+	lvds->lvd_rstc = devm_reset_control_get_exclusive(dev, "lvdrst");
+	if (IS_ERR(lvds->lvd_rstc))
+		return dev_err_probe(dev, PTR_ERR(lvds->lvd_rstc),
+				     "failed to get core reset\n");
+
+	platform_set_drvdata(pdev, lvds);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to enable Runtime PM\n");
+
+	lvds->bridge.next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
+	if (IS_ERR(lvds->bridge.next_bridge))
+		return dev_err_probe(dev, PTR_ERR(lvds->bridge.next_bridge),
+				     "failed to get next bridge\n");
+
+	ret = reset_control_assert(rstc);
+	if (ret < 0)
+		return ret;
+
+	ret = reset_control_assert(arstc);
+	if (ret < 0)
+		return ret;
+
+	ret = devm_drm_bridge_add(dev, &lvds->bridge);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to register drm bridge\n");
+
+	return ret;
+}
+
+static const struct of_device_id rzg3l_lvds_of_table[] = {
+	{ .compatible = "renesas,r9a08g046-lvds" },
+	{ /* sentinel */ }
+};
+
+MODULE_DEVICE_TABLE(of, rzg3l_lvds_of_table);
+
+static struct platform_driver rzg3l_lvds_platform_driver = {
+	.probe		= rzg3l_lvds_probe,
+	.driver		= {
+		.name	= "rzg3l-lvds",
+		.pm	= pm_ptr(&rzg3l_lvds_pm_ops),
+		.of_match_table = rzg3l_lvds_of_table,
+	},
+};
+
+module_platform_driver(rzg3l_lvds_platform_driver);
+
+MODULE_AUTHOR("Biju Das <biju.das.jz@bp.renesas.com>");
+MODULE_AUTHOR("Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>");
+MODULE_DESCRIPTION("Renesas RZ/G3L LVDS Encoder Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h b/drivers/gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h
new file mode 100644
index 000000000000..5b276cca9a5d
--- /dev/null
+++ b/drivers/gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * RZ/G3L LVDS Interface Registers Definitions
+ *
+ * Copyright (C) 2026 Renesas Electronics Corporation
+ *
+ */
+
+#ifndef __RZG3L_LVDS_REGS_H__
+#define __RZG3L_LVDS_REGS_H__
+
+#define LVDS_CMN			0x00
+#define LVDS_CMN_RST_PHY0_SEL		BIT(24)
+#define LVDS_CMN_PHY_RESET		BIT(0)
+
+#define LVDS_0_PHY_OFFSET		0x10
+#define LVDS_0_PHY_CH_IO_EN0_MSK	0x1f
+#define LVDS_0_PHY_CH_IO_EN0		(LVDS_0_PHY_CH_IO_EN0_MSK << 0)
+#define LVDS_0_PHY_CH_EN_BGR		BIT(8)
+#define LVDS_0_PHY_CH_EN_LDO		BIT(9)
+
+#define LVDS_0_CTL_OFFSET		0x14
+#define LVDS_0_CTL_FMT_SEL0_MSK		GENMASK(23, 20)
+
+#endif /* __RZG3L_LVDS_REGS_H__ */
-- 
2.43.0

