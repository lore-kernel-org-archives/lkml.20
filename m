Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5552A3644DE
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 03:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789703939; cv=none; b=WVjpP/JEnBtO9BhYXGbQsoglWLSWSUBwE2Vd56dKYU/mM6CpNJTXQRjDEz6pRRF8kiSyqPRF0uMAKSderlGJZfOL2oq3W30ymvGxc2p3HV4C608GTMkzVc46yUqzyZQZRSM4dQ1HoFGe0pnIxry32rXtq0YHYqVPvQkkihqmwFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789703939; c=relaxed/simple;
	bh=HWR9l/Sj7KWuDW1r5nVptLMffBKRZYO/IVRiLGfLJtM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZZL5NO0QI6VmXDyt99NsWdgeUGa6iYW/eS/rSI0vT7H7SSjI0pteJ72O9l0LU1W97Q6UsjSTjYLdt15QLo11mLqQmSW17WHNhF/XVatlfgSOMr6ymOqr7bnXXkGtVeo9+KSuqy9K30N+KcmQAvPr1CPY2192YiAyIYOY/K/purw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=lGVJ72dm; arc=none smtp.client-ip=115.124.30.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="lGVJ72dm"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1789703928; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=zkqG9smh8H5imeZNBgFh/jJ/RCi3j0R67/bWorlgxUE=;
	b=lGVJ72dmeJm0V8j/cd+zIDSy8NaVSwxnjzw4c9LQCrVI/RfkeaozV8JODUWPNXPfWOugKrKl3XKsPEBwgFa6IzeDIaiGOwLFHI462HYMHveD++hRi5qbhBE928mKakPw7mAMfvH2RG1TMsax4efTtpEp3Wuw09CEwVhgvMklVhs=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R851e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---0XB9o3a2_1789703927;
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XB9o3a2_1789703927 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 18 Sep 2026 11:58:47 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: akpm@linux-foundation.org,
	hughd@google.com,
	david@kernel.org
Cc: ziy@nvidia.com,
	liam@infradead.org,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	kas@kernel.org,
	ljs@kernel.org,
	baolin.wang@linux.alibaba.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 00/12] add shmem mTHP collapse support
Date: Fri, 18 Sep 2026 11:58:31 +0800
Message-ID: <cover.1789701677.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Based on mm-unstable branch.

This patchset is split from the previous shmem mTHP collapse patchset [1],
as the anon mTHP collapse selftests [2] have already been merged.

This is a follow-up patchset for mTHP collapse to support shmem mTHP collapse,
which is based on Nico's patchset[3].

The shmem mTHP collapse strategy follows the anonymous mTHP collapse approach:
track present pages via a bitmap while scanning PMD ranges for collapse candidates,
then use the bitmap after the scan completes to determine the most efficient
mTHP order to collapse to. Built on the basic framework added for anonymous
mTHP collapse, the shmem mTHP collapse implementation is straightforward
(Thanks for Nico's work).

Note: I have not yet enabled large order collapse for file folios (file folios
currently only support PMD-sized large folio collapse). Although file large order
collapse would be more straightforward to implement after shmem mTHP collapse
support is added (requiring some changes to file_thp_enabled()), I think this
still need some discussion on whether it is necessary to support other large
orders collapse for file folios.

Patch 1-4: some cleanups.
Patch 5-8: preparation patches.
Patch 9-11: shmem mTHP collapse support.
Patch 12: add selftests.

Comments are welcome. Thanks.

Changes from RFC v2:
 - Rebase on the new mm-unstable branch.
 - Add some cleanup patches.
 - Drop anon mTHP collapse selftests patches as they have been merged.
 - Record swap entries when calling mthp_collapse() for shmem (per Lance).
 - Return SCAN_PTE_MAPPED_HUGEPAGE if page cache already holds a PMD-sized folio (per Lance).
 - Allow collapse order 1 folios for shmem (per Lance).

Changes from RFC v1:
https://lore.kernel.org/all/cover.1755677674.git.baolin.wang@linux.alibaba.com/
 - Rebase on the new code, and update to use the new functions.
 - Add more test cases.

[1] https://lore.kernel.org/all/cover.1781083630.git.baolin.wang@linux.alibaba.com/
[2] https://lore.kernel.org/all/cover.1785985999.git.baolin.wang@linux.alibaba.com/
[3] https://lore.kernel.org/all/20260605161422.213817-1-npache@redhat.com/

Baolin Wang (12):
  mm: khugepaged: remove outdated comments and check for shmem
  mm: khugepaged: drop the hugepage_madvise()
  mm: shmem: don't expose 'deny' and 'force' via the kernel command line
  mm: khugepaged: move cc->scan_file and cc->scan_pgoff assignment into
    collapse_scan_file()
  mm: khugepaged: add max_ptes_none check in collapse_file()
  mm: khugepaged: generalize collapse_file() for shmem mTHP support
  mm: khugepaged: add an order check for PMD-sized THP statistics
  mm: khugepaged: add a helper to get the minimal collapse order
  mm: khugepaged: add shmem mTHP collapse support
  mm: shmem: run khugepaged for all shmem mTHP orders
  mm: khugepaged: allow khugepaged to check all shmem mTHP-sized orders
  selftests: mm: add shmem mTHP collapse test cases

 Documentation/admin-guide/mm/transhuge.rst |   4 +-
 include/linux/huge_mm.h                    |   8 -
 include/linux/shmem_fs.h                   |   4 +-
 mm/collapse.h                              |   3 +-
 mm/khugepaged.c                            | 220 +++++++++++++--------
 mm/madvise.c                               |   8 +-
 mm/shmem.c                                 |  22 +--
 tools/testing/selftests/mm/khugepaged.c    |   7 +-
 tools/testing/selftests/mm/run_vmtests.sh  |   2 +
 9 files changed, 168 insertions(+), 110 deletions(-)

-- 
2.47.3

