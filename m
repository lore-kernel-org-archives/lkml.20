Received: from mail.noirlang.tr (mail.noirlang.tr [217.18.210.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339FA432BF5
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 10:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.18.210.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792320744; cv=none; b=B3gDwoeL5zqQoAUGfmSdOJ/QPYRIlO5jr/MfQo+/MEeSIzc1yQDJPeKngw7I5+mJRLq8pfTqATeFBllbHgOEZAKHkCm+Q7FmLJzfZ+Km54ihxK3bWVMD1bgFN9ITJ+FKv+LnSouhbBzTboWfpvGbkNRSZXNQdF61Dn5IwbAMR6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792320744; c=relaxed/simple;
	bh=xSTVsyBj9rD4xAugyvQE85Q5fUAP+AnMB7S3KA2/zOk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sxUN2OjQdXObkIzmJDM6eRTryWy21DnZob9sOoJ+dpb9xTgc7xEpiiZ4q2o1M2+OUMlR2234qraDtMKIW2Zm7hRvDj6PW13z2EPX/RLnUqtdUPBO9a0lftXcvgM04tjyyHk9nlESMfe+rryQ+8tJn1lh+OFpjQr/WIBp6QM3pY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=noirlang.tr; spf=pass smtp.mailfrom=noirlang.tr; dkim=pass (2048-bit key) header.d=noirlang.tr header.i=@noirlang.tr header.b=rP2HcxCl; arc=none smtp.client-ip=217.18.210.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=noirlang.tr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=noirlang.tr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=noirlang.tr header.i=@noirlang.tr header.b="rP2HcxCl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=noirlang.tr; s=mail;
	t=1792320738; bh=xSTVsyBj9rD4xAugyvQE85Q5fUAP+AnMB7S3KA2/zOk=;
	h=From:To:Cc:Subject:Date:From;
	b=rP2HcxClezToqihQNlj+BD1Sta+DI0tr8Vu+YVHut9nR+i55bG8+HIPXrQ2m9v4zd
	 pRTX5TY9KknuMlLgQIF99sig3ARShfaHn5HifoKp18Zn499ynWIfwFwMPaw37Yc+ey
	 RuybdQfyy/u/rUwAEofMjwG15oyF5QksB1CWUy2nHr7tLl6dVSt+RnJ4TFcIX6BOu8
	 NjiWNmyl3tlFekeGkuxKdtjmj2Dy1Wfiai9NEXhM4pKYfcYyy3zh934JXvaiELawSh
	 Gqw9jE4k9NZsFBkHO0Po/QLrFARIgVX/k72Pw8i30+SmeWl9xIasg8CwtmKd/S06Yw
	 LuqtrhJ2Y7CxA==
From: Melih Emik <melihemik@noirlang.tr>
To: anitha.chrisanthus@intel.com,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: tzimmermann@suse.de,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/kmb/dsi: inline drm_simple_encoder_init()
Date: Sun, 18 Oct 2026 13:52:17 +0300
Message-ID: <20261018105217.233443-1-melihemik@noirlang.tr>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The helper drm_simple_encoder_init() is deprecated because it adds an
unnecessary intermediate layer between atomic modesetting and DRM drivers,
as documented in Documentation/gpu/todo.rst.

Inline the functionality by calling drm_encoder_init() directly with a
local instance of struct drm_encoder_funcs. This allows removing the
dependency on <drm/drm_simple_kms_helper.h> in favor of
<drm/drm_encoder.h>.

Tested:
- Compiled with W=1 on x86_64 with zero warnings.
- Verified with lockdep and debug mutexes enabled
  (CONFIG_PROVE_LOCKING=y, CONFIG_DEBUG_MUTEXES=y).
- Boot-tested full bzImage in QEMU with initcall_debug, confirming
  successful driver registration (kmb_platform_driver_init returned 0)
  and zero lockdep/kernel warnings.
- Verified with scripts/checkpatch.pl (0 errors, 0 warnings).

Signed-off-by: Melih Emik <melihemik@noirlang.tr>
---
 drivers/gpu/drm/kmb/kmb_dsi.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_dsi.c b/drivers/gpu/drm/kmb/kmb_dsi.c
index 59d0e856392f..13adba96bc78 100644
--- a/drivers/gpu/drm/kmb/kmb_dsi.c
+++ b/drivers/gpu/drm/kmb/kmb_dsi.c
@@ -14,8 +14,8 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_bridge_connector.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_mipi_dsi.h>
-#include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
@@ -1427,6 +1427,10 @@ struct kmb_dsi *kmb_dsi_init(struct platform_device *pdev)
 	return kmb_dsi;
 }
 
+static const struct drm_encoder_funcs kmb_dsi_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 int kmb_dsi_encoder_init(struct drm_device *dev, struct kmb_dsi *kmb_dsi)
 {
 	struct drm_encoder *encoder;
@@ -1437,7 +1441,8 @@ int kmb_dsi_encoder_init(struct drm_device *dev, struct kmb_dsi *kmb_dsi)
 	encoder->possible_crtcs = 1;
 	encoder->possible_clones = 0;
 
-	ret = drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_DSI);
+	ret = drm_encoder_init(dev, encoder, &kmb_dsi_encoder_funcs,
+			       DRM_MODE_ENCODER_DSI, NULL);
 	if (ret) {
 		dev_err(kmb_dsi->dev, "Failed to init encoder %d\n", ret);
 		return ret;
-- 
2.56.0


