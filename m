Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDEB94CCDFC
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 08:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788425316; cv=none; b=hiLC6ztFVvPVwsyiyQPgPSvrWe+VnhzVWrLs4w/H+K/02QEtRfPxbRhUSNa+eXYtRiHZLThPAQ/CY+2Dc5lRGM457W5w8ao3tMJEboDF2CWgsQwia0uTFR4QsJQO2+zM8ZMYa79SZOTR8fzmvoSU/U43g3h2LZ4C3LxNzNH6TfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788425316; c=relaxed/simple;
	bh=VgGjD9HSxLjQOJd2/Ow9hEchyWshSAPdGUxeKYPAXls=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZopKWT9+dosNPqF+WuLmQiCS0JZrh7eO5LxvpGC+uOVHFuDZn82CcfrBmqznV0R6XksDl4sldkNjX94Y4VDubcdg27m1vX2QmXSW4WAUsxNeqp+vrrmfg7EacdvPHgKiOEaDh02WwatNGy4zDRd4Iko1o4e1CcwyLpwesY2J9C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZCDwHxkW; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZCDwHxkW"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-84e84a6c4bfso786086b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 01:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788425314; x=1789030114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wrwqC3E9eTCws50iPOcrmjIJMJUeiFoxoafRRBaubdE=;
        b=ZCDwHxkWQSDLFX+zSgVaUq7Ozh/4wxKVqwEse7wiB5m/qmP2tW3EE4fGDXkJEGjsG9
         dBgSu9XInFeJkZtxWYtj1VOa9y9C5qAXoFvjxPLJIG6xcUybrteFHc3MKDqasuclXWrW
         WipNB1GzXsDa0ElPDQ7jWJFGRIfimkZIbUE9A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788425314; x=1789030114;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wrwqC3E9eTCws50iPOcrmjIJMJUeiFoxoafRRBaubdE=;
        b=LvPEIKOcqDOl3QCNy/XiZOlTU58ibeW/7y7lFw0TvU5VZOQna3JFAeYYmg1r3eoHjx
         v7RWgcYxXFPo/UmhLAdH3ahfwpXjcIOQSFEhyimoI1hOPMaCLrChHfRo2T6K9IqiiH+a
         5jdYC5N6BstJB1yS0rxeLjkunuOQyMNyQ44S1xnsNcoazf4LiTW2+RnfIZtp3E2/v5Ne
         bOFosGJ946VZ1sUaJAzcIam9E2q6fVsdf6G9DHt8aCLUIIJDHtRSHYkHHZqs7xl/CMd6
         v6F/zjEePDrzArVD9h0o/FaUi6utC89iy87qJkzFrKAAkdt/haeylRjEvKBVuX56KpJI
         Pvsw==
X-Gm-Message-State: AFuF++lPxnL0RcAkM65dB2OC+dk3WOgO6AWXMitnXfeBRA6Zg7EW5Qu/
	TTseY+Cv/qGDoB4SkjS4OJzPDliAmXFpqs4/5UkNe6gKcnNNJR+9Ss7pYEldaFhLKKEa7O9qF+t
	ADj8=
X-Gm-Gg: AYBFou2CfWwZapdtHI8MzXs57VmP+L036pW1bWhLLxuB7LwLxz90n+b5eg8xAR/i6BJ
	vO0aJljgvniq6qy0P/lHW8YYiCwcb6v8Ce2fSec3ahyx+yZpRLOQrAJYqHOyXZC6dAdJ9Otsudd
	0qyb5WzzBy/FUHtf2JKny0mJ/dStKlxX7aWI0dmpH+Gi9lM6//xLs3fAxh6GRt7MixzQ0kq/lhy
	+E7RtXb3zMKyOfgfbb2JHG0b2D+EVWku6yybgTppVLdkSZaNaZLZt4dqqbn6HuO7aV7dMAIBqqp
	tIBPnZUT37E3sm2tgQvrcatUBsGjAHkpeXkYrFU7SmEV+VwZVMahz39X8WQazjuEyzkf6RJystl
	Rct9yR2MDhNYLl8rFL9hVjLXOhv09+Nw94p8I6pETZJOKgr8FOxui8hNQhEQPp8yYkaUs071khD
	+lGKNIMpmUJNd36JMEtf/f9TtJXlcX3CFJaORw3LHgex+JwrWJdBLqZQ+KaQgdHZ41rWxmud4nm
	rt4/QFoZKdp4/UCiviHf6DDkjN8DkP4MOfb7iVl9O/xnrT1vk4syyiqng==
X-Received: by 2002:a05:6a00:3d55:b0:847:852f:c28a with SMTP id d2e1a72fcca58-860662990c6mr2199573b3a.5.1788425313880;
        Thu, 03 Sep 2026 01:48:33 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:59de:d2d:e1ec:bf86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85db24f20besm2671477b3a.7.2026.09.03.01.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 01:48:33 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-kernel@vger.kernel.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/sysfb: Use iosys_map_memset() to clear buffer
Date: Thu,  3 Sep 2026 16:48:22 +0800
Message-ID: <20260903084823.4156065-1-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.970.g62bdec98f9-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The atomic disable in drm/sysfb currently clears the buffer using
memset_io(). Since the mapping is provided in a |struct iosys_map|,
it is better to use the related API instead of extracting the vaddr.
This is mentioned as a TODO item.

Switch to iosys_map_memset(), which takes the mapping as well as an
offset into the mapping.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Rebased onto drm-misc-next
- second patch is gone as it was already implemented
---
 drivers/gpu/drm/sysfb/drm_sysfb_modeset.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c b/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c
index b92cc4b7d2ad..13df0925163a 100644
--- a/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c
+++ b/drivers/gpu/drm/sysfb/drm_sysfb_modeset.c
@@ -375,8 +375,6 @@ void drm_sysfb_plane_helper_atomic_disable(struct drm_plane *plane,
 {
 	struct drm_device *dev = plane->dev;
 	struct drm_sysfb_device *sysfb = to_drm_sysfb_device(dev);
-	struct iosys_map dst = sysfb->fb_addr;
-	void __iomem *dst_vmap = dst.vaddr_iomem; /* TODO: Use mapping abstraction */
 	unsigned int dst_pitch = sysfb->fb_pitch;
 	const struct drm_format_info *dst_format = sysfb->fb_format;
 	struct drm_rect dst_clip;
@@ -396,10 +394,8 @@ void drm_sysfb_plane_helper_atomic_disable(struct drm_plane *plane,
 		return;
 
 	/* Clear buffer to black if disabled */
-	for (i = 0; i < lines; ++i) {
-		memset_io(dst_vmap, 0, dst_size);
-		dst_vmap += dst_pitch;
-	}
+	for (i = 0; i < lines; ++i)
+		iosys_map_memset(&sysfb->fb_addr, dst_pitch * i, 0, dst_size);
 
 	drm_dev_exit(idx);
 }
-- 
2.55.0.970.g62bdec98f9-goog

