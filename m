Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794802170;
	b=TFj7Mfz9MXgrzCzgDJ4FpfcXIXeJlGR9paidqVN3sy4drEQsbcurnJw3OIhkxx/1OOLS
	 RBhTZGmRaUQpJpR0Al7QQeeZIDQRdhCe+dbW6Z3cSiPQ6r1DilP2VnQwjJgcZunm0ETn3
	 b1QmiGjcCEZym4rJvRt7KsmYZCyzZbSKJWEwX5rjv9NxqXRo2NwllptG24HGfz5dH/ZGx
	 4lbGcZoUqVcJ7ktnHgRCfmfnmHX7pwkLHHBkkzwds1K4EaQV/LISI9c+sO2hCW8rdIwDA
	 k7yOsVeinWilMq0DuBGooCeI/TndlD2FlnTT/4PBSdI8g9ad+Krk1jDrntdwfIRMj8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794802170;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jTVVyfonP/unKYGJ3+1FS2r8XOwbDzqwSJPNB4V2nCw=;
	b=PSS600+QnmzSOQ9YFCMkPQePnYRugGOkRHDUg6lkgDMJhMv6tKm3YhkBlGWkU/dkjYE6
	 9t1DlTE8I/q8JiGsvkvEXUzGvK2NA+sR6y06kW7oOCitYhRynEaIvVYH6kUosgvmeo+Qk
	 o0WS2KEhFzw26ap3gcKvxPVOQH4ZgLIn8Nuybb2Meo2BQmjIxGXQgMt6zVgO019Ws5Obw
	 ciCQ1pGvPKJ2u65JQsb1e3zJAOA8mHmD/kwgRstDAVd9uBx0KtalZqyKslquniucuKg2A
	 E6cVKYvixrMwN6sU/G8vG9YeAogAftO7YxmDBzDKLXmXQBFBIXCLqgTlVryZTO+/57Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mMDffw2F;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13087606A881
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:09:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13087606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mMDffw2F
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3adac5b29ebso2575819a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 20:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794802169; x=1795406969; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jTVVyfonP/unKYGJ3+1FS2r8XOwbDzqwSJPNB4V2nCw=;
        b=mMDffw2FxWuUi9OsM/AywYd9pkdNcQnJFVLrfttd5QonW7ZkrIdTFtQdgHf3gpZlUL
         PICjejfsppLLrdJWAQjiB8RxHdpC7OBJyZRYuA5XQRwudvsxqP7YNJ9x8JAryaQ63UmI
         V6D4Gs+98//hDGv3mzBF7Iv0unf5GNC14CV2pFSyVO5WLjG+mK6TAdW8Yx2nGQM/ZwU4
         0EY3+QvoxGm5GCt3HSibEUxUBYVN+FfoU1rMm633bH8dwHO33wVZ0ZowxuiwYlBEnOfE
         5dVUgIAh6KYpVlJ1NIlr9i1clOOL3rcUpVf5smcfuJHotXLCTJCEQjmhc5SO0HQWXCbV
         YxtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794802169; x=1795406969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jTVVyfonP/unKYGJ3+1FS2r8XOwbDzqwSJPNB4V2nCw=;
        b=vamQ92EAFSbSXaE+I87mF2Dv1h7z9ByXw3jUziX1TvHeTcRQHwubMvG2+XD3jQM6jG
         zkNr8fTCZn8fnd5pLVghWquKFewkHNV4HwZzlY0z+gvPtN8NfjR2OYWMNnhQsDb6qdfk
         KlrYQ9e5BgkjewtZEsm8mSqHBcbBQwyIgbjARjjzIsv/SMMKhlM533207CzAUHKm7Wox
         wsnAk3pnxffh3qcLN8k89Xu7yp+inIV4g3jZNe9+8y2vrsKRN9f7kc8E2671XiS0x4SN
         tpbNdMHv2Z6XfCcroBRCXcn+npL4iHqhg7bJUMCpPVSLgl8sgGvTok40xjfY2UahM0Ua
         imGA==
X-Gm-Message-State: APuU4Z+9sCJluKsgHR0t+Xf7U23MZNtNAtFq9XOMjNCkfkGyBQBr3Nxr
	rhzhgsMkGJAgzq5QAWIaFYkZ+8e5jkWjBfVhzvEHmhcvhSBkTtxBauBglnpgFQ==
X-Gm-Gg: AYBFou0J5JJwG+UteVuQByZeoZp71GoV/upWugc9nbQMVO0LFtTi3SdTuDHAv3TWQ+d
	GjuxgDfXpRhVm0JsQP2Ks4OF8Oc5uycq7RehJzYC4QEtfytjbLNsCElyFU36ORz/IDo1fcL1jxj
	LjHCnMfeX3rZXFEYJIiAwlGjwWNxClILrShR+X/J0PeKGyR2uopKt9+fnN9fAnNd3gyZPcKKUOs
	G7NsWcY0V5OkkfyJmCINO4YJ3h0sBHZ8axaimCy5wipbfa6/DTMW7Wuzkuu3ih33VZJli+T7IMN
	BIgM4/m7TUaybcvLi3PxfKJPTCIDQaw9LIBXqfXcRFIsV7mOmQnpbq8Ii169e17/XYj4yIEat+m
	wGYUPrIH4vlk9yt6vo3ggpt/Z9/jfgsQtPfFu8i6Zk+Vv9ihWf7aSnoKTyp3iPJRNDQimKNlmjM
	dlaCIyYFPp4rW/2Ak/op2nt35vJNKGoMW1++DCG5PukgLqiS63hfogGLjdZLfSEjbDSTztE0LNb
	WEkp7uWe+vRIVOFsFzhjm8Muys8v+PiRctDbIhiO33oV4HuC53dLPaCQeyGrPLe2fmAeeOMkltG
	PCmzDo3a2uQSBPe2IYinyi/NE8MnhvhMAUNxLLk+V30x7pY6z77AGARsoAOCw7L69/IcYqOJtzj
	/4NvP/XZqE5gRKrePcF1MxnECdR+o9bJUP2uFsyH1LRRS4AaQ
X-Received: by 2002:a17:90b:4acb:b0:3a4:f75d:d194 with SMTP id 98e67ed59e1d1-3b1b0a20d40mr10265125a91.36.1794802169283;
        Sun, 15 Nov 2026 20:09:29 -0800 (PST)
Received: from f2fs-test.c.googlers.com.com (193.67.125.34.bc.googleusercontent.com. [34.125.67.193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3f09b92sm7191989a91.4.2026.11.15.20.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 20:09:27 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>
Subject: [PATCH v2 15/20] f2fs: support subpage blocks in atomic writes
Date: Sun, 15 Nov 2026 20:08:46 -0800
Message-ID: <20261116040851.2849696-16-daeho43@gmail.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
In-Reply-To: <20261116040851.2849696-1-daeho43@gmail.com>
References: <20261116040851.2849696-1-daeho43@gmail.com>
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

From: Daeho Jeong <daehojeong@google.com>

Writeback already writes dirty blocks to the COW inode per block. Make
write_begin of atomic files reserve and read COW blocks per block as
well, and remove the -EOPNOTSUPP checks. Skipping the read of the
blocks that a write fully covers also applies to large folios when the
block size equals PAGE_SIZE.

Aborting atomic writes drops the page cache and restores i_size without
i_gc_rwsem[WRITE] and invalidate_lock. With subpage blocks, a page fault
in between can make a folio writable with only the blocks within the
smaller i_size prepared, and a read can zero-fill the blocks beyond it
and mark them uptodate, while they are inside the restored i_size. GC
reads through the page cache as well once FI_ATOMIC_FILE is cleared, and
then moves the zeroes. Hold both locks across it as
f2fs_ioc_start_atomic_write() does, except at eviction, where no one
else uses the inode.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/data.c    | 24 ++++++++++++++++--------
 fs/f2fs/file.c    | 30 ++++++++++++++++++++++--------
 fs/f2fs/inode.c   |  1 +
 fs/f2fs/segment.c |  7 +++++++
 4 files changed, 46 insertions(+), 16 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 9f7f8214d10e..b4f16afccc51 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -4698,7 +4698,7 @@ static int f2fs_write_cache_folios(struct address_space *mapping,
 		}
 
 		if (f2fs_has_subpage_blocks(sbi) &&
-		    (f2fs_compressed_file(inode) || f2fs_is_atomic_file(inode))) {
+		    f2fs_compressed_file(inode)) {
 			WARN_ON_ONCE(1);
 			mapping_set_error(mapping, -EOPNOTSUPP);
 			folio_clear_dirty_for_io(folio);
@@ -5325,7 +5325,7 @@ static int prepare_large_folio_write_begin(struct inode *inode,
 	int err = 0;
 
 	if (f2fs_has_subpage_blocks(sbi) &&
-	    (f2fs_compressed_file(inode) || f2fs_is_atomic_file(inode)))
+	    f2fs_compressed_file(inode))
 		return -EOPNOTSUPP;
 
 	/*
@@ -5441,13 +5441,16 @@ static int prepare_large_folio_atomic_write_begin(struct inode *inode,
 	/* Inline data must have been converted before reaching here. */
 	f2fs_bug_on(sbi, f2fs_has_inline_data(inode));
 
-	start = folio->index + (ori_off >> PAGE_SHIFT);
-	end = folio->index + ((ori_off + len - 1) >> PAGE_SHIFT);
+	start = f2fs_folio_lblk(sbi, folio) + F2FS_BYTES_TO_BLK(sbi, ori_off);
+	end = f2fs_folio_lblk(sbi, folio) +
+		F2FS_BYTES_TO_BLK(sbi, ori_off + len - 1);
 
 	for (index = start; index <= end; index++) {
+		loff_t block_start = F2FS_BLK_TO_BYTES(sbi, index);
+		loff_t block_end = block_start + F2FS_BLKSIZE(sbi);
 		block_t blkaddr = NULL_ADDR;
 		bool node_changed = false;
-		size_t off = (index - folio->index) << PAGE_SHIFT;
+		size_t off = f2fs_folio_byte_offset(sbi, folio, index);
 
 		err = prepare_atomic_write_begin(sbi, inode, index,
 						&blkaddr, &node_changed,
@@ -5455,12 +5458,17 @@ static int prepare_large_folio_atomic_write_begin(struct inode *inode,
 		if (err)
 			return err;
 
+		/* Skip read if the write covers the entire block. */
+		if (pos <= block_start && pos + len >= block_end)
+			goto balance;
+
 		if (f2fs_ffs_test_blk_uptodate(folio, index))
 			goto balance;
 
 		if (blkaddr == NEW_ADDR) {
-			folio_zero_segment(folio, off, off + PAGE_SIZE);
-			f2fs_ffs_mark_subrange_uptodate(folio, off, PAGE_SIZE);
+			folio_zero_segment(folio, off, off + F2FS_BLKSIZE(sbi));
+			f2fs_ffs_mark_subrange_uptodate(folio, off,
+							F2FS_BLKSIZE(sbi));
 			goto balance;
 		}
 
@@ -5517,7 +5525,7 @@ static int f2fs_write_begin(const struct kiocb *iocb,
 	}
 
 	if (f2fs_has_subpage_blocks(sbi) &&
-	    (f2fs_compressed_file(inode) || f2fs_is_atomic_file(inode))) {
+	    f2fs_compressed_file(inode)) {
 		err = -EOPNOTSUPP;
 		goto fail;
 	}
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 8540613e3b22..d6304b705e06 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2314,7 +2314,7 @@ static long f2fs_fallocate(struct file *file, int mode,
 	}
 
 	if (f2fs_has_subpage_blocks(F2FS_I_SB(inode))) {
-		if (f2fs_is_atomic_file(inode) || f2fs_compressed_file(inode)) {
+		if (f2fs_compressed_file(inode)) {
 			ret = -EOPNOTSUPP;
 			goto out;
 		}
@@ -2358,6 +2358,23 @@ static long f2fs_fallocate(struct file *file, int mode,
 	return ret;
 }
 
+/*
+ * Abort atomic writes with inode_lock held. Until i_size is restored, GC,
+ * page faults and reads would see the i_size of the aborted writes, so keep
+ * them away as f2fs_ioc_start_atomic_write() does.
+ */
+static void f2fs_abort_atomic_write_locked(struct inode *inode, bool clean)
+{
+	if (!f2fs_is_atomic_file(inode))
+		return;
+
+	f2fs_down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
+	filemap_invalidate_lock(inode->i_mapping);
+	f2fs_abort_atomic_write(inode, clean);
+	filemap_invalidate_unlock(inode->i_mapping);
+	f2fs_up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
+}
+
 static int f2fs_release_file(struct inode *inode, struct file *filp)
 {
 	if (atomic_dec_and_test(&F2FS_I(inode)->open_count))
@@ -2372,7 +2389,7 @@ static int f2fs_release_file(struct inode *inode, struct file *filp)
 		return 0;
 
 	inode_lock(inode);
-	f2fs_abort_atomic_write(inode, true);
+	f2fs_abort_atomic_write_locked(inode, true);
 	inode_unlock(inode);
 
 	return 0;
@@ -2391,7 +2408,7 @@ static int f2fs_file_flush(struct file *file, fl_owner_t id)
 	if (F2FS_I(inode)->atomic_write_task == current &&
 				(current->flags & PF_EXITING)) {
 		inode_lock(inode);
-		f2fs_abort_atomic_write(inode, true);
+		f2fs_abort_atomic_write_locked(inode, true);
 		inode_unlock(inode);
 	}
 
@@ -2568,9 +2585,6 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
 	loff_t isize;
 	int ret;
 
-	if (f2fs_has_subpage_blocks(sbi))
-		return -EOPNOTSUPP;
-
 	if (!(filp->f_mode & FMODE_WRITE))
 		return -EBADF;
 
@@ -2702,7 +2716,7 @@ static int f2fs_ioc_commit_atomic_write(struct file *filp)
 		if (!ret)
 			ret = f2fs_do_sync_file(filp, 0, LLONG_MAX, 0, true);
 
-		f2fs_abort_atomic_write(inode, ret);
+		f2fs_abort_atomic_write_locked(inode, ret);
 	} else {
 		ret = f2fs_do_sync_file(filp, 0, LLONG_MAX, 1, false);
 	}
@@ -2730,7 +2744,7 @@ static int f2fs_ioc_abort_atomic_write(struct file *filp)
 
 	inode_lock(inode);
 
-	f2fs_abort_atomic_write(inode, true);
+	f2fs_abort_atomic_write_locked(inode, true);
 
 	inode_unlock(inode);
 
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 5c6a64b31b05..2bc15fa192be 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -851,6 +851,7 @@ static void f2fs_pre_evict_inode(struct inode *inode)
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct f2fs_inode_info *fi = F2FS_I(inode);
 
+	/* No one else uses the inode now, so the locks are not needed. */
 	f2fs_abort_atomic_write(inode, true);
 
 	if (fi->cow_inode && f2fs_is_cow_file(fi->cow_inode)) {
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 93f165151c0f..5bff57723e2d 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -186,6 +186,13 @@ bool f2fs_need_SSR(struct f2fs_sb_info *sbi)
 			SM_I(sbi)->min_ssr_sections + reserved_sections(sbi));
 }
 
+/*
+ * The callers hold i_gc_rwsem[WRITE] and invalidate_lock as
+ * f2fs_ioc_start_atomic_write() does, so that no page is read, by GC either,
+ * or made writable between dropping the page cache and restoring i_size, i.e.
+ * with the i_size of the aborted writes. Only the eviction does not, as no one
+ * else uses the inode then.
+ */
 void f2fs_abort_atomic_write(struct inode *inode, bool clean)
 {
 	struct f2fs_inode_info *fi = F2FS_I(inode);
-- 
2.56.0.611.g1030f0b940-goog

