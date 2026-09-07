Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2D4483BDB
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788780533; cv=none; b=Cv8rK5cvur51RBj1KjDiMAiqsByiRhSDrAJEkjm+gFdpaZgQkSk9kq2i7n/slzvYG2bO2fepDbFmaSmecHwBpW46az1se2MGbebQy65FBloJjTG2M1ZniU30sl9EqSrww+CBBb8hDYgxlFs8t/tyOpGZUVgg/yMDLpHH5prwRZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788780533; c=relaxed/simple;
	bh=b9e4M5MSV78pVi7NRo8tV43LAYvKMk3nxGY273xN9cQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FuprDjwW42wvxBJtv7qWCpy7eLxAgy/xAOA/oziYgRoFkE7UYKoL3aF3GJvaC3u0uSXCywuiBXxJOkbLSkOz5fXRxdZ0Eka6c+MpDMGy+MI+ChDM6iqHjhHEm5maqFciGRyhzinhNdw6q9dsvJRSOSaRlWRJywf/EZTuKueGCiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=n8bG4hiG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="n8bG4hiG"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 836754B0;
	Mon,  7 Sep 2026 13:26:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788780420;
	bh=b9e4M5MSV78pVi7NRo8tV43LAYvKMk3nxGY273xN9cQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=n8bG4hiGXXhl54LCKRH3pT2zEFqyzVU9QAM1DXU41YkZ8PchHBfQdjS0bPzQ1hTwn
	 ITDjGXC+Prso/lAniNBwN3Al/69nPaHDePsxpWXSj+kKQ7gEDGDycIV1yOcA2mZOfo
	 w8aX9otGpdmcJusc3Y4UEb73cZQzC3rjTUU7267I=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Mon, 07 Sep 2026 14:28:07 +0300
Subject: [PATCH v4 12/13] drm/bridge: tc358762: Set DE_POL and DCLK_POL
 properly
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-tc358762-fixes-v4-12-e3fc3ab5cd83@ideasonboard.com>
References: <20260907-tc358762-fixes-v4-0-e3fc3ab5cd83@ideasonboard.com>
In-Reply-To: <20260907-tc358762-fixes-v4-0-e3fc3ab5cd83@ideasonboard.com>
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
 bh=b9e4M5MSV78pVi7NRo8tV43LAYvKMk3nxGY273xN9cQ=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqnp/Vv7LM78sgJqO0pIjNliImgTYMTQb7mTDaf
 yMXZWtq1XmJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCap6f1QAKCRD6PaqMvJYe
 9XUEEACyZ9Fq6wTu9bfEPErDolZSUPBcLCSdSLCmawnWsmD9vSK9as4vytViYjFf5Kvr9qZ7u79
 8M8qaI0Ftyh+H1AN6rEp2hA4wFoRIQb2j6cjad9tskucguBPqdh4ncsa90v4Rb0Vohoz5vAOPbx
 6eg3I3boUfWKRNbiGgGb8wMaeyPWz8lo3Lf8swFMCyrUc2RF7eU3oNsEExpAFcPJBTcoBtpxC7E
 91l/XI/85f+aNN2J2KMp0QJAwCASVCop0eutqsu0t7oSHfhu2yA2npil/TY6XinTzi/eO3WaKDY
 6BfalDDhIJa+AovjBWADz2sOA4Sr1uvQAkEZIEgiMaP3qq3G9p1SI4T3laZ/Yu8GEMqUHGSn0jF
 wsWrCLCdYzIqeggd+xWJPzMSgUwCs9IxAnRzjlmq+5rbcoa03QlRt1UR23A2Q2AcjuUT8uo62Ys
 RYux0VgQ5Nr/rNT2pxhlTYWcHFcjqy5PgYR0VrlWP9FdUQq/sHeMp36Ok1+jMRqufVh73cX+snv
 aBIHW/PfnkRLIwbjvOLbt9TTtmsDoPHAEiY5Zk8Wy8t+W8fFq+Sb2qaNEH2npNB5BejhshCt3S1
 XnneEbDsOj/2e59lnDWULCufamLerCshCJ5VEw4vJathOTF6eX6sSUkigmReREtOIK79ZwI2hqv
 UvfCAbKppD/n6hg==
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
index ad3a2620ce47..25b719cd66fe 100644
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

