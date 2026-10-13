Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE35B565113;
	Tue, 13 Oct 2026 22:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791931938; cv=none; b=ojTlbvx5l/UFkfZUKUW69P7uR0Xp+013PHEQ3d9AUg/QHynRBjxAntbhx7PYJLBYgF6vSNvAE1qORgk1GCBrDld3+pBDCN2lECoQF2gt1W+7Lqoaxq1Jaj8PPx+uFW38OX6ydeWBPOamI6BvUkJ6XFWv14Zy5f5PCE+aUWHlfWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791931938; c=relaxed/simple;
	bh=o75JY06VhuM7Teqr20IQpqo67gBo5M66FC5oasjs3To=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D/0S6dFtLt3R67jcsvJKunORj6hP7GcwPVciP4kN+siQ2MYe+oIY+cQkyIpOomiEGXc9HIbW+dQ+vN6tnLcXkx29IYpMr6SMe56j+EZzSb2t38jRpnghiK3OB2CAVbGgkzNVQM/rrF8cvPOsHQVb/Idr0tnZZud1BaWDyA6IpVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=UKCzFCeE; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="UKCzFCeE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1791931916;
	bh=o75JY06VhuM7Teqr20IQpqo67gBo5M66FC5oasjs3To=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UKCzFCeEG+x9oAEIigNBGKZ5nNJ4PsSpFUwB/YTONdDt61+5vFJi4dAjfAnZoHoPu
	 r0uqzjwK3pLVCcYuQW2vWxlliSoa/uQ0QGhbiuk2b9HQE+T74umgJ6wNyH+fZCF6nL
	 0egKs56nnc0InYjHEqu9qFndAYE1wDRoURQ1wdimPbY8LsYWizGokcaiQfumO1CX+G
	 WlySI7q4hJn4+JWi6fawvZdxbJJTzkE/MhAlIyisXrIWfs+7gn+/jFOL0e7Tndvi9a
	 Uk7NaJD8RJ4BFBE8JOg3f2GmO+6xHBmFuXZR4c597lGtguyDTkxsEmcQk/grYlLOPO
	 ekqTRRMp/jkNQ==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 48ECF17E0FB1;
	Wed, 14 Oct 2026 00:51:56 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 14 Oct 2026 01:51:25 +0300
Subject: [PATCH v5 08/15] drm/rockchip: vop2: Avoid DCLK source switch for
 10-bit YUV422 output
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-dw-hdmi-qp-yuv-v5-8-6fab0fe43a9b@collabora.com>
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
 linux-kernel@vger.kernel.org, Igor Paunovic <royalnet026@gmail.com>
X-Mailer: b4 0.15.2

Currently the color depth is always factored into the DCLK source
decision for HDMI output, which can break certain modes when operating
with depths greater than 8 bpc.

When the required transmission rate exceeds the 600 MHz limit of the
HDMI PHY PLL, e.g. for 4K@60Hz 10-bit RGB output, VOP2 will normally
fall back to using the less accurate system CRU as a DCLK source,
assuming HDMI 2.1 FRL is supported by the pipeline, otherwise the mode
will be rejected.  For YUV420 output format this never happens, as it
uses half of the RGB bandwidth, hence the rate remains within the PHY
PLL limits.

On the other hand, YUV422 always transmits two 12-bit components per
clock cycle, regardless of the color depth, which from a clock-rate
perspective is equivalent to three 8-bit RGB components.  For example,
4K@60Hz 10-bit YUV422 requires the same bandwidth as 4K@60Hz 8-bit RGB,
typically 594 MHz.  However, VOP2 wrongly assumes it needs 742.5 MHz
(594 * 10 / 8) and ends up switching the DCLK source.

As a consequence, the modes requiring uncommon pixel clocks, such as
those corresponding to fractional refresh rates, will fail.  An example
is 3840x2160@59.94Hz, which would likely rely on the 593.407 MHz clock
rate unsupported by the system CRU.

Note this only affects YUV422 with color depths greater than 8 bpc; for
8-bit YUV422 the 8/bpc factor is unity and the bandwidth check is
already correct.

Prevent the incorrect switches of DCLK source to system CRU for YUV422
output format by forcing 8 bpc when checking the bandwidth.

Tested-by: Igor Paunovic <royalnet026@gmail.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index afa4bc6cbcc4..2fa27028892c 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1954,7 +1954,15 @@ static void vop2_crtc_atomic_enable(struct drm_crtc *crtc,
 	 * to 4K@60Hz, if available, otherwise keep using the system CRU.
 	 */
 	if (vop2->pll_hdmiphy0 || vop2->pll_hdmiphy1) {
-		unsigned int bpc = vcstate->output_bpc ?: 8;
+		/*
+		 * YUV422 always transmits two 12-bit components per clock
+		 * cycle, regardless of the color depth, which from a rate
+		 * perspective is equivalent to three 8-bit RGB components.
+		 * Force 8 bpc here so the bandwidth check reflects the actual
+		 * TMDS rate and avoids an unnecessary DCLK source switch.
+		 */
+		unsigned int bpc = vcstate->output_mode == ROCKCHIP_OUT_MODE_YUV422 ?
+					8 : (vcstate->output_bpc ?: 8);
 		unsigned long max_dclk = DIV_ROUND_CLOSEST_ULL(VOP2_MAX_DCLK_RATE * 8, bpc);
 
 		if (clock <= max_dclk) {

-- 
2.55.0

