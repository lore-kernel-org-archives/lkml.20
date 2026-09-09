Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC8A28640B
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 07:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788939852; cv=none; b=rcNtL9t0yeOv1KLp7ZB4zQ3zTVKqnEHXB7rmFdZ1JNMwXxFCIvRbbMrVh+Rw2NxJX/6juM6JcG35ASrRb0vPC7HY6yh54vtD+J5tDZwSi4SOVYapYurHkIG1wJeK0ufhqn2rvjqw79R+F1lPOIKx6GIReD7K2SfLcqHQBcDzllA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788939852; c=relaxed/simple;
	bh=G1HDO2UU2iXko1BHCCO9FvpyAeq3VsHOSeMkgnFf+dU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=SupxVpOyFSJxIFtKvQfYT/hG3t9Brbu2DQn3dG1XF1vBUqxy2AOyBw01XMimtzWGYw2oGTkkpQiq5oIzjAHGvdOy7gf6tKb6hQU6NZDjjEiufKreuT/xxljA70gWx76Inen9L4Yzr/cfM0vLpsB1/mQq0lKpNEsSp8Ch+QjERxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6b1b6df25efso5852586eaf.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 00:44:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788939850; x=1789544650;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5SZz6yS+9ghwNm+378dRmudSnYoMOcliJmAbkqo+x3U=;
        b=llYo2R5IpCEfW+90SmPrk6GRtkfbmDFH8A463+clCX3staB9HIrA4Vf/0tJ7+yNo6d
         CtUHcgs4TSOj4yd0tzCsugb7RCfv6XMGwpnXGXapkb+FZfPrlh8t5KDFMQjBGopMSncc
         ba+9hHgKiLCD+MCQkpBiubORxe/ni/LF5gwq9FBbdF/sGcwcUxTeTch/YRVdrEKlC/4U
         e7+PrJoC+WJ2qP0YxRdAJ9sAEj9FzAthVbYL/p1x+rf48My2iTj5R3/zoABOrUm96hVB
         09ulbBdYIUtngZcHkts1kXepur+xLmQbBCg9ajFeIw1DUQrVzylLs2jBQTy3uXP2qvdY
         DHtg==
X-Gm-Message-State: AFuF++mK1ZnyNel1VW+lFy3SGwOi6QUIQa7P0FvbkNuICmAexLPWAEVv
	vWF7fxEf+kj0Tk8hNU1r9oXlytP2KHrHRJVIFBaVPai0I229b+NtNS/H7ZGpJRwfg3O9BiI1qM0
	SNf8SHoBoLkT9cW45HY0eO001ZC8cGQtJfJfOc34rKude8pT4FRFQqI3foso=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:16ac:b0:6be:2c0f:e41a with SMTP id
 006d021491bc7-6be2c1f70a8mr1281755eaf.23.1788939849837; Wed, 09 Sep 2026
 00:44:09 -0700 (PDT)
Date: Wed, 09 Sep 2026 00:44:09 -0700
In-Reply-To: <6a6c3d48.5cf34cee.28a846.0008.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa10e49.f81106d8.285f0a.000e.GAE@google.com>
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
index cdd1dfc666c4..4020807a4d2c 100644
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
@@ -695,6 +730,9 @@ static void gs_close(struct tty_struct *tty, struct file *file)
 	struct gs_port *port = tty->driver_data;
 	struct gserial	*gser;
 
+	if (!port)
+		return;
+
 	spin_lock_irq(&port->port_lock);
 
 	if (port->port.count != 1) {
@@ -911,6 +949,8 @@ static int gs_get_icount(struct tty_struct *tty,
 static const struct tty_operations gs_tty_ops = {
 	.open =			gs_open,
 	.close =		gs_close,
+	.install =		gs_install,
+	.cleanup =		gs_cleanup,
 	.write =		gs_write,
 	.put_char =		gs_put_char,
 	.flush_chars =		gs_flush_chars,
@@ -1203,6 +1243,18 @@ static void gs_console_exit(struct gs_port *port)
 
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
@@ -1222,6 +1274,7 @@ gs_port_alloc(unsigned port_num, struct usb_cdc_line_coding *coding)
 	}
 
 	tty_port_init(&port->port);
+	port->port.ops = &gs_port_ops;
 	spin_lock_init(&port->port_lock);
 	init_waitqueue_head(&port->drain_wait);
 	init_waitqueue_head(&port->close_wait);
@@ -1258,8 +1311,7 @@ static void gserial_free_port(struct gs_port *port)
 	/* wait for old opens to finish */
 	wait_event(port->close_wait, gs_closed(port));
 	WARN_ON(port->port_usb != NULL);
-	tty_port_destroy(&port->port);
-	kfree(port);
+	tty_port_put(&port->port);
 }
 
 void gserial_free_line(unsigned char port_num)
