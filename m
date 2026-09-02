Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713414519A2;
	Wed,  2 Sep 2026 22:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788389668; cv=none; b=TLbipOVDLZ6/EE8HpfgQSfJ6vaaY+OaCPjumaglPKPAQFZhQrx7tOvrjGaFUtbllDMIwiS21CrKvD90cqpEq17Xl40ZYp1Fqh77difPfkWaUmtf2olu6KFPpyx3hlLRCSYz75b6NL4qN/1SwKSbGBzOv0JTUkcibrdk9tJFITL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788389668; c=relaxed/simple;
	bh=4Y2qxlgOWfwgTAMIt77CU07XuhytRH/hQI3tSCxInDo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DpexsMySMm26SiedPjkpUnktDhZWb4rdO+1/tEiZrd2CxcLFC9B516fEqORT56vtSvjX5gVlOcquHSkKcn6MvwNrMV4ICftjAjyVRQlwQ3AC1A9oIuDivkImCHe59w23PlM0iHieH20rQzo6EBANXI0TNk4Wr9fUPAnI1jqWYBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=XII7FQF7; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="XII7FQF7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788389658;
	bh=4Y2qxlgOWfwgTAMIt77CU07XuhytRH/hQI3tSCxInDo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XII7FQF7D4ip0eJ8RFs9T5uiC3U5ixz13ooH+KF1pVSchbWcyrg8lGXo1LjzKyjRH
	 wQNybnWL3Bk0uEA+kePRq9Se5mfa8UEMKEqx2YYbKp7N06NRjjV5q733uWaOyjlD/d
	 gfJSwHeI/IGyiB42Rlu22WmTkq/mhcRUDMtOTfB3D2J9lkihDq/QRQ+K7Ybn7OtD5i
	 u7EuKvSjAUg8EGo+sTN9ceGFWXPvUzLK/5yyWJ1SjWTURmjLtmiCbUnhkPN03eem/s
	 Wk7lO7KKt+WepL26FhiJunX2XEFPtVo5Ab0Md0X7qJVm5+sbYzRPSW/eCskVUKdHrM
	 IX4hTlQM7QNpQ==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0A16F17E14D2;
	Thu, 03 Sep 2026 00:54:18 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 03 Sep 2026 01:54:16 +0300
Subject: [PATCH v4 09/14] drm/rockchip: vop2: Consolidate HDMI PHY PLL
 clock parent switch
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-dw-hdmi-qp-yuv-v4-9-fb45bf4147eb@collabora.com>
References: <20260903-dw-hdmi-qp-yuv-v4-0-fb45bf4147eb@collabora.com>
In-Reply-To: <20260903-dw-hdmi-qp-yuv-v4-0-fb45bf4147eb@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Daniel Stone <daniels@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: kernel@collabora.com, Andy Yan <andyshrk@163.com>, 
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Igor Paunovic <royalnet026@gmail.com>
X-Mailer: b4 0.15.2

The DCLK parent switch logic for HDMI0 and HDMI1 PHY PLLs was
duplicated, with each endpoint repeating the same clk_get_parent(),
clk_set_parent() and error handling calls.

Refactor this by first selecting the appropriate PHY PLL clock handle
based on the active HDMI endpoint, then performing the parent switch in
a single shared code path.

Tested-by: Igor Paunovic <royalnet026@gmail.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 36 +++++++++++-----------------
 1 file changed, 14 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 4b4346cf38cd..e78cddc184d3 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1964,42 +1964,34 @@ static void vop2_crtc_atomic_enable(struct drm_crtc *crtc,
 		unsigned int bpc = vcstate->output_mode == ROCKCHIP_OUT_MODE_YUV422 ?
 					8 : (vcstate->output_bpc ?: 8);
 		unsigned long max_dclk = DIV_ROUND_CLOSEST_ULL(VOP2_MAX_DCLK_RATE * 8, bpc);
+		struct clk *pll_hdmiphy = NULL;
 
 		if (clock <= max_dclk) {
 			drm_for_each_encoder_mask(encoder, crtc->dev, crtc_state->encoder_mask) {
 				struct rockchip_encoder *rkencoder = to_rockchip_encoder(encoder);
 
 				if (rkencoder->crtc_endpoint_id == ROCKCHIP_VOP2_EP_HDMI0) {
-					if (!vop2->pll_hdmiphy0)
-						break;
-
-					if (!vp->dclk_src)
-						vp->dclk_src = clk_get_parent(vp->dclk);
-
-					ret = clk_set_parent(vp->dclk, vop2->pll_hdmiphy0);
-					if (ret < 0)
-						drm_warn(vop2->drm,
-							 "Could not switch to HDMI0 PHY PLL: %d\n",
-							 ret);
+					pll_hdmiphy = vop2->pll_hdmiphy0;
 					break;
 				}
 
 				if (rkencoder->crtc_endpoint_id == ROCKCHIP_VOP2_EP_HDMI1) {
-					if (!vop2->pll_hdmiphy1)
-						break;
-
-					if (!vp->dclk_src)
-						vp->dclk_src = clk_get_parent(vp->dclk);
-
-					ret = clk_set_parent(vp->dclk, vop2->pll_hdmiphy1);
-					if (ret < 0)
-						drm_warn(vop2->drm,
-							 "Could not switch to HDMI1 PHY PLL: %d\n",
-							 ret);
+					pll_hdmiphy = vop2->pll_hdmiphy1;
 					break;
 				}
 			}
 		}
+
+		if (pll_hdmiphy) {
+			if (!vp->dclk_src)
+				vp->dclk_src = clk_get_parent(vp->dclk);
+
+			ret = clk_set_parent(vp->dclk, pll_hdmiphy);
+			if (ret < 0)
+				drm_warn(vop2->drm,
+					 "Failed to switch DCLK to HDMI PHY PLL: %d\n",
+					 ret);
+		}
 	}
 
 	clk_set_rate(vp->dclk, clock);

-- 
2.55.0

