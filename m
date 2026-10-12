Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE82B3E171E
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 22:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791844708; cv=none; b=VkCV9Ete+l7ORD8YNgQomz1wygzTli/zqoYtVGEUSH83SDudS8kVSWd0R23bcb7LpA4hu5ayjkekY1e4EVQ9amsnMbvrFxw3l5JTnVtVzUD2dqxuLEx9ScHPnEty6WAORbdNRwFtXoUzGVYXOBYHYUgxdOmXVr3VS21gJAP1L9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791844708; c=relaxed/simple;
	bh=ccpopn9Y9LAmIjVmaGfBkmnfpoFJvMf4XBoclWEOsYY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ShtO9kELLgblDLcDGySf8hnGnp3tV5ksUTVV1pYNjSn8P8ZLNFB11FYw5MwAvCmvRl8fO6jm1GitHoJb0O2ywkpJtHsPAcJbbv3QlEC5NGaSTblECzyTDwkijDxUfAPclNEUQdTkZ3paYEgwl/nyp322bI03sqDuNs71UQWHjyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=H3eKk80U; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="H3eKk80U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1791844699;
	bh=ccpopn9Y9LAmIjVmaGfBkmnfpoFJvMf4XBoclWEOsYY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=H3eKk80U3CKfLyenAt0GdpJVhGcJeaTN3b6oE2qy7MJFgmiPv87quJ3eKNjbqtrDT
	 D3pFpGudIf3UP1H+D54QKIk9jcTHMft69OYs2IAPJjHRYJN9r3aQWWeBjJ13bdYuUA
	 Y1Ra+Nw8e4kRkmD8nR3XUtVQkEA1YpJzmrqvejBKBnCvECSazCU1cI9NwabPYD5NN8
	 L37tckLQOkeRjn6Eb/Jnaegskj7U+AVT5w9ZtbDWQebU1BCILpMSJr+AR2sk9nPuxD
	 glgyk9q9FERUMrFoDVL5vZ1KsP3oTmLrh3DqF7jagW2OUfTWi5WfxQonqQD/b9AUVX
	 6TtOUy1RgWJGA==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 43D7A17E07F0;
	Tue, 13 Oct 2026 00:38:19 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 13 Oct 2026 01:37:41 +0300
Subject: [PATCH v2 1/8] drm/vc4: hdmi: Use common TMDS char rate constants
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-vc4-common-scramb-v2-1-a41d15e131ad@collabora.com>
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

Replace HDMI_14_MAX_TMDS_CLK defined locally with
HDMI_1_3_TMDS_CHAR_RATE_MAX_HZ provided by linux/hdmi.h.  Note this
incorrectly referenced HDMI 1.4, as the 340 MHz maximum TMDS character
rate was actually introduced in HDMI 1.3.

Similarly, use HDMI_2_0_TMDS_CHAR_RATE_MAX_HZ instead of the 600000000
magic number.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 3a90dbb61f4e..8e4623ccc4f8 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -45,6 +45,7 @@
 #include <linux/clk.h>
 #include <linux/component.h>
 #include <linux/gpio/consumer.h>
+#include <linux/hdmi.h>
 #include <linux/i2c.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
@@ -113,8 +114,6 @@
 #define HSM_MIN_CLOCK_FREQ	120000000
 #define CEC_CLOCK_FREQ 40000
 
-#define HDMI_14_MAX_TMDS_CLK   (340 * 1000 * 1000)
-
 static bool vc4_hdmi_supports_scrambling(struct vc4_hdmi *vc4_hdmi)
 {
 	struct drm_display_info *display = &vc4_hdmi->connector.display_info;
@@ -137,7 +136,7 @@ static bool vc4_hdmi_mode_needs_scrambling(const struct drm_display_mode *mode,
 {
 	unsigned long long clock = drm_hdmi_compute_mode_clock(mode, bpc, fmt);
 
-	return clock > HDMI_14_MAX_TMDS_CLK;
+	return clock > HDMI_1_3_TMDS_CHAR_RATE_MAX_HZ;
 }
 
 static int vc4_hdmi_debugfs_regs(struct seq_file *m, void *unused)
@@ -1728,7 +1727,7 @@ vc4_hdmi_connector_clock_valid(const struct drm_connector *connector,
 	if (clock > vc4_hdmi->variant->max_pixel_clock)
 		return MODE_CLOCK_HIGH;
 
-	if (!vc4->hvs->vc5_hdmi_enable_hdmi_20 && clock > HDMI_14_MAX_TMDS_CLK)
+	if (!vc4->hvs->vc5_hdmi_enable_hdmi_20 && clock > HDMI_1_3_TMDS_CHAR_RATE_MAX_HZ)
 		return MODE_CLOCK_HIGH;
 
 	/* 4096x2160@60 is not reliable without overclocking core */
@@ -3254,7 +3253,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	 * vc4_hdmi_disable_scrambling() will thus run at boot, make
 	 * sure it's disabled, and avoid any inconsistency.
 	 */
-	if (variant->max_pixel_clock > HDMI_14_MAX_TMDS_CLK)
+	if (variant->max_pixel_clock > HDMI_1_3_TMDS_CHAR_RATE_MAX_HZ)
 		vc4_hdmi->scdc_enabled = true;
 
 	ret = variant->init_resources(drm, vc4_hdmi);
@@ -3384,7 +3383,7 @@ static const struct vc4_hdmi_variant bcm2711_hdmi0_variant = {
 	.encoder_type		= VC4_ENCODER_TYPE_HDMI0,
 	.debugfs_name		= "hdmi0_regs",
 	.card_name		= "vc4-hdmi-0",
-	.max_pixel_clock	= 600000000,
+	.max_pixel_clock	= HDMI_2_0_TMDS_CHAR_RATE_MAX_HZ,
 	.registers		= vc5_hdmi_hdmi0_fields,
 	.num_registers		= ARRAY_SIZE(vc5_hdmi_hdmi0_fields),
 	.phy_lane_mapping	= {
@@ -3413,7 +3412,7 @@ static const struct vc4_hdmi_variant bcm2711_hdmi1_variant = {
 	.encoder_type		= VC4_ENCODER_TYPE_HDMI1,
 	.debugfs_name		= "hdmi1_regs",
 	.card_name		= "vc4-hdmi-1",
-	.max_pixel_clock	= HDMI_14_MAX_TMDS_CLK,
+	.max_pixel_clock	= HDMI_1_3_TMDS_CHAR_RATE_MAX_HZ,
 	.registers		= vc5_hdmi_hdmi1_fields,
 	.num_registers		= ARRAY_SIZE(vc5_hdmi_hdmi1_fields),
 	.phy_lane_mapping	= {
@@ -3442,7 +3441,7 @@ static const struct vc4_hdmi_variant bcm2712_hdmi0_variant = {
 	.encoder_type		= VC4_ENCODER_TYPE_HDMI0,
 	.debugfs_name		= "hdmi0_regs",
 	.card_name		= "vc4-hdmi-0",
-	.max_pixel_clock	= 600000000,
+	.max_pixel_clock	= HDMI_2_0_TMDS_CHAR_RATE_MAX_HZ,
 	.registers		= vc6_hdmi_hdmi0_fields,
 	.num_registers		= ARRAY_SIZE(vc6_hdmi_hdmi0_fields),
 	.phy_lane_mapping	= {
@@ -3469,7 +3468,7 @@ static const struct vc4_hdmi_variant bcm2712_hdmi1_variant = {
 	.encoder_type		= VC4_ENCODER_TYPE_HDMI1,
 	.debugfs_name		= "hdmi1_regs",
 	.card_name		= "vc4-hdmi-1",
-	.max_pixel_clock	= 600000000,
+	.max_pixel_clock	= HDMI_2_0_TMDS_CHAR_RATE_MAX_HZ,
 	.registers		= vc6_hdmi_hdmi1_fields,
 	.num_registers		= ARRAY_SIZE(vc6_hdmi_hdmi1_fields),
 	.phy_lane_mapping	= {

-- 
2.55.0

