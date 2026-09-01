Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89610486634
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 17:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788283043; cv=none; b=gh3UsUpPgU1OhHr5AYsSLfEHW6YPGJYra4eRqleArDDB8CKfCF3c/a+PsP0hbBwUpjeNZXxPzfxe/2JAIfnFgzcD4qOy2cM0AQRefCYbEIk4r9RDmWraFn0WebiTd/qtRiEjX/JAvJ32YtyTetbfc8iDQZv+THGqHvsWTRb1t/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788283043; c=relaxed/simple;
	bh=BL+d6snF9u8aweXfTmSefcnTZg9GxEFMNSGAQWmUlaU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tXj2nR3hrv5cdGOIygh2io6HaLkzjp7wooT2PujdkKsfB4XVxewvcFt08dLYoU/VRIQijZQVJWirhN5fLlc3KhP6wvMRmjfOXrXwG9OGb9+P2fbeezCjSU4pMWTZw8JraXJSrQysFgKqVNEucBYqvlg9/o0sPw75F20bqs1Y6yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [120.85.96.74])
	by APP-01 (Coremail) with SMTP id qwCowAAn+u2QCJdq5v8CBw--.35276S2;
	Wed, 02 Sep 2026 01:17:05 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [PATCH 1/2] drm/verisilicon: set blend mode for the primary plane
Date: Wed,  2 Sep 2026 01:17:02 +0800
Message-ID: <20260901171703.1161592-1-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAAn+u2QCJdq5v8CBw--.35276S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtrWfKF1DGr47Aw1rCr4fAFb_yoWkWwb_C3
	W7uw1kWr9Fkr18ZF12ywnF9F9akFW8Zan5Xr4Fq3ZxKw1DJr1fAr4DXas5ur1UW3WrtF98
	Xa17Zr1xJr1fGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbcAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr
	1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r1q
	6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
	IxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUonmRUUUUU
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

Blend modes are now required to expose pixel formats w/ alpha.

As it's the primary plane and blending is explicitly disabled, just
expose PIXEL_NONE blend mode.

Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 drivers/gpu/drm/verisilicon/vs_primary_plane.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/verisilicon/vs_primary_plane.c b/drivers/gpu/drm/verisilicon/vs_primary_plane.c
index 1f2be41ae496c..8d58682d88ef8 100644
--- a/drivers/gpu/drm/verisilicon/vs_primary_plane.c
+++ b/drivers/gpu/drm/verisilicon/vs_primary_plane.c
@@ -7,6 +7,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_blend.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
@@ -179,5 +180,7 @@ struct drm_plane *vs_primary_plane_init(struct drm_device *drm_dev, struct vs_dc
 
 	drm_plane_helper_add(plane, &vs_primary_plane_helper_funcs);
 
+	drm_plane_create_blend_mode_property(plane,
+					     BIT(DRM_MODE_BLEND_PIXEL_NONE));
 	return plane;
 }
-- 
2.52.0

