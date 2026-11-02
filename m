Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793611900;
	b=paDeOf+BGISlSt2QX65C/Bs4Joxshfryg8NO685QhonEx5N8z9oUHkNAwPOhfokpE9Hy
	 0YKufTEbd4JhLkAChlbPVEw/lgCxY7KomtY0rhD/bfoxK7cSoQj3Zdl2fx27feKO4WKIo
	 xztdufg6TNaYbQNFggNi6pM53ujCpqBfBg+Gc5R6ZwOvCpiMRXCcNOd2Wa51w+l/d2szx
	 /D74tNNjvbjLfu0cpJCWsyFE1cdjDyOy33M5S8wc0Du3TTjGL6DyGZoxWAmhdkB4+qC77
	 GyfcK+HoaxdKtwF7tEbMeS2Q60eE5kGe2aWdIVnqUSLdyKR7UY6AI01C/cJZbAK84mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793611900;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=dGC7LEFGpEc2S3IQxReMLZO2J56SfyOh1sglqK/O04s=;
	b=g4WXtczki/7Niq7HI9mEZFzgaMY19j4qdnKt9oUiD8O8rLYNxzLQdJU1gZeC9PPPHMNP
	 bGJk9BcDX6zBV6IXJqAu9OefhZymJ5nEAihYved0KYEf8BUV8Qe6ZB5NVG3Ju5jublfUu
	 eLhNQIDhwtFif16ivAluyZW+zX9ZUrBNWTpAGYZEx4Uxpuloazm8fqURZ875IH4t2U9Fy
	 st3l9Ut0VVna0+1tDoww+zsJl9T16mbzJzFcRFsuJjTR75hxoBQUeyhhyfnb8l1/FPOqU
	 SvkIsgHkRThTb8aGFBGjuD0Mh3s6YtjsLENdLBspcB+AX6b3ntZ0XscoCp8D0656opg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=bvpJK1r9;
	arc=none smtp.remote-ip=95.215.58.52
Received: from mta1.migadu.com (out-52.mta1.migadu.com [95.215.58.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64322606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:31:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64322606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=bvpJK1r9
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=cNNx1gyu5XHbiuYT2LFKcpZRDps0KmZGZTeNkOGSr0Q=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793611896; v=1; x=1794216696;
 b=bvpJK1r9142iO+BPxC6LcvdUI1c5Hp2Wsn9W/mhA0mIkWaX4myyCdDicK08qtbN21NfI6wKI
 Y7DGpBJ43vpRUEVW8+M0NTtZEqkgT6X0qwfS5/72xZOxT0IJrnctyh5myE5ndUuB2/2qpYKxzxi
 3MT0hrMUIVek7DonGQjeAkBA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 8837f745f0425be8;
	Mon, 02 Nov 2026 09:31:36 +0000
X-Mizu-Trace-ID: 8837f745f0425be8
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
Subject: [PATCH v2] mm/memory: use pmdp_get_lockless() for the pmd read in do_fault_around()
Date: Mon,  2 Nov 2026 17:31:20 +0800
Message-ID: <20261102093120.92654-1-hui.zhu@linux.dev>
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
Use pmdp_get_lockless() instead of pmdp_get() (David Hildenbrand).

 mm/memory.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/mm/memory.c b/mm/memory.c
index 0fb676dd2bd63..2c1e50b70faeb 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -6017,7 +6017,11 @@ static vm_fault_t do_fault_around(struct vm_fault *vmf)
 	to_pte = min3(from_pte + nr_pages, (pgoff_t)PTRS_PER_PTE,
 		      pte_off + vma_pages(vmf->vma) - vma_off) - 1;
 
-	if (pmd_none(*vmf->pmd)) {
+	/*
+	 * Lockless: pmd_install() rechecks under the pmd lock, so a stale
+	 * pmd_none() here only wastes the prealloc_pte allocated below.
+	 */
+	if (pmd_none(pmdp_get_lockless(vmf->pmd))) {
 		vmf->prealloc_pte = pte_alloc_one(vmf->vma->vm_mm);
 		if (!vmf->prealloc_pte)
 			return VM_FAULT_OOM;
-- 
2.43.0

