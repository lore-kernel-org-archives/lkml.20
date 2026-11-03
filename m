Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793670496;
	b=ydGwaKu8k7aTOdhVjPBxQPPz4ZXFRUVlJ060rn0pU9qjksHbowceiqXls3b04dO9vvOb
	 Th+M/wAB30pxIBuOaIM8RqL3iF8ltV8za0PUfUZVg5XBJr2kdnM9z1EwrhqCELFK6JNTk
	 Qd6kzgJ3lg+/Npe59ahYZjCNOriszMvXtp8r0cg96WSXoQlrXkNKP2hoAsbfv4q2/QH6u
	 hhSndUCoHOPqLDVhUMBqHxHaG/7rt4waxtYDx8w1LmmSZbWIKR50mzmsUccGznawTfRn4
	 T9RrAcjbbz6owk+rIOkhIqzEmj1I5pTb4AKyYOTJEtj7cdCpEFuWcqCplswJn+bAYbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793670496;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=iOXPBKbXiJC+x5z9pBqWv33thiXEJKmUeXcLOFcLwdE=;
	b=y7pyxB6jH8U16M/7i5fM/wTes/uemFImjkq+SdRZEqbQDYa1Z2+2JTrxTflDjtyejjGT
	 /qzkrGdNnZ44jWYvBFIYavY9kOKIOoyyQkZ+jF2AEa1Iy4cgAYaPDR1pxoAfMP09J+uq4
	 gE7ksin3s1IKUxQRw6h+pihZZWWumbBctu4Duxo+l/BF0vC2h6qtaRBtOyj+GY8PmpfT+
	 CzgekIAsc5S27+9ZrAJCIJ9oGRd1KgSzHQJRUsB7xYTgi4NmFjbRss1Pwq7/F3/uo2kLA
	 dmoUb3BcEZ+EVekm7wxU8xsb12YjmLghRTgOBk7oO3Hr1GuabKUsCQXzRzCnBwh0ICQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lryRfQ1c;
	arc=none smtp.remote-ip=91.218.175.34
Received: from mta0.migadu.com (out-34.mta0.migadu.com [91.218.175.34])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E2F606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 01:48:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16E2F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lryRfQ1c
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=l+yyyXjUClB/Ds8IkW5xPsPcElS/TSAndXh2JoRAUFk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793670494; v=1; x=1794275294;
 b=lryRfQ1cZniTi2IU2YTeuq9gtwbw0Abxvq2msWE7Te+GNv5TjZF0qB/2K4JvM+d7N836iuS6
 3fO4KrLo0ZsKPsYjiDnQRI5IrR3g+3kKiekR4gHjpKTEfTi1Jnql25uwJ0dkPAbiQ8jST0N0o6T
 Iw2HNEJr0GW11tHRvoX5OHG4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 00fc5a5f33a423e9;
	Tue, 03 Nov 2026 01:48:14 +0000
X-Mizu-Trace-ID: 00fc5a5f33a423e9
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
Cc: Hui Zhu <zhuhui@kylinos.cn>
Subject: [PATCH v3] mm/memory: use pmdp_get_lockless() for the pmd read in do_fault_around()
Date: Tue,  3 Nov 2026 09:47:49 +0800
Message-ID: <20261103014749.96764-1-hui.zhu@linux.dev>
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

The load still has to be lockless-safe.  pmdp_get() is a plain READ_ONCE()
and can tear where pmd_t is wider than a word, as on i386-PAE where
pmd_install() publishes two words with a single cmpxchg8b.  Use
pmdp_get_lockless(), the accessor for pmd reads without the pmd lock and
what __pte_offset_map() already uses on this very pmd a few instructions
later.  It is pmdp_get() everywhere else, so the report is silenced the
same way.

No functional change on architectures that can load a pmd in one go.

Signed-off-by: Hui Zhu <zhuhui@kylinos.cn>
---
Changelog:
v3:
Shorten the comment to one line (David Hildenbrand).
v2:
Use pmdp_get_lockless() instead of pmdp_get() (David Hildenbrand).

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

