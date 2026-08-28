Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83CA04503E5
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 14:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787926376; cv=none; b=Q3Ck/hOADjzFxC7Vbzky4u2n3mFV79orl4ZVh5/ooS+3TIT2Fc4OjvbKjBzA/YTFSXJzpmzQrvAoCjTpNJ44uXPTEG+5P3996ohquROoIryQLbHrGrvqh0zFio7zx9MfUJiTEhSQZrdstirBQq9HwXAZH2jsySKFzTWnXR0NRII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787926376; c=relaxed/simple;
	bh=rwVNcBLVIw3rNcDwVpBLQgkgzsDPYAPElpClNR9fqfc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ifhj57JSy8suHVKLgd8FlT8VPjaldkgtiCt5A1/zGRqd9fcKkciXVioYW4nHVw4iveaCHQO4THWahjpWJ9+YuTv+uTIRhWPm6SeZRO/y0pbKYc7lWech285WGtKVVXeIHZ/rgM4ar0SzJzpfzfzqy6vNzV6AnPtZq5YtDdLhL8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l2w5RxaN; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l2w5RxaN"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-39682983a0fso1163530a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 07:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787926372; x=1788531172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jwGAw/3u92Bautox8ZBye7j/eciIao9tSSPeFwdR8xA=;
        b=l2w5RxaNAFioG3VVPKypIg2MXWANUTqXiNfI9sbw0nu8/f+peS3i2hq9uPYr8DaVWS
         QWsDWLRMgi3DCRiLF6qzABSpmYGd/Xg7itH+H4gnq/2t0PSu8EJYdig7gpvkhigQcl5M
         qWfwkXUMbBvxSQqzCl+VjBscIsDpHxHPp+wmvr/TFLXx7qiA4SQr23MmkXOIr9xTM0dk
         d2ZEMOAsctsIlB07ZAbvVRaS+gUhQHyC84q5o6l4zLM3AItE+S9O3GIsfx9+pvZNM7Wi
         9C16FNbRZ7Un3S/7S2E5ANjaIiash+WN1U+M13hQDy7WCi2gnybD4wihrxkEsqxmP5OG
         8Wmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787926372; x=1788531172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jwGAw/3u92Bautox8ZBye7j/eciIao9tSSPeFwdR8xA=;
        b=HICyGWVHtuDGGgd6YlGywGbT3GmLU4NmgEQAdzu5V0F9f3SgkEeq5w45xW9aYvmWCJ
         e6Md4p+diLOUtlNb9d/gsq/K4jDCJdaHGK09JPZLAX/CzVbbk9ByDfiw6w/Q3uGUnGyD
         S22QcXOtAg7s+xjGo+ZQ4GTxnh+dtkIRM0QE+TRRTjYdOEYBVGxg2hzDTxanC77atz0X
         dTt6be1zjNcCbL40ZfHFNXmpHEps0UOdIaeWkYLQzu90PjIbxLatd0XShPoHk+xw9vAK
         UyztcqdlZAaEHMbmQJJvvOG4qigAatuKzsdpyuXnpZ0m5aQEAzp3jH0zid8M2O+OJDi8
         jLEw==
X-Forwarded-Encrypted: i=1; AHgh+RrgGEzX7hxuS1D5wLjlVvYI1hlsO8mVvWps7aLRlhutIQY/KvMXKjhWOzbjQstrP5H2idB+VzgCwGSVgjg=@vger.kernel.org
X-Gm-Message-State: AFuF++mE2mfCQCL2cdzn9xmU4FCnrBDEcHtgVQMjUydp5R4pbHJ3XyhA
	kIvd5Um6d7pSFmsUkJhlldxoAEnHXdOS5W00E0fQQ4u4P8kAADAx/WbLy7+EMlHt
X-Gm-Gg: AR+sD11OuBJkyckrS/rQcnRfx74HxBQUBr1SgSljaF4YvFixf3zyBWgjWL8+jQVWQXK
	XnithtxnNWzLPfAM8lBWcbdS+gmuizNesCMnoGeT6CBEE3Dl35zzEedD1V+72ruVYe7Rs5TFDNS
	SQRLsX1rWViOiDIv8nrgJURZC9sJllY4HqgMeozHhd1FsjCdj456qmPzsSrA91cvFC1AgJWinV6
	ZousxS9to/67moa9vBJKSmZsMODATbm6VqkxyvP0p1oeO6zNEKvT5TublpC8a2dTzTzwB1FLBC5
	VLo7Fhsm0j/kMNSMZ8ubKVj3THJEti/Ago0F5ZqeaWQANOSNgb/hc/zgmYxPIaB3es3cixQJVug
	0Z/Yq5iG5pIFQr+Y65jJb0SraNUWj5ikfd0d0FByyOtX9+Xudk6En9LoudNHnRDzoBTd8YJRtdT
	jAUbBrFq3oVEx1oxXlUDq2xx3vfHRVj2TmzK5MwhGS1jG7PFJ5UN+RG+o2PpV66A/CjW9k69pW/
	LlqX43dWsYJAqaHfh65yMw6h4PUWV0sfdMF
X-Received: by 2002:a17:90b:5890:b0:392:e5b1:d833 with SMTP id 98e67ed59e1d1-396d0f1a83fmr15048057a91.13.1787926371638;
        Fri, 28 Aug 2026 07:12:51 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396ddc0c703sm2737951a91.9.2026.08.28.07.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 07:12:51 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: sunqiuyang@huawei.com,
	daehojeong@google.com,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	qiwenjie@xiaomi.com,
	qwjhust@gmail.com
Subject: [PATCH 2/2] f2fs: refresh pinned allocation boundary after resize
Date: Fri, 28 Aug 2026 22:12:40 +0800
Message-ID: <20260828141240.2391915-2-qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828141240.2391915-1-qiwenjie@xiaomi.com>
References: <20260828141240.2391915-1-qiwenjie@xiaomi.com>
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
the unsigned subtraction wrap. Reject such a shrink with -EINVAL
before taking resize locks or changing filesystem geometry.

Fixes: c966d29e01bb ("f2fs: support resizable tail section and unify pinned allocation")
Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
---
 fs/f2fs/gc.c      |  7 +++++++
 fs/f2fs/segment.h | 16 ++++++++++++++++
 fs/f2fs/super.c   | 15 ++-------------
 3 files changed, 25 insertions(+), 13 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 0a00180c21dc..978e85578c79 100644
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
@@ -2398,6 +2399,12 @@ int f2fs_resize_fs(struct file *filp, __u64 block_count)
 
 	shrunk_blocks = old_block_count - block_count;
 	secs = div_u64(shrunk_blocks, BLKS_PER_SEC(sbi));
+	if (secs >= MAIN_SECS(sbi) ||
+	    F2FS_OPTION(sbi).resizable_tail_secno >=
+	    MAIN_SECS(sbi) - secs) {
+		err = -EINVAL;
+		goto out_drop_write;
+	}
 
 	/* stop other GC */
 	if (!f2fs_down_write_trylock_trace(&sbi->gc_lock, &glc)) {
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 5949aa5200ac..7c7ca0730d77 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -91,6 +91,22 @@ static inline void sanity_check_seg_type(struct f2fs_sb_info *sbi,
 #define GET_ZONE_FROM_SEG(sbi, segno)				\
 	GET_ZONE_FROM_SEC(sbi, GET_SEC_FROM_SEG(sbi, segno))
 
+static inline void f2fs_adjust_pinned_area_boundary(struct f2fs_sb_info *sbi)
+{
+	sbi->pinned_area_max_secno = MAIN_SECS(sbi);
+	if (f2fs_sb_has_blkzoned(sbi) &&
+	    sbi->first_seq_zone_segno != NULL_SEGNO)
+		sbi->pinned_area_max_secno =
+			min(sbi->pinned_area_max_secno,
+			    GET_SEC_FROM_SEG(sbi,
+					     sbi->first_seq_zone_segno));
+	if (F2FS_OPTION(sbi).resizable_tail_secno)
+		sbi->pinned_area_max_secno =
+			min(sbi->pinned_area_max_secno,
+			    MAIN_SECS(sbi) -
+			    F2FS_OPTION(sbi).resizable_tail_secno);
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

