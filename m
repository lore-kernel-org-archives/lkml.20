Received: from mta1.migadu.com (out-126.mta1.migadu.com [95.215.58.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691AE26158B
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 03:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.126
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788577548; cv=none; b=jYmt2/Ed+SEC5JYOMp8r/RiaOHws/HYKzqKRW2eQAU7U6qXQ7vMMRKQ1TNEa3c9RNqlos+MzSbOtTgKTBwWSaAmZwPfwpx+ZE/02YtSMm1ZsXwUAOQ3mRwQB/8+TcX9EraUQkIxGw3vxStV1ZoYntDE1cyN7Saj3KGUtLEeGQyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788577548; c=relaxed/simple;
	bh=wLT7iFs3MczdphYR4AkXje9YdWj0uWa+VrRt5sOOktY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TphkNBMTTUXtid2zNt8NjtIxE/F/up5k90oYnfDhZ1mR/n/Bc6UtoZinpsO42gBsttinMTkpzpwECzuYbZjzhxdSvFtxjbZYr3+LqA1a+aWcyDXi6oZfsgnz0W1xKWrWzjTIoF1/Qm/Q/SUQMOpct4X3k6clczETALxGLphjQF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=jjyS1sLK; arc=none smtp.client-ip=95.215.58.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="jjyS1sLK"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=wLT7iFs3MczdphYR4AkXje9YdWj0uWa+VrRt5sOOktY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788577543; v=1; x=1789182343;
 b=jjyS1sLKPLphMwjUl3G1ZF2HBLcmNhPySNR4zxAcS88QvzF054XCtu14AWqqegKIG3s1pQvb
 b8QIDdHj9I8FHubHIlAzhTHgyPykidsgXl+mePQcPg81fhfob1uUDiQ62fF7DwOMfS3VFnWkKAh
 GjjNHCxS45UZAIsX4M90Q8T0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 50c0c96e9f01a2e5;
	Sat, 05 Sep 2026 03:05:33 +0000
X-Mizu-Trace-ID: 50c0c96e9f01a2e5
X-Migadu-Flow: FLOW_OUT
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Meta kernel team <kernel-team@meta.com>,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] memcg: group struct fields by access pattern
Date: Fri,  4 Sep 2026 20:05:16 -0700
Message-ID: <20260905030522.1887837-1-shakeel.butt@linux.dev>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Every so often we get a memcg performance regression caused by nothing
more than a field moving. Someone adds a field, removes one, or puts a
few behind a config option. The layout shifts, fields with different
access patterns land on the same cache line, and a bot reports a
regression.

Two examples. commit 98c9daf5ae6b ("mm: memcg: guard memcg1-specific
members of struct mem_cgroup_per_node") moved lruvec next to
lru_zone_size[] and needed commit f59adcf59332 ("mm: memcg: add
cacheline padding after lruvec in mem_cgroup_per_node") to fix it.
commit c1afbd5de131 ("mm/memcontrol: avoid false sharing between
vmstats and events") had to add ____cacheline_aligned_in_smp for the
same reason.

Each fix was correct but nothing stops the next field addition
from undoing it.

This series makes the layout a contract the compiler checks, the same
way struct net_device does it. Fields are sorted into named cache line
groups by access pattern, and memcg_struct_check() verifies at build
time that every field sits in its group. A field added in the wrong
place now breaks the build instead of quietly costing a few percent.

struct mem_cgroup gets three groups:

  memcg_write_hot     written on the charge, reclaim and socket paths
  memcg_cold          only the cgroup control paths touch these
  memcg_read_mostly   set when the memcg is created, then only read

Testing
=======

The cgroup selftests give identical results with and without the series.

For performance, two identical 30 core Xeon machines each ran both
kernels, with the boot order swapped between them so that machine and
order effects cancel. The useful tests run two workloads at once in one
cgroup, because false sharing only shows up when one side reads a field
that the other side writes.

  slab allocs + page faults, slab side           +1.2%
  page faults + memory.stat readers, fault side  +1.3%
  page faults + memory.stat readers, reader side +0.8%
  everything else                                no change

No test regressed. The gains are small but the point of the series is
the build time contract.

Shakeel Butt (6):
  memcg: move per-node objcg to the read-mostly fields
  memcg: split mem_cgroup_private_id into two fields
  memcg: group the write-hot fields of struct mem_cgroup
  memcg: group the cold fields of struct mem_cgroup
  memcg: group the read-mostly fields of struct mem_cgroup
  memcg: group the fields of struct mem_cgroup_per_node

 include/linux/memcontrol.h | 169 ++++++++++++++++++++++---------------
 mm/memcontrol.c            | 122 ++++++++++++++++++++++++--
 2 files changed, 213 insertions(+), 78 deletions(-)


base-commit: 817d340204c513316223ba084615f5906ac49ddb
-- 
2.53.0-Meta

