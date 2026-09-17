Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101654F646A
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789648450; cv=none; b=jMbkM/EXKkJX0pNUrpPlQw3RlgVL+lE1CG85CbTm9PQs3Fx2jZ8xX+CL+JjgpDwZHHU15HJb7EQ0hiu+Q6JpbanpayHGlFWNdAOgegxP5zscZsQ3WcpIQW/TuevBe17peVZy4CsoG6hegI/HMe6dLxTZPsYMlsoKF068K59wtrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789648450; c=relaxed/simple;
	bh=MMaeeSrGWMieAmAph989GfXw7lO4bxKRBjJxUH/Jb3I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qpJHbLH0MfdNFvd+xbOGL9Lq7GWXm/iUUBvjDOMYorb7PK+rN0NN2X3G+5vknFH16W4raNS7YJdSmr1xJJO7lcA4c6OR/PDW/nIsSJ4bqqrywOkccKtmM4T0+xhKhM/Hd1sxRVb2/WRwbc4i26FfL6mOqG5EiqRdj4qFeQ49ZKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=nqLkagaa; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="nqLkagaa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789648437;
	bh=MMaeeSrGWMieAmAph989GfXw7lO4bxKRBjJxUH/Jb3I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nqLkagaaq4NpPmOcQQ9dyZHhM8TC5kc1BTKym3/UDIsUjRrtDOV4Pwtn9IasB4nLt
	 xRf42lz44SBfJ5NexowvCRdIKTQXrwUMiORVDaY8i1tSbJNOgf8tMAxu53n4Qq2rGo
	 vl4SerpulB7WdzO+kF3WvUZDkNGi/ZU/fJOnFFeZm4Exbgt7ycXRY4UMCC5vmbIPjA
	 Id6rkFCjpjbyTTdLIrZlTUKx7WEVKa4CcdTj/1Ry6CEQCTES1asbj/C/34WX+dF1iA
	 Z4y+S6f3cU0NzzPiXmq5yvgBiL6Ao3Ah6gmvRUYbFtiA9ez9gIIXmPHFmmgyyUAN/7
	 M4Iwc22ugTMNQ==
Received: from fedora-21.home (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8DCAC17E0D49;
	Thu, 17 Sep 2026 14:33:56 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
Date: Thu, 17 Sep 2026 14:33:46 +0200
Subject: [PATCH 4/4] drm/panthor: Actually check huge-page mapping on
 sparse regions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-panthor-fix-partial-unmap-v1-4-c7008f15fea3@collabora.com>
References: <20260917-panthor-fix-partial-unmap-v1-0-c7008f15fea3@collabora.com>
In-Reply-To: <20260917-panthor-fix-partial-unmap-v1-0-c7008f15fea3@collabora.com>
To: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
 Akash Goel <akash.goel@arm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Boris Brezillon <boris.brezillon@collabora.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789648434; l=2435;
 i=boris.brezillon@collabora.com; s=20260429; h=from:subject:message-id;
 bh=MMaeeSrGWMieAmAph989GfXw7lO4bxKRBjJxUH/Jb3I=;
 b=OLN2Zp5omrp5SZzdpvBzuDGCa2LsqTMYPovhSI3WaSrgTUG4x4Ym2O3HQ/aWq7xLzq5gxCVOq
 K+tS5PYmUQiBOnQ8Kf8Ksk+Pz53cVbKM6+Se47Wng4W7XA8ur45GYyJ
X-Developer-Key: i=boris.brezillon@collabora.com; a=ed25519;
 pk=eN+ORdOgQY7d5U+0kA8h5bf67XdD8bhKbjD/TCHexSY=

With the recent changes to iova_mapped_as_huge_page(), the check for
huge-page mapping of sparse BOs is actually simple:

- for a sparse mapping, we know the BO offset any VA in this regions is
  va & (SZ_2M - 1)
- the VA we're searching the BO offset for is the 2M-aligned
  aligned_va value

This guarantees that the BO offset to check is always zero in that case.

This is simple enough to let the code check if page 0 is a huge page
and save the unmap+map dance when the dummy BO is not backed by a
a huge page. So let's do that and kill the comment that says it's too
complicated.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_mmu.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index d2897099763e..01564d250adf 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -2337,18 +2337,18 @@ iova_mapped_as_huge_page(struct drm_gpuva *mapping, u64 va)
 
 		return false;
 	} else {
-		const struct page *pg = bo->backing.pages[bo_offset >> PAGE_SHIFT];
 		struct panthor_vma *vma = container_of(mapping, struct panthor_vma, base);
 		bool is_sparse = vma->flags & DRM_PANTHOR_VM_BIND_OP_MAP_SPARSE;
+		const struct page *pg;
 
-		/* If the unmapped VMA stands for a sparse mapping, always
-		 * assume the backing storage is a THP, since the overhead of
-		 * unmapping 2MiB worth of 4KiB pages and remapping some of
-		 * them is offset by the logic of working out whether it's
-		 * the opposite case right below.
+		/* BO offset on a sparse mapping is chosen so that 2M-aligned
+		 * VAs point to the start of the BO. Since aligned_va (the
+		 * address we check huge-page against) is 2M-aligned, the BO
+		 * offset is guaranteed to be zero.
+		 * Check panthor_fix_sparse_map_offset() for more details.
 		 */
 		if (is_sparse)
-			return true;
+			bo_offset = 0;
 
 		/* In case of shmem backing, we know we can only have a huge
 		 * mapping if the bo_offset is 2M aligned, meaning we can skip
@@ -2357,6 +2357,7 @@ iova_mapped_as_huge_page(struct drm_gpuva *mapping, u64 va)
 		if (!IS_ALIGNED(bo_offset, SZ_2M))
 			return false;
 
+		pg = bo->backing.pages[bo_offset >> PAGE_SHIFT];
 		return folio_size(page_folio(pg)) >= SZ_2M;
 	}
 }

-- 
2.55.0

