Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FA53148A7
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 01:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790817310; cv=none; b=CUhi8U4BfNxPb2h/4gGKv3Y8qfEsJDl8ypuUEBokhV8QjoB14DzLQeH/HcIW3XvNPPLNjfsyxKgtJI9nCeZ4oYnHNdFPozlDEoCZi5jaEbdfusbmtvZcHsd+0r2J+AEGMTHrKuxqrL/ugqGCIJSDJuDgw2IntEcaU5Fk87ejJzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790817310; c=relaxed/simple;
	bh=DEEzMm0DwPTts9fJeyzr6Lx1Y2WK+fUg+sFyVp/OT1c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cG1brfish2anlQNYy1WIn1k47/KfHwBqVSYYnyZexmxqeJOeh6sks7rxjhWAlMUaodsoegL9Bg/K5LPBXE8mnMj49jAhOUuw9FTJVGOPYr/MttaBJ3Nd3BQcOuq0C+So9byf6GskZMlyMV0oSBJHZP2YQgJVh0Qux70Mg1QBJF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ET6VP+Ka; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ET6VP+Ka"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790817301;
	bh=DEEzMm0DwPTts9fJeyzr6Lx1Y2WK+fUg+sFyVp/OT1c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ET6VP+KaNxBQUMXdZD3eI8AfdajsgY6lxW8ghuT7/l/wwq5bjkuFxKB+8bzUKnA6n
	 97G9PHKvIHDpmXk3YjY5Dp6QZs1Sa0LqO0zYzGoS1cPGhvZlF4pkGKegir7ttj0vmj
	 AL4a/kGbezAyB3LmBu+ndbAQwpwrZtlqC32ixTac5/vbSHxv1NUkfs2C0CzN5ax4cd
	 1qJvL8f75wvk/l9KYM+7PIO/wQoon7wvo8UdcqNAd3YHdvVzx3fS6nJMJucHoKjITK
	 qgWHHk4WyXwAwjhQGt+MFlsR0WDPko8P7HJrrkJyFKN0N+eFTUuPQWntcBoo3aK963
	 yQ3cO/UNrcHow==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4DFE417E0D3B;
	Thu, 01 Oct 2026 03:15:01 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 01 Oct 2026 04:14:36 +0300
Subject: [PATCH 5/8] drm/bridge: ite-it66121: Advertise HDMI 1.2
 capabilities
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-bridge-advert-hdmi-caps-v1-5-f8806570e243@collabora.com>
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

Bridges using DRM_BRIDGE_OP_HDMI are now expected to also provide a
supported HDMI version.  This is not yet enforced, but will become
mandatory once the migration to the new caps-based HDMI connector
initialization API is completed.

Since none of the chip variants handled by the driver can drive a TMDS
character rate exceeding 148.5 MHz, advertise HDMI 1.2 as the supported
version.  HDMI 1.2 allows up to 165 MHz, so set the bridge's
max_tmds_char_rate to ensure the connector limit derived from
supported_hdmi_ver remains within the hardware capabilities.

drm_bridge_connector_atomic_check() runs
drm_atomic_helper_connector_hdmi_check(), which rejects modes whose
computed TMDS character rate exceeds the connector limit before invoking
the driver's .tmds_char_rate_valid() hook, making the max_rate check in
it66121_bridge_hdmi_tmds_char_rate_valid() redundant.  Drop it.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/bridge/ite-it66121.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index 51fc68ffdf8f..c8d0a26e8e90 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -10,6 +10,7 @@
 #include <linux/media-bus-format.h>
 #include <linux/module.h>
 #include <linux/device.h>
+#include <linux/hdmi.h>
 #include <linux/interrupt.h>
 #include <linux/i2c.h>
 #include <linux/bitfield.h>
@@ -867,15 +868,6 @@ it66121_bridge_hdmi_tmds_char_rate_valid(const struct drm_bridge *bridge,
 					 const struct drm_display_mode *mode,
 					 unsigned long long tmds_rate)
 {
-	const struct it66121_ctx *ctx =
-		container_of(bridge, const struct it66121_ctx, bridge);
-	unsigned long long max_rate;
-
-	max_rate = (ctx->bus_width == 12) ? 74250000ULL : 148500000ULL;
-
-	if (tmds_rate > max_rate)
-		return MODE_CLOCK_HIGH;
-
 	if (tmds_rate < HDMI_TMDS_CHAR_RATE_MIN_HZ)
 		return MODE_CLOCK_LOW;
 
@@ -1670,6 +1662,9 @@ static int it66121_probe(struct i2c_client *client)
 			  DRM_BRIDGE_OP_HDMI;
 	ctx->bridge.vendor = "ITE";
 	ctx->bridge.product = "IT66121";
+	ctx->bridge.supported_hdmi_ver = HDMI_VERSION_1_2;
+	ctx->bridge.max_tmds_char_rate = ctx->bus_width == 12 ? 74250000ULL : 148500000ULL;
+
 	if (client->irq > 0) {
 		ctx->bridge.ops |= DRM_BRIDGE_OP_HPD;
 

-- 
2.55.0

