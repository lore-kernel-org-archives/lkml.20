Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2C1566C44;
	Thu, 17 Sep 2026 14:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789653658; cv=none; b=U+oV+uOBcKPJC+7ykWQZvuAG/5XJ9SmetxrIYRo5S06vch18vz7R5GvD/r8bEmTqULqgaCSPoLkrwKzuS8qP/6eVkmSAudKBFJZor97b7p5wGvmVH6ocrrP5fKewtyRMNeKEozCRZmMox9toHSbDJXQkLxXJ94flSyoDlEMgzfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789653658; c=relaxed/simple;
	bh=Nxn3UfogLVPnBjUzPTCMjqm6Wq4HeD4QSjMTq+sxU5E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UA586R5UirVBeOHcB/dvPMJp8RbHsEMFHJksE3pUf9uQTvBO9IDgbTKMdGZOA9cySLGtQxiR/wUX2WnUBARl0oTxCaUkNPhFliXdfsuMceMmYfF4nLae+iDFYnDquGSHhm3ERUyxgOKrYEwcqvxauNym0ecEVJiJxqzjApGc2Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=z2m1W13s; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="z2m1W13s"
Received: from francesco-nb.. (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id 0A6ED2282D;
	Thu, 17 Sep 2026 16:00:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789653653;
	bh=cb96GaT2UcuRzLPsQMdrt7Itu40lc0yhplAWhST9MqE=; h=From:To:Subject;
	b=z2m1W13s7Y6oMflIZChFD/KvG8EczvC2rz9nJfoih/euCjY18Ddw2TBJ9KGoEXE33
	 zSK8VQc68LcHCwoPHt8Vl4TnCBXYKvmQnbsRw9zR6J5aM0XY5OnSYuO773kDq9w0dq
	 LUEbIhVT31x5xDCoZKVXG8TXjPpDfRWFV7V+ziwyRrltANiopvfxxitY8DYn6jysdl
	 xRT00OymGIf/C2F1m9hsIGhR72y9E+Mp7tREsb6RU4/Fn41uXRKu0RPoaurA441yFO
	 b8/B1TekyGjulIq/FLfYVogjusPeyJkejQAECSdSupQYAaTXhShCWGrjaupDOCRHPR
	 yesFXZWaTRX2g==
From: Francesco Dolcini <francesco@dolcini.it>
To: Marek Vasut <marex@denx.de>,
	Stefan Agner <stefan@agner.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH v5 2/4] drm: mxsfb: Add optional DPI output bus-width configuration
Date: Thu, 17 Sep 2026 16:00:37 +0200
Message-ID: <20260917140042.118181-3-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917140042.118181-1-francesco@dolcini.it>
References: <20260917140042.118181-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

LCDIF programs LCD_DATABUS_WIDTH from the selected media bus format. The
format reported by the downstream panel or bridge describes the display
input, but it does not describe how the LCDIF data pins are physically
wired on the board.

These can differ. For example, a 16-bit LCDIF bus can be connected to a
24-bit display by wiring the available color bits to the corresponding
display inputs. In that case, using the display's 24-bit format to
configure LCDIF selects the wrong data-bus mode and changes the assignment
of color bits on the LCD_DATA pins.

Read the optional bus-width endpoint property from the LCDIF output port
and use it to select the media bus format used to configure LCDIF. This
allows the LCDIF bus mode to describe the physical interface
independently of the downstream display format.

When the property is absent, continue using the format reported by the
downstream display device, preserving the previous behavior. The
devicetree binding restricts bus-width to 16, 18 or 24; any other value
means the devicetree is broken, so fail the probe instead of silently
falling back to the previous behavior.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
v5: fail probe on invalid bus-width instead of falling back to the
    previous behavior; factor the property parsing into its own
    mxsfb_of_bus_fmt() helper. Drop the r-b/t-b tags below since they
    were given for the previous silent-fallback behavior and for a
    different code shape; needs re-review.
v4: add r-b and t-b tags
v3: improve commit message and make it clear that the code assumes that
    the DT is correct, when the DT contains an invalid property value,
    the code safely fall-back to the previous behavior
v2: use the common bus-width property instead of the legacy interface-pix-fmt

Dropped for v5:
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # TQMa6UL[L]x
---
 drivers/gpu/drm/mxsfb/mxsfb_drv.c | 43 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/mxsfb/mxsfb_drv.h |  2 ++
 drivers/gpu/drm/mxsfb/mxsfb_kms.c | 12 +++++++++
 3 files changed, 57 insertions(+)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index 8b4a500347fb..641691fc92c8 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -12,7 +12,10 @@
 #include <linux/clk.h>
 #include <linux/dma-mapping.h>
 #include <linux/io.h>
+#include <linux/media-bus-format.h>
 #include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/pm_runtime.h>
@@ -207,11 +210,41 @@ static void mxsfb_irq_uninstall(struct drm_device *dev)
 	free_irq(mxsfb->irq, dev);
 }
 
+static int mxsfb_of_bus_fmt(const struct device_node *ep, u32 *bus_format)
+{
+	u32 bus_width;
+	int ret;
+
+	ret = of_property_read_u32(ep, "bus-width", &bus_width);
+	if (ret == -EINVAL)
+		return 0;
+	if (ret)
+		return ret;
+
+	switch (bus_width) {
+	case 16:
+		*bus_format = MEDIA_BUS_FMT_RGB565_1X16;
+		break;
+	case 18:
+		*bus_format = MEDIA_BUS_FMT_RGB666_1X18;
+		break;
+	case 24:
+		*bus_format = MEDIA_BUS_FMT_RGB888_1X24;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int mxsfb_load(struct drm_device *drm,
 		      const struct mxsfb_devdata *devdata)
 {
 	struct platform_device *pdev = to_platform_device(drm->dev);
+	struct device_node *np = pdev->dev.of_node;
 	struct mxsfb_drm_private *mxsfb;
+	struct device_node *ep;
 	int ret;
 
 	mxsfb = devm_kzalloc(&pdev->dev, sizeof(*mxsfb), GFP_KERNEL);
@@ -238,6 +271,16 @@ static int mxsfb_load(struct drm_device *drm,
 	if (IS_ERR(mxsfb->clk_disp_axi))
 		mxsfb->clk_disp_axi = NULL;
 
+	ep = of_graph_get_next_endpoint(np, NULL);
+	if (ep) {
+		ret = mxsfb_of_bus_fmt(ep, &mxsfb->bus_format);
+		of_node_put(ep);
+		if (ret) {
+			dev_err(drm->dev, "Invalid bus-width endpoint property\n");
+			return ret;
+		}
+	}
+
 	ret = dma_set_mask_and_coherent(drm->dev, DMA_BIT_MASK(32));
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.h b/drivers/gpu/drm/mxsfb/mxsfb_drv.h
index d160d921b25f..bdc47ce5be79 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.h
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.h
@@ -46,6 +46,8 @@ struct mxsfb_drm_private {
 	struct drm_connector		*connector;
 	struct drm_bridge		*bridge;
 
+	u32				bus_format;
+
 	bool				crc_active;
 };
 
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
index d8ebebc5314b..1d78c486d147 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
@@ -386,6 +386,18 @@ static void mxsfb_crtc_atomic_enable(struct drm_crtc *crtc,
 	if (!bus_format)
 		bus_format = MEDIA_BUS_FMT_RGB888_1X24;
 
+	/*
+	 * Prefer the bus format derived from the OF graph endpoint "bus-width"
+	 * property when available. Otherwise, use the bus format reported by
+	 * the downstream bridge or panel.
+	 *
+	 * This supports mismatched display and interface bus widths, such as
+	 * a 24-bit panel connected through an 18-bit interface or an 18-bit
+	 * panel connected through a 24-bit interface.
+	 */
+	if (mxsfb->bus_format)
+		bus_format = mxsfb->bus_format;
+
 	mxsfb_crtc_mode_set_nofb(mxsfb, bridge_state, bus_format);
 
 	/* Write cur_buf as well to avoid an initial corrupt frame */
-- 
2.47.3

