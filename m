Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBDE23B63E
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787907838; cv=none; b=PyLp+NkxbNpMistrE9Wr93BqOrE8YQNEgH5pctedOKX3ZGcD0AdXTx4bKQlCg+ovl0smtWWZSSz5veb39ikazMiy8DbfMCI8XYNbvaKbFALtDn/N+VADjC57Cg1Ng/C0Qvl7dVT03/D4yweu8HYKm9TiCK+2hwrJseiuoIi/ckU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787907838; c=relaxed/simple;
	bh=rv4tYPPPB92V7pZdzqkY4oDYy++N+oEfchSSs/XpKx0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qIpESf668RhNIhLOCiYysMqEKs/iT2PrnwAvt29nbQnikRXvGUKwvp5iWueD+LqaibdyoS1nOGOCZwavYb43lQd3Hj29DXBrK2hJiVpXqtv5ng/Re0euXKbMFqgaO/SNwbMmoROQmEu9KAOkivwGwohvO3y+mrbdsti+/m7xeH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=l0ME8sGb; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="l0ME8sGb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=3I
	T5xJtBPEVQ7plUVHJExSO9nfjpim50NPTeHEu7G5U=; b=l0ME8sGbFNYz3p8Z/r
	dLfFnB4xnuyU0y+Df1SvNQ3tX9kZSHOjT8884LGmIzNTfD+awXU+H46F9YZrvl1s
	NW0/z48TN30/mksjzEfEpk7/IX01qyhx0fVsAloyXoOheKhTHfyIZqkziuuOY6QN
	V/gMX8MWu3KIelMJSurrV0YD0=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgCXEurETpFqfwmqNQ--.25217S2;
	Fri, 28 Aug 2026 17:03:00 +0800 (CST)
From: oushixiong1025@163.com
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Melissa Wen <melissa.srw@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Shixiong Ou <oushixiong@kylinos.cn>,
	Ye Liu <liuye@kylinos.cn>
Subject: [PATCH] drm/vkms: Add pixel blend mode property
Date: Fri, 28 Aug 2026 17:02:57 +0800
Message-Id: <20260828090257.788076-1-oushixiong1025@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgCXEurETpFqfwmqNQ--.25217S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFy8WF1xur4xKFW8KF1fCrg_yoW8Kr48pF
	W3Aa1FyrW5ArsrX3y5JFWY93yfW3WIgFy8ArW3A3sagrn0yF9rAF1rCF1S9rW5ArWxCw1j
	yF4DGFWDGFWIkaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j05l8UUUUU=
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/xtbC-QTD0mqRTsTXuAAA32

From: Shixiong Ou <oushixiong@kylinos.cn>

The vkms planes expose formats with an alpha channel but do not
create the pixel blend mode property. Since
commit 860e748bddcc ("drm: ensure blend mode supported if pixel
format with alpha exposed") this triggers a warning during
drm_mode_config_validate():

[  993.538979] ------------[ cut here ]------------
[  993.539000] [PLANE:35:plane-0] pixel format with alpha exposed but blend mode not setup
[  993.539063] WARNING: drivers/gpu/drm/drm_mode_config.c:872 at drm_mode_config_validate
......
[  993.539578] Call trace:
[  993.539580]  drm_mode_config_validate+0x398/0x558 [drm] (P)
[  993.539707]  drm_dev_register+0x1cc/0x2a0 [drm]
[  993.539832]  vkms_create+0x184/0x1d0 [vkms]
[  993.539854]  vkms_init+0x78/0xff8 [vkms]
......

The vkms composer only blends premultiplied alpha, see
pre_mul_alpha_blend(), so create the property with
DRM_MODE_BLEND_PREMULTI as the only supported mode.

Reported-by: Ye Liu <liuye@kylinos.cn>
Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
---
 drivers/gpu/drm/vkms/vkms_plane.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 6ee5c3f3207c..c4272f5f0354 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -276,6 +276,7 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
 {
 	struct drm_device *dev = &vkmsdev->drm;
 	struct vkms_plane *plane;
+	int ret;
 
 	plane = drmm_universal_plane_alloc(dev, struct vkms_plane, base, 0,
 					   &vkms_plane_funcs,
@@ -287,6 +288,15 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
 
 	drm_plane_helper_add(&plane->base, &vkms_plane_helper_funcs);
 
+	/*
+	 * The vkms composer only blends premultiplied alpha, see
+	 * pre_mul_alpha_blend(), so that is the only supported mode.
+	 */
+	ret = drm_plane_create_blend_mode_property(&plane->base,
+						   BIT(DRM_MODE_BLEND_PREMULTI));
+	if (ret)
+		return ERR_PTR(ret);
+
 	drm_plane_create_rotation_property(&plane->base, DRM_MODE_ROTATE_0,
 					   DRM_MODE_ROTATE_MASK | DRM_MODE_REFLECT_MASK);
 
-- 
2.25.1

No virus found
		Checked by Hillstone Network AntiVirus

