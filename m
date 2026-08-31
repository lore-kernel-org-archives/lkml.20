Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA6A3AAF5E
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 03:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788147167; cv=none; b=u/qXosdtZFAU0McPwheNeAFfGQ994TMR7+sxN+DbD9tUSNguvlP+7r4w4uymYf0d5plUAS5IfNy9Hdfb69M/FWuoCpDSEnsvIVX0+2Rn1ElZkOXSW0YTPW3Nq31DRBv6SMboGVoEbmfm8MBYzjwmlWSZI70DiRbAU/IIr50nWno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788147167; c=relaxed/simple;
	bh=z8L+pV/hH2yzx87WKF0Uixgwy89GfPxkJ+wXv8SsqmY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=BztUHmAPAeehmMruRjwS6sIo1gprQfLKByiOEy95g4B53wpaYdbxuRVCnPJY87mHXU6bdUStrYo9mb2u/epx6/BUicFoaMYBcwUBcejrSmu6Uw3WBrn6YJY3AgV1ps+NiGgNwIwwv4/BSF2MgGPOKrKIBWAsM6OBHw6+6VDt+4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qLMvd7cr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qLMvd7cr"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E0C5DC2BCC7;
	Mon, 31 Aug 2026 03:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788147166;
	bh=z8L+pV/hH2yzx87WKF0Uixgwy89GfPxkJ+wXv8SsqmY=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=qLMvd7cre985k+4NvgElFw9zA5qTUZ3gJ7OOxBpQzN79J8OqUhnwaMTAGQT+i1ZeK
	 q8mm+1oPOmHuy0UAFXpnv2SQQ7KCTZ7/toc6iyf25q+kgaTV/oR5MG2udV8wz1N0Ys
	 MASAPJYS4Y+umr5x3VKTE+OBRR7025TiZXNMLyHY0GreB1lt2Ebvt2RjF8DEyOeMim
	 +6qv7ywNf+PviTZEb16OgjGYCGZ2IUf2CkrjM8FSezxAZG/TThVv4BIDWUGitd7EmU
	 dGt3k/8THQoy6gXffEGME5jtGYfDz08kjLD7r6e5UxKOMXQpZ1EHhJz1oYuLjU2VLF
	 9iFgLnaP1/mKw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA745C61DF0;
	Mon, 31 Aug 2026 03:32:45 +0000 (UTC)
From: Bingfang Guo via B4 Relay <devnull+bingfangguo.tencent.com@kernel.org>
Date: Mon, 31 Aug 2026 11:32:43 +0800
Subject: [PATCH] mm/memcg: clear folio memcg after changing per memcg stats
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-memcg-swapcache-stats-fix-v1-1-1c0819ebdb86@tencent.com>
X-B4-Tracking: v=1; b=H4sIANr1lGoC/x2MQQqEQAwEvyI5G9ARRPzK4iHGHs1BVyaigvj3H
 fZYBVUPOZLBqS8eSjjN7btlqMuCdJFtBtuUmUIV2qoLHa9YdWa/ZFfRBeyHHM7Rbq5HIDaTNhJ
 Hyv2ekPX//Rne9we/XHqtawAAAA==
To: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
 Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
 Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, 
 Barry Song <baohua@kernel.org>, Youngjun Park <youngjun.park@lge.com>, 
 Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
 Wei Xu <weixugc@google.com>, Johannes Weiner <hannes@cmpxchg.org>, 
 David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, Bingfang Guo <bfguo@icloud.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Bingfang Guo <bingfangguo@tencent.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788147164; l=7052;
 i=bingfangguo@tencent.com; s=20260812; h=from:subject:message-id;
 bh=DPpRbQF86jYJoz6ub5OV8sLTgDaDKPnnRudDq0rAReQ=;
 b=zdD0Y+JBfYx/Li1nXRK9QYFn2esdFWxR2b4tKB6Ehp1OZUhY7RVBNUJhFflzjvNUonSp1jdqU
 amyjT2ckU8pALozhOYwFSqG6RkdKQbYqJAxnHvwTbAKcGihbMDLjsmy
X-Developer-Key: i=bingfangguo@tencent.com; a=ed25519;
 pk=q7u9S7d5e7VijWrYF9O+vv9/XvqWduVGtwGtuCObAHE=
X-Endpoint-Received: by B4 Relay for bingfangguo@tencent.com/20260812 with
 auth_id=942
X-Original-From: Bingfang Guo <bingfangguo@tencent.com>
Reply-To: bingfangguo@tencent.com

From: Bingfang Guo <bingfangguo@tencent.com>

__memcg1_swapout() transfers the memsw charge of a folio to its swap
entry and clears folio->memcg_data as part of that.  In the vmscan
swapout path it runs before __swap_cache_del_folio(), which then
decrements the swapcache stats through lruvec_stat_mod_folio().  Since
folio->memcg_data has already been cleared, folio_memcg() returns NULL
and the NR_SWAPCACHE decrement only updates the node-level counter
instead of the memcg's lruvec, leaking the per-memcg swapcache count.

Move the __memcg1_swapout() call into __swap_cache_del_folio(), after
the NR_FILE_PAGES and NR_SWAPCACHE updates but before
__swap_cache_do_del_folio() removes the folio from the swap cache.  This
keeps the stats attributed to the folio's memcg while still recording
the swap cgroup with a valid folio->swap.  Add a swapout parameter so
the plain swap_cache_del_folio() path is left unchanged.

Fixes: b197d41462c20 ("mm/memcg, swap: store cgroup id in cluster table directly")
Signed-off-by: Bingfang Guo <bingfangguo@tencent.com>
---
The problem is reproducible using the following script and program:

```
#!/bin/bash
set -e

CG=/sys/fs/cgroup/memory/swapcache-leak-test
SIZE=$((256 * 1024 * 1024))   # 256 MiB of anon memory

[ "$(id -u)" -eq 0 ] || { echo "must run as root"; exit 1; }
grep -q . /proc/swaps <<<"$(tail -n +2 /proc/swaps)" || { echo "no swap active; run: swapon <dev>"; exit 1; }

cleanup() { rmdir "$CG" 2>/dev/null || true; }
trap cleanup EXIT

cc -O2 swapout.c -o swapout

mkdir -p "$CG"
echo "+memory" > /sys/fs/cgroup/cgroup.subtree_control 2>/dev/null || true

echo "== before reclaim =="
grep -E '^(swapcached|anon) ' "$CG/memory.stat"

# Put ourselves in the cgroup, allocate & touch anon memory, then wait to be reclaimed.
(
        echo $BASHPID > "$CG/cgroup.procs"
        # Allocate and dirty SIZE bytes of anonymous memory.
        ./swapout
) &
WORKER=$!
sleep 2

echo "== after reclaim (swap cache should drain to ~0) =="
grep -E '^(swapcached|anon) ' "$CG/memory.stat"

SWAPCACHED=$(awk '/^swapcached /{print $2}' "$CG/memory.stat")
echo
if [ "$SWAPCACHED" -gt $((1024 * 1024)) ]; then
        echo "LEAK DETECTED: swapcached = $SWAPCACHED bytes (expected ~0)  [BUGGY kernel]"
        RC=1
else
        echo "OK: swapcached = $SWAPCACHED bytes  [FIXED kernel]"
        RC=0
fi

kill "$WORKER" 2>/dev/null || true
wait "$WORKER" 2>/dev/null || true
exit $RC
```

swapout.c:
```
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/mman.h>

int main(int argc, char **argv)
{
        size_t mib = (argc > 1) ? strtoul(argv[1], NULL, 10) : 256;
        size_t size = mib * 1024UL * 1024UL;
        long page = sysconf(_SC_PAGESIZE);
        char *buf;
        size_t i;

        buf = mmap(NULL, size, PROT_READ | PROT_WRITE,
                   MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
        if (buf == MAP_FAILED) {
                perror("mmap");
                return 1;
        }

        /* Fault in and dirty every page so it becomes reclaimable anon. */
        for (i = 0; i < size; i += page)
                buf[i] = 1;

        printf("allocated and dirtied %zu MiB, paging out...\n", mib);

        /* Force the whole range out to swap. */
        if (madvise(buf, size, MADV_PAGEOUT)) {
                perror("madvise(MADV_PAGEOUT)");
                return 1;
        }

        /* Give reclaim a moment, then stay alive so the cgroup can be inspected. */
        printf("paged out; sleeping so memory.stat can be read. pid=%d\n", getpid());
        sleep(30);

        munmap(buf, size);
        return 0;
}
```

Test result:

before:
```
== before reclaim ==
swapcached 0
allocated and dirtied 256 MiB, paging out...
paged out; sleeping so memory.stat can be read. pid=4778
== after reclaim (swap cache should drain to ~0) ==
swapcached 268435456

LEAK DETECTED: swapcached = 268435456 bytes (expected ~0)  [BUGGY kernel]
```

after the patch:
```
== before reclaim ==
swapcached 0
allocated and dirtied 256 MiB, paging out...
paged out; sleeping so memory.stat can be read. pid=2601
== after reclaim (swap cache should drain to ~0) ==
swapcached 0

OK: swapcached = 0 bytes  [FIXED kernel]
```
---
 mm/swap.h       |  3 ++-
 mm/swap_state.c | 10 +++++++---
 mm/vmscan.c     |  3 +--
 3 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/mm/swap.h b/mm/swap.h
index 90a551a88df63..c5a49b0ed3430 100644
--- a/mm/swap.h
+++ b/mm/swap.h
@@ -319,7 +319,8 @@ struct folio *swap_cache_alloc_folio(swp_entry_t target_entry, gfp_t gfp_mask,
 void __swap_cache_add_folio(struct swap_cluster_info *ci,
 			    struct folio *folio, swp_entry_t entry);
 void __swap_cache_del_folio(struct swap_cluster_info *ci,
-			    struct folio *folio, swp_entry_t entry, void *shadow);
+			    struct folio *folio, swp_entry_t entry, void *shadow,
+			    bool swapout);
 void __swap_cache_replace_folio(struct swap_cluster_info *ci,
 				struct folio *old, struct folio *new);
 
diff --git a/mm/swap_state.c b/mm/swap_state.c
index f3961fdd857dc..825e623b03d16 100644
--- a/mm/swap_state.c
+++ b/mm/swap_state.c
@@ -314,13 +314,17 @@ static void __swap_cache_do_del_folio(struct swap_cluster_info *ci,
  * using the index of @entry, and lock the cluster that holds the entries.
  */
 void __swap_cache_del_folio(struct swap_cluster_info *ci, struct folio *folio,
-			    swp_entry_t entry, void *shadow)
+			    swp_entry_t entry, void *shadow, bool swapout)
 {
 	unsigned long nr_pages = folio_nr_pages(folio);
 
-	__swap_cache_do_del_folio(ci, folio, entry, shadow);
 	node_stat_mod_folio(folio, NR_FILE_PAGES, -nr_pages);
 	lruvec_stat_mod_folio(folio, NR_SWAPCACHE, -nr_pages);
+
+	if (swapout)
+		__memcg1_swapout(folio, ci);
+
+	__swap_cache_do_del_folio(ci, folio, entry, shadow);
 }
 
 /**
@@ -339,7 +343,7 @@ void swap_cache_del_folio(struct folio *folio)
 	swp_entry_t entry = folio->swap;
 
 	ci = swap_cluster_lock(__swap_entry_to_info(entry), swp_offset(entry));
-	__swap_cache_del_folio(ci, folio, entry, NULL);
+	__swap_cache_del_folio(ci, folio, entry, NULL, false);
 	swap_cluster_unlock(ci);
 
 	folio_ref_sub(folio, folio_nr_pages(folio));
diff --git a/mm/vmscan.c b/mm/vmscan.c
index f11491ee9ed5c..17ab01693ae8d 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -735,8 +735,7 @@ static int __remove_mapping(struct address_space *mapping, struct folio *folio,
 
 		if (reclaimed && !mapping_exiting(mapping))
 			shadow = workingset_eviction(folio, target_memcg);
-		__memcg1_swapout(folio, ci);
-		__swap_cache_del_folio(ci, folio, swap, shadow);
+		__swap_cache_del_folio(ci, folio, swap, shadow, true);
 		swap_cluster_unlock_irq(ci);
 	} else {
 		void (*free_folio)(struct folio *);

---
base-commit: 42d64d4fef83a241c919c8693fdf0a21b2cb6061
change-id: 20260828-memcg-swapcache-stats-fix-1beef3dc3afb

Best regards,
-- 
Bingfang Guo <bingfangguo@tencent.com>


