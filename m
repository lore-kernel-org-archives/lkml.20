Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA14351FCD4
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 18:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788804735; cv=none; b=l4DjfDQBWv3JfkgDIyk4+J5/2c6jaDlMWx4X5ZsXz6NhM9Yd6F+auNujwCRz/3M4/KwZbg2dDRId++e4U0CD5KhFddQ1c++VrhVr/QSkCVMwlyAtW8y+NWfxPiMKEYV1aGtWKAMopZ1IFYJX9pFThYuDL3BxMsnJg84l30YTtS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788804735; c=relaxed/simple;
	bh=bPFkWZGsknf++PjhuJFnXWHToOs0IkklZKiAFSoqhVs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TyV3j0hWIgFLkmI7tWftoKpVtq1L+7lM0eIK58NIbU035Eo/UQhn9NaDw2KZwMeImHNAlt2GyN27J2N/h+hgq2W42AlpK/g3cgXjupK5zZVcqLVw/UGZW3IVOyFjdHQHK8f8u70tEqtxpyZ1ho0ZWLtsHcAz887duxvGAogY+GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h35G6xMM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h35G6xMM"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 371EFC2BCF4;
	Mon,  7 Sep 2026 18:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788804735;
	bh=bPFkWZGsknf++PjhuJFnXWHToOs0IkklZKiAFSoqhVs=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=h35G6xMMj9BOXPcOHKU0OxPNwA37noC6iLhCmlwMCrCKVrIkwtSvxRmLIZEaPLg8X
	 cruV9WRD7ZmV4DXgjru6pf3dfaPCF/XWin9Q3frkDKIoL8tlzINbhjKBAElMbpVXLX
	 15FoIOMh8nru2eETuHvcnCPxapjx4vt6kLizvXMxLnzJCGMgAoRuZjrGbxTFR4Nm1W
	 h9xnhrFheoFTmHQZv+f060v2jEBYZkxXXZ56YKgEHSFuJvFtPivTuzudrJJ+X7Vx4x
	 wDjPiIMK16ix+p1VJT6kLx/ALXTCz1iw5WnrwY/puyj7ywiUjd0IBwpYdEQ37L5s9f
	 1kB3jZGpYtz1w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F32FFC79FA0;
	Mon,  7 Sep 2026 18:12:14 +0000 (UTC)
From: Kairui Song via B4 Relay <devnull+kasong.tencent.com@kernel.org>
Subject: [PATCH v4 00/17] mm/huge_memory: clean up and decouple the anon
 and file split helpers
Date: Tue, 08 Sep 2026 02:12:04 +0800
Message-Id: <20260908-swap-thp-cleanup-v4-0-b532a3f20e71@tencent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23NQQ7CIBQE0KsY1mIKHxFceQ/jgn5/LUZpU2jVm
 N5dqjHR6HKSmTd3FqnzFNl6dmcdDT76JuSg5jOGtQsH4n6fM5OF1IUpFI8X1/JUtxxP5ELfco0
 kS9JYQWlYnrUdVf76JLe7V459eSRMkzM1ah9T092en4OYem/e/PKD4AXXxlqwboWIsEkUkEJaY
 HNm08EgPwgBfwiZib0kUga1c8r+EvBBSPGHgEzYUkG1FBokmG9iHMcHUii8a0oBAAA=
X-Change-ID: 20260804-swap-thp-cleanup-6ce2be6cf3b8
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>, 
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Chris Li <chrisl@kernel.org>, Kemeng Shi <shikemeng@huaweicloud.com>, 
 Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, 
 Barry Song <baohua@kernel.org>, Youngjun Park <youngjun.park@lge.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, 
 "Kiryl Shutsemau (Meta)" <kas@kernel.org>, 
 Shivam Kalra <shivamkalra98@zohomail.in>, Kairui Song <kasong@tencent.com>, 
 Kairui Song <ryncsn@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788804732; l=5548;
 i=kasong@tencent.com; s=kasong-sign-tencent; h=from:subject:message-id;
 bh=bPFkWZGsknf++PjhuJFnXWHToOs0IkklZKiAFSoqhVs=;
 b=kG/cwwDJ/cjOJ1iUhUfKkU2xyczq3TOndu9x+jEmF+prDqgllPnoZT0sTCDEAaGGrsXDa/8gx
 +Upg/n/supjBW7WxwBu9XzvhwudEX/jt5cgZSOx+ovSHRHIEbYU/Bnt
X-Developer-Key: i=kasong@tencent.com; a=ed25519;
 pk=kCdoBuwrYph+KrkJnrr7Sm1pwwhGDdZKcKrqiK8Y1mI=
X-Endpoint-Received: by B4 Relay for kasong@tencent.com/kasong-sign-tencent
 with auth_id=562
X-Original-From: Kairui Song <kasong@tencent.com>
Reply-To: kasong@tencent.com

The folio split path handles anon, page cache and swap cache folios in
one routine.  That mixing is what makes the swap cache split
restrictions hard to lift and to review. We now support uniform split to
order-0 only, and no mappingless swap cache folios. And it has left a fair
number of dead or redundant checks behind.

This series prepares for lifting those restrictions by cleaning up the
code first: split the routine into an anon and a file helper, and keep
all swap cache handling in the anon helper.  The file helper never sees
a swap cache folio; folio_check_splittable() rejects them up front.

Apart from two bug fixes (patch 1 and 2) and a slight adjustment of anon
splitting (patch 12), this is a pure cleanup.

Testing:

The in-tree split_huge_page_test selftest (uniform, non-uniform and
in-folio-offset splits of anon and pagecache folios) passes 62/62 over
600 runs on the patched kernel.

ftrace function_graph tracing filtered on __folio_split() was used to
compare per-call durations between the base and the patched kernel on
the same x86-64 box (interleaved runs across alternating reboots;
135 split calls per run, 600 test runs):

Before: 68.52 us, stddev: 1.58
After:  67.38 us, stddev: 1.33

The patched kernel is slightly faster. The stack usage and object size
change as the config and compiler change, but in general the stack
usage is reduced and object size is basically unchanged.

Signed-off-by: Kairui Song <kasong@tencent.com>
---
Changes in v4:
- Rebase on top of mm-unstable, also mergable on mm-new now.
- Patch 12 might need some attention as we can skip anon_vma locking for
  unmapped anon folio now due to further cleanup, including unmapped anon
  swap cache (not mappingless swap cache).
- Drop the two swap cache behavior changes, will be sent separately once
  this lands, so it gets its own attention. Also drop related doc
  updates. [ David Hildenbrand ]
- Rename the split helpers to __folio_freeze_split_anon() and
  __folio_freeze_split_file(), frozen implies unmapped.
  [ Kiryl Shutsemau, David Hildenbrand ]
- Keep zone_device_private_split_cb() in the anon helper only, and add
  VM_WARN_ON_ONCE_FOLIO(folio_is_device_private()) to the file helper:
  device private folios can only back anonymous memory.
  [ Kiryl Shutsemau ]
- Replace the "bool unmap" parameter with a folio_mapped(), rename
  remap_page() to remap_folio() and document it. [ David Hildenbrand ]
- Move the racy folio_expected_ref_count() check into unmap_folio()
  instead of duplicating it.
- Make more locals const.
- Reword the mm/swap off-by-one fix: non-uniform swap cache split is not
  enabled yet, so the bogus sanity check is currently dead code.
- Collect Reviewed-by/Acked-by tags.
- Link to v3: https://patch.msgid.link/20260821-swap-thp-cleanup-v3-0-9b43f5163238@tencent.com

Changes in v3:
- Get rid of for_each_folio_safe and open code it.
- Check if the folio is mapped before freeing it swap cache to avoid
  potential performance lose.
- Initial test and binary analyze showed everything is very similiar to
  previously series.
- Drop the redundant mapping argument of __split_frozen_folio
- Link to v2: https://patch.msgid.link/20260813-swap-thp-cleanup-v2-0-d2ee48c6aa49@tencent.com

Changes in v2:
- Return -EBUSY instead of -EINVAL for swap cache & shmem folio split
  attempt.
- Introduce a for_each_folio_safe macro to dedupliate the code and
  hightlight the reason we need to keep the iterate safe from folio
  freeing. [ Zi Yan ]
- Rename __split_unmapped_folio() to __split_frozen_folio [ Zi Yan ]
- Rename __folio_freeze_split_unmap_anon. [ Zi Yan ]
- Several comment improments [ Zi Yan ]
- Drop an unused do_lru argument.
- Previouse test results are basically unchanged, stack usage reduced,
  object very slightly larger.
- Link to v1: https://patch.msgid.link/20260808-swap-thp-cleanup-v1-0-689939a7ccc3@tencent.com

---
Kairui Song (17):
      mm/swap: fix off-by-one in swap cache replace sanity check
      mm/huge_memory: fix rejection of swap cache folios with a mapping
      mm/huge_memory: invert folio_ref_freeze() check to reduce indentation
      mm/huge_memory: split the routine for splitting anon and file folio
      mm/huge_memory: rename __split_unmapped_folio() to __split_frozen_folio()
      mm/huge_memory: consolidate irq and locking for folio split
      mm/huge_memory: move EOF trimming into the file split helper
      mm/huge_memory: move unmap and remap into the split helpers
      mm/huge_memory: rename remap_page() to remap_folio()
      mm/huge_memory: move the racy refcount check into unmap_folio()
      mm/huge_memory: move filemap management into the file split helper
      mm/huge_memory: move anon_vma handling into the anon split helper
      mm/huge_memory: move memcg switch into the file split helper
      mm/huge_memory: drop the unused do_lru argument of the file split helper
      mm/huge_memory: clean up after-split folio freeing in __folio_split
      mm/huge_memory: count only swap cache refs in anon folio split
      mm/huge_memory: drop the redundant mapping argument of __split_frozen_folio

 mm/huge_memory.c | 585 ++++++++++++++++++++++++++++---------------------------
 mm/swap_state.c  |   3 +-
 2 files changed, 303 insertions(+), 285 deletions(-)
---
base-commit: d118502628f8b673be9023db8bdf878f64a7ed45
change-id: 20260804-swap-thp-cleanup-6ce2be6cf3b8

Best regards,
--  
Kairui Song <kasong@tencent.com>


