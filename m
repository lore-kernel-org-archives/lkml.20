Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B1A3CC303
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 20:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790368773; cv=none; b=pO9NPdkNl1m+7X1nvy/LTPL6PNVt+3m7cPHoxv31AuOuBnAeLpySBWL2cebihjmlopF5geCSyGE8GKWzwTCSjmftl3BKI5ALDG1gucIwPGejMBq5GqPwBKkOArMCgci9xqTdjaPfdyoF3iv9MvO8PJCdeDIJ3ww0DMN4hJuwkiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790368773; c=relaxed/simple;
	bh=hHzClB9egIuUtKSv+G5bspJGzcMa7/8epSCsEh6RcWk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=ECoZCzjJo1rtOKSSKw1gCWH+DDRn7tZRtl7V7C8YJdzBDO4dQ5deSYt8OEgjqPVe1OF+RehIYYDqgiPpKZbF4dCs0Jva68E+EaddcrHN3T4+PqGZn4794aLEyTa3MMK9pt2hT2zAHjQ+7aTv3lsmErJiP+lJrqsdJt0iS6eBUuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4cc89e86e9eso2116679b6e.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 13:39:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790368771; x=1790973571;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Usj003VB4VsO/04RhopdWdBGry1zM3/5cBIoy5BY3DY=;
        b=J+i1nE6pWNt9rkosCcTBJ9XiUHsryGxb5pzX9brWWbxEgr1NXq1K8ZJJJ3zf4CWT2J
         BIxS80sFDNr72wMzAwZ/ep5r+7YJRuYtKFPDejeyYnpmSLiJh8WfMo54DyFr3NPH76Or
         lKLtn9V+3KfKkIAYi8QqpSxP8FFE7XNQYXmCIt4tYPGStMZ0uTB9xhlab44h8lY97c30
         ZaLit6ZxX1gwHNOD77BG9Aj531eprO6pSlFredCEPXpFou2ijVzF3hg+2vOS8SQ4ADin
         ZUXE0WzFv7loH3tC2YSCcV6rWcHcSHOF0SlcY3Zwf3PvKv5ecp5H/m7fC61TANsJ/QQ2
         npGw==
X-Gm-Message-State: AFuF++nL7/EsDwLZDmxTk94360Qz2Z3i7AUHZJ/rAd68cAugpCYgTgzk
	U3tEn6DTAY0InXqgE+O0zEUKtNI+IOtSJRE3bq2OMnMgX6heWVw8hoQ0jWmi+9oyQEKcjY/OHec
	AsGxndQS1/K2qHkXyFfOKY8vUsjp8LNX9ozEd9WBg8P82UjDvryooAMdDum0=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3097:b0:4c3:1005:beaf with SMTP id
 5614622812f47-4d72cb354f5mr7777840b6e.15.1790368770825; Fri, 25 Sep 2026
 13:39:30 -0700 (PDT)
Date: Fri, 25 Sep 2026 13:39:30 -0700
In-Reply-To: <68a82586.a00a0220.33401d.0251.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab6dc02.e548f532.1ca396.0028.GAE@google.com>
Subject: Forwarded: Re: [syzbot] [nilfs?] WARNING in nilfs_rename (2)
From: syzbot <syzbot+f6c7e1f1809f235eeb90@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: Re: [syzbot] [nilfs?] WARNING in nilfs_rename (2)
Author: konishi.ryusuke@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 89a312991dc6

Next, check whether the inconsistency recurs when tolerance for
interruptions is tightened as well.

diff --git a/fs/nilfs2/ioctl.c b/fs/nilfs2/ioctl.c
index 01a04080ef70..b2b67d6a1f09 100644
--- a/fs/nilfs2/ioctl.c
+++ b/fs/nilfs2/ioctl.c
@@ -965,10 +965,10 @@ static int nilfs_ioctl_clean_segments(struct inode *inode, struct file *filp,
  * Return: 0 on success, or one of the following negative error codes on
  * failure:
  * * %-EFAULT		- Failure during execution of requested operation.
+ * * %-EINTR		- Interrupted.
  * * %-EIO		- I/O error.
  * * %-ENOMEM		- Insufficient memory available.
  * * %-ENOSPC		- No space left on device (only in a panic state).
- * * %-ERESTARTSYS	- Interrupted.
  * * %-EROFS		- Read only filesystem.
  */
 static int nilfs_ioctl_sync(struct inode *inode, struct file *filp,
diff --git a/fs/nilfs2/recovery.c b/fs/nilfs2/recovery.c
index 45fb37215669..a7086a93480b 100644
--- a/fs/nilfs2/recovery.c
+++ b/fs/nilfs2/recovery.c
@@ -785,11 +785,11 @@ static void nilfs_abort_roll_forward(struct the_nilfs *nilfs)
  *
  * Return: 0 on success, or one of the following negative error codes on
  * failure:
+ * * %-EINTR		- Interrupted.
  * * %-EINVAL		- Inconsistent filesystem state.
  * * %-EIO		- I/O error.
  * * %-ENOMEM		- Insufficient memory available.
  * * %-ENOSPC		- No space left on device (only in a panic state).
- * * %-ERESTARTSYS	- Interrupted.
  */
 int nilfs_salvage_orphan_logs(struct the_nilfs *nilfs,
 			      struct super_block *sb,
diff --git a/fs/nilfs2/segment.c b/fs/nilfs2/segment.c
index 829573cb6131..a79b1810b405 100644
--- a/fs/nilfs2/segment.c
+++ b/fs/nilfs2/segment.c
@@ -2257,7 +2257,7 @@ static int nilfs_segctor_sync(struct nilfs_sc_info *sci)
 	wake_up(&sci->sc_wait_daemon);
 
 	for (;;) {
-		set_current_state(TASK_INTERRUPTIBLE);
+		set_current_state(TASK_KILLABLE);
 
 		/*
 		 * Synchronize only while the log writer thread is alive.
@@ -2271,11 +2271,11 @@ static int nilfs_segctor_sync(struct nilfs_sc_info *sci)
 			err = wait_req.err;
 			break;
 		}
-		if (!signal_pending(current)) {
+		if (!fatal_signal_pending(current)) {
 			schedule();
 			continue;
 		}
-		err = -ERESTARTSYS;
+		err = -EINTR;
 		break;
 	}
 	finish_wait(&sci->sc_wait_request, &wait_req.wq);
@@ -2309,10 +2309,10 @@ static void nilfs_segctor_wakeup(struct nilfs_sc_info *sci, int err, bool force)
  *
  * Return: 0 on success, or one of the following negative error codes on
  * failure:
+ * * %-EINTR		- Interrupted.
  * * %-EIO		- I/O error (including metadata corruption).
  * * %-ENOMEM		- Insufficient memory available.
  * * %-ENOSPC		- No space left on device (only in a panic state).
- * * %-ERESTARTSYS	- Interrupted.
  * * %-EROFS		- Read only filesystem.
  */
 int nilfs_construct_segment(struct super_block *sb)
@@ -2339,10 +2339,10 @@ int nilfs_construct_segment(struct super_block *sb)
  *
  * Return: 0 on success, or one of the following negative error codes on
  * failure:
+ * * %-EINTR		- Interrupted.
  * * %-EIO		- I/O error (including metadata corruption).
  * * %-ENOMEM		- Insufficient memory available.
  * * %-ENOSPC		- No space left on device (only in a panic state).
- * * %-ERESTARTSYS	- Interrupted.
  * * %-EROFS		- Read only filesystem.
  */
 int nilfs_construct_dsync_segment(struct super_block *sb, struct inode *inode,
-- 
2.53.0

