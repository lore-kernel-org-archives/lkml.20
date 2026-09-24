Received: from SHSQR01.spreadtrum.com (unknown [222.66.158.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A59C2DF6E9
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 01:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=222.66.158.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790214839; cv=none; b=ku8f1B6819vs+Y+W2Wku5veqasc4r7hJi86ya2ZX76Ja0tX0Yb0Vo9TNhY4PFuOUfpdm3B8jIfRug5c3UOb/lIN4y7dzR6E2jnf/RNz/Q4ekqTTDHw1Q9IgsL/rI+T7yu2rhj+891cPEBnvPqhOVVDEujn5PcriNmFBlRE3es34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790214839; c=relaxed/simple;
	bh=8V0kqfYqfZ5up62eAujF99PryFD6COx3F/ytxPSnRlI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JrPcfcgTRyvdep3EkHtUDl6UNU/s9CzXahOtAm/ljBM/f7uvdnQI1eKxKi73G19s4MceN0FWfor2FnhTiurAUCuBDvIN5Ozaw9EH+WxNICme3UJ/Y4gqhseZQq/WeebLX44kouAh+VZFTTd8FJMRrnWzm4x/dQ+3gTbeR42PeQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=unisoc.com; spf=pass smtp.mailfrom=unisoc.com; dkim=pass (2048-bit key) header.d=unisoc.com header.i=@unisoc.com header.b=OiGKIDkV; arc=none smtp.client-ip=222.66.158.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=unisoc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=unisoc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=unisoc.com header.i=@unisoc.com header.b="OiGKIDkV"
Received: from dlp.unisoc.com ([10.29.3.86])
	by SHSQR01.spreadtrum.com with ESMTPS id 68O1rDnJ017311
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Thu, 24 Sep 2026 09:53:13 +0800 (+08)
	(envelope-from Zhiguo.Niu@unisoc.com)
Received: from SHDLP.spreadtrum.com (BJMBX02.spreadtrum.com [10.0.64.8])
	by dlp.unisoc.com (SkyGuard) with ESMTPS id 4hqxcN5bC4z2N3TjZ;
	Thu, 24 Sep 2026 09:50:28 +0800 (CST)
Received: from bj08434pcu10.spreadtrum.com (10.0.70.50) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.48; Thu, 24 Sep 2026 09:53:11 +0800
From: Zhiguo Niu <zhiguo.niu@unisoc.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
CC: <linux-f2fs-devel@lists.sourceforge.net>, <linux-kernel@vger.kernel.org>,
        <niuzhiguo84@gmail.com>, <zhiguo.niu@unisoc.com>, <ke.wang@unisoc.com>
Subject: [PATCH 2/2] f2fs: remove some stale and unused codes
Date: Thu, 24 Sep 2026 09:52:13 +0800
Message-ID: <20260924015213.1196491-2-zhiguo.niu@unisoc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924015213.1196491-1-zhiguo.niu@unisoc.com>
References: <20260924015213.1196491-1-zhiguo.niu@unisoc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHCAS01.spreadtrum.com (10.0.1.201) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL:SHSQR01.spreadtrum.com 68O1rDnJ017311
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=unisoc.com;
	s=default; t=1790214811;
	bh=kpV47N4iACM0QHYGcErxwKRhkVDQb41yNEqNk4FFwIs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=OiGKIDkVsyLYW/7cW0+1BRFL5z7KNvlCGOO4UaOSNOaF7AHEWY216WtVh80PNUkPf
	 ZnoSdUq7L5d52M8KN8bVeokx1Als/175IF2HhgmEZU1znuyjKcMWzpFbVA8t0WqQkH
	 MlCYRlnq4hOyzhOzYbfDo4SH8dztD3Za+pLXw39e1A3kEOBSMN5J5LMXbj5JHICexw
	 OXq8zV/tCjn2bj3J+enTH6C1qQKKILFHR6aFwSKb9Y/I+mBu73gS0QdLRgtKlCUZRM
	 MrD5iA0qP2oZoOFabLtvFo+UOQ3uVoa+fWezVCApCbQ6jyzFNajr8pbiGC9ilFGws2
	 1H0PFZeesYV6A==

- drop the extern declaration of f2fs_compress_aops which is only
  used by inode->i_mapping->a_ops = &f2fs_compress_aops, was removed
  by commit 6a78d0488116 ("f2fs: cache: use compress cache").

- folio_get_f2fs_data() and folio_set_f2fs_data() in f2fs.h belong to
  the old compress cache inode mechanism; neither is referenced anywhere.

- iostat_set_post_read_ctx() in iostat.h (both the CONFIG_F2FS_IOSTAT
  and the stub branches) is never called: the post-read context is
  assigned directly at both call sites, bio->bi_private = ctx in
  data.c and iostat_ctx->post_read_ctx = ctx in iostat.c.

Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
---
 fs/f2fs/f2fs.h   | 19 -------------------
 fs/f2fs/inode.c  |  4 ----
 fs/f2fs/iostat.h | 11 -----------
 3 files changed, 34 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 089a62c054ea..991deeb9ee1b 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2821,25 +2821,6 @@ PAGE_PRIVATE_CLEAR_FUNC(reference, REF_RESOURCE);
 PAGE_PRIVATE_CLEAR_FUNC(gcing, ONGOING_MIGRATION);
 PAGE_PRIVATE_CLEAR_FUNC(atomic, ATOMIC_WRITE);
 
-static inline unsigned long folio_get_f2fs_data(struct folio *folio)
-{
-	unsigned long data = (unsigned long)folio->private;
-
-	if (!test_bit(PAGE_PRIVATE_NOT_POINTER, &data))
-		return 0;
-	return data >> PAGE_PRIVATE_MAX;
-}
-
-static inline void folio_set_f2fs_data(struct folio *folio, unsigned long data)
-{
-	data = (1UL << PAGE_PRIVATE_NOT_POINTER) | (data << PAGE_PRIVATE_MAX);
-
-	if (!folio_test_private(folio))
-		folio_attach_private(folio, (void *)data);
-	else
-		folio->private = (void *)((unsigned long)folio->private | data);
-}
-
 static inline void dec_valid_block_count(struct f2fs_sb_info *sbi,
 						struct inode *inode,
 						block_t count)
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 9164a2b5d9f0..5627259295fa 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -21,10 +21,6 @@
 
 #include <trace/events/f2fs.h>
 
-#ifdef CONFIG_F2FS_FS_COMPRESSION
-extern const struct address_space_operations f2fs_compress_aops;
-#endif
-
 #define NUM_PREALLOC_EVICT_INODE_WORK 8
 
 static struct kmem_cache *evict_inode_work_cache;
diff --git a/fs/f2fs/iostat.h b/fs/f2fs/iostat.h
index 61c6bc8e3119..2025225b5bed 100644
--- a/fs/f2fs/iostat.h
+++ b/fs/f2fs/iostat.h
@@ -60,13 +60,6 @@ static inline struct bio_post_read_ctx *get_post_read_ctx(struct bio *bio)
 	return iostat_ctx->post_read_ctx;
 }
 
-static inline void iostat_set_post_read_ctx(struct bio *bio, void *ctx)
-{
-	struct bio_iostat_ctx *iostat_ctx = bio->bi_private;
-
-	iostat_ctx->post_read_ctx = ctx;
-}
-
 extern void iostat_update_and_unbind_ctx(struct bio *bio);
 extern void iostat_alloc_and_bind_ctx(struct f2fs_sb_info *sbi,
 		struct bio *bio, struct bio_post_read_ctx *ctx);
@@ -88,10 +81,6 @@ static inline struct bio_post_read_ctx *get_post_read_ctx(struct bio *bio)
 {
 	return bio->bi_private;
 }
-static inline void iostat_set_post_read_ctx(struct bio *bio, void *ctx)
-{
-	bio->bi_private = ctx;
-}
 static inline int f2fs_init_iostat_processing(void) { return 0; }
 static inline void f2fs_destroy_iostat_processing(void) {}
 static inline int f2fs_init_iostat(struct f2fs_sb_info *sbi) { return 0; }
-- 
2.43.0

