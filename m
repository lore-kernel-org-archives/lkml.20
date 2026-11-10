Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794288816;
	b=guvRKIGdsKKfC5i4jiDc/EKchnyrqekVs6B8CSxR9fYsFHCkOKMpPKwgp2QaxH4dh1j8
	 lJAMSXEK0leIJbE8VNcmG+bIXi5KTOz/WUNqu+8RHJKQ4Ejird7I6/przq/PBfGz9PoUy
	 Cprsy/FG7rm7ddQAF+g015vV/5i2538XIyQ1Rativ2FUwrMddHHk3d1Z/Cceh58mN1ZQj
	 Ke6tlf9qsnp+7Xd/D/HPgTKsF6km6HJ2apytqmn9AJdT95mdAOZT96oqQ1aojUZVrq9kA
	 gyxNR42nSax3KRB/eAb8ojrP2MZ5g6sAVnk3yb1G+bSys6B7eqAKyOjSTKS6RD4wZBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794288816;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=/D/X2RWqUWZEGqY5FvfeCmXbQ5GVi1wSyRCE6T+SpWY=;
	b=D+5+CQF2hkFPP0RnxJk9vQN5fdwZL9NXnRFnPkaFFb4URQAV57gehlCkcYC8uU5Wxu3g
	 Zl1I5VPPWolE+Mj1Gv+86ZcNWeZv9rPu1OAuIb2yY/aIjVELfVlzov3M3Zj+sL9JFqMGL
	 l4zP3mLn+/LNhbF3pt1jCH071GKMbdowBxMJ33h99637YH17tb12OcDWkul5LatpKixuD
	 D02nE7BbMFah4dBHrd6tVFzZvD6DtRnnM7skmwSfa5csPw7qfvetzkSFlnZPrm6bB9OWZ
	 FbX7gJ8QtTDG7s3vRm1YKVRHxdYfnksMx+7qUPihkrz4j4hsjGXMwOvCRiz2LflsE8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jiaqiyan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dE5+lcSc;
	arc=none smtp.remote-ip=209.85.214.198
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9148360A262F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:33:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9148360A262F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jiaqiyan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dE5+lcSc
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ed08904845so25672575ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 21:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794288815; x=1794893615; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/D/X2RWqUWZEGqY5FvfeCmXbQ5GVi1wSyRCE6T+SpWY=;
        b=dE5+lcSchWLW3n1PV41PtvHsqReKoNplg7cwcMGFmiDUtP88uNxfW6OAFXcn6GdzqE
         eI4ZSztP9OqLxOW2aEJGFwlxap9b0NqcbHMzvDaI+KZpyynfYsmtMBxCYtqCZEkcgqPe
         HX8adh49zAnwGX50kOGiYJEoGJ2JwuGxS5jlwu2yZlbxeN2DgO33bXWbOXuog8XLUeZK
         rDzcLhOJezzBauebCC6m5lbpl0curbiFwKAaVM5ca37//sU4jWpc2nBpqwUfauA2rl4U
         7J7RIEaiscQpn75EvM076j3iK6oXAwU+8wlw2hvrHFCf017F/SdoSVe0tN5CesHtdxxb
         t7kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794288815; x=1794893615;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/D/X2RWqUWZEGqY5FvfeCmXbQ5GVi1wSyRCE6T+SpWY=;
        b=sbEmJg/Z7IQqr8jND+V1NXh8UN3Fs/ciTDSBTn2mXiRdsmhkgFIbtr9PW7KkIFqdoM
         nc4C9OUepHKm8QtNVhMJPUaDYO6HXisaQbldO/GvhmbhEdgaBDhdBipW66KBRsn+sPmN
         hTt5ZJo9pfmzV2JmVcUlsIJQEuYaUnn7zEfSE7/4J51734Ao/dRdJxSZQ27ngmGyMmpN
         cGM9YDhbA/7jpJxU/RIYgPSpcosX56lYpK4mvbzisD9EE0LjO72hm1hz3NYt1JVFnYSz
         AdnYD4qxYzjVG8l1nY4iwQ2C/WxinZBH/4LQJb9wlZzhyZyX4s2BF764eWCp2VB5VjVw
         eG5g==
X-Forwarded-Encrypted: i=1; AL+hErH791Hcp1ikHYNuQyzGcTEW7I5GJZbJbh2orQRN2QORr6qxnnAmEmYzLAL2zYHwbNtkCwx5oCZkpcWzAd4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/LrYVKACTNbOOEUkTsd/bYt6mr/fZe10zLTD0aulr88M4FzMo6
	Lxlc2r9KCVlBGGUvrgvyzUh9TNqV0l0/+vWQaGsU3A25m2jKtdKPTQ2IumlTWqLbsvoaMKTJAw/
	7lnk5aXpZOtxJuw==
X-Received: from plbma13.prod.google.com ([2002:a17:903:94d:b0:2ea:e1c7:d3a1])
 (user=jiaqiyan job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:3903:b0:2ea:192a:13b8 with SMTP id d9443c01a7336-2edb91f565emr13871085ad.20.1794288814617;
 Mon, 09 Nov 2026 21:33:34 -0800 (PST)
Date: Tue, 10 Nov 2026 05:33:28 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.506.g506a7eabc5-goog
Message-ID: <20261110053331.2708996-1-jiaqiyan@google.com>
Subject: [PATCH v7 0/3] Only free healthy pages in high-order folio
From: Jiaqi Yan <jiaqiyan@google.com>
To: linmiaohe@huawei.com, vbabka@kernel.org
Cc: osalvador@kernel.org, ljs@kernel.org, ziy@nvidia.com, harry.yoo@oracle.com, 
	willy@infradead.org, osalvador@suse.de, jackmanb@google.com, 
	hannes@cmpxchg.org, nao.horiguchi@gmail.com, david@kernel.org, 
	william.roche@oracle.com, tony.luck@intel.com, wangkefeng.wang@huawei.com, 
	jane.chu@oracle.com, akpm@linux-foundation.org, muchun.song@linux.dev, 
	liam@infradead.org, rientjes@google.com, duenwen@google.com, 
	jthoughton@google.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	vbabka@suse.cz, rppt@kernel.org, shuah@kernel.org, surenb@google.com, 
	mhocko@suse.com, boudewijn@delta-utec.com, Jiaqi Yan <jiaqiyan@google.com>
Content-Type: text/plain; charset="UTF-8"

At the end of dissolve_free_hugetlb_folio(), a free HugeTLB
folio becomes non-HugeTLB and is released to buddy allocator
as a high-order folio, e.g. a folio that contains 262144 pages
if the folio was a 1G HugeTLB hugepage.

This is problematic if the HugeTLB hugepage contained HWPoison
subpages. In that case, since buddy allocator does not check
HWPoison for non-zero-order folio, the raw HWPoison page can
be given out with its buddy page and be re-used by either
kernel or userspace.

Memory failure recovery (MFR) code (mm/memory-failure.c) does
attempt to take raw HWPoison page off buddy allocator after
dissolve_free_hugetlb_folio(). However, there is always a time
window between dissolve_free_hugetlb_folio() frees a HWPoison
high-order folio to buddy allocator and MFR takes HWPoison
raw page off buddy allocator. Worse, a free HWPoison HugeTLB
folio can also be dissolved outside of MFR, e.g. when shrinking
the HugeTLB pool, and then nobody takes its HWPoison pages off
buddy allocator.

Another similar situation is when a transparent huge page (THP)
is handled by MFR but splitting failed. Such THP will eventually
be released to buddy allocator when owning userspace processes
are gone, but with certain subpages having HWPoison [9].

One obvious way to avoid these problems is to always check
PageHWPoison() when allocating pages, which check_new_pages()
only does if page sanity checks are enabled. However, it is
against the past efforts to reduce sanity check overhead [1,2,3].
As discussed in v6 [13], how HWPoison pages should be handled by
page allocator in general deserves a bigger rework; this patchset
only addresses the freeing side.

__free_pages_prepare() already walks through all tail pages of a
high-order folio to check and clear their flags, so counting
PageHWPoison() pages in that loop is cheap, as suggested by David
Hildenbrand [14]. If any HWPoison page is found, after all checks
and preparations in __free_pages_prepare() succeed, the newly
introduced free_has_hwpoisoned() only frees the healthy pages and
excludes the HWPoison ones in the high-order folio. Unlike
PG_has_hwpoisoned, which v6 relied on but is only maintained for
THP, this catches HWPoison pages in any high-order folio.

free_has_hwpoisoned() iterates through the sub-pages of the folio
to identify contiguous ranges of healthy pages. Instead of freeing
pages one by one, free_has_hwpoisoned() then re-uses
free_prepared_contig_range() [11] to decompose healthy ranges into
the largest possible chunks of different orders. Every chunk is
sanitized and then freed via __free_frozen_pages(). It stops
scanning once all HWPoison pages counted by __free_pages_prepare()
are found. Each excluded HWPoison page is marked HWPoisonTakenOff
with a refcount of 1, just like a page that memory_failure() takes
off buddy allocator, so that unpoison_memory() can put it back.

free_has_hwpoisoned() has linear time complexity wrt the number
of pages in the folio. While the power-of-two decomposition
ensures that the number of calls to the buddy allocator is
logarithmic for each contiguous healthy range, the mandatory
linear scan of pages to identify PageHWPoison() defines the
overall time complexity.

I tested with some test-only kernel code [4] and hugetlb-mfr [5],
and validated that HWPoison pages are excluded by free_has_hwpoisoned()
after dissolve_free_hugetlb_folio() a free 2M or 1G HugeTLB page that
contains 1~8 HWPoison raw pages.

To illustrate the latency free_has_hwpoisoned() adds to the memory
freeing path, I measured it on a 1G HugeTLB folio with 8 HWPoison
pages with instrument code [4, 5] for 20 sample runs, on a kernel
without KASAN and CONFIG_DEBUG_VM, and compared it with free_one_page()
of a healthy 1G folio:

- Last HWPoison page at the end of the folio (worst case):
  mean=767us, median=757us, stdev=29us (20 runs)

- free_one_page() of a healthy 1G folio:
  mean=50us, median=50us, stdev=3us

free_has_hwpoisoned() is in worst case around 15x the baseline. Its
cost is nontrivial, but still far from triggering soft lockup, and
fair for handling exceptional hardware memory errors.

Now that free_has_hwpoisoned() ensures HWPoison pages never make
it into buddy allocator, MFR doesn't need to take_page_off_buddy()
anymore after dissolving HWPoison hugepages. So the same patch
replaces __page_handle_poison() with new __hugepage_handle_poison()
at HugeTLB specific call sites. The two changes are in one patch
because neither works without the other. This patchset doesn't
affect the soft offline behavior in MFR, because soft offline marks
a page HWPoison only after taking it off buddy allocator.

To provide test coverage for the new __hugepage_handle_poison()
in me_huge_page(), the last commit adds a MADV_HARD test variant
for anonymous HugeTLB pages. It also covers the code path that
frees a HugeTLB page that contains 1 raw HWPoison page.

The commit message of patch 2 and this cover letter were reworded
with an AI assistant, which was also used to review the code; the
code changes are my own.

Based on commit 0ea6dc8c4a21 ("fs/proc/task_mmu: fix lost maps entries above 2^63")

Changelog

v6 [13] -> v7

- Rebase to recent akpm/mm-unstable.

- Patch 1: modify free_prepared_contig_range() to take fpi_t
  instead of adding a __free_prepared_contig_range() wrapper
  (Matthew Wilcox).

- Patch 2: count PageHWPoison() pages in the tail page loop of
  __free_pages_prepare() instead of relying on PG_has_hwpoisoned
  (David Hildenbrand [14]). Drop v6 patch 3/5 "mm/memory-failure:
  set has_hwpoisoned flags on dissolved HugeTLB folio" as it is no
  longer needed.

- Patch 2: pass the number of HWPoison pages to
  free_has_hwpoisoned(), which stops scanning once all of them are
  found.

- Patch 2: mark excluded HWPoison pages HWPoisonTakenOff with a
  refcount of 1, so that unpoison_memory() puts them back to buddy
  allocator instead of leaking them (Sashiko AI review).

- Patch 2: remove pr_info() in free_has_hwpoisoned() (Vlastimil
  Babka), and fix comments (Miaohe Lin).

- Fold v6 patch 4/5 "mm/memory-failure: skip take_page_off_buddy
  after dissolving HWPoison HugeTLB page" into patch 2, so that
  memory_failure() doesn't fail to recover HugeTLB folios between
  the two patches. Since free_has_hwpoisoned() already holds a
  refcount on the isolated page, callers of
  __hugepage_handle_poison() no longer page_ref_inc() it.

- Patch 2: __hugepage_handle_poison() no longer tests HugeTLB flags
  (e.g. raw_hwp_unreliable), because the folio may already be freed
  by folio_put() in me_huge_page() or by a concurrent dissolve.
  Instead, it tells success by whether the raw HWPoison page is
  HWPoisonTakenOff after dissolving. Since commit a363c62a653c
  ("mm/hugetlb: do not dissolve gigantic pages without runtime support"),
  dissolve_free_hugetlb_folio() also fails properly on gigantic folios
  without runtime support (Miaohe Lin).

- Patch 3: use HUGETLB_SETUP_DEFAULT_PAGES() so that HugeTLB
  settings are restored after the test (Sashiko AI review).

- Re-measure the performance cost of free_has_hwpoisoned() in v7.

- Drop Reviewed-by from Miaohe Lin and Vlastimil Babka on patch 2
  due to the substantial changes above.

v5 [12] -> v6

- Rebase to recent akpm/mm-unstable and address comments from Zi Yan,
  Miaohe Lin, Vlastimil Babka.

- Extract free_pages_sanitize() to avoid touching HWPoison page(s)
  at the end of __free_pages_prepare().

- Introduce FPI_SANITIZE and add a fpi_t argument to the freeing path
  free_has_hwpoisoned() -> __free_prepared_contig_range(), so that
  healthy page blocks are sanitized before __free_frozen_pages().

- Make free_has_hwpoisoned() be compatible with order==0.

- Repeat the previous test done on both X86 and ARM64 machines.
  CONFIG_KASAN + CONFIG_KASAN_SW_TAGS + kasan.fault=report are
  enabled on the ARM64 machine.

v4 [10] -> v5

- Rebase to very recent akpm/mm-unstable.

- Re-use free_prepared_contig_range() introduced by [11], and remove
  free_contiguous_pages() in v4.

- Instead of using struct page pointer, iterate over pfn in
  free_has_hwpoison().

- Re-tested and re-evaluated free_has_hwpoison()'s time cost.

- Add memory failure recovery test for anonymous 1G HugeTLB page to
  gain test coverage for __hugepage_handle_poison() and for freeing
  1G HugeTLB page that has 1 HWPoison page.

v3 [8] -> v4

- Address comments from Zi Yan, Miaohe Lin, Harry Yoo.

- Set has_hwpoisoned flag after introducing free_has_hwpoisoned().

- Unwrap free_pages_prepare_has_hwpoisoned() into free_pages_prepare().

- If folio has HWPoison, its healthy pages will be freed with FPI_NONE
  right in free_pages_prepare(), who returns false to indicate caller
  should not proceeding its own freeing action.

- Rework the commit on __page_handle_poison. Only change the handling
  for HWPoison HugeTLB page, leaving free buddy page and soft offline
  handling alone.

v2 [7] -> v3:

- Address comments from Mathew Wilcox, Harry Hoo, Miaohe Lin.

- Let free_has_hwpoisoned() happen after free_pages_prepare(),
  which help to deal with decomposing the original compound page,
  and with page metadata like alloc tag and page owner.

- Tested with "page_owner=on" and CONFIG_MEM_ALLOC_PROFILING*=y.

- Wrap checking PG_has_hwpoisoned and free_has_hwpoisoned() into
  free_pages_prepare_has_hwpoisoned(), which replaces
  free_pages_prepare() calls in free_frozen_pages().

- Rename free_has_hwpoison_page() to free_has_hwpoisoned().

- Measure latency added by free_has_hwpoisoned().

- Ensure struct page *end is only used for pointer arithmetic,
  instead of accessed as page.

- Refactor page_handl_poison instead of just __page_handle_poison().

v1 [6] -> v2:

- Total reimplementation based on discussions with Mathew Wilcox,
  Harry Hoo, Zi Yan etc

- hugetlb_free_hwpoison_folio() => free_has_hwpoison_pages().

- Utilize has_hwpoisoned flag to tell buddy allocator a high-order
  folio contains HWPoison.

- Simplify __page_handle_poison() given that the HWPoison page(s)
  won't be freed within high-order folio.

[1] https://lore.kernel.org/linux-mm/1460711275-1130-15-git-send-email-mgorman@techsingularity.net
[2] https://lore.kernel.org/linux-mm/1460711275-1130-16-git-send-email-mgorman@techsingularity.net
[3] https://lore.kernel.org/all/20230216095131.17336-1-vbabka@suse.cz
[4] https://drive.google.com/file/d/1CzJn1Cc4wCCm183Y77h244fyZIkTLzCt/view?usp=sharing
[5] https://lore.kernel.org/linux-mm/20251116013223.1557158-3-jiaqiyan@google.com
[6] https://lore.kernel.org/linux-mm/20251116014721.1561456-1-jiaqiyan@google.com
[7] https://lore.kernel.org/linux-mm/20251219183346.3627510-1-jiaqiyan@google.com
[8] https://lore.kernel.org/linux-mm/20260112004923.888429-1-jiaqiyan@google.com
[9] https://lore.kernel.org/linux-mm/20260113205441.506897-1-boudewijn@delta-utec.com
[10] https://lore.kernel.org/linux-mm/20260202194125.2191216-1-jiaqiyan@google.com
[11] https://lore.kernel.org/all/20260401101634.2868165-2-usama.anjum@arm.com
[12] https://lore.kernel.org/linux-mm/20260531055829.3636554-1-jiaqiyan@google.com
[13] https://lore.kernel.org/linux-mm/20260705180714.3708947-1-jiaqiyan@google.com
[14] https://lore.kernel.org/linux-mm/8e48c288-2183-4d58-b69d-5f78344b5da5@kernel.org

Jiaqi Yan (3):
  mm/page_alloc: free_prepared_contig_range() takes fpi_t
  mm/page_alloc: only free healthy pages in high-order folio
  selftests/mm: add hard memory failure anonymous HugeTLB test

 mm/internal.h                               |   3 +
 mm/memory-failure.c                         |  52 ++++--
 mm/page_alloc.c                             | 180 ++++++++++++++++----
 tools/testing/selftests/mm/memory-failure.c |  67 +++++++-
 4 files changed, 252 insertions(+), 50 deletions(-)

-- 
2.56.0.506.g506a7eabc5-goog

