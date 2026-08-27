Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC123B71C0
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787821280; cv=none; b=QA+Kd6VovWlQNeOZaRA65am9PkNcLrXynqkDRnfiEkZTbPG+/kXwmx9slk1yC0WA8pXu8eiizj9KkbR22cRX3THjNYS2G9wynN3v1VEaOrE6UGRNonmQLleeJIEs6rqAFhB6A7jgMjYhzSc4j80FZ6kSJRY9BpYfArpjYGTbV+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787821280; c=relaxed/simple;
	bh=ObrVljo3P2wYAJo68+wUeQqjsK64Lx5Z6QN9RsVEoks=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GBQDFm7WnEEt/ja8kBnICxbCtWEJZZTer64qY4SlZe+Ox/pOsKT8JxTLFsAHPOuTWQ/7c3qQ6aJ83Da69gCFwExrCCkWhO56hQdXdVzuPjVTMpvNHO0SdTVPsamuOufrYpbVuZLnY/Y7ubnl8IeQumnm1u+ztAjY1kFVchQz5QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=snu.ac.kr; spf=pass smtp.mailfrom=snu.ac.kr; dkim=pass (1024-bit key) header.d=snu.ac.kr header.i=@snu.ac.kr header.b=Z2yQ0y3b; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=snu.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=snu.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=snu.ac.kr header.i=@snu.ac.kr header.b="Z2yQ0y3b"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cedda2ce6fso3011335ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 02:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snu.ac.kr; s=google; t=1787821275; x=1788426075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rgBLolzdPT4tsDrmX6mCnbe4xBVr2san57ni3P7/sf0=;
        b=Z2yQ0y3b56J6LLYMT/yoHsGjTJtbQZMCa8VJ/XDx6M/AE2+LiTMscwMWawlhOw25kv
         f1RaQsDi/gWuxIIHedzzhgi/jraYJzsquzilaOx7+MK6AotUbjqTA66GO62w0vvNoZHY
         gkbqNRnkvBqoS/+avvc71bJTtsiv+CTwM6iKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787821275; x=1788426075;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rgBLolzdPT4tsDrmX6mCnbe4xBVr2san57ni3P7/sf0=;
        b=e/unxk7pt8RfIrC4GvuzlRwwwK1vG1V7tmU+i8/PZVwSInQta/FJ0UuF891bFzJxMN
         dfdRANCTYIloncbEkmgjzKH3YnSofzxq/W+RsLf1hLCVQd/bidH6KpER8KrPWAgUOGO7
         NsT2cgLMV2dZJImYs/xn5V0aRdxb/arzhcutzRvynPffB0lRC/IxPs9lUnadwnMJsgB6
         tkN8xjW2cae8DrcQIXTCcj92Ws+Z5nlcyNWuIKfdv/V+0v8F2ydW2Fv4oBEZBt5WE7vL
         Amio7+ZnmJUS6twoFYdniatFKS9DyaS78TEsop5DewM61d5+80HXLJ0ZeeDtqRkB+JIc
         d48Q==
X-Forwarded-Encrypted: i=1; AHgh+RoF2gY+QavCRYSpV5UlvOSa7UKRHGfqh04KFdiKWRo8HutNw2EbUQbmFVH/lwJhUIwxj7yRZhol6FYx7Sc=@vger.kernel.org
X-Gm-Message-State: AFuF++kfsncFTSpwE4OTErwMz/p2csPjDl93yyqhxUUd+FcJgECJfo0T
	3b1P4q9cqUJjRFBca5dObKYn/8RpQ9p1Rx3ALTVgEvU489typlMXi8Gdw7f1D6N8its=
X-Gm-Gg: AR+sD13trVQKXh5Pi2fHdiBlWSydSR99gLleXOu2JMObdnrxqbLYfQ8WqiP76n/U+s6
	AwZCVCvvPQ9TRbAaU3mOPL/iKGBWX+2FVnOFPH1wZpRIhf5khzzdCtPfAHpaa+FH1TKcszXuxDK
	6KV0QV1xMezERub9g4hzLBU99nZw83mwoCoZ1xMEp7sLsBnX/TnEHPIgoy0wE5nU0GHb97E1sji
	VvQpAkbtnjBY5MsSX3M78aR8YAej/YPV2RjJT9hSDVBQrczp/SRIE94ob+f3fqOVNJ5xo6jd6+w
	Ew+Th9IwpXrDmvG3ijc/Ikpepy5SJOdrVPwvMQFDAFodScJiMdpxfTXqOcfD9wKKlS1ynDDR2XH
	IHBMlZ0FjiixfkNfdumlHYAjzTXI2hnmoRb/L62L4KdY1rUokcmABaa4IlKf0Y/ui2reicEqIMV
	QmZGTeWVaLu37kIbEBWrmA5FZhuucz/N7VI5Yj9Q4COFl+jOTgUBkg0bUdAA==
X-Received: by 2002:a17:90a:d2c6:b0:392:c80b:8eff with SMTP id 98e67ed59e1d1-3966d866cc8mr28689376a91.11.1787821273852;
        Thu, 27 Aug 2026 02:01:13 -0700 (PDT)
Received: from 1c1aead48890.. ([49.142.45.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b112b57bsm2062845a91.17.2026.08.27.02.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 02:01:13 -0700 (PDT)
From: Seongjun Hong <hsj0512@snu.ac.kr>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Seongjun Hong <hsj0512@snu.ac.kr>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/radeon: switch from get_user_pages to pin_user_pages
Date: Thu, 27 Aug 2026 09:00:59 +0000
Message-ID: <20260827090100.428302-1-hsj0512@snu.ac.kr>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch old api get_user_pages to pin_user_pages according to [1].
It guarantees these DMA pages are pinned.

[1] Documentation/core-api/pin_user_pages.rst

Signed-off-by: Seongjun Hong <hsj0512@snu.ac.kr>
---
 drivers/gpu/drm/radeon/radeon_ttm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index e7ab8162ac69..22fc35a0e8d8 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -349,7 +349,7 @@ static int radeon_ttm_tt_pin_userptr(struct ttm_device *bdev, struct ttm_tt *ttm
 		uint64_t userptr = gtt->userptr + pinned * PAGE_SIZE;
 		struct page **pages = ttm->pages + pinned;
 
-		r = get_user_pages(userptr, num_pages, write ? FOLL_WRITE : 0,
+		r = pin_user_pages(userptr, num_pages, write ? FOLL_WRITE : 0,
 				   pages);
 		if (r < 0)
 			goto release_pages;
@@ -377,7 +377,7 @@ static int radeon_ttm_tt_pin_userptr(struct ttm_device *bdev, struct ttm_tt *ttm
 	kfree(ttm->sg);
 
 release_pages:
-	release_pages(ttm->pages, pinned);
+	unpin_user_pages(ttm->pages, pinned);
 	return r;
 }
 
@@ -404,7 +404,7 @@ static void radeon_ttm_tt_unpin_userptr(struct ttm_device *bdev, struct ttm_tt *
 			set_page_dirty(page);
 
 		mark_page_accessed(page);
-		put_page(page);
+		unpin_user_page(page);
 	}
 
 	sg_free_table(ttm->sg);
-- 
2.43.0

