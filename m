Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794269629;
	b=o5dWlzWKCwy5u7taX0Xn1sBFlcmAatH8Y/ujzZWFpVeJuFyFFdwBFogziQCB9EUqGQDe
	 Ju3UxI+j4Ir684uap5u/5bYOioXo3W51nttAkJzsf3xe/kgChABoqFZSunIbzjD2aQ7cO
	 d7ktybhP8UeYI2THMvsJ9j/qR+5aSDwxCXUYVIcPAWXt5bxZmktybR757jSMK1ibh5W4b
	 IPy0Q/vTYNZcqQm+wY+jcA9BaJpUzhZka/oBBh3caw7l5WyypnBb6tmZQefEDl3oBSaxq
	 b/ptHK/JMBBA28kd2W8NUaefGXnuOuszcvLnIQuphioWf0uZ5L3FVXGWMAXGR9whLyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794269629;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=pI06a159JP7AgEb6rVExK2mvjQfs3Ra9c9znQtvQ3d8=;
	b=fHgNQAdH3YZvswWI37SEelbSY5iT+PjSlUZA2LVeEhUhoADsHXVPy9+SAbx1r6rg7xMd
	 JQ9rTVlWX7jf6SuuuWhjmAWnfEMPE7mFTScbkRhgGyv3wyn/RVCqtTwylQnn3FbezNbWO
	 dG9WiQdePX6W7Nbm5XGm6Q0hJ7rofnOoSEU9Qpc6PBuAZQ9hAMh8tAkQfUpBmU5utek9a
	 TcsuJ3z8OQoDDVKK/vbWV9YUz/lU9/hELwJ7Shx44Qs+LDi2ZPEK1WGWnarp+DQ6ax3NU
	 MgXGEFvxlXkJzV+UAYiue7N/v16scMYeuXZfEeMemBu3hJXpmFavDGWcdYH14D+BQaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=So2rQhNS;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BEE60A3804
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:13:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5BEE60A3804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=So2rQhNS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794269627;
	bh=ujlmjPPWYCYdPMnTcZrC+CARK8Ms+yhVGb/3mecxCiI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=So2rQhNSdgEdKa7jhiF7rLRw4Adbi4CZ5gcZZVlYONm3qO5nIkKfciYyP3FEpIzfH
	 3wKkzHTONtLiFl21zr5I/NrAvVi+vuqE1+DpkT1L/75KSa1ulHf7CG3+fWPvKvhGRB
	 kuTGqmYMdw2SHe2qGW8xMZ7KBBOpteA3mhXSmUsO+cLKmxgXMmGCb79rn8XlsBjOgd
	 j8smQpxjOziknJ9I9+cYXEDRWG7j/Z0uk9Oo3kSjXK1YbrPWUEkeGZyTH0Z22yo3Cl
	 EC0w9bMdO1cbxA/C8U0QT9kzqAZC3Th15KEQ9bbXB7gPI2jyJUA8pmuj49yUnAHpXs
	 D6FLuOJ3QK5WQ==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 40A6617E361B;
	Tue, 10 Nov 2026 01:13:47 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 10 Nov 2026 02:13:46 +0200
Subject: [PATCH v4 9/9] drm/vc4: hdmi: Defer pixel clock validation to HDMI
 helpers
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
Message-Id: <20261110-vc4-common-scramb-v4-9-eaa141a0da0f@collabora.com>
References: <20261110-vc4-common-scramb-v4-0-eaa141a0da0f@collabora.com>
In-Reply-To: <20261110-vc4-common-scramb-v4-0-eaa141a0da0f@collabora.com>
To: Maxime Ripard <mripard@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Lucas Tanure <lucas.tanure@neat.no>
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
index 29e608e4d610..f3ec65d86078 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1539,12 +1539,8 @@ vc4_hdmi_connector_clock_valid(const struct drm_connector *connector,
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
 
@@ -3203,7 +3199,6 @@ static const struct vc4_hdmi_variant bcm2835_variant = {
 	.encoder_type		= VC4_ENCODER_TYPE_HDMI0,
 	.debugfs_name		= "hdmi_regs",
 	.card_name		= "vc4-hdmi",
-	.max_pixel_clock	= HDMI_1_0_TMDS_CHAR_RATE_MAX_HZ,
 	.registers		= vc4_hdmi_fields,
 	.num_registers		= ARRAY_SIZE(vc4_hdmi_fields),
 
@@ -3223,7 +3218,6 @@ static const struct vc4_hdmi_variant bcm2711_hdmi0_variant = {
 	.encoder_type		= VC4_ENCODER_TYPE_HDMI0,
 	.debugfs_name		= "hdmi0_regs",
 	.card_name		= "vc4-hdmi-0",
-	.max_pixel_clock	= HDMI_2_0_TMDS_CHAR_RATE_MAX_HZ,
 	.registers		= vc5_hdmi_hdmi0_fields,
 	.num_registers		= ARRAY_SIZE(vc5_hdmi_hdmi0_fields),
 	.phy_lane_mapping	= {
@@ -3252,7 +3246,6 @@ static const struct vc4_hdmi_variant bcm2711_hdmi1_variant = {
 	.encoder_type		= VC4_ENCODER_TYPE_HDMI1,
 	.debugfs_name		= "hdmi1_regs",
 	.card_name		= "vc4-hdmi-1",
-	.max_pixel_clock	= HDMI_1_3_TMDS_CHAR_RATE_MAX_HZ,
 	.registers		= vc5_hdmi_hdmi1_fields,
 	.num_registers		= ARRAY_SIZE(vc5_hdmi_hdmi1_fields),
 	.phy_lane_mapping	= {
@@ -3281,7 +3274,6 @@ static const struct vc4_hdmi_variant bcm2712_hdmi0_variant = {
 	.encoder_type		= VC4_ENCODER_TYPE_HDMI0,
 	.debugfs_name		= "hdmi0_regs",
 	.card_name		= "vc4-hdmi-0",
-	.max_pixel_clock	= HDMI_2_0_TMDS_CHAR_RATE_MAX_HZ,
 	.registers		= vc6_hdmi_hdmi0_fields,
 	.num_registers		= ARRAY_SIZE(vc6_hdmi_hdmi0_fields),
 	.phy_lane_mapping	= {
@@ -3308,7 +3300,6 @@ static const struct vc4_hdmi_variant bcm2712_hdmi1_variant = {
 	.encoder_type		= VC4_ENCODER_TYPE_HDMI1,
 	.debugfs_name		= "hdmi1_regs",
 	.card_name		= "vc4-hdmi-1",
-	.max_pixel_clock	= HDMI_2_0_TMDS_CHAR_RATE_MAX_HZ,
 	.registers		= vc6_hdmi_hdmi1_fields,
 	.num_registers		= ARRAY_SIZE(vc6_hdmi_hdmi1_fields),
 	.phy_lane_mapping	= {
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index e6cd40acc843..b1f41d52919b 100644
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

