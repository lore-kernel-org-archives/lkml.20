Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793487551;
	b=JyDxgz2YZ0EUg8NFQJpbbPHnCD3sp8YUUcPC7UiXX/eN0uoZeKIOitFSaud6u95cA0YA
	 DIDVHHpxNeAsG6wbpW0ajqX1uM4EE37aWakedswh3ONzeI4sM/WxB5XVehlmhHdvzG5BT
	 Y+rrw66aIAxkRJA3Kfg+CL3s3dGPHXHTyVH1SNzLiS3c0mri5jKKJVMosTVa8S6t7Nq/6
	 FLtipGezrNSr2h8wdvGC9cwizkhLraZyqtd1SXHrgrRIgpGkIkGKZVXdXpTeRCkjXh8Pf
	 Ki7QoXGPMagpBc0/43LH9w8eMui28gjAaXEIPNdCcoYBdKHnJq2L3fBvF6VlwP6cYtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793487551;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ms+e+r+XcjJUf10RLONsKRvaYJt9n/+LlWA/9aLUivk=;
	b=HNBCl9444rEBdr74aLgmu07poG8yg6fNPbVwTDpOIn1zHh3epAxzDQ94ZhtDsciBJkCH
	 wzgyKlkPEgWtjQAtr+vvIpSdjZjn/ZpSi+acSKhSJNrCREVqvEfm0bKGrdJvCOJtQMrF6
	 l6mdHE0i51msgL29zAzQnfBeJ0Ez9A1jNYl4uJkn8EkUWws2v8FxWxAumezHsqVCwC4bM
	 m5v5jsUu5vQObgTv7FCYxvylpD7q1dnTfICeseNKJqjQYB8Sx3tqmajx/fdKqi4PQA+AA
	 V2TsCnFe39m7PBI+qMQUrXDP7Ddze10H8EwOVyL9Ij6OA9lL0QhVZWVkIfDggDR08ZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LNJ8VM5N;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ILyyyXwY;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21A8606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 22:59:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C21A8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LNJ8VM5N;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ILyyyXwY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793487549;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ms+e+r+XcjJUf10RLONsKRvaYJt9n/+LlWA/9aLUivk=;
	b=LNJ8VM5NZwO2oKZIr3J+pShkVDssx/MJcGcBaW0WxjdXMoshYC/eC/Wo0uH6gV4oZpXgwh
	uXzucY9fRUrtBUjQLJ0KrlCf1iQUr6O7XpmN7Ur/dzOHtkEX2RVj2FgOlad7KhOCU1V8Y9
	Jb/Oidyt/nftmbvSckhtaR9xTaRAY60=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-306-b0eZHIefPLasSYe46TaBzg-1; Sat, 31 Oct 2026 18:59:08 -0400
X-MC-Unique: b0eZHIefPLasSYe46TaBzg-1
X-Mimecast-MFC-AGG-ID: b0eZHIefPLasSYe46TaBzg_1793487547
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a17741243eso13360325e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 15:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793487547; x=1794092347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ms+e+r+XcjJUf10RLONsKRvaYJt9n/+LlWA/9aLUivk=;
        b=ILyyyXwYbS/kftSg5E6JaOgozW+o6ASM/HvwsYfYxOzetsw+w5QBWTPW8LN1Tpay5x
         pgKdP6LK0kQmbyPCoinawtQpD49w2+gKBgUtdyxkofFIouKjMssH4KfkI+0JXp9jxSfC
         s0LYawqSuoXGkGl1iJcTcd+PpKW2B28yQUBzGFEQow8x9jbwHXQP1SrhCwaA1pOhuZHn
         tsjeTKXsZYSA9z+bunePZQjbIPKxeyQT66atV+YAwFTMllW8+uSjZ6zQ9fJoJ8hUlW93
         63IfIc1yI3eJDwxEV+wm0YxBTiNzlnpuuijQh3m08ODBpuT7B+jb/L71adk0lLdmoKPW
         DK3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793487547; x=1794092347;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ms+e+r+XcjJUf10RLONsKRvaYJt9n/+LlWA/9aLUivk=;
        b=cHFAOj2tRBh+XmLSCgoU8OtQjYQIMdQivGlTYc98u5wve4qB1LezBmJbOg9BGXJfAs
         UFQLuA4TiZG9lastOfTo2wlpPLLVrI04EWgPejgf7mBfJz+yCfPjLLYzz8gtSO2aUSiT
         q/oH65ix7++YeZtGoPBZ2e3fGaYJqa2/8v7j/+g18j5oz43NvFrK/WNJglStigtE88WY
         zJPS0HEN5v52SjB82d9Ksa3QXTz5d2IWH2YvO3LpF0cQbuv0HJ1lcsM1tcg3d2yQoVjz
         sZCT5VvxAV21MVx2e6pOT/8T3SRVfW0XexBtWGaT35NWyftdgXQ5IPPEeN/p5pmiewm0
         rjiQ==
X-Forwarded-Encrypted: i=1; AKwUvBxOEm6TuwgWuiIyVaV0PUVXXezWHrY7jNjoEG0f3nQ/HO503wqKBzxLXRJpUs3ahA5mxRxbJma14XU9FYg=@vger.kernel.org
X-Gm-Message-State: AFq9FYK4faoUJd02VhBHI9Zkf5dO28GmKG+pAEpVrNFn0zIBwzjHw495
	UT+NEy7wzw1hBopz7+zgqLSapDnMChqxOcEl2FO7wnXFSpQnb/Of0lInzabaneMZ0LDunkEcNYI
	MD468VrWnpNzFUIxo6Kt4s1fKeq2xTfh5oSY067KsXLk7hgklmh3mDxf/lsH1t+dkMQ==
X-Gm-Gg: AYBFou1mHeWHkcMxjdDfiPtUILIOYeSAYiGh1gzbIlujhpVar4L034jBIS5ty3/Bbnb
	s51AY4HMj1YdCBk4WbnqGyXVyqF10X2kMh/1rgyyKiafqTwhyUgmgUZrFgHw4Ar2CVcjRUQUj9O
	o0P5LYXIFibxmOsIAQas7hrDPOvs2zmdEv8B1bKsF41sa8BXBc8Kcy41CwLfVhpfgKKfqbFvTOt
	3AFx8vKGPCcStR20Se72e0BQ2aHyepVuCuxtdj1rMUCVIG06qV+Cg/rvC6aicvbK27iZtRk5T4P
	1BDwevHbSNgh9Yf7ItVexSzSwl6iG7fsv6KHb0Li7+OocmNaYZvGyQdrLXLM6E3WxIAQVGj9WPt
	6eXcGzR+7xeXixnA7Kow48V+/uq0UuaOCnLIcwPV2BkCVTp5bVhUbjmeFW96iAYjHYCPuDoPhgY
	REatLQ3m6ieJIjS7f7lwP1Ws8CSJm56ACrVBJzvvcUyDShqdTjiA==
X-Received: by 2002:a05:600c:524c:b0:4a1:e6c5:e44c with SMTP id 5b1f17b1804b1-4ac17470f97mr144612685e9.10.1793487546908;
        Sat, 31 Oct 2026 15:59:06 -0700 (PDT)
X-Received: by 2002:a05:600c:524c:b0:4a1:e6c5:e44c with SMTP id 5b1f17b1804b1-4ac17470f97mr144612375e9.10.1793487546515;
        Sat, 31 Oct 2026 15:59:06 -0700 (PDT)
Received: from toolbx.fritz.box (p200300c1df20b900aff65c27eee3dd92.dip0.t-ipconnect.de. [2003:c1:df20:b900:aff6:5c27:eee3:dd92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf6e63e0esm204535345e9.12.2026.10.31.15.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 15:59:05 -0700 (PDT)
From: Sebastian Wick <sebastian.wick@redhat.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>,
	Haneen Mohammed <hamohammed.sa@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Melissa Wen <melissa.srw@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Subject: [PATCH 1/2] drm/vkms: Add drm_dev_enter/exit guards for hot-removable paths
Date: Sat, 31 Oct 2026 23:58:58 +0100
Message-ID: <20261031225901.3200167-1-sebastian.wick@redhat.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation for switching to drm_dev_unplug() for ConfigFS device
removal, add drm_dev_enter()/drm_dev_exit() guards to vkms callbacks
that can be reached while the device is being torn down.
drm_dev_unplug() relies on these SRCU guards to wait for in-flight
operations before proceeding with teardown. Without them,
synchronize_srcu() completes immediately and the teardown path can race
with in-flight operations.

Guard the following callbacks:

 - vkms_connector_detect() and vkms_conn_get_modes(): called from the
   MODE_GETCONNECTOR ioctl via fill_modes, which holds mode_config.mutex.
   Without the guard, an in-flight getconnector can hold locks that
   drm_atomic_helper_shutdown() needs.

 - vkms_wb_connector_get_modes(): same fill_modes path for the writeback
   connector.

 - vkms_set_crc_source(): called from the CRC debugfs release path. The
   debugfs proxy explicitly does not protect the release callback
   against removal races, so this needs its own guard.

Atomic commit callbacks are intentionally not guarded: they are
serialized against drm_atomic_helper_shutdown() via modeset ww_mutex
locks, and must remain functional after unplug so shutdown can disable
CRTCs.

Signed-off-by: Sebastian Wick <sebastian.wick@redhat.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c  |  8 +++++++-
 drivers/gpu/drm/vkms/vkms_connector.c | 14 +++++++++++++-
 drivers/gpu/drm/vkms/vkms_writeback.c | 13 +++++++++++--
 3 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 0fc915a954ba..e0576edd7168 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -5,6 +5,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_blend.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_colorop.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_fixed.h>
@@ -731,11 +732,16 @@ int vkms_set_crc_source(struct drm_crtc *crtc, const char *src_name)
 {
 	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
 	bool enabled = false;
-	int ret = 0;
+	int ret, idx;
+
+	if (!drm_dev_enter(crtc->dev, &idx))
+		return -ENODEV;
 
 	ret = vkms_crc_parse_source(src_name, &enabled);
 
 	vkms_set_composer(out, enabled);
 
+	drm_dev_exit(idx);
+
 	return ret;
 }
diff --git a/drivers/gpu/drm/vkms/vkms_connector.c b/drivers/gpu/drm/vkms/vkms_connector.c
index b0a6b212d3f4..81cd845cf84f 100644
--- a/drivers/gpu/drm/vkms/vkms_connector.c
+++ b/drivers/gpu/drm/vkms/vkms_connector.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_probe_helper.h>
@@ -16,6 +17,10 @@ static enum drm_connector_status vkms_connector_detect(struct drm_connector *con
 	struct vkms_connector *vkms_connector;
 	enum drm_connector_status status;
 	struct vkms_config_connector *connector_cfg;
+	int idx;
+
+	if (!drm_dev_enter(dev, &idx))
+		return connector_status_disconnected;
 
 	vkms_connector = drm_connector_to_vkms_connector(connector);
 
@@ -31,6 +36,8 @@ static enum drm_connector_status vkms_connector_detect(struct drm_connector *con
 			status = vkms_config_connector_get_status(connector_cfg);
 	}
 
+	drm_dev_exit(idx);
+
 	return status;
 }
 
@@ -44,12 +51,17 @@ static const struct drm_connector_funcs vkms_connector_funcs = {
 
 static int vkms_conn_get_modes(struct drm_connector *connector)
 {
-	int count;
+	int count, idx;
+
+	if (!drm_dev_enter(connector->dev, &idx))
+		return 0;
 
 	/* Use the default modes list from DRM */
 	count = drm_add_modes_noedid(connector, XRES_MAX, YRES_MAX);
 	drm_set_preferred_mode(connector, XRES_DEF, YRES_DEF);
 
+	drm_dev_exit(idx);
+
 	return count;
 }
 
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index ecf29a2c0c8e..e779ace7b383 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -3,6 +3,7 @@
 #include <linux/iosys-map.h>
 
 #include <drm/drm_atomic.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_writeback.h>
@@ -67,9 +68,17 @@ static int vkms_wb_atomic_check(struct drm_connector *connector,
 static int vkms_wb_connector_get_modes(struct drm_connector *connector)
 {
 	struct drm_device *dev = connector->dev;
+	int count, idx;
 
-	return drm_add_modes_noedid(connector, dev->mode_config.max_width,
-				    dev->mode_config.max_height);
+	if (!drm_dev_enter(dev, &idx))
+		return 0;
+
+	count = drm_add_modes_noedid(connector, dev->mode_config.max_width,
+				     dev->mode_config.max_height);
+
+	drm_dev_exit(idx);
+
+	return count;
 }
 
 static int vkms_wb_prepare_job(struct drm_writeback_connector *wb_connector,
-- 
2.56.0

