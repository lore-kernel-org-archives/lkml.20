Received: from mail-pj2-f39.google.com (mail-pj2-f39.google.com [74.125.227.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2352738D40C
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790666983; cv=none; b=eCaZ2YQox0t9kQzKJX5YZq500q+alQqBR72DQ07QItgx7BZSuTxJT3IBgcx/9XIInfEGu5kPIqYGMeXdKoJDJRbFgU4djzAupnDyeajPNxBWVAq9UzByL3zinnCwKllQcmBstpr4UE/LJCBAeZKkC9qOIxQHwMEXxqj1gQ8NxJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790666983; c=relaxed/simple;
	bh=nyBxzWit/FZxtQtLQ2nzI7Skx08Wa57czwusGnteXpc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DC/uaGafEgoevk+rCN+L3qWbIrgI2mhb7LKGQQbXXu0f1DfNssYB64F/OOePWd7KTQNQebpOsYr7Lt3czue68ERxBbAhIqrljaMKIwx4dXj8zEg0zPTMjSEJvkCaRp2WaFsK/Xmc+GQhiu+zmE7cQRu7pSZjP6qDtogjLL8tWJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V+HX32SQ; arc=none smtp.client-ip=74.125.227.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V+HX32SQ"
Received: by mail-pj2-f39.google.com with SMTP id 98e67ed59e1d1-3a49b6bb21eso359917a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 00:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790666980; x=1791271780; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uDcPJ5rPxpj2kohFB81D4sNWuW7eNzDOVVFI71Bh/Co=;
        b=V+HX32SQpxsPAUKMHsyvTzHfKzTHrSji9HMuwKpBy6p6B9MXbmD0d5/tKn/Lgkf0uS
         aqKqOzbPeB+EWZzh0j54ukcLmGp/+LeaOs3/jCyIekAprX8nbOrpOSaLvqioFfKo10Us
         FzqPNBZAiBABXcXR6wGmi239AZlJb1bgETkxUaCKRWL5F70ZbX7PVtGdESijZwh8CidE
         EuioakgJG3d6xwxwkiZtiH50tRMxNaSReanqRG43Deoefl9f0qE+2+epJIZKMWq2Y2ZT
         kgHgmEUgJ2N5IbqJsZ9YmfbQEOasFQHkSCK7YV44+JJnikhF1sniU9afXdEt+qh0KZHz
         5wvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790666980; x=1791271780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uDcPJ5rPxpj2kohFB81D4sNWuW7eNzDOVVFI71Bh/Co=;
        b=1IXzUKPoJxPOsekjSW6FBHTE/NJfxJ+rcof2QL8h1WAZ1YfIhcsh9ieRkuP0oAVlSU
         b1eFI9oz6WFPNNpZMcOZtouYLSHofwTHg2Z45Vb93kBOfMa9kiEbxQYemGFx/3XbEWij
         UqNiWw90oRZemzcZWJ//R+UajFCkInhmYzxe5vC7oBdMV+HtEKiGxglrxqFgU98OtxUC
         1pptwpXyFx+gu5KwPUzHpQD2+/NcZBg8VyfybmdRGt0klEFediE37g0TDlQXkoFz6A0o
         DOXhUhuK/1fnbShuvHcmgAHc4ZIC+6y0JWJ6+R9GOBDJgMRmxoAmRzjYisgvC3pP5JJD
         T60A==
X-Forwarded-Encrypted: i=1; AKwUvBwARr9/idcD/gaFfeYqTAPOOxrg4+hgg1T+VONyyJsChwinGVAPdqXU5RdMpaRpX66rSu7T+LDdzKAPTRY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIGrOEFZQdpRzDJKZQZ9gfp9WhHecAyTNoaadcenqebaAsjUc+H
	U/69kfpU7FgmbLWXn8r1Pj/CvWWGnzDrB8MNEZp9AM7OfwZk++hRxt88
X-Gm-Gg: AYBFou219VhdxV7mnY4d1MK2WpkJNa81OIpgxnhwXz+rMaQQDzDroMmE2yZolaqhiN6
	NS2eVK5d7AF3LxBZbqWzij3XMt4QLJUC/DXStTeeTMsOvy52286y2pF9fVCkWXqztfRd2fzh9e5
	1+07n35N/AWan9HQN1vQuNaKej7TF3ru05tC8L16+t62UFP2scELLvAxIgxJoE0URMv3e2QyZVY
	IzNxjgoMqdYlp+IR09jT87Z0pJ7ob5zm296wEubCwfD12vA3y8AQTI9BYap0fdE2RLkSlVWwmbP
	9+A9eI8i0IlyPsFtYTyYiKaqYnO59wmIgdLa/kQTo41ptREDbNdhgAVbt/nVqpaTYmNGfp1p/9U
	o0lKNYgYwNAksYP1hA5X7uiP2SflypVWRxTbj+utmKV8USESGqg+WsX5/nPXw1H91wVqtgW7r7M
	YARbExkJ3p6F3DzGXabJYSZGZ0oNxbaC6C28wIe6yrheBsmd2f+YO2xqsImPX43gsiJRWSe6IYB
	P6zBL3EEzNIRS1ymsHCnxgHadHXNlIuk68=
X-Received: by 2002:a17:90b:35c4:b0:3a2:aebf:9211 with SMTP id 98e67ed59e1d1-3a2aebf93a6mr3570966a91.15.1790666980269;
        Tue, 29 Sep 2026 00:29:40 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a49804220fsm3900170a91.12.2026.09.29.00.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 00:29:39 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: Barry Song <baohua@kernel.org>,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Wenjie Qi <qiwenjie@xiaomi.com>
Subject: [RFC PATCH 3/6] f2fs: bias node cache reclaim toward raw entries
Date: Tue, 29 Sep 2026 15:29:16 +0800
Message-ID: <e9c129c3e1670140ca3d3106b53372a40aebb372.1790665952.git.qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1790665952.git.qiwenjie@xiaomi.com>
References: <cover.1790665952.git.qiwenjie@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Raw and compressed node-cache entries have very different memory costs.
Counting every entry equally would overstate pressure from compressed
entries and reclaim them too aggressively.

Count and scan the raw and compressed queues separately. Give raw entries
their full block weight and compressed entries 25 percent of their
allocation size. Use the same weights for the shrinker count and the
per-queue scan quotas.

Carry rounding credit across shrinker calls, and redistribute unused quota
when a queue reaches its population limit. This favors reclaiming raw
entries while keeping every compressed queue reclaimable.

Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
---
 fs/f2fs/Makefile              |   1 +
 fs/f2fs/cache.c               |   2 +-
 fs/f2fs/node_cache_compress.c |  64 ++++++++++++-
 fs/f2fs/node_cache_compress.h |  15 ++++
 fs/f2fs/node_cache_policy.c   | 163 ++++++++++++++++++++++++++++++++++
 fs/f2fs/node_cache_policy.h   |   9 ++
 fs/f2fs/shrinker.c            |   3 +-
 7 files changed, 254 insertions(+), 3 deletions(-)
 create mode 100644 fs/f2fs/node_cache_policy.c

diff --git a/fs/f2fs/Makefile b/fs/f2fs/Makefile
index e1e4b98707e9..79252f510daf 100644
--- a/fs/f2fs/Makefile
+++ b/fs/f2fs/Makefile
@@ -10,4 +10,5 @@ f2fs-$(CONFIG_F2FS_FS_POSIX_ACL) += acl.o
 f2fs-$(CONFIG_FS_VERITY) += verity.o
 f2fs-$(CONFIG_F2FS_FS_COMPRESSION) += compress.o
 f2fs-$(CONFIG_F2FS_FS_NODE_CACHE_COMPRESSION) += node_cache_compress.o
+f2fs-$(CONFIG_F2FS_FS_NODE_CACHE_COMPRESSION) += node_cache_policy.o
 f2fs-$(CONFIG_F2FS_IOSTAT) += iostat.o
diff --git a/fs/f2fs/cache.c b/fs/f2fs/cache.c
index 3d1d530cdd82..480412f6c729 100644
--- a/fs/f2fs/cache.c
+++ b/fs/f2fs/cache.c
@@ -666,7 +666,7 @@ unsigned long f2fs_shrink_cache(struct f2fs_sb_info *sbi,
 	if (freed >= nr_to_scan)
 		return freed;
 
-	freed += f2fs_do_shrink_cache(NODE_CACHE(sbi), nr_to_scan - freed);
+	freed += f2fs_nc_shrink_nodes(sbi, nr_to_scan - freed);
 	if (freed >= nr_to_scan)
 		return freed;
 
diff --git a/fs/f2fs/node_cache_compress.c b/fs/f2fs/node_cache_compress.c
index 486da4ed6082..50e9c820eb81 100644
--- a/fs/f2fs/node_cache_compress.c
+++ b/fs/f2fs/node_cache_compress.c
@@ -95,8 +95,12 @@ struct f2fs_nc_ctx {
 	atomic_long_t attached[F2FS_NC_NR_QUEUES];
 	atomic64_t attached_payload[F2FS_NC_NR_QUEUES - 1];
 	atomic64_t attached_slot_bytes[F2FS_NC_NR_QUEUES - 1];
-	/* Cumulative detach statistics since mount. */
+	/* Cumulative reclaim and detach statistics since mount. */
+	atomic64_t shrink_scanned[F2FS_NC_NR_QUEUES];
+	atomic64_t shrink_freed[F2FS_NC_NR_QUEUES];
 	atomic64_t detached[F2FS_NC_NR_QUEUES];
+	/* Signed quota history carried between shrinker calls. */
+	s64 shrink_credit[F2FS_NC_NR_QUEUES];
 	/* Mount reference plus references held by compressed objects. */
 	refcount_t refs;
 };
@@ -276,6 +280,64 @@ void f2fs_nc_free_data(struct f2fs_cached_block *entry)
 	f2fs_nc_ctx_put(ctx);
 }
 
+static void f2fs_nc_population_snapshot(struct f2fs_nc_ctx *ctx,
+					unsigned long nr[F2FS_NC_NR_QUEUES])
+{
+	struct f2fs_cached_block_list *cache = NODE_CACHE(ctx->sbi);
+	unsigned int i;
+
+	spin_lock(&cache->list_lock);
+	for (i = 0; i < F2FS_NC_NR_QUEUES; i++)
+		nr[i] = atomic_long_read(&ctx->attached[i]);
+	spin_unlock(&cache->list_lock);
+}
+
+unsigned long f2fs_nc_count_nodes(struct f2fs_sb_info *sbi)
+{
+	struct f2fs_nc_ctx *ctx = sbi->node_compress;
+	unsigned long nr[F2FS_NC_NR_QUEUES];
+
+	if (!ctx)
+		return NODE_CACHE(sbi)->num_entries;
+	f2fs_nc_population_snapshot(ctx, nr);
+	return f2fs_nc_effective_count(nr, sbi->blocksize);
+}
+
+unsigned long f2fs_nc_shrink_nodes(struct f2fs_sb_info *sbi,
+				   unsigned long nr_to_scan)
+{
+	struct f2fs_cached_block_list *cache = NODE_CACHE(sbi);
+	struct f2fs_nc_ctx *ctx = sbi->node_compress;
+	unsigned long nr[F2FS_NC_NR_QUEUES];
+	unsigned long quota[F2FS_NC_NR_QUEUES];
+	unsigned long freed = 0;
+	unsigned int i;
+
+	if (!ctx)
+		return f2fs_shrink_cache_list(cache, &cache->lru_list,
+				ULONG_MAX, nr_to_scan, NULL);
+	f2fs_nc_population_snapshot(ctx, nr);
+	f2fs_nc_scan_quotas(nr, sbi->blocksize, nr_to_scan,
+			    ctx->shrink_credit, quota);
+	for (i = 0; i < F2FS_NC_NR_QUEUES; i++) {
+		struct list_head *head;
+		unsigned long scanned = 0;
+		unsigned long queue_freed;
+
+		if (!quota[i])
+			continue;
+		head = f2fs_nc_queue_head(cache, i);
+		if (!head)
+			continue;
+		queue_freed = f2fs_shrink_cache_list(cache, head, nr[i], quota[i],
+						     &scanned);
+		freed += queue_freed;
+		atomic64_add(scanned, &ctx->shrink_scanned[i]);
+		atomic64_add(queue_freed, &ctx->shrink_freed[i]);
+	}
+	return freed;
+}
+
 void f2fs_nc_memory_usage(struct f2fs_sb_info *sbi,
 			  struct f2fs_nc_memory *memory)
 {
diff --git a/fs/f2fs/node_cache_compress.h b/fs/f2fs/node_cache_compress.h
index e1a9b45d67e3..e7d6b07c1c98 100644
--- a/fs/f2fs/node_cache_compress.h
+++ b/fs/f2fs/node_cache_compress.h
@@ -34,6 +34,9 @@ struct list_head *f2fs_nc_queue_head(struct f2fs_cached_block_list *cache,
 unsigned int f2fs_nc_entry_queue(const struct f2fs_cached_block *entry);
 void f2fs_nc_entry_attached(struct f2fs_cached_block *entry);
 void f2fs_nc_entry_detached(struct f2fs_cached_block *entry);
+unsigned long f2fs_nc_count_nodes(struct f2fs_sb_info *sbi);
+unsigned long f2fs_nc_shrink_nodes(struct f2fs_sb_info *sbi,
+				   unsigned long nr_to_scan);
 void f2fs_nc_memory_usage(struct f2fs_sb_info *sbi,
 			  struct f2fs_nc_memory *memory);
 #else
@@ -66,6 +69,18 @@ f2fs_nc_entry_queue(const struct f2fs_cached_block *entry)
 static inline void f2fs_nc_entry_attached(struct f2fs_cached_block *entry) { }
 static inline void f2fs_nc_entry_detached(struct f2fs_cached_block *entry) { }
 
+static inline unsigned long f2fs_nc_count_nodes(struct f2fs_sb_info *sbi)
+{
+	return NODE_CACHE(sbi)->num_entries;
+}
+
+static inline unsigned long f2fs_nc_shrink_nodes(struct f2fs_sb_info *sbi,
+						 unsigned long nr_to_scan)
+{
+	return f2fs_shrink_cache_list(NODE_CACHE(sbi),
+			&NODE_CACHE(sbi)->lru_list, ULONG_MAX, nr_to_scan, NULL);
+}
+
 static inline void f2fs_nc_memory_usage(struct f2fs_sb_info *sbi,
 					struct f2fs_nc_memory *memory)
 {
diff --git a/fs/f2fs/node_cache_policy.c b/fs/f2fs/node_cache_policy.c
new file mode 100644
index 000000000000..3adcbf89d37d
--- /dev/null
+++ b/fs/f2fs/node_cache_policy.c
@@ -0,0 +1,163 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/math64.h>
+#include <linux/overflow.h>
+#include <linux/shrinker.h>
+#include <linux/string.h>
+
+#include "node_cache_policy.h"
+
+#define F2FS_NC_RECLAIM_SCALE_PCT	25U
+#define F2FS_NC_SCORE_HEADROOM		4U
+
+static void f2fs_nc_queue_weights(u32 blocksize,
+				  u64 weight[F2FS_NC_NR_QUEUES])
+{
+	weight[F2FS_NC_RAW] = blocksize;
+	weight[F2FS_NC_256] = F2FS_NC_BUCKET_256_SIZE *
+			F2FS_NC_RECLAIM_SCALE_PCT / F2FS_NC_PERCENT_MAX;
+	weight[F2FS_NC_512] = F2FS_NC_BUCKET_512_SIZE *
+			F2FS_NC_RECLAIM_SCALE_PCT / F2FS_NC_PERCENT_MAX;
+	weight[F2FS_NC_1024] = F2FS_NC_BUCKET_1024_SIZE *
+			F2FS_NC_RECLAIM_SCALE_PCT / F2FS_NC_PERCENT_MAX;
+}
+
+static u64 f2fs_nc_queue_mass(unsigned long nr, u64 weight,
+			      unsigned long budget)
+{
+	u64 limit;
+	u64 count;
+
+	if (!nr || !weight || !budget)
+		return 0;
+	/* Keep both the quota product and signed score arithmetic bounded. */
+	limit = min_t(u64, S64_MAX / F2FS_NC_SCORE_HEADROOM /
+			F2FS_NC_NR_QUEUES,
+			div64_u64(U64_MAX, budget));
+	if (limit < weight)
+		return 1;
+	count = min_t(u64, nr, div64_u64(limit, weight));
+	return count * weight;
+}
+
+u64 f2fs_nc_effective_count(const unsigned long nr[F2FS_NC_NR_QUEUES],
+			    u32 blocksize)
+{
+	u64 weight[F2FS_NC_NR_QUEUES];
+	u64 cap = (u64)SHRINK_EMPTY - 1;
+	u64 count = 0;
+	u64 remainder = 0;
+	u64 carry;
+	u64 carry_remainder;
+	unsigned int i;
+
+	if (!blocksize)
+		return 0;
+	f2fs_nc_queue_weights(blocksize, weight);
+	for (i = 0; i < F2FS_NC_NR_QUEUES; i++) {
+		u64 quotient, count_remainder;
+
+		quotient = mul_u64_u64_div_u64(nr[i], weight[i], blocksize);
+		if (quotient > cap - count)
+			return cap;
+		count += quotient;
+		div64_u64_rem(nr[i], blocksize, &count_remainder);
+		remainder += count_remainder * weight[i] % blocksize;
+	}
+	carry = div64_u64_rem(remainder, blocksize, &carry_remainder);
+	if (carry_remainder)
+		carry++;
+	if (carry > cap - count)
+		return cap;
+	return count + carry;
+}
+
+void f2fs_nc_scan_quotas(const unsigned long nr[F2FS_NC_NR_QUEUES],
+			 u32 blocksize, unsigned long requested,
+		s64 credit[F2FS_NC_NR_QUEUES],
+		unsigned long quota[F2FS_NC_NR_QUEUES])
+{
+	u64 weight[F2FS_NC_NR_QUEUES];
+	u64 mass[F2FS_NC_NR_QUEUES], total_mass;
+	s64 score[F2FS_NC_NR_QUEUES];
+	unsigned long population = 0, budget, assigned = 0;
+	unsigned int round, i;
+
+	memset(quota, 0, sizeof(*quota) * F2FS_NC_NR_QUEUES);
+	f2fs_nc_queue_weights(blocksize, weight);
+	for (i = 0; i < F2FS_NC_NR_QUEUES; i++) {
+		if (!nr[i] || !weight[i])
+			credit[i] = 0;
+		if (weight[i] &&
+		    check_add_overflow(population, nr[i], &population))
+			population = ULONG_MAX;
+	}
+	budget = min(requested, population);
+	if (!budget || !blocksize)
+		return;
+	total_mass = 0;
+	for (i = 0; i < F2FS_NC_NR_QUEUES; i++) {
+		mass[i] = f2fs_nc_queue_mass(nr[i], weight[i], budget);
+		total_mass += mass[i];
+	}
+	if (!total_mass)
+		return;
+	for (i = 0; i < F2FS_NC_NR_QUEUES; i++)
+		score[i] = mass[i] ? clamp_t(s64, credit[i],
+						-(s64)total_mass,
+						(s64)total_mass) : 0;
+
+	for (round = 0; round < F2FS_NC_NR_QUEUES + 1 && assigned < budget;
+	     round++) {
+		u64 active_mass = 0;
+		unsigned long before = assigned;
+		bool capped = false;
+
+		for (i = 0; i < F2FS_NC_NR_QUEUES; i++)
+			if (mass[i] && quota[i] < nr[i])
+				active_mass += mass[i];
+		if (!active_mass)
+			break;
+		for (i = 0; i < F2FS_NC_NR_QUEUES; i++) {
+			unsigned long capacity, share;
+			u64 product, quotient, remainder;
+
+			if (!mass[i] || quota[i] >= nr[i])
+				continue;
+			capacity = nr[i] - quota[i];
+			quotient = mul_u64_u64_div_u64(budget - assigned,
+						       mass[i], active_mass);
+			share = min_t(u64, quotient, capacity);
+			if (share < quotient)
+				capped = true;
+			quota[i] += share;
+			before += share;
+			product = (budget - assigned) * mass[i];
+			remainder = product - quotient * active_mass;
+			score[i] = clamp_t(s64, score[i], -(s64)active_mass,
+					   (s64)active_mass) + (s64)remainder;
+		}
+		assigned = before;
+		while (assigned < budget) {
+			unsigned int best = F2FS_NC_NR_QUEUES;
+
+			for (i = 0; i < F2FS_NC_NR_QUEUES; i++) {
+				if (!mass[i] || quota[i] >= nr[i])
+					continue;
+				if (best == F2FS_NC_NR_QUEUES ||
+				    score[i] > score[best])
+					best = i;
+			}
+			if (best == F2FS_NC_NR_QUEUES)
+				break;
+			quota[best]++;
+			score[best] -= active_mass;
+			assigned++;
+			if (capped)
+				break;
+		}
+		if (!capped || assigned == budget)
+			break;
+	}
+	for (i = 0; i < F2FS_NC_NR_QUEUES; i++)
+		credit[i] = mass[i] ? score[i] : 0;
+}
diff --git a/fs/f2fs/node_cache_policy.h b/fs/f2fs/node_cache_policy.h
index efe906bfcc58..42af4ad1698f 100644
--- a/fs/f2fs/node_cache_policy.h
+++ b/fs/f2fs/node_cache_policy.h
@@ -8,6 +8,7 @@
 #define F2FS_NC_BUCKET_512_SIZE		512U
 #define F2FS_NC_BUCKET_1024_SIZE	1024U
 #define F2FS_NC_MAX_OBJECT_SIZE		F2FS_NC_BUCKET_1024_SIZE
+#define F2FS_NC_PERCENT_MAX		100U
 
 /*
  * Keep compressed queues in the same order as f2fs_nc_bucket_sizes[].
@@ -20,4 +21,12 @@ enum f2fs_nc_queue {
 	F2FS_NC_1024,
 	F2FS_NC_NR_QUEUES,
 };
+
+u64 f2fs_nc_effective_count(const unsigned long nr[F2FS_NC_NR_QUEUES],
+			    u32 blocksize);
+void f2fs_nc_scan_quotas(const unsigned long nr[F2FS_NC_NR_QUEUES],
+			 u32 blocksize, unsigned long requested,
+		s64 credit[F2FS_NC_NR_QUEUES],
+		unsigned long quota[F2FS_NC_NR_QUEUES]);
+
 #endif /* __F2FS_NODE_CACHE_POLICY_H__ */
diff --git a/fs/f2fs/shrinker.c b/fs/f2fs/shrinker.c
index 29f488531492..a4e9e61557cc 100644
--- a/fs/f2fs/shrinker.c
+++ b/fs/f2fs/shrinker.c
@@ -11,6 +11,7 @@
 
 #include "f2fs.h"
 #include "node.h"
+#include "node_cache_compress.h"
 
 static LIST_HEAD(f2fs_list);
 static DEFINE_SPINLOCK(f2fs_list_lock);
@@ -40,7 +41,7 @@ static unsigned long __count_extent_cache(struct f2fs_sb_info *sbi,
 static unsigned long __count_cache(struct f2fs_sb_info *sbi)
 {
 	return META_CACHE(sbi)->num_entries +
-		NODE_CACHE(sbi)->num_entries +
+		f2fs_nc_count_nodes(sbi) +
 		COMPRESS_CACHE(sbi)->num_entries;
 }
 
-- 
2.43.0

