Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B8E35203C
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 00:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790814424; cv=none; b=CldGOM1onr0z/05hXbMRApp46F/wJWLLe+p1NHfCzKPdD4P6jaOdRzKVGw+YCwiV4v9C5KsqAfGdHeWVr7qt7sJcDMmN6awp4mzCA1FGLrThEWijhrrxLSvxSNzUZHJhdkDfjJBa+4bxNlr6MXEEPxCwXBjV7Bhl4rLbrtQSXlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790814424; c=relaxed/simple;
	bh=W2m7Jca/rq/QUZdEC4unu3AGFLZj7t3LTmYrZHCk2pg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PpFQFO1Ql8Enzg8Hwlx14F6x+0vSQjwvvgxHdhg2+vJqbmImO0csbNTD2+bW2ONDMvhxtPlJEOJGkB13mj3qwvYBZAG1LUa01zN5PU+gKwfhCFzYv9tdgr6WP6yoqvHAQIS8yrblF7guAY3MyN3ynTDX5Os6wExdZQylEGQbhX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=i3L4+zC9; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="i3L4+zC9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790814421;
	bh=W2m7Jca/rq/QUZdEC4unu3AGFLZj7t3LTmYrZHCk2pg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=i3L4+zC9fWqI9Jwpl6d+Rlh40bWj+3I4xR1EWvpRArPgQW+y0OJBbGifykYZWHeWz
	 gdtdHUAD1zmpSxkgPYLm1KC3Ora6Ptn3Ax949kwzMAnEUzbadroHIbioNuVOhsypP+
	 s54xoS0YqInhKMSmTRajrm737ruVcA8VtB6OZ7k50cRgfLxZUbazc1zSxghbKysnH3
	 eq26zIH91DobrO0nB9WVxEMmuHFk0VLCr1TARrmKWMQ8gKzdN4G8rzyoPvy40Z/d9D
	 vu7eEZzc53bELvnv+DSTO5ZsZl0jFUdBgbQPPTyIUq7k+AuJVIcMZCDkFUbph17U4J
	 iswP4mWuECucQ==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 09BF317E0D3B;
	Thu, 01 Oct 2026 02:27:01 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 01 Oct 2026 03:26:16 +0300
Subject: [PATCH 3/7] drm/vc4: hdmi: Switch to .force_ctx() connector helper
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-vc4-common-scramb-v1-3-51280460194b@collabora.com>
References: <20261001-vc4-common-scramb-v1-0-51280460194b@collabora.com>
In-Reply-To: <20261001-vc4-common-scramb-v1-0-51280460194b@collabora.com>
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

Use drm_atomic_helper_connector_hdmi_force_ctx() as the .force_ctx()
implementation, so that the acquire context created by the probe helper
reaches the HDMI connector framework.

This is a prerequisite for converting the driver to the common HDMI 2.0
scrambling infrastructure, which implicitly handles SCDC state recovery
through a CRTC reset when the sink reconnects while the display pipeline
is active.  Note that this does not interfere with the local SCDC
state-management implementation, since the driver's scrambler capability
has not yet been exposed through the common helpers.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 26c63ce2dc2f..7c921a444e98 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -505,7 +505,6 @@ static void vc4_hdmi_connector_reset(struct drm_connector *connector)
 
 static const struct drm_connector_funcs vc4_hdmi_connector_funcs = {
 	.debugfs_init = drm_hdmi_connector_debugfs_init,
-	.force = drm_atomic_helper_connector_hdmi_force,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.reset = vc4_hdmi_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
@@ -514,6 +513,7 @@ static const struct drm_connector_funcs vc4_hdmi_connector_funcs = {
 
 static const struct drm_connector_helper_funcs vc4_hdmi_connector_helper_funcs = {
 	.detect_ctx = vc4_hdmi_connector_detect_ctx,
+	.force_ctx = drm_atomic_helper_connector_hdmi_force_ctx,
 	.get_modes = vc4_hdmi_connector_get_modes,
 	.atomic_check = vc4_hdmi_connector_atomic_check,
 	.mode_valid = drm_hdmi_connector_mode_valid,

-- 
2.55.0

