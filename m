Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793202263;
	b=5BxNkXIjZMg+10y+caFCGKYgaKeRU+at2hxNmKB3GLOWSkMatazkN6SDABilTR0lXSQs
	 tZxjZHkuh0kmbcpJ0zXDqE+UxDP1whmEucR1emEmL5M5s2sirl9VXy/Wz/6rnGLoVPpn/
	 LqPVEaMJAEFW+by51wNS7kpbahF7wlvfVSKjdwUcDLU7w8F12MCkZfcusmmVoEM6ihQXi
	 ApDNlhCPguFeWm0Vh26NOxTino2ZLGPKVUR3aQGXLCmc+fiOReeqZxF3oCP3t8clY8Pb6
	 d291zVH78o8xeojhiM9QCuIW4iPIZCpqGe/KjqgUFiyfRpqEBG0LBA/2GqgF80pWo+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793202263;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=X8fjzAlkHQ+spZ9OJDYnZxfXyBlmpj3vSy9ru7UJT1o=;
	b=EtPgthxnmZDSeCEj8hJ8PHPur33+fw6xvlg15wmzQ321+aqGJX9h0APPNLPh7NpTPyPd
	 Av0DAAg+DiEglXa5OcstjPzETqPy2T5H0EMmmDbbnFDrY4TBBUAozn22deySRrW+V4KZA
	 ly8NorasP+BwYh4bR+SM596WVUjZLMBtR44nV6SdvJBpRNAN936R3JTSSc8msZYqo/AES
	 xzNM7TWLLpTfXSEGRIYKp0n7BWbQLkNFVeOyJ2H7A6pci9TZsIK0sD9lsM+pKH1pYvp/z
	 WrBS6VKGn3zbx226UwbH9WE4ileoliZOfbNyA0CCD88RJVCRNlezg0kjih0/yrJYLUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PSwjvobh;
	arc=none smtp.remote-ip=74.125.227.133
Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8194060A5BC3
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:44:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8194060A5BC3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PSwjvobh
Received: by mail-pj2-f5.google.com with SMTP id d9443c01a7336-2eb0c699769so1306855ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793202263; x=1793807063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X8fjzAlkHQ+spZ9OJDYnZxfXyBlmpj3vSy9ru7UJT1o=;
        b=PSwjvobhsdb+AX2//0VAyfnQTevWnJeUHCUAIxhER+kGg8AbtlqihKsI4LSpzpe0Gx
         UWDhW2eOanw/7SpcwkE487TrQVVG596IyDdadz6qVetUasbkQUam6JAt8OJVfq/8cKsv
         j3W6p9L98QMxwvOpEZQQ1rTmovbcFmslK17jnuHuZ7aE4xK1cy25O0cEZbMchzorBxFZ
         OHa5Klw52XjXAqjQR7/GYqEVC8xLmJNL4CRa/ZxhoTFqYS9MtzAHrvg30U8oHb63ggWy
         ukJtIiPd8uIsCBPdKgo+wiaxfEta0g1Hs8ejYVfTFtDKlmxwrh5Abw6ExivJVK76lpN3
         5HsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793202263; x=1793807063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X8fjzAlkHQ+spZ9OJDYnZxfXyBlmpj3vSy9ru7UJT1o=;
        b=xVNofkPLLkAy9WN2Hmz4YyaSFYQyhVI8QmvJ8cQgm0++lIHRK0NaOL05IWACV1EIbH
         ou95bYo4jUEGJNBNfbwTjrIJsCC0ZQb3anX2Y4X6lLc4ozq5KbsN9EaliLZmkN0ES31g
         jRoUFAzQmeNa+agpzPActNHIoYPVe31gPg2+HGBLHmLNjvTLWA5yStH40bImb9vkx8A4
         v4zFlhe81ijccOxPUiAsrfqqN8Bqa9wPsDFN+k6blpF4x3xhPlzjfPiROgX2v7NGaYrk
         sVebpDaLdgyd23pozr9I/Ms95bwq/IXSz24G+vTS9dGx6tfSmVT78XNwOtgqnkVxf6NG
         +qVg==
X-Forwarded-Encrypted: i=1; AKwUvBy2F7X0rIW+Prd4o0Us5t2GY4zA0H6gayekf7V+NzDzSkOJjptJcXvGqBWPNxBVqn703rUQBQ3gF8lM/cU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKcUTmJwkkhUx7zxyRwolK3US8FxCUT2F8tNeiKVUedm7RvmyCq
	5xnXMSFhhHBSw0LG0Iezxb08qhqjbFGcbwWIL90Nfgq64WmqO24Gsevb
X-Gm-Gg: AYBFou07nMhfpiPaD6ZzFG6Zi4jod5T+C7xbL4/zSefxC18a6SHHsoBjLYexim5A8bR
	f8FFcY/ideN2jE0ye0m89AZsfwWTURQGVUZng+19+EZhP5vyWaK3d+/Dhyseq2tkFbeFUx9+8Ym
	XeCxLm30rugFPNrszjBYOFSV14XC1YKJuZsLCAEiGDJiFnXp2Sxr0fIraFwwiTKH9Oqr03C0lqo
	Tzv/lcyyD7crhbGg5znWh7vbfSdpc+ZZUShSnZC19kOYlO5M3XdKVO1eqoi+uT11rC8HuyfExzw
	GoWziKuzCL49wYp13bKTaf9snb5kKSbP2FFr6l46xXc5VdelyUueDgzNoFzlM+KG1s/83bHWcLz
	NVTQlONdeQXhAU6dSUj93Lbr8+GKZd9QTV1xRcyNKIft/DyyJmvKh+WlUsul7EaxhPm7bgSRSuo
	f0HPd5WhZF+0DNvLRwMAZEEzoc+YFxL1mD/AawVrJQHs9sjtzpoEXYaBbU8AxzdcxsozWHn4oyP
	gldagyqZOldp2zpgiPvRlkeYpjPeexN7XWQNyXWZEjdZaHbDPTpsSD3SMvH0TBx94I0PcIJjFZG
	0qg4EzfNoXHO+nC3yzDxyXGi/K4Jz2qk2BpYEeQFqh/2vlhewL08fdqBX+lYRSOS31cO
X-Received: by 2002:a17:902:d4c4:b0:2e6:4e5:b399 with SMTP id d9443c01a7336-2eb003763c3mr26501805ad.26.1793202262780;
        Wed, 28 Oct 2026 08:44:22 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6be5105sm24111655ad.37.2026.10.28.08.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:44:22 -0700 (PDT)
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
Subject: [PATCH v8 01/15] f2fs: extend folio state for large folio write path
Date: Wed, 28 Oct 2026 23:43:52 +0800
Message-ID: <20261028154407.1601430-2-nzzhao.sigma@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028154407.1601430-1-nzzhao.sigma@gmail.com>
References: <20261028154407.1601430-1-nzzhao.sigma@gmail.com>
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
 fs/f2fs/data.c | 72 ++++++++++++++++++++++++++++----------------
 fs/f2fs/f2fs.h | 81 +++++++++++++++++++++++++++++++++++++++-----------
 2 files changed, 110 insertions(+), 43 deletions(-)

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
index aedba8b79baa..116c36a37f30 100644
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
@@ -2419,6 +2431,24 @@ do {							\
 		f2fs_fault_report(sbi->sb, REPORT_FAULT_NEED_FSCK, __func__, __LINE__);	\
 } while (0)
 
+static inline bool f2fs_folio_has_ffs(const struct folio *folio)
+{
+	unsigned long private = (unsigned long)folio->private;
+
+	if (!folio_test_large(folio) || !private)
+		return false;
+
+	/*
+	 * A large folio should always carry f2fs_folio_state rather than
+	 * non-pointer private flags at its folio->private.
+	 */
+	if (unlikely(test_bit(PAGE_PRIVATE_NOT_POINTER, &private))) {
+		f2fs_bug_on(F2FS_F_SB(folio), 1);
+		return false;
+	}
+	return true;
+}
+
 static inline void clear_sbi_flag(struct f2fs_sb_info *sbi, unsigned int type)
 {
 	clear_bit(type, &sbi->s_flag);
@@ -2759,13 +2789,35 @@ static inline int inc_valid_block_count(struct f2fs_sb_info *sbi,
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
@@ -2777,14 +2829,10 @@ static inline bool page_private_##name(struct page *page) \
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
@@ -2797,13 +2845,10 @@ static inline void set_page_private_##name(struct page *page) \
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
@@ -2826,7 +2871,7 @@ PAGE_PRIVATE_CLEAR_FUNC(atomic, ATOMIC_WRITE);
 
 static inline unsigned long folio_get_f2fs_data(struct folio *folio)
 {
-	unsigned long data = (unsigned long)folio->private;
+	unsigned long data = f2fs_folio_get_private_flags(folio);
 
 	if (!test_bit(PAGE_PRIVATE_NOT_POINTER, &data))
 		return 0;
-- 
2.43.0

