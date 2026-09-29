Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3786A39CCFE
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790666987; cv=none; b=Osvfy/DBjciKcQE7zojDMoyHqOfGBhZNoF1iRbFsEsl7pEXxM7KGzflSOmHk3h7slzjMOrBZajxYmSZ+coY1HvFtXXVpP+CDpfsS2J0o/ZfwJwfA15yNdSvbNOYndxymbQ08XmIF3Av5Mp6UW2KWIOevZNV8CjTit1uILfQRPD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790666987; c=relaxed/simple;
	bh=VqPYDy37/vTuEuvTzzRn+FWfgtf8yFfD7nxPxRV4IUk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LxACrKnUXz2KdNAsMrGSNadPyTB4oWJPgJVQPtnIGHK5LvXW9DZ2ROk6WlOBaMz77Lwb+JRr2NQ5M5sdt5Z8btgMFCB1iDHt60xgy232Law69c77Lz9/GYR7kuqmKXmBgnddG98iLx/Zg9uJs+Y4NlEVRr7Sub1W5G/cSX9LTWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SDv6zpqP; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SDv6zpqP"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-396ccd5cf02so1980400a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 00:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790666984; x=1791271784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RPAQIg6jjARiLgLMiPFuuJDqfS+9cwBZUol2ydi87Jk=;
        b=SDv6zpqPr+tXAo/Zt7KE6tFNU6Nbfdwhosm4RWZE9UNB8lfnxPqF62WD9jADR8iNy7
         TnQ2RqjEiGM/W8pmy/1i3AgOp24MGQcF3tmUHxwYSN9z9E6YRHsNPsjSAvQ7jYCVHd30
         NwZFagbzL7LM1B29eCs5Q56d2OVEXMstsc2gdDkn/H1eTbIghONv/i1LRA2LZpzrWQdd
         dd+roGQ7pXAA1kt5CaVKd5W4SGuJtJorhM3klay9BGZkaoiu1OIBz5aTWWRd7aYjCZ3J
         p2FNNOY1AEDscwQNbqGp8q/Wo7ZKMgR4HnnKYRTII6oUrJZtN1hFmfBV+UFi4IbFkowv
         I1Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790666984; x=1791271784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RPAQIg6jjARiLgLMiPFuuJDqfS+9cwBZUol2ydi87Jk=;
        b=savptsdVQrgbA5wrgzROfVpOpKkbjeLo6hgJlTpSS7+HN0b996KwZKRZgJBRDSWMx0
         dk25+bgE4YHkaVzux1xYySL5x01cHjM5urajkhYSUgirNAKe0Ign2cwY4eMU7FrmtQSZ
         M5iaY+u4W0rjzw/n89StXuhXuYYriU2g665u9b23bPPmJvfXyMAjMseZ99tc/aeU3r/Q
         VuDEvrEfdurt0IGAzKrwUtT3C0wJ1FWhUeM+6Q99Cdpx4AySmFOWXbeBlNaTE9HKf+QV
         QdO0W6rU6kDcpKDRDfd4x+z63kRrEDICA0exN3ZgmUpJll/kp0zpIZewqpzJiUP8Zs7N
         OlnA==
X-Forwarded-Encrypted: i=1; AKwUvByvGxEZTvMHrSjxv12jIorA5uxQpM+vnfyo3vCCB0GOj2WV1FMhDHxFELaRfkHKbz8ATx0yM/TK95e4oE8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRYV3LMoM/lx88Tl1WHD5mT8F2NDEI0nFne6c0XKo2I+0Cs3bi
	4kmK40sdkcI/674yCfrtqbQp6v9cKw/SOMLzp6aVr3082WHLIhpoiIBz
X-Gm-Gg: AYBFou3XZcj2dBNHAgSfQmDoY9Lg9cshjuNhJ8pv9PLZq/8ShMaf5F1u8WwUZD9HOZY
	Eo0Wp79PJwfobQFxM5bXLEJnTZbR6Kg23btX25VjuVF1eAbFsn2g0MsvmtmuB/CgzBPkpE7v+re
	Hy3ObSbWSUAjuvOyxDNkYzeoXXYrMk4PoPw4fqh8N+kVWD4QmKK0++hD/rHWG9Ozw5eNu+8O/Tw
	MuY3eYKFzy3IkxLW2ONJkBNhW0s77L8mas4eqHWNYwoioi7Gv7JtrSQ6nCI/6Ry69PkPk8KC/kU
	7IkJi2dpSVD5g+97H4G9/gne+dosczFUB8v4WWi59w+o1cO9/bZ9E4O27M9VIpPx6IT4S3Us8j3
	XgrGffI3QSnG7UTN1YRz23EdBZT+OPTrbca2hdUL+8uPFxQ9q4acgQS8xmziTD7oaxm0l1XXSGR
	WTM2kiSxt2eXuFSlCQXV9QwPJ3DpFgYZA34QPf1qDbwTn71UxyM3lXQC/n4VFaPQXV1ZC5Sdef2
	FgK7XHZGGC1zWardYHssRj7fYLnWu80NlA=
X-Received: by 2002:a17:90a:b81:b0:3a0:abc3:afb5 with SMTP id 98e67ed59e1d1-3a0abc3c2a8mr7657309a91.34.1790666984396;
        Tue, 29 Sep 2026 00:29:44 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a49804220fsm3900170a91.12.2026.09.29.00.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 00:29:43 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: Barry Song <baohua@kernel.org>,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Wenjie Qi <qiwenjie@xiaomi.com>
Subject: [RFC PATCH 4/6] f2fs: restore compressed node cache entries before access
Date: Tue, 29 Sep 2026 15:29:17 +0800
Message-ID: <5172cd03c44dde8c47ba88f92bef03ed37723d07.1790665952.git.qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1790665952.git.qiwenjie@xiaomi.com>
References: <cover.1790665952.git.qiwenjie@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A node-cache lookup may find a compressed entry, but existing callers
expect ordinary node bytes. Restore the raw block before returning the
entry to those callers.

Perform the restore under the entry lock. Validate the allocation size,
compressed length, LZ4 output size and raw-block CRC before publishing the
raw representation. Move a successful restore to the raw LRU tail, and
keep RESTORED set until the existing footer, inode-checksum and node-type
validation has completed.

A raw-buffer allocation failure leaves the compressed entry intact for a
later retry. Invalid compressed data is discarded and the lookup falls
back to the normal disk-read path. The entry never owns raw and compressed
storage at the same time.

Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
---
 fs/f2fs/cache.c               |  12 ++++
 fs/f2fs/cache.h               |  20 ++++++
 fs/f2fs/data.c                |   5 +-
 fs/f2fs/f2fs.h                |  10 +++
 fs/f2fs/inode.c               |  20 +++++-
 fs/f2fs/node.c                |  55 ++++++++++++---
 fs/f2fs/node_cache_compress.c | 129 ++++++++++++++++++++++++++++++++++
 fs/f2fs/node_cache_compress.h |  13 ++++
 8 files changed, 251 insertions(+), 13 deletions(-)

diff --git a/fs/f2fs/cache.c b/fs/f2fs/cache.c
index 480412f6c729..9cb541dd5cea 100644
--- a/fs/f2fs/cache.c
+++ b/fs/f2fs/cache.c
@@ -64,6 +64,7 @@ bool f2fs_mark_cache_dirty(struct f2fs_cached_block *entry)
 {
 	struct f2fs_cached_block_list *cache = entry->cache;
 
+	f2fs_nc_content_changed(entry);
 	f2fs_cache_set_uptodate(entry);
 
 #ifdef CONFIG_F2FS_CHECK_FS
@@ -94,6 +95,8 @@ void f2fs_drop_cache_dirty(struct f2fs_cached_block *entry)
 				F2FS_DIRTY_META : F2FS_DIRTY_NODES;
 
 	f2fs_cache_clear_uptodate(entry);
+	if (!f2fs_cache_test_compressed(entry))
+		f2fs_nc_content_changed(entry);
 
 	if (!f2fs_cache_test_and_clear_dirty(entry))
 		return;
@@ -286,7 +289,16 @@ struct f2fs_cached_block *f2fs_grab_cache(
 	entry = f2fs_insert_cache(cache, index, new);
 found:
 	if (lock) {
+		int ret;
+
 		f2fs_lock_cache(entry);
+		if (entry->cache == cache) {
+			ret = f2fs_nc_restore(entry);
+			if (ret) {
+				f2fs_put_cache(entry, true);
+				return ERR_PTR(ret);
+			}
+		}
 		/* has been truncated */
 		if (entry->cache != cache) {
 			f2fs_put_cache(entry, true);
diff --git a/fs/f2fs/cache.h b/fs/f2fs/cache.h
index 8a1eab71b1ae..603c5f7203b7 100644
--- a/fs/f2fs/cache.h
+++ b/fs/f2fs/cache.h
@@ -66,6 +66,7 @@ enum f2fs_cached_state {
 	F2FS_BLOCK_INLINE_DATA,		/* indicate inline data */
 #ifdef CONFIG_F2FS_FS_NODE_CACHE_COMPRESSION
 	F2FS_BLOCK_COMPRESSED,
+	F2FS_BLOCK_RESTORED,
 #endif
 };
 
@@ -151,6 +152,25 @@ F2FS_CACHE_FLAG_TEST_AND_CLEAR_FUNC(referenced, REFERENCED);
 F2FS_CACHE_FLAG_TEST_FUNC(compressed, COMPRESSED);
 F2FS_CACHE_FLAG_SET_FUNC(compressed, COMPRESSED);
 F2FS_CACHE_FLAG_CLEAR_FUNC(compressed, COMPRESSED);
+F2FS_CACHE_FLAG_TEST_FUNC(restored, RESTORED);
+F2FS_CACHE_FLAG_SET_FUNC(restored, RESTORED);
+F2FS_CACHE_FLAG_CLEAR_FUNC(restored, RESTORED);
+#else
+static inline bool f2fs_cache_test_compressed(const struct f2fs_cached_block *entry)
+{
+	return false;
+}
+
+static inline void f2fs_cache_set_compressed(struct f2fs_cached_block *entry) { }
+static inline void f2fs_cache_clear_compressed(struct f2fs_cached_block *entry) { }
+
+static inline bool f2fs_cache_test_restored(const struct f2fs_cached_block *entry)
+{
+	return false;
+}
+
+static inline void f2fs_cache_set_restored(struct f2fs_cached_block *entry) { }
+static inline void f2fs_cache_clear_restored(struct f2fs_cached_block *entry) { }
 #endif
 
 static inline void *cache_address(const struct f2fs_cached_block *entry)
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 6d4ba5e77906..3c07fdecbd32 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -26,6 +26,7 @@
 #include "node.h"
 #include "segment.h"
 #include "iostat.h"
+#include "node_cache_compress.h"
 #include <trace/events/f2fs.h>
 
 #define NUM_PREALLOC_POST_READ_CTXS	128
@@ -393,8 +394,10 @@ static void f2fs_cache_read_end_io(struct bio *bio)
 				entry->index, NODE_TYPE_REGULAR, true))
 			bio->bi_status = BLK_STS_IOERR;
 
-		if (bio->bi_status == BLK_STS_OK)
+		if (bio->bi_status == BLK_STS_OK) {
+			f2fs_nc_content_changed(entry);
 			f2fs_cache_set_uptodate(entry);
+		}
 
 		dec_cache_count(sbi, io_type);
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 16cc050124dd..a5d8ab041aa8 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4001,6 +4001,16 @@ int f2fs_pin_file_control(struct inode *inode, bool inc);
  */
 void f2fs_set_inode_flags(struct inode *inode);
 bool f2fs_inode_chksum_verify(struct f2fs_sb_info *sbi, struct f2fs_cached_block *entry);
+#ifdef CONFIG_F2FS_FS_NODE_CACHE_COMPRESSION
+bool f2fs_inode_chksum_valid(struct f2fs_sb_info *sbi,
+			     struct f2fs_cached_block *entry);
+#else
+static inline bool
+f2fs_inode_chksum_valid(struct f2fs_sb_info *sbi, struct f2fs_cached_block *entry)
+{
+	return true;
+}
+#endif
 void f2fs_inode_chksum_set(struct f2fs_sb_info *sbi, struct f2fs_cached_block *entry);
 struct inode *f2fs_iget(struct super_block *sb, unsigned long ino);
 struct inode *f2fs_iget_retry(struct super_block *sb, unsigned long ino);
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 9164a2b5d9f0..bd4a46dd7a9e 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -168,7 +168,9 @@ static __u32 f2fs_inode_chksum(struct f2fs_sb_info *sbi, struct f2fs_cached_bloc
 	return chksum;
 }
 
-bool f2fs_inode_chksum_verify(struct f2fs_sb_info *sbi, struct f2fs_cached_block *entry)
+static bool __f2fs_inode_chksum_verify(struct f2fs_sb_info *sbi,
+				       struct f2fs_cached_block *entry,
+					bool report)
 {
 	struct f2fs_inode *ri;
 	__u32 provided, calculated;
@@ -187,7 +189,7 @@ bool f2fs_inode_chksum_verify(struct f2fs_sb_info *sbi, struct f2fs_cached_block
 	provided = le32_to_cpu(ri->i_inode_checksum);
 	calculated = f2fs_inode_chksum(sbi, entry);
 
-	if (provided != calculated)
+	if (provided != calculated && report)
 		f2fs_warn(sbi, "checksum invalid, nid = %lu, ino_of_node = %u, %x vs. %x",
 			  entry->index, ino_of_node(sbi, entry),
 			  provided, calculated);
@@ -195,6 +197,20 @@ bool f2fs_inode_chksum_verify(struct f2fs_sb_info *sbi, struct f2fs_cached_block
 	return provided == calculated;
 }
 
+bool f2fs_inode_chksum_verify(struct f2fs_sb_info *sbi,
+			      struct f2fs_cached_block *entry)
+{
+	return __f2fs_inode_chksum_verify(sbi, entry, true);
+}
+
+#ifdef CONFIG_F2FS_FS_NODE_CACHE_COMPRESSION
+bool f2fs_inode_chksum_valid(struct f2fs_sb_info *sbi,
+			     struct f2fs_cached_block *entry)
+{
+	return __f2fs_inode_chksum_verify(sbi, entry, false);
+}
+#endif
+
 void f2fs_inode_chksum_set(struct f2fs_sb_info *sbi, struct f2fs_cached_block *entry)
 {
 	struct f2fs_inode *ri = F2FS_INODE(entry);
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index be14dfa31e53..2cf8ebf0c114 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -19,6 +19,7 @@
 #include "segment.h"
 #include "xattr.h"
 #include "iostat.h"
+#include "node_cache_compress.h"
 #include <trace/events/f2fs.h>
 
 #define on_f2fs_build_free_nids(nm_i) mutex_is_locked(&(nm_i)->build_lock)
@@ -1467,7 +1468,15 @@ static int read_node_cache(struct f2fs_cached_block *entry, blk_opf_t op_flags)
 	};
 	int err;
 
+	if (WARN_ON_ONCE(f2fs_cache_test_compressed(entry) || !entry->data))
+		return -EFSCORRUPTED;
+
 	if (f2fs_cache_test_uptodate(entry)) {
+		if (f2fs_cache_test_restored(entry) &&
+		    !f2fs_inode_chksum_valid(sbi, entry)) {
+			f2fs_nc_validation_failed(entry);
+			goto read_disk;
+		}
 		if (!f2fs_inode_chksum_verify(sbi, entry)) {
 			f2fs_cache_clear_uptodate(entry);
 			return -EFSBADCRC;
@@ -1475,6 +1484,7 @@ static int read_node_cache(struct f2fs_cached_block *entry, blk_opf_t op_flags)
 		return LOCKED_CACHE;
 	}
 
+read_disk:
 	err = f2fs_get_node_info(sbi, entry->index, &ni, false);
 	if (err)
 		return err;
@@ -1520,14 +1530,14 @@ void f2fs_ra_node_cache(struct f2fs_sb_info *sbi, nid_t nid)
 	f2fs_put_cache(entry, err ? true : false);
 }
 
-int f2fs_sanity_check_node_footer(struct f2fs_sb_info *sbi,
-					struct f2fs_cached_block *entry, pgoff_t nid,
-					enum node_type ntype, bool in_irq)
+static bool f2fs_node_footer_valid(struct f2fs_sb_info *sbi,
+				   struct f2fs_cached_block *entry, pgoff_t nid,
+				   enum node_type ntype)
 {
 	bool is_inode, is_xnode;
 
 	if (unlikely(nid != nid_of_node(sbi, entry)))
-		goto out_err;
+		return false;
 
 	is_inode = IS_INODE(sbi, entry);
 	is_xnode = f2fs_has_xattr_block(ofs_of_node(sbi, entry));
@@ -1535,27 +1545,46 @@ int f2fs_sanity_check_node_footer(struct f2fs_sb_info *sbi,
 	switch (ntype) {
 	case NODE_TYPE_REGULAR:
 		if (is_inode && is_xnode)
-			goto out_err;
+			return false;
 		break;
 	case NODE_TYPE_INODE:
 		if (!is_inode || is_xnode)
-			goto out_err;
+			return false;
 		break;
 	case NODE_TYPE_XATTR:
 		if (is_inode || !is_xnode)
-			goto out_err;
+			return false;
 		break;
 	case NODE_TYPE_NON_INODE:
 		if (is_inode)
-			goto out_err;
+			return false;
 		break;
 	case NODE_TYPE_NON_IXNODE:
 		if (is_inode || is_xnode)
-			goto out_err;
+			return false;
 		break;
 	default:
 		break;
 	}
+	return true;
+}
+
+static bool f2fs_restored_footer_valid(struct f2fs_sb_info *sbi,
+				       struct f2fs_cached_block *entry,
+				       pgoff_t nid, enum node_type ntype)
+{
+	if (f2fs_node_footer_valid(sbi, entry, nid, ntype))
+		return true;
+	f2fs_nc_validation_failed(entry);
+	return false;
+}
+
+int f2fs_sanity_check_node_footer(struct f2fs_sb_info *sbi,
+				  struct f2fs_cached_block *entry, pgoff_t nid,
+				  enum node_type ntype, bool in_irq)
+{
+	if (!f2fs_node_footer_valid(sbi, entry, nid, ntype))
+		goto out_err;
 	if (time_to_inject(sbi, FAULT_INCONSISTENT_FOOTER))
 		goto out_err;
 	return 0;
@@ -1588,6 +1617,7 @@ static struct f2fs_cached_block *__get_node_cache(struct f2fs_sb_info *sbi, pgof
 	if (IS_ERR(entry))
 		return entry;
 
+read_cache:
 	err = read_node_cache(entry, 0);
 	if (err < 0)
 		goto out_put_err;
@@ -1614,9 +1644,14 @@ static struct f2fs_cached_block *__get_node_cache(struct f2fs_sb_info *sbi, pgof
 		goto out_err;
 	}
 entry_hit:
+	if (f2fs_cache_test_restored(entry) &&
+	    !f2fs_restored_footer_valid(sbi, entry, nid, ntype))
+		goto read_cache;
 	err = f2fs_sanity_check_node_footer(sbi, entry, nid, ntype, false);
-	if (!err)
+	if (!err) {
+		f2fs_nc_validation_succeeded(entry);
 		return entry;
+	}
 out_err:
 	f2fs_drop_cache_dirty(entry);
 out_put_err:
diff --git a/fs/f2fs/node_cache_compress.c b/fs/f2fs/node_cache_compress.c
index 50e9c820eb81..9c2d19e5e821 100644
--- a/fs/f2fs/node_cache_compress.c
+++ b/fs/f2fs/node_cache_compress.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <linux/atomic.h>
 #include <linux/f2fs_fs.h>
+#include <linux/lz4.h>
 #include <linux/refcount.h>
 #include <linux/slab.h>
 
@@ -99,6 +100,10 @@ struct f2fs_nc_ctx {
 	atomic64_t shrink_scanned[F2FS_NC_NR_QUEUES];
 	atomic64_t shrink_freed[F2FS_NC_NR_QUEUES];
 	atomic64_t detached[F2FS_NC_NR_QUEUES];
+	/* Cumulative restore statistics since mount. */
+	atomic64_t compressed_to_raw;
+	atomic64_t restored_hits;
+	atomic64_t restore_failures;
 	/* Signed quota history carried between shrinker calls. */
 	s64 shrink_credit[F2FS_NC_NR_QUEUES];
 	/* Mount reference plus references held by compressed objects. */
@@ -280,6 +285,130 @@ void f2fs_nc_free_data(struct f2fs_cached_block *entry)
 	f2fs_nc_ctx_put(ctx);
 }
 
+static int
+f2fs_nc_publish_raw(struct f2fs_cached_block *entry,
+		    struct f2fs_node_cached_block *node,
+		    struct f2fs_nc_ctx *ctx, void *raw, bool restored)
+{
+	struct f2fs_cached_block_list *cache = entry->cache;
+	void *object = entry->data;
+	u32 len = node->compressed_len;
+	u32 alloc_size = node->compressed_alloc_size;
+	unsigned int queue = f2fs_nc_entry_queue(entry);
+
+	spin_lock(&cache->list_lock);
+	entry->data = raw;
+	f2fs_cache_clear_compressed(entry);
+	node->owner = NULL;
+	node->compressed_len = 0;
+	node->compressed_alloc_size = 0;
+	node->compressed_crc = 0;
+	if (restored) {
+		f2fs_cache_set_restored(entry);
+		f2fs_cache_set_uptodate(entry);
+	} else {
+		f2fs_cache_clear_restored(entry);
+		f2fs_cache_clear_uptodate(entry);
+	}
+	list_move_tail(&entry->list, &cache->lru_list);
+	f2fs_nc_account_del(ctx, queue, len, alloc_size);
+	f2fs_nc_account_add(ctx, F2FS_NC_RAW, 0, 0);
+	atomic64_inc(&ctx->compressed_to_raw);
+	spin_unlock(&cache->list_lock);
+
+	f2fs_nc_store_free(ctx->store, object, alloc_size);
+	f2fs_nc_ctx_put(ctx);
+	return 0;
+}
+
+static int
+f2fs_nc_restore_fallback(struct f2fs_cached_block *entry,
+			 struct f2fs_node_cached_block *node,
+			 struct f2fs_nc_ctx *ctx)
+{
+	void *raw;
+
+	raw = f2fs_kmalloc(ctx->sbi, ctx->sbi->blocksize, GFP_NOFS);
+	if (!raw)
+		return -ENOMEM;
+	atomic64_inc(&ctx->restore_failures);
+	return f2fs_nc_publish_raw(entry, node, ctx, raw, false);
+}
+
+int f2fs_nc_restore(struct f2fs_cached_block *entry)
+{
+	struct f2fs_node_cached_block *node;
+	struct f2fs_nc_ctx *ctx;
+	struct f2fs_sb_info *sbi;
+	void *raw;
+	int ret;
+
+	if (!entry || !entry->cache || !IS_NODE_CACHE(entry->cache) ||
+	    !f2fs_cache_test_compressed(entry))
+		return 0;
+	if (WARN_ON_ONCE(!f2fs_cache_test_locked(entry)))
+		return -EFSCORRUPTED;
+	if (WARN_ON_ONCE(f2fs_cache_test_dirty(entry) ||
+			 f2fs_cache_test_writeback(entry)))
+		return -EFSCORRUPTED;
+
+	node = f2fs_nc_node_entry(entry);
+	ctx = node->owner;
+	if (!ctx || ctx != entry->cache->sbi->node_compress || !entry->data)
+		return -EFSCORRUPTED;
+	sbi = ctx->sbi;
+	if (f2fs_nc_store_bucket_from_size(node->compressed_alloc_size) < 0)
+		return -EFSCORRUPTED;
+	if (!node->compressed_len ||
+	    node->compressed_len > node->compressed_alloc_size)
+		return f2fs_nc_restore_fallback(entry, node, ctx);
+
+	raw = f2fs_kmalloc(sbi, sbi->blocksize, GFP_NOFS);
+	if (!raw)
+		return -ENOMEM;
+	ret = LZ4_decompress_safe(entry->data, raw, node->compressed_len,
+				  sbi->blocksize);
+	if (ret != sbi->blocksize ||
+	    f2fs_crc32(raw, sbi->blocksize) != node->compressed_crc) {
+		atomic64_inc(&ctx->restore_failures);
+		return f2fs_nc_publish_raw(entry, node, ctx, raw, false);
+	}
+	return f2fs_nc_publish_raw(entry, node, ctx, raw, true);
+}
+
+void f2fs_nc_validation_failed(struct f2fs_cached_block *entry)
+{
+	struct f2fs_nc_ctx *ctx;
+
+	if (f2fs_cache_test_restored(entry) && entry->cache) {
+		ctx = entry->cache->sbi->node_compress;
+		if (ctx)
+			atomic64_inc(&ctx->restore_failures);
+	}
+	f2fs_cache_clear_restored(entry);
+	f2fs_cache_clear_uptodate(entry);
+}
+
+void f2fs_nc_validation_succeeded(struct f2fs_cached_block *entry)
+{
+	struct f2fs_nc_ctx *ctx;
+
+	if (f2fs_cache_test_restored(entry) && entry->cache) {
+		ctx = entry->cache->sbi->node_compress;
+		if (ctx)
+			atomic64_inc(&ctx->restored_hits);
+	}
+	f2fs_cache_clear_restored(entry);
+}
+
+void f2fs_nc_content_changed(struct f2fs_cached_block *entry)
+{
+	if (!entry || !entry->cache || !IS_NODE_CACHE(entry->cache))
+		return;
+	WARN_ON_ONCE(f2fs_cache_test_compressed(entry));
+	f2fs_cache_clear_restored(entry);
+}
+
 static void f2fs_nc_population_snapshot(struct f2fs_nc_ctx *ctx,
 					unsigned long nr[F2FS_NC_NR_QUEUES])
 {
diff --git a/fs/f2fs/node_cache_compress.h b/fs/f2fs/node_cache_compress.h
index e7d6b07c1c98..faeb342b9cc3 100644
--- a/fs/f2fs/node_cache_compress.h
+++ b/fs/f2fs/node_cache_compress.h
@@ -29,6 +29,10 @@ size_t f2fs_nc_entry_alloc_size(struct f2fs_cached_block_list *cache);
 void f2fs_nc_init(struct f2fs_sb_info *sbi);
 void f2fs_nc_destroy(struct f2fs_sb_info *sbi);
 void f2fs_nc_free_data(struct f2fs_cached_block *entry);
+int f2fs_nc_restore(struct f2fs_cached_block *entry);
+void f2fs_nc_validation_failed(struct f2fs_cached_block *entry);
+void f2fs_nc_validation_succeeded(struct f2fs_cached_block *entry);
+void f2fs_nc_content_changed(struct f2fs_cached_block *entry);
 struct list_head *f2fs_nc_queue_head(struct f2fs_cached_block_list *cache,
 				     unsigned int queue);
 unsigned int f2fs_nc_entry_queue(const struct f2fs_cached_block *entry);
@@ -54,6 +58,15 @@ static inline void f2fs_nc_free_data(struct f2fs_cached_block *entry)
 	kfree(entry->data);
 }
 
+static inline int f2fs_nc_restore(struct f2fs_cached_block *entry)
+{
+	return 0;
+}
+
+static inline void f2fs_nc_validation_failed(struct f2fs_cached_block *entry) { }
+static inline void f2fs_nc_validation_succeeded(struct f2fs_cached_block *entry) { }
+static inline void f2fs_nc_content_changed(struct f2fs_cached_block *entry) { }
+
 static inline struct list_head *f2fs_nc_queue_head(struct f2fs_cached_block_list *cache,
 						   unsigned int queue)
 {
-- 
2.43.0

