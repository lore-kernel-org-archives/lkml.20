Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686BC4C14E9
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790350576; cv=none; b=ZCo6LYNTK+XfkQ/Yjp4xD5uOePPPjG0F16LEDxPBCs0MSbDVF2koMUIiXkce32mK1cM16SsjIStkLmtnbcDxpGd/8pkYJEnRCcOdbeQM22A71aJ3TYCWV3qgd7tPZ12ejxujEskEBYgup4znSoWAgjGu+DIKbdJrq2qDh0L8AJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790350576; c=relaxed/simple;
	bh=5EW3PWjoiPMUsf4N19qO08/p9Gt3Dn77fDyo7nz/NzE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=pfhdnRwiXwN6NXj6W3O2s5/rpB6riPUOoC33KW9JTMx4YZPYnjIpsYh2xEOe5hjBdynS2iFLUDvMoelMIU1mT+teyZB76Z5yr0dusFzaDramiYpWyLPN/PCu8PguLwOoTE+EJff++Jl8HJPcPwigLmMn0DRwerXvUGl7mZao514=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4cbf700ddccso1176344b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:36:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790350574; x=1790955374;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=s5zyqHkjsfJElUgXLCkz/RTYL8utQUvXR8T4fV0Dhq4=;
        b=Q9X99PwQNbo5eZUUgbFffxm7mArPjpFBP2xRgCel5c2hXfJaV2JyhmFjSQurTMFKVm
         VXf4bAepsWJ1ifoYmrDbiaX8PL+q+tWJVSpmj/eFAeecx9miBf+kBudiA639oMkN0Exi
         ZLCYBUdaQYEpk6qXcwKK2Kzv0H0koOYhWbmdEnzmqDgk05TXVzULE+TTam/TV8oP9ugJ
         sB6Ds+eeRDN/HqHqcUsh9dl/q9efv6RbSK1LSMA5UMHh/P1y2TlhdxDKmiInz/7yx+Fd
         qVkgBdzUcKZvK22aixqi0Am9PYh/L0k4QbUIxmH69bQOMQIO8YFBld7h6DrPpdDTX5K0
         F5YQ==
X-Gm-Message-State: AFuF++ny049fXy9K/u7qDqNWxzyELaC8ER5Vgg9uRQSgm0PWn98plqrX
	ocsW9hzh3DBacKvcrmD9yJ+g043dlJa/nrUpLP3z3UQPNJV+2Z9v+KiXg/zEY5p1y8BMSU9hECH
	HWQXxOcr3l5cPvxOabw+YphU1j85PwenxhdHYS6LJ4RwcokesY5cXs5EvFvM=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:17a2:b0:4d6:9283:1bde with SMTP id
 5614622812f47-4dc6812d185mr3055701b6e.59.1790350574396; Fri, 25 Sep 2026
 08:36:14 -0700 (PDT)
Date: Fri, 25 Sep 2026 08:36:14 -0700
In-Reply-To: <68a82586.a00a0220.33401d.0251.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab694ee.e548f532.1ca396.0024.GAE@google.com>
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

Replace the -ERESTARTSYS return value in nilfs_segctor_sync(), the
primary cause among several issues, with -EINTR to see if the problem
can be reproduced.

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
index 829573cb6131..5705e6e1fb2d 100644
--- a/fs/nilfs2/segment.c
+++ b/fs/nilfs2/segment.c
@@ -2275,7 +2275,7 @@ static int nilfs_segctor_sync(struct nilfs_sc_info *sci)
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

