Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE0B563FAA;
	Tue, 13 Oct 2026 22:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791931936; cv=none; b=UeiFKTdZ7CSQV+KFyd+Ccy3RLbeVQqHc5Jj3f46tDYf3kZlXh3Ff7OsYADrpzP2a9Qzqa1TL89HkuYAcmsIhKbmxlyCRx12SfrCvh52YpXr/eePZ5bVI+iawjZC7pluIMRGg8DeAFv7ncr2rWMI6DCD7RCCumLOvB0WW3x6c9vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791931936; c=relaxed/simple;
	bh=dbYuYcmwWQ0Rwvy6m5XUxd+zzK5ANGcRgXEHBixh4O0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NAZjh1pNVB9JUxJiK0N2GuFECkK3fZxPTpDW1nB0MU8JuO4uvB1qkQApPg3DZfP83W7Uo+pxx+ZpzQ5J7jcjKsdSoEGxl8n3Soyd2DJP1u4PgTT821mtpL1l9EmwmrfKEfXvD7MGN1kg2ukwP+uFd3PdLhsYZWCVEzPrIAnnj54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=WYY2kXW7; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="WYY2kXW7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1791931918;
	bh=dbYuYcmwWQ0Rwvy6m5XUxd+zzK5ANGcRgXEHBixh4O0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WYY2kXW7I/2TbIG3X6zK7WLe7rJ3GlD+ZbNj9xcEDCg9s4qyB+g0eY7KcjyzZpzro
	 uiMFXEDCjSXPhf0uO1td8t/sjWDYnZ+akEduPmWie8EgoDFLzGkcdA6784nt77dGbS
	 NZmiTNnt+6r/D1BcQhotpw4lYE0M25l1X0Ru8rN/FCWlA/5YIUxGB3zDddSwYb6WVk
	 uLK+P+gAAjmh1uspennkyGKXxBVf7JAcEf+tIuFkJEwGC8/SZ/o15VBBgUUgFEKmg0
	 erUuDjHLVPKWdybKrKJUIsXrxLJzcjr0Qnw7AVXDJW+oVfdM7Qa6z5JZpxmpaGXF29
	 bdFsblqkVrJoQ==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 605D217E14EF;
	Wed, 14 Oct 2026 00:51:58 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 14 Oct 2026 01:51:28 +0300
Subject: [PATCH v5 11/15] drm/bridge: dw-hdmi-qp: Log resolution and
 refresh rate in atomic_enable()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-dw-hdmi-qp-yuv-v5-11-6fab0fe43a9b@collabora.com>
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

The debug entry in the HDMI branch of dw_hdmi_qp_bridge_atomic_enable()
previously printed the literal string 'HDMI' as the mode field, giving
no information about the actual display timing being configured.

Extend it to include the active resolution and refresh rate by
retrieving the CRTC mode from the incoming atomic state:

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
index b268c9376087..c6551f4cbf93 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -539,6 +539,8 @@ static void dw_hdmi_qp_bridge_atomic_enable(struct drm_bridge *bridge,
 {
 	struct dw_hdmi_qp *hdmi = bridge->driver_private;
 	struct drm_connector_state *conn_state;
+	const struct drm_display_mode *mode;
+	struct drm_crtc_state *crtc_state;
 	struct drm_connector *connector;
 	unsigned int op_mode;
 	int ret;
@@ -552,6 +554,9 @@ static void dw_hdmi_qp_bridge_atomic_enable(struct drm_bridge *bridge,
 		return;
 
 	if (connector->display_info.is_hdmi) {
+		crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
+		mode = &crtc_state->mode;
+
 		op_mode = 0;
 		hdmi->tmds_char_rate = conn_state->hdmi.tmds_char_rate;
 
@@ -559,7 +564,10 @@ static void dw_hdmi_qp_bridge_atomic_enable(struct drm_bridge *bridge,
 		if (ret)
 			dev_warn(hdmi->dev, "Failed to enable scrambling: %d\n", ret);
 
-		dev_dbg(hdmi->dev, "%s mode=HDMI %s rate=%llu bpc=%u scramb=%d\n", __func__,
+		dev_dbg(hdmi->dev,
+			"%s mode=HDMI:%ux%u@%uHz fmt=%s rate=%llu bpc=%u scramb=%d\n",
+			__func__, mode->hdisplay, mode->vdisplay,
+			drm_mode_vrefresh(mode),
 			drm_hdmi_connector_get_output_format_name(conn_state->hdmi.output_format),
 			conn_state->hdmi.tmds_char_rate, conn_state->hdmi.output_bpc,
 			connector->hdmi.scrambler_enabled);

-- 
2.55.0

