Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F983443C11
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 11:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789126832; cv=none; b=ix1RugsLXrXV2S9O/cPaR/vn7Owr9kNCqYjDW5TFzwG8hwLit2DpCKaiARMtXz4hNw05Yp1vHJRMN60fFeNATuEDFK759onnYaNa8CaGxGucn22FsE+XOfPL9Ruhr4ZDTU85BqhjKs4ZnZS3PKean2ZE4NTnjeB2oQfLA+hynO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789126832; c=relaxed/simple;
	bh=SwCssg1TtHWQq2cdAinXB1qI41TqJtYDamzkLDOC6fA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OTGdCAX0CvuqAvaUfP1f/fXzKpQUwef4kPRUUN1HE/Qi+ThRJcT96TW1cWoXqCS3BZ2z4alZlbpAKaanrd0ukIVEddOkciNZZkVIfCV85IYZ+Q/aEpk0wrFp990sAbhz59vnY8XwvXGOZkiKEI7dg9xGZ/NekoOiTpwY5ztBIsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=jW6DUbGm; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="jW6DUbGm"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ECCD716F2;
	Fri, 11 Sep 2026 04:40:26 -0700 (PDT)
Received: from e120398-lin.trondheim.arm.com (e120398-lin.trondheim.arm.com [10.42.46.160])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A7AF73F59E;
	Fri, 11 Sep 2026 04:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789126830; bh=SwCssg1TtHWQq2cdAinXB1qI41TqJtYDamzkLDOC6fA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jW6DUbGmhij6XMz24QUwYq3FjGlypfcofBDt+ftQQY/Uyqip087RB1gQK209E3NIl
	 x2g6eXlI1MIq7bZQt7lxz9d6mJd+MxOWFkfNGycNFsUEax2b3C5N6qHt2FyePta85S
	 8B23QRCsoYzGKDeROk9tvxX6WWRAlkEqOYrkEx1A=
From: Ketil Johnsen <ketil.johnsen@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Alice Ryhl <aliceryhl@google.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Ketil Johnsen <ketil.johnsen@arm.com>
Subject: [PATCH v3 1/6] drm/panthor: De-duplicate FW memory section sync
Date: Fri, 11 Sep 2026 13:40:09 +0200
Message-ID: <20260911114014.79139-2-ketil.johnsen@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911114014.79139-1-ketil.johnsen@arm.com>
References: <20260911114014.79139-1-ketil.johnsen@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Handle the sync to device of FW memory sections inside
panthor_fw_init_section_mem() so that the callers do not have to.

This small improvement is also critical for protected FW sections,
so we avoid issuing memory transactions to protected memory from
CPU running in normal mode.

Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panthor/panthor_fw.c | 23 +++++++----------------
 1 file changed, 7 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index 4f1fab66a13bf..5f9f7a92c56a8 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -449,6 +449,7 @@ static void panthor_fw_init_section_mem(struct panthor_device *ptdev,
 					struct panthor_fw_section *section)
 {
 	bool was_mapped = !!section->mem->kmap;
+	struct sg_table *sgt;
 	int ret;
 
 	if (!section->data.size &&
@@ -467,6 +468,12 @@ static void panthor_fw_init_section_mem(struct panthor_device *ptdev,
 
 	if (!was_mapped)
 		panthor_kernel_bo_vunmap(section->mem);
+
+	/* An sgt should have been requested when the kernel BO was GPU-mapped. */
+	sgt = to_panthor_bo(section->mem->obj)->dmap.sgt;
+	if (!drm_WARN_ON_ONCE(&ptdev->base, !sgt))
+		dma_sync_sgtable_for_device(ptdev->base.dev, sgt,
+					    DMA_TO_DEVICE);
 }
 
 /**
@@ -639,7 +646,6 @@ static int panthor_fw_load_section_entry(struct panthor_device *ptdev,
 
 	if (section_size) {
 		u32 cache_mode = hdr.flags & CSF_FW_BINARY_IFACE_ENTRY_CACHE_MODE_MASK;
-		struct panthor_gem_object *bo;
 		u32 vm_map_flags = 0;
 		u64 va = hdr.va.start;
 
@@ -676,14 +682,6 @@ static int panthor_fw_load_section_entry(struct panthor_device *ptdev,
 		}
 
 		panthor_fw_init_section_mem(ptdev, section);
-
-		bo = to_panthor_bo(section->mem->obj);
-
-		/* An sgt should have been requested when the kernel BO was GPU-mapped. */
-		if (drm_WARN_ON_ONCE(&ptdev->base, !bo->dmap.sgt))
-			return -EINVAL;
-
-		dma_sync_sgtable_for_device(ptdev->base.dev, bo->dmap.sgt, DMA_TO_DEVICE);
 	}
 
 	if (hdr.va.start == CSF_MCU_SHARED_REGION_START)
@@ -738,17 +736,10 @@ panthor_reload_fw_sections(struct panthor_device *ptdev, bool full_reload)
 	struct panthor_fw_section *section;
 
 	list_for_each_entry(section, &ptdev->fw->sections, node) {
-		struct sg_table *sgt;
-
 		if (!full_reload && !(section->flags & CSF_FW_BINARY_IFACE_ENTRY_WR))
 			continue;
 
 		panthor_fw_init_section_mem(ptdev, section);
-
-		/* An sgt should have been requested when the kernel BO was GPU-mapped. */
-		sgt = to_panthor_bo(section->mem->obj)->dmap.sgt;
-		if (!drm_WARN_ON_ONCE(&ptdev->base, !sgt))
-			dma_sync_sgtable_for_device(ptdev->base.dev, sgt, DMA_TO_DEVICE);
 	}
 }
 
-- 
2.43.0

