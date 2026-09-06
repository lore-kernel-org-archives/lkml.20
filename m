Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FCE318ED2
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 15:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788708471; cv=none; b=u4hrlxfD/yX53cnlN9xYPMZb2EORY2o072a2VBo/oNCT2EdGAZk99J6CEXi/zuxVK+GCChIbF3f2ojFsBJiIEjyUvOkB4HLJllaUsKhc3+weUiQGvXMfcJwmZMeA6feSEkEhqhCy9a2bJ637lzaIeL5i/f9307WX0NYfPfeZoOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788708471; c=relaxed/simple;
	bh=fqi/tswHKHGHu7tLbbS7RoDWedPmxxEMsNqwxBz/l0g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EdUa6KWbNZF9TxKQq+EMtw7j3cG0MF1WxL6nZKTjVJaR6gyrNkfMXodxuXJ7b9b370CzGBK2QXm0qpNRyN4GuKDvUtjAwVTtCvtIOsv1CLPhQXpao9AZIC/FN6s3q7XLIKTEl8qcPJgJ3cnga0Hu77t+BMQw2I1QX77wWTkQNfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=snu.ac.kr; spf=pass smtp.mailfrom=snu.ac.kr; dkim=pass (1024-bit key) header.d=snu.ac.kr header.i=@snu.ac.kr header.b=jUEu1GzG; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=snu.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=snu.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=snu.ac.kr header.i=@snu.ac.kr header.b="jUEu1GzG"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc1d57602e8so2413397a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 08:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snu.ac.kr; s=google; t=1788708466; x=1789313266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wEnUCVkPu/gxA7B/RUFtXbRxYKR7yPXsnGF78M1X41k=;
        b=jUEu1GzGHwuB5gX30b/4Jtj5qxIPDib7e1NtxcQI+jE+2kb4MGZpiof+mx6rv4mqaR
         dRVjnNq901yLCyf/Pz/5XISBhbrv6dTONQTKqaLdwhl+hGHFd/AftZx5kwNLVXP0p/Gu
         E1e8gcUuZkfWr4NNg9PaAdxXcQ/T51QtaUeMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788708466; x=1789313266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wEnUCVkPu/gxA7B/RUFtXbRxYKR7yPXsnGF78M1X41k=;
        b=ewkoz4cMT860wRyQuOzr6rU3iXgtZX8Sda8LtirARGRSB0VIJzIbhJaM/XkhA2Iihl
         e6ptQj7wQqlUDX6pRIEzdRalx6kr7YQNUfd+IlSWMgnS0+2C3YbBqtmAxHIft60iuuZC
         q484/sz2lYL6ZXPUo194UuJyF3itPWSuCxUWnQYmmNadZqwNBosy3FXmcq67x2BDTL65
         hUFyeUdYMYcQjV9aIfhE1f4fGXYIwo5uiiLPk7nNcE/+wplpX21KpyYBtD9upJpTtAsO
         zMev/IVcynY6t82gTh+K/nzjtMtD0uzSEcX54NfEC6YuUjWwuOvih/GgxWNJA4gFmd55
         9Dlg==
X-Forwarded-Encrypted: i=1; AKwUvBy4QawVwY+HYssDG4d1fgfh13+8TZPNbcJdnW80NHaV3VI2Gz/daS3stFmnKFrDPMILH3ldgT6eJlmWmvw=@vger.kernel.org
X-Gm-Message-State: AFuF++mqysr2yymyF6hJTd+y4Fxvx4OikltsUrMotM8voy87YZqXvYFl
	DZ5g6iekvApS7eXNmgIJboNzgR38nYm8bSpSYM42bVgkBGxQ1tBomGYVOcwvzvLkT5g=
X-Gm-Gg: AYBFou0M+jDAgccJK8PTuajQzvqlQEI7z2GIbZZ/86QAW2HeyHQa1uyZO8CEHewsY1x
	Q8uhBmq24Dm3sdLgbnKVeh9FdFCssTAXVWDpTqPtTQ6VLkUtKrN1O+o+twntmOXsg1idR7uQ4i7
	f6BjLtXxvRZ3uOpvBPoBSOwDpTSqaxYd+PXC3HSel1VwTFuN+oRIOWmjQzhfsdwdoriiagFbDmh
	2pLf1cFcRWXGIPnC9kEJ61COpKemEEu0svuBIGNrQUADLIDC1AubSblm9dMRYpIR5StTHoc67sp
	kaN/ipZZ1pwFw6z/vPydhWGGSuNd/4YuOOfP68qJnsMN3oqJbDC7PhEqB8xe+ccgHCUxavG7kcn
	ugcWK0Z/icfFkeZuzCHLy35yGWCO0uIvZpFzYfrkN7f7PyLS5LpPFQN9IGIJTXYTtUa/hioQy5B
	gLQA5YH9uPNW+jxWjxYzD/PsYomyY8Bd4G12FmnR4A72Gh1AwKKDgEtp6LDA==
X-Received: by 2002:a17:90b:5844:b0:38f:5869:387b with SMTP id 98e67ed59e1d1-39b26101c20mr27376038a91.9.1788708466096;
        Sun, 06 Sep 2026 08:27:46 -0700 (PDT)
Received: from 1c1aead48890.. ([49.142.45.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae9087d3dsm7064589a91.3.2026.09.06.08.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 08:27:45 -0700 (PDT)
From: Seongjun Hong <hsj0512@snu.ac.kr>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Seongjun Hong <hsj0512@snu.ac.kr>
Subject: [PATCH v2] drm/radeon: switch from get_user_pages to pin_user_pages
Date: Sun,  6 Sep 2026 15:27:25 +0000
Message-ID: <20260906152726.1685848-1-hsj0512@snu.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260827090100.428302-1-hsj0512@snu.ac.kr>
References: <20260827090100.428302-1-hsj0512@snu.ac.kr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch old api get_user_pages to pin_user_pages according to [1].
It guarantees these DMA pages are pinned.

Also pass FOLL_LONGTERM: these userptr pages stay pinned for the
lifetime of the GEM userptr BO's GART binding, not just for the
duration of a single call, so this is a long-term pin.

[1] Documentation/core-api/pin_user_pages.rst

Signed-off-by: Seongjun Hong <hsj0512@snu.ac.kr>
---
v2:
- Add FOLL_LONGTERM

 drivers/gpu/drm/radeon/radeon_ttm.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index e7ab8162ac69..c14b215c7e3e 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -346,11 +346,12 @@ static int radeon_ttm_tt_pin_userptr(struct ttm_device *bdev, struct ttm_tt *ttm
 
 	do {
 		unsigned num_pages = ttm->num_pages - pinned;
+		unsigned gup_flags = (write) ? FOLL_WRITE | FOLL_LONGTERM :
+					       FOLL_LONGTERM;
 		uint64_t userptr = gtt->userptr + pinned * PAGE_SIZE;
 		struct page **pages = ttm->pages + pinned;
 
-		r = get_user_pages(userptr, num_pages, write ? FOLL_WRITE : 0,
-				   pages);
+		r = pin_user_pages(userptr, num_pages, gup_flags, pages);
 		if (r < 0)
 			goto release_pages;
 
@@ -377,7 +378,7 @@ static int radeon_ttm_tt_pin_userptr(struct ttm_device *bdev, struct ttm_tt *ttm
 	kfree(ttm->sg);
 
 release_pages:
-	release_pages(ttm->pages, pinned);
+	unpin_user_pages(ttm->pages, pinned);
 	return r;
 }
 
@@ -404,7 +405,7 @@ static void radeon_ttm_tt_unpin_userptr(struct ttm_device *bdev, struct ttm_tt *
 			set_page_dirty(page);
 
 		mark_page_accessed(page);
-		put_page(page);
+		unpin_user_page(page);
 	}
 
 	sg_free_table(ttm->sg);
-- 
2.43.0

