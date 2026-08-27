Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FA6485508
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787846515; cv=none; b=s3SrZLgTAyLso4M4VpyAqTUZOWWSISCCReDKXNK4rn3dYD3i2we02ybrECQn0sCIpwXDKHZwm3lds2HLn/Kq/89S6nM6jvYJNZ5BPSIyydWzIDgxrREhzusk80gPBKVqbhNFqQvh9OhSlN/C7ZY0Sc/QFh3ieXezloE7F4vDu2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787846515; c=relaxed/simple;
	bh=PW+GcvvbUGVxzEHTgW84btREoXtimARuq1T5cvzKJUo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H38wWBcvLj/AVgywyL+vRW2zo+AvjtxQunjcN9kB2m5MdmxDtJZRzM+4D1NLHCRXl4hzjD4AG/C7OL8H0+LmnxlWbTULd7NRaE7xkzgEvhX+YC8n+aRrfClN8DXQdTDliM1C1DjLaFC2lKxolN5CvZNr4P2++M6jMGoBnjTHCLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=snu.ac.kr; spf=pass smtp.mailfrom=snu.ac.kr; dkim=pass (1024-bit key) header.d=snu.ac.kr header.i=@snu.ac.kr header.b=eTtWR4mE; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=snu.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=snu.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=snu.ac.kr header.i=@snu.ac.kr header.b="eTtWR4mE"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cbb8b54fcf8so66934a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snu.ac.kr; s=google; t=1787846512; x=1788451312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yLi7v7g15LnedtmXwdYoapwhUgM7Q6Gg36WKTShpPEs=;
        b=eTtWR4mEvjhzrF2mvMQTc4yTFuBGI4HGgxyp1nkUoD+fNNaUmYzmVqvHzbNjFX4xmy
         UuEZZRP8PBIL2T9pGt4UbKd5S/PMjTvdlOhptnj6lPsx2Q2S9uq5w5jXhoHeXqTNuqzT
         cXS6lr7ijtUeFniJEEbRzfXAssW1882nVKmMA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787846512; x=1788451312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yLi7v7g15LnedtmXwdYoapwhUgM7Q6Gg36WKTShpPEs=;
        b=TpvOd1rM8f6j9NL22VKqH4u9ceP4T0qpA3eTbLyusP6uSae/xGNl2m+AtnIaBlYZEW
         itfW7/FbmJU7ZLSGbhsE77W4omry9L1dfcOreh48A78EsLhUN5VlBF5E1jR5UJ0nqtHt
         4HDljR1+r9qPJ1s9js0Qv0c0qos8ZPe7GUzyku/hac20q793kDs4aXK0Rhlhgp+7O3qk
         xALFGk6dX4g4lZI+0sXfNA5mOXyAUUAK+7p85bl95kpBA8cOeKXvipAujjRnGg6mYvmt
         dRVw33O9QmN5eq3+zMngI0kdLlfZsCmadHVSNxrk4mWLeKXJqTWgiw32lmHctY82uE77
         1TQA==
X-Forwarded-Encrypted: i=1; AHgh+RoL8inmuwEjLgpfZT/22I5mr+1cj3qSPasdgTCELFF/Q39JLDqdNQVNMonpfq/JAusOKAXG9xvZPFBgVF8=@vger.kernel.org
X-Gm-Message-State: AFuF++lKCk9vg0NBpZd310g9yfCYQque7OfBkrDW0JPIFyeGFaSXMD0x
	HDqePg5/xIoswcma/MkOLRzHhu0I0peWkk6gma3pPlUpadfLqLNSisZgRyeR2K9aCS4=
X-Gm-Gg: AR+sD10Fsz67Cd4eizYi2SnDeSPQ+t2BLSKS1NcjnNAMjbfq7Psc08Pc/L1HQKjJE0g
	9l7gDB3WBbF4mql8FN4VeOpGUMJZhDk7Xf4u1hxWknIeiuBMrvhKhZac2AHv/GR3Kv4WpZGUYNU
	2Z4BVeciTfA/cOqArZWSHUv0J4ffqzke0iGZXUYBnR0p6/ylirgIVD4Sd+vCKeWE2yGnYI/0yRX
	vhdfolMIOnO2tvGABd8hjotr05WOvwN+cmoLanjVSY56BviRoDL2oJbfR3hl9/0rH3Xz/LtfFcW
	Qt3Uwo6IlOtSaJlUPRE8RPj4HN/xFVyTdZr7zZmrL9zVMOQPK/qruYBz5qUQB0EGpaK9NzrBzSV
	fP6OMWTC5Z7ckmzGm/Nk6QB42Y87PnkXaOr43A8dbpF8UtqncnQQyitLysuMW/5uWE/25iZPAN/
	XTg7HcnEfODhLcGGNoyZBoEvtgXghHr2bHYSQkZY139Vpqb5J/V4mNzE9VUA==
X-Received: by 2002:a05:6a21:4a97:b0:3d1:5c01:e6c0 with SMTP id adf61e73a8af0-3d15c01ef14mr12486129637.11.1787846511540;
        Thu, 27 Aug 2026 09:01:51 -0700 (PDT)
Received: from 1c1aead48890.. ([49.142.45.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8535a8bd941sm2178632b3a.18.2026.08.27.09.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 09:01:50 -0700 (PDT)
From: Seongjun Hong <hsj0512@snu.ac.kr>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	=?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Seongjun Hong <hsj0512@snu.ac.kr>,
	Sashiko AI Review <sashiko-bot@kernel.org>
Subject: [PATCH] drm/radeon: check radeon_ttm_tt_pin_userptr() return value in bind
Date: Thu, 27 Aug 2026 16:01:23 +0000
Message-ID: <20260827160124.679309-2-hsj0512@snu.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260827160124.679309-1-hsj0512@snu.ac.kr>
References: <20260827091532.340141F000E9@smtp.kernel.org>
 <20260827160124.679309-1-hsj0512@snu.ac.kr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

radeon_ttm_backend_bind() calls radeon_ttm_tt_pin_userptr() without
checking its return value. If pinning fails partway through (e.g.
sg_alloc_table_from_pages()/dma_map_sgtable() failure, or an invalid
userptr range), ttm->pages[] and gtt->ttm.dma_address[] are left
incompletely populated - containing stale entries left over from a
previous bind cycle, or uninitialized memory on the very first one.

radeon_ttm_backend_bind() proceeds anyway and calls
radeon_gart_bind(rdev, ..., ttm->pages, gtt->ttm.dma_address, flags),
which writes those stale/uninitialized DMA addresses straight into
the GPU's GART page table entries. This is not a bounds violation
(the table indices themselves stay in range), but it programs the
GPU to have DMA read/write access to whatever physical memory those
stale addresses happen to resolve to, which may since have been
freed and reused for something else.

Propagate the error and bail out before calling radeon_gart_bind().

Fixes: f72a113a71ab ("drm/radeon: add userptr support v8")
Reported-by: Sashiko AI Review <sashiko-bot@kernel.org>
Signed-off-by: Seongjun Hong <hsj0512@snu.ac.kr>
---
 drivers/gpu/drm/radeon/radeon_ttm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index cbc0339cf127..58bd1e73587a 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -431,7 +431,9 @@ static int radeon_ttm_backend_bind(struct ttm_device *bdev,
 		return 0;
 
 	if (gtt->userptr) {
-		radeon_ttm_tt_pin_userptr(bdev, ttm);
+		r = radeon_ttm_tt_pin_userptr(bdev, ttm);
+		if (r)
+			return r;
 		flags &= ~RADEON_GART_PAGE_WRITE;
 	}
 
-- 
2.43.0

