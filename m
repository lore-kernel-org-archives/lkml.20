Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793840470;
	b=qkPUoN9K8s0kCB7hwZwhX4NJksjaoP6v4WhyNm6NONkrQRhaMnG9ERqPLPGi6fSt0N0w
	 iTEDtJn25t9tuFF2mFWNYZfrHXlIw29VljyEEUQgypYhPJMWiGaE+4KwuLIhpTScdGx6C
	 dFXb0gKeIaTbMHqbPEO0PGjOoXm1hk9RaQVAk9hASb16iGfEyvIqLb/lvBUUeD/31+FMl
	 7V0Uq2jmBqKlP4pb1Zn3JwP2bX4Cl4NGTZuva1a7QPPRtp7CQBxBJhnHYfXhMQaSZbMks
	 7ydmzi9a+w5idY0uDz9aoi1RLCs4Xfy4qx0bvmD++v8rebTtEJEB7efsFGKyuUVGpPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793840470;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=JaCz2pjwdhmbPvoQWJsq8h33NIOafU4tbDW1Meto1jk=;
	b=kIFdxgqKtPGawtW9DG3HlMbFVhcV2AYNRBYx31yxmBcFzPl6pZkf4Ugzo5xr+2kLzmrv
	 OImSHB7oi5OiWuO2N/CIoW5D8boyp82Wa6tKLMhzrbAv81iTSsa6pGbHf5Wu0E2cM6dFT
	 dlXPfroTeWsgyhpQNMsKa+El0hv1Ug1pX8Cgx8scv7qcfD7MQjZ6iN6CyilNGrjxrZAoU
	 F59ROG9R6VHUud2c51R1XRSa3kHw+5XmvJoKj+2nKEuhFnDXHe+crPRE/IeLV+x+mrIAC
	 vE/7pWY/1UkVKpUhFVs3bA0gps4m2by3TXoifs2buT5oW9mZAmVadm/pzDgMBPBgqJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Yh5Hi3oc;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C18606D801;
	Thu,  5 Nov 2026 01:01:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4C18606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Yh5Hi3oc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793840468;
	bh=mWgrnwl5Shcis6cfVvrP/tZHq/7rzXTp7ZFtzMbA1Qo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Yh5Hi3octqZQeb54H/wJxy+ZaxzNe+0Q8+YgonE3u4ml94QUEZjxVtoKc7wKa7l8i
	 GzEC/u39Nv+e8YdxeHxYTTeycSdicS9eukHEX5cpAvh0pPLObG+r/1LNxLsEfEs/Mc
	 UpjmIsQFubALnX3r3pZ5E/URoeXbPyRoLZ22ts+BrfBZ1czKqpGdcW2JV3xmd8uTUX
	 7+ovWhnaauRSsT6HCZw7NnvK/5qQh1uUYwRMMRlZeh9KBcVir0y3ZNj+RRVe3dsVEu
	 CESmKJhMW7xfRX0MiVs5WCN+6OLfzmL2QFAawCQTmhAfEe8YDbl0jd45hfxV8VjJsp
	 vNPRNWowguBoQ==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 37C6817E0D13;
	Thu, 05 Nov 2026 02:01:08 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 05 Nov 2026 03:00:37 +0200
Subject: [PATCH v6 03/15] drm/rockchip: vop2: Disable core clocks before
 dropping runtime PM reference
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
Message-Id: <20261105-dw-hdmi-qp-yuv-v6-3-1bb63ef5766e@collabora.com>
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
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2

vop2_enable() acquires the runtime PM reference before enabling the core
clocks, and its error path releases them in the reverse order.  However,
vop2_disable() drops the runtime PM reference first, potentially
powering off the VOP power domain while the core clocks are still
running.

Make the teardown mirror the bring-up sequence by disabling the core
clocks before calling pm_runtime_put_sync().

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/sashiko-outbox-170627@kernel.org/
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index e0caea93a896..bc14ca9d598d 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -955,11 +955,11 @@ static void vop2_disable(struct vop2 *vop2)
 {
 	rockchip_drm_dma_detach_device(vop2->drm, vop2->dev);
 
-	pm_runtime_put_sync(vop2->dev);
-
 	regcache_drop_region(vop2->map, 0, vop2_regmap_config.max_register);
 
 	vop2_core_clks_disable_unprepare(vop2);
+
+	pm_runtime_put_sync(vop2->dev);
 }
 
 static bool vop2_vp_dsp_lut_is_enabled(struct vop2_video_port *vp)

-- 
2.55.0

