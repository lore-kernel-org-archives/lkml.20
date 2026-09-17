Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4348A47C116
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789634286; cv=none; b=o5p8KHQQdOxz9ScHpxthGNNsLeysMpP1uC8Hw/82HdP0Z1+wzwEjz0xznO8fKzq9j89ofUMQmkqB74Nqh9JPMdlRg+hmTTK3OZQjRLW/lk0sVm2/Eld2Gb+xDEMpjDWLYQ1UMNEoSs+xAzVzHA6mtRswMD5aW0K5LAzdLMq5J3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789634286; c=relaxed/simple;
	bh=SpHy41LSroXkNRAgdbBYvB1SalYhcsSLiyQ953j2bQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M342ZuWE2le1CltSFeImPJn12EhT7ZVcIDNxWazIPA7oyT60S2H7ad5gs9VPGnLGsKBVa7sYTok4H03qxCEdH2k4l4ILBLfoXKdJi/zO5jagAjsL+p8+I61uloyp94YJ3Qc4BPcjhcglR/y9jlHwTmIbyc5yb96w68Z2pTGng2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qd+02hW2; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qd+02hW2"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1ceb47d53so88126a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 01:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789634273; x=1790239073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qjS555jszAWDoLRuNovKzuqNE3Rj5zKbnspdsPHPVgE=;
        b=qd+02hW2XrndVcIPzt+pE1uxhLLo7TzPbA6WIWwbBAVxz+9T2QrT6BmuvT1qRQl5Zg
         8SDta47CXkCYOmiuNAvvkbqPQSjU2DhOwOXEzoFZWB2BV4qLfMlcPcfHEH7MyK51TPV6
         A3Z8RJy9O2wesDQK/mMkuF40LEhmjwgl6U79qfxi6Yw0RwrNUGaXDehXrKNSOCn0hYfZ
         n3XD8k19pOzVgHrSDy0EXvpfukBD5Z8bD3wKtxUWnVzEvN6VJmfetYmveLhXO3MgVnXU
         8MROFxjXgeC9vOokXGLmudArpSTardn+Rbx0jGfyZ6Ho8bY2QW8wzIiMYkzo1gaC3r4D
         zVqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789634273; x=1790239073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qjS555jszAWDoLRuNovKzuqNE3Rj5zKbnspdsPHPVgE=;
        b=INWUhPRPs70Io/sHLZCk7GdV7nFHAbIBOi7lX7J8AK4XuYyE3PaLfxI4cgcurUSc/6
         ooMcSSpNmLMEnwbuawtPn59LBtIx6ohSYBrmYrmsG2OIJ9c+muTt3STneypkPyeJ2Ovz
         /lVpkw07BrNSmuI4EJ16P87NchI29UOZX5WWED/jpyo/8YddRPUUvpghPbpspknMuEE0
         Kf2le+8gNDfvYm3R7LhgcwrEBYibuz/uKGddFx5jYCzcOdDbEdnrET4RsoE96FePNr72
         TA6hkXd3np4yS49NSTjztfZ7x0i8plqza4zRPuoSY6lL44My6LqKpXHrfwFRKo7Hn/BC
         Szgg==
X-Forwarded-Encrypted: i=1; AKwUvBxU65UmYF/A2Cm0FZa847WOLYfOoltmvcolv6kIJrWD6zpq/cnNXn1oZk+X+fV0ACPjpN4Txr9Yp+4klBk=@vger.kernel.org
X-Gm-Message-State: AFuF++mBJ2XQmQ/PEMl9VlisW7M1kEqwpShOCWm+Dach6Sipv9+OM0F6
	wVza8ey/4oDMrvoD+KM6CDS7XMclabD6B4y+XHw5TRND96vvG958vKkQ
X-Gm-Gg: AYBFou37Q+ZprtVwe7ZeXt+hR2v3VFBJRx+hiVY3lretev7Gcgy7qIznXnxGHYBJKTH
	+bIVJtmLvp1j8yluVUfmJYFXQSiPYnyFHSru8yenWAaWlrNcHqKXwGf09tHO6z3VaHXJTCG/E6S
	EpZ1dbU1cmMmCfRHMJ7dpmnCmAbpBwMnJPll/WZhA+zZaESIX5l1djtl//i41vsmi0hlBpeJgLn
	PW8VoKTaBvTXq5XYr8REYQMXJKKp5Vq0RSQaRL6exS7PBVY5M0+24GFuLB+KsV/L/I7o1Ux2TkB
	hnsBYZXW86M0AoPlcM6nd7AnGS47MjpEZt22AfeWuR23Rd4irofcrK9dV4HVOMt2SPpk3kXp4bU
	iY1DTu1kY2vqR64g+izJr57ZW4hc67Df6maOb0eLSg0O0dLqHskNGXCERQkeoygzyJqIKTQnS7D
	yCHvWwW6NALIr2Oa99sdTlZZDum34UzXw1AyBc9huywjcvstBkuvyVdBhzmwCa1512TpufLc3CR
	FH+JtP1jxsBIn0+o++rAJUPdl8No1r72qzMMalssoogmhck9qUd3lq6bIlh1rkbAxnyhPMOYGRI
	+B4qZc0Gf2aoTSs6ADI8/D5T5w==
X-Received: by 2002:a17:90b:3dd0:b0:39e:28db:b950 with SMTP id 98e67ed59e1d1-39e361aa313mr3835618a91.16.1789634273012;
        Thu, 17 Sep 2026 01:37:53 -0700 (PDT)
Received: from DESKTOP-TJS95SS.tail460ce2.ts.net (36-232-230-153.dynamic-ip.hinet.net. [36.232.230.153])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e362e9402sm3846928a91.15.2026.09.17.01.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 01:37:52 -0700 (PDT)
From: Yuan-Hao Hsu <aa9736195201@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	liam@infradead.org,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Rik van Riel <riel@surriel.com>,
	Aristeu Rozanski <aris@ruivo.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mm/gup: batch PTE-mapped large folios in gup_fast_pte_range()
Date: Thu, 17 Sep 2026 16:37:47 +0800
Message-ID: <20260917083747.786-1-aa9736195201@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GUP-fast grabs a PTE-mapped large folio one page at a time.  Every PTE
costs a try_grab_folio_fast() (a refcount cmpxchg, plus the pincount
atomic, a full barrier and a node stat update for FOLL_PIN), a
gup_fast_folio_allowed() and a folio_set_referenced(), so a 64 kB mTHP
pays sixteen of each and a PTE-mapped 2 MB THP pays 512.  The PMD and
PUD leaf paths already take the whole range with one
try_grab_folio_fast() call, and the slow path is getting the same
treatment for PTEs in Rik's follow_page_mask() series.

The users are the hot ones: iov_iter_extract_user_pages() pins every
O_DIRECT buffer through pin_user_pages_fast(), io_uring registers its
buffers through it, and so does RDMA memory registration.  With mTHP
those buffers are PTE-mapped large folios.

After the head page has been grabbed and verified as before, extend the
run to the following PTEs that map the next pages of the same folio
with the same protection bits, take the remaining references for the
run with try_grab_folio(), and fill pages[] from the run.  The PTEs of
the run are read while the reference on the folio is held, so the folio
can neither be freed nor split underneath the scan; a THP collapse can
still detach the page table, so the pmd is checked again after the run
is grabbed and the run is dropped if it changed, leaving the next
iteration to hit the existing pmd check and bail out.  A read-only run
of an anonymous folio stops at the first page that gup_must_unshare()
rejects, so the per-page exclusivity guarantee for FOLL_PIN is kept.

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

Link: https://lore.kernel.org/r/20260811025157.1632867-1-riel@surriel.com/
Assisted-by: LLM sparse
Signed-off-by: Yuan-Hao Hsu <aa9736195201@gmail.com>
---
 mm/gup.c      | 76 +++++++++++++++++++++++++++++++++++++++++++++++++++
 mm/internal.h | 15 +++++++++-
 2 files changed, 90 insertions(+), 1 deletion(-)

diff --git a/mm/gup.c b/mm/gup.c
index eb898ea1ee22..1b4bbb525609 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2807,6 +2807,64 @@ static bool gup_fast_folio_allowed(struct folio *folio, unsigned int flags)
 }
 
 #ifdef CONFIG_ARCH_HAS_PTE_SPECIAL
+/*
+ * Extend the run of pages grabbed by gup_fast_pte_range() from @page, mapped
+ * by the PTE at @ptep, to the following PTEs that map the next pages of
+ * @folio with the same protection.  The caller holds one reference for @page
+ * and has verified @pte against the page table; this takes the references
+ * for the rest of the run and stores its pages in @pages.  Returns the
+ * number of pages in the run, including @page.
+ */
+static unsigned int gup_fast_pte_batch(struct folio *folio,
+		struct page *page, pmd_t pmd, pmd_t *pmdp, pte_t *ptep,
+		pte_t pte, unsigned int flags, unsigned int max_nr,
+		struct page **pages)
+{
+	unsigned int nr, i;
+
+	if (max_nr == 1)
+		return 1;
+
+	/*
+	 * The reference on @folio keeps folio_nr_pages() stable.  The PTEs
+	 * are read without the PTL, hence FPB_LOCKLESS.
+	 */
+	nr = folio_pte_batch_flags(folio, NULL, ptep, &pte, max_nr,
+				   FPB_RESPECT_WRITE | FPB_LOCKLESS);
+
+	/*
+	 * gup_must_unshare() is per page: a read-only run of an anonymous
+	 * folio ends at the first page that is not exclusive.
+	 */
+	if (!pte_write(pte)) {
+		for (i = 1; i < nr; i++) {
+			if (gup_must_unshare(NULL, flags, page + i))
+				break;
+		}
+		nr = i;
+	}
+	if (nr == 1)
+		return 1;
+
+	if (try_grab_folio(folio, nr - 1, flags))
+		return 1;
+
+	/*
+	 * The PTEs were read after the reference on @folio was taken, so the
+	 * pages cannot have been freed, but the page table could have been
+	 * detached by a THP collapse meanwhile, leaving stale PTEs.  Drop the
+	 * run and let the next iteration hit the pmd check and bail out.
+	 */
+	if (unlikely(pmd_val(pmd) != pmd_val(pmdp_get_lockless(pmdp)))) {
+		gup_put_folio(folio, nr - 1, flags);
+		return 1;
+	}
+
+	for (i = 1; i < nr; i++)
+		*pages++ = page + i;
+	return nr;
+}
+
 /*
  * GUP-fast relies on pte change detection to avoid concurrent pgtable
  * operations.
@@ -2830,6 +2888,8 @@ static int gup_fast_pte_range(pmd_t pmd, pmd_t *pmdp, unsigned long addr,
 		unsigned long end, unsigned int flags, struct page **pages,
 		int *nr)
 {
+	unsigned int nr_batch;
+	bool large;
 	int ret = 0;
 	pte_t *ptep, *ptem;
 
@@ -2891,9 +2951,25 @@ static int gup_fast_pte_range(pmd_t pmd, pmd_t *pmdp, unsigned long addr,
 			gup_put_folio(folio, 1, flags);
 			goto pte_unmap;
 		}
+		/*
+		 * Read the folio flags before the atomic in
+		 * folio_set_referenced(); a load right after it has to wait for
+		 * it, which is measurable on the order-0 path.
+		 */
+		large = folio_test_large(folio);
 		folio_set_referenced(folio);
 		pages[*nr] = page;
 		(*nr)++;
+
+		if (likely(!large))
+			continue;
+
+		nr_batch = gup_fast_pte_batch(folio, page, pmd, pmdp, ptep, pte,
+					      flags, (end - addr) >> PAGE_SHIFT,
+					      pages + *nr);
+		*nr += nr_batch - 1;
+		ptep += nr_batch - 1;
+		addr += (nr_batch - 1) * PAGE_SIZE;
 	} while (ptep++, addr += PAGE_SIZE, addr != end);
 
 	ret = 1;
diff --git a/mm/internal.h b/mm/internal.h
index 38b1165212c9..783754a81960 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -368,6 +368,12 @@ typedef int __bitwise fpb_t;
  */
 #define FPB_MERGE_YOUNG_DIRTY		((__force fpb_t)BIT(4))
 
+/*
+ * Read the page table entries with ptep_get_lockless(): the caller does not
+ * hold the page table lock (GUP-fast).
+ */
+#define FPB_LOCKLESS			((__force fpb_t)BIT(5))
+
 static inline pte_t __pte_batch_clear_ignored(pte_t pte, fpb_t flags)
 {
 	if (!(flags & FPB_RESPECT_DIRTY))
@@ -400,6 +406,10 @@ static inline pte_t __pte_batch_clear_ignored(pte_t pte, fpb_t flags)
  * must be limited by the caller so scanning cannot exceed a single VMA and
  * a single page table.
  *
+ * The caller must hold the page table lock, unless FPB_LOCKLESS is set: then
+ * the entries are read with ptep_get_lockless() and the caller has to make
+ * sure the folio cannot be freed or split, as GUP-fast does.
+ *
  * Depending on the FPB_MERGE_* flags, the pte stored at @ptentp will
  * be updated: it's crucial that a pointer to a COPY of the first
  * page table entry, obtained through ptep_get(), is provided as @ptentp.
@@ -436,7 +446,10 @@ static inline unsigned int folio_pte_batch_flags(struct folio *folio,
 	ptep = ptep + nr;
 
 	while (nr < max_nr) {
-		pte = ptep_get(ptep);
+		if (flags & FPB_LOCKLESS)
+			pte = ptep_get_lockless(ptep);
+		else
+			pte = ptep_get(ptep);
 
 		if (!pte_same(__pte_batch_clear_ignored(pte, flags), expected_pte))
 			break;

base-commit: 9b87fdc9af2fbfcdb5c24a64139685ef80f6573f
-- 
2.43.0

