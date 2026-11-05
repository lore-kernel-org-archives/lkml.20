Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793840478;
	b=dFiod2OFpvYcGDvoruizj6GxFCZi43PwO8vZdDR2wlJokwCZ1BD46aCZvlxwoC8YUv6q
	 zpI2bVS6H8jDhqfi3QS8XDRv0RZQjRFx0PQumYCU9NgAE6nx2LzMq9E/0Qr2wD+oAxdfi
	 nugtOurfqXEEq5P3kbYZFyeTV1AEILUV8vGod8G5P6tbz1AgeHYF2rwGWU0f6mmy64Xf4
	 dvEAc9LgQg1zHhuHYAnzyjlo1GgApwhlnQo7e20bThxZCL0v14UH9OZQO/MuDyfMRX7oy
	 lMcNoHywORAJzQqOyIkjpKeOlQmAdP7avvCm3j9U2en0iwNML78EeIEJZbjY3feP1lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793840478;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=IE+CwyGmVpK9kCq38wcc2HM4ElfDFOxunpUNRJr2ayk=;
	b=qUwaMdU2Hn6tKFOMHVQ/3l6d78JDnt8G4K+ReksOfqyJlg6HxXyR/jIPpRD0a3rjGmdx
	 KQgq+CTKXHXB3o8lZIsh9dvxudBAmmuFzbplOVNxjOm1TC/jnLDvFLg3E6gb9CmAf6H0C
	 p8+ynKoYC6wI137yFqDpGUcTNM2ShVaZO5GbueJD+CbNkdE5yZq4FVEjavsPavUauzFfI
	 /4Lgg6aQhbhXO3Fxi3UUgCmv8jfm/8XvUdvTVs0u808gpU1IWA7FBfe5MYzmNM2tmvRPm
	 9hSjbcfQzqC88/7W9hMHJnVjhbU82KZVpeMQYX4Cg2d+XarkEEPt/uZB2sc2YYWMvrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=VR855FDp;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7742A6082BD2;
	Thu,  5 Nov 2026 01:01:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7742A6082BD2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=VR855FDp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793840475;
	bh=fYsBZY+jSikNub85K8e0+OdnyNo7wwxjd1+6YCys8OA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VR855FDpiojGQjntT7bGe/YYaibGfjJX7V2GMMa1wh0eDU9HRJWoEHKN6i4sLB/lb
	 zGMzeRVnZWAZ/WAcP0279QRqq3Y1I6wJP24NTK688ZtIFiRPB43R+WKXAKsZtvbmui
	 au6XKiWXwoPdyC7t1qswazUzjstRgBKySeboUzGwMh1JFEWJ00+jn6hN+ooledOunF
	 G/3CQBu4nvEp4nBC6+Owet9wLXq1YalTwkcBqamBWhTzUFmr2hwuqesIEGTHfUJXeh
	 xDv/HyJo2MwiwyJ39eGbPpCFKggTuDmyReErY+s1+HJkYwftoiiDdM9T0Mjmumtdf1
	 cxBNyyW98SaQg==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B9B1A17E0CF7;
	Thu, 05 Nov 2026 02:01:15 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 05 Nov 2026 03:00:47 +0200
Subject: [PATCH v6 13/15] drm/rockchip: dw_hdmi_qp: Support 10-bit YUV422
 output format
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
Message-Id: <20261105-dw-hdmi-qp-yuv-v6-13-1bb63ef5766e@collabora.com>
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
 Igor Paunovic <royalnet026@gmail.com>
X-Mailer: b4 0.15.2

Rockchip DW HDMI QP encoder supports YUV 4:2:2 output through
ROCKCHIP_OUT_MODE_YUV422, but was limited to 8-bit depth via
MEDIA_BUS_FMT_UYVY8_1X16.  Add support for its 10-bit counterpart
MEDIA_BUS_FMT_UYVY10_1X20, which carries two 10-bit components per clock
cycle on a 20-bit wide bus.

The HDMI PHY scales its PLL output by 8/bpc to undo the deep color
packing, such that it matches the DCLK rate expected by VOP2.  However,
YUV 4:2:2 is never deep color packed, as it always transmits two 12-bit
components per pixel, regardless of the color depth.  From a clock-rate
perspective this is equivalent to three 8-bit RGB components, so
configure the HDMI PHY with 8 bpc when YUV 4:2:2 is in use to keep its
output clock aligned with the TMDS character rate.

Tested-by: Igor Paunovic <royalnet026@gmail.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index db1933d75ced..7f05d26f8d76 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -190,6 +190,25 @@ static int dw_hdmi_qp_rockchip_get_vop_format(struct drm_encoder *encoder,
 	return bstate->output_bus_cfg.format;
 }
 
+/*
+ * The HDMI PHY scales its PLL output by 8/bpc to undo the deep color packing,
+ * such that it matches the DCLK rate expected by VOP2.
+ *
+ * YUV422 is never deep color packed, as it always transmits two 12-bit
+ * components per clock cycle, regardless of the color depth.  Hence, as for
+ * drm_hdmi_compute_mode_clock(), use 8 bpc to keep the PHY PLL output aligned
+ * with the TMDS character rate.
+ */
+static unsigned int
+dw_hdmi_qp_rockchip_phy_bpc(const struct rockchip_crtc_state *s,
+			    const struct drm_connector_state *conn_state)
+{
+	if (s->output_mode == ROCKCHIP_OUT_MODE_YUV422)
+		return 8;
+
+	return conn_state->hdmi.output_bpc;
+}
+
 static int
 dw_hdmi_qp_rockchip_encoder_atomic_check(struct drm_encoder *encoder,
 					 struct drm_crtc_state *crtc_state,
@@ -218,6 +237,7 @@ dw_hdmi_qp_rockchip_encoder_atomic_check(struct drm_encoder *encoder,
 		s->output_mode = ROCKCHIP_OUT_MODE_AAAA;
 		break;
 	case MEDIA_BUS_FMT_UYVY8_1X16:
+	case MEDIA_BUS_FMT_UYVY10_1X20:
 		s->output_mode = ROCKCHIP_OUT_MODE_YUV422;
 		break;
 	case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
@@ -229,7 +249,7 @@ dw_hdmi_qp_rockchip_encoder_atomic_check(struct drm_encoder *encoder,
 	}
 
 	phy_cfg.hdmi.tmds_char_rate = conn_state->hdmi.tmds_char_rate;
-	phy_cfg.hdmi.bpc = conn_state->hdmi.output_bpc;
+	phy_cfg.hdmi.bpc = dw_hdmi_qp_rockchip_phy_bpc(s, conn_state);
 
 	ret = phy_configure(hdmi->phy, &phy_cfg);
 	if (!ret) {

-- 
2.55.0

