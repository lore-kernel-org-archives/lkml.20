Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7EA547056
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 21:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790718794; cv=none; b=oenfM07fxBBW0EvRAu6YuRkszLPGrb735gehhdaHRlTSWGTwVD7PiETjInDHy3bksRt/DgBq/JoBh4DhhNOgcMmpfWvHORQIENR7ONKZbSDaps62w69Q8I1vAqoqNNtrpUZ7XlD76lOx3zSe7fcLo8BlvXUwnIzJ/4zQctcb7Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790718794; c=relaxed/simple;
	bh=JPHOtLX5J/CfXdFkUMD/4UI3dnjhvmipFBQMpiGm5g8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=hRWeEFGCNVdREc2H3aIKujUNglqvIQ3lrSZ/VMjBqU4cmhMfbnQUfvsDUWPmDZpWaL/4wxz7ipBYM6THf7K4DtiHap31p/7wlp6S1Cy1a9dFnvNBzIDIegwCZDyQZL6QeFpziPT/XiZ/OpRixAE90cM0qmOWMOSPoxF08FD7MXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--nilayvaish.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ObU5dgIk; arc=none smtp.client-ip=74.125.82.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--nilayvaish.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ObU5dgIk"
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1383723dfddso3790898c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 14:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790718791; x=1791323591; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CyTriPACuulD8PSeUOBZRvdda3vwGDvZO2NnK49TgBc=;
        b=ObU5dgIkFKxdDs/DHHz3Lg8FyyhYFN5v3QecgCW42RtpwfdT5B/KIAFd2l6hBmHU8U
         YAs6cQI4ogXneya+Sem279L3nGM2TAIe9FUB+OT7EVA4bzw3qHDtyCc6urvyXZfyGIqY
         ZPPu21bcnIEjn4EjVUh8j4XSuFzh+1uPCkfYtUXlfH5XWsr9KAbe71gkofrmoCDd+XSA
         4+obKj6R/VyJQ4gn9mvjm0xqEOUXL6sVjqdxsSJgzeKxvKOiFIPs68WYdP9Xr0Y0OkNM
         /ByChW5F5nNGsLVtiZ7dGBgNsA4w/x8NrtkZuAYkVGtOCbeal7fjkoXQJF5KP+ZBvphr
         QZKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790718791; x=1791323591;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CyTriPACuulD8PSeUOBZRvdda3vwGDvZO2NnK49TgBc=;
        b=ZKkj8PAZFyZuGsL3YHHK5/6nos7e3abVqUtHtJnf07yUlHn66Dv0bqNbqR5rs+8DD4
         otEDmo6226QbmK1o1PeZNmccxEOf3HWt0jqZB62GWJQoHDx6b8QN5B/ioq0qSyXEEodD
         gvR/mvzIVD3wiGdb0fWLELr+8xqb2GEsFh3MUqim7AIN3RvQ85nkd7ADi7Z3BZL8Gn9P
         UgkwSWIabSHT6C0Nj7EWTiSONn6zy/cb0mc4fC6jRLUSCCF46bFaYGEL8zvVYrH1i/Jv
         Xd4XgZi7Eqe3M/HTbH4fUjLt1qSi13pRcP3GuN6aE/E+Ik1A3kwvmUWNANWgdBQkiPO2
         h70Q==
X-Forwarded-Encrypted: i=1; AKwUvBxmLoAV9sOv62wNw9Uh0erDYtYgSQi9VmlIjE15DsyGnWDXxyTAhX6TyVcHc8p4cPtyGmwKLAAb1tU4bDg=@vger.kernel.org
X-Gm-Message-State: AFuF++mTTfANF7kN7hbGjp1RDD1MfJ2+Na6Z3Bj/k7zUH/FUW/cbeKQP
	M6bZYJBpl/DqBJRRUxpsEc4iVxvdqbzSFuiTlRG9NzZEOHhvG+W6J+ADSQavmPjvo2FQIg253Gv
	wh8wJhi4dOz8Z8BZ+mbTLOA==
X-Received: from dlbuu7.prod.google.com ([2002:a05:7022:7e87:b0:13f:c1b7:470])
 (user=nilayvaish job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:b889:b0:14a:c6cf:1449 with SMTP id a92af1059eb24-14c9dccf066mr568034c88.32.1790718791005;
 Tue, 29 Sep 2026 14:53:11 -0700 (PDT)
Date: Tue, 29 Sep 2026 14:51:51 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260929215206.516490-1-nilayvaish@google.com>
Subject: [PATCH 00/15] mm: eliminate &folio->page references in mm/
From: Nilay Vaish <nilayvaish@google.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Matthew Wilcox <willy@infradead.org>, David Hildenbrand <david@kernel.org>, 
	Greg Thelen <gthelen@google.com>, Roman Gushchin <kfree@google.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Nilay Vaish <nilayvaish@google.com>
Content-Type: text/plain; charset="UTF-8"

As part of the memdescs effort to separate struct folio from struct page
and allocate struct folio dynamically [1], struct folio will no longer
embed a struct page member (folio->page), and the address of a struct
folio will no longer equal the address of its head struct page in
vmemmap.

This series eliminates all but one of the remaining &folio->page
references across mm/*.c (25 files) by converting them to:

- folio_page(folio, 0) (or folio_page(folio, i) where indexing a
  subpage) when passing a folio's head/subpage struct page * to
  page-based helpers (PageAnonExclusive, SetPageAnonExclusive,
  rmap/split helpers, movable_ops helpers, HugeTLB Vmemmap Optimization
  (HVO) address calculations, page_ext, alloc_tag, etc.);
- VM_BUG_ON_FOLIO(..., old_folio) in place of
  VM_BUG_ON_PAGE(..., &old_folio->page) in hugetlb_wp(), and
  folio_set_hwpoison(folio) in place of SetPageHWPoison(&folio->page) in
  mf_generic_kill_procs();
- ERR_CAST(folio) in place of returning &folio->page on IS_ERR(folio)
  paths in do_read_cache_page() and shmem_read_mapping_page_gfp();
- Operating on struct page * directly in compaction_alloc_noprof()
  before calling page_rmappable_folio(), and adding &page->lru to
  cc->freepages[order] in compaction_free().

The remaining folio->page uses in mm/debug.c (__dump_folio(), which has
three lines: page_has_type(&folio->page) and two reads of
folio->page.page_type) are intentionally left untouched because
__dump_folio() operates on a stack snapshot (&ps.folio_snapshot) rather
than a live struct folio.  Those are the only folio->page uses left in
mm/*.c after this series.

This series is based on the mm-unstable branch of Andrew Morton's mm
tree.  It has been build- and boot-tested on x86_64 under KVM with
CONFIG_TRANSPARENT_HUGEPAGE, CONFIG_HUGETLBFS,
CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP, CONFIG_CMA, CONFIG_KSM,
CONFIG_USERFAULTFD, CONFIG_MEMORY_FAILURE, CONFIG_PAGE_OWNER,
CONFIG_MEM_ALLOC_PROFILING, and CONFIG_DEBUG_VM enabled.

No functional change is intended while struct folio overlays struct
page.

[1] https://kernelnewbies.org/MatthewWilcox/Memdescs

Nilay Vaish (15):
  mm/khugepaged: drop redundant page parameter from set_huge_pmd()
  mm/huge_memory: use folio_page() in PMD/PUD rmap, zap, and migration
  mm/huge_memory: use folio_page() in THP split paths
  mm/hugetlb_vmemmap: use folio_page() for vmemmap address arithmetic
  mm/hugetlb_cma: use folio_page() in hugetlb_cma_free_frozen_folio()
  mm/hugetlb: replace &folio->page with folio_page() and
    VM_BUG_ON_FOLIO()
  mm/page_isolation: use folio_page() in page_is_unmovable()
  mm/compaction: stop casting free pages to struct folio
  mm/migrate, vmscan: use folio_page() for movable_ops helpers
  mm/memory: use folio_page() in fault and CoW paths
  mm/rmap, gup: use folio_page() for PageAnonExclusive and
    gup_must_unshare
  mm/ksm, userfaultfd: replace &folio->page with folio_page()
  mm/page_alloc, folio: use folio_page() when freeing folios
  mm/page_owner, alloc_tag: use folio_page() for page_ext and codetag
  mm: replace remaining &folio->page uses with folio_page() and helpers

 mm/alloc_tag.c       | 10 +++++-----
 mm/compaction.c      | 15 ++++++---------
 mm/filemap.c         |  6 +++---
 mm/folio.c           |  2 +-
 mm/gup.c             | 11 +++++++----
 mm/gup_test.c        |  6 ++++--
 mm/huge_memory.c     | 37 ++++++++++++++++++++-----------------
 mm/hugetlb.c         | 21 +++++++++++----------
 mm/hugetlb_cma.c     |  3 ++-
 mm/hugetlb_vmemmap.c | 10 +++++-----
 mm/hwpoison-inject.c |  2 +-
 mm/khugepaged.c      |  6 +++---
 mm/ksm.c             | 16 ++++++++++------
 mm/memory-failure.c  |  8 ++++----
 mm/memory.c          | 16 +++++++++-------
 mm/memory_hotplug.c  |  2 +-
 mm/memremap.c        |  2 +-
 mm/migrate.c         | 20 +++++++++++---------
 mm/page_alloc.c      | 18 ++++++++++--------
 mm/page_isolation.c  |  2 +-
 mm/page_owner.c      | 15 +++++++++------
 mm/rmap.c            | 10 +++++-----
 mm/shmem.c           |  2 +-
 mm/userfaultfd.c     | 14 ++++++++------
 mm/vmscan.c          |  2 +-
 25 files changed, 139 insertions(+), 117 deletions(-)


base-commit: 90ddfbd1963659ca4a5d3d7f20717a4222682a8e
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

