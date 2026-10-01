Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8533A4AD7CB
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 22:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790893592; cv=none; b=ZEGJskaYjTWm/paVYIxaWYvOxga20y9uyNCPEd1RRYg0GMr8H/zP6827Nwg2+jHPwsE/waJ7M2Zid9WP8ef3m+zBV4HFnbUZJZOjKpnEzCMn0hzRTcfk/7qdI3JcFJ0dyikm9QRdLbdXIpWppRRFZMfmw0F8h3dojVPG4zEA9Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790893592; c=relaxed/simple;
	bh=a502TtNr4VrqlVPyn8osIApydd3Tk0Kn8V2v4c6+miI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NBg9VBu+7LdZTm6HgC9ljb9E8pnS/xV7OG85HWSBwAvDhaE2Odzc3IqXzLpoezr9OeuV4prTjwwuEyyzuhX2Am3JWFsDLcKfiyKQuLsgKlV1d1dtjzB7E72qqjeAm4C/kmGcOte2RA3rK1V3emGIUt6A8xwMWHGGohOXECisTrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=R5njMsEu; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="R5njMsEu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790893588;
	bh=a502TtNr4VrqlVPyn8osIApydd3Tk0Kn8V2v4c6+miI=;
	h=From:Date:Subject:To:Cc:From;
	b=R5njMsEuvwtWrT3nuNcNAqnN7l86Cb0gO1V8EIPubq4kIcYkl/scjSzglPvQbtSEE
	 X53ZDDF7hp550uh9GfFLLkba8ao/LfCvdOz4tYlo+xIQOi+VPU/3E0bK133JlC22YL
	 YVUHsnuwknLKrXuNHP04RDxhHFxTA1r9W1fSwpU4s/cfNo2L5ui1bW9PtPxIuBisq1
	 //jlvZwXCgYluD4QyuJmcWE8nBHMBzCpPstaWXLyAUy8RhF5l/NyORi0y4hIorlFmT
	 I0ENvy0vMwxKeFx2Lc3gSWhIv7ZIFvnXcEXD8FMChBtXBFvYrJcSp0SYG4IchXMvmW
	 ZJ9R3pN/uZhow==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 72AA917E005A;
	Fri, 02 Oct 2026 00:26:28 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 02 Oct 2026 01:26:14 +0300
Subject: [PATCH] drm/display: hdmi: Prevent NULL pointer dereference in
 sync_scdc()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-hdmi-sync-scdc-fix-deref-v1-1-d99b4f544dd4@collabora.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDQAyF4atI1g3MTItKr1K6sEnUCE7LRMUi3
 r1TXX4P3r+BSVIxuBcbJFnU9B0z/KUA6pvYCSpnQ3Ch9M4F7HlUtG8kNGLCVldkSdKir/3VVRX
 zrW4g3z951PVIP56nbX4NQtO/B/v+A8/DOw98AAAA
X-Change-ID: 20261002-hdmi-sync-scdc-fix-deref-1813077dd48a
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Dan Carpenter <error27@gmail.com>
X-Mailer: b4 0.15.2

The connector pointer is used to initialize the local variables hdmi and
dev before the NULL check takes place, leading to the following Smatch
complaint:

  drivers/gpu/drm/display/drm_hdmi_helper.c:663 drm_connector_hdmi_sync_scdc()
  warn: variable dereferenced before check 'connector' (see line 657)

Move those initializations after the sanity check to avoid a potential
NULL pointer dereference.

Fixes: d653818324ed ("drm/display: hdmi: Add HDMI 2.0 scrambling management helpers")
Reported-by: Dan Carpenter <error27@gmail.com>
Closes: https://lore.kernel.org/all/arJo7A7L5hud3tyc@stanley.mountain/
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_helper.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_helper.c b/drivers/gpu/drm/display/drm_hdmi_helper.c
index f85cce3d6254..872f7e32e8d2 100644
--- a/drivers/gpu/drm/display/drm_hdmi_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_helper.c
@@ -653,9 +653,9 @@ EXPORT_SYMBOL(drm_connector_hdmi_disable_scrambling);
 int drm_connector_hdmi_sync_scdc(struct drm_connector *connector, bool plugged,
 				 struct drm_modeset_acquire_ctx *ctx)
 {
-	struct drm_connector_hdmi *hdmi = &connector->hdmi;
-	struct drm_device *dev = connector->dev;
+	struct drm_connector_hdmi *hdmi;
 	struct drm_connector_state *conn_state;
+	struct drm_device *dev;
 	struct drm_crtc *crtc;
 	u8 config;
 	int ret;
@@ -663,6 +663,9 @@ int drm_connector_hdmi_sync_scdc(struct drm_connector *connector, bool plugged,
 	if (!connector || !plugged || !ctx)
 		return 0;
 
+	hdmi = &connector->hdmi;
+	dev = connector->dev;
+
 	/*
 	 * This is normally part of .detect_ctx() call path, which already holds
 	 * connection_mutex through @ctx.  However, re-acquiring it with the

---
base-commit: 37b346eab23aead52d17a8fa687056bfc651a416
change-id: 20261002-hdmi-sync-scdc-fix-deref-1813077dd48a

