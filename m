Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794723092;
	b=nfLR26+IsB52iKZXNBO6AoftEdnBB5pq0PDgyHTtbL/xg/hJrsS5RDiNJXEkLv+5Ek2S
	 B4ngiEvEDcbvcnC7r1ZWxpa1IHQ1rUO43PmqbQwbhRLSG2189VZFI674vJhcZG/XEhQJ4
	 Y1mb5Ic9hmMCGCQm1eZN/hkQURSHPc+Lx/WlnKLwC0Qihfw9VY8s8G50wYr/JnjFn/38w
	 6W3WgzQVGSTGwOEFpY1DYvaDbLkuLkTBpqFI8+07zQrMTW7DjI584+acuVsn8oJLfN19l
	 ZS7GUF0MtYtD+BfODDQ4UKt+G6sOo/4Wm1h4ps0atuz4BGKIntDetEPXKZjSlaG2hHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794723092;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uUl8Gcdr1CjrV+R7vEydrBbKUTZ9VI9y6BS4nuOZ0fM=;
	b=MWmmQ+wzUo/l3y2hv6Hia07gMPYu0W4KUuosqHlbWDoLRHOl/kPIOC2JQ/FFAnjbUtsG
	 LQcbypiPbj/4u8vKTRfMx3o1c7IgfN7LbN9Ua2cMnijGdCWdRCBckD6thf5ra3D61NX7n
	 F6abAE+TPsIYoL06e4lj6rBaCuQRzms6MUrHuQMyM1u9Yiq9m+4M9V35bYeO4zjywvv1P
	 +YIzR/+vF0K9we5IslbRCtuzm4Y8ML96yiDiVngRVNhsxWaM1MLu4i2z489wOBwVzcLae
	 4w2sSJVmPyVi5qxB+gsieZIWwVsFm2h6UjhPvRJ4FI3DI2RZ0obA1T+hXl2JWO2QFsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e8OMuRdx;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B312E606A884
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 06:11:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B312E606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e8OMuRdx
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso14906225e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 22:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794723090; x=1795327890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uUl8Gcdr1CjrV+R7vEydrBbKUTZ9VI9y6BS4nuOZ0fM=;
        b=e8OMuRdxsO90VIvepMuwmYfxwKcJyVlFjlaYmzBgymE1qOkrwMQ6vfLXKCQ4Dok8lx
         bxhAgadDjVs3255/2SrMLq0fxypUOzxvU2KU5qfw8wPG9wMwF7A0B9ymm+rHbfyDiSy9
         Js8FH3N9yQFlEPaklsfDrJn8jBeE9yYfgZnzWV/eS3a4+V7aJQqWqbw03L6INyn4FbCn
         e0CygpjS9xnv9WoZE8uP8CRf8R35RVu87sINjYZQJS/zAva08NDl3WHmWK9XbkMVdjCK
         JoH6rTcfeC2T59i72jizD8KlClhAUXjiEbnhFz7HmLefRMG5UgKrCCPAdetR6muAWQoY
         XCbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794723090; x=1795327890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uUl8Gcdr1CjrV+R7vEydrBbKUTZ9VI9y6BS4nuOZ0fM=;
        b=vmkxYJQ0a514pVdAoKBulHIfD6rBD/c0iRPh9QPmDRuPnSjrZ6ILQUN0neUcy20fxB
         b3ct9d+NM+hnZcGDQqcjtAiHppKPN+CL1ijuRWkfjMztr4FHrTCoQ0oMeL14NORx69cQ
         vTBshcavTOcqpAsx1xy/cpx0mJSYpDPuMLePN+wth73dgDI3rkwOfD7HOMfiXHjn7YyQ
         LlZM1qQbOiyfSYze5G4PHk4qvYG2G/T9fuJZohVUHRKgYGI/f+Q6jDLPgKFuxnjv2TXd
         pB4xQmZTLEgefstv0UuKkbBdQr67785EP5WhwFDyB6Zp4XrSdFX9J2u8as0NxW6zjw7Z
         hAsQ==
X-Forwarded-Encrypted: i=1; AL+hErFjx0SPt+5cAkwF0CQrEkm5TlYe8cyC5s6t5p0nMgE3tCXO83fbDNbNF149XVXqkSYSjru62JvxAiRkh4w=@vger.kernel.org
X-Gm-Message-State: APuU4Z84TTxDTFvsXl0jCKiurvfiCaWyKLjOu+5zv13Hdzw9tsYKaGN9
	nizIcwZkPQ4jhx537lXWCLYxiRo2J1fD0H9vRHJ76Gf4DTdzzQ44QtBx
X-Gm-Gg: AYBFou06iohYqH2aZgBJJT0MV1dXbCm3Vvu+P0qhYbxuji/EmWDj7xPMi+35NMbdL08
	5Cb8miAWYJWdf2dnwB7Kw6X6rMXiLRtMehbSfkaXJj/bIuu1f3LQP//6w86Twg8oJzvLXB1WGdW
	NTHrnfo+nDOeCCNg5VdSp078RLLfpUs2OHkrN65539RjfxUNEvMAYF1JOQRs74Yt1qR3gGXfVDK
	tV3j6prLg5qLtM149aPphi+50tZTrp/E/nGnjCNQCvt/T7/lKppBnTE7XQ6tGDjeDvfzok/VM5D
	rKqSJkJigx8he/zcRguwseV63NdBv5PIJ6f0OMP+YAvClubnSyO9XmFAaw8suOn3Vh71T0TZN9N
	iSCj/dfVpt83PhVgYvzurgAjx02iRbz4gDT9rwMVt7GPJS1KMlYvYr4BV92ibu2kVmpq38THuwQ
	KyWqBxH8QzvgBusU/2Iao7G9cL4gQlSRudlLJ8CI4sTFtBM6taFPwm6caZCwU+G7w9U2tLfS6Cu
	hD5ZX5N/Dv4CjYvdL+ucishh6FiXRu8kzBhgL3SEY60kdp71QvLRzeyz2hOthLjaj2XnWo8EhdR
	GdVJ9LfDt3nZebSjhOEkHW3X/JwT2Wu6AI6ZaL3mI4JDnYE/MSdKwaxpi9CgAFfS/qaya1W6CGs
	LhIsQ57UY0NUqigKENugVlOBFAlrhT7aU8GrUH3ss3j2Jb4gv46XAPwzQTzOTOYYIX9aBPgAXq6
	3tBX6nmOWc0efH+2qWUTq5T7kQJJGHGhQVI7+HPqy/VAep1LJOrY1y2oqckS2YRHlbiE3zxEF8S
	/WUwarHtNP+PQ==
X-Received: by 2002:a05:600c:3f12:b0:4a1:dadf:9876 with SMTP id 5b1f17b1804b1-4bb55a644bfmr147443945e9.23.1794723090126;
        Sat, 14 Nov 2026 22:11:30 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5ba25b50sm139331075e9.14.2026.11.14.22.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 22:11:29 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	sboyd@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v3 6/8] drm/sun4i: Add DE33 shared plane driver
Date: Sun, 15 Nov 2026 07:11:00 +0100
Message-ID: <20261115061102.229680-7-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115061102.229680-1-jernej.skrabec@gmail.com>
References: <20261115061102.229680-1-jernej.skrabec@gmail.com>
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

DE33 makes its plane channels shared resources that mixers select through
routing registers in the display clock block. The existing mixer-local
plane initialization cannot represent that topology.

Add a component that owns the shared plane register space, programs the
default channel-to-mixer mapping and creates each mixer's DRM planes
from that mapping.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/Makefile        |   3 +-
 drivers/gpu/drm/sun4i/sun50i_planes.c | 215 ++++++++++++++++++++++++++
 drivers/gpu/drm/sun4i/sun50i_planes.h |  43 ++++++
 3 files changed, 260 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_planes.c
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_planes.h

diff --git a/drivers/gpu/drm/sun4i/Makefile b/drivers/gpu/drm/sun4i/Makefile
index bad7497a0d11..501e3d867918 100644
--- a/drivers/gpu/drm/sun4i/Makefile
+++ b/drivers/gpu/drm/sun4i/Makefile
@@ -16,7 +16,8 @@ sun8i-drm-hdmi-y		+= sun8i_hdmi_phy_clk.o
 
 sun8i-mixer-y			+= sun8i_mixer.o sun8i_ui_layer.o \
 				   sun8i_vi_layer.o sun8i_ui_scaler.o \
-				   sun8i_vi_scaler.o sun8i_csc.o
+				   sun8i_vi_scaler.o sun8i_csc.o \
+				   sun50i_planes.o
 
 sun4i-tcon-y			+= sun4i_crtc.o
 sun4i-tcon-y			+= sun4i_tcon_dclk.o
diff --git a/drivers/gpu/drm/sun4i/sun50i_planes.c b/drivers/gpu/drm/sun4i/sun50i_planes.c
new file mode 100644
index 000000000000..22b9f104a391
--- /dev/null
+++ b/drivers/gpu/drm/sun4i/sun50i_planes.c
@@ -0,0 +1,215 @@
+// SPDX-License-Identifier: GPL-2.0+
+/* Copyright (c) 2025 Jernej Skrabec <jernej.skrabec@gmail.com> */
+
+#include <drm/drm_device.h>
+
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_graph.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include "sun50i_planes.h"
+#include "sun8i_ui_layer.h"
+#include "sun8i_vi_layer.h"
+
+static const struct sun50i_planes_quirks sun50i_h616_planes_quirks = {
+	.def_map = {
+		{
+			.map = {0, 6, 7},
+			.num_ch = 3,
+		},
+		{
+			.map = {1, 2, 8},
+			.num_ch = 3,
+		},
+	},
+	.cfg = {
+		.de_type	= SUN8I_MIXER_DE33,
+		/*
+		 * TODO: All planes support scaling, but driver needs
+		 * improvements to properly support it.
+		 */
+		.scaler_mask    = 0,
+		.scanline_yuv	= 4096,
+	},
+};
+
+static const struct of_device_id sun50i_planes_of_table[] = {
+	{
+		.compatible = "allwinner,sun50i-h616-de33-planes",
+		.data = &sun50i_h616_planes_quirks
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, sun50i_planes_of_table);
+
+struct drm_plane **
+sun50i_planes_setup(struct device *dev, struct drm_device *drm,
+		    unsigned int mixer)
+{
+	struct sun50i_planes *planes = dev_get_drvdata(dev);
+	const struct sun50i_planes_quirks *quirks;
+	struct drm_plane **drm_planes;
+	const struct default_map *map;
+	unsigned int i;
+
+	if (!of_match_node(sun50i_planes_of_table, dev->of_node)) {
+		dev_err(dev, "Device is not planes driver!\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (!planes) {
+		dev_err(dev, "Planes driver is not loaded yet!\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (mixer > 1) {
+		dev_err(dev, "Mixer index is too high!\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	quirks = planes->quirks;
+	map = &quirks->def_map[mixer];
+
+	drm_planes = devm_kcalloc(drm->dev, map->num_ch + 1,
+				  sizeof(*drm_planes), GFP_KERNEL);
+	if (!drm_planes)
+		return ERR_PTR(-ENOMEM);
+
+	for (i = 0; i < map->num_ch; i++) {
+		unsigned int phy_ch = map->map[i];
+		struct sun8i_layer *layer;
+		enum drm_plane_type type;
+
+		if ((i == 0 && map->num_ch == 1) || i == 1)
+			type = DRM_PLANE_TYPE_PRIMARY;
+		else
+			type = DRM_PLANE_TYPE_OVERLAY;
+
+		if (phy_ch < UI_PLANE_OFFSET)
+			layer = sun8i_vi_layer_init_one(drm, type, planes->regs,
+							i, phy_ch, map->num_ch,
+							&quirks->cfg);
+		else
+			layer = sun8i_ui_layer_init_one(drm, type, planes->regs,
+							i, phy_ch, map->num_ch,
+							&quirks->cfg);
+
+		if (IS_ERR(layer)) {
+			dev_err(drm->dev,
+				"Couldn't initialize DRM plane\n");
+			return ERR_CAST(layer);
+		}
+
+		drm_planes[i] = &layer->plane;
+	}
+
+	return drm_planes;
+}
+
+static void sun50i_planes_init_mapping(struct sun50i_planes *planes)
+{
+	const struct sun50i_planes_quirks *quirks = planes->quirks;
+	unsigned int i, j;
+	u32 mapping;
+
+	mapping = 0;
+	for (j = 0; j < MAX_DISP; j++)
+		for (i = 0; i < quirks->def_map[j].num_ch; i++) {
+			unsigned int ch = quirks->def_map[j].map[i];
+
+			if (ch < UI_PLANE_OFFSET)
+				mapping |= j << (ch * 2);
+			else
+				mapping |= j << ((ch - UI_PLANE_OFFSET) * 2 + 16);
+		}
+	regmap_write(planes->mapping, SUNXI_DE33_DE_CHN2CORE_MUX_REG, mapping);
+
+	for (j = 0; j < MAX_DISP; j++) {
+		mapping = 0;
+		for (i = 0; i < quirks->def_map[j].num_ch; i++) {
+			unsigned int ch = quirks->def_map[j].map[i];
+
+			if (ch >= UI_PLANE_OFFSET)
+				ch += 2;
+
+			mapping |= ch << (i * 4);
+		}
+		regmap_write(planes->mapping, SUNXI_DE33_DE_PORT02CHN_MUX_REG + j * 4, mapping);
+	}
+}
+
+static const struct regmap_config sun50i_planes_regmap_config = {
+	.name		= "planes",
+	.reg_bits	= 32,
+	.val_bits	= 32,
+	.reg_stride	= 4,
+	.max_register	= 0x17fffc,
+};
+
+static int sun50i_planes_probe(struct platform_device *pdev)
+{
+	struct platform_device *clk_pdev;
+	struct device *dev = &pdev->dev;
+	struct sun50i_planes *planes;
+	struct device_node *np;
+	void __iomem *regs;
+
+	planes = devm_kzalloc(dev, sizeof(*planes), GFP_KERNEL);
+	if (!planes)
+		return -ENOMEM;
+
+	planes->quirks = of_device_get_match_data(dev);
+	if (!planes->quirks)
+		return dev_err_probe(dev, -EINVAL, "Unable to get quirks\n");
+
+	np = of_parse_phandle(dev->of_node,
+			      "allwinner,plane-mapping", 0);
+	if (!np)
+		return dev_err_probe(dev, -EINVAL, "Missing mapping phandle\n");
+
+	clk_pdev = of_find_device_by_node(np);
+	of_node_put(np);
+	if (!clk_pdev)
+		return dev_err_probe(dev, -EPROBE_DEFER, "Unable to get mapping\n");
+
+	/* Regmap is registered by display clocks driver during its probe. */
+	planes->mapping = dev_get_regmap(&clk_pdev->dev, NULL);
+	if (!planes->mapping) {
+		platform_device_put(clk_pdev);
+		return dev_err_probe(dev, -EPROBE_DEFER, "Unable to get regmap\n");
+	}
+
+	if (!device_link_add(dev, &clk_pdev->dev,
+			     DL_FLAG_AUTOREMOVE_CONSUMER)) {
+		platform_device_put(clk_pdev);
+		return dev_err_probe(dev, -EINVAL, "Failed to create link\n");
+	}
+	platform_device_put(clk_pdev);
+
+	regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
+
+	planes->regs = devm_regmap_init_mmio(dev, regs, &sun50i_planes_regmap_config);
+	if (IS_ERR(planes->regs))
+		return PTR_ERR(planes->regs);
+
+	sun50i_planes_init_mapping(planes);
+
+	dev_set_drvdata(dev, planes);
+
+	return 0;
+}
+
+struct platform_driver sun50i_planes_platform_driver = {
+	.probe		= sun50i_planes_probe,
+	.driver		= {
+		.name		= "sun50i-planes",
+		.of_match_table	= sun50i_planes_of_table,
+	},
+};
diff --git a/drivers/gpu/drm/sun4i/sun50i_planes.h b/drivers/gpu/drm/sun4i/sun50i_planes.h
new file mode 100644
index 000000000000..7be969491f9c
--- /dev/null
+++ b/drivers/gpu/drm/sun4i/sun50i_planes.h
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/* Copyright (c) 2025 Jernej Skrabec <jernej.skrabec@gmail.com> */
+
+#ifndef _SUN50I_PLANES_H_
+#define _SUN50I_PLANES_H_
+
+#include "sun8i_mixer.h"
+
+/* mapping registers, located in clock register space */
+#define SUNXI_DE33_DE_CHN2CORE_MUX_REG	0x24
+#define SUNXI_DE33_DE_PORT02CHN_MUX_REG	0x28
+#define SUNXI_DE33_DE_PORT12CHN_MUX_REG	0x2c
+
+#define MAX_DISP	2
+#define MAX_CHANNELS	8
+#define UI_PLANE_OFFSET	6
+
+struct regmap;
+struct drm_device;
+
+struct default_map {
+	unsigned int map[MAX_CHANNELS];
+	unsigned int num_ch;
+};
+
+struct sun50i_planes_quirks {
+	struct default_map	def_map[MAX_DISP];
+	struct sun8i_layer_cfg	cfg;
+};
+
+struct sun50i_planes {
+	struct regmap				*regs;
+	struct regmap				*mapping;
+	const struct sun50i_planes_quirks	*quirks;
+};
+
+struct drm_plane **
+sun50i_planes_setup(struct device *dev, struct drm_device *drm,
+		    unsigned int mixer);
+
+extern struct platform_driver sun50i_planes_platform_driver;
+
+#endif /* _SUN50I_PLANES_H_ */
-- 
2.43.0

