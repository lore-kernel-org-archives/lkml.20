Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A4C3FF1D5
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788419567; cv=none; b=UbST8/ydeRFZNYtC3YfQRBI2NbqqwlG7KDeENsv5lNKqoEb0pkBwH7hkoiNXCBS9ePJ9zvHQzzj9S7dROWNeWb99b0yztDinPMKBFrHg+Tk30nHs27b6sArdEn0vRHohNN68BrEs7bqZ9pGnIG17C1DWhbv6qFRiJo7n1/x2VPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788419567; c=relaxed/simple;
	bh=JR4pPvec+sLV+RkPOqmcFPpRYuwIIVklN0ZILIEYBsM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Dq8BazZeT5K0WCEKoLY7kAS76JGiF4xdy/qilj/DtrlDnvRj3G82C1Rxif5XGNXeVYChYCLybRDjuVGTNs/tjc9FZB4Pvm1eTzRWUnqPy1njJ2e6DM2abLNut5b5pFP5Bq9p9WEPbUOzPR4zviphSimCQNVUoV/ZfmUUAbbAU3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=lW+8ECNG; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="lW+8ECNG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=BY
	vzxe2xGIWuEyuWCsnHllNcNzMs7YGaDE3CbAnAmiQ=; b=lW+8ECNGm54jj6K880
	ln6PT/MQSPX+bRN7R2vyrmNw4wj1JV5gYSAe1RDysKtfFifpRopqeE/afLrcJk87
	v1eK0/8uXeRgr4nykhIDmmduAuH7lH6aGWGxNHl+gFJhfFlazrPx1TH33KjhawcZ
	lqPBXbhFL4Z8lHHB2xEHs4NAs=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wA31de5HZlq1FxFAQ--.9384S2;
	Thu, 03 Sep 2026 15:11:54 +0800 (CST)
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
Subject: [PATCH v2] drm/gma500: Create the primary plane in the driver
Date: Thu,  3 Sep 2026 15:11:49 +0800
Message-Id: <20260903071149.423579-1-oushixiong1025@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wA31de5HZlq1FxFAQ--.9384S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWF4xGr15CryfCFy5Jry7KFg_yoW5Kw47pF
	ZrAF98tr4rtFsrWFW5JanFyFW3uws3G3WxKryxWwn0vr1DKr97uFnYy3srCFy7GFW7J3Wr
	try5tFy5C3W8Cw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jnmiiUUUUU=
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/xtbC-Rp2hWqZHbplSwAA3u

From: Shixiong Ou <oushixiong@kylinos.cn>

drm_crtc_init() creates the primary plane from a fixed format list
that includes ARGB8888. The display engine programs the primary plane
with DISPPLANE_32BPP_NO_ALPHA, so it does not support per-pixel alpha
and must not advertise alpha formats. Since commit 860e748bddcc
("drm: ensure blend mode supported if pixel format with alpha exposed"),
drm_mode_config_validate() warns about this at probe time.

Replace drm_crtc_init() with a driver-owned primary plane that
advertises only XRGB8888. The plane is allocated by
drmm_universal_plane_alloc() and the "pixel blend mode" property is
not needed because no format with alpha is exposed.

Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
---
v1->v2:
  - Open-code DRM_PLANE_NON_ATOMIC_FUNCS without .destroy, which
    drmm_universal_plane_alloc() rejects
  - Use drmm_universal_plane_alloc() for automatic cleanup
  - Move the formats comment above the array

 drivers/gpu/drm/gma500/psb_intel_display.c | 34 +++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/gma500/psb_intel_display.c b/drivers/gpu/drm/gma500/psb_intel_display.c
index 0df75a4a7739..f79484b9d593 100644
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
@@ -471,11 +474,25 @@ static void psb_intel_cursor_init(struct drm_device *dev,
 	REG_WRITE(base[gma_crtc->pipe], 0);
 }
 
+/*
+ * The display engine programs the primary plane with
+ * DISPPLANE_32BPP_NO_ALPHA, so no formats with alpha.
+ */
+static const uint32_t gma_primary_formats[] = {
+	DRM_FORMAT_XRGB8888,
+};
+
+static const struct drm_plane_funcs gma_primary_plane_funcs = {
+	.update_plane = drm_plane_helper_update_primary,
+	.disable_plane = drm_plane_helper_disable_primary,
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
@@ -494,7 +511,17 @@ void psb_intel_crtc_init(struct drm_device *dev, int pipe,
 		return;
 	}
 
-	drm_crtc_init(dev, &gma_crtc->base, &gma_crtc_funcs);
+	primary = drmm_universal_plane_alloc(dev, struct drm_plane, dev, 0,
+					     &gma_primary_plane_funcs,
+					     gma_primary_formats,
+					     ARRAY_SIZE(gma_primary_formats),
+					     NULL, DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (IS_ERR(primary))
+		goto err_free_crtc;
+
+	if (drm_crtc_init_with_planes(dev, &gma_crtc->base, primary, NULL,
+				      &gma_crtc_funcs, NULL))
+		goto err_free_crtc;
 
 	/* Set the CRTC clock functions from chip specific data */
 	gma_crtc->clock_funcs = dev_priv->ops->clock_funcs;
@@ -524,6 +551,11 @@ void psb_intel_crtc_init(struct drm_device *dev, int pipe,
 
 	/* Set to true so that the pipe is forced off on initial config. */
 	gma_crtc->active = true;
+	return;
+
+err_free_crtc:
+	kfree(gma_crtc->crtc_state);
+	kfree(gma_crtc);
 }
 
 struct drm_crtc *psb_intel_get_crtc_from_pipe(struct drm_device *dev, int pipe)
-- 
2.25.1


No virus found
		Checked by Hillstone Network AntiVirus

