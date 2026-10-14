Received: from mail-43170.protonmail.ch (mail-43170.protonmail.ch [185.70.43.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F92F49AA24
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791963913; cv=none; b=jWIxLXNAzQZfveoqGWsNnF9fs+WFRSG3YzQkQj2bW+q5ujax+ooUMzxYM5j80Qv+8cg7DuoIYFzJpJ8OmFI1Nmfx2MXDlK9wmj6VOBbDW/VWyp+c6qNsMMRKOnheydntBQvVwaXAwLBwqAVzl76YgTDv94PupeXOjzcXOkhMt4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791963913; c=relaxed/simple;
	bh=VnH57TThUBRrumoSPfKBCfwJnaCqBhJHzReWomjxIyg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PswJ1DaXi4h0vtpDtvr5EHzAz8f+oll4T0vc3woXOjiJZvXbgGN7BPwH1k9Ad7cwY7MQ6hTeBwEUpNhNv4WxI0anTjgvYVQmTM0AwOlEP7bWlEl/spZaqseXq1EX6q2e0A00tQESNIz0WQX+HTykNT3fxSEGmKeGSsdl2K2cz14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=lCtkcFWh; arc=none smtp.client-ip=185.70.43.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="lCtkcFWh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1791963897; x=1792223097;
	bh=us8BejSqm23f1XiVi6u4hYhzTsLDP4QrbvXIptfxO2Q=;
	h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=lCtkcFWhWeTdWSMW04kmYFkfMKcZKcj1bZoPXNvsHPUbVIotfoXWQ6kBxFdpqFdmh
	 ULtiYTQabrmvFMvb7DlhDE4L/70/yIyIYHzqsXA1Muz9TjWA6FS7ZmB2O1O+jWhL55
	 Dec1ogZvCjN+DJJ6MPFemQ8Jj4goOOH1eculjR0ZihSSsnQ4w6rZvrctJ7WB5uNL5t
	 2ovP+oWGfT8qSB7VCVusOq5ixnL/itGnUE0kOhCaWmUQ6LhN8DnI6lFfJoCyuCYwHP
	 wqar2w3CVVlXBAKwuNnppMr2J6YuOrCYnj9SPD1pSutnB83E6KHun8hRlia6mlpoa4
	 yEjW5OD9lZHSg==
X-Pm-Submission-Id: 4j4NX60LQCz1DDqx
From: Esben Haabendal <esben@geanix.com>
Date: Wed, 14 Oct 2026 09:44:42 +0200
Subject: [PATCH RESEND v4 1/4] drm/bridge: nwl-dsi: Cleanup endpoint mux
 control selection
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-nwl-dsi-fixes-v4-1-b9138ea5e12c@geanix.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791963890; l=2014;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=VnH57TThUBRrumoSPfKBCfwJnaCqBhJHzReWomjxIyg=;
 b=w/9s6oTZ7JP6CAuj+9EmiheQIv9mRUdTmkxVSaVIczGWnIWsTZCXdVAhfA3iUlyHch4txu/Na
 YxYdLSUcDOyAuoouzVsBO655M0TWRyep5sR8vKfwDWsbCNElvlZe8OU
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=

Using the endpoint define values makes it more clear that the argument to
mux_control_try_select() must be valid state integers, and not something
that looks like a boolean.

The endpoint value is kept, as it will be used in a following patch that
changes behavior slightly based on which endpoint is selected.

Cc: stable@vger.kernel.org
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 drivers/gpu/drm/bridge/nwl-dsi.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
index 09992529f3d8..80e26a947ae6 100644
--- a/drivers/gpu/drm/bridge/nwl-dsi.c
+++ b/drivers/gpu/drm/bridge/nwl-dsi.c
@@ -110,6 +110,8 @@ struct nwl_dsi {
 	int error;
 
 	struct nwl_dsi_transfer *xfer;
+
+	unsigned int endpoint;
 };
 
 static const struct regmap_config nwl_dsi_regmap_config = {
@@ -1088,13 +1090,12 @@ static int nwl_dsi_parse_dt(struct nwl_dsi *dsi)
 static int nwl_dsi_select_input(struct nwl_dsi *dsi)
 {
 	struct device_node *remote;
-	u32 use_dcss = 1;
 	int ret;
 
 	remote = of_graph_get_remote_node(dsi->dev->of_node, 0,
 					  NWL_DSI_ENDPOINT_LCDIF);
 	if (remote) {
-		use_dcss = 0;
+		dsi->endpoint = NWL_DSI_ENDPOINT_LCDIF;
 	} else {
 		remote = of_graph_get_remote_node(dsi->dev->of_node, 0,
 						  NWL_DSI_ENDPOINT_DCSS);
@@ -1103,11 +1104,12 @@ static int nwl_dsi_select_input(struct nwl_dsi *dsi)
 				      "No valid input endpoint found\n");
 			return -EINVAL;
 		}
+		dsi->endpoint = NWL_DSI_ENDPOINT_DCSS;
 	}
 
 	DRM_DEV_INFO(dsi->dev, "Using %s as input source\n",
-		     (use_dcss) ? "DCSS" : "LCDIF");
-	ret = mux_control_try_select(dsi->mux, use_dcss);
+		     (dsi->endpoint == NWL_DSI_ENDPOINT_DCSS) ? "DCSS" : "LCDIF");
+	ret = mux_control_try_select(dsi->mux, dsi->endpoint);
 	if (ret < 0)
 		DRM_DEV_ERROR(dsi->dev, "Failed to select input: %d\n", ret);
 

-- 
2.56.0

