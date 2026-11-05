Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793910952;
	b=AuyK97rkE6YZdYtTNRhv98z5gSY7ObDwaTAeMfq3lTFEZsIjlmKat64DQAJhVJ7xIt5R
	 hSpxY9OrRM+cQjsIG6uj6DIAPEXSEdSukriXiOlnxSgv2GKzJZvcFUuQssiFOtnG3rHOY
	 wqd0PmAJd06xawCKQIMjtmQTM1iVSty2e1bW7xoRAcmeUxH3yq443mZIOKzB/G6t5/hPj
	 WUkHSjwn7dRGgvl+JrSUQxPUEBal7s0WdzNKisFE0MNIoR2lMLMuNFfBICY70AMabHb0v
	 CjRMA7qV1jQqTtqXfSMMUTl88H2mAQX6S7Ys+Aa7FXHV1irjw1w8X1o9fweMdFsmtDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793910952;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=sJJKjK0K6EALIuHLfHejOsTyjBZ8Ozdl83llEgi1uXM=;
	b=X2xrgTrFQQ0wmOFElrFntcDEmi+bENk7B+Ti3QC1AvzYgw3b2mpTuO1+V022O9hv64EZ
	 H8IWPD+er+C0ywLKRekbUHLOyJtkySerFAjeSbuzOS6s85kn6uB3aXNGswWJPd65++YVI
	 BEhs3w49mxC4s+QQi1O8XOXXDZLr+qmO+Uazv8wTyT8ROZodwpYjM4pktNzlBdMUG/OcY
	 nr7qqBfz9i8spBDjx3iFqtLjd43M7CVhZOUWD7qZKnTiqkb+A6ZqVjVS8frvrpzuxDhB+
	 y8m7J2a6ea5do70g/KMlyPxC9aU6XtMu6Shk6fTP9Z8yHyr5PzX2KdY4J90o8u492+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sEWgQ7Ic;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2B4606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 20:35:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B2B4606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sEWgQ7Ic
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1ae18eb9ad0so2760434c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793910951; x=1794515751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sJJKjK0K6EALIuHLfHejOsTyjBZ8Ozdl83llEgi1uXM=;
        b=sEWgQ7IccBR8y2XoZ0jYxksrEQgEAurbrwXNLDu2AJ9F1k0EOio/gJbIMRwGpCB1PH
         nfvNzqOtVmtR/+4zCPenK/g7S2MVPkjxYJLWn7Tw5Bx8S8dZh6jgWlcNKOlCkREJ5JTC
         aFVilgJfBkr6Q2EPZ/heFkP2iQlYED9D4tWg5Rc9yUPg2JYNELhxVmtsNB9A9cYt3Jpc
         gn439p6ieYPFU25PKAM34TRI3iyTro+YqHi53KpYDbNzjQRWCTI/9mfvDF3LAJuGSFI7
         sp1o9i8lZG4S/Rby8WOdtVpfi6dlgZ1fW6C/0h8wh+YA99bPrPpJ8z6SbOC609EqkDOY
         qZww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793910951; x=1794515751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sJJKjK0K6EALIuHLfHejOsTyjBZ8Ozdl83llEgi1uXM=;
        b=1W3HjechSPxPwOO6nJfxesDqR4Tafj8TNwkgq+swxG4QiVeiMetjThHSrcv5UG9zrv
         b4/NUsErnmVCn6cQpXYUPxWOEhJ3Ah2JEL1Yj1YJwDoD6qORwqR7zZtYPn0T2JvroA+5
         znabv4JWq22xY8e18aHjYfG63dyKOvaHm/8oj9BizHSxxmBmPvTwG/qxe2BCCwQOP9ut
         bjq9klE00cF/rx2/4kZs+jAsLd5bOoiptc4n4db1AuhpVWkKbbTv2AboYuz8acFQCyf/
         43E/Hgdo2tpQ2lKNTcptQmEnj+A/n5qRa5vSBnaKHpaXKW/EZUyB/8Zb7RfJUxhcfbVH
         LUtA==
X-Gm-Message-State: APuU4Z/SFP7q/BLpTseS0VXaxG5DRZzf6LVFnPXSoo32YdS5rKyOIw3A
	VhMGlXycehqisIAYqqrsXZS8r24Fp9S5OrJjB/o1EcCMXnBbvZP8QrMv7FYtJA==
X-Gm-Gg: AYBFou0xqhvv3MNBTvPNlBIKFs3471bc1iCLgg8Neqda+zbeVCuwlnVDi9seEriKwzu
	u04fVx8xBIxOP7r85/Geup/eozxsT4fLIrYg5VyngaCsmyM8CoATjueEmyEMp/sXnneCNyU26RC
	HzFPvMwfSIEkPvQutM9xCyb5ndcTBSOF4LRnRd6t+a4J8DHYrRs6czRYmRbm3QmQB2Ml5OnjKwR
	BHlxGdFPqj7GtSx9ZaABquuOa2/aViCjCI5F2MDKw8PJImlXptv4vi/VymC6jeoZhLMXB82yUxF
	8WSuemoJI+4F/pUEQtRIvQgnBLSXQzHXHe6mFwK1+fNe7T86oD3aYDOFC3Iqd7EjnDEqdfwDLKD
	qVvaFXVbAEzG7O/6uMP12vzkm1A2w/Kmu5Iqewnn/Y4Uj7/xHgw9wcpJJJn5I1tlZC4yKogIG1G
	cZFNbdmsFbHyu1M3gQQrdJ48Oo/9T+Eb+8pNZmo6s0JTIii/5EFmRw++BsK3oT/mdI0PQdHnKFz
	FsWM7cRfaZaac4QbYEzHrd0pIPeZBvJzyyoV3JEH0icA3nvg7qXz2K6sGXJPeTA7unCbot9JZk8
	XzTP7CkZ
X-Received: by 2002:a05:701a:c90a:b0:15b:7f7a:730d with SMTP id a92af1059eb24-1b25d342861mr126756c88.28.1793910951382;
        Thu, 05 Nov 2026 12:35:51 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245b86fbesm19778365c88.1.2026.11.05.12.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:35:50 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	"H. Nikolaus Schaller" <hns@goldelico.com>,
	Paul Boddie <paul@boddie.org.uk>,
	paul@crapouillou.net,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	linux-mips@vger.kernel.org (open list:INGENIC JZ47xx SoCs),
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS)
Subject: [PATCH] drm/ingenic: Allocate and register the internal bridge separately
Date: Thu,  5 Nov 2026 12:35:17 -0800
Message-ID: <20261105203517.2293404-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The LCD controller's internal bridge is embedded in an object allocated
with drmm_encoder_alloc(). This initializes the encoder but leaves the
bridge's reference count at zero. Since drm_bridge_attach() takes a
reference, probing the CI20 display produces addition-on-zero and
underflow warnings and fails to attach the HDMI bridge chain.

Allocate the internal bridge with devm_drm_bridge_alloc() and register
it with devm_drm_bridge_add() before attaching it. Keep the encoder in a
separate DRM-managed allocation: encoder cleanup can drop the final
bridge reference before it has finished accessing the encoder. Find
the internal bridge through the encoder's bridge chain during mode
setting, and use the bridge argument directly in bridge callbacks.

Fixes: 94d50c1a2ca3 ("drm/bridge: get/put the bridge reference in drm_bridge_attach/detach()")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 31 +++++++++++++++--------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 625ec76cf04d..520912f9ed0d 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -121,16 +121,15 @@ struct ingenic_drm {
 };
 
 struct ingenic_drm_bridge {
-	struct drm_encoder encoder;
 	struct drm_bridge bridge, *next_bridge;
 
 	struct drm_bus_cfg bus_cfg;
 };
 
 static inline struct ingenic_drm_bridge *
-to_ingenic_drm_bridge(struct drm_encoder *encoder)
+to_ingenic_drm_bridge(struct drm_bridge *bridge)
 {
-	return container_of(encoder, struct ingenic_drm_bridge, encoder);
+	return container_of(bridge, struct ingenic_drm_bridge, bridge);
 }
 
 static inline struct ingenic_drm_private_state *
@@ -738,7 +737,9 @@ static void ingenic_drm_encoder_atomic_mode_set(struct drm_encoder *encoder,
 {
 	struct ingenic_drm *priv = drm_device_get_priv(encoder->dev);
 	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
-	struct ingenic_drm_bridge *bridge = to_ingenic_drm_bridge(encoder);
+	struct drm_bridge *first_bridge __free(drm_bridge_put) =
+		drm_bridge_chain_get_first_bridge(encoder);
+	struct ingenic_drm_bridge *bridge = to_ingenic_drm_bridge(first_bridge);
 	unsigned int cfg, rgbcfg = 0;
 
 	priv->panel_is_sharp = bridge->bus_cfg.flags & DRM_BUS_FLAG_SHARP_SIGNALS;
@@ -799,7 +800,7 @@ static int ingenic_drm_bridge_attach(struct drm_bridge *bridge,
 				     struct drm_encoder *encoder,
 				     enum drm_bridge_attach_flags flags)
 {
-	struct ingenic_drm_bridge *ib = to_ingenic_drm_bridge(encoder);
+	struct ingenic_drm_bridge *ib = to_ingenic_drm_bridge(bridge);
 
 	return drm_bridge_attach(encoder, ib->next_bridge,
 				 &ib->bridge, flags);
@@ -811,7 +812,7 @@ static int ingenic_drm_bridge_atomic_check(struct drm_bridge *bridge,
 					   struct drm_connector_state *conn_state)
 {
 	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
-	struct ingenic_drm_bridge *ib = to_ingenic_drm_bridge(bridge->encoder);
+	struct ingenic_drm_bridge *ib = to_ingenic_drm_bridge(bridge);
 
 	ib->bus_cfg = bridge_state->output_bus_cfg;
 
@@ -1303,22 +1304,32 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 			drm_panel_put(panel);
 		}
 
-		ib = drmm_encoder_alloc(drm, struct ingenic_drm_bridge, encoder,
-					NULL, DRM_MODE_ENCODER_DPI, NULL);
+		ib = devm_drm_bridge_alloc(dev, struct ingenic_drm_bridge, bridge,
+					   &ingenic_drm_bridge_funcs);
 		if (IS_ERR(ib)) {
 			ret = PTR_ERR(ib);
+			dev_err(dev, "Failed to allocate bridge: %d\n", ret);
+			goto err_drvdata;
+		}
+
+		encoder = drmm_plain_encoder_alloc(drm, NULL,
+						   DRM_MODE_ENCODER_DPI, NULL);
+		if (IS_ERR(encoder)) {
+			ret = PTR_ERR(encoder);
 			dev_err(dev, "Failed to init encoder: %d\n", ret);
 			goto err_drvdata;
 		}
 
-		encoder = &ib->encoder;
 		encoder->possible_crtcs = drm_crtc_mask(&priv->crtc);
 
 		drm_encoder_helper_add(encoder, &ingenic_drm_encoder_helper_funcs);
 
-		ib->bridge.funcs = &ingenic_drm_bridge_funcs;
 		ib->next_bridge = bridge;
 
+		ret = devm_drm_bridge_add(dev, &ib->bridge);
+		if (ret)
+			goto err_drvdata;
+
 		ret = drm_bridge_attach(encoder, &ib->bridge, NULL,
 					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 		if (ret) {
-- 
2.53.0

