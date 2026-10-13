Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93EA34F472F
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791892607; cv=none; b=MU65zz+Z0iHAuVQ249wmVDFoH8OipPnOUn7Qq9XeK3ldl3R5GHu+P3GxD7xInqy+3IKZNF7+h7pctwQhv5xuRy6TUuxLAGSl84rwzGDadhARcHNE8jgesK3sHaKon4t22NSNuHcsWyt82LP2CbJHiU59gtuT2CALYzXWBX/vzMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791892607; c=relaxed/simple;
	bh=o51x1xfjVSkT7XHJ4fQ/OvZ5cNSmg3u63pRvjBwMI8A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D9ltHqnbcUEanS2WzFPcsQkS+nkwouN7wLPX7NbNAgthhOd7rMakiNuis5F183gubxpXRe7CljhvXdhT9DDIT4vkLW/M0FJ/bcCt8OVqclrm1eUkE70EjB7eY0XgPSYmQME4wLKPnzEIlr0uUvFdWdP3dWl1hphsZkuVW0locnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GHylkIDh; arc=none smtp.client-ip=74.125.227.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GHylkIDh"
Received: by mail-pj2-f10.google.com with SMTP id 98e67ed59e1d1-3ac144119e4so620482a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 04:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791892605; x=1792497405; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fT98QeEusQPAtEV+tcJJOyyGh0DjLA2f//tdJ4ehWp8=;
        b=GHylkIDh1pXT+/uF8e7zlLEPTuyr535vjBFuEi0nVPsHuFq/RnXU5MS5CDirXj00RX
         +L5Gfl881bfwProiy8bgn/x5Dl8cb7NcUxJwaoe/ck+aCJ3FwqACoihD3JaOPgtL7dq4
         uqWcMY6R+hLvDxs1GeCNyxHaQ1NIsVzIRXUy3FBI46ELINcuF0rSGqq5M3aa7j8/nVl1
         DNnUTwlMAbWq6vmVb2IUSw4N1X28+9pEP9VDRgQ0lfYqzueUPclTvpv1n3tB7sIleMW0
         TAedxom0abOYQXVV0N9mRTrZHjQtl2oTKKkN6MYeikc5Rm/HDZMgMmniwVQNUbHZ72K0
         6hrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791892605; x=1792497405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fT98QeEusQPAtEV+tcJJOyyGh0DjLA2f//tdJ4ehWp8=;
        b=2p6P949CTKcjkJk8XtUCjd0etKQiJCCfRgHoP7+Abua8nzHliiTIVZpi4PgFfblu29
         KyTKjBcCEp6p9rHqkwvG3hglB3t+3dcqScI4lqUEEd9znQKYhjAAo+K5G+gXPU6wLZtn
         ZT0GR5XCh3vM6If6kWQIiVSyn9IemKk8sJaRJ47yjvF5vILmeS2IkplzF0+tJH8ydYG+
         2J7xQsWTHR9GJaR39EiGfS0EiSUHBSpuc3708ScOiuw4KqxfiyMgnuZOeoDIp1wmNuAv
         wpylTClrzCpGiQStq3L0fckNtz2X8Um/K34XwEc+lwWhFJMVsH1h69Kwnp6c4N4Grkxw
         GzBA==
X-Forwarded-Encrypted: i=1; AKwUvByaJRmMkxCOdUklIMQbq9zPbtE2qrgec0cK+4v/8w6wbZU7BPxBY1kVRs3Sjxr2UmiRXCiaEnhgJAZeIxk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJE0njD4LPjL0MPaYK2n2+/glyjnrVbEy4G8evwui/HPInurGUA
	OCYvSRYnw0diMr8elkcoWHHS514o5OHeQHOvx/vAQDhNRfHwJp76aoko
X-Gm-Gg: AYBFou1rMP2ySxj6D5GpZ+DMsuOl5yFmgRDSQbDlhxXXnitxRFt+tmdpQIBxD8/9JLr
	BcbqrDZ8lt8tAQjBLi4RuPfebCEV7gIlfFPi2FaP/pPI37f0ulvQ4TwX4myr6tRwGLMgLCJT9yd
	nW1V+yC/MceRZbGe3i5KlkJuHbjTrudAEw/T6PykSeis1q6nT9NzpAklLgD4KcdnzXkw4EHyMzS
	DqGmF2MeqHMkxboUdbIhe4uKwZpiWMs1JQ+b0HFDUJy1SecR8udDJB3P7V59GWcp4ieDPTklfIN
	8wE4Cx2VqggzH1cIvh9lzIalULQYE8PCq8bP2uZds7jP+dUngu9ZOVJta0Dj3lk7q8DOTYwJEv2
	1pALDkZRCYFOs/qn0uYnno0DzElJsmt145PDJarUOOdetIJCLYQtmsVSg1Z0DIYc+gruTh7rU/R
	KMpSSE4QWL+9WWHV0Z2PDbSuYfCylZJZavpK+vIvs/4UnPSFx+RY/JbUxgVl+vTZi2Tp9AGyBc1
	rC6I+5x7yCqFfzt7rpe4ug1KnJvpQmpRa5c
X-Received: by 2002:a17:90b:1d52:b0:3aa:fc22:8ab1 with SMTP id 98e67ed59e1d1-3ab3a8a1ad5mr10676812a91.35.1791892604799;
        Tue, 13 Oct 2026 04:56:44 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab37139b59sm21248516a91.13.2026.10.13.04.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 04:56:44 -0700 (PDT)
From: Nanzhe Zhao <nzzhao.sigma@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: Barry Song <baohua@kernel.org>,
	Nanzhe Zhao <zhaonanzhe@xiaomi.com>,
	Juan Yescas <jyescas@google.com>,
	Daeho Jeong <daehojeong@google.com>,
	Dev Jain <Dev.Jain@arm.com>,
	David Hildenbrand <David.Hildenbrand@arm.com>,
	linux-kernel@vger.kernel.org,
	Bo Zhang <zhangbo56@xiaomi.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Nanzhe Zhao <nzzhao@126.com>,
	Pengfei Li <lipengfei28@xiaomi.com>,
	Ryan Roberts <Ryan.Roberts@arm.com>
Subject: [PATCH v4 03/18] f2fs: extend folio state for large folio write path
Date: Tue, 13 Oct 2026 19:56:06 +0800
Message-ID: <20261013115621.968742-4-nzzhao.sigma@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013115621.968742-1-nzzhao.sigma@gmail.com>
References: <20261013115621.968742-1-nzzhao.sigma@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>

Large folio write path needs a subpage status bitmap and write
pages pending counter, while keeping compatible with f2fs private
flags.

Move struct f2fs_folio_state to f2fs.h, add private_flags and
subpage state bitmap, and change PAGE_PRIVATE functions to be
compatible with f2fs_folio_state. Allocate f2fs_folio_state via kzalloc
instead of kmem_cache, since the state size depends on the folio order.

Note: Now if a path wants to use f2fs_folio_state, it must call
`folio_has_ffs` instead of `folio_test_large`` to make check.

Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
---
 fs/f2fs/data.c | 52 ++++++++++++++++++++-----------------
 fs/f2fs/f2fs.h | 70 +++++++++++++++++++++++++++++++++++++-------------
 2 files changed, 80 insertions(+), 42 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index f2d2f0106..29df36d93 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -32,15 +32,9 @@
 
 static struct kmem_cache *bio_post_read_ctx_cache;
 static struct kmem_cache *bio_entry_slab;
-static struct kmem_cache *ffs_entry_slab;
 static mempool_t *bio_post_read_ctx_pool;
 static struct bio_set f2fs_bioset;
 
-struct f2fs_folio_state {
-	spinlock_t		state_lock;
-	unsigned int		read_pages_pending;
-};
-
 #define	F2FS_BIO_POOL_SIZE	NR_CURSEG_TYPE
 
 int __init f2fs_init_bioset(void)
@@ -2703,17 +2697,31 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 }
 #endif
 
-static struct f2fs_folio_state *ffs_find_or_alloc(struct folio *folio)
+struct f2fs_folio_state *f2fs_ffs_find_or_alloc(struct folio *folio)
 {
-	struct f2fs_folio_state *ffs = folio->private;
+	struct f2fs_folio_state *ffs;
+	unsigned int nr_subpages = folio_nr_pages(folio);
+	unsigned long private = (unsigned long)folio->private;
 
-	if (ffs)
-		return ffs;
+	f2fs_bug_on(F2FS_F_SB(folio), !folio_test_large(folio));
+	f2fs_bug_on(F2FS_F_SB(folio),
+		    test_bit(F2FS_FOLIO_PRIVATE_NOT_POINTER, &private));
 
-	ffs = f2fs_kmem_cache_alloc(ffs_entry_slab,
-			GFP_NOIO | __GFP_ZERO, true, NULL);
+	if (f2fs_folio_has_ffs(folio))
+		return (struct f2fs_folio_state *)folio->private;
+
+	ffs = f2fs_kmalloc(F2FS_F_SB(folio),
+			struct_size(ffs, state, BITS_TO_LONGS(2 * nr_subpages)),
+			GFP_NOFS | __GFP_ZERO);
+	if (!ffs)
+		return NULL;
 
 	spin_lock_init(&ffs->state_lock);
+	if (folio_test_uptodate(folio))
+		bitmap_set(ffs->state, 0, nr_subpages);
+	if (folio_test_dirty(folio))
+		bitmap_set(ffs->state, nr_subpages, nr_subpages);
+
 	folio_attach_private(folio, ffs);
 	return ffs;
 }
@@ -2722,7 +2730,7 @@ static void ffs_detach_free(struct folio *folio)
 {
 	struct f2fs_folio_state *ffs;
 
-	if (!folio_test_large(folio)) {
+	if (!f2fs_folio_has_ffs(folio)) {
 		folio_detach_private(folio);
 		return;
 	}
@@ -2732,7 +2740,8 @@ static void ffs_detach_free(struct folio *folio)
 		return;
 
 	WARN_ON_ONCE(ffs->read_pages_pending != 0);
-	kmem_cache_free(ffs_entry_slab, ffs);
+	WARN_ON_ONCE(atomic_read(&ffs->write_pages_pending));
+	kfree(ffs);
 }
 
 static int f2fs_read_data_large_folio(struct inode *inode,
@@ -2821,7 +2830,11 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 		 * to prevent from premature folio_end_read() call on folio
 		 */
 		if (folio_test_large(folio)) {
-			ffs = ffs_find_or_alloc(folio);
+			ffs = f2fs_ffs_find_or_alloc(folio);
+			if (!ffs) {
+				ret = -ENOMEM;
+				goto err_out;
+			}
 
 			/* set the bitmap to wait */
 			spin_lock_irq(&ffs->state_lock);
@@ -4732,21 +4745,12 @@ int __init f2fs_init_bio_entry_cache(void)
 	if (!bio_entry_slab)
 		return -ENOMEM;
 
-	ffs_entry_slab = f2fs_kmem_cache_create("f2fs_ffs_slab",
-			sizeof(struct f2fs_folio_state));
-
-	if (!ffs_entry_slab) {
-		kmem_cache_destroy(bio_entry_slab);
-		return -ENOMEM;
-	}
-
 	return 0;
 }
 
 void f2fs_destroy_bio_entry_cache(void)
 {
 	kmem_cache_destroy(bio_entry_slab);
-	kmem_cache_destroy(ffs_entry_slab);
 }
 
 static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index dd9b4e4a8..90da387f4 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1618,6 +1618,18 @@ static inline void f2fs_clear_bit(unsigned int nr, char *addr);
  * Layout B: lowest bit should be 0
  * folio->private is a wrapped pointer.
  */
+
+struct f2fs_folio_state {
+	spinlock_t		state_lock;
+	unsigned int		read_pages_pending;
+	atomic_t		write_pages_pending;
+	unsigned long		private_flags;
+	/* state[0..nr_subpages - 1] tracks uptodate subpages.
+	 * state[nr_subpages..2 * nr_subpages - 1] tracks dirty subpages.
+	 */
+	unsigned long		state[];
+};
+
 enum {
 	F2FS_FOLIO_PRIVATE_NOT_POINTER,		/* private contains non-pointer data */
 	F2FS_FOLIO_PRIVATE_ONGOING_MIGRATION,		/* data page which is on-going migrating */
@@ -1626,6 +1638,13 @@ enum {
 	F2FS_FOLIO_PRIVATE_MAX
 };
 
+static inline bool f2fs_folio_has_ffs(const struct folio *folio)
+{
+	unsigned long private = (unsigned long)folio->private;
+
+	return folio_test_large(folio) && private;
+}
+
 /* For compression */
 enum compress_algorithm_type {
 	COMPRESS_LZO,
@@ -2753,38 +2772,53 @@ static inline int inc_valid_block_count(struct f2fs_sb_info *sbi,
 	return -ENOSPC;
 }
 
+static inline unsigned long f2fs_folio_get_private_flags(const struct folio *folio)
+{
+	unsigned long private = (unsigned long)folio->private;
+
+	if (f2fs_folio_has_ffs(folio)) {
+		struct f2fs_folio_state *ffs = (struct f2fs_folio_state *)private;
+
+		return READ_ONCE(ffs->private_flags);
+	}
+
+	if (test_bit(F2FS_FOLIO_PRIVATE_NOT_POINTER, &private))
+		return private;
+
+	return 0;
+}
+
+static inline unsigned long *f2fs_folio_flags_addr(struct folio *folio)
+{
+	if (f2fs_folio_has_ffs(folio))
+		return &((struct f2fs_folio_state *)folio->private)->private_flags;
+
+	return (unsigned long *)&folio->private;
+}
+
 #define F2FS_FOLIO_PRIVATE_GET_FUNC(name, flagname) \
 static inline bool folio_test_f2fs_##name(const struct folio *folio)	\
 {									\
-	unsigned long priv = (unsigned long)folio->private;		\
-	unsigned long v = (1UL << F2FS_FOLIO_PRIVATE_NOT_POINTER) |	\
-			     (1UL << F2FS_FOLIO_PRIVATE_##flagname);	\
-	return (priv & v) == v;						\
+	return f2fs_folio_get_private_flags(folio) &			\
+				(1UL << F2FS_FOLIO_PRIVATE_##flagname);	\
 }
 
 #define F2FS_FOLIO_PRIVATE_SET_FUNC(name, flagname) \
 static inline void folio_set_f2fs_##name(struct folio *folio)		\
 {									\
-	unsigned long v = (1UL << F2FS_FOLIO_PRIVATE_NOT_POINTER) |	\
-			     (1UL << F2FS_FOLIO_PRIVATE_##flagname);	\
 	if (!folio->private)						\
-		folio_attach_private(folio, (void *)v);			\
-	else {								\
-		v |= (unsigned long)folio->private;			\
-		folio->private = (void *)v;				\
-	}								\
+		folio_attach_private(folio,				\
+				(void *)BIT(F2FS_FOLIO_PRIVATE_NOT_POINTER));	\
+	set_bit(F2FS_FOLIO_PRIVATE_##flagname, f2fs_folio_flags_addr(folio));	\
 }
 
 #define F2FS_FOLIO_PRIVATE_CLEAR_FUNC(name, flagname) \
 static inline void folio_clear_f2fs_##name(struct folio *folio)		\
 {									\
-	unsigned long v = (unsigned long)folio->private;		\
-									\
-	v &= ~(1UL << F2FS_FOLIO_PRIVATE_##flagname);			\
-	if (v == (1UL << F2FS_FOLIO_PRIVATE_NOT_POINTER))		\
+	clear_bit(F2FS_FOLIO_PRIVATE_##flagname,				\
+		  f2fs_folio_flags_addr(folio));			\
+	if (folio->private == (void *)BIT(F2FS_FOLIO_PRIVATE_NOT_POINTER))	\
 		folio_detach_private(folio);				\
-	else								\
-		folio->private = (void *)v;				\
 }
 
 F2FS_FOLIO_PRIVATE_GET_FUNC(nonpointer, NOT_POINTER);
@@ -2801,7 +2835,7 @@ F2FS_FOLIO_PRIVATE_CLEAR_FUNC(atomic, ATOMIC_WRITE);
 
 static inline unsigned long folio_get_f2fs_data(struct folio *folio)
 {
-	unsigned long data = (unsigned long)folio->private;
+	unsigned long data = f2fs_folio_get_private_flags(folio);
 
 	if (!test_bit(F2FS_FOLIO_PRIVATE_NOT_POINTER, &data))
 		return 0;
-- 
2.43.0

