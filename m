Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3E44ED197;
	Mon, 28 Sep 2026 16:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790612204; cv=none; b=bHyyDq7z22/a1uwX+d7rtHLrlizQ6Ol/R5j6zubLr/LzHXIFPsayX2aFLq+ou2hdCuJoAmNruJcsZtFgi/lPvIIVIsx5kkkW5Q5526ZyFHHas/xAwdwMFvilOo6rAtzF9EL/pnW702PgUxouJ8uOoW90qRq1IvfYZQSXwmgTncM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790612204; c=relaxed/simple;
	bh=FzUuUHKGxa/vsonfqC5REgiXsMRueMZ3yo5JvZMxJJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WVllfevKfoN/aFE+naaraWO6BvE9WEC+gQCQ7BRN8rhokHdKnmfR+YZCDAwbb+jBhtrjN1QRKXDyOAaq/ZmuOl8k7xKWsoZsF2Peny8GHlFT7z7Sppyab4gKi/HiflxiLxHVBFgb6oF/xsEwIliu6feZG71FjR1b7htOOT6RAEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fDMPS1BQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fDMPS1BQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53EB91F00898;
	Mon, 28 Sep 2026 16:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790612179;
	bh=v9Tw4ZE1G69hRr4vc52iHnkSsVjNEruzNlhhsAUicUU=;
	h=From:To:Cc:Subject:Date;
	b=fDMPS1BQWnhqBOm5Et2mOCue6qkyeCiAtDwNCfym/yr7KTxRMQsqu0E6hMtOC3G4v
	 zVB5Nk0ppwIjf11h1jlqCVd40xiB83NC/dlmG3Othz+Yj26ZLpuQO/2Vq89ZvGMcPq
	 Elbik/R3zVlKqJUEchfTMLky3ugNbNjwwjfpacNS+vNbyC1jKVoP2AVcB7mBqQ1T0W
	 PyCLWuxlgyWfASyTH/028go6JiMSdTragpnvIFyaPQzWMc6aqPUGpuysKLqr6wkZEn
	 SP2ZljcJ1FqeYd2qX+k2O8HBsNs1d79Q7dVDQ6RHhVwJTg1TqLMZCirKMeXkrqt2mC
	 gaVo0QpwNmSqQ==
From: Arnd Bergmann <arnd@kernel.org>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Sasha Finkelstein <k@chaosmail.tech>,
	Janne Grunau <j@jannau.net>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Manikandan Muralidharan <manikandan.m@microchip.com>,
	Dharma Balasubiramani <dharma.b@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Liu Ying <victor.liu@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Douglas Anderson <dianders@chromium.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Marek Vasut <marex@denx.de>,
	Stefan Agner <stefan@agner.ch>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Jyri Sarha <jyri.sarha@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	dri-devel@lists.freedesktop.org,
	asahi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH] drm/bridge: add missing drm/drm_panel.h inclusions
Date: Mon, 28 Sep 2026 18:04:50 +0200
Message-ID: <20260928161605.2271412-1-arnd@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The devm_drm_of_get_bridge() declaration moved to drm_panel.h, but
not all callers include this, which leads to build failures in
some configurations:

drivers/gpu/drm/imx/lcdc/imx-lcdc.c: In function 'imx_lcdc_probe':
drivers/gpu/drm/imx/lcdc/imx-lcdc.c:404:18: error: implicit declaration of function 'devm_drm_of_get_bridge' [-Wimplicit-function-declaration]
  404 |         bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0, 0);
      |                  ^~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/verisilicon/vs_bridge.c: In function 'vs_bridge_init':
drivers/gpu/drm/verisilicon/vs_bridge.c:306:16: error: implicit declaration of function 'devm_drm_of_get_bridge' [-Wimplicit-function-declaration]
  306 |         next = devm_drm_of_get_bridge(drm_dev->dev, drm_dev->dev->of_node,
      |                ^~~~~~~~~~~~~~~~~~~~~~

Include the new header in all files that need it.

Fixes: aa8a8c7e4641 ("drm/bridge: panel: move all code to drm_panel.c")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/adp/adp_drv.c                    | 1 +
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c | 1 +
 drivers/gpu/drm/bridge/chipone-icn6211.c         | 1 +
 drivers/gpu/drm/bridge/imx/imx-ldb-helper.c      | 1 +
 drivers/gpu/drm/bridge/ite-it6263.c              | 1 +
 drivers/gpu/drm/bridge/microchip-lvds.c          | 1 +
 drivers/gpu/drm/bridge/nwl-dsi.c                 | 1 +
 drivers/gpu/drm/bridge/nxp-ptn3460.c             | 1 +
 drivers/gpu/drm/bridge/parade-ps8622.c           | 1 +
 drivers/gpu/drm/bridge/parade-ps8640.c           | 1 +
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c    | 1 +
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c   | 1 +
 drivers/gpu/drm/bridge/tc358762.c                | 1 +
 drivers/gpu/drm/bridge/tc358764.c                | 1 +
 drivers/gpu/drm/bridge/tc358775.c                | 1 +
 drivers/gpu/drm/bridge/ti-dlpc3433.c             | 1 +
 drivers/gpu/drm/bridge/ti-sn65dsi83.c            | 1 +
 drivers/gpu/drm/bridge/ti-sn65dsi86.c            | 1 +
 drivers/gpu/drm/drm_bridge.c                     | 1 +
 drivers/gpu/drm/imx/ipuv3/imx-ldb.c              | 1 +
 drivers/gpu/drm/imx/ipuv3/parallel-display.c     | 1 +
 drivers/gpu/drm/imx/lcdc/imx-lcdc.c              | 1 +
 drivers/gpu/drm/mediatek/mtk_dpi.c               | 1 +
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c         | 1 +
 drivers/gpu/drm/mxsfb/lcdif_drv.c                | 1 +
 drivers/gpu/drm/sprd/sprd_dsi.c                  | 1 +
 drivers/gpu/drm/tidss/tidss_oldi.c               | 1 +
 drivers/gpu/drm/tilcdc/tilcdc_encoder.c          | 1 +
 drivers/gpu/drm/verisilicon/vs_bridge.c          | 1 +
 29 files changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/adp/adp_drv.c b/drivers/gpu/drm/adp/adp_drv.c
index fdf0e6316175..eb67c6fe9c01 100644
--- a/drivers/gpu/drm/adp/adp_drv.c
+++ b/drivers/gpu/drm/adp/adp_drv.c
@@ -16,6 +16,7 @@
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_of.h>
+#include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
index e8aea905fb10..d16945ebb2f5 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
@@ -15,6 +15,7 @@
 #include <drm/drm_bridge.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_of.h>
+#include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_simple_kms_helper.h>
 
diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
index 4ec50fb63aba..fc4a49b2b246 100644
--- a/drivers/gpu/drm/bridge/chipone-icn6211.c
+++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
@@ -6,6 +6,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_of.h>
+#include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_mipi_dsi.h>
 
diff --git a/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c b/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
index 6149ba141a38..018fedb0162c 100644
--- a/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
+++ b/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
@@ -13,6 +13,7 @@
 
 #include <drm/drm_bridge.h>
 #include <drm/drm_of.h>
+#include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 
 #include "imx-ldb-helper.h"
diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/ite-it6263.c
index 21ac8e58b9d2..12a23bb45c84 100644
--- a/drivers/gpu/drm/bridge/ite-it6263.c
+++ b/drivers/gpu/drm/bridge/ite-it6263.c
@@ -26,6 +26,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_of.h>
+#include <drm/drm_panel.h>
 #include <drm/drm_probe_helper.h>
 
 /* -----------------------------------------------------------------------------
diff --git a/drivers/gpu/drm/bridge/microchip-lvds.c b/drivers/gpu/drm/bridge/microchip-lvds.c
index dd4ffc9f4df3..53291cde0636 100644
--- a/drivers/gpu/drm/bridge/microchip-lvds.c
+++ b/drivers/gpu/drm/bridge/microchip-lvds.c
@@ -24,6 +24,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_of.h>
+#include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
index 09992529f3d8..f7043dcd76cb 100644
--- a/drivers/gpu/drm/bridge/nwl-dsi.c
+++ b/drivers/gpu/drm/bridge/nwl-dsi.c
@@ -27,6 +27,7 @@
 #include <drm/drm_bridge.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
+#include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 
 #include <video/mipi_display.h>
diff --git a/drivers/gpu/drm/bridge/nxp-ptn3460.c b/drivers/gpu/drm/bridge/nxp-ptn3460.c
index f9eff8bfceb7..489704df6145 100644
--- a/drivers/gpu/drm/bridge/nxp-ptn3460.c
+++ b/drivers/gpu/drm/bridge/nxp-ptn3460.c
@@ -15,6 +15,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_of.h>
+#include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
diff --git a/drivers/gpu/drm/bridge/parade-ps8622.c b/drivers/gpu/drm/bridge/parade-ps8622.c
index 3a2ec482037d..ff24aa647028 100644
--- a/drivers/gpu/drm/bridge/parade-ps8622.c
+++ b/drivers/gpu/drm/bridge/parade-ps8622.c
@@ -19,6 +19,7 @@
 #include <drm/drm_bridge.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_of.h>
+#include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
index 56b48f8feab6..425985f2398d 100644
--- a/drivers/gpu/drm/bridge/parade-ps8640.c
+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
@@ -20,6 +20,7 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
+#include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 
 #define PAGE0_AUXCH_CFG3	0x76
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index 5dd475fcaacf..11233d2d7385 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -30,6 +30,7 @@
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_modes.h>
 #include <drm/drm_of.h>
+#include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 
 #define HWVER_131			0x31333100	/* IP version 1.31 */
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c
index c0d89dd767ce..5b4f4c823d48 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c
@@ -24,6 +24,7 @@
 #include <drm/drm_bridge.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
+#include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 
 #define DSI2_PWR_UP			0x000c
diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
index 76564d5e4f69..c9e5bbc5dcd0 100644
--- a/drivers/gpu/drm/bridge/tc358762.c
+++ b/drivers/gpu/drm/bridge/tc358762.c
@@ -23,6 +23,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
+#include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
diff --git a/drivers/gpu/drm/bridge/tc358764.c b/drivers/gpu/drm/bridge/tc358764.c
index 049215e65988..311de8797402 100644
--- a/drivers/gpu/drm/bridge/tc358764.c
+++ b/drivers/gpu/drm/bridge/tc358764.c
@@ -18,6 +18,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
+#include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 
 #define FLD_MASK(start, end)    (((1 << ((start) - (end) + 1)) - 1) << (end))
diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
index 203dc738ecef..e7ea47307a50 100644
--- a/drivers/gpu/drm/bridge/tc358775.c
+++ b/drivers/gpu/drm/bridge/tc358775.c
@@ -26,6 +26,7 @@
 #include <drm/drm_bridge.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
+#include <drm/drm_panel.h>
 #include <drm/drm_probe_helper.h>
 
 #define FLD_VAL(val, start, end) FIELD_PREP(GENMASK(start, end), val)
diff --git a/drivers/gpu/drm/bridge/ti-dlpc3433.c b/drivers/gpu/drm/bridge/ti-dlpc3433.c
index c9f789e30687..21922878e60e 100644
--- a/drivers/gpu/drm/bridge/ti-dlpc3433.c
+++ b/drivers/gpu/drm/bridge/ti-dlpc3433.c
@@ -10,6 +10,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_of.h>
+#include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_mipi_dsi.h>
 
diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index eb5b249cc43c..cc6c4c89d468 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -45,6 +45,7 @@
 #include <drm/drm_bridge_helper.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
+#include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 48b83df9aed6..de16afa99b91 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -32,6 +32,7 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
+#include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index e7f9e6d58927..e50737432071 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -36,6 +36,7 @@
 #include <drm/drm_encoder.h>
 #include <drm/drm_file.h>
 #include <drm/drm_of.h>
+#include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 
 #include "drm_crtc_internal.h"
diff --git a/drivers/gpu/drm/imx/ipuv3/imx-ldb.c b/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
index 63d6a1e7c1bd..317db4d9b898 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-ldb.c
@@ -25,6 +25,7 @@
 #include <drm/drm_bridge_connector.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_of.h>
+#include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
diff --git a/drivers/gpu/drm/imx/ipuv3/parallel-display.c b/drivers/gpu/drm/imx/ipuv3/parallel-display.c
index eb75827394f8..966649bc6dc6 100644
--- a/drivers/gpu/drm/imx/ipuv3/parallel-display.c
+++ b/drivers/gpu/drm/imx/ipuv3/parallel-display.c
@@ -17,6 +17,7 @@
 #include <drm/drm_bridge_connector.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_of.h>
+#include <drm/drm_panel.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 #include <drm/bridge/of-display-mode-bridge.h>
diff --git a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
index c67fe80b8115..cac50a002004 100644
--- a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
+++ b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
@@ -14,6 +14,7 @@
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_of.h>
+#include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 0e4f430de983..b73d76a40c6c 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -27,6 +27,7 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_of.h>
+#include <drm/drm_panel.h>
 
 #include "mtk_ddp_comp.h"
 #include "mtk_disp_drv.h"
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 9b1d1982e683..df5fed30718e 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -8,6 +8,7 @@
 
 #include <drm/drm_bridge.h>
 #include <drm/drm_bridge_connector.h>
+#include <drm/drm_panel.h>
 #include <drm/drm_vblank.h>
 
 #include "msm_drv.h"
diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lcdif_drv.c
index e2173c4d6fc2..ba14b20cb038 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
@@ -27,6 +27,7 @@
 #include <drm/drm_mode_config.h>
 #include <drm/drm_module.h>
 #include <drm/drm_of.h>
+#include <drm/drm_panel.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
diff --git a/drivers/gpu/drm/sprd/sprd_dsi.c b/drivers/gpu/drm/sprd/sprd_dsi.c
index 23b0e1dc547a..260d1682c8a7 100644
--- a/drivers/gpu/drm/sprd/sprd_dsi.c
+++ b/drivers/gpu/drm/sprd/sprd_dsi.c
@@ -12,6 +12,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_of.h>
+#include <drm/drm_panel.h>
 #include <drm/drm_probe_helper.h>
 
 #include "sprd_drm.h"
diff --git a/drivers/gpu/drm/tidss/tidss_oldi.c b/drivers/gpu/drm/tidss/tidss_oldi.c
index 5eb749f495d5..7e77b4af36d0 100644
--- a/drivers/gpu/drm/tidss/tidss_oldi.c
+++ b/drivers/gpu/drm/tidss/tidss_oldi.c
@@ -15,6 +15,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_of.h>
+#include <drm/drm_panel.h>
 
 #include "tidss_dispc.h"
 #include "tidss_dispc_regs.h"
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_encoder.c b/drivers/gpu/drm/tilcdc/tilcdc_encoder.c
index ac4b5beb2dd5..5fb0e8e1e829 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_encoder.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_encoder.c
@@ -10,6 +10,7 @@
 #include <drm/drm_bridge.h>
 #include <drm/drm_bridge_connector.h>
 #include <drm/drm_of.h>
+#include <drm/drm_panel.h>
 #include <drm/drm_simple_kms_helper.h>
 
 #include "tilcdc_drv.h"
diff --git a/drivers/gpu/drm/verisilicon/vs_bridge.c b/drivers/gpu/drm/verisilicon/vs_bridge.c
index dc7c85b07fe3..586f1bd7d7b5 100644
--- a/drivers/gpu/drm/verisilicon/vs_bridge.c
+++ b/drivers/gpu/drm/verisilicon/vs_bridge.c
@@ -15,6 +15,7 @@
 #include <drm/drm_connector.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_of.h>
+#include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_simple_kms_helper.h>
 
-- 
2.53.0

