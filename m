Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17E0E48EC95
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791810018; cv=none; b=Z76uDlLKKuxghNjRDTu9DOcKMWl6mpTYLZbfrted4qVxdNLyadEfivzlX29OW0vA84nJVfp5QZ82b3OQ1Q0USmPti/1wqdubaq/CnPCLXEdSPpnpDyUrRoaHnqnyJZ1zDFc8+jV32z6tyRw4trLNk3bPG95ftg1F+SWjVVjNT2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791810018; c=relaxed/simple;
	bh=4hjyLdYHsFbuQQjoim7LNjBF3zXbFAzH1oulIvFyJSI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sdc7ruYfGhEIbuBFOt5W/mtOf2yjFxfy3j2saPzSTSO8rfr3LlUT7txIYmMYbVVvOSUQUd6mDCOpOCkjUNn3Y0O3/1kje9C7oYEAd4eYIior8JejRsL+7u61Bw+xonwnMr5LTFSgSGJytkDu7f6PWvP3lzspv4ImlfFRbglsCkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=W1dMDqps; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="W1dMDqps"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5333F1A00;
	Mon, 12 Oct 2026 06:00:08 -0700 (PDT)
Received: from e120398-lin.trondheim.arm.com (e120398-lin.trondheim.arm.com [10.42.46.160])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5B22D3F66F;
	Mon, 12 Oct 2026 06:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791810011; bh=4hjyLdYHsFbuQQjoim7LNjBF3zXbFAzH1oulIvFyJSI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W1dMDqpsQu4eI8cQ+vCt02JayMK88RyoqYJ6DfgzjqRhzS5EeqtDrAV6SVWHjeQH9
	 1HqfcKm1eU2f8Mj8T5Dc8EIPQuGufJfKkfcWSzlEkQ7z7JCAH7ulKDZ1xeauoVMSTw
	 lmVhCUKCsIMbHk//5VIHSoHZsjkodS9Zuw3JkwwM=
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
Subject: [PATCH v4 06/12] drm/panthor: New function for FW section map flags
Date: Mon, 12 Oct 2026 14:59:34 +0200
Message-ID: <20261012125940.3291951-7-ketil.johnsen@arm.com>
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

From: Boris Brezillon <boris.brezillon@collabora.com>

This refactors the VM map flags for FW sections into a new function
called section_vm_map_flags().
This comes in handly for future handling of protected FW sections
(type CSF_FW_BINARY_IFACE_ENTRY_PROT).

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Co-developed-by: Ketil Johnsen <ketil.johnsen@arm.com>
Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>

---

v4:
- First version of this change as a separate commit
---
 drivers/gpu/drm/panthor/panthor_fw.c | 44 ++++++++++++++++------------
 1 file changed, 26 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index e639ffeac7a32..7b8c90b19f4fe 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -543,6 +543,31 @@ panthor_fw_alloc_suspend_buf_mem(struct panthor_device *ptdev, size_t size)
 					"FW suspend buffer");
 }
 
+static u32 section_vm_map_flags(const struct panthor_fw_section *section)
+{
+	u32 cache_mode = section->flags &
+			 CSF_FW_BINARY_IFACE_ENTRY_CACHE_MODE_MASK;
+	u32 vm_map_flags = 0;
+
+	if (!(section->flags & CSF_FW_BINARY_IFACE_ENTRY_WR))
+		vm_map_flags |= DRM_PANTHOR_VM_BIND_OP_MAP_READONLY;
+
+	if (!(section->flags & CSF_FW_BINARY_IFACE_ENTRY_EX))
+		vm_map_flags |= DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC;
+
+	/* TODO: CSF_FW_BINARY_IFACE_ENTRY_CACHE_MODE_*_COHERENT are mapped to
+	 * non-cacheable for now. We might want to introduce a new
+	 * IOMMU_xxx flag (or abuse IOMMU_MMIO, which maps to device
+	 * memory and is currently not used by our driver) for
+	 * AS_MEMATTR_AARCH64_SHARED memory, so we can take benefit
+	 * of IO-coherent systems.
+	 */
+	if (cache_mode != CSF_FW_BINARY_IFACE_ENTRY_CACHE_MODE_CACHED)
+		vm_map_flags |= DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED;
+
+	return vm_map_flags;
+}
+
 static int panthor_fw_load_section_entry(struct panthor_device *ptdev,
 					 const struct firmware *fw,
 					 struct panthor_fw_binary_iter *iter,
@@ -645,26 +670,9 @@ static int panthor_fw_load_section_entry(struct panthor_device *ptdev,
 	}
 
 	if (section_size) {
-		u32 cache_mode = hdr.flags & CSF_FW_BINARY_IFACE_ENTRY_CACHE_MODE_MASK;
-		u32 vm_map_flags = 0;
+		u32 vm_map_flags = section_vm_map_flags(section);
 		u64 va = hdr.va.start;
 
-		if (!(hdr.flags & CSF_FW_BINARY_IFACE_ENTRY_WR))
-			vm_map_flags |= DRM_PANTHOR_VM_BIND_OP_MAP_READONLY;
-
-		if (!(hdr.flags & CSF_FW_BINARY_IFACE_ENTRY_EX))
-			vm_map_flags |= DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC;
-
-		/* TODO: CSF_FW_BINARY_IFACE_ENTRY_CACHE_MODE_*_COHERENT are mapped to
-		 * non-cacheable for now. We might want to introduce a new
-		 * IOMMU_xxx flag (or abuse IOMMU_MMIO, which maps to device
-		 * memory and is currently not used by our driver) for
-		 * AS_MEMATTR_AARCH64_SHARED memory, so we can take benefit
-		 * of IO-coherent systems.
-		 */
-		if (cache_mode != CSF_FW_BINARY_IFACE_ENTRY_CACHE_MODE_CACHED)
-			vm_map_flags |= DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED;
-
 		section->mem = panthor_kernel_bo_create(ptdev, panthor_fw_vm(ptdev),
 							section_size,
 							DRM_PANTHOR_BO_NO_MMAP,
-- 
2.43.0

