Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F4B34B1A6
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 08:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789893987; cv=none; b=p+1VWhz5yvWVelx+ShgUteOiXIVpo9QB1fFQCMtjO0NHI4QoMEBtUmYKHcFFk7p3TKJ2NmraOjL7FiZfqKrZ0pB5UrNcI7oTi2idMIpSHhDTI5akz/3hg6x5FPwctvTg/EnD2SkOLo3Yn+gLWXlgsIXa6B15ztC6jABqW/cB5Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789893987; c=relaxed/simple;
	bh=z1vDkfqWC/qArC8TAhQtPYX2WZpjm0/+yhw7QmTP6nQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g5nkHWlZGY5ZL1j9qpc2/BqNjB/z7uYUBgkMhT1GU6V6FMUSmv7zJdNYyLVmd9T4yH7guyY0mp4RvBWgQH0seesNU1dt2m/WZxztVewkJWDQSZu5Ip08/3idQ44xX5sdSnupnFvbzRR+nfVxxo1opRrKEn8U2pAc4BY5mvSbCeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gO0Juptk; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gO0Juptk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789893985; x=1821429985;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=z1vDkfqWC/qArC8TAhQtPYX2WZpjm0/+yhw7QmTP6nQ=;
  b=gO0JuptkOf9le3BKz9AuCoOnQgmH7GzzRKNqmHftqrZ0ckCnQpAGKYkQ
   KslsIEcgOaSbZlNA3t80+RSfr8MXAWv2Ch0QZDqxOl4llbW5G9IMyXAZA
   w0QFFNy/MNa4X8t9hs+PHVpqxeTr5lbGngd5O2Z1J8kNLG4lkgo4mjxX9
   d9TTYl9nsuN7aVj8onW92ymhb59AdVlHPLUCtw1gZgaVFf02tgbQIrrio
   PCpQRrdCLRcsQt6bnO3vQqM0pChMdbBa8nSMi7uKccftzIEkdOp1axIZq
   aDzKOyhq8DKF8L26yYLXX/PPe3BpuSiWHLup8DUECcrB0ZYG8OIDUAKHl
   A==;
X-CSE-ConnectionGUID: jUeoH31tSnKiP5U9ul9y7A==
X-CSE-MsgGUID: 7pVKS8EDQ/26GQjV2fD4dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11910"; a="94225741"
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="94225741"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 01:46:24 -0700
X-CSE-ConnectionGUID: RKE+LWp9R1GHdaKoM8lWtw==
X-CSE-MsgGUID: R9yQhMTuRW+EKBIEOEGViQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="280281792"
Received: from spr10.sh.intel.com (HELO localhost) ([10.239.23.75])
  by fmviesa005.fm.intel.com with ESMTP; 20 Sep 2026 01:46:21 -0700
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
Subject: [PATCH v10 0/2] mm/memory_hotplug: optimize zone contiguous check when changing pfn range
Date: Sun, 20 Sep 2026 04:49:44 -0400
Message-ID: <20260920084946.3266279-1-yuan1.liu@intel.com>
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

Note: this counter may temporarily undercount when pages with an
online memory map exist outside the current zone span. Such pages
are only created during boot, when initializing the memory map of
pages that do not fall into any zone span. The undercount itself
can only happen after boot, during memory hotplug, when growing
the zone to cover such pages and later shrinking it back, which
may result in a "too small" value. This is safe: it merely
prevents detecting a contiguous zone.

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

v10 changes:
    1. Rebased onto v7.3-rc3.
    2. Added Acked-by: Mike Rapoport (Microsoft) on patch 2 and reworded
       the init_unavailable_range() comment as suggested.
v9:
    https://lore.kernel.org/linux-mm/20260914072929.1883794-1-yuan1.liu@intel.com/

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
 mm/mm_init.c                         | 64 ++++++++++++++-----------
 mm/mm_init.h                         |  6 ---
 mm/page_alloc.h                      |  2 +-
 7 files changed, 144 insertions(+), 81 deletions(-)


base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
-- 
2.47.3

