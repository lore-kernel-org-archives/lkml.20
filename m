Received: from mail-wr2-f40.google.com (mail-wr2-f40.google.com [74.125.225.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291BF47ECF0
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 13:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790948641; cv=none; b=I3sx0bJIkEthKYWdGci84Gyb5Rgmc+vJn9Un7z856GKqxifUvgOjIh7uxa/CEDwGXqhfOe2fGfUdI81XkTCV9dwAoZ5JiOF0PtJUEIUAYzfYYKC9gXR+TdNuwxQY2vn+RVbwnx0JD4X7hm4b2qEn26KaiGP5+xn7/RghVISSQ4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790948641; c=relaxed/simple;
	bh=Nl2aWnpl9PJ0LxPZtRAvgWYfvRX7U1TdZDpmUGZ7ruU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gskOLpJ0GQoQaH7QVwHgR3oZI1dPWlt+13S1CZGx4j9/JG3IfVZOHp7d5HYL51ooVGVRKrOyIRYHg6Brsy6B3K63y0pI96NVHjThL7+iWucQAsfVw0HFowb10F93Qy/sIyAnD7yZ1ZNR0MluvDkD9tEwuU/ULkAmz1WnLKtd1kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L52QjaNc; arc=none smtp.client-ip=74.125.225.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L52QjaNc"
Received: by mail-wr2-f40.google.com with SMTP id ffacd0b85a97d-48b017a3be3so2541968f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 06:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790948637; x=1791553437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mn+udfucuciyXQimcC48axZ4iQXC1W9g3f3Q40uLmHU=;
        b=L52QjaNc+3OqrDjXRbow3V0V5VVGQNjolELCe61S2DdEHAAsLRVkg4xJ80WN06fvLV
         deN6NKFPJD5CQ7AlcnM40Tz9i5mpCXWRfHiyvXw4QX0O/uR9/w9oGIfNdAEpQ8zITaqL
         mVoGMx4dnLelr5+r05LahwzNj8mMRQ5MrbK1bDgiVTw/uOSJK06zo1saYcochZfZb+9C
         d81d27CBua3U45lEPR96Zn5krAE22P6GOrYiYvVoRahsfapdd7eynX0brQwwaywCyqEi
         GqSGJXAVZd8fJz4iWhKWjeU+zr/3aiPWoa+ZEeTiGJ1UW7CRbP3OnE3lC6PbU2NVrPgC
         ad6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790948637; x=1791553437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mn+udfucuciyXQimcC48axZ4iQXC1W9g3f3Q40uLmHU=;
        b=ozy3R20/bdFIqL8rc4Mx1wFyOxXUyj6Q6a6nRh/nf37e9bshLX9gR4ZnhC/QgIj7RK
         lQG44fUcL7KCrym05ESChdqS9AhKyb18N6sNGddrGTeTLyAOGpL5obuWBa2u/+VPEs/5
         D372XsPI0F0UHwq/WVa7g7motgpuFCZUGUGd1y88abtvIetCLvcY/1qaOZqsW3I4cMIF
         VzCvgc5Gub4dQJCr7js+C2q0se/h7sb4kjrcgeMym7JmCZ7q++vn8Pts1DZVfAsrHM/W
         Io5QYfgkOT/7Mi/D8rLJvW4wRBrVSUVqE9bdp8Fek+zSZ2U/XHOK9/Y/IorJ+uRm8PSp
         NgMg==
X-Gm-Message-State: AFq9FYIs1qz8RcbwTJyZs2kqzpECdaafo45thzxJdrtCiwI6UtDqsG9G
	ok8O1nDGPrkanDz48LsfaJ5dS/11VOZOTrcvtOg5Eq0gfoXZ5s0RyeioNT/rJFUCq+M=
X-Gm-Gg: AYBFou00YqfIrwoXxQImZoIkRRRDm4adcmvamqkuyUOoREw+/4TaOPFj9YBsmmaoyJn
	SmIavhHaEuKdPc33CtiD8mxD+rC8hSKg4ncPkEemflr6WeI5cACmV0mvlbeJwzICW9TwD1lqNgT
	QrnwDn6BO2O6IJjAJjRMvBb1z6XdKpfITtqpoXmSVK+nzQQ5cP/LtxqwYe8/5J16i7t55NQ5uSH
	vvap/bD9jO9HKkqKHNUx6p9h7k6Fb+Az4AcazAgpyiRGwuWo2lyGectGAO/A4+q7j29yhRW8442
	inpkY0qVMjlb6pdEEo7XLoyNIWWnW1OJ72WV8A9zUnEudTd7GBNcCOuLw3pMuBNQKpgc4I3L4zt
	OAJOk1+cTXafsnHcVLogloFdYu4BKGJnS0d+716oh6wPVZgrTXsueq2ljwHuE6jTSErw0PeBIfu
	aap+iAad9IgeZxT9R8HZuYfaCv2BSJDAxQsiy7QhEAo007BEbXXYCIuijT0vuELrHvsJ3CLsfiP
	m/G4J139p/maBxV2DZtdo2W2tIP6VYV9SvRq7uLHv5TbcOFHN/JUGyxO2bCdSCiUDrovSE6RwLr
	dV/ay/XZuuBGWHZpbdR2jtiwF8qKo3djf+yVIkI5gseaecnkWXHIB9eDYEzYbUf4z7+5A6KchE3
	1oQ+Puvfr/qqPfIoIVb1Xh/F08ESL
X-Received: by 2002:a05:6000:2613:b0:48a:f509:c22a with SMTP id ffacd0b85a97d-48b1256b860mr5488351f8f.0.1790948637088;
        Fri, 02 Oct 2026 06:43:57 -0700 (PDT)
Received: from Ubuntu.ts.net (87-205-15-91.static.ip.netia.com.pl. [87.205.15.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b38104f89sm6381538f8f.30.2026.10.02.06.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 06:43:56 -0700 (PDT)
From: Krystian Kaniewski <krystianmkaniewski@gmail.com>
To: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
Cc: linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	syzbot+b0aebd03565f5774f7f8@syzkaller.appspotmail.com
Subject: [PATCH v2] fat: skip rename rollback on buffers with failed I/O
Date: Fri,  2 Oct 2026 15:43:48 +0200
Message-ID: <1f18819d20c92960b8b2d6ccc8bc4506d346150e.1790779353.git.krystianmkaniewski@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <87ld8j4161.fsf@mail.parknet.co.jp>
References: <6aa82300.a211d2ce.1a5198.0295.GAE@google.com> <20260929090029.742579-1-krystianmkaniewski@gmail.com> <87ld8j4161.fsf@mail.parknet.co.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A synchronous directory-entry write can fail after clearing BH_Uptodate.
The rename error path then attempts rollback by modifying and dirtying the
same buffer. mark_buffer_dirty() warns on the resulting !buffer_uptodate
buffer, and retrying the write cannot repair the underlying I/O failure.

Once a synchronous update fails, record whether the new entry shares that
buffer and do not touch it again. Before fat_remove_entries() releases the
old-entry buffer, record aliases so later failures also avoid rolling back
through it. For RENAME_EXCHANGE, restore the first ".." update only when it
does not share the buffer on which the second update failed.

Keep the existing forced synchronous MS-DOS rollback when it targets a
different buffer. For skipped rollbacks, retain the original error and
report filesystem corruption through fat_fs_error().

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Reported-by: syzbot+b0aebd03565f5774f7f8@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=b0aebd03565f5774f7f8
Signed-off-by: Krystian Kaniewski <krystianmkaniewski@gmail.com>
---
Changes in v2:
- Avoid buffer locking and waiting in the normal update path, as suggested
  by OGAWA Hirofumi.
- Give up rollback after a synchronous failure on the affected buffer.
- Track buffer aliases before fat_remove_entries() releases the old buffer.
- Keep forced synchronization for an MS-DOS rollback on another buffer.

 fs/fat/namei_msdos.c | 28 ++++++++++++++++++++-----
 fs/fat/namei_vfat.c  | 50 +++++++++++++++++++++++++++++---------------
 2 files changed, 56 insertions(+), 22 deletions(-)

diff --git a/fs/fat/namei_msdos.c b/fs/fat/namei_msdos.c
index d46d1a3851f25..079f8bb61647f 100644
--- a/fs/fat/namei_msdos.c
+++ b/fs/fat/namei_msdos.c
@@ -441,6 +441,8 @@ static int do_msdos_rename(struct inode *old_dir, unsigned char *old_name,
 	struct fat_slot_info old_sinfo, sinfo;
 	struct timespec64 ts;
 	loff_t new_i_pos;
+	bool dotdot_in_old_bh, new_in_old_bh;
+	bool new_bh_failed = false;
 	int err, old_attrs, is_dir, update_dotdot, corrupt = 0;
 
 	old_sinfo.bh = sinfo.bh = dotdot_bh = NULL;
@@ -532,14 +534,20 @@ static int do_msdos_rename(struct inode *old_dir, unsigned char *old_name,
 				      &MSDOS_I(old_inode)->i_metadata_bhs);
 		if (IS_DIRSYNC(new_dir)) {
 			err = sync_dirty_buffer(dotdot_bh);
-			if (err)
-				goto error_dotdot;
+			if (err) {
+				corrupt = err;
+				new_bh_failed = sinfo.bh == dotdot_bh;
+				goto error_inode;
+			}
 		}
 		drop_nlink(old_dir);
 		if (!new_inode)
 			inc_nlink(new_dir);
 	}
 
+	/* Remember aliases before fat_remove_entries() releases the buffer. */
+	dotdot_in_old_bh = dotdot_bh == old_sinfo.bh;
+	new_in_old_bh = sinfo.bh == old_sinfo.bh;
 	err = fat_remove_entries(old_dir, &old_sinfo);	/* and releases bh */
 	old_sinfo.bh = NULL;
 	if (err)
@@ -564,12 +572,22 @@ static int do_msdos_rename(struct inode *old_dir, unsigned char *old_name,
 error_dotdot:
 	/* data cluster is shared, serious corruption */
 	corrupt = 1;
+	if (dotdot_in_old_bh || new_in_old_bh) {
+		/* Give up rollback on the buffer whose write failed. */
+		corrupt = err;
+		new_bh_failed = new_in_old_bh;
+	}
+
+	if (update_dotdot && !dotdot_in_old_bh) {
+		int dotdot_err;
 
-	if (update_dotdot) {
 		fat_set_start(dotdot_de, MSDOS_I(old_dir)->i_logstart);
 		mmb_mark_buffer_dirty(dotdot_bh,
 				      &MSDOS_I(old_inode)->i_metadata_bhs);
-		corrupt |= sync_dirty_buffer(dotdot_bh);
+		dotdot_err = sync_dirty_buffer(dotdot_bh);
+		corrupt |= dotdot_err;
+		if (dotdot_err && sinfo.bh == dotdot_bh)
+			new_bh_failed = true;
 	}
 error_inode:
 	fat_detach(old_inode);
@@ -581,7 +599,7 @@ static int do_msdos_rename(struct inode *old_dir, unsigned char *old_name,
 			mark_inode_dirty(new_inode);
 			corrupt |= sync_inode_metadata(new_inode, 1);
 		}
-	} else {
+	} else if (!new_bh_failed) {
 		/*
 		 * If new entry was not sharing the data cluster, it
 		 * shouldn't be serious corruption.
diff --git a/fs/fat/namei_vfat.c b/fs/fat/namei_vfat.c
index da3e89c0b16ac..b6a32f39a6f88 100644
--- a/fs/fat/namei_vfat.c
+++ b/fs/fat/namei_vfat.c
@@ -938,6 +938,8 @@ static int vfat_rename(struct inode *old_dir, struct dentry *old_dentry,
 	struct fat_slot_info old_sinfo, sinfo;
 	struct timespec64 ts;
 	loff_t new_i_pos;
+	bool dotdot_in_old_bh, new_in_old_bh;
+	bool new_bh_failed = false;
 	int err, is_dir, corrupt = 0;
 	struct super_block *sb = old_dir->i_sb;
 
@@ -983,13 +985,19 @@ static int vfat_rename(struct inode *old_dir, struct dentry *old_dentry,
 	if (dotdot_de) {
 		err = vfat_update_dotdot_de(new_dir, old_inode, dotdot_bh,
 					    dotdot_de);
-		if (err)
-			goto error_dotdot;
+		if (err) {
+			corrupt = err;
+			new_bh_failed = sinfo.bh == dotdot_bh;
+			goto error_inode;
+		}
 		drop_nlink(old_dir);
 		if (!new_inode)
  			inc_nlink(new_dir);
 	}
 
+	/* Remember aliases before fat_remove_entries() releases the buffer. */
+	dotdot_in_old_bh = dotdot_bh == old_sinfo.bh;
+	new_in_old_bh = sinfo.bh == old_sinfo.bh;
 	err = fat_remove_entries(old_dir, &old_sinfo);	/* and releases bh */
 	old_sinfo.bh = NULL;
 	if (err)
@@ -1012,10 +1020,19 @@ static int vfat_rename(struct inode *old_dir, struct dentry *old_dentry,
 error_dotdot:
 	/* data cluster is shared, serious corruption */
 	corrupt = 1;
+	if (dotdot_in_old_bh || new_in_old_bh) {
+		/* Give up rollback on the buffer whose write failed. */
+		corrupt = err;
+		new_bh_failed = new_in_old_bh;
+	}
 
-	if (dotdot_de) {
-		corrupt |= vfat_update_dotdot_de(old_dir, old_inode, dotdot_bh,
-						 dotdot_de);
+	if (dotdot_de && !dotdot_in_old_bh) {
+		int dotdot_err = vfat_update_dotdot_de(old_dir, old_inode,
+						       dotdot_bh, dotdot_de);
+
+		corrupt |= dotdot_err;
+		if (dotdot_err && sinfo.bh == dotdot_bh)
+			new_bh_failed = true;
 	}
 error_inode:
 	fat_detach(old_inode);
@@ -1026,7 +1043,7 @@ static int vfat_rename(struct inode *old_dir, struct dentry *old_dentry,
 			mark_inode_dirty(new_inode);
 			corrupt |= sync_inode_metadata(new_inode, 1);
 		}
-	} else {
+	} else if (!new_bh_failed) {
 		/*
 		 * If new entry was not sharing the data cluster, it
 		 * shouldn't be serious corruption.
@@ -1105,14 +1122,18 @@ static int vfat_rename_exchange(struct inode *old_dir, struct dentry *old_dentry
 	if (old_dotdot_de) {
 		err = vfat_update_dotdot_de(new_dir, old_inode, old_dotdot_bh,
 					    old_dotdot_de);
-		if (err)
-			goto error_old_dotdot;
+		if (err) {
+			corrupt = err;
+			goto error_exchange;
+		}
 	}
 	if (new_dotdot_de) {
 		err = vfat_update_dotdot_de(old_dir, new_inode, new_dotdot_bh,
 					    new_dotdot_de);
-		if (err)
-			goto error_new_dotdot;
+		if (err) {
+			corrupt = err;
+			goto error_old_dotdot;
+		}
 	}
 
 	/* if cross directory and only one is a directory, adjust nlink */
@@ -1135,14 +1156,9 @@ static int vfat_rename_exchange(struct inode *old_dir, struct dentry *old_dentry
 
 	return err;
 
-error_new_dotdot:
-	if (new_dotdot_de) {
-		corrupt |= vfat_update_dotdot_de(new_dir, new_inode,
-						 new_dotdot_bh, new_dotdot_de);
-	}
-
 error_old_dotdot:
-	if (old_dotdot_de) {
+	/* Both entries may share the buffer whose write failed. */
+	if (old_dotdot_de && old_dotdot_bh != new_dotdot_bh) {
 		corrupt |= vfat_update_dotdot_de(old_dir, old_inode,
 						 old_dotdot_bh, old_dotdot_de);
 	}

base-commit: 93f51579e7df248780214094418f205253383cc5
-- 
2.53.0

