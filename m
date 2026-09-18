Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B685B5172F6
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789749298; cv=none; b=q5NnuUWzGYpxphhzT6pwbGq7NIa4wFMZLsci+86ztPRbyRbqcP3bHNyzA+ux0o2FbSfMWbY3lYMWcPFFKqqQ7Fqx0NDaWA6Rw5/CfgtAIrvbbIZjxCUoZsN3TsYFSJamj0kPji2PB/PEjsBzjNquZLi52eVpq49Gp6RdWj+b9D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789749298; c=relaxed/simple;
	bh=UPCYiVO/tjt8CLbaK9mu1VcDPWT+Zq6Sy/WXkOGWMYE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=c3zci05cxzw2g8SxXOkKHbqDgzue5DzMZMsvY3GzOkoz19LtOMGrS9iSHrcXT82Qfbrl6jV9/hdq8k1jTbcWCym+Bh2NqggK+pRhfDpW4K4N2ENWtAO+aJ/MTSuFcg/TJU4Izm7ZdULMjg1ZWsJ7/1caEyIoqh6yTFjMlCV3aw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L7oemrp+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L7oemrp+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F4EC1F000FF;
	Fri, 18 Sep 2026 16:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789749297;
	bh=MsNld8aUbgRIh2O6l97cYYAQPrAGS7NYzO+geQva67A=;
	h=From:Date:Subject:References:In-Reply-To:To;
	b=L7oemrp+rrNnE4+Tt2e9cmSNkzn9oKbVyqO2t5vODb7ut75ggqJqs+JXQBeBM5C3j
	 7LfJL3qrXcgAplBN9bjW3/I/69ywNu1tGa9NFtKQB/cYpXPTnYQ8TV7a7TkPo4q1PC
	 Idi5WvJMqWqMV2bDIRnp58qJ81hQZU+r4Z8vyHm9z3pyK99tRVh8MyTWEtUJ4FGOjW
	 l5Y7V6Yc5jjlKtnkSTMBWThDUjmuSE8/cIPcUSXv5Jh4KAJtLv9lPdYh+YLbjBRmhz
	 7PgO1llreYx6bTMQ0ha6GY3odPxKyt3pVTHrmBt3kBgwWfZBHlNzM8vXw7nEDj/ewf
	 APIfrKf6yhccw==
From: "David Hildenbrand (Arm)" <david@kernel.org>
Date: Fri, 18 Sep 2026 18:34:25 +0200
Subject: [PATCH 2/3] MAINTAINERS: move memory tiering under MEMORY
 MANAGEMENT - NUMA PLACEMENT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-maintainers-mempolicy-v1-2-9a94cac6d135@kernel.org>
References: <20260918-maintainers-mempolicy-v1-0-9a94cac6d135@kernel.org>
In-Reply-To: <20260918-maintainers-mempolicy-v1-0-9a94cac6d135@kernel.org>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>, 
 Matthew Brost <matthew.brost@intel.com>, 
 Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>, 
 Gregory Price <gourry@gourry.net>, 
 Ying Huang <ying.huang@linux.alibaba.com>, 
 Alistair Popple <apopple@nvidia.com>, Gregory Price <gourry@gourry.net>, 
 Rakie Kim <rakie.kim@sk.com>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, 
 "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1806; i=david@kernel.org;
 h=from:subject:message-id; bh=UPCYiVO/tjt8CLbaK9mu1VcDPWT+Zq6Sy/WXkOGWMYE=;
 b=owGbwMvMwCF2/OVpCdfQ3ZWMp9WSGLLWZigbbI1cXvn4xWbfEMar/5/LBVpzbM/4sPnuvwNqV
 qzRtXNlOkpZGMQ4GGTFFFmCgu8bvHy5rrbajY8ZZg4rE8gQBi5OAZjISnlGhvlSCpIXvM44cPpU
 FUy9qFTOLn0n7e3UKlE2v8nOIjf8LRkZJuZUfi0763LbRV1Evm/PmzVbKxc0P1yu/CH2R838DwW
 HWQE=
X-Developer-Key: i=david@kernel.org; a=openpgp;
 fpr=1BD9CAAD735C4C3A460DFCCA4DDE10F700FF835A

NUMA PLACEMENT is a better place for memory tiering.

My best guess is that existing MISC reviewers are not that interested in
memory tiering, so don't carry any over.

Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 MAINTAINERS | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 77232db57b53d..344875eefd175 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17261,7 +17261,6 @@ W:	http://www.linux-mm.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
 F:	Documentation/ABI/testing/sysfs-kernel-mm
 F:	Documentation/ABI/testing/sysfs-kernel-mm-cma
-F:	Documentation/ABI/testing/sysfs-kernel-mm-memory-tiers
 F:	Documentation/ABI/testing/sysfs-kernel-mm-numa
 F:	Documentation/admin-guide/mm/
 F:	Documentation/mm/
@@ -17269,7 +17268,6 @@ F:	drivers/char/mem.c
 F:	include/linux/cma.h
 F:	include/linux/dmapool.h
 F:	include/linux/ioremap.h
-F:	include/linux/memory-tiers.h
 F:	include/linux/page_idle.h
 F:	mm/backing-dev.c
 F:	mm/cma.c
@@ -17281,7 +17279,6 @@ F:	mm/early_ioremap.c
 F:	mm/fadvise.c
 F:	mm/ioremap.c
 F:	mm/mapping_dirty_helpers.c
-F:	mm/memory-tiers.c
 F:	mm/page_idle.c
 F:	mm/pgalloc-track.h
 F:	mm/process_vm_access.c
@@ -17310,10 +17307,13 @@ L:	linux-mm@kvack.org
 S:	Maintained
 W:	http://www.linux-mm.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
+F:	Documentation/ABI/testing/sysfs-kernel-mm-memory-tiers
 F:	Documentation/ABI/testing/sysfs-kernel-mm-mempolicy
 F:	Documentation/ABI/testing/sysfs-kernel-mm-mempolicy-weighted-interleave
+F:	include/linux/memory-tiers.h
 F:	include/linux/mempolicy.h
 F:	include/uapi/linux/mempolicy.h
+F:	mm/memory-tiers.c
 F:	mm/mempolicy.c
 
 MEMORY MANAGEMENT - OOM KILLER

-- 
2.43.0

