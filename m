Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260FB390600
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789020583; cv=none; b=rMH4Bi6xCh4QIBMH4fBjYejM0t8uJRiUCYcPKuoVRzrNWBXzPdu6ZTuelx69/ViP+zIBCgLKqrOUhuaC+7bdzgSUVaQYiBPW77jw3v4g9bH8vHbfBc4VMvvzHkTr+wfeZEnbWqkLdk7zH+WRlwAmrS2iJ6xlk/SAalXLivz5cbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789020583; c=relaxed/simple;
	bh=eQIbG+yCPegHREkcd/ntTZ+kps6/IdxJww/XUbyiq4o=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Iw/hVU/Q8MhpNXnR8gmuIkA9Wr+TxcjWHrbGlvSNe96I4tR3+k0ajDzVjuyNzvHYB5+vZG5Sz0so97KUTwxQByKNjsMMzS+CVGKTHd9Zh2lnfuoTsqPxFPib6BQn/JCfLIYH3jYv/XjXiDOYUiSGBdLJsvnSkedvRIqIsy52JM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7f8931a803cso5255992a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 23:09:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789020576; x=1789625376;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=t7dQyj3GgTr4FdGaHcJcoAJSzkE2qC117nWJsdVwNmI=;
        b=mCxcnnjF2xyFRTAy6IYNbPh+pfQoRwQp2bz9yAF9eL8ZJ5p/QYfBGG+4jzvZ3NJRYN
         CoWqeGwq8hvoikFT7YSXXJxF/Ule3JBPzaoZX7VMlWIK1TDG/cMKr7ijy+frbaNO8+v/
         A7Hmx8ckI6eRjfIUts1NBjjhXbQMAxGyrsQPqgqSQDbpWc2Q9zLGg7JuA5RzDOJe3bYC
         gzGFLsGPJAMiOhM9vW9q+SEIq2Ust9E/oJ6lBsz9CiM7sRARzK34GAiaOCLp+OVaXcY3
         65GL+gcJf3Xvg1BsPhevhgQPvE09JKGRkqPwZYOjjRegIJ7asEMj/U3vxg/v11ubKkDF
         SxeA==
X-Gm-Message-State: AFuF++kfE/r6vwbzZg2G0aowpD1Yiv/ZsC0QbKMIHdQYmqZP1Ma4Y5qJ
	wEfrqM1q56aKWXkS0sgI0It4StGEJRZ1BEr3wVqnPwlkJzAJOnQXI8t3lkL+k6PwRD/zvByZ9PB
	WkHVZSz6ipZsG5TpTe0JHl9E3VTWibLNNwAox9ogvhzEMbqGDn9TL2dMSuqg=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a4a:e909:0:b0:6b6:87cf:d1dc with SMTP id
 006d021491bc7-6b6fcfd90e3mr23044132eaf.24.1789020576112; Wed, 09 Sep 2026
 23:09:36 -0700 (PDT)
Date: Wed, 09 Sep 2026 23:09:36 -0700
In-Reply-To: <6a6c3d48.5cf34cee.28a846.0008.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa249a0.f2639fcc.29487d.0012.GAE@google.com>
Subject: Forwarded: Re: test patch
From: syzbot <syzbot+fe63e4d633540f230624@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: test patch
Author: syedtayyabfarooq08@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
index cdd1dfc666c4..9da860589861 100644
--- a/drivers/usb/gadget/function/u_serial.c
+++ b/drivers/usb/gadget/function/u_serial.c
@@ -603,6 +603,41 @@ static int gserial_wakeup_host(struct gserial *gser)
 
 /* TTY Driver */
 
+static int gs_install(struct tty_driver *driver, struct tty_struct *tty)
+{
+	struct gs_port *port;
+	struct tty_port *tport;
+	int ret;
+
+	mutex_lock(&ports[tty->index].lock);
+	port = ports[tty->index].port;
+	if (!port) {
+		mutex_unlock(&ports[tty->index].lock);
+		return -ENODEV;
+	}
+
+	tport = tty_port_get(&port->port);
+	mutex_unlock(&ports[tty->index].lock);
+
+	if (!tport)
+		return -ENODEV;
+
+	ret = tty_port_install(tport, driver, tty);
+	if (ret) {
+		tty_port_put(tport);
+		return ret;
+	}
+
+	tty->driver_data = port;
+
+	return 0;
+}
+
+static void gs_cleanup(struct tty_struct *tty)
+{
+	tty_port_put(tty->port);
+}
+
 /*
  * gs_open sets up the link between a gs_port and its associated TTY.
  * That link is broken *only* by TTY close(), and all driver methods
@@ -615,7 +650,7 @@ static int gs_open(struct tty_struct *tty, struct file *file)
 	int		status = 0;
 
 	mutex_lock(&ports[port_num].lock);
-	port = ports[port_num].port;
+	port = tty->driver_data;
 	if (!port) {
 		status = -ENODEV;
 		goto out;
@@ -648,7 +683,6 @@ static int gs_open(struct tty_struct *tty, struct file *file)
 	if (port->port.count++)
 		goto exit_unlock_port;
 
-	tty->driver_data = port;
 	port->port.tty = tty;
 
 	/* if connected, start the I/O stream */
@@ -695,14 +729,16 @@ static void gs_close(struct tty_struct *tty, struct file *file)
 	struct gs_port *port = tty->driver_data;
 	struct gserial	*gser;
 
+	if (!port)
+		return;
+
 	spin_lock_irq(&port->port_lock);
 
 	if (port->port.count != 1) {
 raced_with_open:
-		if (port->port.count == 0)
-			WARN_ON(1);
-		else
+		if (port->port.count > 0)
 			--port->port.count;
+
 		goto exit;
 	}
 
@@ -911,6 +947,8 @@ static int gs_get_icount(struct tty_struct *tty,
 static const struct tty_operations gs_tty_ops = {
 	.open =			gs_open,
 	.close =		gs_close,
+	.install =		gs_install,
+	.cleanup =		gs_cleanup,
 	.write =		gs_write,
 	.put_char =		gs_put_char,
 	.flush_chars =		gs_flush_chars,
@@ -1203,6 +1241,18 @@ static void gs_console_exit(struct gs_port *port)
 
 #endif
 
+static void gs_port_destruct(struct tty_port *tport)
+{
+	struct gs_port *port = container_of(tport, struct gs_port, port);
+
+	kfree(port);
+}
+
+static const struct tty_port_operations gs_port_ops = {
+	.destruct = gs_port_destruct,
+};
+
+
 static int
 gs_port_alloc(unsigned port_num, struct usb_cdc_line_coding *coding)
 {
@@ -1222,6 +1272,7 @@ gs_port_alloc(unsigned port_num, struct usb_cdc_line_coding *coding)
 	}
 
 	tty_port_init(&port->port);
+	port->port.ops = &gs_port_ops;
 	spin_lock_init(&port->port_lock);
 	init_waitqueue_head(&port->drain_wait);
 	init_waitqueue_head(&port->close_wait);
@@ -1258,8 +1309,7 @@ static void gserial_free_port(struct gs_port *port)
 	/* wait for old opens to finish */
 	wait_event(port->close_wait, gs_closed(port));
 	WARN_ON(port->port_usb != NULL);
-	tty_port_destroy(&port->port);
-	kfree(port);
+	tty_port_put(&port->port);
 }
 
 void gserial_free_line(unsigned char port_num)
