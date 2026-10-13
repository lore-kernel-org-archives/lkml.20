Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52BE563288;
	Tue, 13 Oct 2026 22:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791931939; cv=none; b=JSBrqmd+ZXznzGe/mFKwBWp7MGna/xy1HcQPAOlC05rXhgObSC9bErHeBtSkDurqolS5hPIEIAxVuDtIUZjGhLXqM2QtIKF47mWo96qxVxJtLLspVolS2AAPCj3/GR/2E/EPpu9KWPyZpFcJ0bHKX7osB26DofKfgAGHLjGaUxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791931939; c=relaxed/simple;
	bh=X0NV0WgdOazCVt8GUtum5I4ZQo3qpmHNw0GNMTTcXsY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TwpcaP7EOEZhlhemykOUwuUfVWlrIE75VCjFKFUnMQKHsMTCQ3yvx4yuRTYc8bhvTQwAK+a8choUbVF8g/l7TGV6I6qo4OpaEhfE8j7yiRA3e7/j8snrTNeAB/MCksuPX+wqRF7/xEji5ovKTEbPr3UZH+Zu5A90L0/PRTlp+uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ltSWmxAg; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ltSWmxAg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1791931919;
	bh=X0NV0WgdOazCVt8GUtum5I4ZQo3qpmHNw0GNMTTcXsY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ltSWmxAg1aigUuNAOo81FAYTHbNE88hI+0bgP4RaU1AwmJ1Gvny+vpbLYAZIH32Y+
	 IliHailyuQgTVFXYm+CaXDWusyPsuct01vwEENmZhm1Vj0IwbNlpJoiqNzT2PW2T/I
	 8Cd2bzeEcBhVK8pMxF4rS8rf89Uj6keaVL2LU/ddgsH1odCKv3piELm/5uixoIixTH
	 hNMAl3YXUPie1xazrwm22Pp8AIvizKhLlY5OLZwISJp09d6f8j+BlGSDSuJaz9w0eT
	 5huJsxKXkJ5x0lpXCdHs/EU+M/tonntFLEmWS83QwNduKFMn6qKS4U+193cGPSWyeQ
	 +otIRPIJ/w1Gw==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CC89C17E150A;
	Wed, 14 Oct 2026 00:51:59 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 14 Oct 2026 01:51:30 +0300
Subject: [PATCH v5 13/15] drm/rockchip: dw_hdmi_qp: Support 10-bit YUV422
 output format
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-dw-hdmi-qp-yuv-v5-13-6fab0fe43a9b@collabora.com>
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

Rockchip DW HDMI QP encoder supports YUV 4:2:2 output through
ROCKCHIP_OUT_MODE_YUV422, but was limited to 8-bit depth via
MEDIA_BUS_FMT_UYVY8_1X16.  Add support for its 10-bit counterpart
MEDIA_BUS_FMT_UYVY10_1X20, which carries two 10-bit components per clock
cycle on a 20-bit wide bus.

YUV 4:2:2 always transmits two 12-bit components per pixel, regardless
of the color depth.  From a clock-rate perspective this is equivalent to
three 8-bit RGB components, so configure the HDMI PHY with 8 bpc when
YUV 4:2:2 is in use to keep its output clock aligned with the TMDS
character rate.  Otherwise the PHY PLL output would be scaled by bpc/8
for higher color depths, producing a clock rate that confuses downstream
consumers such as the VOP2 display controller.

Tested-by: Igor Paunovic <royalnet026@gmail.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index db1933d75ced..380dd9ca6870 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -218,6 +218,7 @@ dw_hdmi_qp_rockchip_encoder_atomic_check(struct drm_encoder *encoder,
 		s->output_mode = ROCKCHIP_OUT_MODE_AAAA;
 		break;
 	case MEDIA_BUS_FMT_UYVY8_1X16:
+	case MEDIA_BUS_FMT_UYVY10_1X20:
 		s->output_mode = ROCKCHIP_OUT_MODE_YUV422;
 		break;
 	case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
@@ -229,7 +230,14 @@ dw_hdmi_qp_rockchip_encoder_atomic_check(struct drm_encoder *encoder,
 	}
 
 	phy_cfg.hdmi.tmds_char_rate = conn_state->hdmi.tmds_char_rate;
-	phy_cfg.hdmi.bpc = conn_state->hdmi.output_bpc;
+	/*
+	 * YUV422 always transmits two 12-bit components per clock cycle,
+	 * regardless of the color depth, which from a rate perspective is
+	 * equivalent to three 8-bit RGB components.  Force 8 bpc here to
+	 * keep the PHY PLL output aligned with the TMDS character rate.
+	 */
+	phy_cfg.hdmi.bpc = (s->output_mode == ROCKCHIP_OUT_MODE_YUV422 ?
+				8 : conn_state->hdmi.output_bpc);
 
 	ret = phy_configure(hdmi->phy, &phy_cfg);
 	if (!ret) {

-- 
2.55.0

