Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793840471;
	b=e2hPZqvZmz7GEgTpumfbBOKUkI5Of58fWZvoEIiCWtp/LpSDC/eM3vbfs+MOgiMqUpw6
	 ywa0I9oY+hx/Gvywwfaj82e7zspI7QC1fviDUugvIb5lhls2xAqeVTYjpGkEk+70yQbu5
	 aTHzoDw4/CD23fd0BIE7EbT2mAyDKCFyzlrjDYho3WmWDnZUpA/Vyqe9HYBGXoOgMMI/y
	 mmicPx0vqYrU3XA3YBod+RyAtYOdOMxH1Ns+rHf01VBG0cVvIruTYA/lnf81FAd0PE6zT
	 OvP7SirGZitaQfhE9S/yMlGziW8H0ijoODF+XfOFXaO6hlhpnqjGFhBWf9L4qOR0sLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793840471;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=ZpcXpaaFdIS2BdTK8lo+4wKARLFbWTh69FfI88xetkM=;
	b=u/hD1DEzGpOGXz6WJzVHAW6AN1R8R0QSej7XT7IlVkBQTeCE7VpvLn+Xmpj67iSW/rPQ
	 1YV70ewnldPHFj/S7GnUOHLAp/jUAfQ9M4LZnO01Du0UdQ0EvbVQsG6L3u+Jamh8hzIdE
	 Q1T4Mx3CQdx2hxR5vSC5bUcyUSpzzTP7NPSQsYXcN6VrGgzkDm081RSONO3Ioo8yuCFSA
	 KVJwN3SZlaEMaoskPcOqI/hwG8YAlSj+6O7BGongf3QUEXk0YsfCWwq6b/QshDmZeHKeB
	 LiuhT+8CzFqX7x1vpULlPfmBHXrI7kLF28KxjrxJHwTlCV9+91bcDB2ie65GHL6hp0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=plyM2tsA;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428CC606D822;
	Thu,  5 Nov 2026 01:01:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 428CC606D822
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=plyM2tsA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793840469;
	bh=/wjUVkZ0UVn5JWfHTL5GTR3M8dVKzu8q87aZTn3tFGo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=plyM2tsA16i6IUWFhvJbbUn7AF79nYO5J/CU9cGy2NMhnay1QrYyiaUHpp7qwHjIj
	 eYC2BUNTL9/v5DDumGerhx3c/qpuChNccxgAJag1OT+fO/JXRhIydvr5BJ25S1Lq+O
	 w8rcHO77z3QU2fQj3lQKo6WgGWEg/T5AG1BZbWihSnzGq89BkTG2PV+Ozu7kPZeigo
	 Sny+Ylyt5KieEmZmALjt/WZn/UxQkcnjDW5BvyVdeqIV1YHunDm23ZaLIEEegt2vBB
	 o5YvBQTia9FAKbaaTtXTTwkADVkNcYHrwgCmXr6fw8JmwRdHP3l2EiX9sSLKJtSLGF
	 NcNwPzbD6UrOA==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B0E0317E0D49;
	Thu, 05 Nov 2026 02:01:09 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 05 Nov 2026 03:00:39 +0200
Subject: [PATCH v6 05/15] drm/rockchip: vop2: Avoid division by zero when
 computing max_dclk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-dw-hdmi-qp-yuv-v6-5-1bb63ef5766e@collabora.com>
References: <20261105-dw-hdmi-qp-yuv-v6-0-1bb63ef5766e@collabora.com>
In-Reply-To: <20261105-dw-hdmi-qp-yuv-v6-0-1bb63ef5766e@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andyshrk@163.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Daniel Stone <daniels@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Daniel Stone <daniel@fooishbar.org>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sashiko <sashiko-bot@kernel.org>, Igor Paunovic <royalnet026@gmail.com>
X-Mailer: b4 0.15.2

The DCLK reparenting logic in vop2_crtc_atomic_enable() is gated only on
the presence of an HDMI PHY PLL on the SoC.

This condition is true on any board that wires up an HDMI PHY, even when
the CRTC is currently driving a non-HDMI output such as DSI or LVDS.
Those encoders do not set vcstate->output_bpc, so it stays 0, hence the
subsequent DIV_ROUND_CLOSEST_ULL() then divides by zero.

Note this division happens before the drm_for_each_encoder_mask() loop
that would establish whether the pipe is actually driven by HDMI, so the
loop provides no protection.

Default bpc to 8 when it would otherwise be 0.  The resulting max_dclk
value is a don't-care on the non-HDMI paths that trigger this, since the
encoder loop will not select the PHY PLL as the DCLK source there.

Fixes: b0362c45c401 ("drm/rockchip: vop2: Check bpc before switching DCLK source")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260623203310.9F8C81F000E9@smtp.kernel.org/
Link: https://lore.kernel.org/all/20260623203310.9F8C81F000E9@smtp.kernel.org/
Tested-by: Igor Paunovic <royalnet026@gmail.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 8d5613531acb..d1329941d9f6 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1931,8 +1931,9 @@ static void vop2_crtc_atomic_enable(struct drm_crtc *crtc,
 	 * to 4K@60Hz, if available, otherwise keep using the system CRU.
 	 */
 	if (vop2->pll_hdmiphy0 || vop2->pll_hdmiphy1) {
-		unsigned long max_dclk = DIV_ROUND_CLOSEST_ULL(VOP2_MAX_DCLK_RATE * 8,
-							       vcstate->output_bpc);
+		unsigned int bpc = vcstate->output_bpc ?: 8;
+		unsigned long max_dclk = DIV_ROUND_CLOSEST_ULL(VOP2_MAX_DCLK_RATE * 8, bpc);
+
 		if (clock <= max_dclk) {
 			drm_for_each_encoder_mask(encoder, crtc->dev, crtc_state->encoder_mask) {
 				struct rockchip_encoder *rkencoder = to_rockchip_encoder(encoder);

-- 
2.55.0

