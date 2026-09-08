Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07EF48F02F
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 22:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788905407; cv=none; b=jXbCLG7zeorKqxHgaz3CKNqRB6t31xc34tJIqlAOOetCro31TueWwqwvrwKzdHOhsybDsXhu/94JBuyzcMl97iHYZpekKme4WXLRmpUH9XF93juxMOvGL7hkUgNoijXceL+d/uHN22ig7jpHH++XDvTyKSoT96RK4RFPApZChss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788905407; c=relaxed/simple;
	bh=Q/jc42japFqRPbNGvUXBNitZamAzzq9svYH+Tr1/9No=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=juVYbLz4KsdvCb+1053FnOWunYWkZkEW6CbrDo+wFq+tgJKlcZ1KdD0XZ2pNbHgJB/0ePvcP3BYDyPehIgZaryjIULI0lUJEocydLq/12PnFXbmzUm0PZ23bqutxGmq6wIUdNspSOXd7RJA/dbkLKBybmIqwsai1NLmpaXrcEXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kwPxSGHK; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kwPxSGHK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788905405; x=1820441405;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Q/jc42japFqRPbNGvUXBNitZamAzzq9svYH+Tr1/9No=;
  b=kwPxSGHKlt+NKvWngnXAkwwUSYzih7ZrA6CgtYol4mbTSDh3zUDsxI4c
   RwfNRGmFuVvJ+NU8F+qpQTF2Uirp9+95AcPTXBL2KIngxDS2bLBlIrC3H
   KiEakLpFDIL4WIz0ns3XrhrjNL3IL7VUkFkqFBlS689Js5DD6Xa+Hrtwq
   bKCxCLzSij3p0VU3l6Sf1xriN6BE/VZa/Lkb0QxoSqqydxe1IkZi4ZaxL
   d0BRemRlVBWyQYCX4fdNl4FwH1y5opmU4WlWyo7TllphyTGr9VRCuOR1Z
   YjOzCtr2fT5oACeXgcK1pgMTJEbgeRokglG+BcmdsrpPYaOCet2D/yP/Q
   Q==;
X-CSE-ConnectionGUID: PT5LPycPR8WKU9CNJ1ppTg==
X-CSE-MsgGUID: YeIzmOiyRiOvQCm2CO2UWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="93017359"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="93017359"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 15:10:05 -0700
X-CSE-ConnectionGUID: tRGcOBcSTmKezjo7GGigCA==
X-CSE-MsgGUID: SzgLCzq9Q+SBHFyfiT+p2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="296067704"
Received: from jf.intel.com ([10.165.154.102])
  by fmviesa001.fm.intel.com with ESMTP; 08 Sep 2026 15:10:04 -0700
From: Ehab Ababneh <ehab.ababneh@intel.com>
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/3] mm/vmscan: adaptive multi-threaded kswapd for NUMA-aware reclaim
Date: Tue,  8 Sep 2026 15:10:53 -0700
Message-ID: <20260908221059.14777-1-ehab.ababneh@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series revives Buddy Lumpkin's earlier multi-kswapd proposal:
https://lkml.iu.edu/hypermail/linux/kernel/1804.0/00342.html

The motivation is stronger now than when the patch was first discussed.
Many current systems have hundreds of cores per NUMA node, not the
single-digit or low-tens core counts that were more common at the time.
When reclaim does not keep up, direct reclaim can still push allocation
latency into application paths and leave substantial CPU capacity waiting
for memory to be freed.

This patchset adds adaptive multi-threaded kswapd. The wakeup policy uses
node load to decide how many kswapd workers to run, so reclaim can scale
when it helps and stay conservative on already busy nodes.

Series summary:

1. Allow multiple kswapd threads per node and add control plumbing.
2. Wake an appropriate number of kswapd threads from per-node
   runnable load.

Concerns from the original discussion and how this series addresses some
of them:

- Concern: Direct reclaim is intended to slow a memory-hogging thread.
  Response: That can be acceptable on lower-core systems. On high-core
  systems, idling many cores while reclaim catches up can cost more than
  allowing reclaim parallelism to scale. It can also block higher-priority
  tasks in direct reclaim while they perform reclaim work on behalf of
  lower-priority memory-hogging tasks.

- Concern: More kswapd threads may hide deeper reclaim issues.
  Response: This series is additive to ongoing reclaim improvements. In
  our testing, multi-threaded kswapd was able to improve performance on
  top of what multi-gen LRU already provides.

- Concern: Existing knobs (such as swappiness and watermarks) should be
  preferred.
  Response: In our testing, those knobs alone did not reliably hit
  performance targets and could increase CPU cost for the same workload
  objective.

- Concern: Need evidence from real workloads.
  Response: This cover letter includes Cassandra results showing higher
  throughput and lower response latency.

- Concern: More reclaim threads may increase pressure on well-behaved
  tasks.
  Response: Adaptive wakeup addresses this by choosing thread count from
  node load.

- Concern: Additional configuration can increase operational complexity.
  Response: The user-facing interface is intentionally minimal:
  max_kswapds_per_node.

- Concern: Lock contention may serialize workers.
  Response: The Cassandra runs below still show net gains, indicating
  contention did not erase the benefit for this workload. The wakeup path
  now uses wake_up_nr() against the existing kswapd_wait queue, avoiding
  pgdat->kswapd_lock (a sleeping mutex) entirely on the allocation hot
  path.

Real-world workload results (Cassandra):

Tests were performed on 7.0.0-rc1.

- max_kswapds_per_node=1
  - throughput sample: 171146
  - reference latency value: 6.375
  - op rates: 43256, 42731, 42341, 42818 ops/s
  - p99 latency: 6.3, 6.4, 6.4, 6.4 ms

- max_kswapds_per_node=8
  - throughput sample: 183639
  - reference latency value: 6.0
  - op rates: 45791, 45253, 46534, 46061 ops/s
  - p99 latency: 6.0, 6.1, 5.9, 6.0 ms

Observed improvement in these runs was about +7.3% throughput and about
-5.9% response latency, which shows practical benefit for production-style
database workloads.

In our runs, performance numbers were essentially unchanged with and
without the adaptive multi-threaded kswapd wakeup policy. In both cases,
they outperformed the single-kswapd-thread baseline. This indicates the
adaptive method preserved the multi-threaded performance improvement.

Addendum: alternative approaches evaluated

- PSI per NUMA node.
  I prototyped PSI-based node pressure ranges to drive wakeup count.
  This became cumbersome because robust PSI-to-thread mappings were not
  straightforward across workload types.

- CPU mask snapshot policy.
  I also tested a simple CPU mask snapshot approach.
  While functional, it reflects a moment-in-time view and does not capture
  pressure trends over a broader sampling window.

Buddy Lumpkin (1):
  vmscan: Support multiple kswapd threads per node

Ehab Ababneh (2):
  mm/vmscan: handle racing max_seq advancement
  mm/vmscan: make kswapd wakeups NUMA load-aware

 include/linux/mmzone.h        |   5 +-
 include/trace/events/vmscan.h |  28 +++
 mm/compaction.c               |   8 +-
 mm/internal.h                 |   3 +
 mm/page_alloc.c               |  26 +++
 mm/vmscan.c                   | 419 +++++++++++++++++++++++++++++++++++++++---
 6 files changed, 465 insertions(+), 24 deletions(-)

-- 
2.43.0

