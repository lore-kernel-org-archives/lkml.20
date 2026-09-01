Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A2248380E
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 17:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788283044; cv=none; b=eIAt3Kjy6vUYPAblwPagTVktcY8nqwSjZGwwhP82ujc1IvHllHaF9AAQv90M4KzoighYGsqpRXlm57r5CHGXWreS05EazDtJWixolOMxT8Vwb9oC9Eh8jE8/23T1PwRSWoyksPFmuZaIVgo+SKciSGChPNY1jacV686/tI+xXEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788283044; c=relaxed/simple;
	bh=jARQcDwwsc9Yk1oJ9JgA3vbuEVDpTJIxmvVTQ260XWc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bZ2x7pe7U7vHvX2SpuDx+ZvEYiuf/yhj1p0AOTAIADSd1YHUrue/TQ55BgukAIojfTiBi7Bkn59l//N1KAZGMbC8JnwehIAr7s01/FlubtCd0hO8/XV4kSDoBHWVoe3LwEKyZXh2DZOZ9Yv6eVI33gKfViTbjFil/Pkn/hjgBXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [120.85.96.74])
	by APP-01 (Coremail) with SMTP id qwCowAAn+u2QCJdq5v8CBw--.35276S3;
	Wed, 02 Sep 2026 01:17:09 +0800 (CST)
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
Subject: [PATCH 2/2] drm/verisilicon: set blend mode for the cursor plane
Date: Wed,  2 Sep 2026 01:17:03 +0800
Message-ID: <20260901171703.1161592-2-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260901171703.1161592-1-zhengxingda@iscas.ac.cn>
References: <20260901171703.1161592-1-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAAn+u2QCJdq5v8CBw--.35276S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw4rCF4kCw15Jw1UGF4rZrb_yoW8XryDpF
	4jyFWUJrZ8tan3tFy7Cw18taya9a15GFn2qrn5uFWqvwn8try7Zr1rGF1S9FWkJrsrWrWf
	KrsrAr9xArW09F7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBl14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
	ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
	vE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
	r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r1q6r43Mx
	AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_
	Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwI
	xGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWx
	JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcV
	C2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbn2-7UUUUU==
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
---
 drivers/gpu/drm/verisilicon/vs_cursor_plane.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/verisilicon/vs_cursor_plane.c b/drivers/gpu/drm/verisilicon/vs_cursor_plane.c
index fa4f601dd0c87..36e3664373fa1 100644
--- a/drivers/gpu/drm/verisilicon/vs_cursor_plane.c
+++ b/drivers/gpu/drm/verisilicon/vs_cursor_plane.c
@@ -11,6 +11,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_blend.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
@@ -268,5 +269,7 @@ struct drm_plane *vs_cursor_plane_init(struct drm_device *drm_dev,
 
 	drm_plane_helper_add(plane, &vs_cursor_plane_helper_funcs);
 
+	drm_plane_create_blend_mode_property(plane,
+					     BIT(DRM_MODE_BLEND_COVERAGE));
 	return plane;
 }
-- 
2.52.0

