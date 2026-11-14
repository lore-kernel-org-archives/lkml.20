Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794619092;
	b=zg/7RSjfM8m72QZFFEx7a4jX1l5BwRWi5CDLyfCavneUfN9aq0i5QcIaV9xPwcb5Z50k
	 B7BIBYUPAn/pWIvMWULZNmEn9q4zALT2QL7eih0yh1xoAT591Ns0o2z27k2kLGSMM6bUa
	 R5s2L3mhybxcHnR6W/vVAuqeHs7HM78PEj0/wGh1ZSdhJ0ng4GHOji6Ybp8Gh1zJ7ViYf
	 /fC6P/u1XjD+OAX9sefu65LoClkPbujWGtIHZyfW0+PAqf0xKoe259TCLjzTA25ubvMCu
	 rt16jdNmp/Xn1GrP5UydF5UAeg2UIeO4FWoQIyKAVQBZS/DH7TO+sV+TWWI/WfGys1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794619092;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=/NJq1tNVgAxL0JcudyOin08tnS8RNWNKJF+n6CZo2GE=;
	b=c3GffJoRaO9ApPthY3GYoyuiT4Azbajcr5NyQ6LU93hBJUY4YaEOiNhcmi842k+8ha+P
	 NcOQuqcZKip2lGl5n1hyfBLvB/vRkWKBRiPTI/zt3byhwwIgCG+QF8sXqMx7ZtFKE6B93
	 pjAW+s9Qqec5nBXUae0vXzFkf2HZyfESpO2cGGjUZb+zS9aeVjqQqYKHUyVSGZGhagmLI
	 kVyEuH5KRxBuDbpp/Wb13J6p/xfGGYrduGTDWoZHNP6FSj/xHUaRluHTNdT5mQ68pHO5I
	 GLSKYOy2x/CCt+A9u5tTfW57smBpoTztU2aWsZX8eM4uFnc3AqkNaNUF2hzTvpkM2fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KB+9mxD+;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E2F606A32E
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 01:18:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8E2F606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KB+9mxD+
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ed08b07213so9094115ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794619091; x=1795223891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/NJq1tNVgAxL0JcudyOin08tnS8RNWNKJF+n6CZo2GE=;
        b=KB+9mxD+U/w09snMg9VwFIyoYp2PJn+2v2jhVADiVo5o5+HtwvHu0ToedoLpyZySFB
         VtlRcpPXfKbh2Ux7gGWVGjksViW7qsJj5Cihzl08465l1YY98mrfT+oI1OwPwxPYunnp
         o0AIiPm4e8QNqY39yT7tIXl4kxUzqKhpmZhUVD9kmOa5Ql656LU9wFy/xI2KIc7LrK7D
         U5/9Zey4vKSSRod/9p5I0LLdeCfku2HrpDwQPJfWZca0L50pBzfghZa88D7kiQ0ZTgHA
         29eMnkDmeN9/+a5LTB83HFKjGcqbpaWCalqi0qIxnyPZss85ZjdYT5p4pccohXBcBoSk
         CclQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794619091; x=1795223891;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/NJq1tNVgAxL0JcudyOin08tnS8RNWNKJF+n6CZo2GE=;
        b=focs1gN8U89XaXuOtPKhdhLJQWPdVitcPhynFuvtsEHkoTitZ08dCjzARxwpwMfjth
         X4X8RPH71WAxIx81QT/bWOPW82wP+aHeBKOqnz7qEPCcASzo6+5F9Mp85RmTNmR4z8tY
         i8gqpG8qvauO0CT2xpPeHUe6vL+r3BMpRdHBW60+aruNybs0DmIQKhkthINb9YdxJ9n4
         tvm+RFM/jVhTGpfjkv1MASnh271xtNOKUg7d0rlDxtzRVTcLCDNehdU7HC89/PVlzLF1
         4Fl9fXx+MnPjr/pCjFtzvs8R7HjaFMwF7RNVsewnHsbFK6hfHGNoJ7pxjpoMyWSyor+3
         uOog==
X-Gm-Message-State: APuU4Z+xwU8dVDbVOgGM5tbOrn7L/rs7mePn7HmO+F93GSCQ6/PBVZQE
	bmdohvcWb1SwG/Z2gv9mIghMm9VgATi1+fCdD78Aove8qw1MXY+40xaziXKd8w==
X-Gm-Gg: AYBFou01jA+4ECqlhsOA4hBhcwpjWZ2IFtLrJgPgXARMxYa5u5QZIClJQU+iHgAl7fr
	kTmRUOhklzufn1X7Wqvfs77yDhLZx/oUtn0rFRH1GltZR8gSsfUkWOWt95bIkGNMOT54VBCCp9i
	8ldwKzFSkrbpgY34nX0jeIZJoTUDPziD+V2yuAhmdcsq+Z5Jf7egiTY+BRrDwkKKd0jkGLheSGQ
	wa3j00dm6Y/fUm6i1Daf/v73Jz0bqVSrmwOQDf0cWYwEW7ruHS+NbxrVfGxkFnw4E6hsoPQ+Ja8
	0PS5T6dRJtSliO43MXDWcebpiBXWT21ZIw0jaKAJ5ex64BW+C8jpgO12ruD6QxtF70EQfK5WgoU
	yyoUtacGTcN9yssWf99jxGbr9h9PzQYx+o7Wd/5RFuDAn6GkQczapsX7E4pq+D4+rUlj4AAgBJS
	fgPSBCgTDmoH1yKQtQAy9jVgqabZyHEGhvB0cxem+OwcMpZkcZwwOCFLDh5Yucm9TE/SoSXPgKv
	hdBGxvE11ZQ7aVxnoYWv+PnIiKMOte2sbfdurVBcfSp81y30fb0WT0KlGSU3bWIyRZ9wfzbTIZK
	ylWHeEvFJaoFOeOFEpDqbyXFPFH8kpe+VQcB97/a+NNCB3oqPKVmKQSn54XpBWWGM1eGsWIyyP6
	PsgXrXUN6scqcGFOxIIp77nc3fLVQBbU8pLB8OLNIUDjYos4=
X-Received: by 2002:a17:903:3d10:b0:2e9:401f:f0f8 with SMTP id d9443c01a7336-2ee0dd2c33emr40369315ad.53.1794619091051;
        Fri, 13 Nov 2026 17:18:11 -0800 (PST)
Received: from f2fs-test.c.googlers.com.com (193.67.125.34.bc.googleusercontent.com. [34.125.67.193])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee228b2581sm7755715ad.63.2026.11.13.17.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 17:18:10 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>,
	Chao Yu <chao@kernel.org>
Subject: [PATCH v3] f2fs: reserve space to be shrunk during resize_fs
Date: Fri, 13 Nov 2026 17:18:07 -0800
Message-ID: <20261114011807.3811774-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
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

f2fs_resize_fs() drops gc_lock and the cp lock between the free space
check and freeze_super(). In that window, others can allocate the free
space, so the second check after freeze_super() fails with -ENOSPC.
This is easy to hit on a busy filesystem, e.g. at OTA install time.

Reserve the space to be shrunk via resize_reserved_blocks once the
first check passes, and deduct it in __get_available_block_count() like
alias_reserved_blocks. Release it on success or on error.

With the reservation, the second check should not fail anymore, so:
- allow root reserved blocks, which root may use in the meantime,
- recheck DISABLE_CHECKPOINT, which remount may set in the meantime,
  since freeze_super() fails only when the fs is still dirty,
- keep the check only as a WARN_ON_ONCE() safety net.

Also exclude the alias/resize reservations when updating
current_reserved_blocks via sysfs. Otherwise, the reserved blocks can
take the space which is already reserved, and the second check fails.

Suggested-by: Chao Yu <chao@kernel.org>
Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
This patch depends on "f2fs: avoid underflow in
get_available_block_count()", which is sent separately.

v2: https://lore.kernel.org/linux-f2fs-devel/20261022165526.1539629-1-daeho43@gmail.com/

Changes in v3:
- Rebase on top of the patch above. In the case from the v2 review
  (user_block_count = 1000, root_reserved_blocks = 100, valid = 30, resize
  reserves 500, then 500 is written to reserved_blocks),
  current_reserved_blocks becomes 470. The reservations add up to 1070 for
  a user who cannot use the root reserved blocks, so that user gets 0
  instead of a wrapped value. Root gets 30, which equals the valid blocks,
  so the second check still passes.
- Update the comment in the sysfs hunk: the reservations are excluded so
  that the second check does not fail, not to avoid the underflow.
- Rebase onto the latest dev-test.

Changes in v2:
- Exclude alias/resize reservations from current_reserved_blocks.
- Allow root reserved blocks in the second check, with WARN_ON_ONCE().
- Recheck DISABLE_CHECKPOINT after freeze_super().

 fs/f2fs/f2fs.h  | 19 +++++++++++++----
 fs/f2fs/gc.c    | 54 ++++++++++++++++++++++++++++++++++++++-----------
 fs/f2fs/super.c |  1 +
 fs/f2fs/sysfs.c | 11 +++++++++-
 4 files changed, 68 insertions(+), 17 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 59bc3c2fb70a..d9cf2d4fae21 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1920,6 +1920,7 @@ struct f2fs_sb_info {
 	block_t reserved_blocks;		/* configurable reserved blocks */
 	block_t current_reserved_blocks;	/* current reserved blocks */
 	block_t alias_reserved_blocks;		/* reserved blocks for device alias */
+	block_t resize_reserved_blocks;		/* reserved blocks for resize_fs */
 
 	/* Additional tracking for no checkpoint mode */
 	block_t unusable_block_count;		/* # of blocks saved by last cp */
@@ -2707,13 +2708,14 @@ static inline bool __allow_reserved_root(struct f2fs_sb_info *sbi,
 	return false;
 }
 
-static inline unsigned int get_available_block_count(struct f2fs_sb_info *sbi,
-						struct inode *inode, bool cap)
+static inline unsigned int __get_available_block_count(struct f2fs_sb_info *sbi,
+						       bool allow_root)
 {
 	u64 reserved = (u64)sbi->current_reserved_blocks +
-					sbi->alias_reserved_blocks;
+					sbi->alias_reserved_blocks +
+					sbi->resize_reserved_blocks;
 
-	if (test_opt(sbi, RESERVE_ROOT) && !__allow_reserved_root(sbi, inode, cap))
+	if (test_opt(sbi, RESERVE_ROOT) && !allow_root)
 		reserved += F2FS_OPTION(sbi).root_reserved_blocks;
 
 	if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
@@ -2726,6 +2728,15 @@ static inline unsigned int get_available_block_count(struct f2fs_sb_info *sbi,
 	return sbi->user_block_count - reserved;
 }
 
+static inline unsigned int get_available_block_count(struct f2fs_sb_info *sbi,
+						     struct inode *inode,
+						     bool cap)
+{
+	bool allow_root = __allow_reserved_root(sbi, inode, cap);
+
+	return __get_available_block_count(sbi, allow_root);
+}
+
 static inline void f2fs_i_blocks_write(struct inode *, block_t, bool, bool);
 static inline int inc_valid_block_count(struct f2fs_sb_info *sbi,
 				 struct inode *inode, blkcnt_t *count,
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 337ecf4df945..7609c23ec27b 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -2420,6 +2420,7 @@ int f2fs_resize_fs(struct file *filp, __u64 block_count)
 	struct f2fs_lock_context glc;
 	struct f2fs_lock_context clc;
 	unsigned int secs, old_tail;
+	bool reserved = false;
 	int err = 0;
 	__u32 rem;
 
@@ -2471,10 +2472,17 @@ int f2fs_resize_fs(struct file *filp, __u64 block_count)
 	f2fs_lock_op(sbi, &lc);
 
 	spin_lock(&sbi->stat_lock);
-	if (shrunk_blocks + valid_user_blocks(sbi) +
-		sbi->current_reserved_blocks + sbi->unusable_block_count +
-		F2FS_OPTION(sbi).root_reserved_blocks > sbi->user_block_count)
+	if (shrunk_blocks + valid_user_blocks(sbi) >
+			__get_available_block_count(sbi, false)) {
 		err = -ENOSPC;
+	} else {
+		/*
+		 * Reserve the space to be shrunk so that no one, including
+		 * root, can allocate it until the shrink is done.
+		 */
+		sbi->resize_reserved_blocks += shrunk_blocks;
+		reserved = true;
+	}
 	spin_unlock(&sbi->stat_lock);
 
 	if (err)
@@ -2488,29 +2496,45 @@ int f2fs_resize_fs(struct file *filp, __u64 block_count)
 out_drop_write:
 	mnt_drop_write_file(filp);
 	if (err)
-		return err;
+		goto out_release;
 
 	err = freeze_super(sbi->sb, FREEZE_HOLDER_KERNEL, NULL);
 	if (err)
-		return err;
+		goto out_release;
 
 	if (f2fs_readonly(sbi->sb)) {
 		err = thaw_super(sbi->sb, FREEZE_HOLDER_KERNEL, NULL);
-		if (err)
-			return err;
-		return -EROFS;
+		if (!err)
+			err = -EROFS;
+		goto out_release;
+	}
+
+	/* checkpoint can be disabled by remount before freeze_super() */
+	if (test_opt(sbi, DISABLE_CHECKPOINT)) {
+		f2fs_err(sbi, "Checkpoint should be enabled.");
+		err = thaw_super(sbi->sb, FREEZE_HOLDER_KERNEL, NULL);
+		if (!err)
+			err = -EINVAL;
+		goto out_release;
 	}
 
 	f2fs_down_write_trace(&sbi->gc_lock, &glc);
 	f2fs_down_write_trace(&sbi->cp_global_sem, &clc);
 
 	spin_lock(&sbi->stat_lock);
-	if (shrunk_blocks + valid_user_blocks(sbi) +
-		sbi->current_reserved_blocks + sbi->unusable_block_count +
-		F2FS_OPTION(sbi).root_reserved_blocks > sbi->user_block_count)
+	/*
+	 * shrunk_blocks is already accounted in resize_reserved_blocks, so
+	 * this should not fail. Allow root reserved blocks here since root
+	 * may have used them after the first check, regardless of resize.
+	 */
+	if (WARN_ON_ONCE(valid_user_blocks(sbi) >
+			__get_available_block_count(sbi, true))) {
 		err = -ENOSPC;
-	else
+	} else {
 		sbi->user_block_count -= shrunk_blocks;
+		sbi->resize_reserved_blocks -= shrunk_blocks;
+		reserved = false;
+	}
 	spin_unlock(&sbi->stat_lock);
 	if (err)
 		goto out_err;
@@ -2559,5 +2583,11 @@ int f2fs_resize_fs(struct file *filp, __u64 block_count)
 	f2fs_up_write_trace(&sbi->cp_global_sem, &clc);
 	f2fs_up_write_trace(&sbi->gc_lock, &glc);
 	thaw_super(sbi->sb, FREEZE_HOLDER_KERNEL, NULL);
+out_release:
+	if (reserved) {
+		spin_lock(&sbi->stat_lock);
+		sbi->resize_reserved_blocks -= shrunk_blocks;
+		spin_unlock(&sbi->stat_lock);
+	}
 	return err;
 }
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 78dbf1e92285..f5966ae2d11b 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -5414,6 +5414,7 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 	sbi->reserved_blocks = 0;
 	sbi->current_reserved_blocks = 0;
 	sbi->alias_reserved_blocks = 0;
+	sbi->resize_reserved_blocks = 0;
 	limit_reserve_root(sbi);
 	adjust_unusable_cap_perc(sbi);
 
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 430356e500af..8ab9a5098f1c 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -594,6 +594,8 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 	}
 #endif
 	if (a->struct_type == RESERVED_BLOCKS) {
+		block_t avail, valid;
+
 		spin_lock(&sbi->stat_lock);
 		if (t > (unsigned long)(sbi->user_block_count -
 				F2FS_OPTION(sbi).root_reserved_blocks)) {
@@ -601,8 +603,15 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 			return -EINVAL;
 		}
 		*ui = t;
+		/*
+		 * Exclude the space reserved for device aliasing and resize_fs,
+		 * otherwise the reserved blocks can take it and make them fail.
+		 */
+		avail = sbi->user_block_count - sbi->alias_reserved_blocks -
+					sbi->resize_reserved_blocks;
+		valid = valid_user_blocks(sbi);
 		sbi->current_reserved_blocks = min(sbi->reserved_blocks,
-				sbi->user_block_count - valid_user_blocks(sbi));
+				avail > valid ? avail - valid : 0);
 		spin_unlock(&sbi->stat_lock);
 		return count;
 	}

base-commit: b9d7379d10d43386b59082da8c9a0b111e054781
prerequisite-patch-id: 5b947a4267506336d2083e4b20686c7c39a4233e
-- 
2.56.0.611.g1030f0b940-goog

