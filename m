Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640FE4E323D
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790166837; cv=none; b=QNkHixX3UvkPV8YW9VPZWm2cC27hYXo9I1iEO33WdyPdpDFEYGVMaYz+IqgOJlJ1UErI/QmFC62qrYMohNTEqJTk584EqP0UszyRSXdfmWu4CYfK0fZxdoN144gzlbkpBFVsCO5UOBtPxe3dXCVZ3Uw8XITT4+SH37fgXmSXUkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790166837; c=relaxed/simple;
	bh=Yqaq1Hk7u4nrzYHc+3CVcf4COPL1wBi/iltVI2RQc7w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FJTrATdthbGGAfVe44HimqQtswmtMKmvE8YhtVDIqPBeHiJztQffl3LHt54UdBKhHKY/nORnRLNTDkNjOShKHD2iNiPrhtyrzG0CQtY7DRX4Fjawz1O144QkvDqRMEpVbVLtKDDS3PXsthaGFfIC3fpdhdUn9eYv2GKPPmJR4Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k99u3pUO; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k99u3pUO"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747f05ffdso3694165ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 05:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790166833; x=1790771633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qR79KzzQEHA1BCgom4FGsnXuKP2YSduNO1GGm9Xb7l8=;
        b=k99u3pUOQ1Fq5cHzCmeiYmpYwizrheSFhtStDmlYnyqbd2qF7icoG8Nfr6l+lfSKon
         jQ77hGQ85HbLNEM18pGONYECi7Ni2A+n9xPUAjaAcBWrM4WjNEgddAtyTsvQPzW7v7kD
         2XvPYHFSe8mm1R6/b39TEUGq+OPuWR3ItcLDU5qGuWTNLpcf/0hRQEJ0XSa71Y4VGtJH
         UiMzRXlHHr0ua4gWptvd3ujHzDYexSJCzbrfRJY/MR8cgKMIpOhpnn7+zfOzCAy3osio
         nWX9K6jhG891N2NkFrTuglAxjetiDOo7kKpxYtOp5tt5qn7Zwx8cLP9mgracwyQIykj1
         GJFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790166833; x=1790771633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qR79KzzQEHA1BCgom4FGsnXuKP2YSduNO1GGm9Xb7l8=;
        b=W1Lr0RaGaSDvI4024uJW7m1WrxVUw3bQsMZBM7qTT0o0DwmJRQLzBIOiUcclF4W2ji
         v8Lr5pBl/2cWp6LSWvwX2Zz6esXeGgH0tiPVUz6CgCz/7FJYEC4Qjh1a5chzIKRtMROf
         lpwaaClOaGEmaE2HtZudIyz3lL7r0kJCrA7sl2bOh08txoJfsBE6j7OqFXRcIcIzBbz6
         VBx4X39qWbW3Ma2DquyEx843rdPY4PJoKYIhvg3+tDE+8O1SMKk4c7j+8IxgeNPzFYLi
         NB3l7bWsw+Zr+jLjhSkLtuaxyHsRGuEzM+1jIcpJgfynE3spkgaBsfyF1QsxD+58Ot3Q
         8cXA==
X-Forwarded-Encrypted: i=1; AKwUvBxKn+tLPD4fTBJKm+Nnm/WZsiBb2sivAedg7FTC5evWz5JANBki7Jwr6zot9whZInISxuFtW35DUu7K+b8=@vger.kernel.org
X-Gm-Message-State: AFuF++nYLFMog8wNeDo0Q0fBsayEbQyz86/OxAvn84erk/BK4mkZNrKl
	538K1gyNsWGzJUxpjqfFIEwIjRDlRcaulDzeEP8bBwbU5rT1wB20zPHi
X-Gm-Gg: AYBFou3apLALSmTDqwrHQ/JVq5aJP1vqubT4UVCySmWTAaN+23SIHRwMHDyAoNeJlPo
	zcErBo511em3creP0U+3Cz9ElUgnvkPQ2ANFH/2Qz2lOyUCnH4PaboDar43GLUzKIZA+WnMoV+G
	K+izu53/4Ijj5xrU7V4lxoZ2DyPvsNcbQsn0ghfX9/KSPgjladzHPRbfTFSTiep1JzkOYimMyHo
	HsYleslpw94BlaGtSWlj+ubuvCPkZUD2ChYC8UWfSlxqKd6vlTSiaCEc9WqqV9NwTcnrzA0x8KK
	KpBj3RzdUzIgwmtcQrVRbUrz0BmMHm3hGA074Xf1gEqRt/owdypKV78Xtelec3pSrLy8VeZP2tC
	jPpJdtEBdd7Bf52sQqA4weCpkDRyiKUD8jWW2LR1JzDY4mnFTvm7XqWjRdFnWufF1FjkQUtMAeZ
	gjlh6bhzwYkIU//8RW1Xvtr/W84ZT2DSGYeFLylOXSHpqaeI4GfTI4a7by9G2GyehhMYOIGzsDP
	qJECaJz7sVJ
X-Received: by 2002:a17:903:2f8c:b0:2dd:c053:e0f8 with SMTP id d9443c01a7336-2df69de16b5mr21644485ad.39.1790166831747;
        Wed, 23 Sep 2026 05:33:51 -0700 (PDT)
Received: from localhost.localdomain ([47.100.192.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5a6d35sm9510475ad.19.2026.09.23.05.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 05:33:51 -0700 (PDT)
From: Yang Wen <anmuxixixi@gmail.com>
To: linkinjeon@kernel.org,
	sj1557.seo@samsung.com,
	chizhiling@163.com
Cc: yuezhang.mo@sony.com,
	exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yang Wen <anmuxixixi@gmail.com>
Subject: [PATCH v6 3/3] exfat: reclaim name filters under memory pressure
Date: Wed, 23 Sep 2026 20:33:00 +0800
Message-Id: <20260923123300.1626723-4-anmuxixixi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260923123300.1626723-1-anmuxixixi@gmail.com>
References: <20260923123300.1626723-1-anmuxixixi@gmail.com>
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
index 08b7a50de871..013b7e43a289 100644
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
index 3bbfa7092c0d..b3edb6fdfca6 100644
--- a/fs/exfat/exfat_fs.h
+++ b/fs/exfat/exfat_fs.h
@@ -14,6 +14,8 @@
 #include <uapi/linux/exfat.h>
 #include <linux/buffer_head.h>
 
+struct shrinker;
+
 #define EXFAT_ROOT_INO		1
 
 /*
@@ -263,6 +265,11 @@ struct exfat_sb_info {
 
 	spinlock_t inode_hash_lock;
 	struct hlist_head inode_hashtable[EXFAT_HASH_SIZE];
+	/* Protects name_filter_lru and name_filter_count. */
+	spinlock_t name_filter_lock;
+	struct list_head name_filter_lru;
+	unsigned long name_filter_count;
+	struct shrinker *name_filter_shrinker;
 	struct rcu_head rcu;
 };
 
@@ -294,6 +301,7 @@ struct exfat_inode_info {
 	struct exfat_hint_femp hint_femp;
 	/* Complete, in-memory Bloom filter of directory names */
 	unsigned long *name_filter;
+	struct list_head name_filter_lru;
 
 	spinlock_t cache_lru_lock;
 	struct list_head cache_lru;
@@ -635,6 +643,8 @@ bool exfat_name_filter_maybe_contains(struct inode *inode,
 void exfat_name_filter_add(struct inode *inode,
 			   const struct exfat_uni_name *name);
 void exfat_name_filter_free(struct inode *inode);
+void exfat_name_filter_shrinker_register(struct super_block *sb);
+void exfat_name_filter_shrinker_unregister(struct super_block *sb);
 
 static inline int exfat_chain_advance(struct super_block *sb,
 		struct exfat_chain *chain, unsigned int step)
diff --git a/fs/exfat/super.c b/fs/exfat/super.c
index 4924f0fad836..465e33c9ba49 100644
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
+	sbi->name_filter_count = 0;
+	sbi->name_filter_shrinker = NULL;
 	ratelimit_state_init(&sbi->ratelimit, DEFAULT_RATELIMIT_INTERVAL,
 			DEFAULT_RATELIMIT_BURST);
 
-- 
2.34.1

