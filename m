Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.250
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793783476;
	b=KsW2akndPqLiKk3IvIW2mtXRFHip56TLCKdXpJUQdueDYUxJ8u2MpY/tU7iyoAucqgN9
	 jUg+3EmLbAlDqdz1fzZ29Bew4MeL+lhLPRmTJMH6Nw6NR9GplbmQiNVugyzldwjgO5O39
	 61xqEH69DA4GPQ8LuFmvPWpH6qTJ+lffWpgCD5hjPrGi3tGXNbJG31DQFQeIYoRkactIE
	 T9UZ7VYbot/lYG5dj9/RXt9nY0ibYm0z7XGSZJ9s4atbD54kP8U6Y5qdVs4BD7YsxfO+B
	 YHjyub83XzkbstmZ9L87DbC//JlDR0iWZCAxSYewnHwYYALL9hmw57tlP/mLc+iMUuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793783476;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=lym/yCSp9IOZ33mo2Zonha/3NwdJfu2J/obLEkGbH4w=;
	b=BM7fAlCksRmfz20IWQQX2AyQyu+dijjugqRE9epjQGxGPwtXE7HJK7dhW802Xlp3/gHz
	 TeHn9CgFtR/oTDUCUO6zMyUZBtpBL7hzUMWvozARIbZ7++XpowxpRw93SbVIr0b4XKc5d
	 AcDjMRr1IutkaJYibHg6k630C1SMUds1u+YwrBXdNlZnba/FbyxeeHM+INnAMlc1veNmh
	 wgPFFAmvairMGuo4Z5tfwRAs90r5ZXgbJS2B5M5V359Jk7bTIW1v/+T84dFg+pNL3rkn4
	 UNSQVzJU2grfDpqMg/dX1P1HSaeKwqbw2K0SsZ4wieDLMbuabH0ACqVYgtHGzbzNONQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hwR0yKeh;
	arc=none smtp.remote-ip=91.218.175.250
Received: from mta0.migadu.com (out-250.mta0.migadu.com [91.218.175.250])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB140606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:11:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB140606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hwR0yKeh
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=RMrOy4ebmI9IZjOcYQefm4hAy/GI4zVqN7pxA9iZQdI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793783473; v=1; x=1794388273;
 b=hwR0yKehZU9Hw34Jo5AZUuH5lenRNC1HVfHZx/oAUYWTufVnM2mjV2bPqZ6Jqm1Qpy/qQ+N3
 sNfXlGatBoPPXpYAdJR3kYlHurk5z4b1sVr4LEbfr+5GFMVpXxm2PSjUSEEc0zA1P68lIsDAq0e
 1Yfzfh4Ern1p95SqKbKuDVtI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 6253b911e0e229c8;
	Wed, 04 Nov 2026 09:11:12 +0000
X-Mizu-Trace-ID: 6253b911e0e229c8
X-Migadu-Flow: FLOW_OUT
From: Hui Zhu <hui.zhu@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: Hui Zhu <zhuhui@kylinos.cn>,
	stable+noautosel@kernel.org
Subject: [PATCH v4] mm/memory: use pmdp_get_lockless() for the pmd read in do_fault_around()
Date: Wed,  4 Nov 2026 17:10:50 +0800
Message-ID: <20261104091050.117076-1-hui.zhu@linux.dev>
X-Mailer: git-send-email 2.43.0
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

From: Hui Zhu <zhuhui@kylinos.cn>

KCSAN reports a data-race in do_read_fault / pmd_install; the same code
is in mainline:

  write (marked) to 0xffff8d52a75fb810 of 8 bytes by task 27487 on cpu 5:
   native_set_pmd arch/x86/include/asm/pgtable_64.h:83 [inline]
   pmd_populate arch/x86/include/asm/pgalloc.h:84 [inline]
   pmd_install+0xe0/0x120 mm/memory.c:444
   finish_fault+0x5bc/0xb00 mm/memory.c:5204
   do_cow_fault mm/memory.c:5432 [inline]
   do_fault+0x5d0/0x6e0 mm/memory.c:5526
   handle_mm_fault+0x211/0x4c0 mm/memory.c:6218
   __mm_populate+0x144/0x270 mm/gup.c:2207
   __do_sys_mlockall+0x2cd/0x380 mm/mlock.c:764

  read to 0xffff8d52a75fb810 of 8 bytes by task 27527 on cpu 9:
   do_fault_around mm/memory.c:5341 [inline]
   do_read_fault+0x162/0x670 mm/memory.c:5381
   do_fault+0x31a/0x6e0 mm/memory.c:5524
   handle_mm_fault+0x211/0x4c0 mm/memory.c:6218
   faultin_page_range+0x227/0x530 mm/gup.c:2156
   __x64_sys_madvise+0x67/0x80 mm/madvise.c:1479

  value changed: 0x0000000000000000 -> 0x000000001386c067

Both paths only hold mmap_lock for read, so do_fault_around() tests
vmf->pmd while pmd_install() populates it under the pmd lock.  The race is
benign: a stale pmd_none() only wastes the prealloc_pte, which do_fault()
frees again, and a pmd seen as populated only makes ->map_pages() find no
PTE and do_read_fault() fall back to __do_fault().

The load still has to be lockless-safe.  The store side already is: on
i386-PAE, pmd_install() publishes both halves of the pmd with a single
cmpxchg8b.  The load side is not.  pmdp_get() is a plain READ_ONCE() over
a pmd_t that is wider than a word there, so it becomes two 32-bit loads
and can return the low half of one pmd together with the high half of
another.  Use pmdp_get_lockless(), the accessor for pmd reads that do not
hold the pmd lock: it re-reads until both halves come from the same pmd.
It is also what __pte_offset_map() already uses on this very pmd a few
instructions later.

Only X86_32+X86_PAE and SH+X2TLB compile the retry loop, these being the
GUP_GET_PXX_LOW_HIGH selectors that have more than two page table levels.
mips32 with 64-bit physical addresses selects GUP_GET_PXX_LOW_HIGH too,
but is 2-level and so falls back to pmdp_get().  On every other
configuration, x86-64 included, pmdp_get_lockless() is pmdp_get(): the
pmd is loaded in one go, the READ_ONCE() silences the report the same
way, and there is no functional change.

Fixes: 7267ec008b5c ("mm: postpone page table allocation until we have page to map")
Cc: stable+noautosel@kernel.org # KCSAN annotation only, no functional change
Signed-off-by: Hui Zhu <zhuhui@kylinos.cn>
Acked-by: Lorenzo Stoakes <ljs@kernel.org>
---
Changelog:
v4:
Commit message only, the diff is identical to v3.  Spell out the affected
arches and add the lore links for v1-v3 (Lorenzo Stoakes).  Reword the
cmpxchg8b sentence: the store is already atomic, it is the load that tears.
Add the Fixes: tag (David Hildenbrand).
v3:
https://lore.kernel.org/all/20261103014749.96764-1-hui.zhu@linux.dev/
Shorten the comment to one line (David Hildenbrand).
v2:
https://lore.kernel.org/all/20261102093120.92654-1-hui.zhu@linux.dev/
Use pmdp_get_lockless() instead of pmdp_get() (David Hildenbrand).
v1:
https://lore.kernel.org/all/20261102031308.66177-1-hui.zhu@linux.dev/

 mm/memory.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mm/memory.c b/mm/memory.c
index 0fb676dd2bd63..f25c2ce0ef153 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -6017,7 +6017,8 @@ static vm_fault_t do_fault_around(struct vm_fault *vmf)
 	to_pte = min3(from_pte + nr_pages, (pgoff_t)PTRS_PER_PTE,
 		      pte_off + vma_pages(vmf->vma) - vma_off) - 1;
 
-	if (pmd_none(*vmf->pmd)) {
+	/* pmd_install() rechecks pmd_none() under the pmd lock. */
+	if (pmd_none(pmdp_get_lockless(vmf->pmd))) {
 		vmf->prealloc_pte = pte_alloc_one(vmf->vma->vm_mm);
 		if (!vmf->prealloc_pte)
 			return VM_FAULT_OOM;
-- 
2.43.0

