Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1648E385535
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 01:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790817313; cv=none; b=Z9Mfuyphy88ZsGFUICmEe1mhG+w/Y9Tl3US2CORPRE6pqDP4GvtPX61xks7qS9Uhx8BDmCitdOWhxSsCQgS0FIcsVGYOjYyTPNEgWi7of2XSbA4VYqaSwWeVV5S4cJAAU0XVqaj6T5vxLbWOdQadK3CfOY5SB4o96UGb4jpTPNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790817313; c=relaxed/simple;
	bh=eTwvcHzDahjPYHCtMEH5hOYZ7IvsD5Sh3bBiNe6fI+U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RK6Y/Oav19oSPwk6xvm1T0nTJ23cX/97deerTDoibUk+JRyXxBe8JH4qBb060LRig/eeyspIwj5ts6AvHcFYtSLQl6PfBN01cz02zR6BabI+YFTnOJg+6LSMTnAlq3gmvYdjXS8M7HuZUWxtSbQ26O7OiRYDoq/KSvI4b2qzdo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=AJGtWScp; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="AJGtWScp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790817303;
	bh=eTwvcHzDahjPYHCtMEH5hOYZ7IvsD5Sh3bBiNe6fI+U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AJGtWScpvXvSKR4IHdG06rCq1VHxF0mP0qOFfXfHwx2YP17Jj43UTtdKcZqIktDz4
	 pNO+5IU8uDFrKcDAzZqC37TcAeyN1pSJgNlHU5HSbJtIHjNGhT5YYZMaDXF0c6BcMR
	 uVGU9Nka+bNChhQmLVCdxef4pNo4GRn8S0B0xy+FWCbWbWQdo2BP0aIH7Y63D6UD98
	 QQuYb12YExyFpDIEn7eDE4YtJLzyQuTMBHBhSUpU0BhqdPcOEn2VVFDpYRAxPDPJbS
	 4K7NsUzoMymyjvBwOabgXvnaZuAUWQxhDIvJOXIIzlBnUcNd5vZpgKvxDqdj/hCkWF
	 MGC2sCL2CxQKg==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5E98417E1088;
	Thu, 01 Oct 2026 03:15:03 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 01 Oct 2026 04:14:39 +0300
Subject: [PATCH 8/8] drm/sun4i: hdmi: Convert to drmm_connector_hdmi_init()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-bridge-advert-hdmi-caps-v1-8-f8806570e243@collabora.com>
References: <20261001-bridge-advert-hdmi-caps-v1-0-f8806570e243@collabora.com>
In-Reply-To: <20261001-bridge-advert-hdmi-caps-v1-0-f8806570e243@collabora.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andy Yan <andy.yan@rock-chips.com>, Liu Ying <victor.liu@nxp.com>, 
 Phong LE <ple@baylibre.com>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.15.2

Switch driver over to the new drmm_connector_hdmi_init() signature and
advertise HDMI 1.2 support.  The vendor, product, supported_formats and
max_bpc values previously passed as arguments are now provided through
struct drm_connector_hdmi_funcs, together with the new
supported_hdmi_ver field.

The HDMI connector helpers infer the 165 MHz TMDS character rate ceiling
from supported_hdmi_ver and reject modes exceeding it before invoking
the driver's .tmds_char_rate_valid() hook.  This makes the explicit mode
clock check in sun4i_hdmi_connector_clock_valid() redundant, so drop it.

No functional change intended.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index d98b6f12a7bc..6f4fe0c8efae 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
@@ -192,10 +192,6 @@ sun4i_hdmi_connector_clock_valid(const struct drm_connector *connector,
 	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
 		return MODE_BAD;
 
-	/* HDMI 1.0 max TMDS character rate */
-	if (clock > HDMI_1_0_TMDS_CHAR_RATE_MAX_HZ)
-		return MODE_CLOCK_HIGH;
-
 	rounded_rate = clk_round_rate(hdmi->tmds_clk, clock);
 	if (rounded_rate > 0 &&
 	    max_t(unsigned long, rounded_rate, clock) -
@@ -253,6 +249,15 @@ static struct i2c_adapter *sun4i_hdmi_get_ddc(struct device *dev)
 }
 
 static const struct drm_connector_hdmi_funcs sun4i_hdmi_hdmi_connector_funcs = {
+	/*
+	 * NOTE: Those are likely to be wrong, but I couldn't find
+	 * the actual ones in the BSP.
+	 */
+	.vendor = "AW",
+	.product = "HDMI",
+	.supported_hdmi_ver = HDMI_VERSION_1_2,
+	.supported_formats = BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444),
+	.max_bpc = 8,
 	.tmds_char_rate_valid	= sun4i_hdmi_connector_clock_valid,
 	.avi = {
 		.clear_infoframe	= sun4i_hdmi_clear_avi_infoframe,
@@ -654,19 +659,11 @@ static int sun4i_hdmi_bind(struct device *dev, struct device *master,
 
 	drm_connector_helper_add(&hdmi->connector,
 				 &sun4i_hdmi_connector_helper_funcs);
-	ret = drmm_connector_hdmi_ini2(drm, &hdmi->connector,
-				       /*
-					* NOTE: Those are likely to be
-					* wrong, but I couldn't find the
-					* actual ones in the BSP.
-					*/
-				       "AW", "HDMI",
+	ret = drmm_connector_hdmi_init(drm, &hdmi->connector,
 				       &sun4i_hdmi_connector_funcs,
 				       &sun4i_hdmi_hdmi_connector_funcs,
 				       DRM_MODE_CONNECTOR_HDMIA,
-				       hdmi->ddc_i2c,
-				       BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444),
-				       8);
+				       hdmi->ddc_i2c);
 	if (ret) {
 		dev_err(dev,
 			"Couldn't initialise the HDMI connector\n");

-- 
2.55.0

