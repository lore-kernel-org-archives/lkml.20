Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793589208;
	b=R0D/qYNJYCdx3uavV7cCin4Dzplwq825YDRoy2bqWGEL9A0+C92u/UVWZtwSCfJ897Ru
	 M6FSWp/etDKyZ5r3FpNo+gCZ9JznHdVQWiGoNnbE3Gd3CdXAsLJRsDywBWeKjsi/U8Arm
	 wI/ltSUj9OIRgtLl1n3lgeTcFHLNuboU/oRRGMSy6e6fIlZ36d9omFwdeCA1Gxwk0DSdx
	 S+rASEsPopj5IL/R2popUylv4ClrMxhZJlpK5apelYc1aqlMtAe2rrQlXEPmMNkCeUdna
	 D0LhQl7lQaA48db5KpZp3GgmT/BvxJv/ADy8ZSNciClfES5k7Iov9mIq0CSsovLQc3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793589208;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=al/lX1HsGZpqnSf5dEL9WzmdDUFnJTHtJ4tDgI6XiAw=;
	b=qm3fSH7/qu6yL8fxIBaDoaQv7kgic9c32eRmryMSp4uTmrltVhI7WzzSXb+rNS2AVZBD
	 oIOMK8FQBnwPo92f2v9sTFRzSNF+bq2WA18cPKT4PY60TtOfMR1y3bqjb94yNzVhUsndR
	 jM7i7zAgO5xc72S2d6u8Ok99CKNDUmZfd9/BJkxrArEmKR0MH+cYjgl3wR0e1o1G36nrh
	 GLRNqJttNdozC1zd6UgPcMSN9L9kXlFKjmoxKjEIj6hGFye8EsOy2n2jFqOPyBmwkUKXr
	 F537laluXedNf/WZi2IRO0Uetc8D5ShHHFSZ2DqpI5RCOzbWktC/Cf9f3RaWXYNSj4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=aKlGuZgd;
	arc=none smtp.remote-ip=91.218.175.78
Received: from mta0.migadu.com (out-78.mta0.migadu.com [91.218.175.78])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48A1606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 03:13:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E48A1606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=aKlGuZgd
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=gI138F4HwUMp7+lGbqtpS276hdQB5c5uMx5zyKs0VvE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793589205; v=1; x=1794194005;
 b=aKlGuZgdM/4/9jd2QnFcTuKCJ200kJgJKdLDk+jg3vFVN2GVyRom+j2ybn1FQkp2GgbR8Gv0
 m2vgepgxf3BUZjBnzMIIpFSNl99BPSO3xfvsWBbrjmefJsPpIcVwYAlalC1H5AHQdqf5ViPdfx1
 vk/qps6DfxpuqHFpv1MPgL6c=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 24d48d207150a1f1;
	Mon, 02 Nov 2026 03:13:25 +0000
X-Mizu-Trace-ID: 24d48d207150a1f1
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
Subject: [PATCH] mm/memory: use pmdp_get() for the lockless pmd read in do_fault_around()
Date: Mon,  2 Nov 2026 11:13:08 +0800
Message-ID: <20261102031308.66177-1-hui.zhu@linux.dev>
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

do_fault_around() reads vmf->pmd without the pmd lock to decide whether
->map_pages() needs a preallocated PTE page, while pmd_install() publishes
the entry with WRITE_ONCE() under the pmd lock.  Both paths above only hold
mmap_lock for read, so they can fault into the same VMA concurrently.

The race is benign.  The pmd is a naturally aligned 8 byte object, the
store is a single WRITE_ONCE() and pmd_none() only tests the low word, so
no torn value is possible.  A stale none pmd only allocates an extra
prealloc_pte, which pmd_install() leaves unused because it rechecks
pmd_none() under the pmd lock, and do_fault() frees it on the error path.
A pmd already seen as populated makes ->map_pages() find no PTE, and
do_read_fault() then falls back to __do_fault() and finish_fault(), which
allocate the page table properly.

Read the entry with pmdp_get() so that the load becomes a READ_ONCE()
pairing with the WRITE_ONCE() in pmd_install().

No functional change intended.

Signed-off-by: Hui Zhu <zhuhui@kylinos.cn>
---
 mm/memory.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/mm/memory.c b/mm/memory.c
index 0fb676dd2bd63..90afbd124d503 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -6017,7 +6017,11 @@ static vm_fault_t do_fault_around(struct vm_fault *vmf)
 	to_pte = min3(from_pte + nr_pages, (pgoff_t)PTRS_PER_PTE,
 		      pte_off + vma_pages(vmf->vma) - vma_off) - 1;
 
-	if (pmd_none(*vmf->pmd)) {
+	/*
+	 * Lockless hint: pmd_install() may populate this pmd concurrently and
+	 * rechecks it under the pmd lock, so a stale value is harmless.
+	 */
+	if (pmd_none(pmdp_get(vmf->pmd))) {
 		vmf->prealloc_pte = pte_alloc_one(vmf->vma->vm_mm);
 		if (!vmf->prealloc_pte)
 			return VM_FAULT_OOM;
-- 
2.43.0

