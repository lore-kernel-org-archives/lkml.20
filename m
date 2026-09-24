Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227F81A6814
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790247896; cv=none; b=DMF/KisRWoz1/TAInXY5oyjRvAfMyPetXkLB+Uswur+bvMKyY/bnwB6ib0E8q4mgj8KkSruQGGiF8908dVe70y/0WlIYtfKpiFuv6ekAvTeWZU4htQyNEvGonPg6lcJjZujfgk7DPAZOvKsmzl+CH+5GcoVCLT3R6pJIVLGvGEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790247896; c=relaxed/simple;
	bh=0qelJpYQzmfhybMuaPs5+rDwKz2Lxlo9Q93rfcncJ/U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oCzfBmVFe+QZ/64GonqvUAiE1LkKb3E1esrS0F7SUsMMNWIRIPoK7A89re+zFnktHlkFPefq8+6uAafcap8K+SiG4t5BDFiwZHaZ43OUnlnC3MkRaPbYZWpTgUu6n2hQM5kifqrIdCXhVH70J4i91DGN+a1MWYWgjI3qt1QZHCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Gp4UzP8L; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Gp4UzP8L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790247887;
	bh=0qelJpYQzmfhybMuaPs5+rDwKz2Lxlo9Q93rfcncJ/U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Gp4UzP8LjQBqTLv+3WHrPEI1TQrt8UFzQRoL9Izf8OTGtrZZuKW6u+S8sWjJ7maa3
	 MavSgyle/JiKz+oq2lB9MBcoxSFUFEVxlM1r3gTbRQEfZ73urId4QrZv7lIAvW0iP/
	 aCj5I0I/vpaKs/gjSsVmtNIt0quSW/gbLVWwa+CmFhnAuq2NjQouA443sybLqQOs61
	 0kl7hY98o6CFnDl67PzOsbsnNUk44B9/IalXbdxrOCdTEVvhMXr+5C6ArpMFEStBBB
	 ODI18GK2/0Q5pZNhXy9ZgiWgzl4yPChiQMO10Keliud/yetlOIrPa7LIK3ZOqY3S+e
	 umuCg2qVYJXQg==
Received: from fedora-32.home (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 75E0517E0A68;
	Thu, 24 Sep 2026 13:04:47 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
Date: Thu, 24 Sep 2026 13:04:39 +0200
Subject: [PATCH v2 2/5] drm/panthor: Fix iova_mapped_as_huge_page() for
 imported BOs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-panthor-fix-partial-unmap-v2-2-59a68a1f9e14@collabora.com>
References: <20260924-panthor-fix-partial-unmap-v2-0-59a68a1f9e14@collabora.com>
In-Reply-To: <20260924-panthor-fix-partial-unmap-v2-0-59a68a1f9e14@collabora.com>
To: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
 Akash Goel <akash.goel@arm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Boris Brezillon <boris.brezillon@collabora.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790247886; l=3046;
 i=boris.brezillon@collabora.com; s=20260429; h=from:subject:message-id;
 bh=0qelJpYQzmfhybMuaPs5+rDwKz2Lxlo9Q93rfcncJ/U=;
 b=ZPRN5/e+EFTIVRXxWfY9ll3+430PqKUnuP8iPpFwnkDAIYAupHI8RL4KA+kIELc9DTWiQm1vF
 Nou2rogH5S4DSxo+tw6raw2zAAosUTkJiSSQ/ypb0L0JaWVzpfg1cdw
X-Developer-Key: i=boris.brezillon@collabora.com; a=ed25519;
 pk=eN+ORdOgQY7d5U+0kA8h5bf67XdD8bhKbjD/TCHexSY=

Imported BOs have no backing.pages array allocated, leading to a NULL
deref when iova_mapped_as_huge_page() gets called on them.

Implement this check through and sgt walk to reach the position of the
sgt targeted by a VA, and check that the DMA address is properly aligned
and the size remaining in the SG entry is bigger than a huge page.
This is basically matching the logic in vm_map_pages(), with get_pgsize()
being replaced by a simpler test, because we don't care about the pgcount
info.

Reported-by: Akash Goel <akash.goel@arm.com>
Fixes: 8e7460eac786 ("drm/panthor: Support partial unmaps of huge pages")
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Reviewed-by: Akash Goel <akash.goel@arm.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_mmu.c | 44 ++++++++++++++++++++++++++++-------
 1 file changed, 36 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index b0a7033480e6..6cef954e2cba 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -2299,7 +2299,6 @@ iova_mapped_as_huge_page(struct drm_gpuva *mapping, u64 va)
 {
 	struct panthor_gem_object *bo = to_panthor_bo(mapping->gem.obj);
 	u64 aligned_va = ALIGN_DOWN(va, SZ_2M);
-	const struct page *pg;
 	pgoff_t bo_offset;
 
 	/* If the 2M-aligned VA is outside the mapping being tested, we know
@@ -2309,16 +2308,45 @@ iova_mapped_as_huge_page(struct drm_gpuva *mapping, u64 va)
 		return false;
 
 	bo_offset = aligned_va - mapping->va.addr + mapping->gem.offset;
-	pg = bo->backing.pages[bo_offset >> PAGE_SHIFT];
 
-	/* In case of shmem backing, we know we can only have a huge mapping
-	 * if the bo_offset is 2M aligned, meaning we can skip the folio size
-	 * check if it's not the case.
-	 */
-	if (!IS_ALIGNED(bo_offset, SZ_2M))
+	if (drm_gem_is_imported(&bo->base)) {
+		struct sg_table *sgt = bo->dmap.sgt;
+		struct scatterlist *sgl;
+		unsigned int count;
+
+		/* If this is an imported BO, we have to walk the SGT and
+		 * check the dma address/size alignment to determine if it's
+		 * a huge map or not.
+		 */
+		for_each_sgtable_dma_sg(sgt, sgl, count) {
+			size_t len = sg_dma_len(sgl);
+			dma_addr_t daddr;
+
+			if (len <= bo_offset) {
+				bo_offset -= len;
+				continue;
+			}
+
+			len -= bo_offset;
+			daddr = sg_dma_address(sgl) + bo_offset;
+
+			return IS_ALIGNED(daddr, SZ_2M) &&
+			       len >= SZ_2M;
+		}
+
 		return false;
+	} else {
+		const struct page *pg = bo->backing.pages[bo_offset >> PAGE_SHIFT];
 
-	return folio_size(page_folio(pg)) >= SZ_2M;
+		/* In case of shmem backing, we know we can only have a huge mapping
+		 * if the bo_offset is 2M aligned, meaning we can skip the folio size
+		 * check if it's not the case.
+		 */
+		if (!IS_ALIGNED(bo_offset, SZ_2M))
+			return false;
+
+		return folio_size(page_folio(pg)) >= SZ_2M;
+	}
 }
 
 static void

-- 
2.55.0

