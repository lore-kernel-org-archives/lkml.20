Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794269623;
	b=PMmBeoiY6f5lD28aS9yPNx7FnrmNcc9C2ZLzGm7rMVjnCOiz0SAesXMZAJTrJ/d9MZJl
	 aDkSFwz4NQba6ED2thPT5TphBdoLR072ImOSPXRN6++k66rZdlyRFa+OoBWnL1nmPizty
	 hDw2/BZSBSTbFZtl2v8t+370Hi2KNOgPXLdRxILH6GrivVKjX5t2lORm/F3o9/osYhcoe
	 JdB5xWWuQach/1rWtXE41JHV+BXytOHwd2LsWKAdEbjgO3Km2jGZbD/SovAnCzM6545v0
	 9Xk8UZ473KhAN6XZ7yiv3TuU5nJrZuwVT17Py6ar4sUjuU3h0mdzh2bnsNKPfoopNhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794269623;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=p43V+oEvhdY4LBT/C0QChj9vFmEzprHIYZI/RyqWca0=;
	b=NxQhZEHqQwEO4l5fNh6og9mXNlx9LtXvktN7CReixu/FceHHx8uTr8ank0uOMBuVVbxW
	 slscW1BLS8ducVbgk+vWBKgMsuenDQepTY56tGKHmqw0DLYbEQqNgfbI5+rAVMh1fHUE4
	 IrtI+jYXk6R4QbvMsg5JXtu3sSfy2eWP2bEBeGp4zChhkm5fitg+t9ZRmvDu0ZIl8gD3n
	 3Ybjr9FebwjUlkTFy3/eQl1XfhJuWkfE8ps0H9aERoCHNE3yrNMG/XedrTL7fqlTWcVKF
	 5P3kI2rMSu8C4IcOrUD0/Qg+5jMCPR4hJRnHiS4Sp88vIyxxjMLRj1hBDdhanYq2mRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Ubcc1tqi;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AEDE606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:13:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AEDE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Ubcc1tqi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794269621;
	bh=acJ+TBazTVcUEPxIxlshKpn8Fa1J9nAgb30mYMNLMTs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ubcc1tqiL7KE1dIUq58ijGhXjKcwPERpiUoIUHlIDCvCyB41fVT5cfW2imnO1AlBT
	 vcywVtADFUdT3Tq3C7aTVxWSWtUEcwatZODJFv9+AC7hTP3dZKPCRJi8ljQpWV+A3L
	 J8Mq9JNHtCo1AIMcPZU/TCaYhC2kn1tBzkBKVWRaaq+7EBU3UAgHB3qDexZUo0j7NX
	 tS+aK2xKiRxvA1Pfi9e4BmUnetVHFU2V/UcmufCV9/CSa3TjjeejHabzVcQVk64OCI
	 XcLrmzNvy36UZ/ks7tpxsO9ESqRZPWhZppPaYJNtFfYJIO6H8MDEmWrRwWmOd17zgI
	 rWBJiciUwVlBg==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EC89117E0390;
	Tue, 10 Nov 2026 01:13:40 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 10 Nov 2026 02:13:38 +0200
Subject: [PATCH v4 1/9] drm/vc4: hdmi: Use common TMDS char rate constants
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
Message-Id: <20261110-vc4-common-scramb-v4-1-eaa141a0da0f@collabora.com>
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
index b4ad8467d49c..22533f1c6207 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -44,6 +44,7 @@
 #include <linux/clk.h>
 #include <linux/component.h>
 #include <linux/gpio/consumer.h>
+#include <linux/hdmi.h>
 #include <linux/i2c.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
@@ -112,8 +113,6 @@
 #define HSM_MIN_CLOCK_FREQ	120000000
 #define CEC_CLOCK_FREQ 40000
 
-#define HDMI_14_MAX_TMDS_CLK   (340 * 1000 * 1000)
-
 static bool vc4_hdmi_supports_scrambling(struct vc4_hdmi *vc4_hdmi)
 {
 	struct drm_display_info *display = &vc4_hdmi->connector.display_info;
@@ -136,7 +135,7 @@ static bool vc4_hdmi_mode_needs_scrambling(const struct drm_display_mode *mode,
 {
 	unsigned long long clock = drm_hdmi_compute_mode_clock(mode, bpc, fmt);
 
-	return clock > HDMI_14_MAX_TMDS_CLK;
+	return clock > HDMI_1_3_TMDS_CHAR_RATE_MAX_HZ;
 }
 
 static int vc4_hdmi_debugfs_regs(struct seq_file *m, void *unused)
@@ -1735,7 +1734,7 @@ vc4_hdmi_connector_clock_valid(const struct drm_connector *connector,
 	if (clock > vc4_hdmi->variant->max_pixel_clock)
 		return MODE_CLOCK_HIGH;
 
-	if (!vc4->hvs->vc5_hdmi_enable_hdmi_20 && clock > HDMI_14_MAX_TMDS_CLK)
+	if (!vc4->hvs->vc5_hdmi_enable_hdmi_20 && clock > HDMI_1_3_TMDS_CHAR_RATE_MAX_HZ)
 		return MODE_CLOCK_HIGH;
 
 	/* 4096x2160@60 is not reliable without overclocking core */
@@ -3269,7 +3268,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 	 * vc4_hdmi_disable_scrambling() will thus run at boot, make
 	 * sure it's disabled, and avoid any inconsistency.
 	 */
-	if (variant->max_pixel_clock > HDMI_14_MAX_TMDS_CLK)
+	if (variant->max_pixel_clock > HDMI_1_3_TMDS_CHAR_RATE_MAX_HZ)
 		vc4_hdmi->scdc_enabled = true;
 
 	ret = variant->init_resources(drm, vc4_hdmi);
@@ -3399,7 +3398,7 @@ static const struct vc4_hdmi_variant bcm2711_hdmi0_variant = {
 	.encoder_type		= VC4_ENCODER_TYPE_HDMI0,
 	.debugfs_name		= "hdmi0_regs",
 	.card_name		= "vc4-hdmi-0",
-	.max_pixel_clock	= 600000000,
+	.max_pixel_clock	= HDMI_2_0_TMDS_CHAR_RATE_MAX_HZ,
 	.registers		= vc5_hdmi_hdmi0_fields,
 	.num_registers		= ARRAY_SIZE(vc5_hdmi_hdmi0_fields),
 	.phy_lane_mapping	= {
@@ -3428,7 +3427,7 @@ static const struct vc4_hdmi_variant bcm2711_hdmi1_variant = {
 	.encoder_type		= VC4_ENCODER_TYPE_HDMI1,
 	.debugfs_name		= "hdmi1_regs",
 	.card_name		= "vc4-hdmi-1",
-	.max_pixel_clock	= HDMI_14_MAX_TMDS_CLK,
+	.max_pixel_clock	= HDMI_1_3_TMDS_CHAR_RATE_MAX_HZ,
 	.registers		= vc5_hdmi_hdmi1_fields,
 	.num_registers		= ARRAY_SIZE(vc5_hdmi_hdmi1_fields),
 	.phy_lane_mapping	= {
@@ -3457,7 +3456,7 @@ static const struct vc4_hdmi_variant bcm2712_hdmi0_variant = {
 	.encoder_type		= VC4_ENCODER_TYPE_HDMI0,
 	.debugfs_name		= "hdmi0_regs",
 	.card_name		= "vc4-hdmi-0",
-	.max_pixel_clock	= 600000000,
+	.max_pixel_clock	= HDMI_2_0_TMDS_CHAR_RATE_MAX_HZ,
 	.registers		= vc6_hdmi_hdmi0_fields,
 	.num_registers		= ARRAY_SIZE(vc6_hdmi_hdmi0_fields),
 	.phy_lane_mapping	= {
@@ -3484,7 +3483,7 @@ static const struct vc4_hdmi_variant bcm2712_hdmi1_variant = {
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

