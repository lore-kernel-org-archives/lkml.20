Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF8A2561A2
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 00:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791160742; cv=none; b=okSlntZKcjlINhgQVmRflN1Zc5+CQc3Z5iaxMNN/JpZV8iiR+S5PpyBx+6LVLyFZfAMClMs5vWa07mS0gE+iXcr+zIhW/lq4ackl+hful1Kp9zyklYBc2nRfzNcjJHnOxCyh3TQfon9kMF3IJuK520qnk5CLu5vPuX+49l0TRdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791160742; c=relaxed/simple;
	bh=CEmFIxcW5jMhb33b5/3+j7ej/shN2i0E61ZoLgFe8A0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UPzZT113JMGRs/JcVYo6zclKTqgCoBdaVyeqC5AlHTCT+K/KBslxhhLaGTqK3mREBAtW6OcFX62XzKl+JShfLCRBJfXJoGLrbAiFTYIvRB6/ykzAwyzYjyMj6iy/L/BqqnPUak+K9KlNiKze0KAAHxNhLGj/muqV0rGougSg74c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=CL2M6mKZ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="CL2M6mKZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1791160731;
	bh=CEmFIxcW5jMhb33b5/3+j7ej/shN2i0E61ZoLgFe8A0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CL2M6mKZMdxcxjfmoGMz69ZGdZRldZy3JNytW3rPTaF8WLtSuEzvu3SlowAXOUZzD
	 VGPYDNrcEkV24orRFzim+rbd+Bys6gGxSwz6Lr7/iQ8y9H66gZIrtyAqRXd4M/kHPC
	 NaTkXB+4Yhr9kdfQkCRl80R5S6k/RITuqN1iCTEb/A0hXq7nI0DN33efLTRS7JJu1n
	 3xMz0d8Ph4okw69o5TfT/6AzMojIdfYyM4ZQym1keVLW3S6gRj9kyHCtQsRuSRc2YZ
	 ukj72B/Dww+VMOBp5LQI0BGAsJCoOxsCgVyP/stqXYRBkcHkl7T9+00ISK/QnQvwmD
	 fyQl9NifVTqoA==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1FC3517E1023;
	Mon, 05 Oct 2026 02:38:51 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Mon, 05 Oct 2026 03:38:09 +0300
Subject: [PATCH v12 08/16] drm/rockchip: dw_hdmi_qp: Add missing newlines
 in dev_err_probe() messages
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261005-dw-hdmi-qp-scramb-v12-8-195157ba0b40@collabora.com>
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
 linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maud_spierings@hotmail.com>, 
 Diederik de Haas <diederik@cknow-tech.com>, 
 =?utf-8?q?Robin_R=C3=A4ber?= <robin.raebi@gmail.com>, 
 Igor Paunovic <royalnet026@gmail.com>
X-Mailer: b4 0.15.2

Add the missing trailing newlines to a couple of dev_err_probe() calls
in dw_hdmi_qp_rockchip_bind().

Fixes: b6736a4ea3fa ("drm/rockchip: dw_hdmi_qp: Improve error handling with dev_err_probe()")
Fixes: e1f7b7cbd74c ("drm/rockchip: dw_hdmi_qp: Switch to drmm_encoder_init()")
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Maud Spierings <maud_spierings@hotmail.com>
Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # NanoPC-T6 LTS, Rock 5B
Tested-by: Robin Räber <robin.raebi@gmail.com>
Tested-by: Igor Paunovic <royalnet026@gmail.com> # RK3588 Orange Pi 5 Plus, dual HDMI
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index 42f2627e1a05..df0e2bb1eedc 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -681,12 +681,12 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 	drm_encoder_helper_add(encoder, &dw_hdmi_qp_rockchip_encoder_helper_funcs);
 	ret = drmm_encoder_init(drm, encoder, NULL, DRM_MODE_ENCODER_TMDS, NULL);
 	if (ret)
-		return dev_err_probe(hdmi->dev, ret, "Failed to init encoder");
+		return dev_err_probe(hdmi->dev, ret, "Failed to init encoder\n");
 
 	hdmi->hdmi = dw_hdmi_qp_bind(pdev, encoder, &plat_data);
 	if (IS_ERR(hdmi->hdmi))
 		return dev_err_probe(hdmi->dev, PTR_ERR(hdmi->hdmi),
-				     "Failed to bind dw-hdmi-qp");
+				     "Failed to bind dw-hdmi-qp\n");
 
 	connector = drm_bridge_connector_init(drm, encoder);
 	if (IS_ERR(connector))

-- 
2.55.0

