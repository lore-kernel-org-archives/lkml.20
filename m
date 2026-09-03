Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206CD371D1F
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 03:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788406940; cv=none; b=K0J+tnQqtE7FB7ZTDptuNZZVCTN1havZtdee9RYV34s4kbuggzcEJxIvqhWOhvBpLHmY+4nVt5YkJKdM6/Cd7ivge8wJUYc5eTomgzfwAyIj7PeVInsDDYk4qbm/KpQy+WIAI36awcX+6ekf5U4P+vYV4QTfcpPhIfiu0llYj/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788406940; c=relaxed/simple;
	bh=HZFdnmhKvbO/EyXTARvHYzSbfam9fEPc7knGy9+PFBA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=u3eIoMfWH/aysqZtwfyi8rT/AEPDy0M7oZneCySVfpFUJlhBKrGlfVE2WfaEzGIojwg8WZHrfzB8Q5zQ87OAmZH4G/PLTVa5UCiKdEsdHPLBj5E97ByyLzB5T6/+i6T1jjJafkGAQU3JZ6P3lZH6RTbvZhIPrtbDsScVJm4begU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6b1afdfb685so1069301eaf.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 20:42:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788406938; x=1789011738;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nRbeEjjjyN5LArQb4BBrbdWMAbBc1RjgLdC03rpHMLc=;
        b=g1yuhlhX+lNcwIWdnx4Pp17NI6iJSz+VFn1ksdeDFIBLcm/odHuWVHR3xvNFI95GFG
         hCYt3Xsg+Bt1Lz3IezKwe7vNmDSARIZNffiwnHHCaYpBjZCL2sd/MN5CrtBUJ82EiTgv
         uyR2Daaf2s1R+da+GVLsWj/Xt7HPqw6GMNgIuu5TVqweJJT4Dtp72pYgDb1zNIuzToKu
         dODgePL50qb6EPv56Fq3sJ1CIrPt/A3Hj/s7IV1G/E296adtLYuWAr+N7Wm+VOXXx4F3
         /1O02U9KD1DVJUsKKh3uvNO/12QEE0VcQuX+XR7me6uN2RJO5QPq/jatRR5HtKWjgtUt
         05JQ==
X-Gm-Message-State: AFuF++mipjcoXe4SD1hAp55Vc2ZL+pQ3lWBpc5BTAJYLZeniQ72MFcwG
	9HMGIifUbBO7uy+fESYIZeKYO25awuxlAXGD7sXqw8jcvPxx9Rxo5NZj413m/9WUk1FcF6fvG18
	n+9UEt9cw4fezl1cNMoTS/bQ2NFGQZtDN++etJ1kHWcY/l3KO8eOzPRxBJzY=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4b07:b0:69d:a4f0:4191 with SMTP id
 006d021491bc7-6b47d9c3984mr8634508eaf.12.1788406938058; Wed, 02 Sep 2026
 20:42:18 -0700 (PDT)
Date: Wed, 02 Sep 2026 20:42:18 -0700
In-Reply-To: <6a9087a4.4d659fcc.734b4.0013.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a98ec9a.e7659fcc.146146.0001.GAE@google.com>
Subject: Forwarded: [PATCH] tty: protect break handling against disconnect
From: syzbot <syzbot+473d7477c523b41d4046@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: [PATCH] tty: protect break handling against disconnect
Author: adrianox@gmail.com

#syz test
Both a timed break (TCSBRK/TCSBRKP) and the unconditional TIOCSBRK/
TIOCCBRK break_ctl() calls can race against hangup and be issued for a
tty whose driver data is gone, causing a use-after-free or NULL-pointer
dereference in the driver.

Check the tty hung-up state before every break_ctl() call in the tty
core, and return -ENODEV in serial_break() once the device is no longer
attached, like serial_write() already does.
---
 drivers/tty/tty_io.c            | 19 +++++++++++++++----
 drivers/usb/serial/usb-serial.c |  3 +++
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/tty_io.c b/drivers/tty/tty_io.c
index 48569035da56..272f2839acdb 100644
--- a/drivers/tty/tty_io.c
+++ b/drivers/tty/tty_io.c
@@ -2429,6 +2429,7 @@ static int tiocgetd(struct tty_struct *tty, int __user *p)
 
 /**
  * send_break - performed time break
+ * @file: file object
  * @tty: device to break on
  * @duration: timeout in mS
  *
@@ -2438,13 +2439,16 @@ static int tiocgetd(struct tty_struct *tty, int __user *p)
  * Locking:
  *	@tty->atomic_write_lock serializes
  */
-static int send_break(struct tty_struct *tty, unsigned int duration)
+static int send_break(struct file *file, struct tty_struct *tty, unsigned int duration)
 {
 	int retval;
 
 	if (tty->ops->break_ctl == NULL)
 		return 0;
 
+	if (tty_hung_up_p(file))
+		return -EIO;
+
 	if (tty->driver->flags & TTY_DRIVER_HARDWARE_BREAK)
 		return tty->ops->break_ctl(tty, duration);
 
@@ -2455,7 +2459,10 @@ static int send_break(struct tty_struct *tty, unsigned int duration)
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
@@ -2714,10 +2721,14 @@ long tty_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	 * Break handling
 	 */
 	case TIOCSBRK:	/* Turn break on, unconditionally */
+		if (tty_hung_up_p(file))
+			return -EIO;
 		if (tty->ops->break_ctl)
 			return tty->ops->break_ctl(tty, -1);
 		return 0;
 	case TIOCCBRK:	/* Turn break off, unconditionally */
+		if (tty_hung_up_p(file))
+			return -EIO;
 		if (tty->ops->break_ctl)
 			return tty->ops->break_ctl(tty, 0);
 		return 0;
@@ -2727,10 +2738,10 @@ long tty_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
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
diff --git a/drivers/usb/serial/usb-serial.c b/drivers/usb/serial/usb-serial.c
index 17edc057a311..5f42bfe39212 100644
--- a/drivers/usb/serial/usb-serial.c
+++ b/drivers/usb/serial/usb-serial.c
@@ -532,6 +532,9 @@ static int serial_break(struct tty_struct *tty, int break_state)
 {
 	struct usb_serial_port *port = tty->driver_data;
 
+	if (port->serial->dev->state == USB_STATE_NOTATTACHED)
+		return -ENODEV;
+
 	dev_dbg(&port->dev, "%s\n", __func__);
 
 	if (port->serial->type->break_ctl)
-- 
2.51.0

