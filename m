Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761D92765DF
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 00:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791160739; cv=none; b=f/cIi7+KICDxAaT+5q820YLCHUgL3pnE/ZFlwNdukFXpWkl/ylFyl04gBjsldlUe7kksjeNOs50rlLMyt6mrIRMwx1HNjwmRaaK8jrQ3UEruAiew2TDL5kd2bQ1RmS1dv+hlo6LMX93N5RuGw3cN02WoPskT1kI0YxInTsgcVvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791160739; c=relaxed/simple;
	bh=J2id52QhgWo1E1P95MlPV/yTzEnlNrvgDE2c5comEmM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ovFcaMO8etAkuu3wr3GC5dCATg/TxCu2Rqkqiqj8o0PC/+4qr/8VfHFf+znat7+UC9WKTlJuqKZp7AyvwDSLb84Kvywhh9/DF2VQ1NCte6oEajlCCW3oZyeIEW/hR2Rd1TZYsTSaKJYB7Cmd6TbNtU8JLviUVRRR+QDAtL5io14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=XsdC87PV; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="XsdC87PV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1791160733;
	bh=J2id52QhgWo1E1P95MlPV/yTzEnlNrvgDE2c5comEmM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XsdC87PVNKFeE0XbYdrPikFpYyIh/TWSsEpvBhBCvKpwgNk3A+eSrWnaMVuTL1lx9
	 5MvOIu6mETAm+uzwmNyWVsXkndJs+bps4WM/Dlh2MZcmiKem1LyyC3/pnr+L50t0hn
	 yGpkrZ6AI/I/vR6230ByuCjsnhkKdMo5c//j7ZB9FXhgUGR1/Q97F492gGmnrYLqCI
	 fBLS+X2bYHrLE7j1W6RDb8yxtfQpNd4+1Y30v9HLEE7DRuOohBxAPZJ+If3aQhBnY3
	 ENqyLVfFhCQD1UtVStJRBs/CjaCGJ+UbXbDE14W0rG+FNBpItatK6+6HEP8K5XZ7i6
	 HCVxPqZOIsRgQ==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 366D917E12E5;
	Mon, 05 Oct 2026 02:38:53 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Mon, 05 Oct 2026 03:38:12 +0300
Subject: [PATCH v12 11/16] drm/rockchip: dw_hdmi_qp: Mask RK3576 HPD IRQ in
 io_init
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-dw-hdmi-qp-scramb-v12-11-195157ba0b40@collabora.com>
References: <20261005-dw-hdmi-qp-scramb-v12-0-195157ba0b40@collabora.com>
In-Reply-To: <20261005-dw-hdmi-qp-scramb-v12-0-195157ba0b40@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Algea Cao <algea.cao@rock-chips.com>, Daniel Stone <daniels@collabora.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2

Start with HPD masked, matching RK3588, so the bridge framework controls
when interrupts are armed via hpd_enable().

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index dff400233154..bcfa6646546e 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -432,7 +432,7 @@ static void dw_hdmi_qp_rk3576_io_init(struct rockchip_hdmi_qp *hdmi)
 
 	regmap_write(hdmi->vo_regmap, RK3576_VO0_GRF_SOC_CON14, val);
 
-	val = FIELD_PREP_WM16(RK3576_HDMI_HPD_INT_MSK, 0);
+	val = FIELD_PREP_WM16(RK3576_HDMI_HPD_INT_MSK, 1);
 	regmap_write(hdmi->regmap, RK3576_IOC_MISC_CON0, val);
 }
 

-- 
2.55.0

