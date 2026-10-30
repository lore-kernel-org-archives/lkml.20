Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793351735;
	b=dQlzpA1ZERLkQbaFDWFCL+2LUcHLbdqf5gb+dX14g93KXgipdOq3omE4clcRVxsMI/nP
	 RDazAvzAMCAvwI4xpnUW29YvDcjLF3vjyM+5TlJv4sHHke0qlIY+c35SuMLWz3WBuDMzc
	 vMnwcsbTlEuVpxPfxUoCYzVZrd9ZHIqc2E97TfEEQ6tEnMw81X5zzPfW3Z+HPqvMGVE9G
	 n3jwO1Vr9p8qDZBwFqXlTJpwgxkGVQxQyVZCcjPntBlXMXHLAfpBYhz48zaSWV8HdEycq
	 Bqzg40gctPH4PN1NhZ4bAZntLYC1w1BWpYmEq8yS0ETOWIwFsi1x9MQb6uxi0PFvNcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793351735;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=b0Pwj0msTdPhzaKN21Jqub3HQ2ivQUi/T4qOGcLK2DU=;
	b=SMDzPVVovj4JAPdXQGBui6uPWkiYRNxF296B/Zg9rfwmEorSfy/uZLwzJ9WI7gYIYQvh
	 7qrjyYMw0s7EdZC9MWCtTK02V3tkTrNYQf8POhSwSz5Q9KrYDOW2E/xnD1WlJIpZ3Kjsb
	 y1ehKwjRBj0UU/FEvDL0YSXNZJDauxtIBEEqoKFO/SzE/lUMhXpZ9tyQjmo7f1AGdo1QA
	 CH5jqBKznFnoqZ6clX2eosMII/EQyjGIrY78nCbAsheIg5N/S4g7qYe53U+zCI7cKLsQP
	 87vbgJfusEdJFnjf6RP4H4JmfCe9dxKz6BHbYh3tY1PWSSAK63VEXaCwoAI0MzSzk5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.unc.edu;
	spf=pass smtp.mailfrom=cs.unc.edu;
	dkim=pass header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=X5PeiCq0;
	arc=none smtp.remote-ip=209.85.219.44
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8570E606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:15:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8570E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=X5PeiCq0
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-917a707f37eso6179226d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 02:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1793351733; x=1793956533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b0Pwj0msTdPhzaKN21Jqub3HQ2ivQUi/T4qOGcLK2DU=;
        b=X5PeiCq08Px6Q2+gm0+cSznJRnrCGOpR++9gKoLmSM+tL29IdcDig5qzwmoLEFmm+k
         GHMcu/VFbaEG/rYJH0pGVGQvbwzwiT/nQPiknHJn1jf5nC7LNZ1NPocpsqU0hhpi0ybL
         CkzP8QK0gNMfTq1qbtMZxK+J5TOlfWhKnfOvBMQY4s4vog57988wktVIXB1AX0KdcGNe
         yXlQ2/ldDHjYIfvXZQJWRxhxu332Szpu1Ka+LnWyE+2psHPUPkWdYJQ0p3xLhyQQZc8r
         RFJZas+sgvLKWzXdYOplUUkS+pXqtDYV6mRupSXrkWZrVzsnxDWD9uVDz5Tk6scB8JHy
         P8vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793351733; x=1793956533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b0Pwj0msTdPhzaKN21Jqub3HQ2ivQUi/T4qOGcLK2DU=;
        b=uDYyxtX0o/YLVPmUYEjOih8ODqRNVGqK8Kw9OjdcJRzo2ERqb0WMDDjr3GTiJ71vXT
         m1USDPFO16bM/Ly71L92i6GVXYk0kkq1A+UiXEKXZpXLaUaJrw0L+1TH++lSUfB0zeVy
         JwgJ+T4/P98KvYNXHIwV9ty9DLykr6mStfHGSh2TPR5BJBIi/DHvF6KprTulZyNCuROK
         yMnnubHbfoePodspNoNsvuwE541L8SY5Y4UIgzXVGaYxg8cSUhhoD1DIFCZvSotNlNdA
         n7OV7GEjYR0OL+kp3TK4n5goceO5JJH+uqKLgmgLFBtouXPoEINPJllrltZHhcnjf22g
         XRxg==
X-Forwarded-Encrypted: i=1; AKwUvBwcS9aoZ4EbW0zUumzwERIjupaVuKCerzhVOs5d31Lejnw+PN/gCkrr6KPE4983gMUe8QdrM1Rcb9fyrB8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/eJluXuutoGb2n3Ej3r7CeW8F3BtKnczrFcMAwvr4wBM5e7D7
	8RsFyUdnDLqw/xXSS4Rq1Ri9ZiKg05voBpe5RsRUCFZS0lUwFWWY77/9lH8YkrPkPQ==
X-Gm-Gg: AYBFou1SuuwSqsRMUavgHu/6/DAbfUCjANlYe9w6UxsEU8G4icp2jWTz28hx5DvR5sP
	LIzIu8dyCXOezff5e+kKKZ5SXHyHtH8QCWhE6y1GW+Za95WsMb+8cFCZX18ildpUtUFjBwoBLxR
	rvNkotdnLWCFfaowug2DpqWV7UfOP0TvQ+9FldycA4oWaGFpRbB30tfwOVJbgZGH0mZlzSDvdXg
	oVA8UDNJ7t5p4YdvjA2oPckIS2ZHWqrAn87ay7TgJgH/WFKGFVkruhwFFKaIetFCMPfKong011H
	OtEAhPtBoewC5GC0AidlOWCGmS9WekHjuf/nmCreudTGAkz3ar32ZTD5ZMOPpXTvdgQAycQoLjm
	Hc2cc8vwBk7xAhXhOuYgh6cH7ePXd6EKUFVQ1CGPHGDUGDZGqMPtpnYGPQA8dzh/z+r0EkvDk+e
	1LOzPU6cP+M9FUfKJSIczk5Nm+vFGGfgMMlBr1LpcB5cnAFhmk/75Xnuj+n3ReGspi0oeRAV/md
	RzmLSp6+bd0Csf1ITgJ22Di9mTJOfwePXKiBpRgNK5ipKYaWezi2wvNJqpFXfIYnUu0EXx0yofZ
	vgV2SQ2p/zStUEZW8YvmF/JbQXxy/T4lPKbpQdROIN1I3WeQ5VLl
X-Received: by 2002:ad4:5cab:0:b0:919:5a24:d77c with SMTP id 6a1803df08f44-91ca4b2a557mr24211986d6.31.1793351733042;
        Fri, 30 Oct 2026 02:15:33 -0700 (PDT)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca7f4767asm10428406d6.21.2026.10.30.02.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 02:15:30 -0700 (PDT)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: viro@zeniv.linux.org.uk,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] f2fs: don't fail namespace operations on dirsync checkpoint errors
Date: Fri, 30 Oct 2026 05:15:24 -0400
Message-ID: <20261030091524.292463-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
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

Commit dafb84f092a6 ("f2fs: fix to propagate error from f2fs_sync_fs()")
made create, link, unlink, symlink, mkdir, mknod and rename return the
result of the checkpoint for a dirsync directory. That checkpoint runs
after the directory has changed, but the VFS takes an error to mean that
nothing happened and skips d_move(), d_delete() and S_DEAD. The dcache no
longer matches the directory.

For example, on a filesystem mounted with -o dirsync whose device was then
set read-only with BLKROSET, rename() fails with EROFS while readdir lists
only the new name and stat() only finds the old one. After a failed
rmdir(), stat() still finds the directory with no links, and a create
inside it fails with EROFS but leaves the file there. Once the device is
writable again, these "failed" changes reach the disk. A write error during
the checkpoint causes the same mismatch with EIO.

As commit 24c1a47f1ed2 ("f2fs: don't leave the hashed inode while it's
unlinked") notes for symlink, the final flush or checkpoint is not a reason
to roll back the operation. Ignore its result again in these paths. Errors
from before the directory changes are still returned, syncfs() still
reports the checkpoint failure, and the remount change from the same commit
is kept.

Fixes: dafb84f092a6 ("f2fs: fix to propagate error from f2fs_sync_fs()")
Cc: stable@vger.kernel.org
Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
---
With this patch a dirsync operation can return 0 although its checkpoint
failed, as before v7.3. In the write error test below the change is not on
disk after a remount, so the EIO was accurate about durability, but the VFS
cannot represent "changed but not durable". The filesystem has stopped by
then: later creates get EIO and syncfs() reports it.

Tested on x86-64 KVM with KASAN, f2fs dev 83f32c773255 with and without
this patch:
- 14 namespace operations (all eight callbacks plus rmdir, overwrite,
  cross-directory rename and whiteout) with -o sync, -o dirsync and
  FS_DIRSYNC_FL on a read-only device: EROFS and stat/readdir disagree
  before, success and they agree after. Remounted contents match on both.
  No change without dirsync or on a writable device.
- dm error target under -o sync, nine operations: EIO and the same mismatch
  before, 0 and no mismatch after.
- ENOTEMPTY, EEXIST, ENOENT and injected ENOSPC are still returned, with
  the namespace intact.
- fsck.f2fs --dry-run exits 0 on all images.

xfstests were not run; without a failing checkpoint the only difference is
ignoring a zero return.

 fs/f2fs/namei.c | 46 ++++++++++++++--------------------------------
 1 file changed, 14 insertions(+), 32 deletions(-)

diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index ce5d536d892b..9b127b38b6c6 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -402,11 +402,8 @@ static int f2fs_create(const struct mnt_idmap *idmap, struct inode *dir,
 
 	d_instantiate_new(dentry, inode);
 
-	if (IS_DIRSYNC(dir)) {
-		err = f2fs_sync_fs(sbi->sb, 1);
-		if (err)
-			return err;
-	}
+	if (IS_DIRSYNC(dir))
+		f2fs_sync_fs(sbi->sb, 1);
 
 	f2fs_balance_fs(sbi, true);
 	return 0;
@@ -458,11 +455,8 @@ static int f2fs_link(struct dentry *old_dentry, struct inode *dir,
 
 	d_instantiate(dentry, inode);
 
-	if (IS_DIRSYNC(dir)) {
-		err = f2fs_sync_fs(sbi->sb, 1);
-		if (err)
-			return err;
-	}
+	if (IS_DIRSYNC(dir))
+		f2fs_sync_fs(sbi->sb, 1);
 	return 0;
 out:
 	clear_inode_flag(inode, FI_INC_LINK);
@@ -642,7 +636,7 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
 		d_invalidate(dentry);
 
 	if (IS_DIRSYNC(dir))
-		err = f2fs_sync_fs(F2FS_I_SB(dir)->sb, 1);
+		f2fs_sync_fs(F2FS_I_SB(dir)->sb, 1);
 out:
 	trace_f2fs_unlink_exit(d_inode(dentry), err);
 	return err;
@@ -730,7 +724,7 @@ static int f2fs_symlink(const struct mnt_idmap *idmap, struct inode *dir,
 	ret = filemap_write_and_wait_range(inode->i_mapping, 0,
 					   disk_link.len - 1);
 	if (!ret && IS_DIRSYNC(dir))
-		err = f2fs_sync_fs(sbi->sb, 1);
+		f2fs_sync_fs(sbi->sb, 1);
 
 	f2fs_balance_fs(sbi, true);
 out:
@@ -787,11 +781,8 @@ static struct dentry *f2fs_mkdir(const struct mnt_idmap *idmap, struct inode *di
 
 	d_instantiate_new(dentry, inode);
 
-	if (IS_DIRSYNC(dir)) {
-		err = f2fs_sync_fs(sbi->sb, 1);
-		if (err)
-			return ERR_PTR(err);
-	}
+	if (IS_DIRSYNC(dir))
+		f2fs_sync_fs(sbi->sb, 1);
 
 	f2fs_balance_fs(sbi, true);
 	return NULL;
@@ -845,11 +836,8 @@ static int f2fs_mknod(const struct mnt_idmap *idmap, struct inode *dir,
 
 	d_instantiate_new(dentry, inode);
 
-	if (IS_DIRSYNC(dir)) {
-		err = f2fs_sync_fs(sbi->sb, 1);
-		if (err)
-			return err;
-	}
+	if (IS_DIRSYNC(dir))
+		f2fs_sync_fs(sbi->sb, 1);
 
 	f2fs_balance_fs(sbi, true);
 	return 0;
@@ -1149,11 +1137,8 @@ static int f2fs_rename(const struct mnt_idmap *idmap, struct inode *old_dir,
 
 	f2fs_unlock_op(sbi, &lc);
 
-	if (IS_DIRSYNC(old_dir) || IS_DIRSYNC(new_dir)) {
-		err = f2fs_sync_fs(sbi->sb, 1);
-		if (err)
-			return err;
-	}
+	if (IS_DIRSYNC(old_dir) || IS_DIRSYNC(new_dir))
+		f2fs_sync_fs(sbi->sb, 1);
 
 	f2fs_update_time(sbi, REQ_TIME);
 	return 0;
@@ -1321,11 +1306,8 @@ static int f2fs_cross_rename(struct inode *old_dir, struct dentry *old_dentry,
 
 	f2fs_unlock_op(sbi, &lc);
 
-	if (IS_DIRSYNC(old_dir) || IS_DIRSYNC(new_dir)) {
-		err = f2fs_sync_fs(sbi->sb, 1);
-		if (err)
-			return err;
-	}
+	if (IS_DIRSYNC(old_dir) || IS_DIRSYNC(new_dir))
+		f2fs_sync_fs(sbi->sb, 1);
 
 	f2fs_update_time(sbi, REQ_TIME);
 	return 0;

base-commit: 83f32c773255720a661aa45d83e36278135f23f5
-- 
2.53.0

