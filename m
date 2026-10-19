Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0E5495020
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792399375; cv=none; b=tZRNY3q0068uWYIGhOQ1mxsoWUCKR87orTLDjpiA1iVtvXRhYh+Cnl2460LNp56fsrobNevr3PNMaNRStAfXVouzHzOHIfmJCZwZrzPGaGOCSNGTjLqwv4VMkcbhkWQ3wJ0mz4XgnYoSNp8FtP3LD7uivvnvjyPR6Dq2lYyQlaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792399375; c=relaxed/simple;
	bh=4brpr3mbOPouT+2U8bTcLTCVXxPGQmoWRZaqziux3eI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=l+90NS7zDokBc1B/K0BghL3m9cb/ZG9kCFyTP7CImIjWpeCoTd0ejxhZ8N75FyS1newyWLfdXKFul9/BtNAYYxe3XGXwdiEfwcdtb86taJSWoO8ksONhaISxUFPRbvYJPCA7NeI70mJUfzgDmaECj8eyu2Z0HBR2QsHK+tspBl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=SW421hVv; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="SW421hVv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=8w
	BHesupO68D0giBCVsmqzzCieBBTYajRHnqr5mfSWI=; b=SW421hVv2v1/HXeM8K
	pYZiR8nJjCDnrldoSnL6W6r5boVP4tSvlbUn1XZGvq51IM+Acs8STjtLiQ1zp1Pt
	XRrVameRislG3EO7qge3vHho/yf8uF8Yh6qy/Wdun/eUjqKlkm+qW1HJtyB5ikMb
	YglvodBAOC2IrMaA8p4+wAYqg=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wDnt9ng19VqcQOlAw--.9091S6;
	Mon, 19 Oct 2026 16:42:17 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Dave Airlie <airlied@redhat.com>,
	Ben Skeggs <bskeggs@redhat.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 4/6] drm/radeon: reject empty VRAM ranges
Date: Mon, 19 Oct 2026 16:41:36 +0800
Message-Id: <20261019084138.1821477-5-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261019084138.1821477-1-yaojiale02@163.com>
References: <20261019084138.1821477-1-yaojiale02@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnt9ng19VqcQOlAw--.9091S6
X-Coremail-Antispam: 1Uf129KBjvdXoWrKrykuF1kZry7CF4rJrW8Zwb_yoWDXrgEgr
	40va4xX34qg3WvqF1kua13ZrZIya1v9Fs5ZF1Iq34fKr9rXF1xZFy3Xr1kXrWUWw43AF98
	ArsYq3y3trZI9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRiveHPUUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC8AlAemrV1+m3QgAA33

A VRAM size smaller than a page becomes a zero-page TTM range and
causes drm_mm_init() to hit its zero-range BUG check. Reject such a
range before initializing the VRAM manager.

Fixes: 37205891d84f ("drm/ttm: make ttm_range_man_init/takedown take type + args")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/gpu/drm/radeon/radeon_ttm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index e7ab8162ac69..925593af1688 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -69,6 +69,9 @@ struct radeon_device *radeon_get_rdev(struct ttm_device *bdev)
 
 static int radeon_ttm_init_vram(struct radeon_device *rdev)
 {
+	if (rdev->mc.real_vram_size < PAGE_SIZE)
+		return -EINVAL;
+
 	return ttm_range_man_init(&rdev->mman.bdev, TTM_PL_VRAM,
 				  false, rdev->mc.real_vram_size >> PAGE_SHIFT);
 }
-- 
2.34.1

