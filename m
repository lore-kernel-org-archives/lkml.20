Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793696446;
	b=cG+OD70s3m1CxGQmoWH15JFUONWBCVTUZfM+CcicQIK+QB4O9UqZ1HcwGu247d47VwtJ
	 1lbcHT9EXVE7WRsH85toca5cvUVl8wXdA1dmgXYnKE0imjcrx+Qcmxt85b0znC2/IN1Ko
	 TJ1w5vhJwocPJSlRNX+9RVfzGFG9BbBuNj6LeYwbanjffr5W+2kzX5Ra9MgQAAXM/gsTL
	 PqFmzLfTphL9Agt6gJ76cPM1T+zZ8LwUq9PkTcf0zE3Ljb3yVydbTFg7zauXvjw3W+KY2
	 3ypLpY+nIwyz4MdSkaW6W8rkDeIeR26jxYa54ar8QmWQWw3I/419PvzekoGTFxnojbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793696446;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Lo7zXkJJGWFfYhI92q1KbSvzayE3Tu6ZOzae8MIc40o=;
	b=jOoU8O0+JHKEd0yMux7dsxEzHLBeNV0jY8V6mk6uKWiF9AQaJvofKVUZmA2lu2z49eGI
	 lQ0PoxqA3ASmU6NzsMejULdEdJRtJ9UNs0FGpwAB2zFs2MOmutto6vsHV437iF+XUGfFf
	 XBoDgdBofYtPsbCJIKWe5B2rcWlriXOfAZEvCCvSQaB9POFqn+Ovttu3FGEHQogWSae9v
	 FVwL+z12jy4TlI4OshaOYaydo4dV5OGQD/i3TztnfOE2VYq82OBVloYKcnhQleLCEsTjx
	 8G7REKq2ZVG3diBIwk9kqaQaqsw+N6cnUyaHmnskTY2nUJrUkQ+wEm0VrXFp2Pxducw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=ex1PNzqx;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E1D0606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:00:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E1D0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=ex1PNzqx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=ex1PNzqxt+8NetH9NBMOt8M879RgNmYNIc8ZssNk/Bd1sBYXuvII/kkg4h3n72vAUNxazPp8aBk3P
	 laYuyCH7uEBOeEQ+4kZNcI0s/VwXgcdVIKK3q1ydFM5qm/FssG+wPijcCnUXtJ3xU9at65TtZRdxnT
	 MVzh4UbyZcEpLaW4=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee16ae9a2ad7dd-6e808;
	Tue, 03 Nov 2026 17:00:29 +0800 (CST)
X-RM-TRANSID:2ee16ae9a2ad7dd-6e808
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from fedora (unknown[223.108.79.101])
	by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee66ae9a2aa41b-f3235;
	Tue, 03 Nov 2026 17:00:29 +0800 (CST)
X-RM-TRANSID:2ee66ae9a2aa41b-f3235
From: Yiqing Wu <wuyiqing@cmss.chinamobile.com>
To: David Woodhouse <dwmw2@infradead.org>,
	Richard Weinberger <richard@nod.at>
Cc: Al Viro <viro@zeniv.linux.org.uk>,
	David Howells <dhowells@redhat.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	syzbot+ae2d1f6d474e1725bdc0@syzkaller.appspotmail.com
Subject: [PATCH] jffs2: fix use-after-free in jffs2_garbage_collect_thread
Date: Tue,  3 Nov 2026 17:00:18 +0800
Message-ID: <20261103090018.157034-1-wuyiqing@cmss.chinamobile.com>
X-Mailer: git-send-email 2.56.0
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

Fix both layers of the desynchronisation:

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
 fs/jffs2/fs.c    | 13 ++++++++++++-
 fs/jffs2/super.c |  2 +-
 2 files changed, 13 insertions(+), 2 deletions(-)

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
index 81396a092ba8..c846b435a38b 100644
--- a/fs/jffs2/super.c
+++ b/fs/jffs2/super.c
@@ -345,7 +345,7 @@ static void jffs2_put_super (struct super_block *sb)
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



