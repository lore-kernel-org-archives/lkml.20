Received: from mta0.migadu.com (out-86.mta0.migadu.com [91.218.175.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D476831B10B
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 01:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790989908; cv=none; b=oYIg2vjKTcgkuDqAbEl/amcEGfbIYFaOo9RnphxY4lqk6fLSS0uG5qWIwBMX8qYcSwEjmZdpw51/8ewLwQMwX4DTOngoT/3bX24WiU50KjQPuGsU5mfzEjey+wGjoZiv6jRua3goJOi9x3U/naKWKgP3c+w/bItPf2lnP7tRdiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790989908; c=relaxed/simple;
	bh=76C5Ljcciu3Hj8a6h3rQ8CRf53Saq5FlvdZPsUx7mEs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=P+hR+MOC6GaGeKCePItZrqnUQH60B98WH8RsXp7vQ6fPCy8LVqRhuLlVKF3VgeXj0oocp4j5mKjTxpYl0MutZEt6GUyfzyKacTsT460Pc+aTa1M6NvoY0vdj+WnqcfHdBmdHnfEhdcWxiB8hFUADvfVtZfGRSXgW3ZA34hRRiHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=linux.dev; arc=none smtp.client-ip=91.218.175.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id d81cff4ff6dbfbf7;
	Sat, 03 Oct 2026 01:11:36 +0000
X-Mizu-Trace-ID: d81cff4ff6dbfbf7
X-Migadu-Flow: FLOW_OUT
From: Baoquan He <hebaoquan@kylinos.cn>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	chrisl@kernel.org,
	kasong@tencent.com,
	hannes@cmpxchg.org,
	nphamcs@gmail.com,
	tj@kernel.org,
	mkoutny@suse.com,
	roman.gushchin@linux.dev,
	shakeel.butt@linux.dev,
	muchun.song@linux.dev,
	baoquan.he@linux.dev,
	baohua@kernel.org,
	youngjun.park@lge.com,
	linux-kernel@vger.kernel.org,
	Baoquan He <hebaoquan@kylinos.cn>
Subject: [PATCH 3/6] mm, swap: charge an xswap entry when it gets physical backing
Date: Sat,  3 Oct 2026 09:11:08 +0800
Message-ID: <20261003011111.1003090-4-hebaoquan@kylinos.cn>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261003011111.1003090-1-hebaoquan@kylinos.cn>
References: <20261003011111.1003090-1-hebaoquan@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

From: Nhat Pham <nphamcs@gmail.com>

An xswap entry is recorded but not charged at allocation.  Charge
memcg->swap when the entry takes a physical backend slot, in
xswap_backend_alloc(), and uncharge it when the backend is released.

memory.swap.current therefore still counts the pages that do reach the
disk, and memory.swap.max is still enforced on them.

Suggested-by: Johannes Weiner <hannes@cmpxchg.org>
Signed-off-by: Nhat Pham <nphamcs@gmail.com>
Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
---
 mm/swapfile.c | 58 +++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 56 insertions(+), 2 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 0310b474f08d..86ab4a86857a 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -115,6 +115,11 @@ static void xswap_clear_cache_only(struct swap_cluster_info *ci,
 				   unsigned int start, unsigned int nr);
 static int xswap_reclaim_backing(struct swap_info_struct *si,
 				 unsigned long offset, swp_entry_t xentry);
+static unsigned short xswap_entry_id(struct swap_cluster_info *ci,
+				     unsigned long off);
+static void xswap_backend_uncharge(swp_entry_t entry, unsigned int nr);
+static void __xswap_backend_unlink(swp_entry_t entry, swp_entry_t phys,
+				   unsigned int order);
 
 static int xswap_create(int prio);
 static int xswap_destroy(int type);
@@ -3315,6 +3320,8 @@ static void xswap_release_slot_backend(struct swap_info_struct *si,
 	psi = swap_type_to_info(swp_type(phys));
 	if (psi)
 		xswap_free_phys_slot(psi, entry, phys);
+
+	xswap_backend_uncharge(entry, 1);
 }
 
 /*
@@ -4651,6 +4658,7 @@ swp_entry_t xswap_backend_alloc(swp_entry_t entry, unsigned int order,
 	struct swap_cluster_info *ci;
 	unsigned long nr = 1UL << order;
 	unsigned long off = swp_offset(entry);
+	unsigned short id = 0;
 	swp_entry_t phys;
 	unsigned int i;
 
@@ -4671,6 +4679,21 @@ swp_entry_t xswap_backend_alloc(swp_entry_t entry, unsigned int order,
 	if (!phys.val)
 		return phys;
 
+	/*
+	 * The xswap entry was only recorded at allocation, so charge the
+	 * physical swap here.  On failure, drop the physical run without
+	 * uncharging it.
+	 */
+	ci = swap_cluster_lock(si, off);
+	if (ci) {
+		id = xswap_entry_id(ci, off);
+		swap_cluster_unlock(ci);
+	}
+	if (mem_cgroup_swap_charge(id, nr)) {
+		__xswap_backend_unlink(entry, phys, order);
+		return (swp_entry_t){};
+	}
+
 	/* One IO reads a large folio, so its range has to be contiguous. */
 	VM_WARN_ON_ONCE(swp_offset(phys) % nr);
 	VM_WARN_ON_ONCE(off % SWAPFILE_CLUSTER + nr > SWAPFILE_CLUSTER);
@@ -4688,8 +4711,32 @@ swp_entry_t xswap_backend_alloc(swp_entry_t entry, unsigned int order,
 	return phys;
 }
 
-/* Undo xswap_backend_alloc(): the zswap copy is still in place. */
-void xswap_backend_free(swp_entry_t entry, swp_entry_t phys, unsigned int order)
+/* The ID that owns an xswap entry, or 0 if it has no owner recorded. */
+static unsigned short xswap_entry_id(struct swap_cluster_info *ci,
+				     unsigned long off)
+{
+	return __swap_cgroup_get(ci, off % SWAPFILE_CLUSTER);
+}
+
+static void xswap_backend_uncharge(swp_entry_t entry, unsigned int nr)
+{
+	struct swap_info_struct *si = __swap_entry_to_info(entry);
+	struct swap_cluster_info *ci;
+	unsigned long off = swp_offset(entry);
+	unsigned short id = 0;
+
+	ci = swap_cluster_lock(si, off);
+	if (ci) {
+		id = xswap_entry_id(ci, off);
+		swap_cluster_unlock(ci);
+	}
+	if (id)
+		mem_cgroup_swap_uncharge(id, nr);
+}
+
+/* Drop the physical run and the reverse mapping, without any charging. */
+static void __xswap_backend_unlink(swp_entry_t entry, swp_entry_t phys,
+				   unsigned int order)
 {
 	struct swap_info_struct *si = __swap_entry_to_info(entry);
 	struct swap_info_struct *psi = swap_type_to_info(swp_type(phys));
@@ -4718,6 +4765,13 @@ void xswap_backend_free(swp_entry_t entry, swp_entry_t phys, unsigned int order)
 	}
 }
 
+/* Undo xswap_backend_alloc(): the zswap copy is still in place. */
+void xswap_backend_free(swp_entry_t entry, swp_entry_t phys, unsigned int order)
+{
+	__xswap_backend_unlink(entry, phys, order);
+	xswap_backend_uncharge(entry, 1UL << order);
+}
+
 static int xswap_map_clusters(struct swap_info_struct *si,
 			      unsigned long start_idx, unsigned long nr)
 {
-- 
2.54.0

