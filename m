Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464D5347FEC
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 01:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790817311; cv=none; b=QfNp3l55UFiXz79Yca2H3vECqxzx7fwAyFFAfrJBvFfKRpku9gv1pHjR1J55UZ/f6Ns4PMXp7KhiPzcsH8SYxzkKNx+EQ9OFK9/82qR5svyxO0m+qgKsw2onU/UpEcg3zCeU7rFuxwStHUCLXGqBG2V8a2e9ye9n5BzN4HVyBBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790817311; c=relaxed/simple;
	bh=GnxzdJi1GoGGFC0sAtmkaLn2Y1vvWDR26CgkxdN0K40=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LgYL1DOnqZaMlRfnW5lq61miZOuNPJBgXaKuuFZOU7hI0DxQMxrVaHgwJFeeAO1atU81nsHUWO8BWiyY+88I1mDDCWpa+NAndBBfJSu/q2A2ucm94fst1jfWRW6J2HXdNxaVZe5IQYIwEia+9n6ESR0fb9NTfJtBNwgy8sNol00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=WYOd34pS; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="WYOd34pS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790817302;
	bh=GnxzdJi1GoGGFC0sAtmkaLn2Y1vvWDR26CgkxdN0K40=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WYOd34pSN3xyzTRqj8/RTMynp1NpY8xs4TDpcXf7zqhjkXJ+3KzncxeFXjgbkdBp6
	 ymUc1PMdIQq/t3cQRyh88bFQzIMNrfw4oG/S227FPLCxjHx3DsossYfCh2UYgZONYX
	 Ps2lo7zI2yEpC1CKbG+G/pFjmks5Xh5i8jm4oV9lpz632cr52iDcpCjmMqX395Y12y
	 IpuOGXORWYBxi5ncGWRTUnUx3XBqZOukb1SB1URrMbHBIIOtZcrZbpFIvnpWjqB6Qt
	 fN/sgdApOOLfP18+ThUh/tHeF9h2eA6CvuxEHZCHrCbVDC9oNFDDDqmfW/0cpCYFx1
	 eGAGqHfyMXeYw==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 01D0E17E0FD9;
	Thu, 01 Oct 2026 03:15:02 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 01 Oct 2026 04:14:37 +0300
Subject: [PATCH 6/8] drm/bridge: lontium-lt9611: Advertise HDMI 1.4
 capabilities
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-bridge-advert-hdmi-caps-v1-6-f8806570e243@collabora.com>
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

Bridges using DRM_BRIDGE_OP_HDMI are expected to provide the supported
HDMI version.  This is not enforced yet, but will become mandatory once
the migration to the caps-based HDMI connector initialization API is
complete.

As LT9611 supposedly cannot drive a TMDS character rate exceeding 297
MHz, advertise HDMI 1.4 as the supported version.  HDMI 1.4 allows up to
340 MHz, so set the bridge's max_tmds_char_rate to ensure the connector
limit derived from supported_hdmi_ver remains within the hardware
capabilities.

drm_bridge_connector_atomic_check() calls
drm_atomic_helper_connector_hdmi_check(), which rejects modes whose
computed TMDS character rate exceeds the connector's max_tmds_char_rate
before invoking the driver's .tmds_char_rate_valid hook.  Since
max_tmds_char_rate now carries the existing effective limit,
lt9611_hdmi_tmds_char_rate_valid() is redundant.  Drop it.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index cdc2b188e2d8..2d1a28261037 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/gpio/consumer.h>
+#include <linux/hdmi.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/media-bus-format.h>
@@ -952,18 +953,6 @@ static int lt9611_hdmi_write_hdmi_infoframe(struct drm_bridge *bridge,
 	return 0;
 }
 
-static enum drm_mode_status
-lt9611_hdmi_tmds_char_rate_valid(const struct drm_bridge *bridge,
-				 const struct drm_display_mode *mode,
-				 unsigned long long tmds_rate)
-{
-	/* 297 MHz for 4k@30 mode */
-	if (tmds_rate > 297000000)
-		return MODE_CLOCK_HIGH;
-
-	return MODE_OK;
-}
-
 static int lt9611_hdmi_audio_startup(struct drm_bridge *bridge,
 				     struct drm_connector *connector)
 {
@@ -1029,7 +1018,6 @@ static const struct drm_bridge_funcs lt9611_bridge_funcs = {
 	.atomic_create_state = drm_atomic_helper_bridge_create_state,
 	.atomic_get_input_bus_fmts = lt9611_atomic_get_input_bus_fmts,
 
-	.hdmi_tmds_char_rate_valid = lt9611_hdmi_tmds_char_rate_valid,
 	.hdmi_write_audio_infoframe = lt9611_hdmi_write_audio_infoframe,
 	.hdmi_clear_audio_infoframe = lt9611_hdmi_clear_audio_infoframe,
 	.hdmi_write_avi_infoframe = lt9611_hdmi_write_avi_infoframe,
@@ -1175,6 +1163,8 @@ static int lt9611_probe(struct i2c_client *client)
 	lt9611->bridge.hdmi_audio_dev = dev;
 	lt9611->bridge.hdmi_audio_max_i2s_playback_channels = 8;
 	lt9611->bridge.hdmi_audio_dai_port = 2;
+	lt9611->bridge.supported_hdmi_ver = HDMI_VERSION_1_4;
+	lt9611->bridge.max_tmds_char_rate = 297000000; /* 297 MHz for 4k@30 mode */
 
 	drm_bridge_add(&lt9611->bridge);
 

-- 
2.55.0

