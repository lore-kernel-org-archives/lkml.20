Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8968135C6A5
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792053336; cv=none; b=NiQSu6lUPdcCRfpI8jb9X79kHLROh79wSlj3jUMok/ICA4lP+CWQRRfuwirWkS79Zv3f0bB2M7mKrBwSA0MKC7YynjAdAMdKMC93eNiXDRdvlsityeltsG0/3L3TGTT6snCqiLmT8Xi/lCH9mg5lfq8wdmdiXoQkQVoBrPb6B/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792053336; c=relaxed/simple;
	bh=ow4eDJ4i9dEfD0rhWJxE799P/HQ9fzxK9NtE4tMP18Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aqjeBBKd+PMjpUKnYkU4j+K/aP4LMqmOLasLe1ct5EZtaxvWVMHhR2WeeSZz76PQZ4y68yWYd2WTC2VjKaKvj1L79TH7kMjD1SgMo7zOv3fq/9xG8k5fcIx7pEhtvhrhvtdAoifnvcvYLIngTOJOKHKJQG+xh4CoIUWRQOrgWRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kOZGrQO/; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kOZGrQO/"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-35c76e9614aso3238805eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792053332; x=1792658132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BGWNvW31UDgJBtWGlH9/IY5pNbnK5DE95i3+WnOMIF0=;
        b=kOZGrQO/2zfGravFz6Im8NH3X0CsC+cjaXRekONw+fLl5pnYaSGSbRsNEB9FzuoWid
         y7BhNpZeYY8OENDwpPlU7xi6fq9pH0rQ2m394dpy6b677NaFNnTV1ms+4o1hL4U13T0F
         VZa8EuoimB4zG//SpBfI6aEK9y9HU49/kkMwUJd0sNsiMazV7NAae7JjuESK9LxJ97GX
         b/zhnATt7wm92U9BssCQv4pKQU+3bB+RFgZb4gJLhX+PIj3vfzKqsKtGRsDIukqz1KBe
         xMt6CbBAWpMlLsqa6GwegIwI92XNaNdDvesCbHlszEeb/g/rCWhkimGNAYJUv/ne7xif
         Z55w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792053332; x=1792658132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BGWNvW31UDgJBtWGlH9/IY5pNbnK5DE95i3+WnOMIF0=;
        b=0WZ2v/cis9ITbKxYWT5SzOqh0KP39G5aZCJMmwDpvHsUEQT2EkLB36zmiPgUBLxBq+
         GNxFo7nQbKIZzbL/JzZaytQHCU4/+gJqQMx1jJDZ3hki1NBV9MMW3jD6z36BmPXuhuJY
         K3/U63wNfPfYwDTGKAW23Ry/vitvd8YzYES49k7IGx09G1bp2NivR7xBR4zLjQmSOUv4
         FDncrchgqRF7pDUmFbj1L+juMyc0y9QqVpq8DAbpqLgZ48rIKRIROGrSoD0JoosWsjPF
         ST372mLm5Yq/UY5BhBOoMluoRugTmLnM93+d3oS0yFOWP8huTAMgrD+NdW4N/z5icBOq
         OJRQ==
X-Forwarded-Encrypted: i=1; AKwUvBybyUuQPnJZKmQnbXuxy6J94oJz+iVu4fFuQKFicdgQwBNnjXLyo8RfcnGIwxe3WSp6/h1cQBrdKK1PX3c=@vger.kernel.org
X-Gm-Message-State: AFq9FYIsReXq5q1QckWMfLk7xwtUYoOqSsOxV3nf7xS1I7yGjSp86kjq
	N7pO4yzUHWwy3OwISICGIlWRapbYQtX3COm0eqlS8mQh1SiExVBR7zmV
X-Gm-Gg: AYBFou2e+gzYmCCIEnZChcLSX5DO3chi2mXqjlt54VS/k9TyQt5PGjyfUNQyd6EbA64
	FNK+mdXhU4MYrPT6ESKwLcXS8P44IniQr7BvqbSU4kwJ9yzjHuh+S/60pV5R/f2b/fQ+Gwvijcx
	zhGBVziTP/o3ch3KQEtPLCMN5xnEoGfxPm9LSafuPqXc50aqKoixXKpGhe9egIerRtGQ3JZp+RB
	r1g4019UnusUvtlVFaydul4/bUUJKXMiEl1/VzkqMSMVGwuO6buqe/3aynLuTf4ljA6xgWdVCfd
	mQ9KGBH6a8hd+kapjeNeLi9nAH6zVUOCFF2gJ0LeuZiOF3IgxyhPXo6N7LAaLxQqJIjrDNXiC6i
	71Z0RdXrghRWei16bBv5d9KE1ICBO1T2Yz/SKBDkPxBSqd5hUsMkOhqCIq4j1/GuYfl8E/Q4VlD
	f6cqrgcyCDtzJ7MAL+Hx98Dzh35Px6akKf4UJCs8yT4Et+jR6YPuU7YIpxgZPl0BDGExO3oHT6O
	210a8LoIs7iMx53+aRV3DkDBhmkVbPf/2GOfVoGZth0Tw==
X-Received: by 2002:a05:7301:e0cb:b0:351:1e3f:812d with SMTP id 5a478bee46e88-3537e0caeb8mr23093066eec.36.1792053332422;
        Thu, 15 Oct 2026 01:35:32 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca6d20dsm64539101eec.12.2026.10.15.01.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:35:31 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: Daeho Jeong <daeho43@gmail.com>,
	Daeho Jeong <daehojeong@google.com>,
	Qiuyang Sun <sunqiuyang@huawei.com>,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	qiwenjie@xiaomi.com,
	qwjhust@gmail.com
Subject: [PATCH v3 2/2] f2fs: refresh pinned allocation boundary after resize
Date: Thu, 15 Oct 2026 16:35:10 +0800
Message-ID: <eaed01c69f5af16df36a6df9be3f6615e4818d29.1792050467.git.qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792050467.git.qiwenjie@xiaomi.com>
References: <cover.1792050467.git.qiwenjie@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Online shrink updates MAIN_SECS() but leaves resizable_tail_secno and
pinned_area_max_secno unchanged. The pinned allocation limit can exceed
the new main area when shrinking beyond the reserved tail.

Consume the reserved tail by the number of removed sections, clamping
it to zero, before refreshing the shared pinned allocation boundary.
This preserves the boundary while shrinking within the reservation and
limits it to the new main area otherwise, retaining the zoned limit.

Save the old tail count and restore it before rolling back the geometry
if the final checkpoint fails.

Fixes: c966d29e01bb ("f2fs: support resizable tail section and unify pinned allocation")
Suggested-by: Daeho Jeong <daehojeong@google.com>
Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
---
Changes since v2:
- Consume the tail reservation instead of keeping its old size.
- Restore the saved tail before geometry and boundary rollback.
- Document the remaining-reservation semantics.

 Documentation/filesystems/f2fs.rst |  3 ++-
 fs/f2fs/gc.c                       |  6 +++++-
 fs/f2fs/segment.h                  | 11 +++++++++++
 fs/f2fs/super.c                    | 15 ++-------------
 4 files changed, 20 insertions(+), 15 deletions(-)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index 771216f45207a..55798421f2c45 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -421,7 +421,8 @@ resizable_tail_secno=%u  Control the number of sections at the tail of the
 			 (MAIN_SECS - resizable_tail_secno) - 1. If set to 0
 			 (default), there is no tail restriction unless running
 			 on a zoned block device where conventional zones are
-			 used.
+			 used. Online shrink consumes this reservation, reducing
+			 the value by the number of removed sections, down to zero.
 ======================== ============================================================
 
 Debugfs Entries
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 926e6976bc22a..540769ad58acc 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -2342,6 +2342,7 @@ static void update_fs_metadata(struct f2fs_sb_info *sbi, int secs)
 	SM_I(sbi)->segment_count = (int)SM_I(sbi)->segment_count + segs;
 	MAIN_SEGS(sbi) = (int)MAIN_SEGS(sbi) + segs;
 	MAIN_SECS(sbi) += secs;
+	f2fs_adjust_pinned_area_boundary(sbi);
 	if (sbi->allocate_section_hint > MAIN_SECS(sbi))
 		sbi->allocate_section_hint = MAIN_SECS(sbi);
 	FREE_I(sbi)->free_sections = (int)FREE_I(sbi)->free_sections + secs;
@@ -2373,7 +2374,7 @@ int f2fs_resize_fs(struct file *filp, __u64 block_count)
 	struct f2fs_lock_context lc;
 	struct f2fs_lock_context glc;
 	struct f2fs_lock_context clc;
-	unsigned int secs;
+	unsigned int secs, old_tail;
 	int err = 0;
 	__u32 rem;
 
@@ -2482,6 +2483,8 @@ int f2fs_resize_fs(struct file *filp, __u64 block_count)
 		goto recover_out;
 	}
 
+	old_tail = F2FS_OPTION(sbi).resizable_tail_secno;
+	F2FS_OPTION(sbi).resizable_tail_secno -= min(old_tail, secs);
 	update_fs_metadata(sbi, -secs);
 	clear_sbi_flag(sbi, SBI_IS_RESIZEFS);
 	set_sbi_flag(sbi, SBI_IS_DIRTY);
@@ -2489,6 +2492,7 @@ int f2fs_resize_fs(struct file *filp, __u64 block_count)
 	stat_inc_cp_call_count(sbi, TOTAL_CALL);
 	err = f2fs_write_checkpoint(sbi, &cpc);
 	if (err) {
+		F2FS_OPTION(sbi).resizable_tail_secno = old_tail;
 		update_fs_metadata(sbi, secs);
 		update_sb_metadata(sbi, secs);
 		f2fs_commit_super(sbi, false);
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 526764ba31ae5..918bc4452ad09 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -91,6 +91,17 @@ static inline void sanity_check_seg_type(struct f2fs_sb_info *sbi,
 #define GET_ZONE_FROM_SEG(sbi, segno)				\
 	GET_ZONE_FROM_SEC(sbi, GET_SEC_FROM_SEG(sbi, segno))
 
+static inline void f2fs_adjust_pinned_area_boundary(struct f2fs_sb_info *sbi)
+{
+	sbi->pinned_area_max_secno = MAIN_SECS(sbi);
+	if (f2fs_sb_has_blkzoned(sbi) && sbi->first_seq_zone_segno != NULL_SEGNO)
+		sbi->pinned_area_max_secno = min(sbi->pinned_area_max_secno,
+				GET_SEC_FROM_SEG(sbi, sbi->first_seq_zone_segno));
+	if (F2FS_OPTION(sbi).resizable_tail_secno)
+		sbi->pinned_area_max_secno = min(sbi->pinned_area_max_secno,
+				MAIN_SECS(sbi) - F2FS_OPTION(sbi).resizable_tail_secno);
+}
+
 #define GET_SUM_BLOCK(sbi, segno)	\
 	(SM_I(sbi)->ssa_blkaddr + (segno / (sbi)->sums_per_block))
 #define GET_SUM_BLKOFF(sbi, segno) (segno % (sbi)->sums_per_block)
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 773b12ea29c0c..f323d9705aebe 100644
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
@@ -3103,7 +3092,7 @@ static int __f2fs_remount(struct fs_context *fc, struct super_block *sb)
 	sb->s_flags = (sb->s_flags & ~SB_POSIXACL) |
 		(test_opt(sbi, POSIX_ACL) ? SB_POSIXACL : 0);
 
-	adjust_pinned_area_boundary(sbi);
+	f2fs_adjust_pinned_area_boundary(sbi);
 	limit_reserve_root(sbi);
 	fc->sb_flags = (flags & ~SB_LAZYTIME) | (sb->s_flags & SB_LAZYTIME);
 
@@ -5440,7 +5429,7 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 	/* get segno of first zoned block device */
 	sbi->first_seq_zone_segno = get_first_seq_zone_segno(sbi);
 
-	adjust_pinned_area_boundary(sbi);
+	f2fs_adjust_pinned_area_boundary(sbi);
 
 	sbi->reserved_pin_section = f2fs_sb_has_blkzoned(sbi) ?
 			ZONED_PIN_SEC_REQUIRED_COUNT :
-- 
2.43.0

