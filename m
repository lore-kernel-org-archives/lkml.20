Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.230
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794813263;
	b=18UweZ0c8MfIXY6fd0WcNe4LXHGjq4ivgBPkoPx+ckVtFCmGfZS560Cu8a4b6Yvgk3wd
	 ZNNv0dQfQIv029jASEYs3DmzxfZttMTo6tgVrcmCKEwLI3eqcDsheDO33DMuLQ0mBWFts
	 muR5b3tiz5YTPkHcHuquxEWJJMCsAnCLzyKxm3ZVCcda5QDOKWv6vlCSwQXwJftKEfVZO
	 uzyemqL/fiNNH18GyV0AahBZEj8IuzeDThQewxnzp9+8Yv71pafoQnIKegm4YCfsjIs98
	 jg4IuQOVRUMWn0TjlkH7ToKx5OpDREHNmi38efuMfRm15GiWJaw8k1rviSkHfTEOrzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794813263;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=r8vTH4ZwG/2DWs42qtrHbGL6SaYihVYpzXL05YW5oBw=;
	b=mXRdN3GhXMnooh8R7M4JPJtP8jS4Nx5U/UleW3ZTbJdXdDs+l3AHLKmLBdM8ni4RIbdD
	 juKWm1WhMdkOCHjHcJpSM0GrvIx87eu7ljjaLi7P602eP2Vvcn7GFnRXwD5mhaHKmV9Rd
	 0GGyC7SqLJOLE9Ih0hLu5XUPVef2AAq9LDkTgz1EVbOmVQMLv5XEaN5qcABa7MSMRSHw2
	 e9JC4pwhnXYSrjhHgpjXaiCOT/Z7jmIUiX4zHCjq6H4QV9jJ2r2pK1Zsv/4I7/6zHGnEB
	 fOTVLf76YshwBng4b2rgJ0FciQEdas5OKruUzhV8RJaolTrtzNTOIiZjqQvhAu7eIwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="VuyMD/d2";
	arc=none smtp.remote-ip=91.218.175.230
Received: from mta0.migadu.com (out-230.mta0.migadu.com [91.218.175.230])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378F0606A331
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:14:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 378F0606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=VuyMD/d2
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ZK0HyZRkuJf6PUVCzsSx26r+AdupLQhc4IQDUdlGHx8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794813261; v=1; x=1795418061;
 b=VuyMD/d2FNS1xfFGffpEoXLYVZOHRJHoksYj3ncxI4GngvkPOXcE3xO4g0EwHAAAXruYRGqb
 vMkJtMsMiUUbty62kzy5AwvUpwK8KcXgyJd4Jko7YhXUYq5zFyeSKfzGwFOO9wNoOzcC3vKLosv
 2rQp85uxhVs9eQU+LwfP9ABs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 6aca88df114c26b4;
	Mon, 16 Nov 2026 07:14:21 +0000
X-Mizu-Trace-ID: 6aca88df114c26b4
X-Migadu-Flow: FLOW_OUT
From: Hao Ge <hao.ge@linux.dev>
To: Suren Baghdasaryan <surenb@google.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Dev Jain <dev.jain@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@gentwo.org>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-mm@kvack.org,
	Hao Ge <hao.ge@linux.dev>
Subject: [PATCH v5 07/11] mm/vmalloc: undo what __vmap_pages_range_noflush() mapped on failure
Date: Mon, 16 Nov 2026 15:13:21 +0800
Message-Id: <20261116071325.263682-8-hao.ge@linux.dev>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261116071325.263682-1-hao.ge@linux.dev>
References: <20261116071325.263682-1-hao.ge@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__vmap_pages_range_noflush() maps a struct page array and may fail
half way. The ptes installed so far stay behind, so a retry of the
same range, the __GFP_NOFAIL loop in __vmalloc_area_node() or the
module tags populate, trips the WARN_ON(!pte_none()) in
vmap_pages_pte_range() and fails with -EBUSY.

vmap_pages_range_noflush_walk() now reports how many pages it
installed through its running index into the pages array, and
__vmap_pages_range_noflush() undoes [addr, addr + mapped_pages *
PAGE_SIZE) on failure. vmap_pages_pte_range() fails with -EBUSY
instead of installing over a pte that is already set, so the ptes
below that point are all ours, while a pte above it can only have
been put there by somebody else, for example when the caller's range
overlaps an existing mapping. Going further would clear ptes that
are not ours.

This path can run with a non-blocking gfp mask, the undo passes
gfpflags_allow_blocking() as can_resched.

Suggested-by: Suren Baghdasaryan <surenb@google.com>
Suggested-by: Uladzislau Rezki <urezki@gmail.com>
Signed-off-by: Hao Ge <hao.ge@linux.dev>
---
 mm/kmsan/hooks.c  |  4 ++--
 mm/kmsan/shadow.c |  4 ++--
 mm/vmalloc.c      | 36 +++++++++++++++++++++++++++++-------
 mm/vmalloc.h      |  3 ++-
 4 files changed, 35 insertions(+), 12 deletions(-)

diff --git a/mm/kmsan/hooks.c b/mm/kmsan/hooks.c
index 69008b085658..d830a4e649f1 100644
--- a/mm/kmsan/hooks.c
+++ b/mm/kmsan/hooks.c
@@ -208,7 +208,7 @@ int kmsan_ioremap_page_range(unsigned long start, unsigned long end,
 		mapped = __vmap_pages_range_noflush(
 			vmalloc_shadow(start + off),
 			vmalloc_shadow(start + off + PAGE_SIZE), prot, &shadow,
-			PAGE_SHIFT);
+			PAGE_SHIFT, gfp_mask);
 		if (mapped) {
 			err = mapped;
 			goto ret;
@@ -218,7 +218,7 @@ int kmsan_ioremap_page_range(unsigned long start, unsigned long end,
 		mapped = __vmap_pages_range_noflush(
 			vmalloc_origin(start + off),
 			vmalloc_origin(start + off + PAGE_SIZE), prot, &origin,
-			PAGE_SHIFT);
+			PAGE_SHIFT, gfp_mask);
 		if (mapped) {
 			err = mapped;
 			goto ret;
diff --git a/mm/kmsan/shadow.c b/mm/kmsan/shadow.c
index 212449db34a1..452760a333e4 100644
--- a/mm/kmsan/shadow.c
+++ b/mm/kmsan/shadow.c
@@ -247,7 +247,7 @@ int kmsan_vmap_pages_range_noflush(unsigned long start, unsigned long end,
 	origin_end = vmalloc_meta((void *)end, KMSAN_META_ORIGIN);
 	kmsan_enter_runtime();
 	mapped = __vmap_pages_range_noflush(shadow_start, shadow_end, prot,
-					    s_pages, page_shift);
+					    s_pages, page_shift, gfp_mask);
 	kmsan_leave_runtime();
 	if (mapped) {
 		err = mapped;
@@ -255,7 +255,7 @@ int kmsan_vmap_pages_range_noflush(unsigned long start, unsigned long end,
 	}
 	kmsan_enter_runtime();
 	mapped = __vmap_pages_range_noflush(origin_start, origin_end, prot,
-					    o_pages, page_shift);
+					    o_pages, page_shift, gfp_mask);
 	kmsan_leave_runtime();
 	if (mapped) {
 		/* Undo the shadow mapping set up above. */
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 5c1eacc2a0ac..4f3c320a4849 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -725,7 +725,8 @@ static int vmap_pages_p4d_range(pgd_t *pgd, unsigned long addr,
  * may have contiguous chunks, as hinted by @shift.
  */
 static int vmap_pages_range_noflush_walk(unsigned long addr, unsigned long end,
-		pgprot_t prot, struct page **pages, unsigned int shift)
+		pgprot_t prot, struct page **pages, unsigned int shift,
+		unsigned int *mapped_pages)
 {
 	unsigned long start = addr;
 	pgd_t *pgd;
@@ -748,6 +749,7 @@ static int vmap_pages_range_noflush_walk(unsigned long addr, unsigned long end,
 	if (mask & ARCH_PAGE_TABLE_SYNC_MASK)
 		arch_sync_kernel_mappings(start, end);
 
+	*mapped_pages = nr;
 	return err;
 }
 
@@ -758,18 +760,36 @@ static int vmap_pages_range_noflush_walk(unsigned long addr, unsigned long end,
  * The caller is responsible for calling flush_cache_vmap() after this
  * function returns successfully and before the addresses are accessed.
  *
+ * On failure the PTEs installed by this call are torn down before
+ * returning, so a retry sees a clean range; PTEs that were already
+ * there when the walk failed are left alone. When @gfp_mask cannot
+ * block, the teardown skips cond_resched(), it may run in atomic
+ * context.
+ *
  * This is an internal function only. Do not use outside mm/.
  */
 int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
-		pgprot_t prot, struct page **pages, unsigned int page_shift)
+		pgprot_t prot, struct page **pages, unsigned int page_shift,
+		gfp_t gfp_mask)
 {
+	int err;
+	unsigned int mapped_pages = 0;
+
 	if (WARN_ON_ONCE(page_shift < PAGE_SHIFT))
 		return -EINVAL;
 
 	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC))
 		page_shift = PAGE_SHIFT;
 
-	return vmap_pages_range_noflush_walk(addr, end, prot, pages, page_shift);
+	err = vmap_pages_range_noflush_walk(addr, end, prot, pages, page_shift,
+					    &mapped_pages);
+
+	/* Undo the PTEs installed before the failure. */
+	if (err && mapped_pages)
+		__vunmap_range_noflush(addr, addr + (mapped_pages * PAGE_SIZE),
+				       gfpflags_allow_blocking(gfp_mask));
+
+	return err;
 }
 
 int vmap_pages_range_noflush(unsigned long addr, unsigned long end,
@@ -781,7 +801,8 @@ int vmap_pages_range_noflush(unsigned long addr, unsigned long end,
 
 	if (ret)
 		return ret;
-	return __vmap_pages_range_noflush(addr, end, prot, pages, page_shift);
+	return __vmap_pages_range_noflush(addr, end, prot, pages, page_shift,
+					  gfp_mask);
 }
 
 static int __vmap_pages_range(unsigned long addr, unsigned long end,
@@ -3715,7 +3736,7 @@ static int vmap_pages_range_batched(unsigned long addr, unsigned long end,
 		pgprot_t prot, struct page **pages)
 {
 	const unsigned int nr_pages = (end - addr) >> PAGE_SHIFT;
-	unsigned int prev_shift = 0, batch_idx = 0;
+	unsigned int prev_shift = 0, batch_idx = 0, nr_mapped;
 	unsigned long batch_start = addr, batch_end = addr;
 	int err;
 
@@ -3734,7 +3755,8 @@ static int vmap_pages_range_batched(unsigned long addr, unsigned long end,
 
 		if (shift != prev_shift) {
 			err = vmap_pages_range_noflush_walk(batch_start, batch_end,
-					prot, pages + batch_idx, prev_shift);
+					prot, pages + batch_idx, prev_shift,
+					&nr_mapped);
 			if (err)
 				goto out;
 			prev_shift = shift;
@@ -3756,7 +3778,7 @@ static int vmap_pages_range_batched(unsigned long addr, unsigned long end,
 	/* Remaining */
 	if (batch_start < end)
 		err = vmap_pages_range_noflush_walk(batch_start, end, prot,
-				pages + batch_idx, prev_shift);
+				pages + batch_idx, prev_shift, &nr_mapped);
 
 out:
 	if (!err)
diff --git a/mm/vmalloc.h b/mm/vmalloc.h
index 4ec114a75f04..9ea28845f713 100644
--- a/mm/vmalloc.h
+++ b/mm/vmalloc.h
@@ -40,7 +40,8 @@ void clear_vm_uninitialized_flag(struct vm_struct *vm);
 
 int __must_check __vmap_pages_range_noflush(unsigned long addr,
 		unsigned long end, pgprot_t prot,
-		struct page **pages, unsigned int page_shift);
+		struct page **pages, unsigned int page_shift,
+		gfp_t gfp_mask);
 
 void vunmap_range_noflush(unsigned long start, unsigned long end);
 
-- 
2.25.1

