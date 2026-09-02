Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CAD4A8A21
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 15:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788362756; cv=none; b=TOQols9MWnQA1t8PbuHpq1V4bhpapAP/tQ0z6nCrMSZy/ZIYrJIINDh4Wvcg3dWzkKgjsWmME6h7D0fvIccA0aANgilxO3KAfz183gcHGpGCTLVhJD4Oqf9/l7bXEM93hwxEuwFzxReebPBiTKS+IAPYkCiQafGls8iFlBb3J8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788362756; c=relaxed/simple;
	bh=08D61IpPd0WpoPdALwusfBmqrkwFkAQchYTuG+yQlTs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I9g6wPTSCTnVBjxPI0mc9p45YZRIhhnCuabyt1qJsipFlX+IdUp6fbo0CKo6KgTcMz9MSJvVP92hNjdjY7Fcu70X6V0y+MQvWngmU5d3AFqv/evq/BvONUNeXiOmDJuTi1Z/OvoQ6UbY4Qkjyy2/i17iMue/ZTUSs9NHFjXMmSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uye3Ep65; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uye3Ep65"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cbe6295f05bso1871483a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 08:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788362753; x=1788967553; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e8Z+7+qAf5Kbmwp9Q2Sbqlkuz/KNNg3sSHHKRXs8Rck=;
        b=Uye3Ep65Mrnc/LoEblt1v8dvn2g2FoRnhxZZ08XiPo+HRuZtC7OrfEciyMVQyN0tv+
         /eUbZOdNEaUfAXY3wnZN7DAGcP1kNQiB6cjjbeoKhRLCkT8guhQoSU8DgWCy3aE+0WxS
         kvKdM3xfTCuvN1B81Mx78cGWhypxZJbFajq7hTtbDapD2yZBwZlhHqdT7lK8LImKqyLn
         hxZyMspIgITnbV4xEHA47su7ZqrFIRt8IUVthrGeE7xClZ8heqUcQuIoRLtmFAJBeMqw
         MFtSvlaela60M+JpmGGPfmYj4tqFD/uN3lx5HePd87g5w16M5b4U9lWjQkerhHVoz9hz
         +CEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788362753; x=1788967553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e8Z+7+qAf5Kbmwp9Q2Sbqlkuz/KNNg3sSHHKRXs8Rck=;
        b=OjWLlwBbWhuDDKISX3Du0n/dxEr4Zyp2xkwUOZXPA4O9HOLJjD3qIVIbffPJ5gfDR6
         r5GN996xUqAtUkfArwNdjMs6S70+RLoWIWHhifdeVQxXt5sEPMfXdlrhH/4eXpKp+NlV
         yaOgQR84TLBYXV7lYc/9Drxb914A9xnAYxFrvJVFCYWlN1qZCYVxtXn6VT8HbWLSkb1q
         zuPdDVO3exBlwxD0w60JMdyenutOt4Km7gKliIA8tlUL+/Waf88EAC6JDjZMU4yP9GGu
         s6zmBbJYsxw9hM40fcjwwV1FiVQDvF+KYUjROtGI5TqpOtUqYqY1h1DsHizfY5vKg4UU
         PjVg==
X-Forwarded-Encrypted: i=1; AKwUvBxADlDOGIY4Y2Evfywtv68ma3bPYv7XoopltaAWRvQ0syzmnWA9qB5DeJEIZOwrA9ok3BUwIMeRcENBZMw=@vger.kernel.org
X-Gm-Message-State: AFuF++noOwZF88Z/MuHoJOF79eGgFNGdmsxD/qb9dQWutfCipRciVRiy
	sVYUO+s2/0+BN2R2mCnWOB8BIwrkDSLag7dlQ2OtqydM9jHRb2J+aTYk
X-Gm-Gg: AYBFou3U9a3t5iYR2OJY33Z0x2Jr63NFKAjQL9MUvOcAaLVNmWlXEsfULGMh96nvrEf
	kILl30AVf6XcJuxBgC+lB8auriCvicSXeJgsxi/JK9lyr+mMYXjzwifSvNynPLJsDENpRYIiEcL
	41pBoKFoVHRimOFrStFEUa3qanwZqWwgRCxkhe5G8vxZ1l9t4EmdbsLC1iBoDxB1DmxW2GQoAYq
	ciPdZ0u6Wu2ZS7rzbJBAWz/BoNB+eI74Rlv4SCKrlT/PuEEzdm7MEyp5ysJzTDml8bL2xtg331A
	BHVHZ5R4x4kyO1zWvADRl2wrYuvyPJl4P18ZCoXbjwnBYRvUfIuB7FeBLpjnBDQnOcpetOczAjE
	8u4xvbBp+slDAfI9RIaXHzgQqNzpVCV/uyEYNjYM/WqXfl1PG2ROb/uHrgk1mdNLKK4cIQzXWFg
	B+VDDj3lYEK4r6TaRakkg93ItCruDp95O+eBIVuebsrh7Zh1qHrNDRAL2T/+UBNJ5M3N7JvMymh
	w==
X-Received: by 2002:a17:90b:5445:b0:38f:657:6823 with SMTP id 98e67ed59e1d1-39af63f7f7amr3086327a91.8.1788362753038;
        Wed, 02 Sep 2026 08:25:53 -0700 (PDT)
Received: from localhost.localdomain ([47.100.192.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990bd21e9dsm12359242a91.4.2026.09.02.08.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 08:25:52 -0700 (PDT)
From: Yang Wen <anmuxixixi@gmail.com>
To: linkinjeon@kernel.org,
	sj1557.seo@samsung.com,
	chizhiling@163.com
Cc: yuezhang.mo@sony.com,
	exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yang Wen <anmuxixixi@gmail.com>
Subject: [PATCH v3 3/3] exfat: reclaim name filters under memory pressure
Date: Wed,  2 Sep 2026 23:24:55 +0800
Message-Id: <20260902152455.1273557-4-anmuxixixi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260902152455.1273557-1-anmuxixixi@gmail.com>
References: <20260902152455.1273557-1-anmuxixixi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Each active large directory can hold a 64 KiB name filter. Add a
per-superblock LRU and shrinker so filters can be reclaimed when memory is
tight.

Signed-off-by: Yang Wen <anmuxixixi@gmail.com>
---
 fs/exfat/dir.c      | 145 +++++++++++++++++++++++++++++++++++++++++++-
 fs/exfat/exfat_fs.h |  10 +++
 fs/exfat/super.c    |   8 +++
 3 files changed, 160 insertions(+), 3 deletions(-)

diff --git a/fs/exfat/dir.c b/fs/exfat/dir.c
index 5145f09bcee6..c7aa50d41e9f 100644
--- a/fs/exfat/dir.c
+++ b/fs/exfat/dir.c
@@ -9,6 +9,7 @@
 #include <linux/buffer_head.h>
 #include <linux/filelock.h>
 #include <linux/hash.h>
+#include <linux/shrinker.h>
 #include <linux/stringhash.h>
 
 #include "exfat_raw.h"
@@ -91,12 +92,144 @@ static void exfat_name_filter_indexes(struct super_block *sb,
 			     EXFAT_NAME_FILTER_ORDER);
 }
 
+static unsigned long *
+exfat_name_filter_detach_locked(struct exfat_sb_info *sbi,
+				struct exfat_inode_info *ei)
+{
+	unsigned long *filter = ei->name_filter;
+
+	if (!filter)
+		return NULL;
+
+	ei->name_filter = NULL;
+	list_del_init(&ei->name_filter_lru);
+	sbi->name_filter_count--;
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
+	unsigned long *filter;
 
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
+	unsigned long count;
+
+	spin_lock(&sbi->name_filter_lock);
+	count = sbi->name_filter_count;
+	spin_unlock(&sbi->name_filter_lock);
+
+	return count ? count : SHRINK_EMPTY;
+}
+
+static unsigned long
+exfat_name_filter_scan_objects(struct shrinker *shrinker,
+			       struct shrink_control *sc)
+{
+	struct exfat_sb_info *sbi = shrinker->private_data;
+	unsigned long freed = 0;
+
+	/* Avoid reclaim recursion from a GFP_NOFS allocation under s_lock. */
+	if (!mutex_trylock(&sbi->s_lock)) {
+		sc->nr_scanned = 0;
+		return SHRINK_STOP;
+	}
+
+	while (freed < sc->nr_to_scan) {
+		struct exfat_inode_info *ei;
+		unsigned long *filter;
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
+
+		kvfree(filter);
+		freed++;
+		cond_resched();
+	}
+
+	mutex_unlock(&sbi->s_lock);
+	sc->nr_scanned = freed;
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
+		unsigned long *filter;
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
@@ -108,6 +241,7 @@ bool exfat_name_filter_maybe_contains(struct inode *inode,
 	if (!ei->name_filter)
 		return true;
 
+	exfat_name_filter_touch(ei);
 	exfat_name_filter_indexes(inode->i_sb, name, indexes);
 	return test_bit(indexes[0], ei->name_filter) &&
 	       test_bit(indexes[1], ei->name_filter) &&
@@ -123,6 +257,7 @@ void exfat_name_filter_add(struct inode *inode,
 	if (!ei->name_filter)
 		return;
 
+	exfat_name_filter_touch(ei);
 	exfat_name_filter_indexes(inode->i_sb, name, indexes);
 	__set_bit(indexes[0], ei->name_filter);
 	__set_bit(indexes[1], ei->name_filter);
@@ -145,7 +280,7 @@ static void exfat_build_name_filter(struct super_block *sb,
 	struct exfat_sb_info *sbi = EXFAT_SB(sb);
 	int i;
 
-	if (ei->name_filter ||
+	if (!sbi->name_filter_shrinker || ei->name_filter ||
 	    exfat_bytes_to_dentries(i_size_read(inode)) <
 					EXFAT_NAME_FILTER_MIN_DENTRIES)
 		return;
@@ -195,7 +330,11 @@ static void exfat_build_name_filter(struct super_block *sb,
 	}
 
 complete:
+	spin_lock(&sbi->name_filter_lock);
 	ei->name_filter = filter;
+	list_add_tail(&ei->name_filter_lru, &sbi->name_filter_lru);
+	sbi->name_filter_count++;
+	spin_unlock(&sbi->name_filter_lock);
 	return;
 abort:
 	kvfree(filter);
diff --git a/fs/exfat/exfat_fs.h b/fs/exfat/exfat_fs.h
index 5187dee47cf1..b81cfbdd117f 100644
--- a/fs/exfat/exfat_fs.h
+++ b/fs/exfat/exfat_fs.h
@@ -14,6 +14,8 @@
 #include <uapi/linux/exfat.h>
 #include <linux/buffer_head.h>
 
+struct shrinker;
+
 #define EXFAT_ROOT_INO		1
 
 /*
@@ -260,6 +262,11 @@ struct exfat_sb_info {
 
 	spinlock_t inode_hash_lock;
 	struct hlist_head inode_hashtable[EXFAT_HASH_SIZE];
+	/* Protects name_filter_lru and name_filter_count. */
+	spinlock_t name_filter_lock;
+	struct list_head name_filter_lru;
+	unsigned long name_filter_count;
+	struct shrinker *name_filter_shrinker;
 	struct rcu_head rcu;
 };
 
@@ -291,6 +298,7 @@ struct exfat_inode_info {
 	struct exfat_hint_femp hint_femp;
 	/* Complete, in-memory Bloom filter of directory names */
 	unsigned long *name_filter;
+	struct list_head name_filter_lru;
 
 	spinlock_t cache_lru_lock;
 	struct list_head cache_lru;
@@ -631,6 +639,8 @@ bool exfat_name_filter_maybe_contains(struct inode *inode,
 void exfat_name_filter_add(struct inode *inode,
 			   const struct exfat_uni_name *name);
 void exfat_name_filter_free(struct inode *inode);
+void exfat_name_filter_shrinker_register(struct super_block *sb);
+void exfat_name_filter_shrinker_unregister(struct super_block *sb);
 
 static inline int exfat_chain_advance(struct super_block *sb,
 		struct exfat_chain *chain, unsigned int step)
diff --git a/fs/exfat/super.c b/fs/exfat/super.c
index f73cf2d02365..3f9d880ec363 100644
--- a/fs/exfat/super.c
+++ b/fs/exfat/super.c
@@ -45,6 +45,7 @@ static void exfat_put_super(struct super_block *sb)
 {
 	struct exfat_sb_info *sbi = EXFAT_SB(sb);
 
+	exfat_name_filter_shrinker_unregister(sb);
 	mutex_lock(&sbi->s_lock);
 	exfat_clear_volume_dirty(sb);
 	exfat_free_bitmap(sbi);
@@ -196,6 +197,7 @@ static struct inode *exfat_alloc_inode(struct super_block *sb)
 		return NULL;
 
 	ei->name_filter = NULL;
+	INIT_LIST_HEAD(&ei->name_filter_lru);
 	return &ei->vfs_inode;
 }
 
@@ -732,6 +734,8 @@ static int exfat_fill_super(struct super_block *sb, struct fs_context *fc)
 		goto free_table;
 	}
 
+	exfat_name_filter_shrinker_register(sb);
+
 	return 0;
 
 put_inode:
@@ -827,6 +831,10 @@ static int exfat_init_fs_context(struct fs_context *fc)
 
 	mutex_init(&sbi->s_lock);
 	mutex_init(&sbi->bitmap_lock);
+	spin_lock_init(&sbi->name_filter_lock);
+	INIT_LIST_HEAD(&sbi->name_filter_lru);
+	sbi->name_filter_count = 0;
+	sbi->name_filter_shrinker = NULL;
 	ratelimit_state_init(&sbi->ratelimit, DEFAULT_RATELIMIT_INTERVAL,
 			DEFAULT_RATELIMIT_BURST);
 
-- 
2.34.1
