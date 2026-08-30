Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121B43B4423
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 15:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788102998; cv=none; b=LkzMnkLB0bNvIdDOjrQFxs1wabOguA4sFER/u9XsgjN4qp5ePg+TyAPiI0hTeQYX+CruDEecw/fp7wTRjOuHupYUc6+5zvd+ljAOtF/kr4qkLPWW8la9E/G0Y1Boytj4s4Ku2iPP4GDiO0GlXPwbd/fBKmYeLtDhqon84lkCOe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788102998; c=relaxed/simple;
	bh=mggiIUxT5AQRVKo54IcW6GSP80NdGz9vignfYKp/MSg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hYWV0Ia6rNANwZBJqzCb1dLwRT2p2UlBe+UBZxYJg8nGO4I6MDykLu0kK4ZoIabmzp0FNbxFlO2KNNfVitAlMP/J9qR1snpn8o8LtPHDl5C+HP0KFpWpWRbUBG1i2Kfdk2ztRo7I8utmxxPGLfVamj5zHn9mEoVeUOnhmxQ1wNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mVGhf/oU; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mVGhf/oU"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d91ded8174so2083635ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 08:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788102996; x=1788707796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Y0V8OHugwHV1knNa61KDiXTkjr/SgExhgiHseoKDWc=;
        b=mVGhf/oU3+49/KUK4S2jgsaURx9N4COftYwedmC3owyXiZWHjutL1KdvTGnEu9Lz6m
         nW1evtFtCR8uXcyuxd/lmP+puPu8HINUlC1IIzQ0Ukjx+baafS+x9WdAilRrmE7tMA0t
         LkVI9wEv4aeLqAlgOsd6l9vT4AFmCqYYI+1aQemIhU9q0g3wPnJ7PI0AVOA8ZXFZOlyq
         M4/vbuZxNxhFreYlLpKODE8bBsXjreAdmgTSXH9GuheRV5QlSam63+6VRQ7ZFzrLh+YK
         d9hUIXn/A4GujovNOQZnBDBkKbIL2wPIksXYIFe90rrSS05U57XTyyY+rWEZaJ42i/ZM
         Iwcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788102996; x=1788707796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+Y0V8OHugwHV1knNa61KDiXTkjr/SgExhgiHseoKDWc=;
        b=tP4MFHSU1vUEJlblF4BFIEQRuR8MT5mNR+QA4wcRIgqaJ5iD7cq6DfYg/93JIn8iYu
         xrYFKVrquG499ygVKm06eP9RbzyO80HmEUiq0Hetct/FYCGLW0B4Cp99hWn4UMoMxN+3
         ScOobrU26S1M3Ut9V+RPCkGzEPWh9lP+4BdH8HHGGLhG8+MNpVJjSRs/SBpDNcfHkY3p
         NjmEhDHSvCZGC2od0wMVWFnazB2sUD7oeE5fd8W8UxAWUtYYJS/LD26ZW8vqkQl7v9w0
         GGNm2xQx4Dh1r8gYWFl1xruZr6W3ZtJc8ad92Xe0v3CqlV9erABmJlNHNfLh5JMQgPP9
         NJtw==
X-Forwarded-Encrypted: i=1; AKwUvBwQsFkOkR34qBqsmBF6SZmKrjIr64x6Ov+cLxS3raB6PvRu51jfcP3mCBX6gqmvE46E7akU/2R+TIJNy/0=@vger.kernel.org
X-Gm-Message-State: AFuF++kq1rqiIUT93Ct3etg4HUIIrn+867xMBEKk3xa8IvhGAVW30jFk
	yY+YplcQlRNhso5bJczfcCQEeI5juZdrl25hC38Dhj2VRVfXrhFZKRD4
X-Gm-Gg: AYBFou3wNg6mkHfHnmwd0zW9fSGutf19rkxEKlwH3SR+c7+w8xNlVuewnhyO+Ki7ejS
	qVItjIpaquC06Dxv7nG+HWCGVazRJHHjDtGtQGjhNAK12JhC86z83ugCJnZUbI+GLtLesCuLx51
	+0mFVl+iFf6vXdjmiyNjA+5MuhHgteRcqISGFsWYOuVCj308WxpHjpztCWQSM4dC+g00aCIia/k
	H5wjSlh9xzZefjUZejFILYb2fOjOUI+70oMkGDNPZcse6yaaR29iTWcupMZ/OnQqrLxaW6HXQ00
	ays3MM6qk0vjpBU8JnxQFPLuBkF67hH5LMKWLkPZJEMUsfxiPL282/Tc0AavsHQPQctwfnyj8Pn
	BO320hTX5TG6P/ii+7jpqn9fNBibv7GnkRrBB5ZL/x5qZ8Q9kzES5Pa+d4QcaWfNxJSLW4awlTS
	1MK7e6S35ev0voKKWiAM9/on3rjcFaQSbQ2oAcXs0tUvjmvvEnWPK6HFildQLGV5OC63OZHaCWw
	Yq51zJADg==
X-Received: by 2002:a17:902:d4d0:b0:2d9:efc:f206 with SMTP id d9443c01a7336-2d90efcf77amr54121145ad.13.1788102996267;
        Sun, 30 Aug 2026 08:16:36 -0700 (PDT)
Received: from ebizmis.com.com ([61.136.101.138])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d75963b5c2sm22821015ad.30.2026.08.30.08.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 08:16:35 -0700 (PDT)
From: fausten <yunfeng.li.nb@gmail.com>
To: dri-devel@lists.freedesktop.org,
	maaz.mombasawala@broadcom.com,
	zack.rusin@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	linux-kernel@vger.kernel.org,
	fausten <yunfeng.li.nb@gmail.com>
Subject: [PATCH v4] drm/vmwgfx: Treat zero SVGA_REG_CURSOR_MAX_DIMENSION as unset
Date: Sun, 30 Aug 2026 23:16:19 +0800
Message-Id: <20260830151619.2452307-1-yunfeng.li.nb@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <ef11cc4a-fbaa-415a-bda1-2ac491f3b5e2@broadcom.com>
References: <ef11cc4a-fbaa-415a-bda1-2ac491f3b5e2@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
 drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

---
Changes in v3:
- Use an explicit cursor_max_dim > 0 comparison (Maaz).
- Fix the comments: the register requires cursor MOBs which exist
  only on hw version 18 and above; it is not Fusion-specific
  (Maaz).

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

