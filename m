Received: from mta1.migadu.com (out-164.mta1.migadu.com [95.215.58.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3882248AF
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 13:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789826027; cv=none; b=NMdyXC1LtTMtoRUUXSWbr8vLPkwXk2yVlTJF3R8PzlFGxF66dIkzRTmML+kXc1dJ2enQ9iP+1pXyN9dhp6hwS00BxXMu37EEskwzZIqPtkQYWdHFz8Lg9VWEUk9i7nPnG5MR8PpGtt2k1s1dw4NWZ2+aowI7bkVlujb63xn9AXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789826027; c=relaxed/simple;
	bh=eQ4xyA9EmXhqdnCJrxxqL/S8/wudyVgXuV6D/sxwFlE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UW/p2O24r/KtKdXKXIB6mV6IBt+irbCs1FOtIQ5Zrg4DbJTJYCZ3VAD94Gdcdo378AMAAtvq0/PIz9Cr64o6zIHd1sAiFofNWiOmsOxykRQjF5G98J81wYaL+BHZ9R5wy4taQer64cTs1JXxy3PcRyZzmqr3ZvtBJCs8d4jaN1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=copzxKrK; arc=none smtp.client-ip=95.215.58.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="copzxKrK"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=eQ4xyA9EmXhqdnCJrxxqL/S8/wudyVgXuV6D/sxwFlE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789826022; v=1; x=1790430822;
 b=copzxKrKesehwOqtLJ2tmVRsXRgpGugarmTiEPkfrIQzEHO4b0n132Er0vmnJJAwn0nKRQuN
 E0AjFmrl220tsPlLFUDJP1Hb8utgSDb4mMcOfUwLs0GoMjdDVHuen+A3Lzf0W5CkbOJkcp5dmNm
 s/AOyPikyxxdkNC8nXRAwg+k=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 568801b7d887b774;
	Sat, 19 Sep 2026 13:53:42 +0000
X-Mizu-Trace-ID: 568801b7d887b774
X-Migadu-Flow: FLOW_OUT
From: Kaitao Cheng <kaitao.cheng@linux.dev>
To: Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Muchun Song <muchun.song@linux.dev>
Cc: Priyanshu Kumar <priyanshukumarpu@gmail.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Kaitao Cheng <kaitao.cheng@linux.dev>
Subject: [PATCH v2 0/3] memblock: Remove unused exact nid allocation API
Date: Sat, 19 Sep 2026 21:53:24 +0800
Message-ID: <20260919135327.74089-1-kaitao.cheng@linux.dev>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit ffe55393137c ("mm/sparse: remove sparse buffer pre-allocation
mechanism") removed the only memmap_alloc() caller that requested an
allocation from an exact NUMA node. All remaining callers allow fallback
to other nodes, leaving the exact_nid argument unused.

Remove the argument from memmap_alloc(). This leaves
memblock_alloc_exact_nid_raw() without any in-kernel callers, so move the
applicable exact-node allocation tests to memblock_alloc_range_nid() and
remove the unused API. Also remove the exact_nid argument from the internal
allocation helper, since all of its remaining callers allow fallback.

Exact-node allocation remains a required behavior of
memblock_alloc_range_nid(). CMA uses it when reserving per-node CMA areas;
allowing fallback could leave the area's recorded nid inconsistent with
the physical location of its memory. KHO also uses it for per-node scratch
areas that must remain on the requested node. Therefore, retain coverage
of this behavior by making the applicable NUMA tests call
memblock_alloc_range_nid() directly with exact_nid set.

The tests that exercise memblock_alloc_internal() retrying below min_addr
cannot be retained unchanged. Unlike memblock_alloc_internal(),
memblock_alloc_range_nid() treats its start address as a hard boundary and
does not retry from address zero. Remove those tests along with the now
unused TEST_F_EXACT dispatch from the shared allocation tests.

Kaitao Cheng (3):
  mm: Remove unused exact_nid parameter from memmap_alloc()
  memblock tests: Move exact nid tests to memblock_alloc_range_nid()
  memblock: Remove unused memblock_alloc_exact_nid_raw()

 include/linux/memblock.h                      |   3 -
 mm/memblock.c                                 |  44 +-
 mm/mm_init.c                                  |  14 +-
 mm/mm_init.h                                  |   4 +-
 mm/sparse-vmemmap.c                           |   2 +-
 mm/sparse.c                                   |   2 +-
 .../memblock/tests/alloc_exact_nid_api.c      | 454 ++----------------
 tools/testing/memblock/tests/alloc_nid_api.c  |  20 -
 tools/testing/memblock/tests/alloc_nid_api.h  |   1 -
 tools/testing/memblock/tests/common.h         |   2 -
 10 files changed, 50 insertions(+), 496 deletions(-)

-- 
2.54.0 (Apple Git-157)

