Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3DA448D01
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 07:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789630433; cv=none; b=MH4Y8BiOdzJtfRuR4hqzJTfsYkI2q0J8jWhV7vt97NInKBMb1RLOtNkZZ/IP4+kYv4mUOOedNtbdRiop8YE/sZJEyI5wCqXrHWRGJK//VPtrGda1UDlNTavf/yxPKZbysBYNO1P+1A5oKvlZsto/ve6Wr/JJyTVoXzqCCwPZcBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789630433; c=relaxed/simple;
	bh=2Z5WEuKmqK2tQMJ6QMRdJcUhErrBfxe5h3rBrMIgG90=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lFvUtzJ5q1YvMkmkKxUQOKiMg6yBb6t8R537hfUWlv3X37WR4fvh7GTtzgVu3BENhf2aFIPRJ4xX/ZtFuZ2l8JCkR80nRvtdZPOeD33QTNUgWpVEcsXp4cCmABPLzr0kxSwM1QSNciuaX+QjtC3pvkrf2xp/2taQszj70Xtgc3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KqTajJI3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KqTajJI3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A4111F00899;
	Thu, 17 Sep 2026 07:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789630432;
	bh=xJdiCXmSZu0mSK82DCg08juc5Gs/XTox6riUy+FrJWI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KqTajJI3kmHg3Xd8Sa83+4XnkgRi+Oq70NiMzsC5gCE0EF231DUJVMQKuxbfS2uTK
	 N9kuw++c1+2nk+0adMy/VbunT4INQCUn9Mw4C048Z3DPKMkmH7f8xjP7NBhrLVfsrW
	 snBOYOz8W71TmoT6QyCIY9krKK6W5eFJIwKZVz6tm+r73pEXatWiGTCNJdAYqOP8Yo
	 EiCMEkZGKpVVq+sDnCn5f4v2bT5pugcJ9NlgWl42SA/6KAshaaRo1laebfSquFO9RM
	 sJNUBWXLMHX6HZd1BXR43g3wvvnVVWff8oj/MiEs1Z5ijPHhYJ2DmrAgseHewwBPbm
	 aYQp5Deu89KBA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>,
	Zhiguo Niu <zhiguo.niu@unisoc.com>
Subject: [PATCH v9 03/12] f2fs: cache: introduce shrinker
Date: Thu, 17 Sep 2026 15:33:34 +0800
Message-ID: <20260917073343.2823157-4-chao@kernel.org>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
In-Reply-To: <20260917073343.2823157-1-chao@kernel.org>
References: <20260917073343.2823157-1-chao@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chao Yu <chao@kernel.org>

This patch integrates the metadata cache into the F2FS memory shrinker
subsystem to reclaim clean, unreferenced cached blocks under memory
pressure.

It implements f2fs_shrink_cache() using a 3-phase cache reclamin method:
1. isolate clean entries from lru list
2. truncate from radix tree under lock
3. splice un-reclaimed entries back

And hooks the new interface into f2fs_shrink_count() and f2fs_shrink_scan().

Reviewed-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/cache.c    | 89 ++++++++++++++++++++++++++++++++++++++++++++++
 fs/f2fs/cache.h    |  3 ++
 fs/f2fs/shrinker.c | 12 +++++++
 3 files changed, 104 insertions(+)

diff --git a/fs/f2fs/cache.c b/fs/f2fs/cache.c
index 4818e6077114..e571080ab266 100644
--- a/fs/f2fs/cache.c
+++ b/fs/f2fs/cache.c
@@ -539,3 +539,92 @@ void f2fs_destroy_cache(struct f2fs_cached_block_list *cache)
 	f2fs_put_cache(entry, true);
 	goto next;
 }
+
+static unsigned long f2fs_do_shrink_cache(struct f2fs_cached_block_list *cache,
+						unsigned long nr_to_scan)
+{
+	struct f2fs_cached_block *entry, *next;
+	LIST_HEAD(dispose_list);
+	LIST_HEAD(keep_list);
+	unsigned long freed = 0;
+	unsigned long scanned = 0;
+
+	/* Phase 1: Isolate candidate entries from LRU list into dispose_list */
+	spin_lock(&cache->list_lock);
+	list_for_each_entry_safe(entry, next, &cache->lru_list, list) {
+		if (scanned >= cache->num_entries)
+			break;
+		if (scanned++ >= nr_to_scan)
+			break;
+
+		/* If accessed, give it a second chance to rotate to tail */
+		if (f2fs_cache_test_and_clear_referenced(entry)) {
+			list_move_tail(&entry->list, &cache->lru_list);
+			continue;
+		}
+
+		if (f2fs_cache_test_dirty(entry) ||
+		    f2fs_cache_test_writeback(entry) ||
+		    f2fs_cache_test_locked(entry))
+			continue;
+
+		if (f2fs_cache_refcount(entry) != 1)
+			continue;
+
+		list_move_tail(&entry->list, &dispose_list);
+	}
+	spin_unlock(&cache->list_lock);
+
+	/* Phase 2: Process isolated candidates one by one */
+	while (1) {
+		spin_lock(&cache->list_lock);
+		entry = list_first_entry_or_null(&dispose_list,
+						struct f2fs_cached_block, list);
+		if (!entry) {
+			spin_unlock(&cache->list_lock);
+			break;
+		}
+		f2fs_cache_get(entry);
+		list_move_tail(&entry->list, &keep_list);
+		spin_unlock(&cache->list_lock);
+
+		if (!f2fs_trylock_cache(entry)) {
+			f2fs_put_cache(entry, false);
+			continue;
+		}
+
+		/* the entry has been truncated */
+		if (!entry->cache) {
+			f2fs_put_cache(entry, true);
+			continue;
+		}
+		/*
+		 * at least there are shrinker, radix tree and another user
+		 * has referenced the entry.
+		 */
+		if (f2fs_cache_refcount(entry) >= 3) {
+			f2fs_put_cache(entry, true);
+			continue;
+		}
+
+		f2fs_do_truncate_cache(entry, false);
+
+		if (f2fs_put_cache(entry, true))
+			freed++;
+	}
+
+	/* Phase 3: Splice un-reclaimed entries back onto cache->lru_list */
+	if (!list_empty(&keep_list)) {
+		spin_lock(&cache->list_lock);
+		list_splice_tail(&keep_list, &cache->lru_list);
+		spin_unlock(&cache->list_lock);
+	}
+
+	return freed;
+}
+
+unsigned long f2fs_shrink_cache(struct f2fs_sb_info *sbi,
+					unsigned long nr_to_scan)
+{
+	return f2fs_do_shrink_cache(META_CACHE(sbi), nr_to_scan);
+}
diff --git a/fs/f2fs/cache.h b/fs/f2fs/cache.h
index d8123a86cdf8..6c38fc9e18f6 100644
--- a/fs/f2fs/cache.h
+++ b/fs/f2fs/cache.h
@@ -202,4 +202,7 @@ void f2fs_drop_cache_range(struct f2fs_cached_block_list *cache,
 #define f2fs_truncate_meta_caches(sbi, start, len)	\
 	f2fs_drop_cache_range(META_CACHE(sbi), start, len, true)
 
+unsigned long f2fs_shrink_cache(struct f2fs_sb_info *sbi,
+				unsigned long nr_to_scan);
+
 #endif /* _LINUX_F2FS_CACHE_H */
diff --git a/fs/f2fs/shrinker.c b/fs/f2fs/shrinker.c
index e3e0a7e89406..baa09bc63585 100644
--- a/fs/f2fs/shrinker.c
+++ b/fs/f2fs/shrinker.c
@@ -37,6 +37,11 @@ static unsigned long __count_extent_cache(struct f2fs_sb_info *sbi,
 				atomic_read(&eti->total_ext_node);
 }
 
+static unsigned long __count_cache(struct f2fs_sb_info *sbi)
+{
+	return META_CACHE(sbi)->num_entries;
+}
+
 unsigned long f2fs_shrink_count(struct shrinker *shrink,
 				struct shrink_control *sc)
 {
@@ -68,6 +73,9 @@ unsigned long f2fs_shrink_count(struct shrinker *shrink,
 		/* count free nids cache entries */
 		count += __count_free_nids(sbi);
 
+		/* count generic cache entries */
+		count += __count_cache(sbi);
+
 		spin_lock(&f2fs_list_lock);
 		p = p->next;
 		mutex_unlock(&sbi->umount_mutex);
@@ -120,6 +128,10 @@ unsigned long f2fs_shrink_scan(struct shrinker *shrink,
 		if (freed < nr)
 			freed += f2fs_try_to_free_nids(sbi, nr - freed);
 
+		/* shrink generic cache entries */
+		if (freed < nr)
+			freed += f2fs_shrink_cache(sbi, nr - freed);
+
 		spin_lock(&f2fs_list_lock);
 		p = p->next;
 		list_move_tail(&sbi->s_list, &f2fs_list);
-- 
2.49.0

