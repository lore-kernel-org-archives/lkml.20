Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793798799;
	b=LIEAXxTaDnk6oArBBKPFABEQ3RK+Zk71n8cGiq/GPVimc0qasBlDpV7iTZBsMQ77dcw2
	 0DhdxXlsUEBZITmGryM2p/sKRcZHwnWvPIgJL9u8g6OCPoOfkQPBhq0zNvgqXVekEq5Gc
	 mDjiGkMzzHTVSMdSbH5l5ABxjMLU7s10XAFum3LV59xQoIpAHN3ffI6QnwpRhP5tbbSWf
	 HFDIhKLlpwQW8S5LduqkPCvzZtJnSUGsbthVW9D6OgOYHk0LeZKloS5slgV2D+lrwYROf
	 okc8W5T+T8VCFx5xPSJsNuQaU8QSLY9MJf0JZ6nPYhtT3B9pL2mIwn1zKz/YMi2+4cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793798799;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=IRq1hgTsSFPMUnkQi33D7O/JWB708T+5Lj1ls2G3doM=;
	b=U9HVynm+V6pTWOnMZCkh74P+6ElwQZ33WCada/vbz/+idrALXm2iUTVM10KOAYbrh8rb
	 zvuWxdQrEAIy9+Fy2+xgMbWklbZf+fozAQhYKSTZRN/ENcgTMID1zSz6PRLzePK4FNBQv
	 bI3pOCz74wI7G0gfqv0mm/bETuNmpqAo5jYWt0fiqnu9TK6zDf2059KgTNVgBhQB2VJR8
	 z41UzwSgx+o+/VgbXNdFaLohFM2GFiuxlSI8El8Wj5KAELr5IuIIW/DxXBlY3oEddzOXZ
	 mCfwtjhZ+EgZxPxxlnHvLoijga6BKc7PcLcCtuKvGjequ4tAKp9sxUNDdNrPQOlfnbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=fT6i72k8;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91126606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:26:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91126606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=fT6i72k8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793798797;
	bh=yTiTiM/lpOGg/CHrEbJpkmf8z47uryAwOXKud9OkCyk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fT6i72k8HV9AaBl+Wu5CA4NVP6RxgABfD0fakaeowKH0rFYJCptVPUevYeUEVn6Ve
	 pO6vl0LY3eL5095GudQgs6d+x+kHoI0kQVDPLUPZiIZA41jBUryXVQD2FdhJJm9wxZ
	 rMmCzgX3wosXM+gv77CkfsX6kgAA8COwrJWxSPLDTwiJo4dPN7WU5XiEjv9y3EIKH1
	 iryTW3pHUJj+FI8ldf+VfslzyIogWduJGlLuVKk/ZdNf1b0jD/dJz3XiWY3qrBQONQ
	 jTA2kOQU60vf2vF3A5c4kI98/xFEiu+5Wpm/IzR+dUjv6wZjBEJpg5hLkkKaiQTNbP
	 dsPLExq5q/IpA==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F0B0117E0400;
	Wed, 04 Nov 2026 14:26:36 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 04 Nov 2026 15:26:20 +0200
Subject: [PATCH 1/3] drm/display: hdmi: Prevent NULL pointer dereference in
 sync_scdc()
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
Message-Id: <20261104-hdmi-scdc-scramb-fixes-v1-1-16a9bb3d64a6@collabora.com>
References: <20261104-hdmi-scdc-scramb-fixes-v1-0-16a9bb3d64a6@collabora.com>
In-Reply-To: <20261104-hdmi-scdc-scramb-fixes-v1-0-16a9bb3d64a6@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
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

-- 
2.55.0

