Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5FA430CF8
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 10:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788343693; cv=none; b=NSGVm8iVmva9zyqDDyoqIibhv71nPq8QNhvhz/whoHkm5Q1RoRvMQ2XIVMRfTxh2NVSwN/JXSXRVgIQw76+HuVvIwFLn1tZmwMkMyi+VZKdG5v1wVxjlHKHbDAVAWawJnWH1gmBTB/KDqdPwimfK+6ISNoMpvnZlgzmjhDcFJxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788343693; c=relaxed/simple;
	bh=C/xtEIiuX4ttY1e7Xmp5aVSEijhOshxTkYwrXMGp0W0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XBjnoRrPlJvPSRcdeR6FG9AjiZyF5Dh17mh3ZDjgh/heJJ/+5k8aoZ2x4e8hg1dpuNLz1BpWzYp/a4LyYFv6SkH1+LRJU1lndJAucQ8k5oW20OZNv3YhSMVrimKK5MgFORX+fzQxj3mqxFaEcySuCaxxCw+eVORyi9u3izn6aPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=RaA/e5eA; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="RaA/e5eA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=W9
	EeqDPtGbfRUrueo7yJ0lKN2M1jQ6g40CdEA+nhzJE=; b=RaA/e5eAlRyeKSfWPX
	Ci7srqWHtIJMNfiFSJjqznhyAOBt8HU2HdAefcaupQfsjWUkNZcFLvpAeiwplaHJ
	4txJV2mnsW6/Nr4q+eXaeNk+7EB/vfNSxDK6N1Ov1/4w3pU2+K2Ur/uXP28ItDRz
	bK3s0i80kuOqxpSFORpbdhpg0=
Received: from localhost.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgBHcANt9ZdqPVzePQ--.34200S2;
	Wed, 02 Sep 2026 18:07:41 +0800 (CST)
From: oushixiong1025@163.com
To: Alex Deucher <alexander.deucher@amd.com>
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Shixiong Ou <oushixiong@kylinos.cn>
Subject: [PATCH] drm/radeon: Create the primary plane in the driver
Date: Wed,  2 Sep 2026 18:07:39 +0800
Message-Id: <20260902100739.627697-1-oushixiong1025@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCgvCgBHcANt9ZdqPVzePQ--.34200S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXFWUXrWxZrWfAFyDJFyftFb_yoW5uFWDpF
	ZxCF9xtrs5tFs5Ga43ArZFyF45ua1fGw4Iqry2gwnI9rn8try7uF1xZwnrCF18JrZ7Jw1Y
	qF47Ca15Ar409aDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jFxRDUUUUU=
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/xtbC4g0ZKGqX9W3nOgAA3m

From: Shixiong Ou <oushixiong@kylinos.cn>

drm_crtc_init() creates the primary plane from a fixed format list
without a "pixel blend mode" property, so drm_mode_config_validate()
warns although the display engine does support per-pixel alpha on the
primary surface.

Replace it with a driver-owned primary plane advertising XRGB8888 and
ARGB8888, with the blend mode property set to the PREMULTI mode
userspace has always assumed when the property was absent.

Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
---
 drivers/gpu/drm/radeon/radeon_display.c | 42 ++++++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
index aac6733ddd82..058ec866f02b 100644
--- a/drivers/gpu/drm/radeon/radeon_display.c
+++ b/drivers/gpu/drm/radeon/radeon_display.c
@@ -30,6 +30,7 @@
 
 #include <asm/div64.h>
 
+#include <drm/drm_blend.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
@@ -38,6 +39,8 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_modeset_helper.h>
+#include <drm/drm_plane.h>
+#include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 #include <drm/radeon_drm.h>
@@ -664,6 +667,19 @@ radeon_crtc_set_config(struct drm_mode_set *set,
 	return ret;
 }
 
+static const uint32_t radeon_primary_formats[] = {
+	/*
+	 * The display engine programs an ARGB8888 surface format for both
+	 * XRGB8888 and ARGB8888 framebuffers.
+	 */
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_ARGB8888,
+};
+
+static const struct drm_plane_funcs radeon_primary_plane_funcs = {
+	DRM_PLANE_NON_ATOMIC_FUNCS,
+};
+
 static const struct drm_crtc_funcs radeon_crtc_funcs = {
 	.cursor_set2 = radeon_crtc_cursor_set2,
 	.cursor_move = radeon_crtc_cursor_move,
@@ -681,6 +697,8 @@ static void radeon_crtc_init(struct drm_device *dev, int index)
 {
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_crtc *radeon_crtc;
+	struct drm_plane *primary;
+	int ret;
 
 	radeon_crtc = kzalloc_obj(*radeon_crtc);
 	if (radeon_crtc == NULL)
@@ -693,7 +711,29 @@ static void radeon_crtc_init(struct drm_device *dev, int index)
 		return;
 	}
 
-	drm_crtc_init(dev, &radeon_crtc->base, &radeon_crtc_funcs);
+	primary = __drm_universal_plane_alloc(dev, sizeof(*primary), 0, 0,
+					      &radeon_primary_plane_funcs,
+					      radeon_primary_formats,
+					      ARRAY_SIZE(radeon_primary_formats),
+					      NULL, DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (IS_ERR(primary)) {
+		destroy_workqueue(radeon_crtc->flip_queue);
+		kfree(radeon_crtc);
+		return;
+	}
+
+	ret = drm_crtc_init_with_planes(dev, &radeon_crtc->base, primary, NULL,
+					&radeon_crtc_funcs, NULL);
+	if (ret) {
+		dev_err(dev->dev, "Failed to init CRTC %d: %d\n", index, ret);
+		drm_plane_cleanup(primary);
+		kfree(primary);
+		destroy_workqueue(radeon_crtc->flip_queue);
+		return;
+	}
+
+	drm_plane_create_blend_mode_property(primary,
+					     BIT(DRM_MODE_BLEND_PREMULTI));
 
 	drm_mode_crtc_set_gamma_size(&radeon_crtc->base, 256);
 	radeon_crtc->crtc_id = index;
-- 
2.25.1


No virus found
		Checked by Hillstone Network AntiVirus

