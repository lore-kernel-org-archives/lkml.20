Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA952E8B64
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 03:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788318812; cv=none; b=TnE6flnN7ZueZbqGYLRjqsgi2VWhLS1Gq2sWz8Y+0LXpnIP3pxqp8Qdqi9fOrtHkQmQfB5KDOA8w9vIKrxAh2k2o8N3KoalVraHmjRAlDZK54vWkMJCsyv6thor+ECN98OTzSS9EAxQRqs854AQJTGn7JJDt/39MSF1f0xezGHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788318812; c=relaxed/simple;
	bh=ZCFXqD0qH+frJd8FQxXIN9FL/o/eJwoHGHcxHsrk2GI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qLUKD6UGN5m2lNt8fL7Hisb5Fvp1LKMpU+aiXA9NMTQGajPlkTxxkhpvUHd/iFuAWMvOdr6En64RM5G9MieZ4Kp7AXBh3Vihb7HvaPoFc1KH8j+he5uMAfUQjdkF0wsqfhXmZrJ4nTvjI7+PIeeMxWURdkHFn8D/1THA4itx7dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=gM0QXyEC; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="gM0QXyEC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Xd
	Olvnf0kNLdmnj7QhhCR0Qpd7tZIaYX8X0Qtv2j1ls=; b=gM0QXyEC+cBDkj+xBQ
	PxOl9R32S26qR4laebtgHMsPbH+/KrZ7lwIqUUOsH+7gEXFKGHcxN4EfS8Oshf9c
	CGxnu9gZQu/oqnriKLiTq896cBOnMhO1l/IGUN+DOGnMpzJIyFBiWeHlglkZ2Xbf
	8F4SaqNdw25qrHOgwknzyVs7I=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgDnrxQilJdqv626OA--.15776S2;
	Wed, 02 Sep 2026 11:12:35 +0800 (CST)
From: oushixiong1025@163.com
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Shixiong Ou <oushixiong@kylinos.cn>
Subject: [PATCH] drm/modeset-helper: Add blend mode property to the legacy primary plane
Date: Wed,  2 Sep 2026 11:12:32 +0800
Message-Id: <20260902031232.165532-1-oushixiong1025@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgDnrxQilJdqv626OA--.15776S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFy5ArW7Cw4DJrW3ZFW5Jrb_yoW8CryrpF
	sxCFZ8tw1rtFs3Ja4rC392ya15Wan3Ga48Kry2q3sI93ZxKry3Arn8Gr17KFy7Jr4xJr1a
	g39rAr1DZF1UuaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jFa0PUUUUU=
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/xtbC-QOtvGqXlCNMxAAA3t

From: Shixiong Ou <oushixiong@kylinos.cn>

The primary plane created by drm_crtc_init() exposes ARGB8888, which
has an alpha channel, but never gets a "pixel blend mode" property, so
drm_mode_config_validate() warns for every driver using this helper
(radeon, gma500, legacy amdgpu DCE). Advertise only
DRM_MODE_BLEND_PREMULTI, the mode userspace always assumed when the
property was absent.

Fixes: 860e748bddcc ("drm: ensure blend mode supported if pixel format with alpha exposed")
Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
---
 drivers/gpu/drm/drm_modeset_helper.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/drm_modeset_helper.c b/drivers/gpu/drm/drm_modeset_helper.c
index e54584da4c3d..4c59e82af2f1 100644
--- a/drivers/gpu/drm/drm_modeset_helper.c
+++ b/drivers/gpu/drm/drm_modeset_helper.c
@@ -23,6 +23,7 @@
 #include <linux/export.h>
 
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_blend.h>
 #include <drm/drm_client_event.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
@@ -160,6 +161,17 @@ int drm_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
 	 */
 	primary->format_default = true;
 
+	/*
+	 * safe_modeset_formats[] includes ARGB8888, which has an alpha
+	 * channel. Advertise the blend mode userspace has always assumed
+	 * for such planes when the "pixel blend mode" property was absent,
+	 * to satisfy drm_mode_config_validate().
+	 */
+	ret = drm_plane_create_blend_mode_property(primary,
+						   BIT(DRM_MODE_BLEND_PREMULTI));
+	if (ret)
+		goto err_drm_plane_cleanup;
+
 	ret = drm_crtc_init_with_planes(dev, crtc, primary, NULL, funcs, NULL);
 	if (ret)
 		goto err_drm_plane_cleanup;
-- 
2.25.1


No virus found
		Checked by Hillstone Network AntiVirus

