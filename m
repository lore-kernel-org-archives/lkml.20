Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794640206;
	b=uN1NdnT9t5kHqbinnqbf9jC8SICSer9BMgG/eQ8/Ar9Oc8Sqc++eRfnyF2+LBIsdI0mh
	 /vAbhbRt0FkuXPcmX/kmS93hv8GjaLt8pwytXFuPn5h1HImPkXDzE/Vg+p/MURJ4toL4r
	 RQgd2e6K0SL7ybVurtcAkGS25dopqJFasAIsa9KEWaEfAjP1eKLgqdSJu4WKJS8rX1+MW
	 N4+aw6Th1CxigYLLatmwx91cCHqJjg/0XvVscL73JTHQr5HUogRavmLHlTouZBFLgitdg
	 DkUgZIJ463IbLLbbqIWHwvHHWIvdljOnhIWd4sDtb0WEBF5diHWa+R7a6Vw9u7Xml2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794640206;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=oRfBKleHhU3BUp7ltu8uNKVynP2g/0Xp3jgnuf+J/Eo=;
	b=pWZeYvDIXRrte6w82Y5+jU+DYymTBoP76IxuHFVu0EgAxK9T1mS9jTR4Gglfic84INrC
	 UZ3wVfL3lOAcu2CmfWU3fr9Z1IH5qUhrrU5DagZ/be0yGCCMB+AWQ4S8ewfjx4nsuqp8e
	 9MJhQbbqkMLqZOnXU8WibE0QKF9eF7+Zw2VD7JvPzZb4fkTY0+vEceAO7tRUqgAF+CqjH
	 T/Nhv5yf4N0JouPsrWDViQT7cLojBTSTuR8dRT9HBXLFntNRaNB9nMCA4nEhW6/lAirNS
	 JZYjXr/W0hWRP/FclCKGUMkFzqzvWwl7/6yPdWdcTeICVhwcEEzTrd+iz5dy/vrXxCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=a14J+ivW;
	arc=none smtp.remote-ip=209.85.222.177
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484B8606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 07:10:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 484B8606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=a14J+ivW
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-9495d543b91so53676485a.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 23:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794640204; x=1795245004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oRfBKleHhU3BUp7ltu8uNKVynP2g/0Xp3jgnuf+J/Eo=;
        b=a14J+ivWzJ/poYORcK4nNkkQRbfvwDjPC+e6K1Ne6hUI5q5zkfi2YJp38SflEWnqEp
         XFZVhHKO/Qe4IhOAtPdb+5xWEBDEf+CRvZFv/Xmb9JJ0i82uZjhBpiUGQztIMksos6gg
         xGxFElFmKZ2suNnoBeSLuTQBsMs5Nf7OrYOFYJvYQISHbw4+R+RO8si0+OvQHKqhkbjY
         KvHL4cxvfPXZ96A4VSjq+VnxjO1TGDXLVYg9VsVWtLyw/p2B3+9BUPO/onXKp3RxqVR1
         qrOcQEof96hwqfQFb6IQQIBoMEN2I3TrYTw361/F+VmC6r7ByoRMkxiD8WOkiQSjh60S
         xLvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794640204; x=1795245004;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oRfBKleHhU3BUp7ltu8uNKVynP2g/0Xp3jgnuf+J/Eo=;
        b=k0WqB2830D0PczByeg8NOF72YWSoZQtAxGODwkDD+U7FPPfwztOAp83WBDr12VdxrJ
         DJJUfiVqHu38pVR/us7ttzxF2RsV1NAnbPO018PPRmz2TJHZ4ntjt/uyssaEEKBhzFk+
         VGPzAxl8X6F5sT7d2KBlgUOA4OTGQjSXIySJC2BfMtKk0G30xGrlXzI8t5s7wIrI6bIO
         s66uB/ZnFxVAU364a11ZXRbC9Ke3uHRykyXZMG5j+WqlXt1sFN9/MgXC086vq8hkQS/M
         gzEnhMzTxcG5b/5pxn28Z/RCWbmBYTagcFHcphgbdrMUSMuoxthdWgHTF1GEChOT5Wpw
         E+eA==
X-Gm-Message-State: APuU4Z/u6TRHVCLO5YVR+EUfvfHTmcbMDlgsL0sdFfOoAGwOT+I8b2wM
	zLkPmb7Cexq0MoCwzrP3E2vNXI45XroajFZREPdSwVFUTZ/T+Z6AtDJ1zwBpdmW7YNc=
X-Gm-Gg: AYBFou33aVldAqxPxbGBVtoQKly0Pin9RTT4CogPSbW0BJ5nGjJJNxPKIHTjr2yCSIG
	XK0l4GyaERUkJ2CIvJkMgj7dxGCsWQ/uxd3G48CVVw3UM+yB7IGPl20oVo5+jK2SAsAgkIE1mfw
	vnLizJSuUz+U06zS//3kZkiHq17xUG+v7JZWz6N3GcEd+xqo1gXll51rwsvZMCUFZEJPCaCDpB7
	Jai4vPtVihN/KCHHmgDtKdxtAo2dOuIOmGUabJnXs2AnHd6SZ0mH03b2VQ4UvfhlBFt5Za4Cb7H
	QVFwtKrsxAW0C0wXZGnmttQTnjxqASi/WuZIow6m/4LfbghFP+5ZKwTsb6YMb1b/GdBAB8GxoNz
	KiV/BD81/UB7GQbfGShePJuDq8DF2cFyFpRbE7NOCkr3Chv4M5ta8yZozbi7GOgPA9QmFcUqYsz
	vSqcXrCDkgzHY4Q0untlGQIPLeRaiq7cfLTrjUbEkIEbwNGXZFliqm947L8Gt6SBO+OrgLvE2JM
	e9PNFPEGjNooOIsELzhglfswk9BbNV2FHftFbxzoUyw+gsT2rUqZgIyZOdKkZqfTEgRQLlDP8Ny
	Dz1F+wpWAFaTjWWyMudY/UlrCyeoIzKIgWlAPOengAd5wb44ob87xt6l3enT1QcvvKmXClVxGN5
	7fsiX733w91jKCJOl
X-Received: by 2002:a05:620a:8398:b0:93c:ba88:cd65 with SMTP id af79cd13be357-9494b9e13damr803141185a.7.1794640204107;
        Fri, 13 Nov 2026 23:10:04 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23db3a99sm37730986d6.40.2026.11.13.23.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 23:10:03 -0800 (PST)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	linux-doc@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-serial@vger.kernel.org,
	linux-pm@vger.kernel.org,
	damon@lists.linux.dev,
	linux-cxl@vger.kernel.org,
	akpm@linux-foundation.org,
	david@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	johan@kernel.org,
	jirislaby@kernel.org,
	kasong@tencent.com,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	baoquan.he@linux.dev,
	baolin.wang@linux.alibaba.com,
	yury.norov@gmail.com,
	linux@rasmusvillemoes.dk,
	pavel@kernel.org,
	lenb@kernel.org,
	hannes@cmpxchg.org,
	brendan.jackman@linux.dev,
	ziy@nvidia.com,
	sj@kernel.org,
	muchun.song@linux.dev,
	osalvador@suse.de,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	kas@kernel.org,
	xu.xin@linux.dev,
	chengming.zhou@linux.dev,
	gourry@gourry.net,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	ying.huang@linux.alibaba.com,
	matthew.brost@intel.com,
	byungchul@sk.com,
	apopple@nvidia.com,
	rientjes@google.com
Subject: [PATCH 00/22] mm: introduce N_MEMORY_COMMON
Date: Sat, 14 Nov 2026 02:09:37 -0500
Message-ID: <20261114070959.3490008-1-gourry@gourry.net>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is phase 1 of the Private NUMA node series.

I will send v6 "Private Memory NUMA nodes" (phases 2 and 3) separately
next week for further discussion - but I pulled this out ahead to make
the core filtering mechanism easier to review.

The series is now broken up like so:

Phase 1: Introduce N_MEMORY_COMMON to define "general purpose" (common)
         memory as a concept separate from a node having memory as a
         topological feature (N_MEMORY).

         This phase is a no-op for existing systems, but creates the
         baseline for ensuring private node memory is default opted-out
         of being touched by MM (much like ZONE_DEVICE).


Phase 2: Introduce N_MEMORY_PRIVATE to define memory not part of the
         general purpose pool. With this we can introduce a minimum set
         of KUnit tests for the page allocator to demonstrate the
         isolation mechanism.

         At this point it will be possible for a driver to re-use the
         buddy allocator to make uniform order-N allocations.


Phase 3: Introduce feature bits (COMPACTION, RECLAIM, MEMPOLICY) which
         is the minimum viable set to allow userland to manage a private
         memory node via mbind() and migrate_pages().  

         This enables management of HBM and Coherent GPU memory via
         userland tools (numactl, cpuset) while protecting them from
         incidental allocation (no fallbacks, only explicit placement).

         The memory could even be hotplugged in ZONE_NORMAL and pinned.

Actual cover letter for this portion
====================================

N_MEMORY has two meanings today:
  1) this node has memory
  2) ordinary allocations and MM services can use this node's memory

The two are the same today. They stop being the same once a NUMA node
with memory isn't part of the general allocation pool.

This series adds N_MEMORY_COMMON for the second meaning and converts
the relevant N_MEMORY users accordingly. N_MEMORY continues reporting
memory topology - and some users (cpusets) still utilize it.

At the end of this series, N_MEMORY == N_MEMORY_COMMON, so the series
changes no behavior for existing systems. A later series will add memory
outside N_MEMORY_COMMON without having to audit every N_MEMORY user again.

Rather than add new hooks for page-table and pfn walkers, we consolidate
existing ZONE_DEVICE checks (page/folio_is_zone_device()) into a general
`page/folio_is_common_memory()` check.

The series is laid out as:

  1-3   helper functions to check node states and a folio's
        membership to a common memory node.  N_MEMORY_COMMON itself, and
        the `has_common_memory` sysfs ABI.
  4     zonelists: the fallback lists hold common nodes, and a node's
        __GFP_THISNODE list is built only for a common node
  5-21  N_MEMORY->N_MEMORY_COMMON and zone_device -> common_memory
        conversions. One component per patch.
  22    removal of first_memory_node/next_memory_node, which no longer
        have users after this series.

Each conversion restricts or adjusts:
  - an MM service (reclaim, compaction, KSM, collapse, etc)
  - an allocation target to common memory
  - accounting meant for ordinary allocations from common memory only

has_common_memory lists the same nodes as has_memory until memory
outside N_MEMORY_COMMON exists. It is added now so that userspace, such
as libnuma, can start choosing allocation targets from it, and so that
the meaning is fixed before anything makes the two lists differ.

first/next_memory_node() is replaced by first/next_node_state().

Gregory Price (Meta) (22):
  mm: add node-state-filtered zone and node iterators
  mm: publish and clear node memory states via helpers
  mm: introduce the common-memory node state
  mm/page_alloc: build zonelists from common memory
  mm/mempolicy: keep interleave and tmpfs mount policies on common memory
  mm: base hash distribution on common memory nodes
  mm/memory_hotplug: migrate offlined pages to common memory
  mm/memory-tiers: restrict demotion topology to common memory
  mm/ksm: restrict merging to common memory
  mm/khugepaged: restrict collapse to common memory
  mm/mempolicy: don't NUMA-hint folios outside common memory
  mm/damon: restrict DAMON-native folio operations to common memory
  mm/hugetlb: restrict pool growth to common memory
  mm/page_alloc: count common memory nodes for kswapd recovery
  mm/oom_kill: compare OOM constraints against common memory
  tty/sysrq: use common memory for the manual OOM zonelist
  mm/vmscan: restrict reclaim to common memory
  mm/compaction: restrict compaction to common memory
  mm/migrate: restrict move_pages() destinations to common memory
  PM: hibernate: size the image from common memory
  mm/khugepaged: base the recommended min_free_kbytes on common memory
  nodemask: remove the now-unused first_memory_node/next_memory_node

 Documentation/ABI/stable/sysfs-devices-node | 16 +++++++
 Documentation/mm/physical_memory.rst        |  8 +++-
 drivers/base/node.c                         |  2 +
 drivers/tty/sysrq.c                         |  3 +-
 include/linux/mmzone.h                      | 46 +++++++++++++++++++++
 include/linux/nodemask.h                    | 38 +++++++++++++----
 kernel/power/snapshot.c                     |  7 +++-
 mm/compaction.c                             | 14 +++----
 mm/damon/ops-common.c                       |  7 ++--
 mm/damon/vaddr.c                            |  2 +-
 mm/hugetlb.c                                | 44 +++++++++-----------
 mm/internal.h                               | 18 ++++++++
 mm/khugepaged.c                             | 12 ++++--
 mm/ksm.c                                    |  8 ++--
 mm/memory-tiers.c                           | 23 ++++++-----
 mm/memory_hotplug.c                         | 25 ++++++-----
 mm/mempolicy.c                              | 30 +++++++-------
 mm/migrate.c                                |  2 +-
 mm/mm_init.c                                | 16 ++++---
 mm/oom_kill.c                               |  7 ++--
 mm/page_alloc.c                             | 43 +++++++++++++------
 mm/vmscan.c                                 | 26 ++++++------
 22 files changed, 266 insertions(+), 131 deletions(-)

-- 
2.53.1-Meta

