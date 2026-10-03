Received: from mta1.migadu.com (out-191.mta1.migadu.com [95.215.58.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C22E2E736F
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 01:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790989935; cv=none; b=vChVWalNtdzrzOfGgyslp8L0BP94HmIJVunKBzYbjB9B+5TFOjltR2n5hQfuZEUi/TzdEfRIL9GxmsQFaNzYYBgS219ylDDK0daKs9zxiaU8aVlz+pUDK/8CbjzdQz78RxCZmw+61rSxg+0VHBZS6NW3u5xH30UfXijDV3WTYPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790989935; c=relaxed/simple;
	bh=ijkPffjazmoEalsiCm8siJSxQyEa9EfYXWnMK6Ecc7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=ojLEpWLw9KSCeUYt/UycgSJ/kSp1wjeQiz+xAnjTefIURHpwmwlTFYkluYfq+2+YSTSSS6hlwX5R4kw7Vo0cXTF6ffhmMVu5jn7DFatjSFcLJHsE9D+d8syKGeCw5UkfbqmOAJPYaepXqcKGRSUSA7soZkCbJSzDct0weCuWBm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=linux.dev; arc=none smtp.client-ip=95.215.58.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id c080e56c016d6bad;
	Sat, 03 Oct 2026 01:11:59 +0000
X-Mizu-Trace-ID: c080e56c016d6bad
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
Subject: [PATCH 6/6] mm, swap: drop a refused xswap backend run directly
Date: Sat,  3 Oct 2026 09:11:11 +0800
Message-ID: <20261003011111.1003090-7-hebaoquan@kylinos.cn>
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

On a refused charge, xswap_backend_alloc() gave the physical run back
with __xswap_backend_unlink(), which finds the run through the reverse
mapping. That mapping is not installed yet at this point, so it
recognised nothing and freed nothing: every refused charge leaked the
run and tripped a VM_WARN_ON_ONCE().

Drop the run directly instead; the caller holds it and nothing points
at it yet.

Seen with a cgroup at memory.swap.max: the backend held 48663 pages
while memory.swap.current was 0.

Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
---
 mm/swapfile.c | 35 ++++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 419d19f3b98c..0f841616d27e 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -3302,6 +3302,39 @@ static void xswap_free_phys_slot(struct swap_info_struct *si,
 	swap_cluster_unlock(ci);
 }
 
+/*
+ * Give a run of backend slots back. Nothing points at them yet, so there is
+ * no reverse mapping to look up and no record to clear.
+ */
+static void xswap_drop_phys_slots(swp_entry_t phys, unsigned int nr)
+{
+	struct swap_info_struct *psi = swap_type_to_info(swp_type(phys));
+	unsigned long poff = swp_offset(phys);
+	struct swap_cluster_info *pci;
+	unsigned int i;
+
+	if (!psi)
+		return;
+
+	pci = swap_cluster_lock(psi, poff);
+	if (!pci)
+		return;
+
+	VM_WARN_ON(pci->count < nr);
+	pci->count -= nr;
+	for (i = 0; i < nr; i++)
+		__swap_table_set(pci, (poff + i) % SWAPFILE_CLUSTER,
+				 null_to_swp_tb());
+
+	if (!pci->count)
+		free_cluster(psi, pci);
+	else
+		partial_free_cluster(psi, pci);
+	swap_cluster_unlock(pci);
+
+	swap_range_free(psi, poff, nr);
+}
+
 /*
  * An xswap slot being freed may still own a physical slot. Drop it, or the
  * physical space and its reverse mapping leak. Caller holds the xswap
@@ -4697,7 +4730,7 @@ swp_entry_t xswap_backend_alloc(swp_entry_t entry, unsigned int order,
 		swap_cluster_unlock(ci);
 	}
 	if (mem_cgroup_swap_charge(id, nr)) {
-		__xswap_backend_unlink(entry, phys, order);
+		xswap_drop_phys_slots(phys, nr);
 		return (swp_entry_t){};
 	}
 
-- 
2.54.0

