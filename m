Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793782661;
	b=GebGMPTUTOlINVlEMkGYgKNAzKRPc/nU8uMslgbfdG8eliXQkNLdThRuR63C3sP1zwHE
	 R42RVmo6OPW45DMS05utECMdG+c7HP8cnefxFOFkkx1Q/JyYm53aoFSINjuO45vVNRAKM
	 0Ww1Eo6ulEc1LE/Wwqe+Dkd1QjYtbk0gouJfd2ymtGJ6wlmkNMABt3Nz/zth4ljgJrSjs
	 I1q/y6Sc7Eko2xsrD2apXdIYDDrJeLvP/cYoErTh7YO0UHOklGtcwuLy6QUW3jXNQlcmw
	 G7+bB/SYXAM2dtv3ciWqzc2xCuVm3IB1Qb1ThoqKIeZAydE4dx2DDN9k46YOGF377aA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793782661;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QhWsA6KUNbQJR1l3jYUSHTDtf6TXykLxyo3+xLwgmSY=;
	b=0ZbBMEfltkQv+Sy1UsFW6XeiKo/BaSBPjcHz3feC0R9a7hqMzE5r1B836pTnWZs2FMt2
	 Uut1bni/e6fVPvLLuE1QIfl0AMsXMHq4KBc978lb/Xr6hNfFhA3xUSr4RyDA1JlyZa4oX
	 23mURdvVUAOZyhN9OG/8DVjzW7IqqSsMNWhw2n9kS47MRRwulr5gMB0ZJkizd99N0fOHr
	 727zH85+1SHMsXzKD36294h6vwNEdVuvuqdGs6gUG8u9TRn7igseXtD0fW6EaTtIDN+N/
	 h6O2mQAuSXiVnOtykY3vdFVc/4cTxTiZHJEKz+DbLjPoJYd6mpR7Ud+qoLF8RuZnuoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=VRaKuVPH;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2359606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 08:57:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2359606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=VRaKuVPH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=VRaKuVPHtyF+SUq90ZRWm13D5iHZ89zPZoYo0KRoljG8PmCEYWAhQfpW8tgyBk75XfibZJfxCQGka
	 xtYol8l1Dve8JUMoAPhJgaPlImSdtwUIamassf/GABtkSA9Uz1YsltWoLnITnzu3VtbdpFjm6026hf
	 7blJixSZI/+HyFls=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66aeaf37f540-68d41;
	Wed, 04 Nov 2026 16:57:38 +0800 (CST)
X-RM-TRANSID:2ee66aeaf37f540-68d41
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from fedora (unknown[223.108.79.101])
	by rmsmtp-syy-appsvr05-12005 (RichMail) with SMTP id 2ee56aeaf37cab6-1bfcb;
	Wed, 04 Nov 2026 16:57:38 +0800 (CST)
X-RM-TRANSID:2ee56aeaf37cab6-1bfcb
From: Yiqing Wu <wuyiqing@cmss.chinamobile.com>
To: David Woodhouse <dwmw2@infradead.org>,
	Richard Weinberger <richard@nod.at>
Cc: Al Viro <viro@zeniv.linux.org.uk>,
	David Howells <dhowells@redhat.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	syzbot+ae2d1f6d474e1725bdc0@syzkaller.appspotmail.com
Subject: [PATCH v2] jffs2: fix use-after-free in jffs2_garbage_collect_thread
Date: Wed,  4 Nov 2026 16:57:25 +0800
Message-ID: <20261104085725.241655-1-wuyiqing@cmss.chinamobile.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103090018.157034-1-wuyiqing@cmss.chinamobile.com>
References: <20261103090018.157034-1-wuyiqing@cmss.chinamobile.com>
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

jffs2_do_remount_fs() decides whether to (re)start the garbage collect
thread from the requested flags:

	if (!(fc->sb_flags & SB_RDONLY))
		jffs2_start_garbage_collect_thread(c);

The flags which actually take effect, however, are computed by
reconfigure_super() as

	sb->s_flags = (sb->s_flags & ~fc->sb_flags_mask) |
		      (fc->sb_flags & fc->sb_flags_mask);

and fspick(2) creates its reconfiguration context with both sb_flags
and sb_flags_mask set to zero, i.e. "no change requested".  So after

	fd = fspick(AT_FDCWD, mnt, 0);
	fsconfig(fd, FSCONFIG_CMD_RECONFIGURE, NULL, NULL, 0);

on a filesystem which was mounted read-only, jffs2 starts the GC
thread (because fc->sb_flags carries no SB_RDONLY) while the superblock
keeps its SB_RDONLY (because fc->sb_flags_mask is zero).  The classic
mount(2) remount path is not affected: it always passes a full
MS_RMT_MASK, so the flags it hands to the filesystem do take effect.

jffs2_kill_sb() then refuses to stop the GC thread for a read-only
superblock:

	if (c && !sb_rdonly(sb))
		jffs2_stop_garbage_collect_thread(c);
	kill_mtd_super(sb);
	kfree(c);

so at unmount the thread is neither signalled nor waited for, and
kfree(c) frees the jffs2_sb_info out from under the still-running
jffs2_gcd_mtd%d kthread.  It dereferences the freed object when it
wakes up from its 50 ms idle sleep:

  BUG: KASAN: slab-use-after-free in rt_spin_lock
  Read of size 1 at addr ffff88804f2b02c0 by task jffs2_gcd_mtd0/12364
  Call Trace:
  rt_spin_lock kernel/locking/spinlock_rt.c:56
  spin_lock include/linux/spinlock_rt.h:45 [inline]
  jffs2_garbage_collect_thread fs/jffs2/background.c:94

Fix the desynchronisation, and harden the unmount path against it:

  - jffs2_do_remount_fs() now derives the flags which will be in
    effect after the reconfiguration the same way reconfigure_super()
    does, and only starts the GC thread if the filesystem will
    actually be writable.

  - jffs2_kill_sb() unconditionally stops and waits for the GC thread
    before freeing c.  Without a running GC thread this is a no-op,
    and the thread can no longer outlive the jffs2_sb_info, no matter
    which future path manages to start it on a superblock that stays
    read-only.

Fixes: ec10a24f10c8 ("vfs: Convert jffs2 to use the new mount API")
Reported-by: syzbot+ae2d1f6d474e1725bdc0@syzkaller.appspotmail.com
Closes: https://syzbot.org/bug?extid=ae2d1f6d474e1725bdc0
Signed-off-by: Yiqing Wu <wuyiqing@cmss.chinamobile.com>
---
v2:
  - jffs2_fill_super() initialises the superblock locks before the
    rp_size sanity check can fail the mount, so that the now
    unconditional jffs2_stop_garbage_collect_thread() does not take an
    uninitialised c->erase_completion_lock when a mount bails out
    early.  (Read-write mounts with an oversized rp_size already
    reached that path even before this change.)
  - v1: https://lore.kernel.org/all/20261103090018.157034-1-wuyiqing@cmss.chinamobile.com/T/
---
 fs/jffs2/fs.c    | 13 ++++++++++++-
 fs/jffs2/super.c | 16 ++++++++++------
 2 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/fs/jffs2/fs.c b/fs/jffs2/fs.c
index 05cf860307c7..a124f5309c2b 100644
--- a/fs/jffs2/fs.c
+++ b/fs/jffs2/fs.c
@@ -396,6 +396,7 @@ void jffs2_dirty_inode(struct inode *inode, int flags)
 int jffs2_do_remount_fs(struct super_block *sb, struct fs_context *fc)
 {
 	struct jffs2_sb_info *c = JFFS2_SB_INFO(sb);
+	unsigned int sb_flags;
 
 	if (c->flags & JFFS2_SB_FLAG_RO && !sb_rdonly(sb))
 		return -EROFS;
@@ -411,7 +412,17 @@ int jffs2_do_remount_fs(struct super_block *sb, struct fs_context *fc)
 		mutex_unlock(&c->alloc_sem);
 	}
 
-	if (!(fc->sb_flags & SB_RDONLY))
+	/*
+	 * Start the GC thread only if the filesystem will actually be
+	 * writable after the reconfiguration.  Note that reconfigure_super()
+	 * applies the flags as
+	 * (sb->s_flags & ~fc->sb_flags_mask) | (fc->sb_flags & fc->sb_flags_mask),
+	 * so a zero sb_flags_mask (as e.g. used by fspick()) leaves the
+	 * superblock read-only.
+	 */
+	sb_flags = (sb->s_flags & ~fc->sb_flags_mask) |
+		   (fc->sb_flags & fc->sb_flags_mask);
+	if (!(sb_flags & SB_RDONLY))
 		jffs2_start_garbage_collect_thread(c);
 
 	fc->sb_flags |= SB_NOATIME;
diff --git a/fs/jffs2/super.c b/fs/jffs2/super.c
index 81396a092ba8..9ac22b6479f7 100644
--- a/fs/jffs2/super.c
+++ b/fs/jffs2/super.c
@@ -267,12 +267,12 @@ static int jffs2_fill_super(struct super_block *sb, struct fs_context *fc)
 	c->mtd = sb->s_mtd;
 	c->os_priv = sb;
 
-	if (c->mount_opts.rp_size > c->mtd->size)
-		return invalf(fc, "jffs2: Too large reserve pool specified, max is %llu KB",
-			      c->mtd->size / 1024);
-
 	/* Initialize JFFS2 superblock locks, the further initialization will
-	 * be done later */
+	 * be done later.  This must precede any error return: kill_sb() stops
+	 * the GC thread even on mounts which failed before it could start,
+	 * and jffs2_stop_garbage_collect_thread() takes
+	 * c->erase_completion_lock.
+	 */
 	mutex_init(&c->alloc_sem);
 	mutex_init(&c->erase_free_sem);
 	init_waitqueue_head(&c->erase_wait);
@@ -280,6 +280,10 @@ static int jffs2_fill_super(struct super_block *sb, struct fs_context *fc)
 	spin_lock_init(&c->erase_completion_lock);
 	spin_lock_init(&c->inocache_lock);
 
+	if (c->mount_opts.rp_size > c->mtd->size)
+		return invalf(fc, "jffs2: Too large reserve pool specified, max is %llu KB",
+			      c->mtd->size / 1024);
+
 	sb->s_op = &jffs2_super_operations;
 	sb->s_export_op = &jffs2_export_ops;
 	sb->s_flags = sb->s_flags | SB_NOATIME;
@@ -345,7 +349,7 @@ static void jffs2_put_super (struct super_block *sb)
 static void jffs2_kill_sb(struct super_block *sb)
 {
 	struct jffs2_sb_info *c = JFFS2_SB_INFO(sb);
-	if (c && !sb_rdonly(sb))
+	if (c)
 		jffs2_stop_garbage_collect_thread(c);
 	kill_mtd_super(sb);
 	kfree(c);
-- 
2.56.0



