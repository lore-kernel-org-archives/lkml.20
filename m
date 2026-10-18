Received: from mail.noirlang.tr (mail.noirlang.tr [217.18.210.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6DBF196C7C
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 11:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.18.210.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792321282; cv=none; b=L3UmavksOq6Y2UMGtVyvkduedxJOGUL9ryaZ7Tb8tQk+mMCTNMLWxPdKmfxs+svXs/JeqCb+n/sNl8S84NQxybyUMVTkK0k7BQPEs1tIQ1KtqnuiCNHbxAUh4o46+pfbcB/+EGv/GPss8x8Ra8nDvhlCD+70UlnMEjDQ70if37I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792321282; c=relaxed/simple;
	bh=1EF87F7qoFRopDJACB+hV3BqN8xT0TAiYUDE1zfK/3M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bd0wPC1rr8PJgC1rAWxiLtB90kwqJFGkpsSSTgiDzCSEf09JdyW+eCb151iEKxXXw7vrso6wlnjCCQWmKOpGKYhduAN06w6WA8VTlUJwWmE7zG1j10t31YZgC5Ciq8QhrJ1cNkYSCpAm05m7iDOJTGbxSG3JjCX0VO0PHsraoEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=noirlang.tr; spf=pass smtp.mailfrom=noirlang.tr; dkim=pass (2048-bit key) header.d=noirlang.tr header.i=@noirlang.tr header.b=ih18nUUH; arc=none smtp.client-ip=217.18.210.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=noirlang.tr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=noirlang.tr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=noirlang.tr header.i=@noirlang.tr header.b="ih18nUUH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=noirlang.tr; s=mail;
	t=1792321279; bh=1EF87F7qoFRopDJACB+hV3BqN8xT0TAiYUDE1zfK/3M=;
	h=From:To:Cc:Subject:Date:From;
	b=ih18nUUH1hhr2Sv33S7GQ6UeQii9gMv6J1+6Dw6LaL7rQXww9ebuSP0nDpxzguAt5
	 n1nqY8dfyLIWngrdSKg3FB8bs54ATg8LtHeyrv2DChJRFBYQIBmi2fCTkxRnvfXPHq
	 Rhp8ca6VsYXYkrOUf/Y2Okr4nb5M6K1Du8oEB6fNgr/ygGhehaeWEm1yCx1QPFFMIp
	 4ISALlFsAgEY1EnEIMuCGSXlDv4aQnMRCBiKlBGsuydwTDjatmCIBAmNtln1MNmofp
	 Ayp4h7euSY5JS1J285g0gEdzGsUusBTlxBEAyxXAXec4J4VaGlfGHA/wlVcGZuONXR
	 JMU/QlJVbJOpQ==
From: Melih Emik <melihemik@noirlang.tr>
To: anitha.chrisanthus@intel.com,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: tzimmermann@suse.de,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/kmb/dsi: inline drm_simple_encoder_init()
Date: Sun, 18 Oct 2026 14:01:17 +0300
Message-ID: <20261018110117.298588-1-melihemik@noirlang.tr>
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
v2:
- Drop "Tested:" meta commentary from the commit message.

Test notes:
- Compiled with W=1 on x86_64 with zero warnings.
- Verified with lockdep and debug mutexes enabled
  (CONFIG_PROVE_LOCKING=y, CONFIG_DEBUG_MUTEXES=y).
- Boot-tested full bzImage in QEMU with initcall_debug, confirming
  successful driver registration (kmb_platform_driver_init returned 0)
  and zero lockdep/kernel warnings.
- Verified with scripts/checkpatch.pl (0 errors, 0 warnings).

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


