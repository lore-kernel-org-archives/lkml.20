Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFA84307AB;
	Wed,  2 Sep 2026 22:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788389669; cv=none; b=BgdD2lF7yDK0BMTcWLBW5sRM4wyIXACllyJsnYS8VJUXJQYU0ufJmq0P+qtJOMs8BUxhPaRCi18QXXG+KvZDQJVMj+A4P8Prlj7x51cP2gW7pGqF6LdgvgwSHaR+x3chRVIe1hUkEngWnwxGqhIH0yt5rdGrjkGjtc2GaIMe0n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788389669; c=relaxed/simple;
	bh=RLXuKnPox06j4wbM9Vn0tJZHFuu37LGXOLpeZ4QJUyk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p4MVS6Gw1cyn4h/JOMw0vdpbrWSlKPCSgcap6JylvAaIdXqPWqXsrt5R0p2MeOGSnuv8Gl7aYXTQBNPVid+1EFhUeUzTPXQGNEqgUoxaNYOx1/oJbeNZ10d9DAaz3cyseLTlWBnxG2DMyw/EN8ovCNOj6Ni0c8oZ1Xdk/XR9v88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Rgsv2oJI; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Rgsv2oJI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788389659;
	bh=RLXuKnPox06j4wbM9Vn0tJZHFuu37LGXOLpeZ4QJUyk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Rgsv2oJIhATirzvnvfZE1KssUpp0VqH4QfwdMIq8S3zFD2p6jbkk8DBLEb9DJWpb6
	 3FLXniYhauu+EeeIzWaSqiuj/bCyHlomO1oTLKBPGjaX9KefBQAU/h+XqB8sD3Zjd3
	 MrTNh4bYo4a6Q3TN5pd/f9JRAaeEQPL69EgRq7jnKUsyi3NIemCpnfJtKIjyJVDf1b
	 JRukLvPgTQCpBUO5qmzRK5ZZYORjSIANyux+Ejj8dIPu04g8iMEu1CX9RUBmVxNefA
	 dhPAIVL56LGtH3I8ZnhQoXjDyJOI1Yhs+83ITf4zc4BVXSs2xqRkd5exeNoznGsm0q
	 BVIfk/SkhP0LA==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6209D17E157F;
	Thu, 03 Sep 2026 00:54:19 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 03 Sep 2026 01:54:18 +0300
Subject: [PATCH v4 11/14] drm/bridge: dw-hdmi-qp: Log resolution and
 refresh rate in atomic_enable()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-dw-hdmi-qp-yuv-v4-11-fb45bf4147eb@collabora.com>
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

The debug entry in the HDMI branch of dw_hdmi_qp_bridge_atomic_enable()
logged the mode field as the fixed 'HDMI' label, giving no information
about the actual display timing being configured.

Extend it to also include the active resolution and refresh rate,
retrieved from the CRTC mode in the incoming atomic state:

  dw_hdmi_qp_bridge_atomic_enable mode=HDMI:1920x1080@50Hz fmt=RGB rate=185625000 bpc=10

This makes the log line self-contained and directly useful when
debugging mode-setting issues, format negotiation, or TMDS rate
mismatches without having to cross-reference a separate mode dump.

Tested-by: Igor Paunovic <royalnet026@gmail.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index cfd1b18c06e6..0e6142301791 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -752,6 +752,8 @@ static void dw_hdmi_qp_bridge_atomic_enable(struct drm_bridge *bridge,
 {
 	struct dw_hdmi_qp *hdmi = bridge->driver_private;
 	struct drm_connector_state *conn_state;
+	const struct drm_display_mode *mode;
+	struct drm_crtc_state *crtc_state;
 	struct drm_connector *connector;
 	unsigned int op_mode;
 
@@ -764,9 +766,15 @@ static void dw_hdmi_qp_bridge_atomic_enable(struct drm_bridge *bridge,
 		return;
 
 	if (connector->display_info.is_hdmi) {
-		dev_dbg(hdmi->dev, "%s mode=HDMI %s rate=%llu bpc=%u\n", __func__,
+		crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
+		mode = &crtc_state->mode;
+		dev_dbg(hdmi->dev,
+			"%s mode=HDMI:%ux%u@%uHz fmt=%s rate=%llu bpc=%u\n",
+			__func__, mode->hdisplay, mode->vdisplay,
+			drm_mode_vrefresh(mode),
 			drm_hdmi_connector_get_output_format_name(conn_state->hdmi.output_format),
 			conn_state->hdmi.tmds_char_rate, conn_state->hdmi.output_bpc);
+
 		op_mode = 0;
 		hdmi->tmds_char_rate = conn_state->hdmi.tmds_char_rate;
 	} else {

-- 
2.55.0

