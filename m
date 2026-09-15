Received: from mta0.migadu.com (out-64.mta0.migadu.com [91.218.175.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28FC2D7380
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789466573; cv=none; b=OCGwloN/UWD6aHlDuNhdUphr+gDNt51Nzk0oZjUxFn5xarufvU2OZjZnY3Wd4sBuCs2zONHagnlJpFFm/itkuCeNR0JEYDj/OmqN/doiUpd+nIFWe0SOJITVh3tzmXv3Dq6XstW199sejKGbcZDK/NUu4bqqlC8J5mdCttUgZhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789466573; c=relaxed/simple;
	bh=KMag9z0Wo8hiEdB8tK0/7JfGoncyKQBZfpyQXLCcKdg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=i2XJuNeGEhj6cvUyVSZJT1ArUHfqm+IWSk4mt06T4cEhwkYpMY5eFdaqCXlTpjENTrSukvqbvXRErtKLS77cB8QWWSdlAyd0Se3udwOLHYGpgZcD24U0IdTUj9QT4LwlZ4eHmOvnCztoLYf3cXnzV0ZbPR833JGUuZ8vHwFS4Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=YttsFhCT; arc=none smtp.client-ip=91.218.175.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="YttsFhCT"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=KMag9z0Wo8hiEdB8tK0/7JfGoncyKQBZfpyQXLCcKdg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789466568; v=1; x=1790071368;
 b=YttsFhCTn3tZlWIHx/QqJcEIAvoQpRoMuUG5wdRTl21giZ2jMGLhAiSs3TgKFZ0y2qekKoYn
 g3IcZax4jAs8utERH4C2S6T4MxNvexlRMhHGGRWN+pKzNJY6aX9MySTiugeuwgwUUdiExes25z5
 ZntsXar4F65phKoOEsNieu60=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 795572a7255fdb00;
	Tue, 15 Sep 2026 10:02:48 +0000
X-Mizu-Trace-ID: 795572a7255fdb00
X-Migadu-Flow: FLOW_OUT
From: Ye Liu <ye.liu@linux.dev>
Date: Tue, 15 Sep 2026 18:02:37 +0800
Subject: [PATCH RFC] mm/vmalloc: implement in-place grow for vrealloc
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-vmalloc_vrealloc-v1-1-37404c31338f@linux.dev>
X-B4-Tracking: v=1; b=H4sIALwXqWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDS0NT3bLcxJyc/OT4sqJUMEM3ydTQ0tgiKc04JclcCaitoCg1LbMCbGS
 0UpCbs1IsUDApsThVN6koMS85A2QauiFKtbUA6OSNfYoAAAA=
X-Change-ID: 20260915-vmalloc_vrealloc-b51938bf3db7
To: Andrew Morton <akpm@linux-foundation.org>, 
 Uladzislau Rezki <urezki@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Ye Liu <liuye@kylinos.cn>
X-Mailer: b4 0.14.3

From: Ye Liu <liuye@kylinos.cn>

vrealloc() previously fell through to a full reallocation + memcpy +
vfree whenever the new size exceeded the already-mapped page count,
even when the existing VA range had sufficient room.  This meant every
grow operation paid an O(n) memcpy and two VA allocations for no
benefit.

Implement an in-place grow path that allocates additional physical
pages and maps them into the unused tail of the existing VA range,
avoiding reallocation entirely when the VA has room.  On failure
(partial allocation or mapping error), the path cleans up and falls
through to the existing need_realloc fallback, so behavior is
preserved.

The grow path is guarded by the same conditions as the shrink path
(no huge pages, no special vm_flags, GFP allows IO and FS), plus
VM_MAP_PUT_PAGES since growing would mix allocator-supplied pages
with caller-supplied ones, and a VA-range check to ensure the new
size fits within the existing allocation.

The mapping prot is stored in vm_struct at allocation time and reused
in the grow path, rather than hardcoding PAGE_KERNEL.  This preserves
the caller's prot for any allocation type, including the
arch_vmap_pgprot_tagged() transformation applied under
CONFIG_KASAN_HW_TAGS on arm64, where a hardcoded PAGE_KERNEL would
map grown pages with MT_NORMAL instead of MT_NORMAL_TAGGED and
silently disable MTE tag checks.

On __vmap_pages_range() failure, the error path calls vunmap_range()
before vm_area_free_pages() to tear down any partially-installed PTEs,
honoring the documented precondition of vm_area_free_pages() and
mirroring the shrink path's unmap-then-free ordering.

Signed-off-by: Ye Liu <liuye@kylinos.cn>
---
 include/linux/vmalloc.h |  1 +
 mm/vmalloc.c            | 75 ++++++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 75 insertions(+), 1 deletion(-)

diff --git a/include/linux/vmalloc.h b/include/linux/vmalloc.h
index 034a693777ca..a14472cb1858 100644
--- a/include/linux/vmalloc.h
+++ b/include/linux/vmalloc.h
@@ -68,6 +68,7 @@ struct vm_struct {
 	phys_addr_t		phys_addr;
 	const void		*caller;
 	unsigned long		requested_size;
+	pgprot_t		prot;
 };
 
 struct vmap_area {
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 859e6d2d57a3..1198349d2bad 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3894,6 +3894,8 @@ static void *__vmalloc_area_node(struct vm_struct *area, gfp_t gfp_mask,
 	unsigned int flags;
 	int ret;
 
+	area->prot = prot;
+
 	array_size = nr_small_pages * sizeof(struct page *);
 
 	/* __GFP_NOFAIL and "noblock" flags are mutually exclusive. */
@@ -4474,8 +4476,79 @@ void *vrealloc_node_align_noprof(const void *p, size_t size, unsigned long align
 		return (void *)p;
 	}
 
+	/*
+	 * Grow in-place: allocate and map additional pages within the
+	 * existing VA range, avoiding a full reallocation + memcpy.
+	 *
+	 * Skip huge page allocations (page_order > 0) as partial huge
+	 * page mapping would require splitting.
+	 *
+	 * Skip VM_FLUSH_RESET_PERMS and VM_USERMAP for the same reasons
+	 * as the shrink path above.
+	 *
+	 * Skip VM_MAP_PUT_PAGES as those allocations use caller-supplied
+	 * pages; growing would mix allocator-supplied pages with them.
+	 *
+	 * Skip if either GFP_NOFS or GFP_NOIO are used, as page table
+	 * allocation internally allocates with GFP_KERNEL, which could
+	 * trigger a recursive deadlock under filesystem or I/O reclaim.
+	 */
+	if (PAGE_ALIGN(size) <= alloced_size && !vm_area_page_order(vm) &&
+	    !(vm->flags & (VM_FLUSH_RESET_PERMS | VM_USERMAP |
+			   VM_MAP_PUT_PAGES)) &&
+	    gfp_has_io_fs(flags)) {
+		unsigned long addr = (unsigned long)kasan_reset_tag(p);
+		unsigned long old_nr_pages = vm->nr_pages;
+		unsigned long new_nr_pages = PAGE_ALIGN(size) >> PAGE_SHIFT;
+		unsigned long nr_new_pages = new_nr_pages - old_nr_pages;
+		gfp_t alloc_gfp = flags;
+		unsigned long nr_allocated;
+		unsigned int scope_flags;
+		struct vmap_node *vn;
+		int ret;
+
+		if (!(alloc_gfp & (GFP_DMA | GFP_DMA32)))
+			alloc_gfp |= __GFP_HIGHMEM;
+
+		nr_allocated = vm_area_alloc_pages(
+				vmalloc_gfp_adjust(alloc_gfp, false), nid,
+				0, nr_new_pages, vm->pages + old_nr_pages);
+
+		if (nr_allocated != nr_new_pages) {
+			if (nr_allocated)
+				vm_area_free_pages(vm, old_nr_pages,
+						   old_nr_pages + nr_allocated);
+			goto need_realloc;
+		}
+
+		scope_flags = memalloc_apply_gfp_scope(flags);
+		ret = __vmap_pages_range(addr + (old_nr_pages << PAGE_SHIFT),
+					 addr + (new_nr_pages << PAGE_SHIFT),
+					 vm->prot,
+					 vm->pages + old_nr_pages,
+					 PAGE_SHIFT,
+					 (flags & GFP_RECLAIM_MASK) | __GFP_ZERO);
+		memalloc_restore_scope(scope_flags);
+
+		if (ret) {
+			vunmap_range(addr + (old_nr_pages << PAGE_SHIFT),
+				     addr + (new_nr_pages << PAGE_SHIFT));
+			vm_area_free_pages(vm, old_nr_pages, new_nr_pages);
+			goto need_realloc;
+		}
+
+		vn = addr_to_node(addr);
+		spin_lock(&vn->busy.lock);
+		vm->nr_pages = new_nr_pages;
+		spin_unlock(&vn->busy.lock);
+
+		vm->requested_size = size;
+		kasan_vrealloc(p, old_size, size);
+
+		return (void *)p;
+	}
+
 need_realloc:
-	/* TODO: Grow the vm_area, i.e. allocate and map additional pages. */
 	n = __vmalloc_node_noprof(size, align, flags, nid, __builtin_return_address(0));
 
 	if (!n)

---
base-commit: 68142f986ff04b2b70b31db00f719bf690f64a9a
change-id: 20260915-vmalloc_vrealloc-b51938bf3db7

Best regards,
-- 
Ye Liu <ye.liu@linux.dev>

