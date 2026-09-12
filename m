Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A372C2363
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 06:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789194784; cv=none; b=J+KGZXqGx0X+GzNEmS+ZDQ50A8t735+SQVQAbbwxieBlpKj8KG0F2KgpRvrinHLhqvV11/N/GR0GvYsqD/iYSgpbNaasa3fMB/dukTzqb0i8ymaE84cBKJBe91+XB98IcpeCGNG1dwdUCHdVthXiXYuEDXSAolUbAZyTWPEK0t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789194784; c=relaxed/simple;
	bh=FDqa2khEYyZlPckd9pWmXH6Nv5m8OxG4LQ/g6rnPE6I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gIQ3FYsmUxYtnq6ijJNHJhQRgO+12r9A0BQ/rAzH9TzzlADUBQp4Hzw6RIvjyygFdsz/CVXQ0HSsEZ2jM7cYWnDX26joJZpBt1Nd4Lyirjdut7twjt2qQDPoAsQM39MfKaSBTDtdu9PiUGAHbnS/YAQ/vZYAGH1q3pWUv7gi3IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AsJQ5xR1; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AsJQ5xR1"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccfd61ecaso4861465e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 23:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789194781; x=1789799581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DPg+7nE162dH93wuY+DrMzygOgGDBhIqEJk9vb3GqbA=;
        b=AsJQ5xR1NWPROvavYtcNgpJlEyjEk1T2hXjq/PoEn8mzoftj9uMuevkwJulSNwZfDS
         MDUyMETo6COj8tI/ZcpSwoOER8jhg7yEygzTLtngUr/2n7uBaDj1tCHkaeUqEHn2mUeO
         rghXbbkj0ZOTw8UHaluGA9xBfkyTeQIlz+3dzsKu6mEsKdpEs3VIqWsnkV7rA2fjc3q7
         ZPuJReR4sE7kwfgunUYP207DgFnF49YVvfnpZOkJi2iu6My1mZPc3hJ5A1/Dt3fQqGb3
         Jriz3nwqKlAHkTA/3HVgrWHtoa0q63m5/9/MUnQxOe4pPtTY7mv0Ah2oBXTPbco5CvNU
         uIwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789194781; x=1789799581;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DPg+7nE162dH93wuY+DrMzygOgGDBhIqEJk9vb3GqbA=;
        b=fxAnMz+QbIRDoESmRA9VlTdlBaKGCyhVjx2YYRBaOMJQKpDc53piSEVU3Itc0dbptX
         zqQThOk0FJgmOwo5u7wtsOL9Ct2VdD/JM+BLPaW4b9PT6Y7npKYnQPBsyevceRv+66OM
         e64R0YtGpWZ8xgbD5BNeLxN5OkHakGzSZBRcD0DubW2AgzqeERrTT6rC3dvFu2qQaFxn
         BE8y/eId0047xPrJCqkyLQOx0BL5TKo11y98XjPxhQZr52Vr0C4c4I68/P9EnoPy9jau
         1hdC6Lf0OH07U5FX1hS9OPYIaAEEa88FdNlke/6KpxnsxjvmML9HRzzEE0ap5C55gNnt
         lJlg==
X-Forwarded-Encrypted: i=1; AKwUvByfRLaYbqxlARjuMb7Y+vZEL9Fs+Z44TzLY2amdbcyL9N5EU7lVbqHYZ5EfUe6vng4lyE6pB3Ob22+oU74=@vger.kernel.org
X-Gm-Message-State: AFuF++kmqr8pIiUaaV1l9BOFV0x948+iOaEYm7eh+KFbFG10O/qz0Mvi
	gUZ63FX5SBP+ODFhuyBYKCnmJp8NgP6JewNmkystWjWccYgXD03yCOz2
X-Gm-Gg: AYBFou2SA9GtTrpuph5CigNnqDxVaSYYEMu11x14UXCXowkAqXzL0uNMEEJ7WI1FEaE
	ttcQNOU3oV0LCkY/ft4+pPL9MrqDiJrj+BSKAuS1di/yLluoH40uNVKOeQYOGg+Kl1GngYWHFlw
	0640col0ym0lpw1rRTjrULlFQR8ZDk69NB4FjVHpNKzFUKjM05f4dWI3hifD3pwtoRtGW9WAbnr
	yEgN4tn7O1ziqAOtru2f5Y3bgn1rxlm+gZYCPBmeo+afKY5X/75k3ZAOzt3RhvAzU77l2DcFrp3
	2/xSdaJn79hCtuYdgs6+ITM9phHjtZbyuqaB200TNvmTOiUxk7hL+ntiGzYiO+Vl6wCTV5pN5DG
	GifHAr2hzNm4duuu/JrCYWolkcpJlU3nbEoeMyTpBXoALB4kFMfkhCBjVPBfxbrgkHMs/bXwX6X
	ijXk7R5glbYA6xHwlSLaWHXoIGBuPWdAGXIe4OvwHr+dYM87ToVCOJiS+HXZ7KhecOO+ffiRnF8
	8c1uNjIfTOFGcGC0MksQbrR2YiMpa756EzRka/6h689vv0PkTflqQdqfps68OMP1xsP7ZMB3386
	4YicBwO2ek6OnTuHuNiIJyTgCriQd+FONkUKVU2ytEyUXrrl+T3KewxIHwEgXcA5WQcvIJjqccQ
	qUxY=
X-Received: by 2002:a05:600d:8654:20b0:495:6e68:5df2 with SMTP id 5b1f17b1804b1-49e619995e3mr63686975e9.12.1789194780974;
        Fri, 11 Sep 2026 23:33:00 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b260-f201-9983-e8c4-aff5-7a36.310.pool.telefonica.de. [2a02:3100:b260:f201:9983:e8c4:aff5:7a36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6fe9d3e3sm11553925e9.0.2026.09.11.23.32.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 11 Sep 2026 23:33:00 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/gem-dma: Correct GEM object wrapper documentation
Date: Sat, 12 Sep 2026 08:32:58 +0200
Message-Id: <20260912063258.43169-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The drm_gem_dma_object_free() wrapper calls drm_gem_dma_free(), but its
description still names the former drm_gem_dma_free_object() helper.
Update the reference to match the wrapped function.

Also correct drm_gem_dma_object_get_sg_table() to document an error
pointer on failure. It forwards the result of
drm_gem_dma_get_sg_table(), which returns ERR_PTR() rather than NULL on
failure.

Fixes: e580ea25c08d ("drm/cma-helper: Pass GEM CMA object in public interfaces")
Fixes: 05b1de51df07 ("drm/cma-helper: Export dedicated wrappers for GEM object functions")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 include/drm/drm_gem_dma_helper.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/drm/drm_gem_dma_helper.h b/include/drm/drm_gem_dma_helper.h
index f2678e7ecb9847917e9c6c0287af9815d54bae79..5defd47d7de425515c76391d1825f0ed28077eaa 100644
--- a/include/drm/drm_gem_dma_helper.h
+++ b/include/drm/drm_gem_dma_helper.h
@@ -52,7 +52,7 @@ extern const struct vm_operations_struct drm_gem_dma_vm_ops;
  * drm_gem_dma_object_free - GEM object function for drm_gem_dma_free()
  * @obj: GEM object to free
  *
- * This function wraps drm_gem_dma_free_object(). Drivers that employ the DMA helpers
+ * This function wraps drm_gem_dma_free(). Drivers that employ the DMA helpers
  * should use it as their &drm_gem_object_funcs.free handler.
  */
 static inline void drm_gem_dma_object_free(struct drm_gem_object *obj)
@@ -87,7 +87,8 @@ static inline void drm_gem_dma_object_print_info(struct drm_printer *p, unsigned
  * use it as their &drm_gem_object_funcs.get_sg_table handler.
  *
  * Returns:
- * A pointer to the scatter/gather table of pinned pages or NULL on failure.
+ * A pointer to the scatter/gather table of pinned pages on success, or
+ * an ERR_PTR() on failure.
  */
 static inline struct sg_table *drm_gem_dma_object_get_sg_table(struct drm_gem_object *obj)
 {
-- 
2.39.5 (Apple Git-154)

