Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792688139;
	b=p3KKIyN5L9GWee40zKWSskp4wr9Al/VY0Ge+ANPlTFY1n12PBGduWUZZPEiv4wetwhF+
	 vkpllrOt2f3/l6XCYi/MXezw7XCajZDlOtN8seU7pOVWwNgPvhCLs2/J28Ic2SfhVQLhA
	 YKJIgc2zQXq/TSkxQ2pqLgnxAEHEdipXMLcO3Cqu56w8foskFVzSTnZvlrAmqqK1Y1FeM
	 kdjqrP9R6gdhD2v/m9Lq7ZtX9ZPn8yJfyheadx3546gcrC1DF3ZD14CnK8g/rWIpP206X
	 4c42sSw+hj/J5gdIR/UHcx3Njqb7rZwxc29hkHAUBEpFSE35/Ci7iUgTU+PYfqzNurg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792688139;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=cGA7aNtopU1D3jFV3b7MKOoXob/OOTqjubBjksI2s90=;
	b=nbWRO+Xr86znk4uyWt8oPKljTEu7KPDQ0jo/ChcAxh8MM/h/liN9HP+jhv1MpuT/cEZc
	 vbujiQIqyx/UWpnbXf/IQHLthUz1ypKkEtfUcBAQ8S7ku04ofwOHtLEJe66VEddlU5j5Z
	 6OHaeEkv0QwqPvI7NRDCpKm4NtQXlqkQFIIgxaH1WpPokmnS3WSx9JDjn9AoU1GdmBOdj
	 Jt0vJZPgyOlsQz3wYPwru6aR2aYCq0Q19UXy4KvIYjnenB/61cJeWWixqWhSVfMxNlcmL
	 xNM6aALLIShl1FUA9m5NtJjZTEpDTYEkBtkurfPCrsJKDR8grGh/DG4v1M7ikwdcmlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TvNJKy+7;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E21F606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 16:55:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E21F606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TvNJKy+7
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ada4c06b7bso21920a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792688139; x=1793292939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cGA7aNtopU1D3jFV3b7MKOoXob/OOTqjubBjksI2s90=;
        b=TvNJKy+7OpguUzi5vCWqUz3lnKZNxZS/r8rG5eCL7KHaQz/I+bAJkkhmG14zfpO/Cs
         VDpPrxmEkvhvChIU3GtEnrJ28FgKb17QnBLlrFLCYtQuxDHWyZKZsF7TcTrn285cTYIP
         a4xxkUoZEonwOk6s/HX7PYJ6oROAnWxX6smGhocaYlCoIfAeJaPjxSF3Qd56i/CeGKHi
         ruOSvbnasNpRScGSJDAD3TVHKn7SpEBKafaMuEepWHYEs8znk6K4f1f99sv5hYcMKTwW
         lXfXMsmu35sbMklOPfAb1MY+qqDS2JYTp2nHGUVAqD7VrHQnOu7vEO1K75v7bySdWQ2c
         8CPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792688139; x=1793292939;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cGA7aNtopU1D3jFV3b7MKOoXob/OOTqjubBjksI2s90=;
        b=pFZZN0lnOVKjbUZSpOGwHJwNRCwcIVZ/xiHs1ZGry8UPuxTrolJwOc19ySsiY7RQ7I
         mYZ9EzU+KhN1ZdfTQHTEHpR9BfAUJkIX2OkZVDAGvgL7uhlPaEgHUS7SWK/coRn+0qyj
         F8w/s2GvOsbmnfQU+Xem2G0PFvFWPmWl06ClLF+WWz6vRa7S+0xenegXZhdDSx1TGblM
         Ms0HJcUEGg8Z7hlHVXUU8v6pUtzNNQHDRIaeXD5T8xk3Fk0q9EjDIbfUwy4VDMF5i83C
         9+6tCgHsVyZMWVXfyQfT2u7Eu3+dGPdi2t1UBqKQm514sB2rqVFZd7PWlV9ohBKW5/Rl
         4A2A==
X-Gm-Message-State: AFq9FYLAiDmWZpYTcYBBOalxguppJnN9fCSyJpjVFo1a2THXRdGGmJdz
	IWd0Qgn2E73W4+NI33mR+fE2zobI4mihCuAkZnhaj6aKZFMJbSIGGbhP8KaK8Q==
X-Gm-Gg: AYBFou0pEnP1/0DtLuGcR35nj6pEdH9OXgnk1246LWg30yYLf+MvDydcHg2sKCXZ1iw
	5O4tGZVdFOLvihh/v8k25UXyPmbv6hLi4w4xLAvV8bWxjIT/gBqAA8r1Kka+tJYf5K1r4ltAB8f
	Bi/EkIbVb969OxyVwQhFgddbhMIBcdqMHknLjFsKQIJ4ciZTKxb3btbFvEOj6qQyPvQtRAQsjpU
	dm1Mj3jQ3ny2FiZ8V29mtKpWzOZ6jAX6xGn0xhz1mWOfesTuxGJz9CIxzUCaWIZxCwgLFFWxySr
	xwaP0Mlil8+P7H5yx3B6y89DGQIltpmiqGP3YaIOtYMjUrvLpyS8d8VIuZk+JA9J/uocP0Oi+nX
	lqdKjejQudv5Q+n7W47oN1cemMY5ii8vhqYt7KIXxHipUrBl1tQoI3/LKquY/tLk2my2l+3QGU9
	SnNJa9FxcU2sNQ1yhML3/6qUfS+FrAhBn3huZbq8kJL8rAI/teELOWXsJiOelR/5QgF2opsWbIu
	q0nQYy6l3izUDJx+5H/JB8RSKiYITA9nW5rsOSHwEUxM/Ev+OfNenpFD93FCqH6llNsGyniu/Bw
	+fGsmbR8On4YsJLj16cvRqZyKBkP8a6KDZWWF7ddlt4TQcoi2oql5EUP3v8z4az8gkmb72fb8w=
	=
X-Received: by 2002:a17:90b:3bcc:b0:3ac:b3c7:de14 with SMTP id 98e67ed59e1d1-3ad86d6cd8fmr4895188a91.61.1792688138335;
        Thu, 22 Oct 2026 09:55:38 -0700 (PDT)
Received: from f2fs-test.c.googlers.com.com (225.134.16.34.bc.googleusercontent.com. [34.16.134.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada48879a0sm5057688a91.4.2026.10.22.09.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 09:55:37 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>,
	Chao Yu <chao@kernel.org>
Subject: [PATCH v2] f2fs: reserve space to be shrunk during resize_fs
Date: Thu, 22 Oct 2026 16:55:26 +0000
Message-ID: <20261022165526.1539629-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
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
current_reserved_blocks via sysfs, otherwise it can underflow
__get_available_block_count().

Suggested-by: Chao Yu <chao@kernel.org>
Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
Changes in v2:
- Exclude alias/resize reservations from current_reserved_blocks.
- Allow root reserved blocks in the second check, with WARN_ON_ONCE().
- Recheck DISABLE_CHECKPOINT after freeze_super().
---
 fs/f2fs/f2fs.h  | 18 +++++++++++++----
 fs/f2fs/gc.c    | 54 ++++++++++++++++++++++++++++++++++++++-----------
 fs/f2fs/super.c |  1 +
 fs/f2fs/sysfs.c | 12 ++++++++++-
 4 files changed, 68 insertions(+), 17 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 089a62c054e..6b9e1d0e71c 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1897,6 +1897,7 @@ struct f2fs_sb_info {
 	block_t reserved_blocks;		/* configurable reserved blocks */
 	block_t current_reserved_blocks;	/* current reserved blocks */
 	block_t alias_reserved_blocks;		/* reserved blocks for device alias */
+	block_t resize_reserved_blocks;		/* reserved blocks for resize_fs */
 
 	/* Additional tracking for no checkpoint mode */
 	block_t unusable_block_count;		/* # of blocks saved by last cp */
@@ -2666,16 +2667,18 @@ static inline bool __allow_reserved_root(struct f2fs_sb_info *sbi,
 	return false;
 }
 
-static inline unsigned int get_available_block_count(struct f2fs_sb_info *sbi,
-						struct inode *inode, bool cap)
+static inline unsigned int __get_available_block_count(
+					struct f2fs_sb_info *sbi,
+					bool allow_root)
 {
 	block_t avail_user_block_count;
 
 	avail_user_block_count = sbi->user_block_count -
 					sbi->current_reserved_blocks -
-					sbi->alias_reserved_blocks;
+					sbi->alias_reserved_blocks -
+					sbi->resize_reserved_blocks;
 
-	if (test_opt(sbi, RESERVE_ROOT) && !__allow_reserved_root(sbi, inode, cap))
+	if (test_opt(sbi, RESERVE_ROOT) && !allow_root)
 		avail_user_block_count -= F2FS_OPTION(sbi).root_reserved_blocks;
 
 	if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
@@ -2688,6 +2691,13 @@ static inline unsigned int get_available_block_count(struct f2fs_sb_info *sbi,
 	return avail_user_block_count;
 }
 
+static inline unsigned int get_available_block_count(struct f2fs_sb_info *sbi,
+						struct inode *inode, bool cap)
+{
+	return __get_available_block_count(sbi,
+				__allow_reserved_root(sbi, inode, cap));
+}
+
 static inline void f2fs_i_blocks_write(struct inode *, block_t, bool, bool);
 static inline int inc_valid_block_count(struct f2fs_sb_info *sbi,
 				 struct inode *inode, blkcnt_t *count,
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 926e6976bc2..955224f4166 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -2374,6 +2374,7 @@ int f2fs_resize_fs(struct file *filp, __u64 block_count)
 	struct f2fs_lock_context glc;
 	struct f2fs_lock_context clc;
 	unsigned int secs;
+	bool reserved = false;
 	int err = 0;
 	__u32 rem;
 
@@ -2425,10 +2426,17 @@ int f2fs_resize_fs(struct file *filp, __u64 block_count)
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
@@ -2442,29 +2450,45 @@ int f2fs_resize_fs(struct file *filp, __u64 block_count)
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
@@ -2510,5 +2534,11 @@ int f2fs_resize_fs(struct file *filp, __u64 block_count)
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
index d683240040f..28e49e8d71e 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -5345,6 +5345,7 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 	sbi->reserved_blocks = 0;
 	sbi->current_reserved_blocks = 0;
 	sbi->alias_reserved_blocks = 0;
+	sbi->resize_reserved_blocks = 0;
 	limit_reserve_root(sbi);
 	adjust_unusable_cap_perc(sbi);
 
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 9749da70089..ce70d81eba3 100644
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
@@ -601,8 +603,16 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 			return -EINVAL;
 		}
 		*ui = t;
+		/*
+		 * Exclude the space reserved for device aliasing and resize_fs,
+		 * otherwise the reserved blocks can overlap with them and
+		 * __get_available_block_count() can underflow.
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
-- 
2.56.0.218.g1ec904b173-goog

