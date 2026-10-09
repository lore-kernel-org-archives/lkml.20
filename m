Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993F9388E7E
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 20:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791577847; cv=none; b=t4l4yEuf4T+dkBdT3pioR/BbEG81PuzWvW9jWwH6KaOZP8bDv8zNIgrpKEdOi1Vm3WQKVDUXVEzg+nxf8XybbAoC+2SdinLGqZsE558iVlk2ESeVAcR/iiEaLfnc7CEOlp7VaF1dZPMDUMMxJNksT0Ubm9lCb2GUqFE9b231qu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791577847; c=relaxed/simple;
	bh=uPv+lkmfoZReZPQ7M8bL3x++awqz19BblcSMktgTkfc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fjl8VfNlcBxmPHoEx1xJ5u7lZtT+cJQIHiNdS582IQbAqXoUFrgaLj0sH7X3yblIL1f9hSmnjllvlLfhyrv6/oIowVYFlvlj8GzkoHnTwEPxpmwONYoGodDbXtQyeSWrCBx3rez+kxyEgomeNCGRisp93x8hWOVq0K4xgQoFnt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XnyzZ8tU; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XnyzZ8tU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791577846; x=1823113846;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uPv+lkmfoZReZPQ7M8bL3x++awqz19BblcSMktgTkfc=;
  b=XnyzZ8tU+QY3U/snv8E/THYXhIKaz+wXnSQuEoRmMdhGyL2Xe2hCLNUS
   kl1ozEwD38oZu9egWJqam7mf2AaJI4MuSgaMSaOpOEJwawPzZ7BdimZwG
   d8Z5LgFrb88b1FeOVaTa/RSxE94NM4cSvqeWNICIye7A+mKwz02FealVR
   WlfTVJeAQvoc/hZmkCDrCeKD1DCLT4HDr8tJqjAxtLApEoWE4KeD4JCuZ
   7lLRWvZRkgAYBfR1FLhSvj5k2/axFS7UpIgo9aojkm4QucD8m3A5gm5Wq
   IfmrOEhkt/O28/mKXDEhqz8Gv9PngpfWFzRiiCV2Y8Gc+2/SaFCophwvu
   A==;
X-CSE-ConnectionGUID: oOBlpRrnR2+R2cXv1Ecxhg==
X-CSE-MsgGUID: 5GMxAGxOTtqTRUeJEQS3Sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="284518"
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="284518"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 13:30:45 -0700
X-CSE-ConnectionGUID: 7XE8ESMGSSO3WbG4Uk6sjQ==
X-CSE-MsgGUID: FKQDT1TqTwqktiSyV0ePiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="2193152"
Received: from jf.intel.com ([10.165.154.102])
  by fmviesa012.fm.intel.com with ESMTP; 09 Oct 2026 13:30:43 -0700
From: Ehab Ababneh <ehab.ababneh@intel.com>
To: ziy@nvidia.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Cc: buddy.lumpkin@oracle.com,
	akpm@linux-foundation.org,
	kasong@tencent.com,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	jackmanb@google.com,
	hannes@cmpxchg.org,
	baoquan.he@linux.dev,
	baolin.wang@linux.alibaba.com,
	Ehab Ababneh <ehab.ababneh@intel.com>
Subject: [RFC PATCH v2 0/5] mm/vmscan: adaptive multi-threaded kswapd for NUMA-aware reclaim
Date: Fri,  9 Oct 2026 13:32:59 -0700
Message-ID: <cover.1791577417.git.ehab.ababneh@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <SJ1PR11MB6105E073723CFEEE8C8EDBF48C832@SJ1PR11MB6105.namprd11.prod.outlook.com>
References: <SJ1PR11MB6105E073723CFEEE8C8EDBF48C832@SJ1PR11MB6105.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a follow-up to the RFC for adaptive multi-threaded kswapd
on NUMA. It handles concurrent MGLRU aging, adjusts wakeups to node
CPU load, and scales the hopeless threshold for multiple workers.

Under memory pressure, an lruvec can end up with only two MGLRU
generations. That leaves an older and a younger cohort, a bit like
inactive and active LRU lists, though MGLRU tracks age differently.

Regarding the concerns raised in review:
- In the updated Cassandra comparison, four kswapd threads reduced p99
  latency from 6.5 ms to 3.35 ms (about 49%) and increased throughput by
  10.3%. We believe the latency gain comes from the reclaim design,
  not from changes to LRU locking.
- This newer result compares four kswapd threads with one. The earlier
  7.3% throughput result was measured with eight threads.

We also saw periods with zero file scans. The MIN_NR_GENS guard may
contribute: when only two generations remain, it makes scan_folios()
return without scanning the oldest one. This patch tests whether letting
kswapd scan that generation helps reclaim progress. The current traces
do not tie the zero-scan events to the same lruvec, so this remains a
hypothesis; more per-lruvec tracing is needed to compare it with lock
contention.

Changes since v1:
- Add a diagnostic kswapd scan path at MIN_NR_GENS.
- Scale the hopeless-node retry threshold by the active worker count.

Testing:
- Cassandra workload with one and four kswapd threads.

Buddy Lumpkin (1):
  vmscan: Support multiple kswapd threads per node

Ehab Ababneh (4):
  mm/vmscan: silence spurious max_seq race warning
  mm/vmscan: make kswapd wakeups NUMA load-aware
  mm/vmscan: let kswapd scan minimum-generation lruvecs
  mm/vmscan: scale hopeless threshold for kswapd workers

 include/linux/mmzone.h        |   5 +-
 include/trace/events/vmscan.h |  32 +++
 mm/compaction.c               |   8 +-
 mm/internal.h                 |   3 +
 mm/page_alloc.c               |  26 +++
 mm/vmscan.c                   | 426 ++++++++++++++++++++++++++++++++--
 6 files changed, 473 insertions(+), 27 deletions(-)

-- 
2.43.0
