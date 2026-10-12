Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 161C848D89C
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791810002; cv=none; b=V2sC9fwtWV2RfkQotEfZcs0KY8il7uoWYqAewCvDCDhWbcfq5JkjoP+q1BU+cr0eEPmVYsmhy/5pImUeieDmu6Jntqc4eHF+rW0by26FjF9GRVjpQ5lVT1LG6cFcvRDNz7ljL1kmXFTfyKPZlYu5chUX8bIo+fgfdLUSjHEl1O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791810002; c=relaxed/simple;
	bh=SwCssg1TtHWQq2cdAinXB1qI41TqJtYDamzkLDOC6fA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rnQCI67V4guOOUHhJU2Zj0Q/X3h2HFPQXYF7CSpvtCU53EOz7jnsC3JM2zE5sEnIzj+b+g+DZgVeC7lz9Ee77kIiyvwyd/NJubjww3Xjk7KGE8LeYT/Uilj061veu4dM8W94awVbo3KeMVx+h7Pvoq4od6czxxNo+t+dqzocKxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=HdAw3cBO; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="HdAw3cBO"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E3411A00;
	Mon, 12 Oct 2026 05:59:54 -0700 (PDT)
Received: from e120398-lin.trondheim.arm.com (e120398-lin.trondheim.arm.com [10.42.46.160])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A31D3F66F;
	Mon, 12 Oct 2026 05:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791809997; bh=SwCssg1TtHWQq2cdAinXB1qI41TqJtYDamzkLDOC6fA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HdAw3cBO1/tCgaMzK0D2MgS4llSSUEKQ3hye7w4v3eiQ3q+hMh0qxVj8vEAdqXhzt
	 kYbJ62I5aISbD1mepAjka+MXBYlAXnF/eKPYXfW1bF4nKosadA8oGKdSn0DrdNCrxs
	 ZT6ILx2aahPEIAMHxgZcy5WWkgyMd1/jx5N5dyJw=
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
Subject: [PATCH v4 01/12] drm/panthor: De-duplicate FW memory section sync
Date: Mon, 12 Oct 2026 14:59:29 +0200
Message-ID: <20261012125940.3291951-2-ketil.johnsen@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012125940.3291951-1-ketil.johnsen@arm.com>
References: <20261012125940.3291951-1-ketil.johnsen@arm.com>
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

