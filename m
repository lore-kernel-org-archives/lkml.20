Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0733451C1
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 02:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788402322; cv=none; b=oMzzd/Vo2dhxklHGX2foanMCmc/9xoKoz8lzxCj/fRPEn8r9HTAniIrroAtB2TDIugjA8wr0YoN44DxF0DlPgzpo4/ll2zXCbrMjUmU8AxXtqJz7a1lmYPajz8Aw1MMctaewvX7899YJl3bFAyZf6BrISY3ajBYvVFSozOQeKf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788402322; c=relaxed/simple;
	bh=BytuWfAl+7wcpM6rY1UTPwkx6Ar6Xj40FvcT4aooQao=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=JhYFXeV/X0UTmKfRn7CV7wtF0Iy+ooKkO7yhCa9gEAx7oWTN5Ubd16U7+ORlWt4rfey40dWNWn5kuzpteFCH/CvEZvEeexPria7WJsMiIP58JLr8cB08bsKfSFpAOaIgrLe0QaLOHNDwcIIZCE8dh3S6d3J5BEPfvJA9QXAEalU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6a17dafd042so1996896eaf.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 19:25:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788402315; x=1789007115;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CnzjD4dGuxwUsB7Nnq/HmULU8ctQoPhHTEQXn/VKA48=;
        b=oML4VkV9VscLeOeaUqjnyBOwLBzc+oHReQdQYl7ftXNMvLrRmKsul2L9yv1Ritqm6e
         HrDU0Kf0l8w8LBlJaq+N0MwiQl+iGHsPjImzVb4XuagLk89ywGxPI75noNc2UzCyKeE5
         AvGsTCgn7PpjCq6X0pljUsWWITbMioUFKgD32c1PPWtn4PZlDfK4czDzo7qU2m/JVaHe
         CB0izw2lpL6D9PtW1IxSE16I2ldKK4oVDwpOaHC5csj2RVq5ijmkaSNu0XgBY8rNo2kK
         Pb0HrtzWLOYFuukzVNQStFocW10iFAOBIRlGdoU9ZrlxMmZBj3UY+EYMe22kVZU87HyU
         /VBQ==
X-Gm-Message-State: AFuF++lH1dyas1SZWNHszdsW0eE+qg00EThB/JOUute+fk5ZXpkt+0OY
	lpQr6c1Tjo4NIKi8QHuiwd644RVWS93TCu7k8PVKz445xCSyna42U9g5S//zCULSQUg38eCzSPY
	qqP6Gn1dUjoTGeme6XPHW3aAqD3hBBXp01uXDzRWa4ADNmqTj+XGrPzfI31g=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1890:b0:6b3:5ecb:9d03 with SMTP id
 006d021491bc7-6b4814301ddmr7113965eaf.23.1788402315107; Wed, 02 Sep 2026
 19:25:15 -0700 (PDT)
Date: Wed, 02 Sep 2026 19:25:15 -0700
In-Reply-To: <6a9087a4.4d659fcc.734b4.0013.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a98da8b.9266084e.bf0d7.0014.GAE@google.com>
Subject: Forwarded: [PATCH] tty: fix break race
From: syzbot <syzbot+473d7477c523b41d4046@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH] tty: fix break race
Author: adrianox@gmail.com

A timed break (TCSBRK and TCSBRKP) can race against hangup and end up
calling into a tty driver after the underlying device has been removed,
for example when a USB serial device is disconnected while a break is in
progress. This can result in a use-after-free or NULL-pointer dereference
in the driver when the second break_ctl() call is made after the sleep,
as reported for the keyspan USB serial driver.

Make send_break() wait only for the break duration and then check the
hung-up state of the tty before invoking the driver a second time. Since
the tty is marked hung up (f_op == &hung_up_tty_fops) before the device is
torn down, the second break_ctl() is no longer issued after a hangup and
the driver is not called for a device that is gone.

Suggested-by: Johan Hovold <johan@kernel.org>
Reported-by: syzbot+473d7477c523b41d4046@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=473d7477c523b41d4046
Assisted-by: opencode:deepseek-v4-flash
Cc: stable@vger.kernel.org
Signed-off-by: Adriano Cordova <adrianox@gmail.com>
#syz test
---
 drivers/tty/tty_io.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/tty_io.c b/drivers/tty/tty_io.c
index 48569035da56..c9d8a138b84c 100644
--- a/drivers/tty/tty_io.c
+++ b/drivers/tty/tty_io.c
@@ -2429,6 +2429,7 @@ static int tiocgetd(struct tty_struct *tty, int __user *p)
 
 /**
  * send_break - performed time break
+ * @file: file object
  * @tty: device to break on
  * @duration: timeout in mS
  *
@@ -2438,7 +2439,7 @@ static int tiocgetd(struct tty_struct *tty, int __user *p)
  * Locking:
  *	@tty->atomic_write_lock serializes
  */
-static int send_break(struct tty_struct *tty, unsigned int duration)
+static int send_break(struct file *file, struct tty_struct *tty, unsigned int duration)
 {
 	int retval;
 
@@ -2455,7 +2456,10 @@ static int send_break(struct tty_struct *tty, unsigned int duration)
 	retval = tty->ops->break_ctl(tty, -1);
 	if (!retval) {
 		msleep_interruptible(duration);
-		retval = tty->ops->break_ctl(tty, 0);
+		if (tty_hung_up_p(file))
+			retval = -EIO;
+		else
+			retval = tty->ops->break_ctl(tty, 0);
 	} else if (retval == -EOPNOTSUPP) {
 		/* some drivers can tell only dynamically */
 		retval = 0;
@@ -2727,10 +2731,10 @@ long tty_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		 * This is used by the tcdrain() termios function.
 		 */
 		if (!arg)
-			return send_break(tty, 250);
+			return send_break(file, tty, 250);
 		return 0;
 	case TCSBRKP:	/* support for POSIX tcsendbreak() */
-		return send_break(tty, arg ? arg*100 : 250);
+		return send_break(file, tty, arg ? arg * 100 : 250);
 
 	case TIOCMGET:
 		return tty_tiocmget(tty, p);
-- 
2.51.0

