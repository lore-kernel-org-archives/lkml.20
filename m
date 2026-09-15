Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4DB3F7898
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789485262; cv=none; b=LTGIWkcZpw/ddNSNtYyJkIDIYURrPd6/G0qZIniAE5W/umIObZ3UjETQPNEEzs/kNyGdaOKGnuB0WwUFOZ/32AlA+6rj+Yz6LoUyI2RY06sTGR2MGLN9FZtudnzKO//MDTmH4YmIVS0VWoDywM2g/507+o6dSqaAgKNvA+8upSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789485262; c=relaxed/simple;
	bh=ghZpxL8+EzNTSZzwqrZJTJSRVyhCIj1UeQg1atUstZE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SIQZBTldPLHW9d/d7ymxQzm5Hpw6hj2Lih/mum9UdLim7d5/OXENxGaM4rGHSOQ2wpw7A4Sn9RreFMch+S8JxaweCGXphuwYiyQKxEhiQRhZVHerUig0xF+OObTGjtpmTrCxUOvvNJBEK5nF40VtPAIiibwbMEfvrdyfOvb0lEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=IDiyfSyR; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="IDiyfSyR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=pK
	hdrGOsRLW5YejjfAbK4XLy5VFPVA6axSXQtqSTR/k=; b=IDiyfSyRk9vwkqNify
	4HzPOFiipod/lcjuHkZLpYqF/cox/JWqGYcDGsDXrl6Xv6Jn8FnE4FGqQRgIh4O3
	fsFalgGRCNi1A59wQFPvLEh4yleOiTcetucaHSxSu9XVW0i87VULM+O4A+SPM/0l
	edkukMivE0W+Si4wtryefq+uA=
Received: from VM-0-3-ubuntu.. (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wAn2xWOYKlqc0VUAw--.40469S2;
	Tue, 15 Sep 2026 23:13:19 +0800 (CST)
From: Longlong Xia <xialonglong2025@163.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org
Cc: Longlong Xia <xialonglong@kylinos.cn>,
	David Hildenbrand <david@kernel.org>,
	Xu Xin <xu.xin@linux.dev>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 00/14] mm/ksm: merge-path cleanups and folio conversion
Date: Tue, 15 Sep 2026 23:12:14 +0800
Message-ID: <20260915151236.5200-1-xialonglong2025@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAn2xWOYKlqc0VUAw--.40469S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZFW3Kr1xJF1xGw1fZw43ZFb_yoW8tr17pa
	43K3sIyr1kGFWSqw1fJr4jyw1YyrWfJr4UtF13G3yfu3Z093yjgFW8C3W8urWjg3y8Wa1F
	qF4jyF1qgFs8taDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07joGQDUUUUU=
X-CM-SenderInfo: x0ldz0pqjo00rjsqjki6rwjhhfrp/xtbC+A9AOWqpYI9VzAAA37

From: Longlong Xia <xialonglong@kylinos.cn>

Clean up KSM's scan helpers, advisor naming and sysfs formatting, then
pass folios through the merge path and update the related comments.

Patches 11-13 convert the merge targets of the merge path to folios,
continuing the earlier conversion of write_protect_page(),
stable_tree_insert() and the ksm_get_folio() helpers.

Before this series the merge path talked to the stable tree in folios
but to the merge helpers in pages, so the same ksm folio was wrapped
and unwrapped at every level:

  stable_tree_search() returns a folio
        |
        v
      try_to_merge_with_ksm_page(..., &kfolio->page)   <- unwrap
        |
        v
  try_to_merge_one_page(..., kpage)                    <- page all the way
        |
        v
  replace_page(vma, page, kpage, ...)
        |
        v
  kfolio = page_folio(kpage)                           <- re-wrap
  folio  = page_folio(page)                            <- re-wrap

With patches 11-13 every function in the chain takes the ksm folio
directly:

  stable_tree_search() returns a folio
        |
        v
      try_to_merge_with_ksm_folio(..., kfolio)
        |
        v
  try_to_merge_one_page(..., kfolio)
        |
        v
  replace_page(vma, folio, kfolio, ...)
        |
        v
  folio_page(folio, 0) only where a 4K page is needed (pte and rmap)

No functional change intended.

This series is based on next-20260914 (1a1de54f7369).

Longlong Xia (14):
  mm/ksm: constify ksm_next_page_ops
  mm/ksm: rename advisor_ctx to ksm_advisor_ctx
  mm/ksm: use the correct format specifier for max_page_sharing
  mm/ksm: add advance_scan_mm_slot() helper
  mm/ksm: make remove_stable_node_chain() return bool
  mm/ksm: clear all slab cache pointers in ksm_slab_free()
  mm/ksm: reuse the zero page pointer for merge tracing
  mm/ksm: document the two remove_rmap_item_from_tree() calls
  mm/ksm: move the no_vmas label out of the if block
  mm/ksm: extract ksm_begin_full_scan() from scan_get_next_rmap_item()
  mm/ksm: pass folios to replace_page()
  mm/ksm: take the ksm folio in try_to_merge_one_page()
  mm/ksm: take the ksm folio in try_to_merge_with_ksm_page()
  mm/ksm: update merge helper comments for folios

 mm/ksm.c | 270 +++++++++++++++++++++++++++++++------------------------
 1 file changed, 152 insertions(+), 118 deletions(-)

-- 
2.43.0

