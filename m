Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184C8364935
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 01:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790817308; cv=none; b=FRrPzUcTSPIru1bWWj11X4wdFEwdS6T2E26HyRY1+dXHlEYTvpyaepx5iLR/OZukSKxc0mL5rZRNf1XUEI2tTRU5fp11Dta/OzqwtM6bBfAMnlt3O9P1RahcZW4WWzl4fJYQ+avF3m88REN/k36lJAA1BlRy5iFN/f5s6puBMo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790817308; c=relaxed/simple;
	bh=trz+pg8TdAmiapUzXFOsDd1JTCIdVAs8CD5I44OX+Hk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ic0r3sFu7TJMs+zdffQjVDkrNoo94V8A7hG2eVuzHTfLCtddKxxUiXOiBPjapduyKo8To7aOoK2mNTPXj7kAvl8pxCPTh5eunTJVe2llsXcTCRnpyMIxh0ZmHtfdeG6ocZcADsIIsvgW1O3rgFAylxqcmfxJFDhhKZho0x5Ugs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=izeOJWKA; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="izeOJWKA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790817300;
	bh=trz+pg8TdAmiapUzXFOsDd1JTCIdVAs8CD5I44OX+Hk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=izeOJWKAI6UcIH+uKv09mw3+Ceir8XOZOZUYbLKS6GBbMnG0W1cVjaKwqZpH1i334
	 VAssMy6QGwHjA3L1tn/4v8KWYr3vHP4P8xf/ysOowiJj8/2QCMJTxVNkvllB8z89l4
	 EmkKUnLIO5Qv9RwmQwDkId/b4oUq6era9yer6hiLrFu3W6Y2eXyp62V4WdcIZO0fF5
	 jkIitmTBylHgCo/TW8GWBayz8trDyqLB8rcYDWc+Rdf+TDmMrWVohaNY6wW4vdc6El
	 CRDivybezBOJCxGFHCMlVX35bFQhR92eToUhIRl4mILohBhM6dHBEstECk4qv4bPk1
	 EGwGexRqi6CVg==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9E11017E0B0F;
	Thu, 01 Oct 2026 03:15:00 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 01 Oct 2026 04:14:35 +0300
Subject: [PATCH 4/8] drm/bridge: ite-it6263: Advertise HDMI 1.3
 capabilities
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-bridge-advert-hdmi-caps-v1-4-f8806570e243@collabora.com>
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

Advertise HDMI 1.3 support for IT6263, covering the 225 MHz TMDS
character rate currently documented by the driver, which is within the
HDMI 1.3 limit of 340 MHz.  Additionally, keep the stricter 150 MHz
effective mode limit by setting max_tmds_char_rate from
MAX_PIXEL_CLOCK_KHZ.

The existing .hdmi_tmds_char_rate_valid() hook checks both the pixel
clock and TMDS character rate.  Since the bridge only supports 8 bpc
RGB444, these are equivalent for supported modes, making the 225 MHz
TMDS rate check unreachable once the 150 MHz pixel-clock limit is
applied.

drm_bridge_connector_atomic_check() invokes
drm_atomic_helper_connector_hdmi_check(), which rejects modes whose
computed TMDS character rate exceeds the connector's max_tmds_char_rate
before invoking the driver's .tmds_char_rate_valid hook.  Since
max_tmds_char_rate now carries the existing effective limit,
it6263_hdmi_tmds_char_rate_valid() is redundant.  Drop it.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/bridge/ite-it6263.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/ite-it6263.c
index 550999491086..e8e0197171e1 100644
--- a/drivers/gpu/drm/bridge/ite-it6263.c
+++ b/drivers/gpu/drm/bridge/ite-it6263.c
@@ -738,20 +738,6 @@ it6263_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
 	return input_fmts;
 }
 
-static enum drm_mode_status
-it6263_hdmi_tmds_char_rate_valid(const struct drm_bridge *bridge,
-				 const struct drm_display_mode *mode,
-				 unsigned long long tmds_rate)
-{
-	if (mode->clock > MAX_PIXEL_CLOCK_KHZ)
-		return MODE_CLOCK_HIGH;
-
-	if (tmds_rate > MAX_HDMI_TMDS_CHAR_RATE_HZ)
-		return MODE_CLOCK_HIGH;
-
-	return MODE_OK;
-}
-
 static int it6263_hdmi_clear_avi_infoframe(struct drm_bridge *bridge)
 {
 	struct it6263 *it = bridge_to_it6263(bridge);
@@ -821,7 +807,6 @@ static const struct drm_bridge_funcs it6263_bridge_funcs = {
 	.detect = it6263_bridge_detect,
 	.edid_read = it6263_bridge_edid_read,
 	.atomic_get_input_bus_fmts = it6263_bridge_atomic_get_input_bus_fmts,
-	.hdmi_tmds_char_rate_valid = it6263_hdmi_tmds_char_rate_valid,
 	.hdmi_clear_avi_infoframe = it6263_hdmi_clear_avi_infoframe,
 	.hdmi_write_avi_infoframe = it6263_hdmi_write_avi_infoframe,
 	.hdmi_clear_hdmi_infoframe = it6263_hdmi_clear_hdmi_infoframe,
@@ -883,6 +868,8 @@ static int it6263_probe(struct i2c_client *client)
 	it->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	it->bridge.vendor = "ITE";
 	it->bridge.product = "IT6263";
+	it->bridge.supported_hdmi_ver = HDMI_VERSION_1_3;
+	it->bridge.max_tmds_char_rate = 1000ULL * MAX_PIXEL_CLOCK_KHZ;
 
 	return devm_drm_bridge_add(dev, &it->bridge);
 }

-- 
2.55.0

