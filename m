Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B154756B9
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790247894; cv=none; b=SY8eZWxZ0OQ7R8HvlXuTr01SD6ZIZB7MoYGHCtabp4op2jP8N2HWo8CufzJCic8IohIzFvvz12W+2WVQv6Om1JFlr9wIBiGxhRHDR+rV/JJ0ZhEBrdMTvsHaN4JQ8SvVW1lM5CdRfaGw+c/qOEDVR76UPxz6s2NUshI7ZjkmkFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790247894; c=relaxed/simple;
	bh=RWRAgqcZvTlrK4MF3qHx3XFr+HEwUZDkIslQuz9Qlg8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PvZYF8JCq2EyCfysVXoMkSNCxyxwY92dypPVXuTPw6PXsa/vd+h1wYG0c0u6xvEyKWsBQK+pk69JD4GG0L3AqelGp9YaQ0j65DbK7iRbDVJalE53RXj1z1N+GM8fmj1FB3/iDsTkn04ZmMXOAo7wPd+XZmZoiL6fcFn6Xi7t5Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=B8n5c237; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="B8n5c237"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790247887;
	bh=RWRAgqcZvTlrK4MF3qHx3XFr+HEwUZDkIslQuz9Qlg8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=B8n5c2373DgF95Ch8id6LmuRhRMms9kCwImL+CMWmVTm1TGgjloOmxAQdDy1GG4QT
	 mfUExrk4vHViZHBFWgDXU5Knb5B8ljXjiM6Ksk6JyqKtrPgFv3rxZS8zIX4gFUPmlU
	 j7j90+PjIRxZkvtvB5RShnK+S4Rh7Vqh72DojFhe3mmrFtbDOTq9ZM7rTawhpgkJTj
	 9N22loDN7VOTd+guqSajVYyaGyYSqarFZHnsdUprxUl3qMbHMBf7VyHjRgj7A/jczw
	 CL65b63cqnZbSyBNeKvu8xVAFqeRf1EbqKTi9MgatsH9+2lUF0f9jPrDR3mHOdZc6V
	 ytALqyFkIeiuQ==
Received: from fedora-32.home (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DD59717E01D1;
	Thu, 24 Sep 2026 13:04:46 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
Date: Thu, 24 Sep 2026 13:04:38 +0200
Subject: [PATCH v2 1/5] drm/panthor: Avoid false positives in
 iova_mapped_as_huge_page()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-panthor-fix-partial-unmap-v2-1-59a68a1f9e14@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790247886; l=3632;
 i=boris.brezillon@collabora.com; s=20260429; h=from:subject:message-id;
 bh=RWRAgqcZvTlrK4MF3qHx3XFr+HEwUZDkIslQuz9Qlg8=;
 b=5zWK0jgFjRNP103VQCHWK0VdP4mIvApPtSIptMSX3bH7QUr1Gor03hxfYghzoGuYziZ4kF8Mk
 OgDYOS3gi3KDAEl442baR9J1LmeTmoyGai28AklsgkVU5U4RGPARVXy
X-Developer-Key: i=boris.brezillon@collabora.com; a=ed25519;
 pk=eN+ORdOgQY7d5U+0kA8h5bf67XdD8bhKbjD/TCHexSY=

The check on the folio size is actually moot if the BO offset matching
the VA we're checking huge-mapping for is not 2M aligned as well.
This means that we are sometimes returning true when we shouldn't, which
forces an extra unmap+map to deal with block-mapping splits. It's not
a functional bug per-se, because the unmap+map sequence will restore
things in the state we expect them to be, but it's better to properly
optimize those cases.

Note that we now align the VA on 2M address below it otherwise we can't
check the bo_offset alignment (both physical and virtual address need
to be aligned, in addition to the physically contiguous size being 2M,
which the folio size check ensures).

These changes force us to pass the drm_gpuva that's being unmapped
instead of the new mappings that will be created to cover the left/right
sections we remap. This changes makes the logic a lot easier to reason
about, because it doesn't make sense to how things were mapped by
passing the new mappings that are not yet in place.

Fixes: 8e7460eac786 ("drm/panthor: Support partial unmaps of huge pages")
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Reviewed-by: Akash Goel <akash.goel@arm.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_mmu.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 9f63a048df61..b0a7033480e6 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -2295,15 +2295,29 @@ static int panthor_gpuva_sm_step_map(struct drm_gpuva_op *op, void *priv)
 }
 
 static bool
-iova_mapped_as_huge_page(struct drm_gpuva_op_map *op, u64 addr)
+iova_mapped_as_huge_page(struct drm_gpuva *mapping, u64 va)
 {
-	struct panthor_gem_object *bo = to_panthor_bo(op->gem.obj);
+	struct panthor_gem_object *bo = to_panthor_bo(mapping->gem.obj);
+	u64 aligned_va = ALIGN_DOWN(va, SZ_2M);
 	const struct page *pg;
 	pgoff_t bo_offset;
 
-	bo_offset = addr - op->va.addr + op->gem.offset;
+	/* If the 2M-aligned VA is outside the mapping being tested, we know
+	 * it's not a huge map.
+	 */
+	if (aligned_va < mapping->va.addr)
+		return false;
+
+	bo_offset = aligned_va - mapping->va.addr + mapping->gem.offset;
 	pg = bo->backing.pages[bo_offset >> PAGE_SHIFT];
 
+	/* In case of shmem backing, we know we can only have a huge mapping
+	 * if the bo_offset is 2M aligned, meaning we can skip the folio size
+	 * check if it's not the case.
+	 */
+	if (!IS_ALIGNED(bo_offset, SZ_2M))
+		return false;
+
 	return folio_size(page_folio(pg)) >= SZ_2M;
 }
 
@@ -2328,7 +2342,7 @@ unmap_hugepage_align(const struct drm_gpuva_op_remap *op,
 	 */
 	if (op->prev && aligned_unmap_start < *unmap_start &&
 	    op->prev->va.addr <= aligned_unmap_start &&
-	    (is_sparse || iova_mapped_as_huge_page(op->prev, *unmap_start))) {
+	    (is_sparse || iova_mapped_as_huge_page(op->unmap->va, *unmap_start))) {
 		*unmap_range += *unmap_start - aligned_unmap_start;
 		*unmap_start = aligned_unmap_start;
 	}
@@ -2338,7 +2352,7 @@ unmap_hugepage_align(const struct drm_gpuva_op_remap *op,
 	 */
 	if (op->next && aligned_unmap_end > unmap_end &&
 	    op->next->va.addr + op->next->va.range >= aligned_unmap_end &&
-	    (is_sparse || iova_mapped_as_huge_page(op->next, unmap_end - 1))) {
+	    (is_sparse || iova_mapped_as_huge_page(op->unmap->va, unmap_end - 1))) {
 		*unmap_range += aligned_unmap_end - unmap_end;
 	}
 }

-- 
2.55.0

