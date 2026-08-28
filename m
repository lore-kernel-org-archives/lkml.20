Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399673D3336
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 11:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787915098; cv=none; b=HhOuFi/f4Q7KuzyAvMPKxkUI4JHxlAk4uPYdCaawwFK7XJVlyhUnfXwGwkHOWfNBGiNIZxaaxK6yRLdXaq3XIJS6rO3DVLltmTe+2I6+e51WnTnXekBcS/TA42uIibw4qNRChU6MDQLFqpwLA0sFDFa9NcS/IPXKj93V9TsqwXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787915098; c=relaxed/simple;
	bh=9E9GAPsfAL5ET2Ryv1rMoWCdMrWJwTl3uOWupr0LLQU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WLeO1lGBL5elzm0LPt2GloeVxww+PWzXMvz0rXG6EbnrBbDewHj1Kj4FOL9gcadKxVgOtWdAbxHYUhmR5PqpxqulSvzsUAfuA0wz55g0shXXHJPAQv/Yek20/VPCkK5zYwMEdngCNcAW/Q2wM64AWRYvHABjDcKulldiTQE0hcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KCQDcEo4; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KCQDcEo4"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc1c9879395so655765a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 04:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787915095; x=1788519895; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jKxWNMOiyJDVCKUpUfvxRgy7YCO58oIDyM2gb3Klkzk=;
        b=KCQDcEo4iDMp2ITBmy/NcmIGfilEz5RWZ8wvWxH0FWxIhwDos+enA2VtKRBFmoDmdV
         UjXk/e0S0RyvC+kKR23sDYwH+C2gPtfdJ5kXFMgRvN6+OyX1b+g2FFE0imiwGsb30OKj
         trtDgMbNMWsE9931e6g9fDwasA9FmqxrjZ4+DXtOHJ9lM9+87zS5Fcm+Txvyk08Dun2/
         1l3g4tDB5E8oUnE3gyNastomnnCVtZwKX3KSEedNkl3ipM0WWT1WQPNYfcmhXXko8QK2
         6SEyUsFvm8A4pjjB7k38tfEkV++LXte02rQZy8A3XjSD4WHBx0sAGf4LSy4yPQcDpcyK
         AyZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787915095; x=1788519895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jKxWNMOiyJDVCKUpUfvxRgy7YCO58oIDyM2gb3Klkzk=;
        b=Yv1jbWLYxJBwwj42zorqg7O8ZJocdbN1vVkN8QQBn+EHvO9Vy0/bU3E742nbXJYIOE
         U6q0FkimVUtPBxeZIrK/7aBnX8eZK0vmgm1QzI3NtukvB4G548FLLTkomnXjmypMyTDF
         y6aiFtRpYAP4P5IvQQzYTsZF0svTjAx86RDvfRZUpYtdpeHT4etJM5a9ABypT4+K5HeF
         YXPg8C+MoYCm2hODLqdZ0Gc9kq0ZnclwsRQbr1IAbV53eS+LBxfZuJDGJVw7n8l9TUKc
         GOPQMX+FB1DEp9AeDrPPJacn2H0Dpij8nn4L4+LGyQXwo4EmopFsyxl2TU11lolU9kJ2
         CMAA==
X-Forwarded-Encrypted: i=1; AHgh+RqX2UfsYFRFgXuyCN/c2LpU19HfVOGBMyxaPc4oMajpHuDaFbVr8Yt4tm6mCuI7IA/lU9W0OTYs+YPxI/s=@vger.kernel.org
X-Gm-Message-State: AFuF++lfWV7kAKUBu4DHMeWiSOge1iNVvfCae5LKetq+XjZufOVR3gcD
	T4+XddX9bXK/A4RKxLaJcfWSPxbVGdH239U8af7kzr3tF9UJ3aNQycGE
X-Gm-Gg: AR+sD13fciMKlzAdMyRnZKa/TKLEJB9SsFnnVgnA5QvULBr7QNfnHl/2P+BHpCG1T1c
	UJ5UROreZSwOM7Au3PSp5UzMK4YnJULiA6m/sMrtHM+WxCclAbMmUfxA8KuNlAz5AlTRr1Q51d1
	q1965IZ+If6STSxH32lRYmifZXegGYZtB/dBB+nUOCOPSxr1W7IRwVWxIhnLiTxLgeDyDfHZX6L
	R+5qj1HY9kPWasA+JpLA9rwGSDRrs2n3pFjbEI29gFducU9vD5Ex7CKZ2nyfY0WrO4gWebQnQYK
	JpYlbf7fULNxmKAkx1tmqT7CCawn1MHfo5PYa5t8HEMWB5bY2Ptf9WFl7TPs7SwWRD6wY+yvPv+
	cVVamqnpf3uuR8p2QDzZy3f9BL508ERInPf9kq4DI6S4hJfcfTfdIVPbI5grMAk21TXIs/JlPvw
	LDqcjKxuHwN55pqOJfjB4l6Dlu2l4ivsTtEmzjBN9cU3UzZsICRogP+X7ZsbfhdKr6mAyGbnI=
X-Received: by 2002:a05:6a20:9184:b0:3c4:3112:45 with SMTP id adf61e73a8af0-3d26562eac5mr10258025637.1.1787915094977;
        Fri, 28 Aug 2026 04:04:54 -0700 (PDT)
Received: from ebizmis.com.com ([61.136.101.138])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-856a3d689ccsm433268b3a.58.2026.08.28.04.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 04:04:54 -0700 (PDT)
From: fausten <yunfeng.li.nb@gmail.com>
To: dri-devel@lists.freedesktop.org,
	zack.rusin@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	linux-kernel@vger.kernel.org,
	Yunfeng Li <yunfeng.li.nb@gmail.com>
Subject: [PATCH v3] drm/vmwgfx: Treat zero SVGA_REG_CURSOR_MAX_DIMENSION as unset
Date: Fri, 28 Aug 2026 19:04:37 +0800
Message-Id: <20260828110437.1592832-1-yunfeng.li.nb@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260823085916.2707488-1-yunfeng.li.nb@gmail.com>
References: <20260823085916.2707488-1-yunfeng.li.nb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yunfeng Li <yunfeng.li.nb@gmail.com>

The cursor plane code validates cursor dimensions against
SVGA_REG_CURSOR_MAX_DIMENSION before every cursor update, and
rejects the update with -EINVAL if the cursor is larger than the
reported maximum.

However, this register is only available on hardware versions 18
and above, which introduced cursor MOBs. Older hardware (e.g. a
VMware Fusion guest with SVGA version 2) returns 0 for it.
In that case every cursor update is rejected,
and the log is spammed with:

  [drm] Cursor dimensions (64, 64) exceed device max 0

The visible symptom is that the hardware cursor never appears at
all on VMware Fusion guests (SVGA version 2), making the mouse
pointer invisible even though the input devices work fine.

Treat a reported maximum of 0 as "not implemented" and skip the
dimension check in that case, restoring the pre-existing behaviour
of accepting the cursor.

Tested on VMware Fusion with an SVGA version 2 device where the
cursor previously did not show up.

Fixes: d5ed8749168a ("drm/vmwgfx: enforce cursor size limits for MOB cursors")
Signed-off-by: Yunfeng Li <yunfeng.li.nb@gmail.com>
---
Changes in v3:
- Use an explicit cursor_max_dim > 0 comparison (Zack Rusin).
- Fix the comments: the register requires cursor MOBs which exist
  only on hw version 18 and above; it is not Fusion-specific
  (Zack Rusin).

 drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c b/drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c
index d1e7df500..3d4660684 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c
@@ -237,8 +237,10 @@ static int vmw_cursor_mob_get(struct vmw_cursor_plane *vcp,
 	mob_max_size = vmw_read(dev_priv, SVGA_REG_MOB_MAX_SIZE);
 	cursor_max_dim = vmw_read(dev_priv, SVGA_REG_CURSOR_MAX_DIMENSION);
 
-	if (size > mob_max_size || vps->base.crtc_w > cursor_max_dim ||
-	    vps->base.crtc_h > cursor_max_dim)
+	/* Cursor MOBs, and thus this register, exist only on hw version 18+. */
+	if (cursor_max_dim > 0 &&
+	    (size > mob_max_size || vps->base.crtc_w > cursor_max_dim ||
+	     vps->base.crtc_h > cursor_max_dim))
 		return -EINVAL;
 
 	if (vps->cursor.mob) {
@@ -748,8 +750,10 @@ int vmw_cursor_plane_atomic_check(struct drm_plane *plane,
 		u32 cursor_max_dim =
 			vmw_read(vmw, SVGA_REG_CURSOR_MAX_DIMENSION);
 
-		if (new_state->crtc_w > cursor_max_dim ||
-		    new_state->crtc_h > cursor_max_dim) {
+		/* Cursor MOBs, and thus this register, exist only on hw version 18+. */
+		if (cursor_max_dim > 0 &&
+		    (new_state->crtc_w > cursor_max_dim ||
+		     new_state->crtc_h > cursor_max_dim)) {
 			drm_warn(&vmw->drm,
 				 "Cursor dimensions (%d, %d) exceed device max %u\n",
 				 new_state->crtc_w, new_state->crtc_h,
-- 
2.33.0

