Received: from mail-wr2-f18.google.com (mail-wr2-f18.google.com [74.125.225.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E734D5973
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 09:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790847656; cv=none; b=N8Z79JMSb+Wvvy+otkL+LYTPpwc1WQ/KIbUA1LUPByclIx9DTbVz/fJaUG1rzneAlHa6SYiomwjDLpnajR5L+cXXmPaocdHJM+ubaD7uqCDDvmUdtRurC4VzEHAn2iw56mgiWLpgWBIAOcBIxGum+P3paGCKhF4KO0RZcccSrUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790847656; c=relaxed/simple;
	bh=oyUHcrEvIvhPoqABwYsoOG24M6DTFrDK7ObpF9O2Os4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i0xMrzelFWWbGSHCxoC/zeCw9fsCEgo/JfGGgLni/yADx7kYX+FY+U9U1sLo4skmRaBKO3ZzuEoLOIwqbtSUMGQwjCAo6bqkQ0BLPaapGu2za/aeXYrUUJDl6dJJvorCCWdCdNWp8z0pBle+ddc4+T0eZutnsAV0f0fSLb4R3gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a9PlDg+/; arc=none smtp.client-ip=74.125.225.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a9PlDg+/"
Received: by mail-wr2-f18.google.com with SMTP id ffacd0b85a97d-48b0fc598f8so127243f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 02:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790847651; x=1791452451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5DZJsmMUYjRLHOiLjm19HqEnwGkCfSukWb/Qggxzdk0=;
        b=a9PlDg+/n/oTdV1DnU1UsoxR82dU314A6z1NE4t7yZgJwvxfcZr6nfhl1R/c+BGBFA
         it4Mpjq2OqVST9uqDeom6nbLp1dSVZMHQrKr421SIPKMh5WFSagjrcAnoopST7uZXsFs
         AHB4HVJlC/0FkemS1fJjUPvPJ6ugbr02ZxXKCPjLiXB7GMx6cPYE53op1dEqneCd7KbI
         +gjMf8cHMfbqYsdiN7G7n8WRlfVGsi3qB2z+Tr3cy8xqdDDwjj9ZrPWrABD03hPC1ocH
         JSckSyhSTEiGloJiwebKJ4Y3ItjYL8f9BIy/dFejn5ziDtOPe91ircUfJnQi0tnG54Qn
         nrZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790847651; x=1791452451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5DZJsmMUYjRLHOiLjm19HqEnwGkCfSukWb/Qggxzdk0=;
        b=nmxs/G+Iwj5ExsjIuKEQLUDk1hmPsowQKu6iRhWgnd2cazSJSjV/xJnbe9zOi7QYkj
         CYRBx3zHVuqxCWxIeb3q7lPFrV+zzMCPf5Y2i+id0BIynZ0huH3sf+nTToxBVxo/PpET
         SsJki6OsEffdOTTGXGYxjLAr6KoyS+TYaAcRYs6Enlec8TOHxSHJ6fq39Pq2QZJ/pVCo
         O9GVTLpwZLmjsARGEiCiLn71m+h/5QkesWTvyZg+WBrH/kxYvckkyqUuF1+8BrrEMlS2
         kodn167pAMtC/LYHhHWVAAdmlrWURZ64yHY2xG5PHXUaYHeRbiaHkoCqIyxkTMbcKBTE
         CMVA==
X-Gm-Message-State: AFuF++kgnEwBFr/w5w4tRXPJhYHGGFwKSoZj7wV6kfUKfyANzFnqBDKJ
	OJqei/mPgBK/Cr9uYE7RbrujpcNQO5Th2Tkl940crFEcDWpU+sf6GGvn
X-Gm-Gg: AYBFou0w4Gj+feoSUGfdnL2pyciU6WoDhpwogIDY9UlWmKvjH8bdhjKr73TEChuMEeP
	2KsNAcQZ5zDMsUvov8rYQzj2xGzJALUOK+n5+ctD7L9pUYrZDUeHtRF6s3wmm8XJPWBZjG4Dbhb
	gbcOIZQNvoZHkFhl587CziA6nx/rouy6ysS12xseHam76BpvcMDW0skB+USQjQX4ccWYRwnk96r
	Mc9P4FjcpEpoqfmPV5R3XpbAu/9gW3Tiwa65f9m6ZTcRcbKY96rpMSeM4DWkW8tp4IbIzoAnNOS
	wz70KPITT7lNNZx5s/3XCYpEpd4984F63xh1hd7p1i8KY31R2q3zGlPMYLIOECi5blBl2cgwdfO
	p9XM8GqmwsUoeZSEg5TObCRniCJHpGWATiV7dMPg0b07ZKRgBfnW+eI+hkSfKdJWxxn2QDKDVuz
	MNoZ+HAIe/z5FyYmgZ0qGr9yL0K5nNbELEDpsThIyjD7fYc33zQ9UsyEDLerdATKao+HJV4+JeE
	DUD
X-Received: by 2002:a05:600c:8b88:b0:49d:1df6:2592 with SMTP id 5b1f17b1804b1-4a01b00c41bmr60788595e9.21.1790847650805;
        Thu, 01 Oct 2026 02:40:50 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:5563:a938:8fc:9dc5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0226201aasm38937725e9.6.2026.10.01.02.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 02:40:50 -0700 (PDT)
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
Subject: [PATCH v5 7/9] drm: renesas: rz-du: Add support for RZ/G3L LVDS encoder
Date: Thu,  1 Oct 2026 10:40:22 +0100
Message-ID: <20261001094041.135697-8-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001094041.135697-1-biju.das.jz@bp.renesas.com>
References: <20261001094041.135697-1-biju.das.jz@bp.renesas.com>
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
v4->v5:
 * Replaced static resets array in probe with global resets array.
 * Updated rzg3l_lvds_atomic_disable() to fix the
   PM_RUNTIME_ACQUIRE_IF_ENABLED guard that prevents synchronous suspend.
 * Updated rzg3l_lvds_atomic_enable() to fix refcount underflow in
   atomic_disable due to early return in atomic_enable.
 * Dropped dotclk from struct rzg3l_lvds.
v3->v4:
 * Added resets in pair for simplification.
 * Added comment in probe() for asserting resets.
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
 drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c    | 275 ++++++++++++++++++
 .../gpu/drm/renesas/rz-du/rzg3l_lvds_regs.h   |  25 ++
 4 files changed, 314 insertions(+)
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
index 000000000000..99ad6445d359
--- /dev/null
+++ b/drivers/gpu/drm/renesas/rz-du/rzg3l_lvds.c
@@ -0,0 +1,275 @@
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
+	struct reset_control_bulk_data resets[2];
+	struct reset_control_bulk_data dsi_resets[2];
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
+	if (WARN_ON(pm_runtime_get_sync(lvds->dev) < 0))
+		return;
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
+
+	{
+		PM_RUNTIME_ACQUIRE_IF_ENABLED(lvds->dev, pm);
+		if (!PM_RUNTIME_ACQUIRE_ERR(&pm)) {
+			regmap_update_bits(lvds->regmap, LVDS_CMN,
+					   LVDS_CMN_PHY_RESET, 0);
+			regmap_update_bits(lvds->regmap, LVDS_0_PHY_OFFSET,
+					   LVDS_0_PHY_CH_IO_EN0_MSK, 0);
+			regmap_update_bits(lvds->regmap, LVDS_0_PHY_OFFSET,
+					   LVDS_0_PHY_CH_EN_LDO, 0);
+			regmap_update_bits(lvds->regmap, LVDS_0_PHY_OFFSET,
+					   LVDS_0_PHY_CH_EN_BGR, 0);
+		}
+	}
+
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
+
+	return reset_control_bulk_assert(ARRAY_SIZE(lvds->resets), lvds->resets);
+}
+
+static int rzg3l_lvds_pm_runtime_resume(struct device *dev)
+{
+	struct rzg3l_lvds *lvds = dev_get_drvdata(dev);
+
+	return reset_control_bulk_deassert(ARRAY_SIZE(lvds->resets), lvds->resets);
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
+				     "Failed to init regmap\n");
+
+	lvds->resets[0].id = "prst";
+	lvds->resets[1].id = "lvdrst";
+	ret = devm_reset_control_bulk_get_exclusive(dev, ARRAY_SIZE(lvds->resets),
+						    lvds->resets);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get prst/core resets\n");
+
+	platform_set_drvdata(pdev, lvds);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to enable Runtime PM\n");
+
+	lvds->bridge.next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
+	if (IS_ERR(lvds->bridge.next_bridge))
+		return dev_err_probe(dev, PTR_ERR(lvds->bridge.next_bridge),
+				     "Failed to get next bridge\n");
+
+	/*
+	 * This module cannot be used at the same time as MIPI-DSI, so assert
+	 * the MIPI_DSI_CMN_RSTB and MIPI_DSI_ARESET_N resets before using this
+	 * module.
+	 */
+	lvds->dsi_resets[0].id = "rst";
+	lvds->dsi_resets[1].id = "arst";
+	ret = devm_reset_control_bulk_get_exclusive(dev, ARRAY_SIZE(lvds->dsi_resets),
+						    lvds->dsi_resets);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get rst/arst resets\n");
+
+	ret = reset_control_bulk_assert(ARRAY_SIZE(lvds->dsi_resets), lvds->dsi_resets);
+	if (ret < 0)
+		return ret;
+
+	ret = devm_drm_bridge_add(dev, &lvds->bridge);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to register drm bridge\n");
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

