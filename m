Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793619038;
	b=U+Mhyf6CiJEb+AZtzL4safTAk8fCW7oGvYbOjY15GkIRxV4PpBPy3m9iVWJt+JH6OhAj
	 fgSfqZyDps4jXJYIvN69t5PyDsAwzXhU6wUYKxMPzP4cOX2Jvr6P/A4LF7rcBR7yE00z1
	 o6mLXxvNEdP6EeZ+niIs8vdfPi0Kl7MrBx4ijeEKuLhbXCjCAMj0AtzzGldrUGWVHyb5m
	 TZchsJiw17Kq2MoKr52gFv8wHt0Y2Tg91xCk4Um7qUOfhnZKC1HLW5TneHLBH8LO0QAKn
	 RbKaVb/XMHmbVqQaGJl/VA6Hd8tk3KQS6YD3SDKVmj3lwVKr/8WJsMXy+F5QhgFoImQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793619038;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=kfBt7VegB4tPtF3aDF2xGVmaq4e8cZHrDQu6SY70Iyc=;
	b=f6Pl2xRK/Ka6qYstXyUcZCM1yQk9TM5x8r+nyDv2Rj1I6JoNMZY/kjZMI3nGZLqt4CYt
	 dye5FBPJQ2wyvgKDU3wFn3rij3QJjiBH+BWmxP67f41ZxEOPgMrpwn3qZCmq7Tg2xlz2Y
	 6AWuqSeK68ISoIpu8Wm2xGgSXPime7iGgc9g0cswsE+/TkSSMKc/69sNyVbDsjqdB74DQ
	 CfEbBjD5V49FE6N+fH03h3IrT5srs3YF8oA/9PuyYrE0Bmf24ekDMMDGvRduZi0+NoBAh
	 r6lhEv4XuhbpRj53aG4WU5KnI7WnAJOrNcixo5qK5e7JPpWF6E8Mgq/MGhqPiB806og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=COu7LGup;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6EAC60A381B
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:30:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6EAC60A381B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=COu7LGup
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 134A71691;
	Mon,  2 Nov 2026 03:30:34 -0800 (PST)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4752E3F632;
	Mon,  2 Nov 2026 03:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793619037; bh=HwhV8AKXzh2IqLPyqcNAxm1ImdqPtq8zihoD7af5bxk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=COu7LGup5ViKlHhc3bxi6DjIsFvy3kMLQHaT/Jiyam9PsLDnKZRsuOpW8N0HU7TDS
	 aYi6zvYzU0a9NMzxYbUgeAxQf9SG0hS/qaHLmNjt32ZrkI6TZqbI7iJfrKXb0Atttr
	 k6Z+b+vUG7rK/28SwaGHaJ45YoVGgzCMTKY+a3VU=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Mon, 02 Nov 2026 11:30:19 +0000
Subject: [PATCH v2 4/4] mm: gup: batch PTE-mapped large folios in
 gup_fast_pte_range()
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
Message-Id: <20261102-refactor_gup_fast-v2-4-bc1ac018c834@arm.com>
References: <20261102-refactor_gup_fast-v2-0-bc1ac018c834@arm.com>
In-Reply-To: <20261102-refactor_gup_fast-v2-0-bc1ac018c834@arm.com>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, 
 Peter Xu <peterx@redhat.com>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Rik van Riel <riel@surriel.com>, 
 Yuan-Hao Hsu <aa9736195201@gmail.com>, Yeoreum Yun <yeoreum.yun@arm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5969; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=HwhV8AKXzh2IqLPyqcNAxm1ImdqPtq8zihoD7af5bxk=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBq6HRSkyBgpfjrwbkgXjt7GwMRErEE2JyyT1SX3
 IWwNm/z/a+JAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCauh0UgAKCRBt1cPRWsUx
 M9GiC/9Q/g5vw/EFwaCW7oylk1YUQONETkxPRgb3R65xWYBUJgWSi6jzlOjGzUSOoj0zHD0K4Lt
 pJ2BVoxwO6zSrEL+fbd9OCT20BhtrX9gYf2+44sKzSL60W/EtXNH/qnxlQ+aqO68BRCcjFGU8wa
 bqYs5AdrT12pxMtiZG00yaeLHQUbR0M/2LuIzfnIIvKieBO6rbCLAjuP0w/+2DhlS3/D6FWGUho
 z1xofwt7YCQ+kllpFjhK8VHzPEAi7Aioh9Z6HH2cUlmCts4IAfvlp1jQO2FQndYl4WnPFP2GMau
 1Wk8tXNtKg1YoXpl1HP0h109dLQxTM4PFLVOndF/vPEaWj7FaJLq2tFUD6tr3q4VefWsaWmgv6E
 L7eaRSIa5xZAsvZmaQfJUjZSzOPilESlZzoDmyOOvswW3y8AdcHQOPk26z8dodPcnbxZBxdgF4b
 GRvkneFh+4Bqd4y26R5kBuN0glVsw+ftlKB50GuZOl8Tw28qWlvTkZ+9vh6fxaLzcyjY8=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133

GUP-fast grabs a PTE-mapped large folio one page at a time.  Every PTE
costs a try_grab_folio_fast() (a refcount cmpxchg, plus the pincount
atomic, a full barrier and a node stat update for FOLL_PIN), a
gup_fast_folio_allowed() and a folio_set_referenced(), so a 64 kB mTHP
pays sixteen of each and a PTE-mapped 2 MB THP pays 512.

The users are the hot ones: iov_iter_extract_user_pages() pins every
O_DIRECT buffer through pin_user_pages_fast(), io_uring registers its
buffers through it, and so does RDMA memory registration.
With mTHP those buffers are PTE-mapped large folios.

After the head page has been grabbed and verified as before, extend the
run to the following PTEs that map the next pages of the same folio
with the same protection bits, take the remaining references for the
run with try_grab_folio(), and fill pages[] from the run.
The PTEs of the run are read while the reference on the folio is held,
so the folio can neither be collapsed, freed nor split underneath the scan.
A read-only run of an anonymous folio stops at the first page
that gup_must_unshare() rejects, so the per-page exclusivity guarantee for
FOLL_PIN is kept.

folio_pte_batch_flags() does the scan.  It reads the entries with
ptep_get(), which is not safe without the page table lock on
CONFIG_GUP_GET_PXX_LOW_HIGH (x86 PAE, mips32, sh) or with arm64 contpte,
and GUP-fast reads every PTE with ptep_get_lockless() for that reason.
Add FPB_LOCKLESS to make the helper do the same; it is inlined per call
site, so the other callers do not change.

The order-0 path keeps its instruction sequence.  The folio flags are
tested before folio_set_referenced() on purpose: a load of the flags
right after that locked instruction cost about 25% on order-0 pages in
the gup_test benchmark below, and reading them first brings that path
back to the baseline.

gup_test ioctl over a 256 MB anonymous region, FOLL_WRITE, 65536 pages
per call, median of 15 runs, two baseline boots / one patched boot, on
an x86-64 VM:

                       get_user_pages_fast()   pin_user_pages_fast()
                       before       after      before       after
  4 kB pages           849/789 us   783 us     1174/1138 us 1094 us
  64 kB mTHP           812/811 us   126 us     1215/1113 us  188 us
  1 MB mTHP            799/774 us    59 us     1185/1077 us   64 us
  2 MB THP, PTE-mapped 803/786 us    57 us     1159/1120 us   58 us
  2 MB THP, PMD-mapped  42/40 us     40 us       46/41 us     42 us

fio O_DIRECT randread of a null_blk device (CPU bound) with the I/O
buffer in 64 kB mTHP, median of 15 five-second runs:

  bs=1M psync                 126.2/125.6 GB/s  ->  220.6 GB/s
  bs=1M io_uring, iodepth 16   71.2/71.6 GB/s   ->  112.1 GB/s
  bs=64k io_uring, iodepth 16  50.2/50.7 GB/s   ->   60.1 GB/s

IORING_REGISTER_BUFFERS of 1 GB, median of 15:

  64 kB mTHP           6179/5998 us  ->  1599 us
  1 MB mTHP            5790/5801 us  ->   893 us
  4 kB pages           7173/6741 us  ->  6763 us

Signed-off-by: Yuan-Hao Hsu <aa9736195201@gmail.com>
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 mm/gup.c | 46 +++++++++++++++++++++++++++++-----------------
 1 file changed, 29 insertions(+), 17 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 49681f63950ec..94a9dc45e5953 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2901,7 +2901,8 @@ static unsigned long gup_fast_pte_range(pmd_t pmd, pmd_t *pmdp,
 		unsigned long addr, unsigned long end,
 		unsigned int flags, struct page **pages)
 {
-	unsigned long nr_pages = 0;
+	unsigned long nr_pages = 0, nr_batch;
+	struct folio *folio = NULL;
 	pte_t *ptep, *ptem;
 
 	ptem = ptep = pte_offset_map(&pmd, addr);
@@ -2910,7 +2911,9 @@ static unsigned long gup_fast_pte_range(pmd_t pmd, pmd_t *pmdp,
 	do {
 		pte_t pte = ptep_get_lockless(ptep);
 		struct page *page;
-		struct folio *folio;
+		unsigned long i;
+
+		nr_batch = 1;
 
 		/*
 		 * Always fallback to ordinary GUP on PROT_NONE-mapped pages:
@@ -2937,19 +2940,21 @@ static unsigned long gup_fast_pte_range(pmd_t pmd, pmd_t *pmdp,
 			goto pte_unmap;
 
 		if (unlikely(pmd_val(pmd) != pmd_val(pmdp_get_lockless(pmdp))) ||
-		    unlikely(pte_val(pte) != pte_val(ptep_get_lockless(ptep)))) {
-			gup_put_folio(folio, 1, flags);
+		    unlikely(pte_val(pte) != pte_val(ptep_get_lockless(ptep))))
 			goto pte_unmap;
-		}
 
-		if (!gup_fast_folio_allowed(folio, flags)) {
-			gup_put_folio(folio, 1, flags);
+		if (!gup_fast_folio_allowed(folio, flags))
 			goto pte_unmap;
-		}
 
-		if (!pte_write(pte) && gup_must_unshare(NULL, flags, folio, page)) {
-			gup_put_folio(folio, 1, flags);
-			goto pte_unmap;
+		if (folio_test_large(folio))
+			nr_batch = folio_pte_batch_flags(folio, NULL, ptep, &pte,
+							 (end - addr) >> PAGE_SHIFT,
+							 FPB_LOCKLESS | FPB_RESPECT_WRITE);
+
+		if (!pte_write(pte)) {
+			nr_batch = gup_unshared_pages(NULL, flags, folio, page, nr_batch);
+			if (nr_batch == 0)
+				goto pte_unmap;
 		}
 
 		/*
@@ -2958,16 +2963,23 @@ static unsigned long gup_fast_pte_range(pmd_t pmd, pmd_t *pmdp,
 		 * see Documentation/core-api/pin_user_pages.rst for
 		 * details.
 		 */
-		if ((flags & FOLL_PIN) && arch_make_folio_accessible(folio)) {
-			gup_put_folio(folio, 1, flags);
+		if ((flags & FOLL_PIN) && arch_make_folio_accessible(folio))
 			goto pte_unmap;
-		}
+
+		if (nr_batch > 1 && try_grab_folio(folio, nr_batch - 1, flags))
+			nr_batch = 1;
+
 		folio_set_referenced(folio);
-		pages[nr_pages] = page;
-		nr_pages++;
-	} while (ptep++, addr += PAGE_SIZE, addr != end);
+		for (i = 0; i < nr_batch; i++) {
+			pages[nr_pages + i] = page + i;
+		}
+		nr_pages += nr_batch;
+		folio = NULL;
+	} while (ptep += nr_batch, addr += nr_batch * PAGE_SIZE, addr != end);
 
 pte_unmap:
+	if (folio)
+		gup_put_folio(folio, 1, flags);
 	pte_unmap(ptem);
 	return nr_pages;
 }

-- 
2.43.0

