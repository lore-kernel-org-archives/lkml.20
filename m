Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38103B4EB6
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789370767; cv=none; b=uj/a7xsGYgsceX13u00JtxzGU7QNivGwTU+00ba42Li1bbdjmQCx+VSPBLRWPzvDOQj6Tn94QAYiKlitHYDdVK7+xuDYPejqgUouu0Ubnth1gIuYuaCmdvGEFDwqXJVh/Y4kG/TwkgybVAKymBP9ufdEN3RofDVGXE7Ul3AODsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789370767; c=relaxed/simple;
	bh=NOfPHZ7ixuLkKXI9w0ZgyEaNoNvp5KgjURpRC8WgItI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HhZKj6oidQ4zqeKDAJkMwJNjVKoNq4Af9oMM3ZQI77y/mthOyEAim7GN0AnZXUSWDox1wG9S/2qMJthZEsHuPyvsVMz0wiZau7vad3BAAPGYKYzXTGwJ++NEoBlyGRvAFLUiIVpccUpm+a9zhsHm9iB+PltopmYtlgC+Sm8y7Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bgQxmC+e; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bgQxmC+e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789370764; x=1820906764;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NOfPHZ7ixuLkKXI9w0ZgyEaNoNvp5KgjURpRC8WgItI=;
  b=bgQxmC+eFmvjTOeHg4cWvwRr3FK7VuMbofdC2dOmni70u0AQuYWcoMFS
   rdQtybinzISedHzN/NPnqW6fkrDVQFu8NODthIVedaFYVVAB1Z3fiK4CF
   NkmWMk7x4Issn8P/MIu8RjennmCrYLR1BSQAEK0a6DbmTob7cqTOIMH3E
   Z44wg5Dqlr7iSA1U/F3YM1gy8HVUa+YoTIZLAfHwfOnY1FgZuvn6x/gqh
   EPVqkXgB2oSIMUzhosZl7GBQf2Y/oLMFEu9ZgAs4xD9Idq8uxBUbT+Xoq
   Gs+EgWtqjWA5MILvWuk5G8m3C+Y+QNCGZKA5MyTprEQVKCmSSeK98c/mu
   Q==;
X-CSE-ConnectionGUID: x5Jm+pZ1TY+cj6l2Df13aQ==
X-CSE-MsgGUID: S9g8jRA+S1ur1WzUHeaknA==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="101239029"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="101239029"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 00:26:04 -0700
X-CSE-ConnectionGUID: dQwj5KD7RCejXc61B7nuQA==
X-CSE-MsgGUID: d5aPZLlTRTaxm5Oak84Now==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="269937740"
Received: from spr10.sh.intel.com (HELO localhost) ([10.239.23.75])
  by fmviesa008.fm.intel.com with ESMTP; 14 Sep 2026 00:26:01 -0700
From: Yuan Liu <yuan1.liu@intel.com>
To: David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Mike Rapoport <rppt@kernel.org>,
	Wei Yang <richard.weiyang@gmail.com>
Cc: linux-mm@kvack.org,
	Nanhai Zou <nanhai.zou@intel.com>,
	Chen Zhang <zhangchen.kidd@jd.com>,
	Yuan Liu <yuan1.liu@intel.com>,
	Jason Zeng <jason.zeng@intel.com>,
	Chen Yu <yu.c.chen@intel.com>,
	Pan Deng <pan.deng@intel.com>,
	Tianyou Li <tianyou.li@intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 0/2] mm/memory_hotplug: optimize zone contiguous check when changing pfn range
Date: Mon, 14 Sep 2026 03:29:27 -0400
Message-ID: <20260914072929.1883794-1-yuan1.liu@intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series introduces a pages_with_online_memmap member into struct
zone to avoid pageblock-by-pageblock scans across the entire zone and
improve memory hotplug performance.

Approach
========
Add a new zone member, pages_with_online_memmap, that tracks the
number of pages within the zone span that have an online memory map,
including present pages and memory holes whose memory map has been
initialized and for which pfn_to_online_page() succeeds.

For early boot memory, pages_with_online_memmap is calculated in
memmap_init_zone_range(). PFNs initialized by memmap_init_range() are
included in pages_with_online_memmap, and hole PFNs for which
pfn_to_online_page() succeeds are also counted in
init_unavailable_range(). For hotplugged memory,
pages_with_online_memmap is updated through adjust_present_page_count(),
which is called during memory online and offline operations. When
spanned_pages == pages_with_online_memmap, every PFN in the zone span
has a valid memmap entry, so pfn_to_page() can be called for any PFN
within the zone span without an additional pfn_valid() check.

The counter may temporarily undercount when pages with an online
memory map exist outside the current zone span. This can only happen
during boot, when initializing the memory map of pages that do not
fall into any zone span. Growing the zone to cover such pages and
later shrinking it back may result in a value that is too small.
This is safe, as it merely prevents detecting a contiguous zone.

The contiguity check using pages_with_online_memmap is stricter than
the old pageblock-by-pageblock scan. The old set_zone_contiguous()
iterated at pageblock granularity via pageblock_pfn_to_page(), so a
zone could be marked contiguous even if a subsection-sized hole
existed within a pageblock. The new check requires
spanned_pages == pages_with_online_memmap, meaning every PFN in the
zone span must satisfy pfn_to_online_page().

Performance
===========
1. For VM hotplug performance data, please refer to Patch 2.
2. This series also benefits CXL hotplug. Performance results are
   as follows
   https://lore.kernel.org/all/20260409023552.GA2807@AE/

Tested cases
============
1. Hotplug/unplug correctness with both online_movable and online
   policies, including partial unplug, middle-block offline gaps, and
   edge-block span shrink.
2. Large scale (256G/512G) plug/unplug performance.
3. Boot-time subsection holes (aligned/unaligned, in-zone and
   cross-zone) with correct pages_with_online_memmap accounting.
4. kernelcore=mirror: verified no overcounting.

Patch overview
==============
Patch 1 makes shrink_zone_span() more robust when memory/hole boundary
falls within a subsection. It checks the full subsection range to avoid
incorrectly shrinking the zone span during memory unplug.

Patch 2 introduces pages_with_online_memmap to replace
pageblock-by-pageblock scans across the entire zone for zone contiguity
checks.

v9 changes:
    1. Rebased onto v7.3-rc2.
    2. No code changes; refined the commit message and comments for clarity.

v8:
    https://lore.kernel.org/linux-mm/20260901052950.3284540-1-yuan1.liu@intel.com/

v7:
    https://lore.kernel.org/linux-mm/20260818085702.3395529-1-yuan1.liu@intel.com/

v6:
    https://lore.kernel.org/linux-mm/20260723084946.189392-1-yuan1.liu@intel.com/

v5:
    https://lore.kernel.org/linux-mm/20260520093457.3719960-1-yuan1.liu@intel.com/

v4:
    https://lore.kernel.org/linux-mm/20260421125508.2317429-1-yuan1.liu@intel.com/

v3:
    https://lore.kernel.org/linux-mm/20260408031615.1831922-1-yuan1.liu@intel.com/

v2:
    https://lore.kernel.org/all/20260401070155.1420929-1-yuan1.liu@intel.com/

v1:
    https://lore.kernel.org/all/20260319095622.1130380-1-yuan1.liu@intel.com/

David Hildenbrand (Arm) (1):
  mm/memory_hotplug: make shrink_zone_span() more robust

Yuan Liu (1):
  mm/memory_hotplug: optimize zone contiguous check when changing pfn
    range

 Documentation/mm/physical_memory.rst |  6 +++
 drivers/base/memory.c                |  7 ++-
 include/linux/mmzone.h               | 69 +++++++++++++++++++++++++++
 mm/memory_hotplug.c                  | 71 ++++++++++------------------
 mm/mm_init.c                         | 63 +++++++++++++-----------
 mm/mm_init.h                         |  6 ---
 mm/page_alloc.h                      |  2 +-
 7 files changed, 143 insertions(+), 81 deletions(-)


base-commit: df2908090cda368b01ff43709f51890076c56157
-- 
2.47.3

