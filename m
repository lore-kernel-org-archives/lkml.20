Received: from mail.noirlang.tr (mail.noirlang.tr [217.18.210.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93E33DA5C1
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 11:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.18.210.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792322140; cv=none; b=dD4Nkx5MHQlaFEAwvaRfWzRF8TLzpPGtInxKHvmDOyVvxuzZyfxt+1C+GeZnS3GFjX+9riivOVyyr0fIqhdBIBlXg/D4w3wz4zE7zuzIEcFEGe9AY6Yc2+8CLA6kgUzzrjbDkEiq2AAz6KMilTZXudQ89I5GicI1064h78XKdUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792322140; c=relaxed/simple;
	bh=uagooDmWdsyPLKYdmSRczmN/LIDb7VqxAfG/z/3uxug=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aoaI2D2fA/bNc1ycVQ8q8ZYJZR6hcZCvHuMpA9RqgG9CKGYQPFAF798md49ZFGB+rPNj+NvZawn4FTDFnSbbvyW8Bntciu29Cc5TvRMwssXAix8ix0QGvuGtemBGUUn8R1IFMKAwpnr4X6AgrU/rYx8RCK0JXoFEbpCfgMYye5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=noirlang.tr; spf=pass smtp.mailfrom=noirlang.tr; dkim=pass (2048-bit key) header.d=noirlang.tr header.i=@noirlang.tr header.b=XZhNIahh; arc=none smtp.client-ip=217.18.210.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=noirlang.tr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=noirlang.tr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=noirlang.tr header.i=@noirlang.tr header.b="XZhNIahh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=noirlang.tr; s=mail;
	t=1792322136; bh=uagooDmWdsyPLKYdmSRczmN/LIDb7VqxAfG/z/3uxug=;
	h=From:To:Cc:Subject:Date:From;
	b=XZhNIahhZK1fE7wFkXofCz3uoDx21fCzxRAh7KeD0b70XJ/dMJOMLPZdvRuHcy44h
	 VJpWWBT4m5bxZ8Mdt6dKJ6mQeaIJn5T+bgVibFSV6mYZ9UMZWRkKefXVJamMYJ1F0U
	 BKQowx3UkYw8wFIa5N+DRmVhCT4TJANsZQ9Czy7pCjeLTbhR2BMxpNK5Rxhw5UrFe2
	 C9uS+bnBrZq8pvkgHXJRXXqIwkRr+a0yWd+uesj5aPdsmvkw6yebSRGDuFTDKuUyto
	 RmAIOT/OhA5iAtATjVCKd7MBsaEcY30E2o0i+SlT3manqItTC1VQr0faSfs9Lb3nHj
	 AmneD1p5lppqg==
From: Melih Emik <melihemik@noirlang.tr>
To: xinliang.liu@linaro.org
Cc: sumit.semwal@linaro.org,
	yongqin.liu@linaro.org,
	jstultz@google.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/hisilicon: inline drm_simple_encoder_init()
Date: Sun, 18 Oct 2026 14:15:34 +0300
Message-ID: <20261018111534.354449-1-melihemik@noirlang.tr>
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

Signed-off-by: Melih Emik <melihemik@noirlang.tr>
---
Tested:
- Compiled with W=1 on x86_64 with zero warnings or errors.
- Verified with lockdep and debug mutexes enabled
  (CONFIG_PROVE_LOCKING=y, CONFIG_DEBUG_MUTEXES=y).
- Boot-tested full bzImage in QEMU with initcall_debug, confirming
  successful driver registration (dsi_driver_init returned 0) and
  zero lockdep/kernel warnings.
- Verified with scripts/checkpatch.pl (0 errors, 0 warnings).

 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c b/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
index 15042365dec0..8c83fb09dda7 100644
--- a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
+++ b/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
@@ -20,11 +20,11 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_device.h>
+#include <drm/drm_encoder.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include "dw_dsi_reg.h"
 
@@ -695,6 +695,10 @@ static const struct drm_encoder_helper_funcs dw_encoder_helper_funcs = {
 	.disable	= dsi_encoder_disable
 };
 
+static const struct drm_encoder_funcs dw_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 static int dw_drm_encoder_init(struct device *dev,
 			       struct drm_device *drm_dev,
 			       struct drm_encoder *encoder)
@@ -708,7 +712,8 @@ static int dw_drm_encoder_init(struct device *dev,
 	}
 
 	encoder->possible_crtcs = crtc_mask;
-	ret = drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_DSI);
+	ret = drm_encoder_init(drm_dev, encoder, &dw_encoder_funcs,
+			       DRM_MODE_ENCODER_DSI, NULL);
 	if (ret) {
 		DRM_ERROR("failed to init dsi encoder\n");
 		return ret;
-- 
2.56.0


