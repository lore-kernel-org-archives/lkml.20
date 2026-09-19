Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B09B37F8D3
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 22:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789857317; cv=none; b=sG1ElLPfPf6+GdZvuvUukPt0RhV1YujZFTapdbLpiICt0DqYLWe0uPDAepd2qxKNrbL16VDg48H56IR0TcDkCuzKCy74+qYIJjki8AhGU5hpMFMdBbHeu7ZlACXSZfu8pfk5yOOMWxV3qhVb+vQDJDmehq3JtuquPbDDMMtRSpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789857317; c=relaxed/simple;
	bh=2YhY/u18axsGTIqWP/fCRTaKGAGm242Rh/xebAH2QvI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CD46k37wkAytPIrszrewRUhiASL6OZTBzKhqVycDHalLYNGVYpMcfyFoXNdYmX1UtktCHkfShWItlANKZ8mnI2K0old+kBYaMEBOU+LS7d4SZGvl54ACiLBdGZi0lJXT4Bg5YpGuFviKb9naBLCxHE4AIVoBVnb7pVaSJsyRzB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=boe1K7FT; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="boe1K7FT"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccb1a98fso1702954a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 15:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789857316; x=1790462116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IxqUXVNAFu/lNiJ42A0NWtfZcrliflvc5eUvqHrWqjg=;
        b=boe1K7FTD0tbYqj9qjaLkvrGhER1k+JBsdzsAa+CQQu3oA5HHPOwkrlCJXU607dCgq
         ln2CL0to+IesNeGwSKisRfiDA8kpPAElmA5TjQFtKQzMp1nQ1sD75pQ9daT5nzNmbT6v
         FyQG81o+HcpeMp0VkJNwFx+jkb1ulCGUqoSeurZZgp5209zQ5Wb52U8L7jZMaN6GOl7Y
         swVULpX/j040d7ogElROsUOJhEq925gzOtt1aWEOY8w0p+WfGqlU0tNgeTUGMiMbnYX6
         ZxPao+DUf40+lV9zSojVWT8PbuN1rmfgeGnxh5e6AVb7nPx5i1LHrD5IZ0XtUh766n9e
         UQrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789857316; x=1790462116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IxqUXVNAFu/lNiJ42A0NWtfZcrliflvc5eUvqHrWqjg=;
        b=G+yp2UVL+oCTnsswsgUO9TY4be9O7mhqJEUoW8xdANeVLY7G7+acu8eCZ7xJ65eB3V
         aFPKZB6ea0kHkvpnjg2bBzhLZOCI2o7sJDL9KAXlmV/3ryGgqA9o/Ute85zHchqY6FQh
         OgYTl4l6yAuGCVessfUOicjkKNkLIXFRjli1ZfhQSbLXOWI+fiI1P4Ct6iXKt4aPusy+
         emcpt77QwtSF3vAeGU8fIXgYJysMMJUhwa+So+gyf4Fp/yWhLWAvfd0XUjKHWPLlJBlf
         fVKA7K7SAggkqJ3iOKWiv+Pz+j3AnjvE35SdzHO6LbpcvdjTTj2c7Z3aNbfBiLX3SlCu
         3wAA==
X-Forwarded-Encrypted: i=1; AKwUvBwHlm0sdKDLXEcJ0w3aVWZj2IwMbsmtbSf/uDPV6ef7uy+lSzeb4gOc0EH3fvOU3l6sPNkmE6vP7Sp1oOk=@vger.kernel.org
X-Gm-Message-State: AFuF++l3reRmIIavnGzypRXJGVuRnsupAu4JLEXiA3YsFn6gNxRkZd8C
	v5CyFxIGSr6oR0FbVVA9eiMnOCzykss4Em2v2taO9GeB7ZlYKQuDHiRB
X-Gm-Gg: AYBFou0GHZORyTiqwicx78oeTNkR26B6ftA/clSGkv0kyc4ct27NJemuu/4fa0C0k4x
	4Ten4tG+yOTIeTc29hSOEVvXZKDj8A92lyown2swTc5KFyB+6PZILWt7zm3P3ATNQF4tvyJM43e
	M8L6Zz9/dgkrSsArUgvyh2/Oqt6grSGnVDdPMBYO9yN1jegYjrzi+6eFCnZArqx/TE5pS/leisv
	bY7pg34Dui6YDIrx7Tgk83kzofPRJZFPYTrSb7gBBczgMq9nOpB9BBBS84P4GqddGDthUZdOyPK
	dOpjYY/pgDUjp6BLGK7q3kG/rlk62WPL8FuVBkMPJ03pksXd++vL7TQWXaC0ISwWm1VBDNQ/Bnc
	CHYhbMYOXdAk4hKBk79raB6XXa/zEQkDCMLVIpnNP/CF6KHLs3/ntcU5fM1rje7AsDIDdVqvyji
	+o/duMJuZCKkDiPEw2OyVP2bwhG1U44TeNj6GS5r0X6QKU/9YkEIPdn1GN0P2R5R17VBKeal+wg
	VFOlMawPTjuK1K6et+jbAa+GJzW3/gPzy0D+LzNiDoxUmsmG1gyEX4CjEdY93V+mNOL0RrYBpvH
	6/qY4H+Evg==
X-Received: by 2002:a17:90b:3909:b0:39e:3558:f925 with SMTP id 98e67ed59e1d1-39e54d86a97mr10901965a91.24.1789857315829;
        Sat, 19 Sep 2026 15:35:15 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c37c64csm6092871a91.10.2026.09.19.15.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 15:35:15 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: tzimmermann@suse.de,
	jfalempe@redhat.com,
	simona@ffwll.ch,
	airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/mgag200: prevent PLL divide-by-zero and validate framebuffer pitch/size
Date: Sat, 19 Sep 2026 22:35:14 +0000
Message-ID: <20260919223514.3889611-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In drivers/gpu/drm/mgag200/ (mgag200_mode.c, mgag200_g200se.c), validate
clock/PLL parameters and verify framebuffer pitch * height fits in VRAM.

Fixes: 414c45310625 ("mgag200: initial g200se driver (v2)")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200se.c b/drivers/gpu/drm/mgag200/mgag200_g200se.c
index 349ec36f6d49..d24af3bb5029 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200se.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200se.c
@@ -257,17 +257,17 @@ static int mgag200_g200se_04_pixpllc_atomic_check(struct drm_crtc *crtc,
 		}
 	}
 
+	if (delta > permitteddelta || !m) {
+		pr_warn("PLL delta too large\n");
+		return -EINVAL;
+	}
+
 	fvv = pllreffreq * n / m;
 	fvv = (fvv - 800000) / 50000;
 	if (fvv > 15)
 		fvv = 15;
 	s = fvv << 1;
 
-	if (delta > permitteddelta) {
-		pr_warn("PLL delta too large\n");
-		return -EINVAL;
-	}
-
 	pixpllc->m = m;
 	pixpllc->n = n;
 	pixpllc->p = p;
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 7e07fc3f1a60..a881d85e6f39 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -468,6 +468,7 @@ int mgag200_primary_plane_helper_atomic_check(struct drm_plane *plane,
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(new_state, plane);
 	struct drm_framebuffer *new_fb = new_plane_state->fb;
 	struct drm_framebuffer *fb = NULL;
+	struct mga_device *mdev = to_mga_device(plane->dev);
 	struct drm_crtc *new_crtc = new_plane_state->crtc;
 	struct drm_crtc_state *new_crtc_state = NULL;
 	struct mgag200_crtc_state *new_mgag200_crtc_state;
@@ -485,6 +486,9 @@ int mgag200_primary_plane_helper_atomic_check(struct drm_plane *plane,
 	else if (!new_plane_state->visible)
 		return 0;
 
+	if ((u64)new_fb->pitches[0] * new_fb->height > mdev->vram_available)
+		return -EINVAL;
+
 	if (plane->state)
 		fb = plane->state->fb;
 
