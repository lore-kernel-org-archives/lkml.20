Received: from va-1-113.ptr.blmpb.com (va-1-113.ptr.blmpb.com [209.127.230.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F6E44F57D
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790753238; cv=none; b=KCTqWpq5dgZ0+svMZyeIMQkxGj7gKxEnO2dGcSjqVVpepAgI4wAyaat6l8Pq8XDd2W6apuEhu3f/JnIuuZ23i0ljKn047G5u7fYKFNx84xL2JHASERtZuVqsLjzgkm91GLU3w4HpDvzipxPyGRmuf358q/qGIV0cDXg1SSwr6UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790753238; c=relaxed/simple;
	bh=TAbfJ/en4isfqFnWZuJmTZLvybW+JSwo6Oj+nGzt/Ug=;
	h=From:Date:Content-Type:Subject:Mime-Version:To:Cc:Message-Id; b=CY5hpmDq9vUaqfo20IPvpRmFWfRBPZtX0i0rKl+/enwXOyDLW5q0TLEMEMiUc5iqq5cQXOm3SXbLzA6TdiNswgcDIPeTpS4n/o/QRB4OUy1kPUM5cCdVFzA7B84+pvke376fuwCXLTia6A/yESj6GC3Vxyn2403enX17rlqq4MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=VGS+3SNd; arc=none smtp.client-ip=209.127.230.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="VGS+3SNd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1790753226; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=diIEvF2TasT4UOWkGa58uWQ9wl1dmZNC1jWBY2aBQCU=;
 b=VGS+3SNda8+sgaPeOpxyEtKZRV8WsptusvmjuYmCux0V6BJHVy9ROoKFRCm5vdox84g2GA
 tmQ9jgeIvqvg26/CCElQtyXPp2wAw0SaRHQV7LCZ7rEfjTllODqVtgeK0Q+TeIp3+Qzt1k
 COGttf88pkYPp6AmnO6SNY8vSfvv2UEjLGXQRdq0Fi5FQLI6xKPcWw8Mh04KeQnCVxOGr5
 NvJcp8GmlHcDUU8LwqkCzhn39HhwNze5cOGCtd7eJabFYiBn+gQ5noHx8V09NTPgVNIam8
 mvk2qFgs9YBVAilwWqD8GzS3LXEUFrgrsHwNkopJE3Cum+UhvXurtNS6zktGBA==
X-Lms-Return-Path: <lba+26abcb9c8+060901+vger.kernel.org+lizhe.67@bytedance.com>
From: "Li Zhe" <lizhe.67@bytedance.com>
Date: Wed, 30 Sep 2026 15:26:17 +0800
Content-Type: text/plain; charset=UTF-8
X-Mailer: git-send-email 2.45.2
Content-Transfer-Encoding: 7bit
Subject: [PATCH] mm/numa_balancing: allow migrate on protnone reference with MPOL_WEIGHTED_INTERLEAVE policy
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
To: <akpm@linux-foundation.org>, <david@kernel.org>, <ljs@kernel.org>, 
	<liam@infradead.org>, <rppt@kernel.org>, <mhocko@suse.com>, 
	<corbet@lwn.net>, <skhan@linuxfoundation.org>, <ziy@nvidia.com>, 
	<joshua.hahnjy@gmail.com>, <gourry@gourry.net>, 
	<ying.huang@linux.alibaba.com>, <apopple@nvidia.com>
Cc: <linux-mm@kvack.org>, <linux-doc@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, <lizhe.67@bytedance.com>
Message-Id: <20260930072617.64665-1-lizhe.67@bytedance.com>

MPOL_WEIGHTED_INTERLEAVE is useful on tiered-memory systems because it
can seed a workload's new allocations across fast memory and slower
capacity memory according to a configured ratio.

That initial placement is useful for workload managers and orchestration
systems.  They can take the amount of fast memory and slower capacity
memory on a machine into account before starting a workload, and choose a
weighted policy that seeds the workload across the tiers at allocation
time.  This avoids starting from an all-fast or all-slow placement and
then relying on promotion or demotion to reshape a large working set.

After those pages have been placed, however, the policy cannot currently
opt in to migrate-on-fault placement.  set_mempolicy() and mbind()
reject MPOL_WEIGHTED_INTERLEAVE when MPOL_F_NUMA_BALANCING is specified,
so memory tiering cannot promote hot pages that were initially placed on
the slower nodes by the weighted policy.

Initial placement is only a starting point.  Pages initially allocated on
fast memory are not necessarily the long-term hot pages, and pages
initially allocated on slower memory may become hot as the workload's hot
set changes.  The policy therefore needs to be able to combine weighted
initial placement with memory tiering's NUMA fault based hot-page
promotion.

Allow MPOL_F_NUMA_BALANCING for MPOL_WEIGHTED_INTERLEAVE.  As with
MPOL_BIND and MPOL_PREFERRED_MANY, keep migration constrained by the
policy nodemask: if the CPU's node is outside the nodemask, do not
migrate the folio there.

This is an opt-in behavior.  MPOL_WEIGHTED_INTERLEAVE without
MPOL_F_NUMA_BALANCING keeps its existing behavior and does not
participate in NUMA balancing.

The weighted interleave weights continue to control new allocations only.
They are not a target residency ratio after migrate-on-fault placement.

Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
---
 Documentation/admin-guide/mm/numa_memory_policy.rst | 10 ++++++++++
 mm/mempolicy.c                                      |  8 +++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/mm/numa_memory_policy.rst b/Documentation/admin-guide/mm/numa_memory_policy.rst
index 90ab26e805a9a..f10a8297fb178 100644
--- a/Documentation/admin-guide/mm/numa_memory_policy.rst
+++ b/Documentation/admin-guide/mm/numa_memory_policy.rst
@@ -259,6 +259,16 @@ MPOL_WEIGHTED_INTERLEAVE
 	weight.  For example if nodes [0,1] are weighted [5,2], 5 pages
 	will be allocated on node0 for every 2 pages allocated on node1.
 
+	When MPOL_F_NUMA_BALANCING is specified, migrate-on-fault
+	placement is allowed within the policy nodemask.  This is an
+	opt-in behavior; without MPOL_F_NUMA_BALANCING,
+	MPOL_WEIGHTED_INTERLEAVE keeps its existing behavior and does
+	not participate in NUMA balancing.  The flag can be used by
+	memory tiering to promote hot pages that were initially
+	allocated on slower nodes.  The weights still affect new
+	allocations only and do not define a target resident ratio after
+	page migration.
+
 NUMA memory policy supports the following optional mode flags:
 
 MPOL_F_STATIC_NODES
diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index 79053ece02cd4..f71cdb488bbdc 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -1731,7 +1731,8 @@ static inline int sanitize_mpol_flags(int *mode, unsigned short *flags)
 	if ((*flags & MPOL_F_STATIC_NODES) && (*flags & MPOL_F_RELATIVE_NODES))
 		return -EINVAL;
 	if (*flags & MPOL_F_NUMA_BALANCING) {
-		if (*mode == MPOL_BIND || *mode == MPOL_PREFERRED_MANY)
+		if (*mode == MPOL_BIND || *mode == MPOL_PREFERRED_MANY ||
+		    *mode == MPOL_WEIGHTED_INTERLEAVE)
 			*flags |= (MPOL_F_MOF | MPOL_F_MORON);
 		else
 			return -EINVAL;
@@ -3005,6 +3006,11 @@ int mpol_misplaced(struct folio *folio, struct vm_fault *vmf,
 		break;
 
 	case MPOL_WEIGHTED_INTERLEAVE:
+		if (pol->flags & MPOL_F_MORON) {
+			if (node_isset(thisnid, pol->nodes))
+				break;
+			goto out;
+		}
 		polnid = weighted_interleave_nid(pol, ilx);
 		break;
 
-- 
2.20.1
