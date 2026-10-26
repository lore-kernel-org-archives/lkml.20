Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793019670;
	b=lpMyDYU2X6yGnwt9RSOjJR72hpWyMewpSzXve+jtts1lbCMMlgJ6uv0tl7DefBVqkRe+
	 5RnJd7qB4PG3Skly0IDWH6D6w499+Y2uSnEsSWgUAONWgikRB5iibFXJ+Yfb8eARMFfLS
	 dOMc+KDerABMCdRc60lKef0iAwZrMxmOsY4ZHsCTTZGAyOdJRypLWGYopeDPu+dgvMPIQ
	 2E0IAUAAVsqBcydBJUXKLZvseqyUjDzNQHQimoxapAGdgfxKxAaeHIV1rC+uBnvbbQbSN
	 SM07eHw8sxkppxEnVppX9NkMo5tnfnLfRPVyryn+q9EJJbgpMz14Fiqp5msauGzf8sA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793019670;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=mXgMFETLS+maZru+AaxXX7HtH++GszgJXY1ChWAfpak=;
	b=gee7TDceZGYpu2pRw3QjfdJWdIh/00rqTr4mxtIXG+PMiW9kRUiVexBor6GbdYXwfc3z
	 T+l751YRlFQLcdcrhsCmkqqf30aoYMdwXstDdzfEdMV4Z+Cowh2XCbfZcQ9zIAw497TSp
	 xFZwTOcVyhohvGtbkTwUvZN5mUEH7c3Tw2WM1XVd1gCB0YurZ5GYRFATcfroQsWh5NyD3
	 0NYwXXgix0ud93uWB27k0PJAcL9Aq/TOgAVZHDmEdQtYOa0/FIAJ1EaZuMFdOlM0QbEqc
	 UiEIULOauN8ECWz5tBMQJRwgPBbCgaGQpenr9nezh690xBLMLhzdMiMjzC+pftC3DNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=eOS7lClG;
	arc=none smtp.remote-ip=91.218.175.232
Received: from mta0.migadu.com (out-232.mta0.migadu.com [91.218.175.232])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40051606A324
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:01:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40051606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=eOS7lClG
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=B6SFPPfTE9xynzH7YlPHvBs9zmRqMXuyeuvm0EVIU4Y=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793019666; v=1; x=1793624466;
 b=eOS7lClGi/NgQp0DtV9ezX0Fjrcv+6UoB7uzRiTJeRH14SUuo4u4a9RC5pVgPSjcbTtW8SC6
 yUNkIsOLnD7KBu6erCpsdvH9d1JLKpJTHFkt+SHnavlqYfecG2mlwCMZj659jXq4LPBi6bYD1UF
 b3aveIxdgeuLmwvWytaWVTW0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f415b154d1059a70;
	Mon, 26 Oct 2026 13:01:06 +0000
X-Mizu-Trace-ID: f415b154d1059a70
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: akpm@linux-foundation.org
Cc: david@kernel.org,
	xu.xin@linux.dev,
	chengming.zhou@linux.dev,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	jglisse@redhat.com,
	aarcange@redhat.com,
	peterx@redhat.com,
	kas@kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	bobbypowers@gmail.com,
	bgeffon@google.com,
	dplotnikov@virtuozzo.com,
	dgilbert@redhat.com,
	hughd@google.com,
	hannes@cmpxchg.org,
	kirill@shutemov.name,
	cracauer@cons.org,
	mcfadden8@llnl.gov,
	gokhale2@llnl.gov,
	mgorman@suse.de,
	mike.kravetz@oracle.com,
	rppt@linux.vnet.ibm.com,
	xemul@openvz.org,
	riel@redhat.com,
	shli@fb.com,
	jthoughton@google.com,
	corbet@lwn.net,
	pbonzini@redhat.com,
	seanjc@google.com,
	sj@kernel.org,
	ziy@nvidia.com,
	stable@vger.kernel.org,
	samarth.colleges@gmail.com,
	med08elkadiri@gmail.com,
	Lance Yang <lance.yang@linux.dev>
Subject: [PATCH] mm/ksm: fix userfaultfd protection during merge and unmerge
Date: Mon, 26 Oct 2026 21:00:54 +0800
Message-ID: <20261026130054.91461-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
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

KSM loses userfaultfd protection when replace_page() builds a new PTE
from vma->vm_page_prot. Dropping its uffd bit lets a subsequent write go
through ordinary COW instead of userfaultfd write protection handling. For
RWP, a merged page also becomes readable without faulting.

Keeping the uffd bit and restoring PAGE_NONE fixes merging, but we also
have to handle unmerging. An existing KSM page can be protected with RWP
before MADV_UNMERGEABLE, so unmerging already needs fixing independently
of preserving RWP during merging.

Unsharing replaces a shared page with a private one and should leave
userfaultfd protection in place, as do_wp_page() already does for write
protection. Currently, an unshare fault reaches do_uffd_rwp() before it
can proceed to do_wp_page().

- With synchronous RWP, handle_userfault() returns VM_FAULT_SIGBUS.
  break_ksm() then reports success with a KSM page still merged.

- With asynchronous RWP, protection is cleared before unsharing.

Preserve the uffd bit when merging, and restore PAGE_NONE for RWP. Let
FAULT_FLAG_UNSHARE skip RWP fault handling and keep PAGE_NONE on each
private copy as well. Unsharing can then complete with RWP still armed
for a subsequent access.

Fixes: 63b2d4174c4a ("userfaultfd: wp: add the writeprotect API to userfaultfd ioctl")
Fixes: 2d427bb01639 ("mm/userfaultfd: add RWP fault delivery and expose UFFDIO_REGISTER_MODE_RWP")
Link: https://lore.kernel.org/all/20261019010934.697895-1-samarth.colleges@gmail.com/
Link: https://lore.kernel.org/all/20261020055518.36087-1-lance.yang@linux.dev/
Cc: stable@vger.kernel.org
Co-developed-by: Samarth Narang <samarth.colleges@gmail.com>
Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
Signed-off-by: Lance Yang <lance.yang@linux.dev>
---
 mm/ksm.c    |  8 +++++++-
 mm/memory.c | 14 ++++++++++----
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/mm/ksm.c b/mm/ksm.c
index 910a1307ac9f..d6f736a1aa2f 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -34,6 +34,7 @@
 #include <linux/memory.h>
 #include <linux/mmu_notifier.h>
 #include <linux/swap.h>
+#include <linux/userfaultfd_k.h>
 #include <linux/ksm.h>
 #include <linux/hashtable.h>
 #include <linux/freezer.h>
@@ -1463,9 +1464,14 @@ static int replace_page(struct vm_area_struct *vma, struct page *page,
 		dec_mm_counter(mm, MM_ANONPAGES);
 	}
 
-	/* Preserve soft-dirty when replacing the page. */
+	/* Preserve soft-dirty and uffd protection when replacing the page. */
 	if (pte_soft_dirty(orig_pte))
 		newpte = pte_mksoft_dirty(newpte);
+	if (pte_uffd(orig_pte)) {
+		newpte = pte_mkuffd(newpte);
+		if (userfaultfd_rwp(vma))
+			newpte = pte_modify(newpte, PAGE_NONE);
+	}
 
 	flush_cache_page(vma, addr, pte_pfn(ptep_get(ptep)));
 	/*
diff --git a/mm/memory.c b/mm/memory.c
index 6a93b7fa48b2..99439a7afa63 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4122,8 +4122,11 @@ static vm_fault_t wp_page_copy(struct vm_fault *vmf)
 		if (unlikely(unshare)) {
 			if (pte_soft_dirty(vmf->orig_pte))
 				entry = pte_mksoft_dirty(entry);
-			if (pte_uffd(vmf->orig_pte))
+			if (pte_uffd(vmf->orig_pte)) {
 				entry = pte_mkuffd(entry);
+				if (userfaultfd_rwp(vma))
+					entry = pte_modify(entry, PAGE_NONE);
+			}
 		} else {
 			entry = maybe_mkwrite(pte_mkdirty(entry), vma);
 		}
@@ -6659,9 +6662,12 @@ static vm_fault_t handle_pte_fault(struct vm_fault *vmf)
 		 * VM_UFFD_RWP VMA, a protnone PTE without the uffd bit is
 		 * NUMA hinting and must still fall through to do_numa_page().
 		 */
-		if (userfaultfd_pte_rwp(vmf->vma, vmf->orig_pte))
-			return do_uffd_rwp(vmf);
-		return do_numa_page(vmf);
+		if (userfaultfd_pte_rwp(vmf->vma, vmf->orig_pte)) {
+			if (!(vmf->flags & FAULT_FLAG_UNSHARE))
+				return do_uffd_rwp(vmf);
+		} else {
+			return do_numa_page(vmf);
+		}
 	}
 
 	spin_lock(vmf->ptl);
-- 
2.49.0

