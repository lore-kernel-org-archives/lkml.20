Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040604756B1
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790247898; cv=none; b=iG2c0B/R9HWtJ/ETorlnzy0i+ZBmmp48IVUkHRymW3GwXshv9k0dc5fwfS8UKE4fwwrNhqBdvWaZ6GoAYHA3wt3QdwDclD3d2oC+GYTvX9sHVWQMIkbE8PrGhj8+4MLE57X5B4ESAPWedsR5v1Z9DuvCuEDAftcSAK7H4kG2im4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790247898; c=relaxed/simple;
	bh=haNaa1vTgpxyTcCfqXXR41IYwfwITsSUh39XMWGczo8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q5gXDuLA+5ThVJXYRxkTMRbZgSNsJTLIKdBuuyHeUIcxc0BHIbOlMoYRrii2QfWWz44L+61yjobxAW9no0m8mWv256bZ1tmvUBe+f/nOLj2vGGtYmPZqNM1LZ/yxDbeGddGsA5FbG+P7rKfB1duWTMN1J+WwR+OVDq1QNn1GbmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=lRSHosIY; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="lRSHosIY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790247889;
	bh=haNaa1vTgpxyTcCfqXXR41IYwfwITsSUh39XMWGczo8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lRSHosIYzYj774CP8Xo/cJWcvQQCN9W8iBZfJ+6qK3+o1sv5yC7ENLvUWsEf3fQ4r
	 Y6WWNga0wFquCVbyhCqMkh+QghMtTItG8EsXVdteIrQms8yp+KmPqsiOsmUUxzmqQD
	 6bcQs5vAjYf/LaPugns9OOuq8/znZjn7kTnQpVJofGo75KStzcQzJkUzoNk10BfwJ3
	 2AnvYygGH/2PqxdaZvkWIQeHTR4rwZnuHrLZAv3R1u/GQDOrjxViJwvij26p/Zdejc
	 5wWjW+sJM+hW/istAGR6mXj7jVSBb/TqZNLmrwVi87aY8tfMj5W8XSPK+zYv9pVOVG
	 ve092JP/d35tg==
Received: from fedora-32.home (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 36FF017E0D5D;
	Thu, 24 Sep 2026 13:04:49 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
Date: Thu, 24 Sep 2026 13:04:42 +0200
Subject: [PATCH v2 5/5] drm/panthor: Remove redundant
 panthor_fix_sparse_map_offset() call
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-panthor-fix-partial-unmap-v2-5-59a68a1f9e14@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790247886; l=2164;
 i=boris.brezillon@collabora.com; s=20260429; h=from:subject:message-id;
 bh=haNaa1vTgpxyTcCfqXXR41IYwfwITsSUh39XMWGczo8=;
 b=eMMbyP6t2Qzi8/4M0Ex9oQq2+t4AYFS4pSN1SCSJTLJweJK7ouqPPlzH05Y4iH9GUFntsKJVW
 yiE9zh6eurPAA0Hlhw6t4JbsHFxE4vT5BaGRvgr1ijjRKuqXAjGIPIa
X-Developer-Key: i=boris.brezillon@collabora.com; a=ed25519;
 pk=eN+ORdOgQY7d5U+0kA8h5bf67XdD8bhKbjD/TCHexSY=

op->remap.next->gem.offset is adjusted twice in
panthor_gpuva_sm_step_remap() (once on the remap.next object, and once on
the local map_op). Let's do it only once, and move this adjusment closer
to the place it matters.

Reported-by: Akash Goel <akash.goel@arm.com>
Closes: https://lore.kernel.org/dri-devel/b85679e3-5ca2-4d36-8675-2b968d97cb5b@arm.com/
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_mmu.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 01564d250adf..d8fb29ace5c4 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -2397,11 +2397,6 @@ static int panthor_gpuva_sm_step_remap(struct drm_gpuva_op *op,
 
 	drm_gpuva_op_remap_to_unmap_range(&op->remap, &unmap_start, &unmap_range);
 
-	/* op->remap.prev's BO offset is always the same as the unmap va's, but
-	 * that of op->remap.next must be adjusted so as to remain < SZ_2M
-	 */
-	panthor_fix_sparse_map_offset(op->remap.next, unmap_vma->flags);
-
 	if (!unmap_vma->evicted) {
 		/*
 		 * ARM IOMMU page table management code disallows partial unmaps of huge pages,
@@ -2447,6 +2442,12 @@ static int panthor_gpuva_sm_step_remap(struct drm_gpuva_op *op,
 		u64 addr = op->remap.next->va.addr;
 		u64 size = unmap_start + unmap_range - op->remap.next->va.addr;
 
+		/* op->remap.prev's BO offset is always the same as the unmap
+		 * va's, but that of op->remap.next must be adjusted so as to
+		 * remain < SZ_2M
+		 */
+		panthor_fix_sparse_map_offset(op->remap.next, unmap_vma->flags);
+
 		if (!unmap_vma->evicted && size > 0) {
 			struct drm_gpuva_op_map map_op = {
 				.va.addr = addr,
@@ -2454,7 +2455,6 @@ static int panthor_gpuva_sm_step_remap(struct drm_gpuva_op *op,
 				.gem.obj = op->remap.next->gem.obj,
 				.gem.offset = op->remap.next->gem.offset,
 			};
-			panthor_fix_sparse_map_offset(&map_op, unmap_vma->flags);
 
 			ret = panthor_vm_exec_map_op(vm, unmap_vma->flags, &map_op);
 			if (ret)

-- 
2.55.0

