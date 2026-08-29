Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8FA1FE47B
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 06:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787983543; cv=none; b=M8E6BP081sGQUVROALCivSrdr9FtLZRjJ+DpkYyvuzP3Ox758u6I5g9ySNUUbYCPHhTqRVto9sw0h/1tcJ/3SBIZsogUME9b95qmWXYUD6KvdQJLyd/o6V50sqYFrJnsNNEYsMiqpOjAbwjNQdyTObIEMT3+McuV4gRLkMtLGwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787983543; c=relaxed/simple;
	bh=2udbTejBij4UJD39tt4TcDOF8Fu7pNrGgtsmkkekgJI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D8EOBwhFsGT0yrKYXRweiF2Gy2nytdg2+AnVTgPI4dCFk5J6yjaBgcHi2JAcUL1lWZj8192IP0D0+67tKYGmj27awgJ90sKqGDDA2k/GBTrkBcme1d4wLKHNuerP22e9rM+OhoHFL7GFeA2wObG/3mSqnaD3wpp5aATAp++CWBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JJDWBqbz; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JJDWBqbz"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-398a5aad413so424024a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 23:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787983541; x=1788588341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I5So2O3euKFFg61wXFy7xjMLgdHoSVBr97j8orXpOWw=;
        b=JJDWBqbzmlcFIzm72zfgvf+5ZXxSAfTrfsNSdD3PquE1et1dTl8ttQU47x4vWADudL
         c/Q+7LE8lP3ufm7l6TCvmh/7mv1KUkUsVsnz9KX6JkZ1PqRF0gkp4rRcEfFhQ0aXMLMW
         pJNoEbFI2XQVl8g5IwB1zBdxV6hqMaAeCDumQTkqF/IHYCtD79+w443mTpdITinSODHH
         0bJOoC+EsBzVMzIJ9Gow55ZVIfkUC9ZQQbYzJ7QeXPvj7zShpMf51t3zL70kbbixQkDA
         b24gO5I00UeQ96NHrUXMWJ5gXEdq1XDTkP9XInMXbSTsIkKZrzAvupGLSUthObDf+DCL
         DRpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787983541; x=1788588341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I5So2O3euKFFg61wXFy7xjMLgdHoSVBr97j8orXpOWw=;
        b=P6wqhCWjE0Cx7M0qDUWi7ayC65cJmbEC9MTqklZBnA8uwae5FuhgHR5ReXZq1vB5F7
         7cNm3AoUscorxyqarn5hBEoSD7XKCvMGZI41Fs+ULSl+hEuTToFGCfUcbYTkRCHHP+Si
         tlR03Exvug9e5/ApRaeio0AoaWdtW5gJq+Oxk2yb4s//5WGfhZ/ZAM3zVJ32Rcq73SVv
         ndUy45taFc/UBlr8wOh1yPW/PUd9LP0jxB+mPCReOB5tSFdQNF9P7hi0Ik4db9Clra7O
         QcFSbhH1pCAgoVDYmEaJlhVrWiu+derK2XijqDQac0XDLFLNZMQiV+RSJ81GYSwzPzPp
         I3sw==
X-Forwarded-Encrypted: i=1; AKwUvBxQO4FJtbKve0k1ux74TCfjfHO1khmoAbDFEF9VemgEb/MVDqXZorNiz6Nq50hTfBleThZhTfIIYkr+uhc=@vger.kernel.org
X-Gm-Message-State: AFuF++liMwOuHuV8aTrs33O3jfnQbWV07OWQRe6pKS/jOcHbtplC+wvB
	yKcknEh7ZWmdle2uUAR6Pw1QL5Rrwrav0JCZvjha9baZDDScwcE/qEZV
X-Gm-Gg: AYBFou06d9Rkf59NVGW+d9fHvzhD7YtwBCHXO13KG1N9AuJIB6m6leRsRfaDQqCYdcM
	YkVl7fwHkbZo7ScjlUPYUvUuuuxCF96lOS1u7y9r2S3W8nm3hVQ8xOyVuHR2D7+HdTl5kpTnM35
	dv3wGO0FiCQ2Onc+cTGT92n9/0ynTY9qbpG/qzVqIb/HNGsVONEwjdRkvIlAiQVUAqrW+7nG04Y
	/+vmAnhCkMAOehWYBvBz6ylhdMF1FN1qUHBMTnvlhKUo1e8w9wEmW9f1W9cSSeyW3yq1LdA3JNr
	94pgRFO/kRd90Mg55t6awIR5epcYK7YDtGC9Rup61blWM3qQuN2QuYCNwflI+xCYeE6vSmstUN/
	xrgvB70TLMsFNIDjDvM4c1HF688ioQI83HXJrc8i9164B690py5orpe+1EfonTJGIUJGTCxsP9e
	ytQA1d9e0sddCh4PwIJfdmGr5J52bDmJSXoal1RZDma0XtxSf77YdQ8Q0UUPVluXoEJqR190dVj
	7fc7Np13IatYsbFUZ0RuB8qmYl2Z4dMoERd
X-Received: by 2002:a17:90b:37cc:b0:366:10f1:3d91 with SMTP id 98e67ed59e1d1-396d0d92d0amr22678953a91.1.1787983541205;
        Fri, 28 Aug 2026 23:05:41 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396dda36ed6sm5609411a91.2.2026.08.28.23.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 23:05:40 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: sunqiuyang@huawei.com,
	daeho43@gmail.com,
	daehojeong@google.com,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	qiwenjie@xiaomi.com,
	qwjhust@gmail.com
Subject: [PATCH v2 2/2] f2fs: refresh pinned allocation boundary after resize
Date: Sat, 29 Aug 2026 14:05:24 +0800
Message-ID: <20260829060524.2656620-3-qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260829060524.2656620-1-qiwenjie@xiaomi.com>
References: <20260829060524.2656620-1-qiwenjie@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pinned_area_max_secno is derived from MAIN_SECS(), the zoned device
boundary, and resizable_tail_secno. It is currently recalculated only
at mount and remount, so online resize leaves the pre-resize value
active after MAIN_SECS() changes.

A stale value can allow pinned allocations in sections outside the
new main-area boundary.

Move the calculation to segment.h and call it whenever
update_fs_metadata() changes MAIN_SECS(). This also restores the
previous boundary when a final checkpoint error rolls the resize
metadata back.

Mount option validation compares the tail count with the pre-resize
section count. Recalculating after a shrink below that tail would make
the unsigned subtraction wrap. Reject such a shrink with -EINVAL and
report the geometry before acquiring a mount write reference.

A concurrent remount can change the tail after that early check.
Recheck it after freezing the filesystem and taking the resize locks,
before changing block counts or filesystem geometry.

Fixes: c966d29e01bb ("f2fs: support resizable tail section and unify pinned allocation")
Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
---
Changes since v1:
- Simplify the incompatible-tail condition.
- Log the main, shrink, and tail section counts on rejection.
- Validate before acquiring the mount write reference.
- Restore compact formatting in the shared boundary helper.
- Recheck after freeze to cover a concurrent remount option change.

 fs/f2fs/gc.c      | 27 ++++++++++++++++++++++++---
 fs/f2fs/segment.h | 13 +++++++++++++
 fs/f2fs/super.c   | 15 ++-------------
 3 files changed, 39 insertions(+), 16 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 0a00180c21dc..3c61bf675afa 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -2326,6 +2326,7 @@ static void update_fs_metadata(struct f2fs_sb_info *sbi, int secs)
 	SM_I(sbi)->segment_count = (int)SM_I(sbi)->segment_count + segs;
 	MAIN_SEGS(sbi) = (int)MAIN_SEGS(sbi) + segs;
 	MAIN_SECS(sbi) += secs;
+	f2fs_adjust_pinned_area_boundary(sbi);
 	if (sbi->allocate_section_hint > MAIN_SECS(sbi))
 		sbi->allocate_section_hint = MAIN_SECS(sbi);
 	FREE_I(sbi)->free_sections = (int)FREE_I(sbi)->free_sections + secs;
@@ -2349,6 +2350,19 @@ static void update_fs_metadata(struct f2fs_sb_info *sbi, int secs)
 	}
 }
 
+static bool f2fs_resize_tail_invalid(struct f2fs_sb_info *sbi,
+				     unsigned int secs)
+{
+	if (MAIN_SECS(sbi) >
+			secs + F2FS_OPTION(sbi).resizable_tail_secno)
+		return false;
+
+	f2fs_err(sbi, "Invalid resize: main %u, shrink %u, tail %u",
+		 MAIN_SECS(sbi), secs,
+		 F2FS_OPTION(sbi).resizable_tail_secno);
+	return true;
+}
+
 int f2fs_resize_fs(struct file *filp, __u64 block_count)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(file_inode(filp));
@@ -2392,13 +2406,15 @@ int f2fs_resize_fs(struct file *filp, __u64 block_count)
 		return -EINVAL;
 	}
 
+	shrunk_blocks = old_block_count - block_count;
+	secs = div_u64(shrunk_blocks, BLKS_PER_SEC(sbi));
+	if (f2fs_resize_tail_invalid(sbi, secs))
+		return -EINVAL;
+
 	err = mnt_want_write_file(filp);
 	if (err)
 		return err;
 
-	shrunk_blocks = old_block_count - block_count;
-	secs = div_u64(shrunk_blocks, BLKS_PER_SEC(sbi));
-
 	/* stop other GC */
 	if (!f2fs_down_write_trylock_trace(&sbi->gc_lock, &glc)) {
 		err = -EAGAIN;
@@ -2442,6 +2458,11 @@ int f2fs_resize_fs(struct file *filp, __u64 block_count)
 	f2fs_down_write_trace(&sbi->gc_lock, &glc);
 	f2fs_down_write_trace(&sbi->cp_global_sem, &clc);
 
+	if (f2fs_resize_tail_invalid(sbi, secs)) {
+		err = -EINVAL;
+		goto out_err;
+	}
+
 	spin_lock(&sbi->stat_lock);
 	if (shrunk_blocks + valid_user_blocks(sbi) +
 		sbi->current_reserved_blocks + sbi->unusable_block_count +
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 5949aa5200ac..a31d3a6ca756 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -91,6 +91,19 @@ static inline void sanity_check_seg_type(struct f2fs_sb_info *sbi,
 #define GET_ZONE_FROM_SEG(sbi, segno)				\
 	GET_ZONE_FROM_SEC(sbi, GET_SEC_FROM_SEG(sbi, segno))
 
+static inline void f2fs_adjust_pinned_area_boundary(struct f2fs_sb_info *sbi)
+{
+	sbi->pinned_area_max_secno = MAIN_SECS(sbi);
+	if (f2fs_sb_has_blkzoned(sbi) &&
+	    sbi->first_seq_zone_segno != NULL_SEGNO)
+		sbi->pinned_area_max_secno = min(sbi->pinned_area_max_secno,
+						 GET_SEC_FROM_SEG(sbi, sbi->first_seq_zone_segno));
+	if (F2FS_OPTION(sbi).resizable_tail_secno)
+		sbi->pinned_area_max_secno = min(sbi->pinned_area_max_secno,
+						 MAIN_SECS(sbi) -
+						 F2FS_OPTION(sbi).resizable_tail_secno);
+}
+
 #define GET_SUM_BLOCK(sbi, segno)	\
 	(SM_I(sbi)->ssa_blkaddr + (segno / (sbi)->sums_per_block))
 #define GET_SUM_BLKOFF(sbi, segno) (segno % (sbi)->sums_per_block)
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 253a579e9d5b..c8f8ecf49635 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -554,17 +554,6 @@ static inline void adjust_unusable_cap_perc(struct f2fs_sb_info *sbi)
 			F2FS_OPTION(sbi).unusable_cap_perc);
 }
 
-static inline void adjust_pinned_area_boundary(struct f2fs_sb_info *sbi)
-{
-	sbi->pinned_area_max_secno = MAIN_SECS(sbi);
-	if (f2fs_sb_has_blkzoned(sbi) && sbi->first_seq_zone_segno != NULL_SEGNO)
-		sbi->pinned_area_max_secno = min(sbi->pinned_area_max_secno,
-				GET_SEC_FROM_SEG(sbi, sbi->first_seq_zone_segno));
-	if (F2FS_OPTION(sbi).resizable_tail_secno)
-		sbi->pinned_area_max_secno = min(sbi->pinned_area_max_secno,
-				MAIN_SECS(sbi) - F2FS_OPTION(sbi).resizable_tail_secno);
-}
-
 static void init_once(void *foo)
 {
 	struct f2fs_inode_info *fi = (struct f2fs_inode_info *) foo;
@@ -3078,7 +3067,7 @@ static int __f2fs_remount(struct fs_context *fc, struct super_block *sb)
 	sb->s_flags = (sb->s_flags & ~SB_POSIXACL) |
 		(test_opt(sbi, POSIX_ACL) ? SB_POSIXACL : 0);
 
-	adjust_pinned_area_boundary(sbi);
+	f2fs_adjust_pinned_area_boundary(sbi);
 	limit_reserve_root(sbi);
 	fc->sb_flags = (flags & ~SB_LAZYTIME) | (sb->s_flags & SB_LAZYTIME);
 
@@ -5321,7 +5310,7 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 	/* get segno of first zoned block device */
 	sbi->first_seq_zone_segno = get_first_seq_zone_segno(sbi);
 
-	adjust_pinned_area_boundary(sbi);
+	f2fs_adjust_pinned_area_boundary(sbi);
 
 	sbi->reserved_pin_section = f2fs_sb_has_blkzoned(sbi) ?
 			ZONED_PIN_SEC_REQUIRED_COUNT :
-- 
2.43.0
