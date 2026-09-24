Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DC63D1716
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 02:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790218437; cv=none; b=SXUONkPtyapuAdtte5OeyVYCHiXefROWG7DvM4CtR9ed6LnWBDhpKJYYjdqPn5C+3uBiZOOdB9whey8Z48bJL5/goNIdFgkiZhBYgK5MvKZA8IoAp+1CrEkILJHFsH12ok0U7QdmqI05fh9o1hUqJ8eynJD2hqVhMNgFD5aSR+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790218437; c=relaxed/simple;
	bh=fzX1cfbz6MAAL80A76Ukul0oqV8t/2jqBPiqBFH4Fsw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b8Lv2RUbBC5dqKdEwvWKr/LwqtuN9RkdGtMVx53BupS2TBXopGyR6lgS2Fl2nrCKFDB3Pao3O8ZAlqSu+nsxsrtfVK5wMTIkWHvVKYYoMi5DPyQiEglh3Eyl+RTfA2/wfGf0DqVm22+yVN3rrN5Qux5v8bkgYunZAZjkupyj4J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gga/qkda; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gga/qkda"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-52fb76bcb1fso14862421cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 19:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790218432; x=1790823232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wvc7ihS48CMwaqQEEFS304xLksjJ1u/xnvvm0QQvd88=;
        b=gga/qkdaDq53/R0odFuGKscizK3b8dk1I/Z+e48OoBAzi2pBNnHezfKczCuZWTjSqO
         4KkRN8t59XXwyC8BssH+EoFUQjI2um/lmOsjwSqV/6OVfoo17D+19fhBtLNftKErhYU6
         Pm5o9gdOJn2DXq4Ii2R3syG2CVIMwl+sCd6zQkuOyTX0g2sGZ9IKcHC9b+oAd1s0gFKs
         pC4oXbtLEacDRrt2/CdcyYfF5k1YJcW0Nd/JdUkSwWuBzJZLEk0dW5J0EttUNY45ioZY
         rl9A+cjRheB25JlfF1R416p4LyB7Xnv5PQ5sVWXbDNYGOkSl9QDg9EsaXP6GJh+bQ/31
         JIog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790218432; x=1790823232;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wvc7ihS48CMwaqQEEFS304xLksjJ1u/xnvvm0QQvd88=;
        b=RuVDTk8jm/w52qn49mwTDpYpFvwrdIfYOZ55IiTA/gW0UzCWMlmBqO1M+xuRaccLkc
         AUAisOhMn52/WgkOkKJgp/RzIEYOOzJjNpg/eBnXVo2e4qiMlqR7uMHy3oOOeS8mDp8C
         MWchyCroDGRBScp0jWsIdSCuczroJJNiYQd+/MAUn47YjCyR0iwsLMKnAKpyyi8b2YoW
         8X0H/5i6hllWyk8/cfJloIY2DQ+eDP/U9dAZdfiQboO25zUmpXtO1+aW9FYcM4+SxYXW
         n0nNSp3CJRPNnDeGW8dPcCuZyMA2uGhObL/JasgHo2lxSmwv6MPnq29jA/jUOM9CT+PO
         7Fkg==
X-Forwarded-Encrypted: i=1; AKwUvByvK5WQ01QW6x1ayN+ZWgkxh4NrwgG2PDCvM9RDhJwKIKTKy1KrOjlUeBjhVvCxt41Iqvq0F2dmK5s91os=@vger.kernel.org
X-Gm-Message-State: AFuF++nh62WzKDrPm0DeVLow6dmWGcqQUocdvLYNUmt3TwD4PtsS3Eup
	rCfmnx6z/chIafJ/UQq2b7f2XeRnto4jkPmc5VoU68U6Q6WDQAUTG34b
X-Gm-Gg: AYBFou00M/Jl3E+O2/5yf0Mmi197Rt1e5wcUmXwe4wkzLHyPmGDGAxa6O0911cmf5qq
	Ztcv0WWeqjy0xpFcCOy5phHfDs8Gq1E9UrMC8bn7FyIxirWq+YE7E182DPc2UkOGikUC0U2oHgW
	TVivzN3r7thIzbW9siqTbskVf/4wXy7zSgiQ444Czx6d6uUtwPikHM0y8fThQl+uSXj1bNxYh93
	i2NDDNDgvrojGA3iFTBoon61m/5kSkEGLrBX0E5s15v+jM2/vJPFWJXeQO8aIb1528Mxyb3q0Oe
	pE0dxbVl6TTMMtHXqS3v5z3Bvruby3wxMg+z1vBn85LkfzD4G2RhihxvCRPMedWAVxO6ujv1RUx
	ALWl2TF+1OtRapTVUFBNVGws0T4Y4sNHtXIp4leAzZNzfJ5CPbejzbk/930ecMJzbfUgZCvlozJ
	AI+x00Mi4VyFzsPRjX9GypHdQwluihW+iywmJ37RrXJXxyaB449w2/yw3g+GxpS99KB6k72aC/b
	JbzgUqrGv1nVhC+1sKbrIoWKFeU4WLQd0QX/1ZcaabZc2quljTJW3CF/AEWkqv76zo=
X-Received: by 2002:a05:622a:250b:b0:530:e335:58b3 with SMTP id d75a77b69052e-532feb571afmr5037371cf.57.1790218431820;
        Wed, 23 Sep 2026 19:53:51 -0700 (PDT)
Received: from localhost.localdomain ([2600:4040:29f7:9600:11c6:662b:adfc:7c99])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532f501100asm18940981cf.24.2026.09.23.19.53.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 23 Sep 2026 19:53:51 -0700 (PDT)
From: Dillon Amburgey <dillona@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: airlied@redhat.com,
	airlied@gmail.com,
	kraxel@redhat.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	simona@ffwll.ch,
	virtualization@lists.linux.dev,
	spice-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/qxl: size packed dumb heads from the plane source
Date: Wed, 23 Sep 2026 22:52:22 -0400
Message-ID: <20260924025222.6077-1-dillona@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

QXL packs per-CRTC dumb buffers into a single primary surface.
qxl_update_dumb_head() recorded each dumb BO allocation (bo->surf)
instead of the plane source rectangle. Scanning 1280x800 from a
2048x1024 dumb framebuffer beside a 1024x768 head therefore created
a 3072x1024 primary and placed head 1 at +2048, rather than 2304x800
with head 1 at +1280.

Use src_w/src_h when building the packed shadow, and copy only that
source rectangle into it.

Fixes: 90adda2ce898 ("drm/qxl: cover all crtcs in shadow bo.")
Assisted-by: LLM sparse
Signed-off-by: Dillon Amburgey <dillona@gmail.com>
---
Tested on torvalds/linux 62f4c998b297. A DRM client (not Xorg, not
SPICE) programmed one QXL device with max_outputs=2. CRTC 0 scans a
1280x800 rectangle from a 2048x1024 dumb framebuffer (the allocation
is larger than the scanout). CRTC 1 scans a separate 1024x768 dumb
framebuffer. Unpatched, qxl_update_dumb_head() sizes packed heads
from bo->surf, so QEMU's qxl_create_guest_primary is 3072x1024
(2048+1024 by max height) and monitors_config places head 1 at +2048.
With this patch, the primary is 2304x800 (1280+1024) and head 1 is at
+1280.

Content outside CRTC 0's 1280x800 source rectangle did not appear in
the packed primary, and both heads' source rectangles did.

checkpatch.pl --strict: 0 errors, 0 warnings, 0 checks. W=1 and Sparse
on drivers/gpu/drm/qxl/qxl_display.c added no warnings.

 drivers/gpu/drm/qxl/qxl_display.c | 39 ++++++++++++++++---------------
 1 file changed, 20 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
index 0719fc6a52d5..e57aeeb97f84 100644
--- a/drivers/gpu/drm/qxl/qxl_display.c
+++ b/drivers/gpu/drm/qxl/qxl_display.c
@@ -670,13 +670,17 @@ static void qxl_primary_atomic_update(struct drm_plane *plane,
 	struct qxl_device *qdev = to_qxl(plane->dev);
 	struct qxl_bo *bo = gem_to_qxl_bo(new_state->fb->obj[0]);
 	struct qxl_bo *primary;
-	struct drm_clip_rect norect = {
-	    .x1 = 0,
-	    .y1 = 0,
-	    .x2 = new_state->fb->width,
-	    .y2 = new_state->fb->height
-	};
+	struct drm_clip_rect norect;
 	uint32_t dumb_shadow_offset = 0;
+	u32 src_x = new_state->src_x >> 16;
+	u32 src_y = new_state->src_y >> 16;
+	u32 src_w = new_state->src_w >> 16;
+	u32 src_h = new_state->src_h >> 16;
+
+	norect.x1 = src_x;
+	norect.y1 = src_y;
+	norect.x2 = src_x + src_w;
+	norect.y2 = src_y + src_h;
 
 	primary = bo->shadow ? bo->shadow : bo;
 
@@ -689,7 +693,7 @@ static void qxl_primary_atomic_update(struct drm_plane *plane,
 
 	if (bo->is_dumb)
 		dumb_shadow_offset =
-			qdev->dumb_heads[new_state->crtc->index].x;
+			qdev->dumb_heads[new_state->crtc->index].x - src_x;
 
 	qxl_draw_dirty_fb(qdev, new_state->fb, bo, 0, 0, &norect, 1, 1,
 			  dumb_shadow_offset);
@@ -764,18 +768,14 @@ static void qxl_cursor_atomic_disable(struct drm_plane *plane,
 	qcrtc->cursor_bo = NULL;
 }
 
-static void qxl_update_dumb_head(struct qxl_device *qdev,
-				 int index, struct qxl_bo *bo)
+static void qxl_update_dumb_head(struct qxl_device *qdev, int index,
+				 struct qxl_bo *bo, uint32_t width,
+				 uint32_t height)
 {
-	uint32_t width, height;
-
 	if (index >= qdev->monitors_config->max_allowed)
 		return;
 
-	if (bo && bo->is_dumb) {
-		width = bo->surf.width;
-		height = bo->surf.height;
-	} else {
+	if (!bo || !bo->is_dumb) {
 		width = 0;
 		height = 0;
 	}
@@ -820,12 +820,11 @@ static void qxl_calc_dumb_shadow(struct qxl_device *qdev,
 }
 
 static void qxl_prepare_shadow(struct qxl_device *qdev, struct qxl_bo *user_bo,
-			       int crtc_index)
+			       int crtc_index, uint32_t width, uint32_t height)
 {
 	struct qxl_surface surf;
 
-	qxl_update_dumb_head(qdev, crtc_index,
-			     user_bo);
+	qxl_update_dumb_head(qdev, crtc_index, user_bo, width, height);
 	qxl_calc_dumb_shadow(qdev, &surf);
 	if (!qdev->dumb_shadow_bo ||
 	    qdev->dumb_shadow_bo->surf.width  != surf.width ||
@@ -869,7 +868,9 @@ static int qxl_plane_prepare_fb(struct drm_plane *plane,
 
 	if (plane->type == DRM_PLANE_TYPE_PRIMARY &&
 	    user_bo->is_dumb) {
-		qxl_prepare_shadow(qdev, user_bo, new_state->crtc->index);
+		qxl_prepare_shadow(qdev, user_bo, new_state->crtc->index,
+				   new_state->src_w >> 16,
+				   new_state->src_h >> 16);
 	}
 
 	if (plane->type == DRM_PLANE_TYPE_CURSOR &&

base-commit: 62f4c998b297cf233997a2b4cd6fc2d2df0319c9
-- 
2.43.0

