Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111D543B49D
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 13:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791122241; cv=none; b=IKLPQuJBiwAPo9bcO7J3R/z00lXwJqbbIl2BKPA0tgxgs+3dU3lruG3ktegPqw/C8nXH+OR6LSylrfZpZv3zQV8VEWzZ6PDcOzYKIfNc0lPGt1I178CGEOfsW2NmLRrZbWkvTBP8UNcnqHPO7KLCSgrKIAQPqL1pDI3fTOK9khs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791122241; c=relaxed/simple;
	bh=pIQ+IRKIzFQu+nwE6rpRbECGYFdSKs6+qMmd1UYLM8I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JeTdoLygy5k9f7tJ5NCXRh4MNSFE8P4br0JV6XFdgAnWg1oHIh71kXze3pFqCxciv4YWMq8dOIbi0jAu3lsHdCQcxZJrPlBlwZKdPEdAJcv6mPjzt2pD/J7AC3TnGx/AM2fYHQc1yxO+nA4rbmqWsp4FLZAn2YI5IOFWUI4qoi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mMO/4Oih; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mMO/4Oih"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-3a49573b8bdso572839a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 06:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791122239; x=1791727039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TJmJ3Y08JKcht7kTp4k3VyLvWVZcL/LexUSVXApnbpE=;
        b=mMO/4Oih6WgfSpctyCV81rkxgFWvVIlFWRErVPpkpmapCMsotQb9SojnyIRdaJaSSX
         pskpEzjTF49e4rgzGTHXiozNazqgHt8z7VepHqTgsG9WowpCs7VMI48lKmTIYr7MFVrX
         Bl4GscgqQh98A0olgTqpIQSnWC4yoeHXVviYXOnAnhWv/O4EnFGh0ElJK0TvB4c4Uml+
         Fq2hGQJJLoIY+G9nVxbVuAr0BaCbX8SCHWQUDwnPNJbo+nbm/bezPE+y3ZP8MI62NIbM
         WSg/ZA+LxGlqxpOtefO1jQ7LM8QOJb3UYH9ZrJOWhS1DG/18Hxo5NbekIDd6fhTkIOT2
         PJ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791122239; x=1791727039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TJmJ3Y08JKcht7kTp4k3VyLvWVZcL/LexUSVXApnbpE=;
        b=mj4627E4naE/45/xrwWbR/x/5ZgdYBRDecPTK88xKgscGq8vhAnZjFiqJ3eX0foU41
         v27plR8SpK2qNmalZj4FpYldXg4FGdEXBQ/sSwiZGRSORF9sVRL3wsmqpfFm+IZcF36O
         a6o1r0uRPZK/xWVu0qm8lso7U3MlsWC5851i30IKaCcd4bKvk8/bc35xhwMYIUwYaohe
         qruuQD+r1elh1UOgrZdxShcq6SMGv9F8OzvneaMQOdjBZANSPlLghfVL0ykdb++KTFgB
         2MK00sQCxspWRRfGL2srPMo4l1g/cRa2pLOFgoVXRMF2kx7bYnkU6hKIny6cSv0cmZQN
         vuJQ==
X-Forwarded-Encrypted: i=1; AKwUvBxP6WI7f1N+iOUWwwJIsh8RZ40kcP3a89ANjCWHJZk2CXDHF46fftt1ddMGEJbfxIlsGBhyr8ujknMbVnc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLflkHsjdPhXj7H8Zum62nFzii9hccXY3AaqjBZt9KX6lvCAA8t
	4oCtl76ncRnoj4DTjFPkNFiJRZGqYY5k0ZcTNly7s0YaSEVWauHLCDHm
X-Gm-Gg: AYBFou1L95kGYZjXZs6fgWXGdoAtlSohqj7lOgjlfT268NsqyxODz+NQCjOhsuxeklO
	k9grzoDKbY0kNSeErfDv1l/UkXmwuKDoijyWgN/y/C0jRbjJPuV0pYrad/k19+MAtwo+1Uc+VFy
	ZuBOY6jBrDqAK5E6K0Y8cgJ/tGGo599i6mMmKcYlUzwRy7fD9J2wxISniebaOsRAMBpYl/wBZ7Q
	L87qP4hEvRlK4wOOWjCcP2YH69q3zojSxvh94osBYl/DFh9k1cPwA2dX4rCEe5L422DXJdCAnI1
	pUGZvCqLGY/wWTPHg87wX4HkmtwDj4mpYjkRAW41fXIIVdUIXQCBRlOmS1u4NOg6QJm2oMCQEcL
	Cnu9mK1AsMnQ1ZJWc6bnJzDdehnHicXljZQ7Me06VRdrbxQdx3jFwJohUl/iNjd/yKh2fSONJlG
	KhwQmsUjI1bnLclOmMExpUKbQYan1FrynNaEWsKklE85xXjW33s7WM6wVs0NppexmzpnOCBTOTO
	wwDgdFbYWc/
X-Received: by 2002:a17:90b:5690:b0:3a4:f1f9:2569 with SMTP id 98e67ed59e1d1-3a6ced62a58mr6830062a91.55.1791122239248;
        Sun, 04 Oct 2026 06:57:19 -0700 (PDT)
Received: from localhost.localdomain ([47.100.192.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d7cd433sm6876358a91.15.2026.10.04.06.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 06:57:18 -0700 (PDT)
From: Yang Wen <anmuxixixi@gmail.com>
To: linkinjeon@kernel.org,
	sj1557.seo@samsung.com,
	chizhiling@163.com
Cc: yuezhang.mo@sony.com,
	exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yang Wen <anmuxixixi@gmail.com>
Subject: [PATCH v7 3/3] exfat: reclaim name filters under memory pressure
Date: Sun,  4 Oct 2026 21:56:38 +0800
Message-Id: <20261004135638.1888530-4-anmuxixixi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261004135638.1888530-1-anmuxixixi@gmail.com>
References: <20261004135638.1888530-1-anmuxixixi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Each active large directory can hold a dynamically sized name filter with a
bitmap of up to 4 MiB. Add a per-superblock LRU and shrinker so filters can
be reclaimed when memory is tight. Account reclaimable filters in pages so
reclaim cost tracks their differing allocation sizes.

Keep the scan budget initialized by the shrinker core instead of replacing
it with the number of filters freed. If the LRU is already empty, return
SHRINK_STOP. This guarantees that do_shrink_slab() either consumes its scan
budget or stops, even when the LRU becomes empty before nr_to_scan is
satisfied.

Signed-off-by: Yang Wen <anmuxixixi@gmail.com>
---
 fs/exfat/dir.c      | 159 +++++++++++++++++++++++++++++++++++++++++++-
 fs/exfat/exfat_fs.h |  10 +++
 fs/exfat/super.c    |   8 +++
 3 files changed, 174 insertions(+), 3 deletions(-)

diff --git a/fs/exfat/dir.c b/fs/exfat/dir.c
index 9f9183116784..cf780f7f540c 100644
--- a/fs/exfat/dir.c
+++ b/fs/exfat/dir.c
@@ -10,6 +10,7 @@
 #include <linux/filelock.h>
 #include <linux/hash.h>
 #include <linux/log2.h>
+#include <linux/shrinker.h>
 #include <linux/stringhash.h>
 
 #include "exfat_raw.h"
@@ -127,12 +128,158 @@ static bool exfat_name_filter_set(struct exfat_name_filter *filter,
 	return filter->nr_set_bits >= nr_bits / 3;
 }
 
+static unsigned long
+exfat_name_filter_nr_pages(const struct exfat_name_filter *filter)
+{
+	size_t size = struct_size(filter, bitmap,
+				  BITS_TO_LONGS(BIT(filter->order)));
+
+	return DIV_ROUND_UP(size, PAGE_SIZE);
+}
+
+static struct exfat_name_filter *
+exfat_name_filter_detach_locked(struct exfat_sb_info *sbi,
+				struct exfat_inode_info *ei)
+{
+	struct exfat_name_filter *filter = ei->name_filter;
+
+	if (!filter)
+		return NULL;
+
+	ei->name_filter = NULL;
+	list_del_init(&ei->name_filter_lru);
+	sbi->name_filter_pages -= exfat_name_filter_nr_pages(filter);
+	return filter;
+}
+
+static void exfat_name_filter_touch(struct exfat_inode_info *ei)
+{
+	struct exfat_sb_info *sbi = EXFAT_SB(ei->vfs_inode.i_sb);
+
+	spin_lock(&sbi->name_filter_lock);
+	if (ei->name_filter)
+		list_move_tail(&ei->name_filter_lru, &sbi->name_filter_lru);
+	spin_unlock(&sbi->name_filter_lock);
+}
+
 void exfat_name_filter_free(struct inode *inode)
 {
 	struct exfat_inode_info *ei = EXFAT_I(inode);
+	struct exfat_sb_info *sbi;
+	struct exfat_name_filter *filter;
 
-	kvfree(ei->name_filter);
-	ei->name_filter = NULL;
+	if (!READ_ONCE(ei->name_filter))
+		return;
+
+	sbi = EXFAT_SB(inode->i_sb);
+	spin_lock(&sbi->name_filter_lock);
+	filter = exfat_name_filter_detach_locked(sbi, ei);
+	spin_unlock(&sbi->name_filter_lock);
+	kvfree(filter);
+}
+
+static unsigned long
+exfat_name_filter_count_objects(struct shrinker *shrinker,
+				struct shrink_control *sc)
+{
+	struct exfat_sb_info *sbi = shrinker->private_data;
+	unsigned long pages;
+
+	spin_lock(&sbi->name_filter_lock);
+	pages = sbi->name_filter_pages;
+	spin_unlock(&sbi->name_filter_lock);
+
+	return pages ? pages : SHRINK_EMPTY;
+}
+
+static unsigned long
+exfat_name_filter_scan_objects(struct shrinker *shrinker,
+			       struct shrink_control *sc)
+{
+	struct exfat_sb_info *sbi = shrinker->private_data;
+	unsigned long freed = 0;
+	bool empty = false;
+
+	/* Avoid reclaim recursion from a GFP_NOFS allocation under s_lock. */
+	if (!mutex_trylock(&sbi->s_lock)) {
+		sc->nr_scanned = 0;
+		return SHRINK_STOP;
+	}
+
+	while (freed < sc->nr_to_scan) {
+		struct exfat_inode_info *ei;
+		struct exfat_name_filter *filter;
+
+		spin_lock(&sbi->name_filter_lock);
+		if (list_empty(&sbi->name_filter_lru)) {
+			spin_unlock(&sbi->name_filter_lock);
+			empty = true;
+			break;
+		}
+
+		ei = list_first_entry(&sbi->name_filter_lru,
+				      struct exfat_inode_info,
+				      name_filter_lru);
+		filter = exfat_name_filter_detach_locked(sbi, ei);
+		spin_unlock(&sbi->name_filter_lock);
+
+		freed += exfat_name_filter_nr_pages(filter);
+		kvfree(filter);
+		cond_resched();
+	}
+
+	mutex_unlock(&sbi->s_lock);
+	if (empty && !freed) {
+		sc->nr_scanned = 0;
+		return SHRINK_STOP;
+	}
+	return freed;
+}
+
+void exfat_name_filter_shrinker_register(struct super_block *sb)
+{
+	struct exfat_sb_info *sbi = EXFAT_SB(sb);
+	struct shrinker *shrinker;
+
+	shrinker = shrinker_alloc(SHRINKER_NONSLAB,
+				  "exfat-name-filter:%s", sb->s_id);
+	if (!shrinker) {
+		exfat_warn(sb, "failed to allocate name filter shrinker");
+		return;
+	}
+
+	shrinker->count_objects = exfat_name_filter_count_objects;
+	shrinker->scan_objects = exfat_name_filter_scan_objects;
+	shrinker->private_data = sbi;
+	shrinker_register(shrinker);
+	sbi->name_filter_shrinker = shrinker;
+}
+
+void exfat_name_filter_shrinker_unregister(struct super_block *sb)
+{
+	struct exfat_sb_info *sbi = EXFAT_SB(sb);
+	struct shrinker *shrinker = sbi->name_filter_shrinker;
+
+	sbi->name_filter_shrinker = NULL;
+	shrinker_free(shrinker);
+
+	for (;;) {
+		struct exfat_inode_info *ei;
+		struct exfat_name_filter *filter;
+
+		spin_lock(&sbi->name_filter_lock);
+		if (list_empty(&sbi->name_filter_lru)) {
+			spin_unlock(&sbi->name_filter_lock);
+			break;
+		}
+
+		ei = list_first_entry(&sbi->name_filter_lru,
+				      struct exfat_inode_info,
+				      name_filter_lru);
+		filter = exfat_name_filter_detach_locked(sbi, ei);
+		spin_unlock(&sbi->name_filter_lock);
+		kvfree(filter);
+	}
 }
 
 bool exfat_name_filter_maybe_contains(struct inode *inode,
@@ -145,6 +292,7 @@ bool exfat_name_filter_maybe_contains(struct inode *inode,
 	if (!filter)
 		return true;
 
+	exfat_name_filter_touch(ei);
 	exfat_name_filter_indexes(inode->i_sb, name, filter->order, indexes);
 	return test_bit(indexes[0], filter->bitmap) &&
 	       test_bit(indexes[1], filter->bitmap) &&
@@ -161,6 +309,7 @@ void exfat_name_filter_add(struct inode *inode,
 	if (!filter)
 		return;
 
+	exfat_name_filter_touch(ei);
 	if (exfat_name_filter_order(inode) > filter->order) {
 		exfat_name_filter_free(inode);
 		return;
@@ -188,7 +337,7 @@ static void exfat_build_name_filter(struct super_block *sb,
 	u8 order;
 	int i;
 
-	if (ei->name_filter ||
+	if (!sbi->name_filter_shrinker || ei->name_filter ||
 	    exfat_bytes_to_dentries(i_size_read(inode)) <
 					EXFAT_NAME_FILTER_MIN_DENTRIES)
 		return;
@@ -240,7 +389,11 @@ static void exfat_build_name_filter(struct super_block *sb,
 	}
 
 complete:
+	spin_lock(&sbi->name_filter_lock);
 	ei->name_filter = filter;
+	list_add_tail(&ei->name_filter_lru, &sbi->name_filter_lru);
+	sbi->name_filter_pages += exfat_name_filter_nr_pages(filter);
+	spin_unlock(&sbi->name_filter_lock);
 	return;
 abort:
 	kvfree(filter);
diff --git a/fs/exfat/exfat_fs.h b/fs/exfat/exfat_fs.h
index 70f4e2d4ac81..159c1aa40372 100644
--- a/fs/exfat/exfat_fs.h
+++ b/fs/exfat/exfat_fs.h
@@ -14,6 +14,8 @@
 #include <uapi/linux/exfat.h>
 #include <linux/buffer_head.h>
 
+struct shrinker;
+
 #define EXFAT_ROOT_INO		1
 
 /*
@@ -265,6 +267,11 @@ struct exfat_sb_info {
 
 	spinlock_t inode_hash_lock;
 	struct hlist_head inode_hashtable[EXFAT_HASH_SIZE];
+	/* Protects name_filter_lru and name_filter_pages. */
+	spinlock_t name_filter_lock;
+	struct list_head name_filter_lru;
+	unsigned long name_filter_pages;
+	struct shrinker *name_filter_shrinker;
 	struct rcu_head rcu;
 };
 
@@ -296,6 +303,7 @@ struct exfat_inode_info {
 	struct exfat_hint_femp hint_femp;
 	/* Complete, in-memory Bloom filter of directory names */
 	struct exfat_name_filter *name_filter;
+	struct list_head name_filter_lru;
 
 	spinlock_t cache_lru_lock;
 	struct list_head cache_lru;
@@ -637,6 +645,8 @@ bool exfat_name_filter_maybe_contains(struct inode *inode,
 void exfat_name_filter_add(struct inode *inode,
 			   const struct exfat_uni_name *name);
 void exfat_name_filter_free(struct inode *inode);
+void exfat_name_filter_shrinker_register(struct super_block *sb);
+void exfat_name_filter_shrinker_unregister(struct super_block *sb);
 
 static inline int exfat_chain_advance(struct super_block *sb,
 		struct exfat_chain *chain, unsigned int step)
diff --git a/fs/exfat/super.c b/fs/exfat/super.c
index 4924f0fad836..26b25cc86d1c 100644
--- a/fs/exfat/super.c
+++ b/fs/exfat/super.c
@@ -46,6 +46,7 @@ static void exfat_put_super(struct super_block *sb)
 {
 	struct exfat_sb_info *sbi = EXFAT_SB(sb);
 
+	exfat_name_filter_shrinker_unregister(sb);
 	mutex_lock(&sbi->s_lock);
 	exfat_clear_volume_dirty(sb);
 	exfat_free_bitmap(sbi);
@@ -210,6 +211,7 @@ static struct inode *exfat_alloc_inode(struct super_block *sb)
 		return NULL;
 
 	ei->name_filter = NULL;
+	INIT_LIST_HEAD(&ei->name_filter_lru);
 	return &ei->vfs_inode;
 }
 
@@ -746,6 +748,8 @@ static int exfat_fill_super(struct super_block *sb, struct fs_context *fc)
 		goto free_table;
 	}
 
+	exfat_name_filter_shrinker_register(sb);
+
 	return 0;
 
 put_inode:
@@ -845,6 +849,10 @@ static int exfat_init_fs_context(struct fs_context *fc)
 
 	mutex_init(&sbi->s_lock);
 	mutex_init(&sbi->bitmap_lock);
+	spin_lock_init(&sbi->name_filter_lock);
+	INIT_LIST_HEAD(&sbi->name_filter_lru);
+	sbi->name_filter_pages = 0;
+	sbi->name_filter_shrinker = NULL;
 	ratelimit_state_init(&sbi->ratelimit, DEFAULT_RATELIMIT_INTERVAL,
 			DEFAULT_RATELIMIT_BURST);
 
-- 
2.34.1

