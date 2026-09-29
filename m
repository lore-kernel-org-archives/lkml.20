Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1F638F633
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790666996; cv=none; b=RaoT0ZW4ryHsdZW2tZSWrFQNShcsUH8Nqr3JND0FHb3fvRK5xfxH7MDACp1X594Nx0XIKbFa2F7iC/WQLJFizvQe5nO5PEPz1viHeJBVnEnCcFxNCoVYyYrZNVOp1reIGyk2GnHFx+fsXLmAWUr/4r6CGk9QoX/OnDkI/wNscj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790666996; c=relaxed/simple;
	bh=OdL/amrSvKC3FRqn+lmZ/66LH4WmXOAFtwPqIADeYho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fmNEX8BecvcE5YM52e8ubEBzV14+1ioSwax4ERnk4FoikZ56Tlt6iYbuw2cRqVtIecH7QGR0CsTUgB8daFbSRXl/Czz8LF5isXz9QzJbcOuEb9fqqG9/ON9qzEcoPUkYIKMwBumsd7Q1le98KYRj7FfTttyLD3VVZEbOy5uF7qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PSDDnByz; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PSDDnByz"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a0d31bda43so2169045a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 00:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790666994; x=1791271794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HkVEvCwBFSD+W3euASn7zHWOE+J/lSbgnnUAa5Z+5iw=;
        b=PSDDnByza8KjPly/st3bh7HlUT/o3otstSZPWSAx3aLL3bubAsy3LySbzehDEZq+Xk
         00BIHunzEU2AUSMQLfqXKY/vp17bGY+UZyTqQoN04TXDU+YYXeiF30I/9ar+uirddKB0
         qXiL9KbBD++FWAbwR0ZnsQvRzTj9XCN9fP+jogk8i8jWaqeggeBwVTTyXOgaPzfsS8/h
         EPkXCcxFltGRhHjZ3Q9/fdhu4UvegazWep88M/Bt/1qeer6lxH3118m7adm419nKkM5w
         jKzMrxyPzAyCjw4gzsi68dHmrUu9qoQfsTC4N/P3GT8xfYBH07221jsvqH84hV2H9Hk5
         iPfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790666994; x=1791271794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HkVEvCwBFSD+W3euASn7zHWOE+J/lSbgnnUAa5Z+5iw=;
        b=b/BswvZkNFgy5jPv5lpvSCnP9fYH/hg0t8pkNHQZv09SBMjmtllwZtMwU3Ff9TcrXm
         YEKCgV4KgjkpbhJUaKRQo1++oJZQFHGw2sjmjRbCAIL3uN5bOhdMDxGfoaigLqSrL+LR
         Jd5BndyMxKrEwdSJfPF+HHxTZ0D67VDVLiZ95ALLaW6ZherT+jL4T9V/r/aDWgqw1R85
         qD2KRaBqKfsVD/PlXTYkk9EUq3BZbVYNHaM8MZ5nmniAvKrTa/Nh7BG1xKaGFpDjS5zQ
         q2gJaUPIIm0ILdVB8YF5HHTKNROq9oylrmXraqHQV+hLB48wHWBXXcx/j2oaz0mKWYZ5
         i6kQ==
X-Forwarded-Encrypted: i=1; AKwUvBz4uGpurxIRwESUFNXSpOBcRa8kWAV1PvWZm67g+u3gl2H65VtiEhgbyv7C6dBM9RaHlajiB43Ustp+GPs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3kfwjoXMVpMIn6YGnaoT9SFIGyhAQPt5eOBCmZB7kc8UMbsbs
	W5EyN940NPg7VFcUmPudI9L4pgv6MqLX8FCDxTAkKD+n0/vVZ5IjqzmZ
X-Gm-Gg: AYBFou1xyWU/Y2w+SyUhfGXfnAVDTbTFxzOKr8MVxflohuFVu2wcqSl3UUpcJ3v7FB3
	AnhSztNI47dBogm75jcvwRk4tAzlenHS7QTI12TqizQLofEzEYAc3ziY2FOgzLmzuxpc6cXf75A
	nwm720lrZ8wtF28fCgz9zordGNHmjs22L2iMey23EXokTbBZDOyuEzO4GTtpRuWwwg87+A4p7y3
	G6dNbyJ5vM7fC7xm7OqiQK/cX3AYTQQRWmk9G/CtjohApWdl2hNXJYL49SNVDH0RQs8pHLcBe4q
	gBR45rRqOMkd9okF7YoYQ04KU4HlAak+gP1i40Ys1aiNcpTMgrZGuG7RWdhKYSULPrwdPLu0gKF
	T7yXFLHX1Fv3mQLBfI2Be7WQxzg8FaYQWBUDXFeCcrfmv8RmaxaYWCltL2fAdEZKr5Qk0fpuObK
	dNdW15q5udleLMEXK4DvCojSfOYywGl7wvNe4MpWgbzTsQTIVOFzHJLvlVG/5Cxqdd3A0sP2yRU
	ujyddvtx5sJAYIAUbp8OejW/J6jPz+6Jjw=
X-Received: by 2002:a17:90b:5705:b0:3a2:ae7f:4f07 with SMTP id 98e67ed59e1d1-3a2ae7f51abmr4935319a91.55.1790666993964;
        Tue, 29 Sep 2026 00:29:53 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a49804220fsm3900170a91.12.2026.09.29.00.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 00:29:53 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: Barry Song <baohua@kernel.org>,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Wenjie Qi <qiwenjie@xiaomi.com>
Subject: [RFC PATCH 6/6] f2fs: give referenced node cache entries a shared second chance
Date: Tue, 29 Sep 2026 15:29:19 +0800
Message-ID: <2c3b08138728fb341b4f91ea128cb43975e6ee0a.1790665952.git.qiwenjie@xiaomi.com>
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

The shrinker already gives a referenced cache entry a second chance by
clearing REFERENCED and moving it to the queue tail. The compression worker
only skips such entries, so it can revisit the same referenced prefix on
every pass.

Use the same clear-and-move rule in both paths. The worker records the
original raw-list tail so entries moved during a pass are not visited again
in that pass.

If an access races with compression after candidate collection, discard
the temporary compressed object and give the raw entry the same second
chance.

Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
---
 fs/f2fs/cache.c               | 15 ++++++++++++---
 fs/f2fs/cache.h               |  3 +++
 fs/f2fs/debug.c               |  4 ++--
 fs/f2fs/node_cache_compress.c | 36 ++++++++++++++++++++++++++---------
 fs/f2fs/node_cache_compress.h |  1 +
 5 files changed, 45 insertions(+), 14 deletions(-)

diff --git a/fs/f2fs/cache.c b/fs/f2fs/cache.c
index b3158f4ab45c..2b0a6eccd3af 100644
--- a/fs/f2fs/cache.c
+++ b/fs/f2fs/cache.c
@@ -60,6 +60,17 @@ void f2fs_cache_update_tag(struct f2fs_cached_block *entry,
 	spin_unlock_irqrestore(&cache->tree_lock, flags);
 }
 
+bool f2fs_cache_clear_referenced_and_move(struct f2fs_cached_block_list *cache,
+					  struct list_head *head,
+					  struct f2fs_cached_block *entry)
+{
+	lockdep_assert_held(&cache->list_lock);
+	if (!f2fs_cache_test_and_clear_referenced(entry))
+		return false;
+	list_move_tail(&entry->list, head);
+	return true;
+}
+
 bool f2fs_mark_cache_dirty(struct f2fs_cached_block *entry)
 {
 	struct f2fs_cached_block_list *cache = entry->cache;
@@ -594,10 +605,8 @@ f2fs_shrink_cache_list(struct f2fs_cached_block_list *cache,
 		scanned++;
 
 		/* If accessed, give it a second chance to rotate to tail */
-		if (f2fs_cache_test_and_clear_referenced(entry)) {
-			list_move_tail(&entry->list, head);
+		if (f2fs_cache_clear_referenced_and_move(cache, head, entry))
 			continue;
-		}
 
 		if (f2fs_cache_test_dirty(entry) ||
 		    f2fs_cache_test_writeback(entry) ||
diff --git a/fs/f2fs/cache.h b/fs/f2fs/cache.h
index 3c1fdc7894b7..8acbbbaf897d 100644
--- a/fs/f2fs/cache.h
+++ b/fs/f2fs/cache.h
@@ -232,6 +232,9 @@ void f2fs_cache_wait_writeback_cond(struct f2fs_cached_block *entry,
 void f2fs_cache_wait_writeback(struct f2fs_cached_block *entry);
 void f2fs_cache_update_tag(struct f2fs_cached_block *entry,
 		unsigned int clear_from, unsigned int set_to);
+bool f2fs_cache_clear_referenced_and_move(struct f2fs_cached_block_list *cache,
+					  struct list_head *head,
+					  struct f2fs_cached_block *entry);
 struct f2fs_cached_block *f2fs_grab_cache(struct f2fs_cached_block_list *cache,
 				unsigned long index, int flags);
 void f2fs_truncate_locked_cache(struct f2fs_cached_block *entry,
diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index 984fed727a48..8625dccc2131 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -728,9 +728,9 @@ static int stat_show(struct seq_file *s, void *v)
 				nc.payload[0], nc.payload[1], nc.payload[2],
 				nc.slots[0], nc.slots[1], nc.slots[2]);
 			seq_printf(s,
-				   "NCWorker: cycles=%llu visited=%llu candidates=%llu attempts=%llu converted=%llu candidate_refs=%llu transient=%llu alloc_fail=%llu\n",
+				   "NCWorker: cycles=%llu visited=%llu candidates=%llu attempts=%llu converted=%llu referenced_moved=%llu candidate_refs=%llu transient=%llu alloc_fail=%llu\n",
 				nc.cycles, nc.visited, nc.candidates, nc.attempts,
-				nc.converted, nc.candidate_refs,
+				nc.converted, nc.referenced_moved, nc.candidate_refs,
 				nc.transient_extra_bytes, nc.allocation_failures);
 			seq_printf(s,
 				   "NCRestore: compressed_to_raw=%llu restored_hits=%llu restore_failures=%llu\n",
diff --git a/fs/f2fs/node_cache_compress.c b/fs/f2fs/node_cache_compress.c
index 6e474fea7241..cf13110b2961 100644
--- a/fs/f2fs/node_cache_compress.c
+++ b/fs/f2fs/node_cache_compress.c
@@ -147,6 +147,7 @@ struct f2fs_nc_ctx {
 	atomic64_t candidate_count;
 	atomic64_t attempts;
 	atomic64_t converted;
+	atomic64_t referenced_moved;
 	atomic64_t candidate_refs;
 	atomic64_t transient_extra_bytes;
 	atomic64_t allocation_failures;
@@ -574,7 +575,6 @@ static bool f2fs_nc_candidate(struct f2fs_cached_block *entry,
 		!f2fs_cache_test_dirty(entry) &&
 		!f2fs_cache_test_writeback(entry) &&
 		!f2fs_cache_test_locked(entry) &&
-		!f2fs_cache_test_referenced(entry) &&
 		!f2fs_cache_test_incompressible(entry) &&
 		atomic_read(&entry->refcount) == refs;
 }
@@ -601,6 +601,7 @@ f2fs_nc_compress(struct f2fs_cached_block *entry,
 	u32 crc;
 	int bucket;
 	int len;
+	bool referenced;
 
 	if (!cache || !IS_NODE_CACHE(cache) || !cfg ||
 	    f2fs_cache_test_compressed(entry))
@@ -654,9 +655,14 @@ f2fs_nc_compress(struct f2fs_cached_block *entry,
 
 	spin_lock(&cache->list_lock);
 	spin_lock_irqsave(&cache->tree_lock, flags);
+	referenced = f2fs_cache_test_referenced(entry);
+	/* A concurrent access wins; rotate the entry and discard this result. */
+	if (referenced && entry->cache == cache &&
+	    f2fs_cache_clear_referenced_and_move(cache, &cache->lru_list, entry))
+		atomic64_inc(&ctx->referenced_moved);
 	if (entry->cache != cache || entry->data != raw ||
 	    atomic_read(&entry->refcount) != 2 || f2fs_cp_error(sbi) ||
-	    f2fs_cache_test_referenced(entry) ||
+	    referenced ||
 	    !f2fs_cache_test_uptodate(entry) || f2fs_cache_test_dirty(entry) ||
 	    f2fs_cache_test_writeback(entry) ||
 	    f2fs_cache_test_incompressible(entry)) {
@@ -693,7 +699,7 @@ void f2fs_nc_run(struct f2fs_sb_info *sbi)
 	struct f2fs_nc_ctx *ctx = sbi->node_compress;
 	struct f2fs_cached_block_list *cache = NODE_CACHE(sbi);
 	struct f2fs_nc_config cfg;
-	struct f2fs_cached_block *entry;
+	struct f2fs_cached_block *entry, *next, *scan_tail;
 	unsigned long flags;
 	u64 now_ms;
 	unsigned long raw_population;
@@ -714,15 +720,26 @@ void f2fs_nc_run(struct f2fs_sb_info *sbi)
 		goto out;
 
 	spin_lock(&cache->list_lock);
-	list_for_each_entry(entry, &cache->lru_list, list) {
+	/* Do not revisit entries rotated to the tail during this pass. */
+	scan_tail = list_empty(&cache->lru_list) ? NULL :
+		list_last_entry(&cache->lru_list, struct f2fs_cached_block, list);
+	list_for_each_entry_safe(entry, next, &cache->lru_list, list) {
 		if (visited == goal || count == F2FS_NC_MAX_CANDIDATES)
 			break;
 		visited++;
-		if (!f2fs_nc_candidate(entry, cache, 1))
-			continue;
-		f2fs_cache_get(entry);
-		ctx->candidates[count++] = entry;
-		atomic64_inc(&ctx->candidate_refs);
+		if (f2fs_nc_candidate(entry, cache, 1)) {
+			if (f2fs_cache_clear_referenced_and_move(cache,
+								 &cache->lru_list,
+								 entry)) {
+				atomic64_inc(&ctx->referenced_moved);
+			} else {
+				f2fs_cache_get(entry);
+				ctx->candidates[count++] = entry;
+				atomic64_inc(&ctx->candidate_refs);
+			}
+		}
+		if (entry == scan_tail)
+			break;
 	}
 	spin_unlock(&cache->list_lock);
 	atomic64_add(visited, &ctx->visited);
@@ -890,6 +907,7 @@ void f2fs_nc_get_stats(struct f2fs_sb_info *sbi,
 	stats->candidates = atomic64_read(&ctx->candidate_count);
 	stats->attempts = atomic64_read(&ctx->attempts);
 	stats->converted = atomic64_read(&ctx->converted);
+	stats->referenced_moved = atomic64_read(&ctx->referenced_moved);
 	stats->candidate_refs = atomic64_read(&ctx->candidate_refs);
 	stats->transient_extra_bytes =
 		atomic64_read(&ctx->transient_extra_bytes);
diff --git a/fs/f2fs/node_cache_compress.h b/fs/f2fs/node_cache_compress.h
index efe2eceef352..542093f2eca7 100644
--- a/fs/f2fs/node_cache_compress.h
+++ b/fs/f2fs/node_cache_compress.h
@@ -31,6 +31,7 @@ struct f2fs_nc_stats {
 	u64 candidates;
 	u64 attempts;
 	u64 converted;
+	u64 referenced_moved;
 	u64 candidate_refs;		/* Worker-held references right now. */
 	u64 transient_extra_bytes;	/* Temporary raw/compressed overlap. */
 	u64 allocation_failures;
-- 
2.43.0

