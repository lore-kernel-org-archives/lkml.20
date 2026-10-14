Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97EB55C1CF
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791997914; cv=none; b=G4wMR+PK65tXB6Q2iYi/gtjlyxxrziaQNxFxK4LJ/eHE55f9ifItM9NXIDjX9T2de8FFsAD5ZIrlJcDfrqUxxlZAZv//rO5d14O4cQqEO2B/znN8MAkrOiYEjffHSPEi4X80BaI/83Imlmtat4YWMx/ypj8AKxRJmrkE57ggBb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791997914; c=relaxed/simple;
	bh=VS7Bc2m/Bpyt6OtrYDpYAueXtHf/+FlK62sJFKppWWU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OP39sWoUEpwq4jFuqgdox1UOjePO96x0YCQeCZjSUXrqCooEOfIvnx1Nqd1Il4alIEV7izGmhgUdyCE89JL3BPeq/+vzaOt9UqolqFFwKSsYRiLss1naFSZ9aE6SnkCqzLzl0GOcaewvYHdoR9kbFlFGIEb61PfH3k0pEgdF9/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dHwuKfrp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dHwuKfrp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 511471F000C5;
	Wed, 14 Oct 2026 17:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791997912;
	bh=cYVnl+WuPBGqmSWMF7L5g6cGQ+U45jyH0xmYaz2fq2E=;
	h=From:To:Cc:Subject:Date;
	b=dHwuKfrpBLX4GUyPTIZRUo3GK8DwHrWkQ/OOO56uHvmv4g6ZDD/cOjeQAPim1NR+Z
	 vDsInXoLUmfOkdwsd5tZ2ZzZtUGz8hQv/Y/dYIjrblrVDa0gFwzgKgMj9HJ+wqiuDt
	 SUrIxok+uwo6jQPESBb0hsRx9fq2GpAznf08ug0vXlobei69PVSCxcTi5uubQj0WPq
	 sg47mv295Sn9+Xkt09WTSgUhzmIxNJlFYBDs36jV8BNEauDjmI+EmZg3WRCAoSXSK3
	 wkYLu5OD2cQ7cNM3k+9/ce0ItZJKkVzzGRHyz16r7MaJM8FP8kMqXAof5Alz0y5Vhc
	 6qN9cOEpfsn+Q==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.ams.internal (Postfix) with ESMTP id 63AC2198003A;
	Wed, 14 Oct 2026 13:11:48 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Wed, 14 Oct 2026 13:11:49 -0400
X-ME-Sender: <xms:07fPalX9bx1iwMhYBItuX2_a79TpnF3pehzbCXM1VVLG1VITCJwrkw>
    <xme:07fPahj66a_iDsoVfGCYVzJOSXz76fr9Q9vKcqUzwImhaXKwQVIvSYYoebpDUpPwO
    Gb6wW5vHQRnJT4jEQXv8znKOLMB4z0I9aRIyLOuLaYAztlf5MklsXK9>
X-ME-Received: <xmr:07fPanioUj7To_PD5LhweDN5YmH_IKHd4-JBCEEOPqcw66ecnuYKISEyVwE>
X-ME-Proxy-Cause: dmFkZTEFDCtgkZgVN0BuhOIC3cFDouuVCHILOj7ycetC+2Hckd20+Qo/0At/C6BbrS95WH
    oltCu8118IR88gH/l1neOXfIkCc3dWZ1DeyAAL27FHwlIcJzHUe2F/xD0CJbYTTYohmNWE
    +9zc1xygTJ9l/3Q+eW2cV0JlECorSQRgEJNrQCftfqoaeqUyf6NFWsokBtueNC5y4YShX8
    2/BXNB9UHTFpzY6AhBQ3vHbSguBpahSVbsfkBlhtUlnqgHoUYgxDioAmRkF3Dgn6V22ZRs
    kGdNV8V7l3e51+WGY2ieVSGk2q7Zf08eobHdJxPEMIb9WwUG8HDDWp3RS7Be1HgX0dj8AQ
    vG5NlJQwTN8sfunSGKFN0Wh+MTRYOQk2z/0hoQBUSuUdEzSoKuJRrTqdGbCwzFGihvgWVV
    6H1es5/Q7brg/gDblkbOa70dNb354firbiWbb5f1g+3i30SSl3I7SGnkecvjaSjpfOKIWc
    vU208b+emGvHTOZgAZ6ty2bn2vVkrd25h7gpZPa3FXvo2vrWpK9DlEBGf+xzuQt4tnatOH
    PcgZ1qJOB7ZtxHFiSdLprg11sH/Aa4FrxE1u4rRCyWPZP7wQRXCj7tZ8X+0ITWoA8s1yt7
    MJtlIl/KMAC8mF3qj8AsE8keiBBvk4Xewa4R4vKrqUEkZr3MJCsNJp2ljkJw
X-ME-Proxy: <xmx:07fPautj000MFkjRgn0xU42n0tj3SgZV22pCepXOqSD_vMchAC7fvg>
    <xmx:07fPattfKgLSAIbag2iVsZY2vgp4NydmBnaHgJTEPrDHZvUJSQT5VA>
    <xmx:07fPavMtNuN_3KWiG7K9PF_SwpE_dQ0l4X1nPvA1Xs1eN6P4_NZtvQ>
    <xmx:07fPavcB_csy3HnODzMhFlkvS5PGXMQCHjSSRbjE8w3A1NuUAKaL8Q>
    <xmx:07fPamlXTI5mryGC2rbpq49SCmqeaaOW7eceJZcfDUADDtKkyvlI6a6o>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 14 Oct 2026 13:11:47 -0400 (EDT)
From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	"Liam R. Howlett" <liam@infradead.org>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>,
	Jann Horn <jannh@google.com>
Subject: [PATCH v5 0/9] mm/collapse: separate a collapse from its callers
Date: Wed, 14 Oct 2026 18:11:33 +0100
Message-ID: <20261014171145.3292736-1-kas@kernel.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no line between the collapse engine and the callers that ask for
a collapse.  khugepaged.c holds both, and they reach into each other.

 - Sixteen tests through the collapse path read cc->is_khugepaged to work
   out what they are allowed to do, when every one of those decisions was
   made by the caller before it asked.

 - collapse_single_pmd() does both halves of a collapse behind one call.
   Where it gives up mmap_lock between them is buried in the anonymous
   scan on one side and ahead of the file scan on the other.

Start drawing the line.  The caller states what it allows in a policy,
and the collapse code reads the policy instead of asking who called.  The
scan of a PTE table and the collapse that follows get a function each,
with the mmap_lock drop between them in one place.

Changes since v4
================

  https://lore.kernel.org/all/20260928100630.21870-1-kirill@shutemov.name/

 - Patches 10-13 dropped.

 - Patch 7: the changelog no longer mentions a release for the control,
   which v4 dropped.

 - Patch 9: collapse_scan_anon(), collapse_pmd() and collapse_anon()
   replace collapse_scan_anon_pmd(), collapse_run_pmd() and
   mthp_collapse() (David).  The scan_* fields in collapse_control are
   commented as anonymous-only and file-only (Zi).  Comments that named
   collapse_scan_pmd() for the anonymous scan follow the rename.

 - Acked-by from David Hildenbrand on 5 and 8; Reviewed-by from Zi Yan on
   5 and 8 and from Baolin Wang on 5; Tested-by from Baolin Wang on 5;
   Acked-by from Zi Yan on 9.

Patches
=======

The first three stand alone and can be taken separately:

  1  drop the mmgrab() MADV_COLLAPSE has held since 7d8faaf15545
  2  count collapses in khugepaged's own walk, where the daemon's
     bookkeeping belongs
  3  rename cc->mthp_present_ptes to eligible_ptes, which is what a set
     bit means

Then, in order:

  4  add collapse.h, and move enum scan_result, struct collapse_control
     and the two constants into it
  5  struct collapse_policy, filled by the caller; the is_khugepaged
     tests become field reads, and the flag goes
  6  drop collapse_possible(), a wrapper that only turns a mask into a bool
  7  collapse_control_init_scan() is a per-table reset, so name it
     collapse_scan_reset()
  8  call collapse_file() from collapse_single_pmd(), so the file scan
     stops at the decision
  9  give the scan and the collapse a function each: collapse_scan_pmd()
     and collapse_pmd(), joined by collapse_single_pmd()

Behaviour
=========

No functional change is intended.  Nothing here changes which tables get
collapsed, into what, or what MADV_COLLAPSE returns.  The tracepoints are
the one place a change can be seen from outside; the rest is where work
happens, not what it does.

 - Patches 8 and 9: mm_khugepaged_scan_file and mm_khugepaged_scan_pmd
   fire before the collapse rather than after it.  For an accepted table
   their status field reads SCAN_SUCCEED, where it used to carry what the
   collapse made of the table; that is now for mm_khugepaged_collapse_file
   and mm_collapse_huge_page to report.

Three things move that a reader should not have to find in the diff:

 - Patch 5: khugepaged fills its policy once per scan pass, so the
   max_ptes_* limits and the defrag setting behind the allocation mask are
   sampled once per pass rather than once per table.  A knob written
   mid-pass takes effect on the next pass instead of the next table.

 - Patch 8: the writeback retry re-runs collapse_file() alone, where it
   used to rescan the page cache first.

 - Patch 9: the file scan runs under mmap_lock, where before the lock was
   given up first.  A file table the scan refuses no longer costs
   khugepaged an unlock, a trip back through khugepaged_do_scan(), a
   relock and a VMA lookup; only a table it goes on to collapse does.

selftests/mm khugepaged passes on x86-64 with a KASAN, lockdep and
DEBUG_VM config, in the forms run_vmtests.sh runs it, with all:file on
ext4 rather than XFS.  Every patch builds, CONFIG_TRANSPARENT_HUGEPAGE=n
included.

Kiryl Shutsemau (Meta) (9):
  mm/khugepaged: drop redundant mm_struct pin in madvise_collapse()
  mm/khugepaged: count collapses where khugepaged makes them
  mm/khugepaged: rename mthp_present_ptes bitmap to eligible_ptes
  mm/collapse: add collapse.h for the collapse interface
  mm/collapse: state what a collapse may do in the policy
  mm/collapse: drop the collapse_possible() wrapper
  mm/collapse: name the per-table scan reset for what it resets
  mm/collapse: call collapse_file() from collapse_single_pmd()
  mm/collapse: separate scanning a PTE table from collapsing it

 MAINTAINERS     |   1 +
 mm/collapse.h   | 121 +++++++++++++
 mm/khugepaged.c | 468 ++++++++++++++++++++++++------------------------
 3 files changed, 355 insertions(+), 235 deletions(-)
 create mode 100644 mm/collapse.h

Range-diff against v4:

This compares the first 9 patches of v4 with this version.

 1:  73d87f3454b0 =  1:  73d87f3454b0 mm/khugepaged: drop redundant mm_struct pin in madvise_collapse()
 2:  095b43905bd6 =  2:  095b43905bd6 mm/khugepaged: count collapses where khugepaged makes them
 3:  66802b5676a3 =  3:  66802b5676a3 mm/khugepaged: rename mthp_present_ptes bitmap to eligible_ptes
 4:  22f00b9a706d =  4:  22f00b9a706d mm/collapse: add collapse.h for the collapse interface
 5:  4b9e43984bc9 !  5:  f712b2ab6635 mm/collapse: state what a collapse may do in the policy
    @@ Commit message
         cc unconditionally, so the check was already dead.
     
         Assisted-by: LLM
    +    Acked-by: David Hildenbrand (Arm) <david@kernel.org>
    +    Reviewed-by: Zi Yan <ziy@nvidia.com>
    +    Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
    +    Tested-by: Baolin Wang <baolin.wang@linux.alibaba.com>
         Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
     
      ## mm/collapse.h ##
 6:  9ae83d07f1e0 =  6:  6fa4e02993e3 mm/collapse: drop the collapse_possible() wrapper
 7:  bfdf63c56c7e !  7:  48ea4107ec7b mm/collapse: name the per-table scan reset for what it resets
    @@ Commit message
     
         Call it collapse_scan_reset().
     
    -    Preparation for giving a control a real init and release, run once each
    -    for a whole series of scans.  Two names a word apart would then stand for
    -    two different jobs.
    +    Preparation for giving a control a real init, run once for a whole series
    +    of scans.  Two names a word apart would then stand for two different jobs.
     
         No functional change.
     
 8:  9b8038917bc5 !  8:  7d5dfd5de145 mm/collapse: call collapse_file() from collapse_single_pmd()
    @@ Commit message
         run without it.  The file scan has to stop where the anonymous one will.
     
         Assisted-by: LLM
    +    Acked-by: David Hildenbrand (Arm) <david@kernel.org>
    +    Reviewed-by: Zi Yan <ziy@nvidia.com>
         Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
     
      ## mm/khugepaged.c ##
 9:  dd6d94fdad05 !  9:  6cccb8e88539 mm/collapse: separate scanning a PTE table from collapsing it
    @@ Commit message
     
         Give each half its own function:
     
    -      - collapse_scan_pmd() scans one table.  The anonymous scan that used to
    -        carry that name keeps its body as collapse_scan_anon_pmd(), and
    -        collapse_scan_pmd() is now the entry that picks the anonymous or the
    -        file side.
    +      - collapse_scan_pmd() scans one table.  It picks the side:
    +        collapse_scan_anon(), the anonymous scan that used to carry the
    +        collapse_scan_pmd() name, or collapse_scan_file().
     
    -      - collapse_run_pmd() does the collapse the scan asked for, and is
    -        handed what the scan returned.  SCAN_SUCCEED means there is
    -        something to collapse.  SCAN_PTE_MAPPED_HUGEPAGE means the page
    -        cache already holds the PMD folio and only the PTE table is left to
    -        retract.  Both are work for the run; anything else is why there is
    -        nothing to do.
    +      - collapse_pmd() does the collapse the scan asked for, and is handed
    +        what the scan returned.  SCAN_SUCCEED means there is something to
    +        collapse.  SCAN_PTE_MAPPED_HUGEPAGE means the page cache already
    +        holds the PMD folio and only the PTE table is left to retract.
    +        Anything else is why there is nothing to do.  It calls
    +        collapse_anon(), formerly mthp_collapse(), or collapse_file().
     
    -    collapse_single_pmd() is now the two of them with the mmap_lock drop in
    -    between, so its callers see what they saw before.  collapse_control_init()
    -    sets a control up before its first scan.
    +    For now collapse_single_pmd() stays, as the two of them with the
    +    mmap_lock drop in between, so its callers see what they saw before.
    +    collapse_control_init() sets a control up before its first scan.
     
    -    What the scan found and the run needs travels in collapse_control.  For
    -    an anonymous table that is the orders and the referenced and swapped-out
    -    counts, which mthp_collapse() and collapse_huge_page() now read from
    -    there instead of taking as arguments.  For a file it is the file itself
    -    and the offset in it: a file collapse works on the page cache and never
    -    sees a VMA, so the scan takes the reference while it still has one and
    -    the run gives it back.
    +    What the scan found and the collapse needs travels in collapse_control.
    +    For an anonymous table that is the orders and the referenced and
    +    swapped-out counts.  collapse_anon() and collapse_huge_page() now read
    +    them from there instead of taking them as arguments.
    +
    +    For a file it is the file itself and the offset in it.  A file collapse
    +    works on the page cache and never sees a VMA, so the scan takes the
    +    reference while it still has one and the collapse gives it back.
     
         The file scan moves under mmap_lock with the anonymous one, where before
         the lock was given up first.  The lock is now held over the page cache
    @@ Commit message
         only a table that goes on to be collapsed does.
     
         Assisted-by: LLM
    +    Acked-by: Zi Yan <ziy@nvidia.com>
         Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
     
      ## mm/collapse.h ##
    @@ mm/collapse.h: struct collapse_control {
      	DECLARE_BITMAP(eligible_ptes, MAX_PTRS_PER_PTE);
     +
     +	/*
    -+	 * What a scan found and the run after it needs.  Live only between the
    -+	 * two, and read by nobody else.
    -+	 *
    -+	 * The file side takes a reference while it still has the VMA, since a
    -+	 * file collapse works on the page cache and never sees one; the run is
    -+	 * what gives it back.
    ++	 * What a scan found and the collapse after it needs.  Live only between
    ++	 * the two, and read by nobody else.
     +	 */
    ++
    ++	/* Anonymous only: orders to try, referenced and swap PTE counts */
     +	unsigned long scan_orders;
     +	int scan_referenced;
     +	int scan_unmapped;
    ++
    ++	/*
    ++	 * File only.  A file collapse works on the page cache and never sees a
    ++	 * VMA, so the scan takes a reference to the file while it still has
    ++	 * one, and the collapse gives it back.
    ++	 */
     +	struct file *scan_file;
     +	pgoff_t scan_pgoff;
      };
    @@ mm/collapse.h: struct collapse_control {
      #endif	/* __MM_COLLAPSE_H */
     
      ## mm/khugepaged.c ##
    +@@ mm/khugepaged.c: static enum scan_result __collapse_huge_page_isolate(struct vm_area_struct *vma,
    + 			goto out;
    + 		}
    + 
    +-		/* See collapse_scan_pmd(). */
    ++		/* See collapse_scan_anon(). */
    + 		if (folio_maybe_mapped_shared(folio)) {
    + 			/*
    + 			 * TODO: Support shared pages without leading to further
    +@@ mm/khugepaged.c: static enum scan_result check_pmd_still_valid(struct mm_struct *mm,
    + 
    + /*
    +  * Bring missing pages in from swap, to complete THP collapse.
    +- * Only done if collapse_scan_pmd() believes it is worthwhile.
    ++ * Only done if collapse_scan_anon() believes it is worthwhile.
    +  *
    +  * For mTHP orders the function bails on the first swap entry, because
    +  * faulting pages back in during collapse could re-populate PTEs that
     @@ mm/khugepaged.c: static enum scan_result alloc_charge_folio(struct folio **foliop, struct mm_stru
       * while allocating a THP, as that could trigger direct reclaim/compaction.
       * Note that the VMA must be rechecked after grabbing the mmap_lock again.
    @@ mm/khugepaged.c: static enum scan_result collapse_huge_page(struct mm_struct *mm
      		if (result != SCAN_SUCCEED)
      			goto out_nolock;
      	}
    +@@ mm/khugepaged.c: static unsigned int max_order_from_offset(unsigned int offset)
    + }
    + 
    + /*
    +- * mthp_collapse() consumes the bitmap that is generated during
    +- * collapse_scan_pmd() to determine what regions and mTHP orders fit best.
    ++ * collapse_anon() consumes the bitmap that is generated during
    ++ * collapse_scan_anon() to determine what regions and mTHP orders fit best.
    +  *
    +  * Each bit in cc->eligible_ptes marks a PTE the scan accepted as a collapse
    +  * source. We start at the PMD order and check if it is eligible for collapse;
     @@ mm/khugepaged.c: static unsigned int max_order_from_offset(unsigned int offset)
       * If a collapse is permitted, we attempt to collapse the PTE range into a
       * mTHP.
    @@ mm/khugepaged.c: static unsigned int max_order_from_offset(unsigned int offset)
     -static enum scan_result mthp_collapse(struct mm_struct *mm,
     -		unsigned long address, int referenced, int unmapped,
     -		struct collapse_control *cc, unsigned long enabled_orders)
    -+static enum scan_result mthp_collapse(struct mm_struct *mm, unsigned long address,
    -+		struct collapse_control *cc)
    ++static enum scan_result collapse_anon(struct mm_struct *mm,
    ++		unsigned long address, struct collapse_control *cc)
      {
      	unsigned int nr_eligible_ptes, nr_ptes, max_ptes_none;
      	enum scan_result last_result = SCAN_FAIL;
    @@ mm/khugepaged.c: static enum scan_result mthp_collapse(struct mm_struct *mm,
     -static enum scan_result collapse_scan_pmd(struct mm_struct *mm,
     -		struct vm_area_struct *vma, unsigned long start_addr,
     -		bool *lock_dropped, struct collapse_control *cc)
    -+static enum scan_result collapse_scan_anon_pmd(struct vm_area_struct *vma,
    ++static enum scan_result collapse_scan_anon(struct vm_area_struct *vma,
     +		unsigned long start_addr, struct collapse_control *cc)
      {
      	const unsigned int max_ptes_shared = collapse_max_ptes_shared(cc, HPAGE_PMD_ORDER);
    @@ mm/khugepaged.c: static enum scan_result mthp_collapse(struct mm_struct *mm,
      	pmd_t *pmd;
      	pte_t *pte, *_pte, pteval;
      	int i;
    +@@ mm/khugepaged.c: static enum scan_result collapse_scan_pmd(struct mm_struct *mm,
    + 	/*
    + 	 * If PMD is the only enabled order, enforce max_ptes_none, otherwise
    + 	 * scan all pages to populate the bitmap for mTHP collapse. The bitmap
    +-	 * is then checked again in mthp_collapse() for each attempted order.
    ++	 * is then checked again in collapse_anon() for each attempted order.
    + 	 */
    + 	if (enabled_orders != BIT(HPAGE_PMD_ORDER))
    + 		max_ptes_none = COLLAPSE_MAX_PTES_LIMIT;
     @@ mm/khugepaged.c: static enum scan_result collapse_scan_pmd(struct mm_struct *mm,
      out_unmap:
      	pte_unmap_unlock(pte, ptl);
    @@ mm/khugepaged.c: static enum scan_result collapse_scan_file(struct mm_struct *mm
      
     -	mmap_assert_locked(mm);
     +	mmap_assert_locked(vma->vm_mm);
    -+	/* Whatever the last scan found has to have been run by now */
    ++	/* A scan that found work has to have been followed by collapse_pmd() */
     +	if (WARN_ON_ONCE(cc->scan_file)) {
     +		fput(cc->scan_file);
     +		cc->scan_file = NULL;
    @@ mm/khugepaged.c: static enum scan_result collapse_scan_file(struct mm_struct *mm
      
      	if (vma_is_anonymous(vma))
     -		return collapse_scan_pmd(mm, vma, addr, lock_dropped, cc);
    -+		return collapse_scan_anon_pmd(vma, addr, cc);
    ++		return collapse_scan_anon(vma, addr, cc);
      
     -	file = get_file(vma->vm_file);
      	pgoff = linear_page_index(vma, addr);
    @@ mm/khugepaged.c: static enum scan_result collapse_scan_file(struct mm_struct *mm
      	/*
      	 * SCAN_PTE_MAPPED_HUGEPAGE is work too: the page cache already holds
     -	 * the PMD folio, and only the PTE table is left to retract.
    -+	 * the PMD folio, and retracting the PTE table is the run's job.
    ++	 * the PMD folio, and collapse_pmd() still has to retract the PTE table.
      	 */
     -	result = collapse_scan_file(mm, addr, file, pgoff, cc);
     -	if (result != SCAN_SUCCEED)
    @@ mm/khugepaged.c: static enum scan_result collapse_scan_file(struct mm_struct *mm
     +	return result;
     +}
     +
    -+static enum scan_result collapse_run_pmd(struct mm_struct *mm,
    ++static enum scan_result collapse_pmd(struct mm_struct *mm,
     +		unsigned long addr, enum scan_result result,
     +		struct collapse_control *cc)
     +{
    @@ mm/khugepaged.c: static enum scan_result collapse_scan_file(struct mm_struct *mm
     +	pgoff_t pgoff;
     +
     +	if (!file)
    -+		return mthp_collapse(mm, addr, cc);
    ++		return collapse_anon(mm, addr, cc);
     +
     +	cc->scan_file = NULL;
     +	pgoff = cc->scan_pgoff;
    @@ mm/khugepaged.c: static enum scan_result collapse_single_pmd(unsigned long addr,
     +	mmap_read_unlock(mm);
     +	*lock_dropped = true;
     +
    -+	return collapse_run_pmd(mm, addr, result, cc);
    ++	return collapse_pmd(mm, addr, result, cc);
     +}
     +
      static void collapse_scan_mm_slot(unsigned int progress_max,
-- 
2.54.0

