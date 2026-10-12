Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3F24DD3D5
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 22:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791844711; cv=none; b=LvT23WCGVSA4pZDJUwqhJv4M5es8R4P9xhA/i2NO0ckEu05+OBslIjoJ/f3ZUUTR+FfW1XWV/qAsMsEYw3rPwPF/7WGxqkwNrGTVrOSE8neNERgUO9HDwgGff9OQNAQkA0aE5nhQ7AWyUF9RebdHXiLkMiEOf0v0bsl5tTrLHso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791844711; c=relaxed/simple;
	bh=LAIR5aBqKu1Zb2wOdOKDE+JwgF+ffZH9cyeFXr6LID8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cYz3Nx98xpoXkYDNMO+34ORADDrdxs6flGelKkBaSqwLSRy1U1M6HVkHOOm61kCCxVeEKCYZR+ONI3+lkfHm5l7ZkwzZoWInni5TaIJXEzk1dqfAUoukcivsJwvnLnr3JPBubCGTNMsLk5h8M06J46Y0TWh6c9RoDtBaHmY8uO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=fLOsIsds; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="fLOsIsds"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1791844704;
	bh=LAIR5aBqKu1Zb2wOdOKDE+JwgF+ffZH9cyeFXr6LID8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fLOsIsdsBC8d/av+U4z3gw1jtMG/Ul9s7Y9+hCVPNYVN55YYfuuuhyST0NOAZOiYl
	 TSZDwFubX/wapGHW5fRma7kogvGPWyig38BkmdIztNOfel5rYwqityY7dW/pG06xnB
	 PDNvuXQN/KiHUj/m67ooxZX4drAwGpbNAHSc8E9bL0UxG8fNRMla2S34jf1QxvQwma
	 DusV6UE0ySg26phPksVJbArRm4sxngpzmsbkaiZ8UiQJ3OzpipB0BQIGn+PhpKLjcn
	 sNi1xPWqOBF6LsKgbuEqAejx43cZyw5lG+S2sZ648NHvDoFQYg033uNc2H53gH9DUX
	 D8jP8NRJq70yw==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8B09317E0D7E;
	Tue, 13 Oct 2026 00:38:24 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 13 Oct 2026 01:37:48 +0300
Subject: [PATCH v2 8/8] drm/vc4: hdmi: Defer pixel clock validation to HDMI
 helpers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-vc4-common-scramb-v2-8-a41d15e131ad@collabora.com>
References: <20261013-vc4-common-scramb-v2-0-a41d15e131ad@collabora.com>
In-Reply-To: <20261013-vc4-common-scramb-v2-0-a41d15e131ad@collabora.com>
To: Maxime Ripard <mripard@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2

drmm_connector_hdmi_init() now derives the maximum TMDS character rate
from the supported HDMI version, and
drm_atomic_helper_connector_hdmi_check() rejects modes exceeding it
before invoking the driver's .tmds_char_rate_valid() hook.

Since each of the chip variants reports a supported HDMI version
matching its hardware limit, the max_pixel_clock check in
vc4_hdmi_connector_clock_valid() is redundant.  Drop it together with
the max_pixel_clock field of struct vc4_hdmi_variant.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 9 ---------
 drivers/gpu/drm/vc4/vc4_hdmi.h | 3 ---
 2 files changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 11414025fe7b..ca8712b49ffb 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1529,12 +1529,8 @@ vc4_hdmi_connector_clock_valid(const struct drm_connector *connector,
 			       const struct drm_display_mode *mode,
 			       unsigned long long clock)
 {
-	const struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
 	struct vc4_dev *vc4 = to_vc4_dev(connector->dev);
 
-	if (clock > vc4_hdmi->variant->max_pixel_clock)
-		return MODE_CLOCK_HIGH;
-
 	if (!vc4->hvs->vc5_hdmi_enable_hdmi_20 && clock > HDMI_1_3_TMDS_CHAR_RATE_MAX_HZ)
 		return MODE_CLOCK_HIGH;
 
@@ -3185,7 +3181,6 @@ static const struct vc4_hdmi_variant bcm2835_variant = {
 	.encoder_type		= VC4_ENCODER_TYPE_HDMI0,
 	.debugfs_name		= "hdmi_regs",
 	.card_name		= "vc4-hdmi",
-	.max_pixel_clock	= HDMI_1_0_TMDS_CHAR_RATE_MAX_HZ,
 	.registers		= vc4_hdmi_fields,
 	.num_registers		= ARRAY_SIZE(vc4_hdmi_fields),
 
@@ -3205,7 +3200,6 @@ static const struct vc4_hdmi_variant bcm2711_hdmi0_variant = {
 	.encoder_type		= VC4_ENCODER_TYPE_HDMI0,
 	.debugfs_name		= "hdmi0_regs",
 	.card_name		= "vc4-hdmi-0",
-	.max_pixel_clock	= HDMI_2_0_TMDS_CHAR_RATE_MAX_HZ,
 	.registers		= vc5_hdmi_hdmi0_fields,
 	.num_registers		= ARRAY_SIZE(vc5_hdmi_hdmi0_fields),
 	.phy_lane_mapping	= {
@@ -3234,7 +3228,6 @@ static const struct vc4_hdmi_variant bcm2711_hdmi1_variant = {
 	.encoder_type		= VC4_ENCODER_TYPE_HDMI1,
 	.debugfs_name		= "hdmi1_regs",
 	.card_name		= "vc4-hdmi-1",
-	.max_pixel_clock	= HDMI_1_3_TMDS_CHAR_RATE_MAX_HZ,
 	.registers		= vc5_hdmi_hdmi1_fields,
 	.num_registers		= ARRAY_SIZE(vc5_hdmi_hdmi1_fields),
 	.phy_lane_mapping	= {
@@ -3263,7 +3256,6 @@ static const struct vc4_hdmi_variant bcm2712_hdmi0_variant = {
 	.encoder_type		= VC4_ENCODER_TYPE_HDMI0,
 	.debugfs_name		= "hdmi0_regs",
 	.card_name		= "vc4-hdmi-0",
-	.max_pixel_clock	= HDMI_2_0_TMDS_CHAR_RATE_MAX_HZ,
 	.registers		= vc6_hdmi_hdmi0_fields,
 	.num_registers		= ARRAY_SIZE(vc6_hdmi_hdmi0_fields),
 	.phy_lane_mapping	= {
@@ -3290,7 +3282,6 @@ static const struct vc4_hdmi_variant bcm2712_hdmi1_variant = {
 	.encoder_type		= VC4_ENCODER_TYPE_HDMI1,
 	.debugfs_name		= "hdmi1_regs",
 	.card_name		= "vc4-hdmi-1",
-	.max_pixel_clock	= HDMI_2_0_TMDS_CHAR_RATE_MAX_HZ,
 	.registers		= vc6_hdmi_hdmi1_fields,
 	.num_registers		= ARRAY_SIZE(vc6_hdmi_hdmi1_fields),
 	.phy_lane_mapping	= {
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index f6159c9e6144..61486e7b4ba2 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -29,9 +29,6 @@ struct vc4_hdmi_variant {
 	/* Filename to expose the registers in debugfs */
 	const char *debugfs_name;
 
-	/* Maximum pixel clock supported by the controller (in Hz) */
-	unsigned long long max_pixel_clock;
-
 	/* List of the registers available on that variant */
 	const struct vc4_hdmi_register *registers;
 

-- 
2.55.0

