Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9D54C151A
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 15:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791388783; cv=none; b=D2854DACLKwUIuzRC84U5iROTLqMaDwsI1dIZBe1vksa3KdR8F/EH+VqPmLLSorqdZvW8pEZcmw+hkvsNh1P312oZySAGdVVqljAfa6vpWD7KiS4Okzl3L3qrN2/ejk/I/+JFAPLtvUTMXRe/LTAvFt9QRr/SOWV2F0skmRBpJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791388783; c=relaxed/simple;
	bh=Q9wIlKLM+CNUtWzxT6gd4Z/Djk4QJBOdsGbEhODKb0E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UnvB3JXylKn64nCIx7cftMTfc9O33u7Q5A5X/YfVnJEE0FueN7FRDpuR4PmYUFqgbcuA02kNwbW78Njaof/cEI605ts9l1myaDnLE2B6HzOEn/6KbdpMbwrP0r/H5Pe7dTtclT46+R0faOrRvIPPvppvW4oHt4BPy/5zssflHh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::223])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id 84CB4582D0E
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 15:37:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1A4DB20CF1;
	Wed,  7 Oct 2026 15:37:29 +0000 (UTC)
From: Alexandre Ghiti <alex@ghiti.fr>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Yosry Ahmed <yosry@kernel.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Christoph Hellwig <hch@lst.de>,
	Chris Li <chrisl@kernel.org>,
	Kairui Song <kasong@tencent.com>
Subject: [PATCH 2/2] mm/zswap: plug the writeback IO of an LRU walk
Date: Wed,  7 Oct 2026 17:34:44 +0200
Message-ID: <20261007153507.50715-3-alex@ghiti.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007153507.50715-1-alex@ghiti.fr>
References: <20261007153507.50715-1-alex@ghiti.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alex@ghiti.fr
X-GND-Score: -100
X-GND-Cause: dmFkZTFMmDhzRI1VF4VJEv1Glxi0/xCf5/UsaPxWiZO6CFitpeL7iII4ozF9mAko/Y4N96ToP1F+wO9d8Cyt3n3dCOkrHN5hKkSWqaXARpt/7JbAg3TpjzCUl4KqGKKBz3AR7HIKyFjdQExErAoROeYZPqoxG1hEcCJfeu4H30zWPy7XFcsGnqc1OviNnc7t7euAQXNG1ugsMfrmgxN7Mj3vrEto5zHPM7+7sYmBN/JegeTAvN4WAi4RcHGVN7oWMt7WFFDKBlNE6uQOLfQURLf3Il6Khr5Lc5CbsnRODEDRmt1CxIN5yefsqczuun4pWuL/6FgGBOZT1eF/1ulnRaqq9f5tteWn8tLrK6aFppDTnm/3OM7T7Q51K4fqCO9z0lbowPAv3yeQaTo8V5iR4q99W3TkkXk1uJM9XE+YWD9IUg2GKfDehpPVIxQ4/cMb8JBOESskrvnLGHnIxpZGZ2EaLbhcaY0aIV0gOATHZPaDZ578vjZoOBI/E23sKBxfLuES6IAsH5/QVf5+aBdXHhIWoUh7glDv1F87yhqJ3bPQjNM5zgBUf9hhh0vDUbFW5b13dRVc36L5TqokxVwMj72wz1L9PzDGYRGh0QM2XbvCrkQDhOEzvIgMulalJwM44zmZBfsbqGwDiE4ncteoVzNakB6UK0vlYN89gGsz1cIZsd7mFA
X-GND-State: clean

zswap writeback only appends an entry to the pending bio when its slot
directly follows the previous one, and submits the pending bio
otherwise.

Plug the LRU walk so that the block layer can merge what the batch
cannot.

Kernel build (defconfig, -j4) in a 600M memory.max cgroup with the zswap
shrinker enabled, swapping to an NVMe partition with iocost enabled. It
runs alone, and next to a sibling fio random writer with 10 times its
io.weight so that iocost throttles it. Mean +- stddev, counters from the
build's cgroup:

Alone:

                                unplugged       plugged
  build time (s)                1061 +- 2     1057 +- 2   -0.4%
  write requests (k)            622 +- 34     579 +- 21   -6.8%
  pages per write request    1.30 +- 0.02  1.36 +- 0.05   +4.9%
  iocost debt (s)             14.0 +- 2.5   11.0 +- 1.7   -21.6%
  iocost wait (s)              7.7 +- 1.8    7.1 +- 1.1   -7.9%
  IO full pressure (s)        18.3 +- 1.4   17.5 +- 1.3   -4.5%

Next to the writer:

                                unplugged       plugged
  build time (s)               2188 +- 45    2104 +- 75   -3.8%
  write requests (k)            594 +- 21     567 +- 24   -4.6%
  pages per write request    1.30 +- 0.01  1.35 +- 0.02   +3.6%
  iocost debt (s)               648 +- 22     645 +- 29   -0.5%
  iocost wait (s)               624 +- 23     633 +- 29   +1.5%
  IO full pressure (s)          615 +- 31     550 +- 44   -10.6%

Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
---
 mm/zswap.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/mm/zswap.c b/mm/zswap.c
index 698fb74c5d47..39c4d891cc86 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -20,6 +20,7 @@
 #include <linux/spinlock.h>
 #include <linux/types.h>
 #include <linux/atomic.h>
+#include <linux/blkdev.h>
 #include <linux/swap_ops.h>
 #include <linux/crypto.h>
 #include <linux/scatterlist.h>
@@ -1225,6 +1226,7 @@ static unsigned long zswap_shrinker_scan(struct shrinker *shrinker,
 		.encountered_page_in_swapcache = &encountered_page_in_swapcache,
 	};
 	unsigned long shrink_ret;
+	struct blk_plug plug;
 
 	if (!zswap_shrinker_enabled ||
 			!mem_cgroup_zswap_writeback_enabled(sc->memcg)) {
@@ -1232,10 +1234,12 @@ static unsigned long zswap_shrinker_scan(struct shrinker *shrinker,
 		return SHRINK_STOP;
 	}
 
+	blk_start_plug(&plug);
 	shrink_ret = list_lru_shrink_walk(&zswap_list_lru, sc, &shrink_memcg_cb,
 		&ctl);
 
 	swap_write_submit(&ctl.io_ctx);
+	blk_finish_plug(&plug);
 
 	if (encountered_page_in_swapcache)
 		return SHRINK_STOP;
@@ -1343,6 +1347,7 @@ static int shrink_memcg(struct mem_cgroup *memcg)
 {
 	struct zswap_shrink_ctl ctl = {};
 	int nid, shrunk = 0, scanned = 0;
+	struct blk_plug plug;
 
 	if (!mem_cgroup_zswap_writeback_enabled(memcg))
 		return -ENOENT;
@@ -1354,6 +1359,7 @@ static int shrink_memcg(struct mem_cgroup *memcg)
 	if (memcg && !mem_cgroup_online(memcg))
 		return -ENOENT;
 
+	blk_start_plug(&plug);
 	for_each_node_state(nid, N_NORMAL_MEMORY) {
 		unsigned long nr_to_walk = SWAP_CLUSTER_MAX;
 
@@ -1363,6 +1369,7 @@ static int shrink_memcg(struct mem_cgroup *memcg)
 	}
 
 	swap_write_submit(&ctl.io_ctx);
+	blk_finish_plug(&plug);
 
 	/* Nothing was scanned: every LRU under @memcg was empty. */
 	if (!scanned)
-- 
2.53.0-Meta

