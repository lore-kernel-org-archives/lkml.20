Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50A442379A
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 10:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788343519; cv=none; b=KMplYwf73ZziO4CpoMSQwMEfnS+Z2P05e617pgZp6ZgxdW0W8oou7Es1lvazgASXnHJbRCJJcE1BaG/eFBe39ux949ON0+7QZjN5zVmqO4R2T2iOGNx8PZiqoc7cLL585ZHuLV5iwsbwsaAKUaeX0MWdOOeqx9uLi8tSq7OXCy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788343519; c=relaxed/simple;
	bh=/UfVrlcUz6vi+o1DCIcOeDsfASUw4d6iM0a2hQpPZzE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XSQMTRQcargJfQe3ctKevgvIrcoMplyGRMA+O5qorJP9JqN32uDbMurGkqvl5WDgXTghROSzSWbMGgYqXh+SAeUA2cDHNoX5lvgmCQuMRqDrNLqGkeNFyC+IQT5DIRBlgN3z7YEsEmR1bVvpn5OUsseEYmLqtUGK/HDs/Fouksk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=e0Zwn7RX; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="e0Zwn7RX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Tt
	I57FI6P+4S01JwxelCRlGKM/Q3SeX+N8ASp/5apcU=; b=e0Zwn7RX+6MnrHmiP2
	WtfiKn9tS6q6uEC8+gc3CHljpcPt8JluTlYE8qIPJsRUbGIpYhajmiRiApLoCiEI
	L+o0kqjdLqviU1sv8z+L8erhZR057l5dZQKS1DL03xpOq29zMfk2EMDngoFxqKPE
	OkMVsnibXa0sS1/0Is1ZOvoa8=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wCnc2qs9JdqrARqAA--.18257S2;
	Wed, 02 Sep 2026 18:04:29 +0800 (CST)
From: oushixiong1025@163.com
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Shixiong Ou <oushixiong@kylinos.cn>
Subject: [PATCH] drm/gma500: Create the primary plane in the driver
Date: Wed,  2 Sep 2026 18:04:27 +0800
Message-Id: <20260902100427.622166-1-oushixiong1025@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wCnc2qs9JdqrARqAA--.18257S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWF4xGr15CryfZFy8uFyxGrg_yoW5CF1rpF
	ZrAF98trWrtFsIgFW5JFsFyF43Wan3G3WIkryfWwnav3Z8try8uFsYyr9rCa47GFW3J3Wr
	trW7tFy5C3W8uw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jnBMNUUUUU=
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/xtbC-Q7o92qX9K5ueAAA3d

From: Shixiong Ou <oushixiong@kylinos.cn>

drm_crtc_init() creates the primary plane from a fixed format list
that includes ARGB8888. The display engine programs the primary plane
with DISPPLANE_32BPP_NO_ALPHA, so it does not support per-pixel alpha
and must not advertise alpha formats. Since commit 860e748bddcc
("drm: ensure blend mode supported if pixel format with alpha exposed"),
drm_mode_config_validate() warns about this at probe time.

Replace drm_crtc_init() with a driver-owned primary plane that
advertises only XRGB8888.

Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
---
 drivers/gpu/drm/gma500/psb_intel_display.c | 38 +++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/gma500/psb_intel_display.c b/drivers/gpu/drm/gma500/psb_intel_display.c
index 0df75a4a7739..336943cfeb68 100644
--- a/drivers/gpu/drm/gma500/psb_intel_display.c
+++ b/drivers/gpu/drm/gma500/psb_intel_display.c
@@ -9,8 +9,11 @@
 #include <linux/delay.h>
 #include <linux/i2c.h>
 
+#include <drm/drm_fourcc.h>
 #include <drm/drm_modeset_helper.h>
 #include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_plane.h>
+#include <drm/drm_plane_helper.h>
 #include <drm/drm_print.h>
 
 #include "framebuffer.h"
@@ -471,11 +474,24 @@ static void psb_intel_cursor_init(struct drm_device *dev,
 	REG_WRITE(base[gma_crtc->pipe], 0);
 }
 
+static const uint32_t gma_primary_formats[] = {
+	/*
+	 * The display engine programs the primary plane with
+	 * DISPPLANE_32BPP_NO_ALPHA, so no formats with alpha.
+	 */
+	DRM_FORMAT_XRGB8888,
+};
+
+static const struct drm_plane_funcs gma_primary_plane_funcs = {
+	DRM_PLANE_NON_ATOMIC_FUNCS,
+};
+
 void psb_intel_crtc_init(struct drm_device *dev, int pipe,
 		     struct psb_intel_mode_device *mode_dev)
 {
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct gma_crtc *gma_crtc;
+	struct drm_plane *primary;
 	int i;
 
 	/* We allocate a extra array of drm_connector pointers
@@ -494,7 +510,27 @@ void psb_intel_crtc_init(struct drm_device *dev, int pipe,
 		return;
 	}
 
-	drm_crtc_init(dev, &gma_crtc->base, &gma_crtc_funcs);
+	primary = __drm_universal_plane_alloc(dev, sizeof(*primary), 0, 0,
+					      &gma_primary_plane_funcs,
+					      gma_primary_formats,
+					      ARRAY_SIZE(gma_primary_formats),
+					      NULL, DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (IS_ERR(primary)) {
+		dev_err(dev->dev, "Failed to allocate primary plane: %pe\n",
+			primary);
+		kfree(gma_crtc->crtc_state);
+		kfree(gma_crtc);
+		return;
+	}
+
+	if (drm_crtc_init_with_planes(dev, &gma_crtc->base, primary, NULL,
+				      &gma_crtc_funcs, NULL)) {
+		dev_err(dev->dev, "Failed to init CRTC %d\n", pipe);
+		drm_plane_cleanup(primary);
+		kfree(primary);
+		kfree(gma_crtc->crtc_state);
+		return;
+	}
 
 	/* Set the CRTC clock functions from chip specific data */
 	gma_crtc->clock_funcs = dev_priv->ops->clock_funcs;
-- 
2.25.1


No virus found
		Checked by Hillstone Network AntiVirus

