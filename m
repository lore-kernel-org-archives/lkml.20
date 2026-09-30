Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF094DF4D5
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790775206; cv=none; b=EZ1HR6+t6EdhqNw0T+3wa5pAMsY+FonPcBf24KRCM5f5jEhVj2M448q5lckhABUm5ahAqcqA/kWao3YNaElaOcnkd14XL1tKS3gle3JI3+S4jyYhTwpH8sCrxWRwOUtB01jcIWx3T6DN2zE4Hjj/1BzHTddmCBqXlFDcYtOenjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790775206; c=relaxed/simple;
	bh=SXlI8Av0KYoaTnh5jzSGQ7M7fkfdI7Vgy3B40ojVtnw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bW0Xn0Yp88QZgHB3+vp45fbddlRMNfp7sowjWQpi8P1BsmPu+rP3bet6ZyYlpQzY5qlBUZlb+hL06Bip0eZn51OpHM4LnNL+QOqb5Qkgwx1a1WHzBbTmdvMgiW9Xyqut/rjyrmo5zhCuaY1Z6nrkbjhLSHV1rVWKp4VTSJxviiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o9jlApku; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o9jlApku"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49fe8bf173aso28484795e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790775192; x=1791379992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2y6B9VXRwFEy3hkzUoBNwYL6oITXdFH2s65QIYGL97c=;
        b=o9jlApkupbbWSeHqVsR7llRvLIMVKzw1A1QDNi0YnyUBZy61EyRVP1Fdcpk7z6lGM5
         s1ArlPeJxTAtsofS0cGeuoiSQK5qS4L44ReQ7N+bQxb7NAov5qmYoGKiN/8ue7xzTETL
         VoQuAhrAT/Cl4vaKcADHa26eGxrqS3neeOxFsAw6OU0KOYjnq3xnku/kHjuDaJ0KT/89
         9cqpVJmt3MWeXYapNWNikw3Lk3OyCVSNjWWtyDXu+k0e0po+oEfdBz+Od2tJhNcLjr8P
         1RwhnQkvgvj/Y8fr+7r/WIwLeTVy/AUtsGwmxPS8TCeZYkBdjxf9xh3viRFXNjkslOvq
         zksw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790775192; x=1791379992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2y6B9VXRwFEy3hkzUoBNwYL6oITXdFH2s65QIYGL97c=;
        b=J4T3uhDMXmy5ArqqAFsmdxhOQwhTuuR4NxMRHH7KmJjPhmoqKPqZFZcOm96hXK9z/j
         bGBGItJxaz+8Ucg9uQ7G7IBDEMStQ2teFChAQmUPTvjN8IwMBJAQEYkAyJG2P2ibk6P0
         yi2+de39pjpDwWBocSyHX37F/qTyThMqkn0SM3aO3Z0+mOr38IZ3cFRxM19ormfOX0U4
         WRe3BWGj0euqcDHO+N1huBZKBkv3ILrsBmvqS8wDsKnVOH43bE50aG9EeFYzoYgU/oYs
         pfEvPcqBLntOA+EuUHKnejXwSF02ek6caOPPw/qHDTIKzvSte+ZBq8v+CQMCUzzlb2LI
         EISw==
X-Forwarded-Encrypted: i=1; AKwUvBzg3YqHe7t3qkQ5YwjGTBXzIPs0Kz2mfKCMPhD8JfcEqYFSbv4sSq533nUrLGr2JMbu1Hiu2UeZ+WDZRwI=@vger.kernel.org
X-Gm-Message-State: AFuF++kBErv23+0GHD82wo3bErdFbgbzPDHPwjgyBxGKbCgEMiH/iBjI
	yxthuHNBmA7+M+dd8DoxFod0fKqUikFd1ox+tCpyv2+/qSW0K8GhU/9g
X-Gm-Gg: AYBFou00wyg49J5M9ojRGP/wcNINM+xvVvMfYGHl/hXKOnkfYOgMxgqOEVq1tZN27MQ
	N1VY6H6VXIO02QeMNdp+2RgEobSWiN/miR1eOSL37uNgvAnnk54B0mJ3hiNiYOyj5QLh0mGpEkh
	eELtLTtsbpq0qzHHBmTXr7AAQyDj4fdHxNEldO11XKY3pVB/arw8Eq7LRtPRl7EJdy9j1IDLhUU
	RYe3gWqK3kI7t6DVIEymLibWv5FfqME+wg6puzX7fcc1p08/A+JDZRE7/pPxYckB6zkaDjEYakQ
	Kcogd+pCUl+LtEN1YvTARGYQrvp6CoBuQ6jBN+DazcF0fIOkfc0YeutUYFvK09pChqO8gQPaHnM
	gdAABCJQAWoM19UaRkZ5zOdTYxmzG2HQERr4AeD8H3ZG7D7OOn/40m8493T2k7/GBmSfSmir19e
	NGkmiqX8OSnAHG/IgJoh3JzfHGEp1FBK0ZdmcVfKvaZirIXg8HXKg0z1DyBaXnQdVZxfUrdPIzR
	SLn3vq8K2GC5uKYYzChF5o=
X-Received: by 2002:a05:600d:8648:20b0:49e:6249:268b with SMTP id 5b1f17b1804b1-4a01b12ec83mr18270695e9.32.1790775192075;
        Wed, 30 Sep 2026 06:33:12 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:bade:1500:bcd:b3ec])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b029f2b02sm3685582f8f.24.2026.09.30.06.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 06:33:10 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: [PATCH v4 6/9] drm: renesas: rz-du: Add RZ/G3L (R9A08G046) DU support
Date: Wed, 30 Sep 2026 14:32:48 +0100
Message-ID: <20260930133257.23210-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930133257.23210-1-biju.das.jz@bp.renesas.com>
References: <20260930133257.23210-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add Display Unit support for the Renesas RZ/G3L SoC (R9A08G046). It is
similar to the one found on RZ/G2L, but has LVDS support.

Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * Updated mode_clock_min from 5440->5400 kHz.
 * Collected tag.
v2->v3:
 * Set duty cycle handling in DU encoder
 * Added min/max frequencies for DPI.
v1->v2:
 * Dropped the macro RZG2L_DU_FEATURE_SMUX2_DSI_CLK and RZG2L_DU_MAX_LVDS.
 * Dropped the variable rcdu from struct rzg2l_du_encoder.
 * Dropped the variable lvds from struct rzg2l_du_device.
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  | 24 ++++++++++++++++++-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h  |  3 ++-
 .../gpu/drm/renesas/rz-du/rzg2l_du_encoder.c  | 24 +++++++++++++++++++
 3 files changed, 49 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
index 3d13f61d3c97..adec94a55407 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
@@ -55,6 +55,26 @@ static const struct rzg2l_du_device_info rzg2l_du_r9a07g044_info = {
 	.mode_clock_max = 83500,
 };
 
+static const struct rzg2l_du_device_info rzg2l_du_r9a08g046_info = {
+	.channels_mask = BIT(0),
+	.routes = {
+		[RZG2L_DU_OUTPUT_DSI0] = {
+			.possible_outputs = BIT(0),
+			.port = 0,
+		},
+		[RZG2L_DU_OUTPUT_DPAD0] = {
+			.possible_outputs = BIT(0),
+			.port = 1,
+		},
+		[RZG2L_DU_OUTPUT_LVDS0] = {
+			.possible_outputs = BIT(0),
+			.port = 2,
+		},
+	},
+	.mode_clock_min = 5400,
+	.mode_clock_max = 87000,
+};
+
 static const struct rzg2l_du_device_info rzg2l_du_r9a09g057_info = {
 	.channels_mask = BIT(0),
 	.routes = {
@@ -81,6 +101,7 @@ static const struct rzg2l_du_device_info rzg2l_du_r9a09g077_info = {
 static const struct of_device_id rzg2l_du_of_table[] = {
 	{ .compatible = "renesas,r9a07g043u-du", .data = &rzg2l_du_r9a07g043u_info },
 	{ .compatible = "renesas,r9a07g044-du", .data = &rzg2l_du_r9a07g044_info },
+	{ .compatible = "renesas,r9a08g046-du", .data = &rzg2l_du_r9a08g046_info },
 	{ .compatible = "renesas,r9a09g057-du", .data = &rzg2l_du_r9a09g057_info },
 	{ .compatible = "renesas,r9a09g077-du", .data = &rzg2l_du_r9a09g077_info },
 	{ /* sentinel */ }
@@ -92,7 +113,8 @@ const char *rzg2l_du_output_name(enum rzg2l_du_output output)
 {
 	static const char * const names[] = {
 		[RZG2L_DU_OUTPUT_DSI0] = "DSI0",
-		[RZG2L_DU_OUTPUT_DPAD0] = "DPAD0"
+		[RZG2L_DU_OUTPUT_DPAD0] = "DPAD0",
+		[RZG2L_DU_OUTPUT_LVDS0] = "LVDS0"
 	};
 
 	if (output >= ARRAY_SIZE(names))
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
index baf076d69cda..e9626ef37cde 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
@@ -25,6 +25,7 @@ struct drm_property;
 enum rzg2l_du_output {
 	RZG2L_DU_OUTPUT_DSI0,
 	RZG2L_DU_OUTPUT_DPAD0,
+	RZG2L_DU_OUTPUT_LVDS0,
 	RZG2L_DU_OUTPUT_MAX,
 };
 
@@ -33,7 +34,7 @@ enum rzg2l_du_output {
  * @possible_outputs: bitmask of possible outputs
  * @port: device tree port number corresponding to this output route
  *
- * The DU has 2 possible outputs (DPAD0, DSI0). Output routing data
+ * The DU has 3 possible outputs (DPAD0, DSI0, LVDS0). Output routing data
  * specify the valid SoC outputs, which CRTC can drive the output, and the type
  * of in-SoC encoder for the output.
  */
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
index 3d0999e4fcfd..a1b48973aa8e 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
@@ -7,6 +7,7 @@
  * Based on rcar_du_encoder.c
  */
 
+#include <linux/clk.h>
 #include <linux/export.h>
 #include <linux/of.h>
 
@@ -15,6 +16,7 @@
 #include <drm/drm_bridge_connector.h>
 #include <drm/drm_panel.h>
 
+#include "rzg2l_du_crtc.h"
 #include "rzg2l_du_drv.h"
 #include "rzg2l_du_encoder.h"
 
@@ -64,8 +66,30 @@ rzg2l_du_encoder_mode_valid(struct drm_encoder *encoder,
 	return MODE_OK;
 }
 
+static void rzg2l_du_encoder_atomic_mode_set(struct drm_encoder *encoder,
+					     struct drm_crtc_state *crtc_state,
+					     struct drm_connector_state *conn_state)
+{
+	struct rzg2l_du_encoder *renc = to_rzg2l_encoder(encoder);
+	struct rzg2l_du_crtc *rcrtc = to_rzg2l_crtc(crtc_state->crtc);
+	struct clk *clk_parent;
+
+	clk_parent = clk_get_parent(rcrtc->rzg2l_clocks.dclk);
+
+	/*
+	 * Request appropriate duty cycle
+	 * - LVDS path has DUTY H/L=4/3, 4/7 duty cycle.
+	 * - DSI/RGB path has symmetric 50% duty cycle.
+	 */
+	if (renc->output == RZG2L_DU_OUTPUT_LVDS0)
+		clk_set_duty_cycle(clk_parent, 4, 7);
+	else
+		clk_set_duty_cycle(clk_parent, 1, 2);
+}
+
 static const struct drm_encoder_helper_funcs rzg2l_du_encoder_helper_funcs = {
 	.mode_valid = rzg2l_du_encoder_mode_valid,
+	.atomic_mode_set = rzg2l_du_encoder_atomic_mode_set,
 };
 
 int rzg2l_du_encoder_init(struct rzg2l_du_device  *rcdu,
-- 
2.43.0

