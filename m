Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59557470E99
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787766560; cv=none; b=XUCEcjAaTsBfzo+JON2rThKEGZ4FNYxqtZWXVUFVux4DwGTS6d428PbXggeXCOg+aA7Am0PbtqNjiDH4BDRQvQQSSRt4YqgxtBsa2PIpfER9abkVfWNxREA3AMOonf/TGCqCRXwgnOfE8LZ61gtZKV4ARvBNZ8H0VuKr+PEIwik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787766560; c=relaxed/simple;
	bh=WZI7Z+xiHyPs0Sa0fhJIO+mVzkNhhaydn0uy+8vl7VY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BRBuk+dkIYjy+ffwDIIkNmbqDW3vgp7WeKty9J59G+6YZcGknZFQ2gNHGWJXttR2h4sx3RStTPKSYVDa0T5y9k6sNx9WMfMkrcxX32ksvcwjWXM1cS8X9dmCHKXWEamx4rt5qeAxyWqVX1aqAploOLbAdr3ZW6bgnyekeJunSGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L6Wt12qO; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L6Wt12qO"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c15e592da74so181610466b.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 10:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787766544; x=1788371344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pdrEgrXW7pyBbbCrc5fDQ8cAvF4cBxk33trRylb1YOU=;
        b=L6Wt12qOJ4tLMU2cOKWexaWcOkbZpNO0MNLKQepHQqSxSgdJWvo/v0mq4gt2AG3MEl
         wk2pXJ83Sr+9tCTbvumeigm8WnHDqIHdw7N3PuJBx7ccVKtfp012pdafAFHSVGFeI37d
         oIIAJegnwyP1ta4GBFz6j1xxPfJ5v32H3z5+9mNoAXCwPO18jB9Sjc0A+Jo7OwuayaJN
         JffiJIVS7JSD0s1v6Dv8CHtrgnu7uO4cF3bC+kFIPOYLEFLyt0oSyPOpQts5WcSHIoy2
         bW98KFtedjYryHJrEKrTIrbGITIcvMASKvACnCUzRcRJtjmePdZcV/BG68ZAPdm0r6nh
         pKOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787766544; x=1788371344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pdrEgrXW7pyBbbCrc5fDQ8cAvF4cBxk33trRylb1YOU=;
        b=cbzGoCkLYIIWFMjwrXlnAdeFsZpqApz9qDKrpga1dOxUM8Ku7KeJx9/X/Dsxtjnzjs
         ZwfpPmIKj2SgB0oqEeEWhs9+WAqGdek0yZXZcqoFowpYNjoDuD64FmbDrf5lkLgQixQc
         HlJgJTdsnF13ulOMOeBetyw7e4veykN+LKGqufTepbfRXT2GsGFxzznM+f31RGEHpjrE
         H4WBFCTQhjoLa/ktLpRdFnJXAFxz4sZdi0mDSySjzY8M+jRdN3cAFv9nBIbRk91UWlej
         WYmn8yV8aj1QIUgE1/uPqb5/XbCCyxgaSWUit323h2TYxLmgEGy83jlx5ZX487Nl2vwq
         qjyg==
X-Forwarded-Encrypted: i=1; AHgh+Rpa1lIVJ5Wg5bbduDRLLsG5aChSm2gGKzVin1QGFdkyrFUAltjYga71TQaXEPZR9oJzuMDx6yxLLBPjlHQ=@vger.kernel.org
X-Gm-Message-State: AFuF++k2JwsjuAexluu+DJ6YbpQLviXM7yLlIzqCi4ajXdmNWAle844e
	6V94B7lB6Yc1Ul04fYWvE5KzC0tYtXhPk0yneyQD9I+fAFLHE0dMJegX
X-Gm-Gg: AR+sD13nnAmPtW+WHXEEtLaw6fV/291pJuZQipjMwd/k9xyJMmL93zYYKsf61UTAwB1
	gUPIzfLJuVqVxABnzgFR4liu8KAQO0Uj8DWHqCtUKouxGip1TbzYyokElRBcJN59Soft0Nsqn6r
	nXVvY1iBMC78SR+qn6cKy6OtFXRWtoPmO9zIq+/McoJJ3QuvbXv4uCDHY8bE7B2XMYltw0f4Pdz
	ae07d9jHfxR7xfCqoUFHeqynm3ZylFNaGXUzcdL1G4GAbkrBz1aqOtDJ/rKRqUjRqMph3ll9v9t
	uKjiOimzVRRJUCpJLi6a2xW24PJBHIlsLjOcmTyymC5vT+MWnGxYxa/IEqj6AXqoJ5f9UqHk10H
	/XUJcTVrkN8mciuO8AUb6XrMSV4SnVx84SrMhp0rhJFMa1KPT2EH1mnTFPYZr4PPaZfBbZkKudU
	tqw4ombe6W98oYNkeMNi1BUPGwa/qLFpMUAgS8vOjNBrIJ9pWHeQ/qjE6DMfWPyLt0VMHQkca87
	ExX7nQHX1i9Jg==
X-Received: by 2002:a17:906:7947:b0:c15:f598:60c0 with SMTP id a640c23a62f3a-c250bb7e838mr1232364166b.4.1787766543774;
        Wed, 26 Aug 2026 10:49:03 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:aa64:3da0:a259:ecd5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88ac7fsm777752766b.30.2026.08.26.10.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 10:49:03 -0700 (PDT)
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
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 06/13] drm: renesas: rz-du: Add RZ/G3L (R9A08G046) DU support
Date: Wed, 26 Aug 2026 18:48:40 +0100
Message-ID: <20260826174854.199139-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826174854.199139-1-biju.das.jz@bp.renesas.com>
References: <20260826174854.199139-1-biju.das.jz@bp.renesas.com>
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

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
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
index 3d13f61d3c97..6c2dc86abc7d 100644
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
+	.mode_clock_min = 5440,
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

