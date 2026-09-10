Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033383E49FD
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789033773; cv=none; b=joRrch1WfLN7D43ycDFQ/n7o1DamjqfZjQHCbfpKi0IT9PonpxH3EI/XL8Vf8CVMefWzXcRi+C+DXZ24L0aOvJG5PqYDl8m9R6LJ+GeNOIT27UnLEEa6MAHZZ0kHyibuqGwci2lST1bwYqoxIIP9AeNOs7pFaxFWLOsJtzQqOZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789033773; c=relaxed/simple;
	bh=2LOry7nxtWy/fMejyO3md0h70gNKPBbbskdPhQAxScI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mJHMrWEfDRrZAxdgsJ5f6db0xSAH0/itp3dwhArAAk52XZ/eHT/c5Yk3pz2EdymnoH1sLpZzlWiKHSQ+HnY554w8NQnTr49R4tG0buP93ZspLgkuZ13Mtf6Y0SRqRVuDAjXsU+e69E7udfB9yQhECCj6c6KtU5v/+UjEh23mgb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.100.66])
	by APP-05 (Coremail) with SMTP id zQCowAB3qEITfaJqq3jSBw--.59536S2;
	Thu, 10 Sep 2026 17:49:07 +0800 (CST)
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
Subject: [PATCH v2] drm/verisilicon: set blend mode for the cursor plane
Date: Thu, 10 Sep 2026 17:49:04 +0800
Message-ID: <20260910094904.3502741-1-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAB3qEITfaJqq3jSBw--.59536S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw4rCF4kCw15Jw1UGF4rZrb_yoW8Xw1fpF
	4jyFWUJrZ0yanIyry7Cw18tay3ua15G3Z2qrn5WFWqvwn8try7Zr1rGF1S9FW8JrsrW3yf
	GrsrAr9xArWFkF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkl14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r1q
	6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
	IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbGQ6JUUUU
	U==
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

Blend mode properties are now required to expose pixel formats w/ alpha.

Experiments show that the fixed blending mode for the cursor seems to be
COVERAGE:

- With a cursor plane filled with R=G=0, B=0xff, A=0x40, the cursor is
  visible on a pure-white background, which means the background is
  multiplied.
- With a cursor plane filled with R=G=B=0xff, A=0x40, the cursor isn't
  pure white and non-white patterns can be see through, which means the
  cursor is multiplied.

Add a fixed COVERAGE blend mode property for the cursor plane.

Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/verisilicon/vs_cursor_plane.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/verisilicon/vs_cursor_plane.c b/drivers/gpu/drm/verisilicon/vs_cursor_plane.c
index fa4f601dd0c87..da456dced88aa 100644
--- a/drivers/gpu/drm/verisilicon/vs_cursor_plane.c
+++ b/drivers/gpu/drm/verisilicon/vs_cursor_plane.c
@@ -11,6 +11,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_blend.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
@@ -267,6 +268,7 @@ struct drm_plane *vs_cursor_plane_init(struct drm_device *drm_dev,
 		return plane;
 
 	drm_plane_helper_add(plane, &vs_cursor_plane_helper_funcs);
+	drm_plane_create_blend_mode_property(plane, BIT(DRM_MODE_BLEND_COVERAGE));
 
 	return plane;
 }
-- 
2.52.0

