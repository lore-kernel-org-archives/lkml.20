Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA234B4864
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789749294; cv=none; b=GgqZfjVv2xEXDCfNgy8KsWpb2MknNKVMOsz5eIgHDq6KzEcdzxAT24bX7Nk88l2BtcU7pCpalD7ddq23nhMLgfWVCfDpiuebetBaa2N1JdIVzKi7PCH1iyKCi7DDhqXOJ9Lz0ht44a1/ElfOy4+l8MYs1CRYYL3tZ450g8l6WKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789749294; c=relaxed/simple;
	bh=mOcjDBoxi4jC+KgF2UHzT++wwk77CLE5fJZy2jPp9U8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=c8E1zxEA2odYmw7ri7q9T2AMIA1GrrGM4so+tPO1cPWP1S7Ot4SRIF2lQS8MGErJE7LfszT2TUGWgvbW8CMAx/oqbaOKngmtOaciQNwg7e7YNEBSuQqcHXkUGkUX3D9AVXbyxYPDzYIP6RdBFt0+aSl5LsiaICck+OjPQcWToc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YlNB6es5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YlNB6es5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACC091F00899;
	Fri, 18 Sep 2026 16:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789749292;
	bh=y2ursOTDbgQ5WZsTMNPGX/EH4HSKwisDuvpZ2m6uqMk=;
	h=From:Date:Subject:References:In-Reply-To:To;
	b=YlNB6es5ZAY97rM64G4VaQskerl5o9EyMXvvZpRnvHOPcR2aUnyGpoAuCTsc4NsEI
	 GCRFAr1C0JadbMKaJ9GNPGPNvyZxRPd0Uzn3NEl08ovrM2oBcAtUkoOUsn5XydYVyA
	 aoRuUwUm+U0UmshwNYMnOjENC17xVyoaPDo7iAWKQY2+88Imwt5Dqo2OcznWwLSqc8
	 HsjMe1B9gvHwrKjMB15KJrCcYNoQnl3WDJnpzYhml1H8spTkT9T1Q7BurgVXoT3OO8
	 weM6MxaXGG6BLogddc5Xd7I3T7LB9X8dackh+34JYBqQffnEiG/on/XOnZJRnVAbcM
	 Z2o9vmb+qCJFw==
From: "David Hildenbrand (Arm)" <david@kernel.org>
Date: Fri, 18 Sep 2026 18:34:24 +0200
Subject: [PATCH 1/3] MAINTAINERS: split up MEMORY MANAGEMENT - MEMORY
 POLICY AND MIGRATION
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-maintainers-mempolicy-v1-1-9a94cac6d135@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3452; i=david@kernel.org;
 h=from:subject:message-id; bh=mOcjDBoxi4jC+KgF2UHzT++wwk77CLE5fJZy2jPp9U8=;
 b=owGbwMvMwCF2/OVpCdfQ3ZWMp9WSGLLWZii7J/Au83Pp0Y+abTSTa+G2S5KeVa37dadd3vJEW
 lHvUcedjlIWBjEOBlkxRZag4PsGL1+uq61242OGmcPKBDKEgYtTACayazcjQ5dG4fObm96ouXa8
 nOrhYcLj+8r9Q3aVqKdk87XOCZP/qTD803uX/aa24JvATCs7732Z983uvvnhyRIgdKxh4wu2s0/
 8+AE=
X-Developer-Key: i=david@kernel.org; a=openpgp;
 fpr=1BD9CAAD735C4C3A460DFCCA4DDE10F700FF835A

Let's split it up into MIGRATION and NUMA PLACEMENT. The latter is a
better fitting description for mempolicy.c.

Make a best guess about which pieces existing reviewers are interested
in. Move the split sections to keep alphabetical order.

Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 MAINTAINERS | 62 ++++++++++++++++++++++++++++++++++++-------------------------
 1 file changed, 37 insertions(+), 25 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3b2eb2a7a89a8..77232db57b53d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17207,31 +17207,6 @@ F:	include/trace/events/ksm.h
 F:	mm/ksm.c
 F:	mm/mm_slot.h
 
-MEMORY MANAGEMENT - MEMORY POLICY AND MIGRATION
-M:	Andrew Morton <akpm@linux-foundation.org>
-M:	David Hildenbrand <david@kernel.org>
-R:	Zi Yan <ziy@nvidia.com>
-R:	Matthew Brost <matthew.brost@intel.com>
-R:	Joshua Hahn <joshua.hahnjy@gmail.com>
-R:	Rakie Kim <rakie.kim@sk.com>
-R:	Byungchul Park <byungchul@sk.com>
-R:	Gregory Price <gourry@gourry.net>
-R:	Ying Huang <ying.huang@linux.alibaba.com>
-R:	Alistair Popple <apopple@nvidia.com>
-L:	linux-mm@kvack.org
-S:	Maintained
-W:	http://www.linux-mm.org
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
-F:	Documentation/ABI/testing/sysfs-kernel-mm-mempolicy
-F:	Documentation/ABI/testing/sysfs-kernel-mm-mempolicy-weighted-interleave
-F:	include/linux/mempolicy.h
-F:	include/uapi/linux/mempolicy.h
-F:	include/linux/migrate.h
-F:	include/linux/migrate_mode.h
-F:	mm/mempolicy.c
-F:	mm/migrate.c
-F:	mm/migrate_device.c
-
 MEMORY MANAGEMENT - MGLRU (MULTI-GEN LRU)
 M:	Andrew Morton <akpm@linux-foundation.org>
 R:	Kairui Song <kasong@tencent.com>
@@ -17252,6 +17227,25 @@ F:	include/linux/mmzone.h
 F:	mm/vmscan.c
 F:	mm/workingset.c
 
+MEMORY MANAGEMENT - MIGRATION
+M:	Andrew Morton <akpm@linux-foundation.org>
+M:	David Hildenbrand <david@kernel.org>
+R:	Zi Yan <ziy@nvidia.com>
+R:	Matthew Brost <matthew.brost@intel.com>
+R:	Joshua Hahn <joshua.hahnjy@gmail.com>
+R:	Byungchul Park <byungchul@sk.com>
+R:	Gregory Price <gourry@gourry.net>
+R:	Ying Huang <ying.huang@linux.alibaba.com>
+R:	Alistair Popple <apopple@nvidia.com>
+L:	linux-mm@kvack.org
+S:	Maintained
+W:	http://www.linux-mm.org
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
+F:	include/linux/migrate.h
+F:	include/linux/migrate_mode.h
+F:	mm/migrate.c
+F:	mm/migrate_device.c
+
 MEMORY MANAGEMENT - MISC
 M:	Andrew Morton <akpm@linux-foundation.org>
 M:	David Hildenbrand <david@kernel.org>
@@ -17304,6 +17298,24 @@ F:	mm/numa.c
 F:	mm/numa_emulation.c
 F:	mm/numa_memblks.c
 
+MEMORY MANAGEMENT - NUMA PLACEMENT
+M:	Andrew Morton <akpm@linux-foundation.org>
+M:	David Hildenbrand <david@kernel.org>
+R:	Zi Yan <ziy@nvidia.com>
+R:	Joshua Hahn <joshua.hahnjy@gmail.com>
+R:	Rakie Kim <rakie.kim@sk.com>
+R:	Gregory Price <gourry@gourry.net>
+R:	Ying Huang <ying.huang@linux.alibaba.com>
+L:	linux-mm@kvack.org
+S:	Maintained
+W:	http://www.linux-mm.org
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
+F:	Documentation/ABI/testing/sysfs-kernel-mm-mempolicy
+F:	Documentation/ABI/testing/sysfs-kernel-mm-mempolicy-weighted-interleave
+F:	include/linux/mempolicy.h
+F:	include/uapi/linux/mempolicy.h
+F:	mm/mempolicy.c
+
 MEMORY MANAGEMENT - OOM KILLER
 M:	Michal Hocko <mhocko@suse.com>
 R:	David Rientjes <rientjes@google.com>

-- 
2.43.0

