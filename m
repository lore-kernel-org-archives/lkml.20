Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6359C558212
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791991935; cv=none; b=VTpLC8riwWUXsr1dNiav4a+UFx53W1YhEwt0dpARfKCV6m67VJqxI0k4sNfz+5o+u9/a+m3D6WShiUEEKaI5pC9OBhFIY6cExvPasuTlRFTIrhLb8TdlQ7TTzG1YI0LAbE0T4EapK0reH9pIedF/+p1+OFaRYWB47RUE+R6CB9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791991935; c=relaxed/simple;
	bh=XQsneU3xqmTVNbKsfGxKF7tM9c8BtVYj+AuD/RC2FWQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fE+4Rpt2zXtScJ5Tc6GZYjW9wO61QfiqzaGq2GAuUdAoUGsIXA0Z6zgSizCnaZ0QhhZzZRb+LcrPigMRZHkYllQY3oINmVZbm6a97BI78TJmM1SSIZMk5xdk9uoyk44Qj25qObs4tXap3w0HEeAg96Ej77myiPYGfMpAE58x/Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P7H1Kd6B; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P7H1Kd6B"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-872024e2b4eso1756780b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791991931; x=1792596731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H4gwh2fQvNe08kbDMKrdanW71GXiZ18Ym48/T8PhpJo=;
        b=P7H1Kd6BzV4+tuGqfjsdcQ1iqUkeIVf026V6x+F9pSRpv1vGC7zAaJk8sYtL5Dfxbn
         vx+P/Ov2zdK819XBhdRSU4t/I9MLcUdystkm4MveWw0mssBgyGSbyPj2nubsGkzkLjOP
         Li6Qw21evC2HXOemjY0TCfm3HNLjmI5dEZ0jbHXY5gKOco2Xlr2Jyrz9SDbimta5+AIv
         PKbq70fOs5vel/h2S/4MSV0L7Ls4PoqDRNlV53yxL2jWMtHDiMPNB4boMsyx+BCWMid+
         e+F7LrtEYb3I7qPNoVNo1uouMgwSa9c/2fz2v87jNuNs5Re4VUGYsBj3EUdujmtaYzq5
         z3Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791991931; x=1792596731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H4gwh2fQvNe08kbDMKrdanW71GXiZ18Ym48/T8PhpJo=;
        b=nR2GrEuVw3nXZ7qsusmkU0wAdL4AV02g4OUWa404sEC6Y/1RjOOJkx0Yx65j1bv2kt
         5D5rJ0jtrUlraaTVPcMNwBGlvZMOeKr03CAt6vp6JLGVMvqqmXSTr/QDBfdEPoyrSumf
         UZPNmd87Z4rzDf3sEko7yCphcZDSxjEttX6GwABgTX3DG7yRz2bq4noX8f1ejgfz/CjP
         h8gmkssnM6IdfRZz5ztycmkGMi7qVJKTkrwQUYkQINp4KNYn7yM6FWU8r9l+3N7eeYpH
         TjRwmt0aYS8OsrAZTfdEV4wvYGaFNX+/viKgJi8R8cr0NfJ0KplYthqhuh1onElWTRFq
         A6ug==
X-Forwarded-Encrypted: i=1; AKwUvBzxU42k9y3pSufd278wz1EeBLS1QY8BLpjXnVI5tPiBHbQqbz0BRx5YN/4Uxd+M09H1lCf5YKlAmdeUfP0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJEo2dbZxk2zF06DuydXtCp7vB+oPGW95Al42G1pZDavLVUeDam
	O2Sl8DEOfikdYvYKpQIMNXhDZxtkxL93blC/Wu9sJmNlv+IV3DQpXhza
X-Gm-Gg: AYBFou2C12NrIktgRJX0Zu4Syqv8EeHObv9xg8VoZRwpXx+i/ySqHsANcw+nrxeCdnL
	dct5NeSOYipZK5617sYTitwvSwaig5/4+9C0HxeKL7RStDLIkkV6JvPr4Mx2BgRhQ4FkUUZ+TlV
	nDIrdEUB2cd/vHmBlzaI+RQ1hNnKzUzNrLCFJE/8QSa/8qvi6IeJUOg5/AF5O2T1lkQNQMZx0jH
	MiW256nni3CTpfuNOPZLaK4sbSTrdprY/JEYflCcnSBBfP0U1VogN8HCn6/9lMJyrqHd2abnKLl
	oDWo2QJ/mV0mwmB/0e2SD7BB+5XNKeZF1MOf1hCxxxuISCIYFHpf2LonjGCa1JjyR+QwkKCT4AK
	WE24UWxFC4TBGOCjOd+LSyaPI5gooK6rMEG83GJ5irDizu0h/otBay3Bd9gSCKvaAocJshQQbMG
	EwxicxThWLA6AzFpENsC4+AtHNPVY6XYtm2nDhWm23PffU/yuiBujRkyCqtsvMg3tC0wB8R8X2J
	ChKJXRd9W79hOW9Fb75fX0=
X-Received: by 2002:a05:6a00:218e:b0:891:6d3e:3992 with SMTP id d2e1a72fcca58-897c7ccb7dcmr12544259b3a.46.1791991931331;
        Wed, 14 Oct 2026 08:32:11 -0700 (PDT)
Received: from localhost.localdomain ([47.100.192.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d7f51f452sm1221941b3a.1.2026.10.14.08.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 08:32:07 -0700 (PDT)
From: Yang Wen <anmuxixixi@gmail.com>
To: linkinjeon@kernel.org,
	sj1557.seo@samsung.com,
	chizhiling@163.com
Cc: yuezhang.mo@sony.com,
	exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yang Wen <anmuxixixi@gmail.com>
Subject: [PATCH v8 3/3] exfat: reclaim name filters under memory pressure
Date: Wed, 14 Oct 2026 23:31:30 +0800
Message-Id: <20261014153130.2111500-4-anmuxixixi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261014153130.2111500-1-anmuxixixi@gmail.com>
References: <20261014153130.2111500-1-anmuxixixi@gmail.com>
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
index 4c36fded2412..bc99f2d6739e 100644
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
+	list_del_init(&ei->name_filter_lru);
+	ei->name_filter = NULL;
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
index d00b3235cee9..472e341e4d7d 100644
--- a/fs/exfat/exfat_fs.h
+++ b/fs/exfat/exfat_fs.h
@@ -15,6 +15,8 @@
 #include <uapi/linux/exfat.h>
 #include <linux/buffer_head.h>
 
+struct shrinker;
+
 #define EXFAT_ROOT_INO		1
 
 /*
@@ -266,6 +268,11 @@ struct exfat_sb_info {
 
 	spinlock_t inode_hash_lock;
 	struct hlist_head inode_hashtable[EXFAT_HASH_SIZE];
+	/* Protects name_filter_lru and name_filter_pages. */
+	spinlock_t name_filter_lock;
+	struct list_head name_filter_lru;
+	unsigned long name_filter_pages;
+	struct shrinker *name_filter_shrinker;
 	struct rcu_head rcu;
 };
 
@@ -297,6 +304,7 @@ struct exfat_inode_info {
 	struct exfat_hint_femp hint_femp;
 	/* Complete, in-memory Bloom filter of directory names */
 	struct exfat_name_filter *name_filter;
+	struct list_head name_filter_lru;
 
 	spinlock_t cache_lru_lock;
 	struct list_head cache_lru;
@@ -693,6 +701,8 @@ bool exfat_name_filter_maybe_contains(struct inode *inode,
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

