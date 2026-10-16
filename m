Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42F01C862F
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792129463; cv=none; b=JBN6QR8Kxz25AG9LLgegCcPk4vXJuR9UfPwdb6KwR8O7Vv20Pxa7IA2q6pZ29gqyBUodbBjuix23Gr6CxLF6buGm+3F0WtEQt/QaL9YdYBzcrwmqC26FWivwtwB6v+On08+tsK0tH6Wtl1n1OB8oSTdoV2/DhdGaxwyciYEWROg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792129463; c=relaxed/simple;
	bh=zUkTwQJBYObbuKTkrzvDwBT2MGcmLmyagfbYnWd7nxY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LfIvHXVKXwKtFb5etQHpYD/jfmkeIuaNk42oZf3Ye74TNcqzZIBvLaCxIrVs9ci2YajvLg7K3vod0Fn4dp8LnFL+HSkP3W7SiO7QlC0dcBxV+dnnyq4elUvtmExwLfI8wIq7h1pBhcJzL64At60/yh/STddmbrILMqLrdpPCosE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E7wJ/XGt; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E7wJ/XGt"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-141395927feso11679915c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 22:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792129461; x=1792734261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kg0/Y5OQ+zT/2BaSWkG21iLF11f9YrlrZ+pWUx9askg=;
        b=E7wJ/XGt+5PJBQeuPYmQ2NbSuUhi3ukbVfzL3HwDIb8KlOdf32fsCvNYcHaUiNkSAX
         R1g1/lUx6EZUU0igJH9AzWoxFjpwaj5NcyqdOVtZghG92qBo/3aI3wwkQwbmhVJBs5FW
         Nd0J04NG4yJuXI9E9iKtto0C3f8F7H85DFcKuXpimFwt04+XdzNcaCeQ59CLzDRE5gjg
         Ih9X3l5Jak2xCU/OkykKQoJAZiq6GxC8zQy+nLYv7xY4+2sKEvCIAH08OT2FHGX7lDZE
         MDpuGc0GwHkn3KwgPYeKegc6/c5DzhFD0GHczy+I5iOIFVY0a6OZPpliGNAFL0RzCcUp
         M6vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792129461; x=1792734261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kg0/Y5OQ+zT/2BaSWkG21iLF11f9YrlrZ+pWUx9askg=;
        b=V4ZGoijb2izn2AOi1XSCADFD6QgfhCTKG5BsVyzuFaeLy+SKjPc9XL+4le/Wzy03WH
         ApaprFnOAUDO6kHboVo6KiX3Yt0mQR6dysi3kwRxJvkEeKH6YobuwbyOslJ/gWeaDX/N
         H7uRNBgdf3+7tiImMGHHJVHg98UrUF9lFgkODO9d2vy9/zlaLZoJ+7gcdzSR5QAY3fl7
         Zv40dD6VkS7X44c2ynbZjpicAyAFKqBjq3CqPGtb1OLsb0iJj+NwkeeFzqFQv0j/eLQn
         MIq3SDXJCRUklvcBiqXuYAfNH0FvJBYuEOhGwEzENMJk8jPco/HIdcuSPmiHicD1meok
         leFg==
X-Forwarded-Encrypted: i=1; AKwUvBw8w99kzdUucCmApCuOx//If15JMl5kVKfXQyJluBFPc4mc2gWaNIG83oYgR9vjpo/NPGAnNF2Qxd3C7mY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLhQbbKgJnT3/VIW2I3f34vapSS9e6zkeIjgTt2I9SMHqIzr6eg
	op40hkL8lgmFwckVGrv2vRHr1/V5dOkmMKcMGWqHssDgO3ZC9FxJ2PgYx7vtsouaGhI=
X-Gm-Gg: AYBFou2h5Tkkv9+NQ26zbRcILIPajkzYeL76SiKWT3zP4QSK6AFvh+5bSjg/OZWBt3d
	cNXgBUYXkVfG3ouma27RRkF+sx/uCoMmNhWeJqjyV4ZGb6cF0ROaVhinHpVLWFxRfUFNz9zbZvb
	XvumMP/ZgR6ET7xmNrt9ISZFjyt9GEQuW6pT7NsvASZwWumguW0JFveG0JjehWkiKx+XpT3pG3o
	I+mt7LTDWqBkaVeCqBuuRhAIt2a4MhfFOwt9gbQPnzrMFRWU+ax3u26d27FtD+TVF+2L4AVOjv2
	fXzSJaNxhKA+5+L+49zy+48mzETDZgXT26W+RDes6Vqhh4XI7ylsNdTHcnW0bnuo8lI8kyasJwp
	AyvLkw3YoTQ2JLFwYfHkFrt52eTMTQgj8YWvGNItb/RT77Mx4rmkK1JZmk368fMlvE6UONauB4v
	fP40e/rl7P3H0wT3V4JWxLH82GBzTHD58ziUK/vtT7GkTg8sS2PXnXqgkqTAXRbPsbDAqBx5Ccw
	pwACnkGDZPw1tocma9KMtzuiLdwABlOSy8=
X-Received: by 2002:a05:7022:1713:b0:14d:3c0c:79ec with SMTP id a92af1059eb24-16a5dbfddf2mr22186487c88.9.1792129460570;
        Thu, 15 Oct 2026 22:44:20 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831919fdfesm2642428c88.7.2026.10.15.22.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 22:44:20 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: daeho43@gmail.com,
	daehojeong@google.com,
	sunqiuyang@huawei.com,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	qiwenjie@xiaomi.com,
	qwjhust@gmail.com
Subject: [PATCH v4 2/2] f2fs: refresh pinned allocation boundary after resize
Date: Fri, 16 Oct 2026 13:44:06 +0800
Message-ID: <226abf7d629d7345f450753a42e924b436c99ec0.1792116883.git.qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792116883.git.qiwenjie@xiaomi.com>
References: <cover.1792116883.git.qiwenjie@xiaomi.com>
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

Also bound pinned section allocation by the current MAIN_SECS(). Range
evacuation temporarily reduces it before moving cursegs, while the
cached pinned boundary still describes the old geometry. Otherwise, a
pinned curseg can be reallocated into the range being removed.

Fixes: c966d29e01bb ("f2fs: support resizable tail section and unify pinned allocation")
Suggested-by: Daeho Jeong <daehojeong@google.com>
Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
---
Changes in v4 (since v3):
- Bound pinned section allocation by the current MAIN_SECS().

Changes in v3 (since v2):
- Consume the tail reservation instead of keeping its old size.
- Restore the saved tail before geometry and boundary rollback.
- Document the remaining-reservation semantics.

Changes in v2 (since v1):
- Simplify tail validation and improve rejection diagnostics.
- Validate before taking the mount write reference and recheck
  after freeze for concurrent remounts.

v1:
- Refresh the pinned boundary on geometry changes and rollback.
- Check the tail against the requested shrink geometry.

 Documentation/filesystems/f2fs.rst |  3 ++-
 fs/f2fs/gc.c                       |  6 +++++-
 fs/f2fs/segment.c                  |  2 +-
 fs/f2fs/segment.h                  | 11 +++++++++++
 fs/f2fs/super.c                    | 15 ++-------------
 5 files changed, 21 insertions(+), 16 deletions(-)

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
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index bf8d07fcce331..f6e1cb1c0b71d 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2983,7 +2983,7 @@ static int get_new_segment(struct f2fs_sb_info *sbi,
 		alloc_hint = MAIN_SECS(sbi);
 
 	if (pinning) {
-		max_secno = sbi->pinned_area_max_secno;
+		max_secno = min(sbi->pinned_area_max_secno, MAIN_SECS(sbi));
 		hint = 0;
 	} else if (alloc_policy == ALLOCATE_FORWARD_FROM_HINT &&
 		hint < alloc_hint) {
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

