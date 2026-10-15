Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4D84D5984
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792063019; cv=none; b=qBZHPTsetEdD60e4dlDrrChZS7hJR7Ew9H1BArjFAGlJ4pxgncjnY5aRVjJUVn2rBtT7d+Qo1tfbb0YF/98xGqEwas9hk3iBxIx+c9la8iZ2J4Pvmr3Ccc4OMDl17tdBqt1NKuAp9/Tnhw5HJooZoxR8WI05Vz9siPRsGA2uxGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792063019; c=relaxed/simple;
	bh=WcUMVWweb5f3swf9yKUqGoVDO5r8H/qimMUgyzAtyXQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HWvmM1JqPDd6B2F5wiF7Py5zkBNj63B47M+c6usOmXsCC3tmdeb9mvAeRyjRa1v6upI8eDyFTiLAljgxSaNZMKhJP27JHL59tIwD0JYZtRARotR/1jzsFtTSwj8JUYE1BZDN7L5AOjQ2CXHBp/Hzs8Uxa4sHQGYCg/PeB33l/Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RREF5pKN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RREF5pKN"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6B66A4F1;
	Thu, 15 Oct 2026 13:14:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1792062876;
	bh=WcUMVWweb5f3swf9yKUqGoVDO5r8H/qimMUgyzAtyXQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RREF5pKNe5swA+BS/Nj4mxZFtW+CxEXyJl7Sy2DEP7uCs1a0FR02OX39L+wHC2iQV
	 vcY5UUV7v4qCSoo9sOhZTxdE7IBlG/NKZNYqucMVtSzYDCPlhrVCBTMt4ljXOnd/Ct
	 HknobpsrCGYF6O8lq/3/D8dIdh+X66OOfBF22o6o=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 15 Oct 2026 14:16:03 +0300
Subject: [PATCH v5 12/13] drm/bridge: tc358762: Set DE_POL and DCLK_POL
 properly
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-tc358762-fixes-v5-12-7cd721a6451b@ideasonboard.com>
References: <20261015-tc358762-fixes-v5-0-7cd721a6451b@ideasonboard.com>
In-Reply-To: <20261015-tc358762-fixes-v5-0-7cd721a6451b@ideasonboard.com>
To: Marek Vasut <marex@denx.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2009;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=WcUMVWweb5f3swf9yKUqGoVDO5r8H/qimMUgyzAtyXQ=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBq0LYI8nRBuy9YExz+dQqxuVtKqII8+bBrL/TCe
 COLDduReYCJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCatC2CAAKCRD6PaqMvJYe
 9QiEEACv/uAbwbzqr5meeYt8HhYiFtLb4do0deiqi4HcWm0VZnfBUCX2JNtXTh3VK3cTwlWnApZ
 Qz2ItKM05uAhKjspsxDmB3a0fy4drW+YiX8J7uu63+pwrK8dB+1j/w3B/QNjyxRaQ5yTNSx2PJl
 fNUOzZG9BCKVF1ohDETxrMmNMz0/f6piIKnPqVUGGHusDq3WjI2aCTO5koyIu070i0GpYwcoMGh
 IDeUnAs4VXC8cAGKCyhMJKtDYdxRFaaOltK24wyr1pWr6seNdSGCr6S92U4nk8q515Xx6Wfi7Mz
 6jF4weShfHyQbL3o3Vt+uws1hg6aVT4AwEsvsJ5affi0TDCupEj27o5zOgtZGETCC9fZUbm1kqj
 tf97lnWBNT1nE+beMMijM9kemghc4QkjyGWJmVpjd7BPZ9Y35eULluCWJFzQpHRRjyF0ep5oeK2
 gwAy48xL6xZO9Kq+o7hTfdfvnonwfIuJce0+X7Ga5nbXf4QSq9X0kfW8IeEWzytktIPW/dYIcla
 bKYaJ3jD/yOjp1EGNFN6fL43Eg5hnCJdJbE70R96wvd5xyHe8O8rCTKe7cjNoVNSzUnUebAWYRV
 hXH+uiwepo2ErJnHkfp345jr/V4e4LgtQgN9ab8K+LkKYle2ITAo0oP4D2U1a4o9njczqoY+vvJ
 R6t2KNkWJIEdM6w==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

The driver hardcodes LCDCTRL_DCLK_POL and ~DE_POL, ignoring what the
panel actuall wants. Fix this by looking at the
bridge_state->output_bus_cfg.flags, and set the polarities correctly.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/tc358762.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
index 33312300e606..e73be376e33c 100644
--- a/drivers/gpu/drm/bridge/tc358762.c
+++ b/drivers/gpu/drm/bridge/tc358762.c
@@ -186,12 +186,15 @@ static void tc358762_enable(struct drm_bridge *bridge,
 {
 	struct tc358762 *ctx = bridge_to_tc358762(bridge);
 	struct drm_connector_state *conn_state;
+	struct drm_bridge_state *bridge_state;
 	struct drm_crtc_state *crtc_state;
 	struct drm_connector *connector;
 	struct drm_display_mode *mode;
 	u32 lcdctrl;
 	int ret;
 
+	bridge_state = drm_atomic_get_new_bridge_state(state, bridge);
+
 	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
 	conn_state = drm_atomic_get_new_connector_state(state, connector);
 	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
@@ -243,7 +246,9 @@ static void tc358762_enable(struct drm_bridge *bridge,
 	if (ctx->use_vtg)
 		lcdctrl |= LCDCTRL_VTGEN;
 
-	lcdctrl |= LCDCTRL_DCLK_POL;
+	/* Note: DCLK_POL affects pixdata, de and syncs */
+	if (bridge_state->output_bus_cfg.flags & DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE)
+		lcdctrl |= LCDCTRL_DCLK_POL;
 
 	if (mode->flags & DRM_MODE_FLAG_PHSYNC)
 		lcdctrl |= LCDCTRL_HSYNC_POL;
@@ -251,6 +256,9 @@ static void tc358762_enable(struct drm_bridge *bridge,
 	if (mode->flags & DRM_MODE_FLAG_PVSYNC)
 		lcdctrl |= LCDCTRL_VSYNC_POL;
 
+	if (bridge_state->output_bus_cfg.flags & DRM_BUS_FLAG_DE_LOW)
+		lcdctrl |= LCDCTRL_DE_POL;
+
 	tc358762_write(ctx, LCDCTRL, lcdctrl);
 
 	tc358762_write(ctx, PPI_STARTPPI, PPI_STARTPPI_STARTPPI);

-- 
2.43.0

