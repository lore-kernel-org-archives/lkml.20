Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794723095;
	b=cqcOlXQ9BZFyMI0JmXT+Sr+cld6CNspyyR+uUrP+cbC6OqXE0FsJJ8CePsDLiP6qae3t
	 pO2Qv7wXEl8gvYrR1DNVhORRlg8mA9pNJbbP/7gz8he7dzPVVp/9L3KIkDGBTReUcguZD
	 Fk1eYS7DU9z51qKHQ7WUZpTHI0D1siJkdBTsFInI0RsrDklp3uP3VCgk20RIZ23qPOtnF
	 WfS8J0M6VVzyOrxGsfrGCKUBPnu0enlQ+sT+P3zwuFkDhWAEHxxLVy3D7042ZheO1B2n0
	 TyXjjhdVLWjy/U7brYaPL1D7CjkTS41UjDmzFdkOZiQnG2sv55iTFBHpI463he8b9QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794723095;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ayDMTTMPUnbU0/9genv/8tGKtRMC0522kzpCRXhOspw=;
	b=M7TwqGKZRjQK//cMtBNM9C8JJZGuVXMj6jRCldhSATqhdmH8weNZxUjC5mT0uiTIs6N6
	 pJTW4acxvC/XEBYkXesdae6bfB+rHGdPgYV+J6i9VRvFd4lc451e87sPFFdJbukp6YkYt
	 IwxNTbS27rQHBVc3pyge6fefm8iJYfGOnPzGT2hnv0nKy33zuQqatn1aYC2OYJF0QvISu
	 qV1JrT+mXBXZGM7DbrZl0xj4HfeXpD62B+xh4RyF7kfux1ANop/LP+nyXuC4EvRKS5LsP
	 0vU0y/u2ckU1upsScVXoB4Vo5qUqDKPE4Hk9ZVTxUri605u7zIVIDlW+ZQHUGwVTUgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gyyrjuYM;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFBC60A2634
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 06:11:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CFBC60A2634
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gyyrjuYM
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49d05d51553so12305265e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 22:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794723094; x=1795327894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ayDMTTMPUnbU0/9genv/8tGKtRMC0522kzpCRXhOspw=;
        b=gyyrjuYM00XtjEVuSthILzrIIwBkC6n3ekKeIkg5QbxmT9IJDFR3lb8PsK+y2T0FDv
         GjqBi8ELHq/+zpS7z3hJV5r+eL9Ypmn1c2cQ6H8MX9Iai1pk/HkpgGE4V/oE9L0L8ZsI
         1uwWlon+TgpJc6veSioO/s1zonDZkV8ZmJjKNbTGE+wMWaaRWyfLb9IfczPRLFiC/voA
         dMDtWFNrJuLEvwyF+UhbbS8BosSmapg/eglr8SvJXZYpoUm6qGW/k4C056oanzUSRVrg
         5Vd/nVxsjUAl/fOs4qutppB9Xk6Abp1GHtjWucFDexlfuKN+QsyzuQzbPEXx0dUY5F3e
         rAeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794723094; x=1795327894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ayDMTTMPUnbU0/9genv/8tGKtRMC0522kzpCRXhOspw=;
        b=FBO6kS2FuokiFws56izHa73cZhz1mQ3WzGg+r/Mcdd+2+WbvHZSeGM11QQMHUZJsV0
         PoMkS7dYk7QXCOWkt5QYxfzW0+IByIoYl2pb3WgenFZ1yywhC5XQyXgPx+aNL1r7EyDf
         1TO0N8NVZ576bSJ1nBuMITN2iBeVAb79o/YlONTfsEjbk6VTJcYgHLubTLilx47acr8G
         Z3VBzqQx59N99QawbBJT3r2Cuop91LUTo8Wzj1wzhbQ4eRUa4SLmJD1EFSU0KAfYIXrL
         ZBlmsmBo+At76Y034rfYsjuAJbJTqeNynRh5UbK5U/l7iJ+086VV+/SpHNWPwKZQiHdj
         RreQ==
X-Forwarded-Encrypted: i=1; AL+hErGEsydRnmYmWkDD3gWDDDFwNfafPzkTvLEP+vaBLml+Z8ZQeDk8xLjLCZDs6fhKHUmdflV5EaiPNdbB52g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DpVPWlo7Mnn9d9PspGFw4s8qdyFya6b5FcecUbfgcj+Vd17/Y
	jI8SAY2S/ktNKsdDY2uj7v7nmkC0JrLd9cGKmR2F20FUpF6foyPrsYXqKkBg2sI8
X-Gm-Gg: AYBFou2aasLbEnPpoql/t/+thEBGAls/2EyGbfVWR3hceCBCslzNWDDN+dwz087RVfY
	f43FVAeWfFdf/JhcP5jjgHGrvHNHcmV7X5B0+4cA88x5ytIa6yGOVrmbnxl+SCJxEONYIZ/p22/
	ScZL6S+5G2LyvSGn9sJC00AxHRcEVyLb4THbEkQYVfwvyx90SH10E6HrGPnZK9drplngRZ/AkWD
	BOtryPJfQxcNT6Pqv3tgvky0H6iSy6uYBVm7Y2Bd5X+eyd/r7S6Um4fqqq/9jg9D6hv/I/2aH7j
	VMdw+Nw8L+E6K6t0KDck4JVwtaBCvPeNyvu0w9zcVWELWxsmncj/3FL3u9dkBiOCAg4sUMC4gxB
	ERY6gD6gSXtqJ67JRXaNnX8bRtAQkYCFaSbLi8ZpuoPl2JBC/LCXN+GhAxj9ehGt1Zelo59+vEq
	vx8cI6z59K6SJtcr+MFlILHneLsUhi7FZ30NXHKv8hEpnkw1UBBt8EN+e/0HerZuAHwS+y/jV7Z
	63ly/gaPC4ldqKZoGzfNHKWc0Xs/OSsX3qGFNAl4RzVoimusjgGxLkyX8KtftTkfyxo9Xje/YPd
	GmFnfGCsf/x6nvAwsLR1LbKmpZhedjZYD7YqGHBc4l4BlkeqjTjJhyhQrsuEZS50lrQBNBUBUeT
	1r/qx77Jdi+69KDD+GYz1XTt/j4Ob0oeizeKeTdP/3ruajP0GODwqi9qfe6GfQic1rOBvNQnDIQ
	FNaELtNQ9Ri5XxR0u6l1iQ7YrB+C3Us8KxR1/YzbnQ7MBZFM7BGysrrcS/6uNH5Dv2ZfA71SKbc
	tS9tUFJqI5zMA==
X-Received: by 2002:a05:600c:6994:b0:4bb:647d:dabe with SMTP id 5b1f17b1804b1-4bb647ddc1bmr70178025e9.3.1794723093722;
        Sat, 14 Nov 2026 22:11:33 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5ba25b50sm139331075e9.14.2026.11.14.22.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 22:11:32 -0800 (PST)
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
Subject: [PATCH v3 8/8] drm/sun4i: Switch DE33 to split plane bindings
Date: Sun, 15 Nov 2026 07:11:02 +0100
Message-ID: <20261115061102.229680-9-jernej.skrabec@gmail.com>
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

The shared plane driver and split register resources are now in place.
Switch DE33 mixer discovery to the new bindings and remove the legacy
per-mixer plane setup. Mixer register space now covers only display
blending control, so limit its regmap accordingly.

The old DE33 binding is not supported anymore, since it can't describe
shared planes and was never used by any device tree. If it's detected,
print an error asking the user to update the device tree, instead of
failing silently or misusing the plane register space as blender
registers.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c | 195 ++++++++++++++++++++--------
 drivers/gpu/drm/sun4i/sun8i_mixer.h |  10 +-
 2 files changed, 140 insertions(+), 65 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index dbde80b32080..0970be6aa035 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -13,6 +13,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/of_graph.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
 
@@ -25,6 +26,7 @@
 #include <drm/drm_probe_helper.h>
 
 #include "sun4i_drv.h"
+#include "sun50i_planes.h"
 #include "sun8i_mixer.h"
 #include "sun8i_ui_layer.h"
 #include "sun8i_vi_layer.h"
@@ -257,7 +259,6 @@ static void sun8i_mixer_commit(struct sunxi_engine *engine,
 {
 	struct sun8i_mixer *mixer = engine_to_sun8i_mixer(engine);
 	u32 bld_base = sun8i_blender_base(mixer);
-	struct regmap *bld_regs = sun8i_blender_regmap(mixer);
 	struct drm_plane_state *plane_state;
 	struct drm_plane *plane;
 	u32 route = 0, pipe_en = 0;
@@ -294,16 +295,16 @@ static void sun8i_mixer_commit(struct sunxi_engine *engine,
 		route |= layer->index << SUN8I_MIXER_BLEND_ROUTE_PIPE_SHIFT(zpos);
 		pipe_en |= SUN8I_MIXER_BLEND_PIPE_CTL_EN(zpos);
 
-		regmap_write(bld_regs,
+		regmap_write(engine->regs,
 			     SUN8I_MIXER_BLEND_ATTR_COORD(bld_base, zpos),
 			     SUN8I_MIXER_COORD(x, y));
-		regmap_write(bld_regs,
+		regmap_write(engine->regs,
 			     SUN8I_MIXER_BLEND_ATTR_INSIZE(bld_base, zpos),
 			     SUN8I_MIXER_SIZE(w, h));
 	}
 
-	regmap_write(bld_regs, SUN8I_MIXER_BLEND_ROUTE(bld_base), route);
-	regmap_write(bld_regs, SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
+	regmap_write(engine->regs, SUN8I_MIXER_BLEND_ROUTE(bld_base), route);
+	regmap_write(engine->regs, SUN8I_MIXER_BLEND_PIPE_CTL(bld_base),
 		     pipe_en | SUN8I_MIXER_BLEND_PIPE_CTL_FC_EN(0));
 
 	if (mixer->cfg->de_type != SUN8I_MIXER_DE33)
@@ -318,7 +319,6 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 	struct sun8i_mixer *mixer = engine_to_sun8i_mixer(engine);
 	int plane_cnt = mixer->cfg->ui_num + mixer->cfg->vi_num;
 	enum drm_plane_type type;
-	unsigned int phy_index;
 	int i;
 
 	planes = devm_kzalloc_objs(drm->dev, *planes, plane_cnt + 1);
@@ -333,12 +333,8 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 		else
 			type = DRM_PLANE_TYPE_OVERLAY;
 
-		phy_index = i;
-		if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
-			phy_index = mixer->cfg->map[i];
-
 		layer = sun8i_vi_layer_init_one(drm, type, mixer->engine.regs,
-						i, phy_index, plane_cnt,
+						i, i, plane_cnt,
 						&mixer->cfg->lay_cfg);
 		if (IS_ERR(layer)) {
 			dev_err(drm->dev,
@@ -358,12 +354,8 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 		else
 			type = DRM_PLANE_TYPE_OVERLAY;
 
-		phy_index = index;
-		if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
-			phy_index = mixer->cfg->map[index];
-
 		layer = sun8i_ui_layer_init_one(drm, type, mixer->engine.regs,
-						index, phy_index, plane_cnt,
+						index, index, plane_cnt,
 						&mixer->cfg->lay_cfg);
 		if (IS_ERR(layer)) {
 			dev_err(drm->dev, "Couldn't initialize %s plane\n",
@@ -377,16 +369,34 @@ static struct drm_plane **sun8i_layers_init(struct drm_device *drm,
 	return planes;
 }
 
+static struct drm_plane **sun50i_layers_init(struct drm_device *drm,
+					     struct sunxi_engine *engine)
+{
+	struct sun8i_mixer *mixer = engine_to_sun8i_mixer(engine);
+	unsigned int base = sun8i_blender_base(mixer);
+	struct drm_plane **planes;
+	int i;
+
+	planes = sun50i_planes_setup(mixer->planes_dev, drm, engine->id);
+	if (IS_ERR(planes))
+		return planes;
+
+	for (i = 0; planes[i]; i++)
+		regmap_write(engine->regs,
+			     SUN8I_MIXER_BLEND_MODE(base, i),
+			     SUN8I_MIXER_BLEND_MODE_DEF);
+
+	return planes;
+}
+
 static void sun8i_mixer_mode_set(struct sunxi_engine *engine,
 				 const struct drm_display_mode *mode)
 {
 	struct sun8i_mixer *mixer = engine_to_sun8i_mixer(engine);
-	struct regmap *bld_regs;
 	u32 bld_base, size, val;
 	bool interlaced;
 
 	bld_base = sun8i_blender_base(mixer);
-	bld_regs = sun8i_blender_regmap(mixer);
 	interlaced = !!(mode->flags & DRM_MODE_FLAG_INTERLACE);
 	size = SUN8I_MIXER_SIZE(mode->hdisplay, mode->vdisplay);
 
@@ -398,14 +408,14 @@ static void sun8i_mixer_mode_set(struct sunxi_engine *engine,
 	else
 		regmap_write(mixer->engine.regs, SUN8I_MIXER_GLOBAL_SIZE, size);
 
-	regmap_write(bld_regs, SUN8I_MIXER_BLEND_OUTSIZE(bld_base), size);
+	regmap_write(engine->regs, SUN8I_MIXER_BLEND_OUTSIZE(bld_base), size);
 
 	if (interlaced)
 		val = SUN8I_MIXER_BLEND_OUTCTL_INTERLACED;
 	else
 		val = 0;
 
-	regmap_update_bits(bld_regs, SUN8I_MIXER_BLEND_OUTCTL(bld_base),
+	regmap_update_bits(engine->regs, SUN8I_MIXER_BLEND_OUTCTL(bld_base),
 			   SUN8I_MIXER_BLEND_OUTCTL_INTERLACED, val);
 
 	DRM_DEBUG_DRIVER("Switching display mixer interlaced mode %s\n",
@@ -418,6 +428,12 @@ static const struct sunxi_engine_ops sun8i_engine_ops = {
 	.mode_set	= sun8i_mixer_mode_set,
 };
 
+static const struct sunxi_engine_ops sun50i_engine_ops = {
+	.commit		= sun8i_mixer_commit,
+	.layers_init	= sun50i_layers_init,
+	.mode_set	= sun8i_mixer_mode_set,
+};
+
 static const struct regmap_config sun8i_mixer_regmap_config = {
 	.name		= "layers",
 	.reg_bits	= 32,
@@ -434,12 +450,12 @@ static const struct regmap_config sun8i_top_regmap_config = {
 	.max_register	= 0x3c,
 };
 
-static const struct regmap_config sun8i_disp_regmap_config = {
+static const struct regmap_config sun50i_mixer33_regmap_config = {
 	.name		= "display",
 	.reg_bits	= 32,
 	.val_bits	= 32,
 	.reg_stride	= 4,
-	.max_register	= 0x20000,
+	.max_register	= 0x1fffc,
 };
 
 static int sun8i_mixer_of_get_id(struct device_node *node)
@@ -464,17 +480,14 @@ static int sun8i_mixer_of_get_id(struct device_node *node)
 
 static void sun8i_mixer_init(struct sun8i_mixer *mixer)
 {
-	struct regmap *top_regs, *disp_regs;
 	unsigned int base = sun8i_blender_base(mixer);
+	struct regmap *top_regs;
 	int plane_cnt, i;
 
-	if (mixer->cfg->de_type == SUN8I_MIXER_DE33) {
+	if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
 		top_regs = mixer->top_regs;
-		disp_regs = mixer->disp_regs;
-	} else {
+	else
 		top_regs = mixer->engine.regs;
-		disp_regs = mixer->engine.regs;
-	}
 
 	/* Enable the mixer */
 	regmap_write(top_regs, SUN8I_MIXER_GLOBAL_CTL,
@@ -484,25 +497,29 @@ static void sun8i_mixer_init(struct sun8i_mixer *mixer)
 		regmap_write(top_regs, SUN50I_MIXER_GLOBAL_CLK, 1);
 
 	/* Set background color to black */
-	regmap_write(disp_regs, SUN8I_MIXER_BLEND_BKCOLOR(base),
+	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_BKCOLOR(base),
 		     SUN8I_MIXER_BLEND_COLOR_BLACK);
 
 	/*
 	 * Set fill color of bottom plane to black. Generally not needed
 	 * except when VI plane is at bottom (zpos = 0) and enabled.
 	 */
-	regmap_write(disp_regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
+	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
 		     SUN8I_MIXER_BLEND_PIPE_CTL_FC_EN(0));
-	regmap_write(disp_regs, SUN8I_MIXER_BLEND_ATTR_FCOLOR(base, 0),
+	regmap_write(mixer->engine.regs, SUN8I_MIXER_BLEND_ATTR_FCOLOR(base, 0),
 		     SUN8I_MIXER_BLEND_COLOR_BLACK);
 
+	/*
+	 * plane_cnt is 0 for DE33. Blend mode will be initialized in
+	 * layer init function, where the number of planes is known.
+	 */
 	plane_cnt = mixer->cfg->vi_num + mixer->cfg->ui_num;
 	for (i = 0; i < plane_cnt; i++)
-		regmap_write(disp_regs,
+		regmap_write(mixer->engine.regs,
 			     SUN8I_MIXER_BLEND_MODE(base, i),
 			     SUN8I_MIXER_BLEND_MODE_DEF);
 
-	regmap_update_bits(disp_regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
+	regmap_update_bits(mixer->engine.regs, SUN8I_MIXER_BLEND_PIPE_CTL(base),
 			   SUN8I_MIXER_BLEND_PIPE_CTL_EN_MSK, 0);
 }
 
@@ -533,7 +550,6 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 	if (!mixer)
 		return -ENOMEM;
 	dev_set_drvdata(dev, mixer);
-	mixer->engine.ops = &sun8i_engine_ops;
 	mixer->engine.node = dev->of_node;
 
 	/*
@@ -566,12 +582,34 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 	if (!mixer->cfg)
 		return -EINVAL;
 
+	if (mixer->cfg->de_type == SUN8I_MIXER_DE33) {
+		/*
+		 * The original DE33 binding described planes as part of
+		 * the mixer, which can't work with more than one mixer.
+		 * It was never used by any device tree, so it's not
+		 * supported.
+		 */
+		if (of_property_match_string(dev->of_node, "reg-names",
+					     "layers") >= 0 ||
+		    !of_property_present(dev->of_node, "allwinner,planes"))
+			return dev_err_probe(dev, -EINVAL,
+					     "Unsupported DE33 mixer binding, please update the device tree\n");
+
+		mixer->engine.ops = &sun50i_engine_ops;
+	} else {
+		mixer->engine.ops = &sun8i_engine_ops;
+	}
+
 	regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
 
-	mixer->engine.regs = devm_regmap_init_mmio(dev, regs,
-						   &sun8i_mixer_regmap_config);
+	if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
+		mixer->engine.regs = devm_regmap_init_mmio(dev, regs,
+							   &sun50i_mixer33_regmap_config);
+	else
+		mixer->engine.regs = devm_regmap_init_mmio(dev, regs,
+							   &sun8i_mixer_regmap_config);
 	if (IS_ERR(mixer->engine.regs)) {
 		dev_err(dev, "Couldn't create the mixer regmap\n");
 		return PTR_ERR(mixer->engine.regs);
@@ -588,17 +626,6 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 			dev_err(dev, "Couldn't create the top regmap\n");
 			return PTR_ERR(mixer->top_regs);
 		}
-
-		regs = devm_platform_ioremap_resource_byname(pdev, "display");
-		if (IS_ERR(regs))
-			return PTR_ERR(regs);
-
-		mixer->disp_regs = devm_regmap_init_mmio(dev, regs,
-							 &sun8i_disp_regmap_config);
-		if (IS_ERR(mixer->disp_regs)) {
-			dev_err(dev, "Couldn't create the disp regmap\n");
-			return PTR_ERR(mixer->disp_regs);
-		}
 	}
 
 	mixer->reset = devm_reset_control_get(dev, NULL);
@@ -638,6 +665,40 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 
 	clk_prepare_enable(mixer->mod_clk);
 
+	if (mixer->cfg->de_type == SUN8I_MIXER_DE33) {
+		struct platform_device *pdev;
+		struct device_link *link;
+		struct device_node *np;
+		void *data;
+
+		np = of_parse_phandle(dev->of_node, "allwinner,planes", 0);
+		if (!np) {
+			ret = -ENODEV;
+			goto err_disable_mod_clk;
+		}
+
+		pdev = of_find_device_by_node(np);
+		of_node_put(np);
+		if (!pdev) {
+			ret = -EPROBE_DEFER;
+			goto err_disable_mod_clk;
+		}
+		mixer->planes_dev = &pdev->dev;
+
+		data = platform_get_drvdata(pdev);
+		if (!data) {
+			ret = -EPROBE_DEFER;
+			goto err_put_device;
+		}
+
+		link = device_link_add(dev, &pdev->dev,
+				       DL_FLAG_AUTOREMOVE_CONSUMER);
+		if (!link) {
+			ret = -EINVAL;
+			goto err_put_device;
+		}
+	}
+
 	list_add_tail(&mixer->engine.list, &drv->engine_list);
 
 	/* Reset registers and disable unused sub-engines */
@@ -672,6 +733,10 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 
 	return 0;
 
+err_put_device:
+	put_device(mixer->planes_dev);
+err_disable_mod_clk:
+	clk_disable_unprepare(mixer->mod_clk);
 err_disable_bus_clk:
 	clk_disable_unprepare(mixer->bus_clk);
 err_assert_reset:
@@ -686,6 +751,9 @@ static void sun8i_mixer_unbind(struct device *dev, struct device *master,
 
 	list_del(&mixer->engine.list);
 
+	if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
+		put_device(mixer->planes_dev);
+
 	clk_disable_unprepare(mixer->mod_clk);
 	clk_disable_unprepare(mixer->bus_clk);
 	reset_control_assert(mixer->reset);
@@ -867,16 +935,8 @@ static const struct sun8i_mixer_cfg sun50i_h6_mixer0_cfg = {
 };
 
 static const struct sun8i_mixer_cfg sun50i_h616_mixer0_cfg = {
-	.lay_cfg = {
-		.de_type	= SUN8I_MIXER_DE33,
-		.scaler_mask	= 0xf,
-		.scanline_yuv	= 4096,
-	},
 	.de_type	= SUN8I_MIXER_DE33,
 	.mod_rate	= 600000000,
-	.ui_num		= 3,
-	.vi_num		= 1,
-	.map		= {0, 6, 7, 8},
 };
 
 static const struct of_device_id sun8i_mixer_of_table[] = {
@@ -940,7 +1000,30 @@ static struct platform_driver sun8i_mixer_platform_driver = {
 		.of_match_table	= sun8i_mixer_of_table,
 	},
 };
-module_platform_driver(sun8i_mixer_platform_driver);
+
+static int __init sun8i_mixer_module_init(void)
+{
+	int ret;
+
+	ret = platform_driver_register(&sun50i_planes_platform_driver);
+	if (ret)
+		return ret;
+
+	ret = platform_driver_register(&sun8i_mixer_platform_driver);
+	if (ret)
+		platform_driver_unregister(&sun50i_planes_platform_driver);
+
+	return ret;
+}
+
+static void __exit sun8i_mixer_module_exit(void)
+{
+	platform_driver_unregister(&sun8i_mixer_platform_driver);
+	platform_driver_unregister(&sun50i_planes_platform_driver);
+}
+
+module_init(sun8i_mixer_module_init);
+module_exit(sun8i_mixer_module_exit);
 
 MODULE_AUTHOR("Icenowy Zheng <icenowy@aosc.io>");
 MODULE_DESCRIPTION("Allwinner DE2 Mixer driver");
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index e2f83301aae8..7abc88c898d9 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -202,7 +202,6 @@ struct sun8i_mixer_cfg {
 	int			ui_num;
 	unsigned int		de_type;
 	unsigned long		mod_rate;
-	unsigned int		map[6];
 };
 
 struct sun8i_mixer {
@@ -216,7 +215,7 @@ struct sun8i_mixer {
 	struct clk			*mod_clk;
 
 	struct regmap			*top_regs;
-	struct regmap			*disp_regs;
+	struct device			*planes_dev;
 };
 
 enum {
@@ -252,13 +251,6 @@ sun8i_blender_base(struct sun8i_mixer *mixer)
 	return mixer->cfg->de_type == SUN8I_MIXER_DE3 ? DE3_BLD_BASE : DE2_BLD_BASE;
 }
 
-static inline struct regmap *
-sun8i_blender_regmap(struct sun8i_mixer *mixer)
-{
-	return mixer->cfg->de_type == SUN8I_MIXER_DE33 ?
-		mixer->disp_regs : mixer->engine.regs;
-}
-
 static inline u32
 sun8i_channel_base(struct sun8i_layer *layer)
 {
-- 
2.43.0

