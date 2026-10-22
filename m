Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792655634;
	b=zjEcKmckOMNn7b80Cf6niHSlhXCUq18bGGjT+6KXvdc/w0E/hxvXT4ksDUa7dWQ+TSPy
	 eiz+/ldrJZWoUjeIg0LclF/vEztaKIT0yWuDp76B+YwYu/GJqKD8GbWfv0fFvvt1P2fL4
	 sPxhHTTxrAMIy0hLgbwyWwWpTW6x3Fj3JpEHWD+1bF+1eidRy4+CmC+/l6NSj3jhWZdEW
	 iSxKbdOF5iPkrNqRcDAoIz20hctp1ZZKYo7dxX+53IVInb3pNxn/kQGQfEttEuMK74MiQ
	 ES0LiYb+JFi66MnO85wZiHlZXbfh224MDDWyVsHbMO6430z4zs51cgqoREYY3FeLV5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792655634;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iKceci6VJHv/rRa5WNbFzA7PRJnTR1+nNg1bPGxW5J0=;
	b=x9LTQG0lGqTqPBzFFkIe7GIMCmKjP7+nKF8X3xcrbL7dg6szGZnnSEjJWdASRtVc+dOH
	 sNI7zttPKYVQN2xkrVMH1VovIM4XgB9t2LMrIgGK4mW14ESyjF4T1tuonFIbKmQyA4jou
	 zxPntd6WZj2coo69CixChelJQYi5eaZFQiOBGAzT9I4d1OMy0TMT8RwtycVFDZLy5Z6e1
	 MJKVaJbIXDka9bOBbNYl7IUQfxB8+8yF15RmLZQRisSRo7lAKGfh7EzVlpbdGMllz2omy
	 oE1U/fjMsGrC9Y8MurElNIb9N7ACQ1iQHXeFkhprZ4PD17Z+1qucQozfiw4WFvJx4AA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kngWU34a;
	arc=none smtp.remote-ip=74.125.227.134
Received: from mail-pj2-f6.google.com (mail-pj2-f6.google.com [74.125.227.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA2C606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:53:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CA2C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kngWU34a
Received: by mail-pj2-f6.google.com with SMTP id 98e67ed59e1d1-3964e7720afso937648a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 00:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792655634; x=1793260434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iKceci6VJHv/rRa5WNbFzA7PRJnTR1+nNg1bPGxW5J0=;
        b=kngWU34aDo7BCA/c2spp/UYChqzfl+xz8H7CdbKbgfhSGgHg/F+LZacsIqhBtfFDYp
         6QbI8Z61IpC8MNjQIQrs+8GLb42oyVv+gLEMQ+EqTHHGtEvfa/sDHa/YLpST/UWEk8DI
         CtbEi1nRt+P8pu6rfqAvuVozlo13I1e/EXXLfENx9do3KN5O8yo+77CqbHezpBIoFtnM
         CDGg2QYICkQzSaDoOJBtDy48436IIpQZ+U3K65nMSFufF69Jb7GtbQ6WhQ0x2gS4Ye/k
         8MEjMNWIjD8aQoyGiwPXdEJHjrEs96qYK+YKKJ863DAYz//9lusn0fxhjphy9eOf8v2d
         2Qmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792655634; x=1793260434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iKceci6VJHv/rRa5WNbFzA7PRJnTR1+nNg1bPGxW5J0=;
        b=RpHhvmvuGWppJmoPsUJyHMlk+1J8/jWvxBDjagowP7iUtiT/vTChogiflP9LzkP1/u
         BdIsnn9PmJCTAIfNMg8cy/Nv6fB5vaErZeKDTFWU3Y6rjOFWxymMdrxWqO2j0hy38na/
         7dy/aIx0OsOhkqxACEw4oBkEI4gP/YqlFO/IGy1Q6ERxEm0HyJmMqSt+FIv/YSEKqZCU
         7FArYVgcEGJfspCq1TmsOGQpeckVHKD31JVnmCOfbyoVaQs0Kkx3/DUZ0akegNfc9D/v
         OZTl3bG/iiWnshhl89WkvNm753qfQYbeqTW19sKfvHqWRmjRlV16PraKSnin03sIXJ91
         PLFw==
X-Forwarded-Encrypted: i=1; AKwUvBxU9ACffDhLx/9jIea0jcIZwubM3o2nOjayPog1QyorEofN2SaXnf/yExaqVjvi9x3zhE0saj8M/zAGRYY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIUio9VKK79xBb8BBlzay0q0XdKJT0bmpammuiN3arfpt9c6K6x
	g8suPlh/JWl6brP92/WvEPlzFkb2TMpASETxCJUEY90xmAiwZG/sZ44H
X-Gm-Gg: AYBFou3CR0a/vQhamhZZdzZe1jbFOHBk0NtuMVVlptcRY2S4WzcbY5LcphsZ8pUsDNi
	1PKqA16jK9+RQq0biJ6sFzlbd3dgbnQNfPxnJRC2TnNBZe2QvgepsAuB3YLRfVf2hcAdyf06FPn
	3M3aZkv0cs/EGjWd8ikVKEURaV10xO94GIdQ/8EM9G6LKrTFrWHOsZg/mJWi9fwsWsUVtfqGF5v
	S8b/N9HV3JDIsU9vrBAn2WLNrndguWziK27lRsa9gLofvy/oD/pjFy0uG9mWQLyNc/QUn5YUq/n
	bdBfEYUK191nVsOB4WW3ef/Iij/kPblz5h+blnh0MvYHnYMgDF9n9KzXGMo8XNRRyKK1X/xt6Os
	yqAb7Kbjtr+4AaZumelyz1ZSPGY+SMzjyGMrB216+m2vHKiQA4VvZypXaun+j1OqrY+InhUQZY7
	xIp/DEv9MvmuE3vAbY9TiRoHgz8Doex/NRxAMBj9OZylRmX8nZjsiNq37PZ4qtb9r9V7ByHUXCd
	eowFy+3mJnSZ7EtyNt9G+ZuZ1v3rPtXl2pMvxs5q2F+0gHso+ckld9ls28JfNC1OEbITOvRtFqp
	VDyn7AxRA7wi2MRm7g==
X-Received: by 2002:a17:90a:c887:b0:3ac:b3e5:428f with SMTP id 98e67ed59e1d1-3ad8707bfefmr3587115a91.53.1792655633530;
        Thu, 22 Oct 2026 00:53:53 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4896c71sm3202562a91.6.2026.10.22.00.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 00:53:53 -0700 (PDT)
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
Subject: [PATCH v6 01/15] f2fs: extend folio state for large folio write path
Date: Thu, 22 Oct 2026 15:53:28 +0800
Message-ID: <20261022075343.3043003-2-nzzhao.sigma@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022075343.3043003-1-nzzhao.sigma@gmail.com>
References: <20261022075343.3043003-1-nzzhao.sigma@gmail.com>
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
 fs/f2fs/data.c | 52 ++++++++++++++++++++-----------------
 fs/f2fs/f2fs.h | 70 +++++++++++++++++++++++++++++++++++++-------------
 2 files changed, 80 insertions(+), 42 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index a8d39add5cbe..95212e60f09d 100644
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
@@ -2717,17 +2711,31 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
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
@@ -2736,7 +2744,7 @@ static void ffs_detach_free(struct folio *folio)
 {
 	struct f2fs_folio_state *ffs;
 
-	if (!folio_test_large(folio)) {
+	if (!f2fs_folio_has_ffs(folio)) {
 		folio_detach_private(folio);
 		return;
 	}
@@ -2746,7 +2754,8 @@ static void ffs_detach_free(struct folio *folio)
 		return;
 
 	WARN_ON_ONCE(ffs->read_pages_pending != 0);
-	kmem_cache_free(ffs_entry_slab, ffs);
+	WARN_ON_ONCE(atomic_read(&ffs->write_pages_pending));
+	kfree(ffs);
 }
 
 static int f2fs_read_data_large_folio(struct inode *inode,
@@ -2835,7 +2844,11 @@ static int f2fs_read_data_large_folio(struct inode *inode,
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
@@ -4750,21 +4763,12 @@ int __init f2fs_init_bio_entry_cache(void)
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

