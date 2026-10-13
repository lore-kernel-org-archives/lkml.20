Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081425632BF;
	Tue, 13 Oct 2026 22:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791931944; cv=none; b=feqHyuyXfmdq2j+/OMGOPsO5iSsw+/2LVFKpZOglGTLv0+wmfCMOuCol30/c/IZh8OmS++3MtA9RPbBWgBgevAFTKx1MSFxhvJw8QlqVa4OboSLaGBsc+sU0VmHav6jDBvXEV54lrhivOR/SnOqTnIg7wAlJ+5tFN7wgYQPiZWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791931944; c=relaxed/simple;
	bh=GTlXsZPBb8ue0v1O+fMc7jiFKBxTZ6JZgQl8GhEtyO4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UTar1XtNz+MOwVOmfuE428OGZDWFcH18LkOMbl2Xx+zS6MxdN0XlyVBdl6pYaSKndmQPLyJpeWl+n/P6wfmUd6TnrHJZ5n4TkctQk67gDRYh8YZczcUNV84BwYV5g91R07OjDQy9Mk8eRbaeYf8GvlkSeMvKViGfVRvgXVJkhMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=jC3zImXW; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="jC3zImXW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1791931914;
	bh=GTlXsZPBb8ue0v1O+fMc7jiFKBxTZ6JZgQl8GhEtyO4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jC3zImXW6XWwlMouXoCLZ1KHOUtEhjZ2JGeT0X80+cGSm/tv0RiMYd0wXUByrVeQJ
	 7TZ9uBajSczmEOQ5ZOu2wiG/wD18eLMM70i6jbwm1fRSGR808JuSEycfFBZG3CcpXg
	 z7NUNovh++ISZpK9T6uKHJb6uvb2tpb8scBTElNoWrdE0H6/mylJ0rrz3GZiPmOjjA
	 8RveCipSI35tNw0/F/+lQeJd95XT8qTj/4Xid4vDHe/DBPF1LBNMEPIjgdKErRBW2J
	 9ygrm6d7bWkh3mX0wdNysMaQXcrvTl1D1A6P0YQRiy5g/F6TaCDJxk/BHrhqyRKwCS
	 qlMO+fmAkbr0w==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3719C17E0E8E;
	Wed, 14 Oct 2026 00:51:54 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 14 Oct 2026 01:51:22 +0300
Subject: [PATCH v5 05/15] drm/rockchip: vop2: Avoid division by zero when
 computing max_dclk
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-dw-hdmi-qp-yuv-v5-5-6fab0fe43a9b@collabora.com>
References: <20261014-dw-hdmi-qp-yuv-v5-0-6fab0fe43a9b@collabora.com>
In-Reply-To: <20261014-dw-hdmi-qp-yuv-v5-0-6fab0fe43a9b@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
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
Cc: kernel@collabora.com, Andy Yan <andyshrk@163.com>, 
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
 Igor Paunovic <royalnet026@gmail.com>
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
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 3bbbe365b5f1..5a870a843dae 100644
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

