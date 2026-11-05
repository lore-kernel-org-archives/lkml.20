Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793840483;
	b=ps3wmuQ2081xiywkb7Awv+71fB545MwYUaLh6JYFZSd4vvZIjXdzBTyOPS4wGp/tOQi5
	 tZ3vGCT/X8/5wAUWmVZcJ2AHcrQxc5tSDnu2GB1aLa9EwsrRkcKytxLKB4MecoXTQETN4
	 oTh3Kb4kidC4QAqop2BUZN4cMeDK4vVaOKGLaRluXOZrtyFMZlmgjmxcF9SSynZcRrgtf
	 EVklTkpkTEWOIgzEONwFdMKU0n0c8H3ughsjzJN740iw9a1poRg5UO+sNPFxBbQnCJKMD
	 6kG38vPXAarh68W24tZ8rtiQTppcrMiz48ajWENfRlVVKyHYeF9XeBxSkkMWUvuK0gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793840483;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=BlK/YTVMnUoqCmWClO/UwFAOnvnic/Onn4777GZprX8=;
	b=zDB1OZcL5UJqHqUoh+N5LRgO1SUJhcXH18h4IlVrrCKWwLEmaVVCPUfh6KF9lHXi09k5
	 qAgn9qQCSouZ5xzi69BBmGnlz6zhmHKqqCJyet8SCEsGNfBdY0pM3R8DzvYoeGMZoxpFs
	 Y5iQ1IR4V9nmUEXGN/ifLe67OlojFa/VuM59JSNZYb2qjdIrjpm17V1xNcf56Bjj3r/KJ
	 9WOP3nJxWrtaEYEEWWtKA2C0WqNj0XhjRdF2/IimpXS691HGAhH+5HzbZHHCyS79zLFM9
	 r4ttwO2428ALSXcfmM4J3X5/Hnw7Wxh0NPi+zPDPUB3ewlpQRqTMtXoqnyL4h8RUvAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=pS48B6GV;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4656A606A336;
	Thu,  5 Nov 2026 01:01:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4656A606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=pS48B6GV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793840476;
	bh=RhZ4fXL1AORS0/8pLCbVTNBRUTNmNdnA0HjJGklhMZc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pS48B6GVUKbY4gjiM+SXD+UlwdJElwUI4pzN9cE2rdfM8G1UnOaRcwTMmZji6Jr2r
	 +SOtWNIU+zdGq8Zi1v4RXu0fV08fX1iL6aCYveT4iCwS2LtdwNWC9Q0dI5wuAqkp48
	 mS8n3Fn0FmFcZVOLviR6FXQ2WPAlpDX0gOW6u1j982xKfPJuUt20JKC0kQvJsWsrU+
	 6+SVzZkd0cHGr1EAjpTtI8GELp8zAd7tnBPS0WzQ2Jr88tHSqNvh88MRWPjh89MFoE
	 pzzzCQPe2aAAMKmgKeOnP+OaQDuMr602+5/VCIMbf155NdZMI8IrIr8y8NqTmm947P
	 Z0t0HP3SYRT8A==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8302417E0D13;
	Thu, 05 Nov 2026 02:01:16 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 05 Nov 2026 03:00:48 +0200
Subject: [PATCH v6 14/15] drm/rockchip: dw_hdmi_qp: Enable YUV420 output
 format
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
Message-Id: <20261105-dw-hdmi-qp-yuv-v6-14-1bb63ef5766e@collabora.com>
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

Both RK3576 and RK3588 SoCs are capable of driving the YUV420 output
color format, and the required bus-format handling and VOP2 support are
already in place.  Advertise it via the platform supported formats so
the HDMI core can select it.

YUV420 halves the TMDS bandwidth compared to RGB/YUV444, which enables
high-resolution modes such as 4K@60Hz on links that cannot otherwise
carry the full-bandwidth signal.

Tested-by: Igor Paunovic <royalnet026@gmail.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index 7f05d26f8d76..8ce991a5275c 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -660,7 +660,8 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 
 	plat_data.supported_formats = BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444) |
 				      BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444) |
-				      BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422);
+				      BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422) |
+				      BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR420);
 
 	encoder = &hdmi->encoder.encoder;
 	encoder->possible_crtcs = drm_of_find_possible_crtcs(drm, dev->of_node);

-- 
2.55.0

