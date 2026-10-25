Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.208
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792950053;
	b=b06W9Xd1914f2Z+rHYI7Yc0Qm08EznxVFL8gCij147Yq9IoYjgPZ09iROa50oEP6s5Ey
	 ViTCvRnILJYi+Iz5C+nSdr2U2ckiI8yZSSjhjeOmmf5kiyyQ4eZ/keZ31WMPwK35hYJ62
	 p397A8xrwAlnM5L2C7uM0WfvjvwClr4n60ieKJ+mQj7hIBIOfWzMMQ7rEgzAN06hdybVy
	 BFrBgKYrqVvsUljeMSKru6w3VdJtYrPEBmIyZF/0CSCRos7JLpMspONzCQpFI26WODSvq
	 sHp8xAbgP7UH2lhFj+i3LDkOmMHbfKwBN5c57Wjle6BOKeB3zmf9gMoUu9lPgtt3PJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792950053;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=EFcn0IkG5YBPfWOvPb8EahamKp0w+ts2teBO5+lqi6Y=;
	b=HOFgPOknfk7WuF8oe/AwnSfb/sO0w6mE4SkE0nALvsTfyKF7sAzHMwVD83cJ2onuTJ/U
	 ahLcXD6MnhFxJk+KdN+v1S4vndLW24PuXaotjBAL4pOVVVtC0CgMZe1ne68ScQyW6mzQl
	 QNIp4r6jLNFCpyyY3vQc954I0Y1FzfU6Y0oofKqkHecVgOiWpAO9v2M6bg4jOwhJ3UBEO
	 d1g87bo+qSZ2jC4YBIyGj82rSmP5Lgb0mKiFK0NB6jX78eEwTFreIeZoj/6A5ik3GafTY
	 jHEFFSo10uZnA+1NIhj0yaD74QcrV4iqVUr73uud8kaS7j2oADLP4ESLaB6hRHEkJgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Ts1cgX5X;
	arc=none smtp.remote-ip=91.218.175.208
Received: from mta0.migadu.com (out-208.mta0.migadu.com [91.218.175.208])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA361606A31F
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 17:40:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA361606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Ts1cgX5X
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=kRLF/HRsqERTBPSJ8Ot+uxyMxQc9Tghc4vnCRz+O19U=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792950050; v=1; x=1793554850;
 b=Ts1cgX5X6ddWyNQriS86kNTRUCXh0OBNgQ3Ua0wxRXcUNcLWbb3fhAYJbvWBj3p7KsMH8XQ7
 NjSYuF8xHriVZ0CmhfvCilmB1a9ABLX1hR9GxwPeOZFFlBs1TKTPXAGG9M/h2gDQXCZMuiHlRxn
 niSEJhPBgqmqbPSwUUwGQcRc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 8008230ebac73f13;
	Sun, 25 Oct 2026 17:40:50 +0000
X-Mizu-Trace-ID: 8008230ebac73f13
X-Migadu-Flow: FLOW_OUT
From: "Nico Pache (Red Hat)" <nico.pache@linux.dev>
Date: Sun, 25 Oct 2026 11:39:47 -0600
Subject: [PATCH v2 2/2] mm/ksm: prevent zero-page remapping during
 ksmd-triggered THP splits
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261025-b4-ksm_fixv2-v2-2-8b61ad0491f1@linux.dev>
References: <20261025-b4-ksm_fixv2-v2-0-8b61ad0491f1@linux.dev>
In-Reply-To: <20261025-b4-ksm_fixv2-v2-0-8b61ad0491f1@linux.dev>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>, 
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
 Kiryl Shutsemau <kas@kernel.org>, Yu Zhao <yuzhao@google.com>, 
 Xu Xin <xu.xin@linux.dev>, Chengming Zhou <chengming.zhou@linux.dev>, 
 Matthew Brost <matthew.brost@intel.com>, 
 Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>, 
 Gregory Price <gourry@gourry.net>, 
 Ying Huang <ying.huang@linux.alibaba.com>, 
 Alistair Popple <apopple@nvidia.com>, Usama Arif <usamaarif642@gmail.com>, 
 aarcange@redhat.com, "Nico Pache (Red Hat)" <nico.pache@linux.dev>
X-Mailer: b4 0.17-dev

Since commit b1f202060afe ("mm: remap unused subpages to shared zeropage
when splitting isolated thp"), splitting an anonymous THP remaps all
zero-filled subpages to the shared zeropage via TTU_USE_SHARED_ZEROPAGE.
This flag is set unconditionally for every anonymous folio split,
including splits triggered by KSM.

When KSM is enabled with THP=always, this causes two regressions:

1. use_zero_pages=1: KSM calls try_to_merge_one_page() which triggers
   split_huge_page(). The split remaps all 512 zero-filled subpages to
   the shared zeropage at once, freeing the entire 2MB THP when KSM only
   intended to process a single 4KB page. This bypasses KSM's
   pages_to_scan rate limiting, causing ~1GB to be freed almost
   instantly.

2. use_zero_pages=0: The same split side-effect occurs through the
   stable/unstable tree merge paths. Each pages_to_scan iteration
   triggers an expensive split_huge_page() that silently frees 2MB,
   while the scanner wastes cycles on tree searches for zero-filled
   pages that were already freed as a side-effect.

Introduce current_is_ksmd(), which uses kthread_func() to check whether
the current task is the KSM scanning thread, and use it in
try_to_map_unused_to_zeropage() to skip zero-page remapping when the
split is triggered by ksmd.

Fixes: b1f202060afe ("mm: remap unused subpages to shared zeropage when splitting isolated thp")
Signed-off-by: Nico Pache (Red Hat) <nico.pache@linux.dev>
---
 include/linux/ksm.h | 6 ++++++
 mm/ksm.c            | 5 +++++
 mm/migrate.c        | 3 +++
 3 files changed, 14 insertions(+)

diff --git a/include/linux/ksm.h b/include/linux/ksm.h
index d39d0d5483a2..41c06a6abf60 100644
--- a/include/linux/ksm.h
+++ b/include/linux/ksm.h
@@ -17,6 +17,7 @@
 #ifdef CONFIG_KSM
 int ksm_madvise(struct vm_area_struct *vma, unsigned long start,
 		unsigned long end, int advice, vm_flags_t *vm_flags);
+bool current_is_ksmd(void);
 vma_flags_t ksm_vma_flags(struct mm_struct *mm, const struct file *file,
 			  vma_flags_t vma_flags);
 int ksm_enable_merge_any(struct mm_struct *mm);
@@ -144,6 +145,11 @@ static inline int ksm_madvise(struct vm_area_struct *vma, unsigned long start,
 	return 0;
 }
 
+static inline bool current_is_ksmd(void)
+{
+	return false;
+}
+
 static inline struct folio *ksm_might_need_to_copy(struct folio *folio,
 			struct vm_area_struct *vma, unsigned long addr)
 {
diff --git a/mm/ksm.c b/mm/ksm.c
index 910a1307ac9f..e3ab037b1ebe 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -2866,6 +2866,11 @@ static int ksm_scan_thread(void *nothing)
 	return 0;
 }
 
+bool current_is_ksmd(void)
+{
+	return kthread_func(current) == ksm_scan_thread;
+}
+
 static bool __ksm_should_add_vma(const struct file *file, vma_flags_t vma_flags)
 {
 	if (vma_flags_test(&vma_flags, VMA_MERGEABLE_BIT))
diff --git a/mm/migrate.c b/mm/migrate.c
index 7bdcdb57652f..c33ae3fa1043 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -305,6 +305,9 @@ static bool try_to_map_unused_to_zeropage(struct page_vma_mapped_walk *pvmw,
 	if (PageCompound(page) || PageHWPoison(page))
 		return false;
 
+	if (current_is_ksmd())
+		return false;
+
 	VM_BUG_ON_PAGE(!PageAnon(page), page);
 	VM_BUG_ON_PAGE(!PageLocked(page), page);
 	VM_BUG_ON_PAGE(pte_present(old_pte), page);

-- 
2.56.0

