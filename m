Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793840476;
	b=lxMD1GAyz9+ng6UCZ2q9vINNNt7uPEHWSHiaRnlCq68yRu+YDOHeia+dtPBXtCl/63MC
	 /TJgLheIBHecfQ58uVhiu3w9UBst9fP25paKX7DkF5OltE/ptVWUcLCIVyKiIGGdlmIca
	 6Ronyn8VJE6gvbT/K//e6kXaSgryh6RFEyrXvIKy2vdIWd7G4GXA0BF1xeb0JXfBhDDJL
	 jgun1Pcam3R/3cJPVfhtpvD7UOqGgJH1QolkSsUauMdgl1KvZDQTg77wqYmhFDzH8qqjJ
	 OV2Fxv8hioVO0KV4BQBDKK+h47Gl/LM0nmbnc0Kn6tN1KnVC+4gFCLroDHdFHHwlnDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793840476;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=O50/RPW38+N8i5gjSk+TqiFc1u8BMhD1yRooJzVaNj4=;
	b=Fi2/l3ORUJGIbOoadyz8gNsHvVHnJmY9avlCNRC1sQAdgper203C0a5rFh8a/uXj6eqb
	 0DZNIRY6bwQlUsfLbjZVebhro628hn943+DH1CvcjdQ6Ormdmraeae0xCNRrELpq2grVi
	 /AM5sfmEcP4Osn4Or5xJQPLvamenUxctQBeHVj9Mq81Q6NWTILLy2s5UiF/22ZTjUQhPi
	 qjEFZiVXpZuOIqrpnyDQtUwYNRU570QrX/8WxuPeBGdxYQTQVYwCJ+lL3H27z5ON4crnr
	 SvcliMjcl7JkbQJH/3Fb2QRz6dP3uBhQtcBdZ3aXS/dTahb7HAnBS+HJaBmdVu/2rrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=igTkkW+e;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D42606EEA9;
	Thu,  5 Nov 2026 01:01:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2D42606EEA9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=igTkkW+e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793840474;
	bh=fK5c5ENnVBF9Cbe0Gx7/q+sFZIPn1Kn5+5RFTv/gG2g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=igTkkW+ew6DQUksmViomveI/6C6QialiidTjFeRoCM0AFXDpNyBRYvf2Z2HNkHXVF
	 r6sHOtQbwXg1Ca2khWSgPRDh3bzZPGFNvh6r5lww1fZavswx9rUepwmRALn8INUs/u
	 /CMQKlHBSaiOvfvHXz3+W8NuHb8gWPQoivLsTGDlnSok1Y1OHSW1WLEJDpZ9lyXQcb
	 Zo9HhS19w7WaQfV5QCEOwHfHmrd5jjWMc9oq4F42yqjuwB+a1yr+yTgjLHplWDZ60V
	 EELvYEtW9gqk5m9GcpC9bakGGDtQaA9lX3hWDPmg5ugzOgWnieyAIKomOdJUuHwKjV
	 eXSy1tXVu7P+A==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4103417E02F2;
	Thu, 05 Nov 2026 02:01:14 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 05 Nov 2026 03:00:45 +0200
Subject: [PATCH v6 11/15] drm/bridge: dw-hdmi-qp: Log resolution and
 refresh rate in atomic_enable()
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
Message-Id: <20261105-dw-hdmi-qp-yuv-v6-11-1bb63ef5766e@collabora.com>
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
Reviewed-by: Daniel Stone <daniels@collabora.com>
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

