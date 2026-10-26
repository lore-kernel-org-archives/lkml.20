Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792985878;
	b=IVm/dYpzHzbVIhn76SC+T0wKUntO6K+3KPNGMA3Sw+Q6A0nOXSYuRhmrpdDGqnY9wCMy
	 qrdYBnQeCZYGadP9qo9vCTnTCy2TY3I4cH+dfg7fhhhTk6mUREb+B2hI4k6g/c2jt9Uj/
	 6kNHAlXdrbb27DEr/lry7X+4W8C5NBblEVqvSh30vKlIgk9xLtco2O/ZZsbzF6vn4+k55
	 wK3Dg3TEPnyNM0aPArtTqxhav8z2aVPAElJR3fdiM0htR8bb29g/Jhso4+SfdU6o0XSiK
	 SNuIB1qWuMFz6OWrnxyG5d9pF5Ro/UaBrhRipyJWu+l1T/Kxlq9yGX0CVm4SAwanrFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792985878;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lMlqpaRFsYMjPhkFJOcJPppvwGnf+qxqVIRhFqwXViY=;
	b=BmFgiOq7qxOcUZZW9Mq1BJLZ9Co3QzoC+4pgeebV8c99eaq49njZZPeywj14A0slqMi4
	 lXzZGP/b3M9Zhj/PCw3O+WxvQbYc67xtHpKi3Upja3IzHW1EZLMHKuhDg88XMhfHgx6BB
	 xhWz+7joVNpCgwaYyNLoTXsO8Qs6D5sd/pRQ6zQPW7rs56K7ar8WX790rKAF8nB0aDcXW
	 4DdOvMhudIBsI5K4zv524uWp46VpCZv7UUbGdaHEM5fOQJlcG0cjdZYPNjc4bOl4Fpba9
	 j5uEJHt3Gj/uk/RCoYY9OItD+h4QaNOIPZD+IFoJuDHx/YHpUxuBiVqH1F0o+9DWHxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Happwsh1;
	arc=none smtp.remote-ip=74.125.227.134
Received: from mail-pj2-f6.google.com (mail-pj2-f6.google.com [74.125.227.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D853606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:37:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D853606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Happwsh1
Received: by mail-pj2-f6.google.com with SMTP id 98e67ed59e1d1-3ad41dad3faso1711113a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 20:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792985877; x=1793590677; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lMlqpaRFsYMjPhkFJOcJPppvwGnf+qxqVIRhFqwXViY=;
        b=Happwsh1nw/q5z67UIZO3nt8ga6R84ZhdvoukGoF9JWTWuLPErjo14XZyzzon4Kyor
         NKso2g8p/Vu9wpnV+XzeL3nFP+dHJD4K/0wEdQXy6FFPHK5uJG5vhobzt1xVWWxMBKeE
         3ZzbQx91YWI09do9xZd179MCDhZmRIfIDLcuzFeY3vUgIiiIhX06KH+T4NhSfgpMW2RI
         mCTXyoIuGQ6U0EgygSJKMhib3mgttiLcZT0uUaO6WzYFyqRCdZyeDYMypaOPuHp/+SUV
         TsnZbyNSlGBBoOINefroMIgaNofCxSm8rrh94mPeJoZOv6c0/nuUWwA2ww5W6PnvK/8T
         HKKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792985877; x=1793590677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lMlqpaRFsYMjPhkFJOcJPppvwGnf+qxqVIRhFqwXViY=;
        b=bLpDrSuK5jetVnh6zZ57QnVv9fDPsfrTy4sX/uExCpO3ddi94JpHtSJaiqui3A8mo/
         ooYPni9UCRDdpoIeU2rug67YGmxovXlJrC3wIy+UnPxyXZjNACu2qdZQMl8zHMClFFUI
         PHDNR5UvuMZpacxqTdHgOzIPyYlntrEgbCV1gTJB3V93WwdPUDU6/CLFt6GVj3LUJhhu
         PeC9DJFHu7XZtbbDmjwCj3mEmE5F+guzdGsdnjYWABDD4270LgmNxeBYiMPLvnxlyUo4
         maR8yJPOaJnsfm9mlBN2tHJ4A73bB1ulZlXFqHr1t5VHJ6AWwd4CAcJUuTlZ0riT+LKW
         mRbQ==
X-Forwarded-Encrypted: i=1; AKwUvBxyvNvgEcamS1E22STiXeHne19lKaz4vvxGLRXgfvwNQUlGqzhWc2BG/ReAvJO+5AMw4AlSMTVH7Lvwwto=@vger.kernel.org
X-Gm-Message-State: AFq9FYJgbAQxpp1Pi/rCIGpYcmD0HN0UDI4hbl89vovT/jN9kEUDvq5h
	Pbt9LWo/dCulvdhs2fYnWd2dRWiZAhb2YAqT5NDBuaYwwTjiVE8FE3MHmiPjHEaJGGOLRw==
X-Gm-Gg: AYBFou0hj5VrUmQQ1HnpzHMkypUTSlDZUnNNgMBLTBgtCgyonblMrzDl1wioQbBPlbR
	SSSBS0nroBEzze3wP6DLsL5efNqbDwGaPe96SmCZJXsfy5UOPcihrccEndTeNBDXR6E6PbupGqm
	0/rouUdGm+ILZPSrpkUNhwFXum+Dfj8tjI/cgfZ22CJnhlbTMSTTKpYDdl0VDDGh4MTfbj6K4cz
	YCawD6Yfei99xmQlBkAjcXP88DhG/OXJKvgxAyRGwl9gBUZfRgiaDg41xeeTUOGAOWSw8omTzkw
	gh2Ax9wLWv7Ww2UlIB8iTj/Ho19NBjoPj8PM0f5dUxh4ZRR73UPjJ/iAPxRpN07urmNt6NDV7di
	A0d7Slw18lR9HRd3HpOVZMVtt4B7MUj8bkePONU9MV77rgFhLPTi9uvQk8Fo9Y3T0pofNXlPqUw
	T9yADbztHBEx/KChh5h3aaCC+gdGKJvreOlcWC81N9PPY3vNl2jjyqRyUyEw47xDR/Q0D5PVK0+
	xCF7YpfxiLskjxo4o1Oz7DfInXNmHAuu4n5jmHb+yYpA8RYQkWZb6khbqjkLRL3ji0nKCbW7FYR
	h3P1pYjiFnchsIC0ew==
X-Received: by 2002:a17:90b:5286:b0:3ab:36c4:b502 with SMTP id 98e67ed59e1d1-3adead5c836mr4807088a91.30.1792985876887;
        Sun, 25 Oct 2026 20:37:56 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebe8f0b2sm6409823a91.8.2026.10.25.20.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 20:37:56 -0700 (PDT)
From: Nanzhe Zhao <nzzhao.sigma@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: Barry Song <baohua@kernel.org>,
	Juan Yescas <jyescas@google.com>,
	Daeho Jeong <daehojeong@google.com>,
	Pengfei Li <lipengfei28@xiaomi.com>,
	Dev Jain <Dev.Jain@arm.com>,
	David Hildenbrand <David.Hildenbrand@arm.com>,
	linux-kernel@vger.kernel.org,
	Bo Zhang <zhangbo56@xiaomi.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Nanzhe Zhao <nzzhao@126.com>,
	Nanzhe Zhao <zhaonanzhe@xiaomi.com>,
	Ryan Roberts <Ryan.Roberts@arm.com>
Subject: [PATCH v7 01/15] f2fs: extend folio state for large folio write path
Date: Mon, 26 Oct 2026 11:37:31 +0800
Message-ID: <20261026033745.784107-2-nzzhao.sigma@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026033745.784107-1-nzzhao.sigma@gmail.com>
References: <20261026033745.784107-1-nzzhao.sigma@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
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
 fs/f2fs/data.c | 72 ++++++++++++++++++++++++++++++++------------------
 fs/f2fs/f2fs.h | 70 +++++++++++++++++++++++++++++++++++-------------
 2 files changed, 99 insertions(+), 43 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index a8d39add5cbe..603a7a570f2a 100644
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
@@ -1656,7 +1650,25 @@ struct folio *f2fs_get_lock_data_folio(struct inode *inode, pgoff_t index,
 
 	/* wait for read completion */
 	folio_lock(folio);
-	if (unlikely(folio->mapping != mapping || !folio_test_uptodate(folio))) {
+
+	if (unlikely(folio->mapping != mapping)) {
+		f2fs_folio_put(folio, true);
+		return ERR_PTR(-EIO);
+	}
+
+	/*
+	 * ffs can be released while the folio was unlocked above.  Rebuild it
+	 * for a fully uptodate folio; a partially uptodate one cannot be
+	 * rebuilt and will fail the uptodate check below.
+	 */
+	if (folio_test_large(folio) && !f2fs_folio_has_ffs(folio)) {
+		if (!f2fs_ffs_find_or_alloc(folio)) {
+			f2fs_folio_put(folio, true);
+			return ERR_PTR(-ENOMEM);
+		}
+	}
+
+	if (unlikely(!folio_test_uptodate(folio))) {
 		f2fs_folio_put(folio, true);
 		return ERR_PTR(-EIO);
 	}
@@ -2717,17 +2729,31 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
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
+		    test_bit(PAGE_PRIVATE_NOT_POINTER, &private));
 
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
@@ -2736,7 +2762,7 @@ static void ffs_detach_free(struct folio *folio)
 {
 	struct f2fs_folio_state *ffs;
 
-	if (!folio_test_large(folio)) {
+	if (!f2fs_folio_has_ffs(folio)) {
 		folio_detach_private(folio);
 		return;
 	}
@@ -2746,7 +2772,8 @@ static void ffs_detach_free(struct folio *folio)
 		return;
 
 	WARN_ON_ONCE(ffs->read_pages_pending != 0);
-	kmem_cache_free(ffs_entry_slab, ffs);
+	WARN_ON_ONCE(atomic_read(&ffs->write_pages_pending));
+	kfree(ffs);
 }
 
 static int f2fs_read_data_large_folio(struct inode *inode,
@@ -2835,7 +2862,11 @@ static int f2fs_read_data_large_folio(struct inode *inode,
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
@@ -4750,21 +4781,12 @@ int __init f2fs_init_bio_entry_cache(void)
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
index aedba8b79baa..abb0c0caed91 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1621,6 +1621,18 @@ static inline void f2fs_clear_bit(unsigned int nr, char *addr);
  * Layout B: lowest bit should be 0
  * page.private is a wrapped pointer.
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
 	PAGE_PRIVATE_NOT_POINTER,		/* private contains non-pointer data */
 	PAGE_PRIVATE_ONGOING_MIGRATION,		/* data page which is on-going migrating */
@@ -1629,6 +1641,13 @@ enum {
 	PAGE_PRIVATE_MAX
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
@@ -2759,13 +2778,35 @@ static inline int inc_valid_block_count(struct f2fs_sb_info *sbi,
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
+	if (test_bit(PAGE_PRIVATE_NOT_POINTER, &private))
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
 #define PAGE_PRIVATE_GET_FUNC(name, flagname) \
 static inline bool folio_test_f2fs_##name(const struct folio *folio)	\
 {									\
-	unsigned long priv = (unsigned long)folio->private;		\
-	unsigned long v = (1UL << PAGE_PRIVATE_NOT_POINTER) |		\
-			     (1UL << PAGE_PRIVATE_##flagname);		\
-	return (priv & v) == v;						\
+	return f2fs_folio_get_private_flags(folio) &			\
+				(1UL << PAGE_PRIVATE_##flagname);	\
 }									\
 static inline bool page_private_##name(struct page *page) \
 { \
@@ -2777,14 +2818,10 @@ static inline bool page_private_##name(struct page *page) \
 #define PAGE_PRIVATE_SET_FUNC(name, flagname) \
 static inline void folio_set_f2fs_##name(struct folio *folio)		\
 {									\
-	unsigned long v = (1UL << PAGE_PRIVATE_NOT_POINTER) |		\
-			     (1UL << PAGE_PRIVATE_##flagname);		\
 	if (!folio->private)						\
-		folio_attach_private(folio, (void *)v);			\
-	else {								\
-		v |= (unsigned long)folio->private;			\
-		folio->private = (void *)v;				\
-	}								\
+		folio_attach_private(folio,				\
+				(void *)BIT(PAGE_PRIVATE_NOT_POINTER));	\
+	set_bit(PAGE_PRIVATE_##flagname, f2fs_folio_flags_addr(folio));	\
 }									\
 static inline void set_page_private_##name(struct page *page) \
 { \
@@ -2797,13 +2834,10 @@ static inline void set_page_private_##name(struct page *page) \
 #define PAGE_PRIVATE_CLEAR_FUNC(name, flagname) \
 static inline void folio_clear_f2fs_##name(struct folio *folio)		\
 {									\
-	unsigned long v = (unsigned long)folio->private;		\
-									\
-	v &= ~(1UL << PAGE_PRIVATE_##flagname);				\
-	if (v == (1UL << PAGE_PRIVATE_NOT_POINTER))			\
+	clear_bit(PAGE_PRIVATE_##flagname,				\
+		  f2fs_folio_flags_addr(folio));			\
+	if (folio->private == (void *)BIT(PAGE_PRIVATE_NOT_POINTER))	\
 		folio_detach_private(folio);				\
-	else								\
-		folio->private = (void *)v;				\
 }									\
 static inline void clear_page_private_##name(struct page *page) \
 { \
@@ -2826,7 +2860,7 @@ PAGE_PRIVATE_CLEAR_FUNC(atomic, ATOMIC_WRITE);
 
 static inline unsigned long folio_get_f2fs_data(struct folio *folio)
 {
-	unsigned long data = (unsigned long)folio->private;
+	unsigned long data = f2fs_folio_get_private_flags(folio);
 
 	if (!test_bit(PAGE_PRIVATE_NOT_POINTER, &data))
 		return 0;
-- 
2.43.0

