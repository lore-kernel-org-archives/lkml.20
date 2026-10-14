Received: from mail-244106.protonmail.ch (mail-244106.protonmail.ch [109.224.244.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80B849EC61
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791963922; cv=none; b=G3udbnlrgot4S5EHdDTZphRZKPpexHcY/t0AsC/GBNhY4DgrhnM9G5PFFUvz4mhEsm2/f/56UQQUg4JZ0GovffYfMY6nzFjMmA9ozwTZV6c++F+Y9CzRtftLEZ4kLHN7vmxZYpJGcLapJ3iGUCDoHnYBLfFIGiAkIkkJtMPVvRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791963922; c=relaxed/simple;
	bh=t4uJa7B2gn7DVC3zYIMzIN8iYuoKuqYyGjn6xsB/n3c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KKrMKwXQX8QQAd+42JFCNobx+KWbV8/iu1dJcvwGOFcuHFXw5wJIy84JcRzkKxZaTbzyL09h8DcS0TKsz/Tk/hxfVxIMuXXyjsG5dmnVcklN4BvbUTf2umros57fHi0xBQyn6wGHGYQy0j6knrQM+hSiYUc1WCqcYR6duCK7TSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=c+5sWshy; arc=none smtp.client-ip=109.224.244.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="c+5sWshy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1791963900; x=1792223100;
	bh=0J4sh4csOcn3zKERB6o1fbX9FtthYRH58NuaSeRekLI=;
	h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=c+5sWshyMQncl2L3LT6dSL/EKpkMoMTQQMmryuiSSJmH29pskYnQ+2GsnNNj5rwMF
	 Ug3jWmIOZdmLYJz+zwLWcxm9X1QJVtlJ/jrWYKxYVnu5PZCeS+qvR9IEqWx+2uHmgq
	 LwTYffGZQQBV7W3h96p/z/yYrGPxo7iL+yyIo6eBvRahrkwAxYT6DuTNCng3Xc0oNN
	 u7E3Eb+yAPySH9oVPVNkY5rgAqm0j50z3MBka0FUiPMYe8AknjwtIbRWtE+VAtm7ad
	 8yrwJO16qOX+8jY/HnZx73PR6Ko8NnZxgb6sMTmthJaYbeLw5SOA1Wd0H6wcH/o4HC
	 p/cxlaQeSNAag==
X-Pm-Submission-Id: 4j4NXB72pGz1DDLm
From: Esben Haabendal <esben@geanix.com>
Date: Wed, 14 Oct 2026 09:44:44 +0200
Subject: [PATCH RESEND v4 3/4] drm/bridge: nwl-dsi: Correct auto-insert
 EOTP behavior
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-nwl-dsi-fixes-v4-3-b9138ea5e12c@geanix.com>
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
 stable@vger.kernel.org, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791963890; l=1534;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=ph/ko3JZuF/EGwW8CMFFQ2PCEUquZd0uUQmZBRXKKT0=;
 b=g3xAhBhs1nP3jD7qEDuvgH/Ez0EBlVa15PCrsH+2UhGLeF+v/OTntYTAVfmS2Sq/usCFS/NQG
 irMmo6AkimyAXc16Z2AfYX20B7kN2Dkx2ivw4H0TwT2YBQqKrGLMBkX
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=

From: Robert Chiras <robert.chiras@nxp.com>

In order to respect the DSI protocol, make sure that auto-insert EOTP is
enabled according to the NO_EOT_PACKET flag instead of the
CLOCK_NON_CONTINUOUS flag.

Fixes: 44cfc6233447 ("drm/bridge: Add NWL MIPI DSI host controller support")
Cc: stable@vger.kernel.org
Signed-off-by: Esben Haabendal <esben@geanix.com>
Cc: Robert Chiras <robert.chiras@nxp.com>
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
 drivers/gpu/drm/bridge/nwl-dsi.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
index 1aab46e1a168..f3f4334136c0 100644
--- a/drivers/gpu/drm/bridge/nwl-dsi.c
+++ b/drivers/gpu/drm/bridge/nwl-dsi.c
@@ -222,13 +222,15 @@ static int nwl_dsi_config_host(struct nwl_dsi *dsi)
 	DRM_DEV_DEBUG_DRIVER(dsi->dev, "DSI Lanes %d\n", dsi->lanes);
 	nwl_dsi_write(dsi, NWL_DSI_CFG_NUM_LANES, dsi->lanes - 1);
 
-	if (dsi->dsi_mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS) {
+	if (dsi->dsi_mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS)
 		nwl_dsi_write(dsi, NWL_DSI_CFG_NONCONTINUOUS_CLK, 0x01);
-		nwl_dsi_write(dsi, NWL_DSI_CFG_AUTOINSERT_EOTP, 0x01);
-	} else {
+	else
 		nwl_dsi_write(dsi, NWL_DSI_CFG_NONCONTINUOUS_CLK, 0x00);
+
+	if (dsi->dsi_mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET)
 		nwl_dsi_write(dsi, NWL_DSI_CFG_AUTOINSERT_EOTP, 0x00);
-	}
+	else
+		nwl_dsi_write(dsi, NWL_DSI_CFG_AUTOINSERT_EOTP, 0x01);
 
 	/* values in byte clock cycles */
 	cycles = ui2bc(cfg->clk_pre);

-- 
2.56.0

