Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794269628;
	b=c6rUSe73IxADCVURlRFPAZxi4JqBT7ijOtVSyHTF+ONLtXyDn3vFOFnAcBkeF3Opfnl8
	 1BpQ8+QY7mjdCLAw3Kxs40sQ8ZZWQWhPQxDvuZ2kS+mKyMh5h4O58GQVUhW7osKt6cAPR
	 yEGqYVCsShf0HdirmeXvQo+8plDXHZLyJZtvgX5HUFgzJm21zYe0gSHXFxVaUqQv+QPkE
	 5hIns6PYCUBwe7Z4qLuIku+ts50fJV4vfS4y9c3mc0K7NiFldkk7BtyxVKYze2nJWXMhe
	 TMMUi6nRPopAPU8ALHgQnIBe6yRAjgkRRCRRce7MooYVNCibiy6cF0oivO5YzVuHTiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794269628;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=P15NPxmPW0HdhWFWBQuqW5H4MRSb6+KCJ6dGVFBto2g=;
	b=2P5SvE+vnXV7CirFVRTHpnB0Dg8pE9PqhUmo1C1rS2TuMifzweK6mBGJknM9SIEUWZGx
	 vmvEhmoHrV9294ySNTK0Bu4f/gIfS/6+yAtCIH7rKEdeUvaU6GRt6wlasY+G5Z99IITel
	 BGrOBDPS9dcB3p2XkorT+9lDB8OfIqouXkB12ni20rurohcHoqLNUFbbIaB9BX20a0Sgp
	 A+B6OSKDtzgeOisorPuMe6XB0iiaWkLH2YcLx0W1Dud92x46nG4qYhITLvCQ8g/nVQ5Xq
	 rCB44yB8jvfZtvw20o3fPnuQuGaYYQ8/CogcVtmNDvdOLsyHySOc+Jt7Hnq9iquC76Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=ezCr+9SN;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2799C606A33C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:13:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2799C606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=ezCr+9SN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794269626;
	bh=wCOnp9+5u8evN0rwFofYAOmzMKIlis4jJWgauhb4z0g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ezCr+9SNN59szgGcm4IM919KpQ52EWmW5VTxUN1dS2soLiHkhZAmQTUZaf0RH3dYQ
	 iisnDToBHCxCt2dMTTdvOkkWO2Q7kV34BXk8TMdfUwGp/YfGw15R1Mnjg//Zd18Q5L
	 xF8m32eGyIqaMgzVYMTE03vf25pHusyYzexjJlEerplF57FpdM81D35jdTRmq/sPHa
	 c2m5xavdbfIUC/E7sSojMXvi40GFl0W0RVgDO1l2wQ1+/yYpqmy7QFS0hATd/VEZx5
	 cG6eda9niJK/QOKmnX9+zKWzlrarapzxCZ7ZTdzY3xCu+Uy4UIn5SjFlZA0mjAR7hk
	 chSnm/c44sPWw==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7011917E3610;
	Tue, 10 Nov 2026 01:13:46 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 10 Nov 2026 02:13:45 +0200
Subject: [PATCH v4 8/9] drm/vc4: hdmi: Bump BCM2835 max pixel clock to 165
 MHz
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
Message-Id: <20261110-vc4-common-scramb-v4-8-eaa141a0da0f@collabora.com>
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

Historically, the HSM clock for BCM2835 was fixed at 163.7 MHz.  Since
the pixel clock had to be at least 1% below the HSM clock, it was capped
at 162 MHz.

Since commit cd4cb49dc5bb ("drm/vc4: hdmi: Adjust HSM clock rate
depending on pixel rate"), the HSM clock rate is set to pixel clock *
101 / 100.  For a 165 MHz pixel clock, this gives an HSM rate of 166.65
MHz, which, per Dave Stevenson, the hardware can handle without issues.

Increase the max pixel clock to 165 MHz, which matches the maximum TMDS
character rate of HDMI 1.0 through 1.2.

Suggested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 04712e975051..29e608e4d610 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1333,7 +1333,7 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
 	 * users are able to use pixel clocks closer to HSM's, namely for
 	 * 1920x1200@60Hz. So it was decided to have leave a 1% margin between
 	 * both clocks. Which, for RPi0-3 implies a maximum pixel clock of
-	 * 162MHz.
+	 * 165MHz.
 	 *
 	 * Additionally, the AXI clock needs to be at least 25% of
 	 * pixel clock, but HSM ends up being the limiting factor.
@@ -3203,7 +3203,7 @@ static const struct vc4_hdmi_variant bcm2835_variant = {
 	.encoder_type		= VC4_ENCODER_TYPE_HDMI0,
 	.debugfs_name		= "hdmi_regs",
 	.card_name		= "vc4-hdmi",
-	.max_pixel_clock	= 162000000,
+	.max_pixel_clock	= HDMI_1_0_TMDS_CHAR_RATE_MAX_HZ,
 	.registers		= vc4_hdmi_fields,
 	.num_registers		= ARRAY_SIZE(vc4_hdmi_fields),
 

-- 
2.55.0

