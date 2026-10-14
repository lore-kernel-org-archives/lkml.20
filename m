Received: from mail-244107.protonmail.ch (mail-244107.protonmail.ch [109.224.244.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F9F4A8A32
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791963911; cv=none; b=KeN/17Xt3w1pnRlybT67TsFtwP8sn/yxHJm3+0Wp5MQo0q8ciNzlojK9gjUCRwBcLPY8FXNZBJvHO3xomgvX/eCJ3fwriJH6DqYSNnfGxHSb9dVC2nFBJvYrgt6MkYyHemr7SeZinoDUnz2Ui0X2gkGkVB55qy82ts1xpSZAp8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791963911; c=relaxed/simple;
	bh=NyE7z2N8QjVqzEVcr4pRB09Epc3pJIKXEuCw0oox6hA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VySG37sPOKyFtkpvUoCGA39lWe93xEupTKErd1KwKek8QXW3B0oBavAt1JFh/pHfGkpEocZVN0wmT5iDZEFS3gInQrlqM5dKjLBgzwEYSA1++VxE+OWasEJPhNindeNs/Y2X5LhrlzdLDyQ2PmpYzRq3U4NC/5cJDQwLXiIZ3dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=OuM6zs92; arc=none smtp.client-ip=109.224.244.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="OuM6zs92"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1791963898; x=1792223098;
	bh=jCDXjLH0o/GE9MYk15qJL+R9WHE85tel9vXZOFjSplw=;
	h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=OuM6zs92EUTSEEtxdypaMHqyl8ScH8Y7m3KZN+oNo5uXhiBVgDvgpZSECDc5/Wk6i
	 NnnFb51/FEZrQrJwGSi6tSI61YsS2vnC0vVIuWy07I5D9aE+3mwTa+FWKi1b/i74Wm
	 3tX6zzCMxq5QTMRbHi8Q+hqeuNGODXRzQLDvE8pkUeIrP4QYMbvH0gomIloq407BO7
	 r23uFY4Eax5ZrJUqiEgxIgoiHrQ0WXT3eSExzfKF5stBr6zeBqGGOH7C8B5brDnxXM
	 HA9wROo+0hEKZ5ZNYXbpqirxbAmk0SI3ga9vQmpFA7D8TZIx7PirwjB3KoAJnZFmT5
	 cIpj78MrPfr/Q==
X-Pm-Submission-Id: 4j4NX82fL9z2ScWt
From: Esben Haabendal <esben@geanix.com>
Date: Wed, 14 Oct 2026 09:44:43 +0200
Subject: [PATCH RESEND v4 2/4] drm/bridge: nwl-dsi: Limit LCDIF specific
 sync override
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-nwl-dsi-fixes-v4-2-b9138ea5e12c@geanix.com>
References: <20261014-nwl-dsi-fixes-v4-0-b9138ea5e12c@geanix.com>
In-Reply-To: <20261014-nwl-dsi-fixes-v4-0-b9138ea5e12c@geanix.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Fabio Estevam <festevam@gmail.com>, Robert Chiras <robert.chiras@nxp.com>, 
 Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791963890; l=1455;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=NyE7z2N8QjVqzEVcr4pRB09Epc3pJIKXEuCw0oox6hA=;
 b=1Uzjb6LsfQdYIbNXGsFf52PTqltwbCRqiP3Da9MJJVBDXqJ9qxx294v1yrcNRyol7AqoyukEx
 rIHGKFIWil+DhpiYtzr0Xm4EkvVfc4596AdUDqqFm9Zb+2us3nPLL8x
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=

When using DCSS with NWL, overriding the mode flags to enforce active high
sync is preventing the use of active low with downstream bridges, such as
ti-sn65dsi83, which will not see such mode flags set by the panel.

Fixes: 44cfc6233447 ("drm/bridge: Add NWL MIPI DSI host controller support")
Cc: stable@vger.kernel.org
Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 drivers/gpu/drm/bridge/nwl-dsi.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
index 80e26a947ae6..1aab46e1a168 100644
--- a/drivers/gpu/drm/bridge/nwl-dsi.c
+++ b/drivers/gpu/drm/bridge/nwl-dsi.c
@@ -823,10 +823,13 @@ static int nwl_dsi_bridge_atomic_check(struct drm_bridge *bridge,
 				       struct drm_connector_state *conn_state)
 {
 	struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
+	struct nwl_dsi *dsi = bridge_to_dsi(bridge);
 
 	/* At least LCDIF + NWL needs active high sync */
-	adjusted_mode->flags |= (DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
-	adjusted_mode->flags &= ~(DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
+	if (dsi->endpoint == NWL_DSI_ENDPOINT_LCDIF) {
+		adjusted_mode->flags |= (DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
+		adjusted_mode->flags &= ~(DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
+	}
 
 	/*
 	 * Do a full modeset if crtc_state->active is changed to be true.

-- 
2.56.0

