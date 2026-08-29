Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D5F4A32
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 12:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788006852; cv=none; b=VWeXTglXLRU1W+BDTSud4eWZEHMWwx8mjwF+8/FfJh7bLPjYdCjp2otgcneKD8KWYbBJyAOLpcHn1AU93wP6H5Ev+vLlYjHyc7DajSITWFod+IBBU9v6o1+SDtWy0JP6qNxcdZrl8f1TMDUO3wHkM9udz5CFXDl7PRWM5h9jHug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788006852; c=relaxed/simple;
	bh=914JHf+J8JtouNbv/3RHnY0j3Ojxm47IDqDO4lQ8OUM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=NqnVQwC2fZSE/GPj0Gm9fJA3lX5qRMXRL/hbtB7YvTD/9b9ZdfRuoc2f9NP/Y4exZVZi6bsBan+bMxRHZS4VGsDF/CuB09xW8wvPAYKeGsyN67/rufaCgiXx07zo8q9GjHtqS95iqR4eM320O6mIgBz1jveWYMcutlXJgta1v9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4b2fb8f0df0so2918675b6e.0
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 05:34:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788006849; x=1788611649;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ezsFS9Z7b7espk3g+s5r2wBdLBJMAquPTyuH2SP+hMY=;
        b=Z8gmCQpa44EV7hSKmim/dns0jUTioUgkTFGrtgOK1+20UZCRjvmzQqQidLTOyzfbmG
         drkmhVCve5oTD3oSrA3R3IMykNleVdGcWQcSjx3r53XPUH1gY3eUQErKJ4cQ0iGZ62MQ
         wOTdfBngc8OTR+2weKXw6hVv7lY33avpG8RXuSyLwwT1krVqleI2ED3aMYBC2AI91Cw+
         YmgQ/X0nK5Bi8zT1/2c17IpghjqFJmOcfnYt/q0Y8JE6H/voqRJ4wdDRAZI4Bg3b9WM6
         Ezzo00W92xQXTyKjr2Pi8m/gCAPcsdvGxGKUtCHAEHFL7o5ZhR+obVbvIQt3zQCDG+bL
         134w==
X-Gm-Message-State: AFuF++ltXagHZD7LOKLZvbV4siwe9bvIlGvNFuw+bJzwPeL8W4F23usu
	OReJuRGlxmHsRgHDpxpRkLjRaAN3ukCGwMSjdIsWxCleGWp2MsVHFJd/siwx4vAhjJeyba8PCnF
	nm4JAG6LM2ww9dp/bDlcwciWvVlSuM60QdsSr7/+qAAMZofFMTjPhoPRFhxk=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:190f:b0:4b3:74d0:6ef7 with SMTP id
 5614622812f47-4b398037cdamr13097292b6e.4.1788006849365; Sat, 29 Aug 2026
 05:34:09 -0700 (PDT)
Date: Sat, 29 Aug 2026 05:34:09 -0700
In-Reply-To: <6a7a82f8.01d0871a.3a0d52.00b9.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a92d1c1.1d9ded08.62e62.0108.GAE@google.com>
Subject: Forwarded: [PATCH] usb: gadget: u_serial: fix use-after-free of
 gs_port on concurrent open
From: syzbot <syzbot+bca09f5d8b843bbf7571@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH] usb: gadget: u_serial: fix use-after-free of gs_port on concurrent open
Author: lingrain580@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

gserial_free_line() frees the gs_port while the tty layer may still be
about to use the tty_port embedded in it.  gs_tty_driver->ports[] keeps
pointing at the freed memory, because tty_unregister_device() only clears
cdevs[] and never touches ports[].

A concurrent open() then picks up that stale pointer in tty_init_dev():

	if (!tty->port)
		tty->port = driver->ports[idx];
	...
	tty->port->itty = tty;

gs_open() does check ports[port_num].port and returns -ENODEV, but that
check runs after tty->port has already been assigned, so even the failed
open dereferences freed memory on its release path:

  BUG: KASAN: slab-use-after-free in release_tty+0x589/0x5d0
  Write of size 8 at addr ffff88804b450120 by task repro/4930

  Allocated by task 4929:
   gs_port_alloc
   gserial_alloc_line_no_console
   acm_alloc_instance
   configfs_mkdir

  Freed by task 4929:
   gserial_free_port
   gserial_free_line
   acm_free_instance
   config_item_cleanup

The existing wait_event(port->close_wait, gs_closed(port)) does not help
here: a failed open never increments port.count, so gs_closed() reports
the port as closed and the wait returns immediately.

Give gs_port proper reference counting, the way cdc-acm.c already does on
the host side.  Add a tty_port_operations::destruct callback that performs
the kfree(), acquire a reference in a new ->install callback while holding
ports[].lock, and release it in ->cleanup.  gserial_free_port() now calls
tty_port_put() instead of freeing directly, so the memory is released only
once the last user is gone.

Reproduced with the syzbot C reproducer on v7.2-rc6 with KASAN and
PREEMPT_RT enabled; the report is gone after this change and the
WARN_ON(port->itty) in tty_port_destructor() does not trigger, confirming
the references are balanced.

Reported-by: syzbot+bca09f5d8b843bbf7571@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=bca09f5d8b843bbf7571
Cc: stable@vger.kernel.org
Signed-off-by: Tianqi Dong <lingrain580@gmail.com>
---
 drivers/usb/gadget/function/u_serial.c | 48 ++++++++++++++++++++++++--
 1 file changed, 46 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
index cdd1dfc66..6eabccf9b 100644
--- a/drivers/usb/gadget/function/u_serial.c
+++ b/drivers/usb/gadget/function/u_serial.c
@@ -908,7 +908,51 @@ static int gs_get_icount(struct tty_struct *tty,
 	return 0;
 }
 
+static void gs_port_destruct(struct tty_port *port)
+{
+	struct gs_port	*gs = container_of(port, struct gs_port, port);
+
+	kfree(gs);
+}
+
+static const struct tty_port_operations gs_port_ops = {
+	.destruct =		gs_port_destruct,
+};
+
+/*
+ * Take a reference to the port before the tty core stores it in tty->port.
+ * Otherwise gserial_free_line() may free the port while a concurrent open()
+ * is about to dereference the stale pointer left in gs_tty_driver->ports[].
+ */
+static int gs_install(struct tty_driver *driver, struct tty_struct *tty)
+{
+	struct gs_port	*port;
+	int		status;
+
+	mutex_lock(&ports[tty->index].lock);
+	port = ports[tty->index].port;
+	if (!port) {
+		mutex_unlock(&ports[tty->index].lock);
+		return -ENODEV;
+	}
+	tty_port_get(&port->port);
+	mutex_unlock(&ports[tty->index].lock);
+
+	status = tty_port_install(&port->port, driver, tty);
+	if (status)
+		tty_port_put(&port->port);
+
+	return status;
+}
+
+static void gs_cleanup(struct tty_struct *tty)
+{
+	tty_port_put(tty->port);
+}
+
 static const struct tty_operations gs_tty_ops = {
+	.install =		gs_install,
+	.cleanup =		gs_cleanup,
 	.open =			gs_open,
 	.close =		gs_close,
 	.write =		gs_write,
@@ -1222,6 +1266,7 @@ gs_port_alloc(unsigned port_num, struct usb_cdc_line_coding *coding)
 	}
 
 	tty_port_init(&port->port);
+	port->port.ops = &gs_port_ops;
 	spin_lock_init(&port->port_lock);
 	init_waitqueue_head(&port->drain_wait);
 	init_waitqueue_head(&port->close_wait);
@@ -1258,8 +1303,7 @@ static void gserial_free_port(struct gs_port *port)
 	/* wait for old opens to finish */
 	wait_event(port->close_wait, gs_closed(port));
 	WARN_ON(port->port_usb != NULL);
-	tty_port_destroy(&port->port);
-	kfree(port);
+	tty_port_put(&port->port);
 }
 
 void gserial_free_line(unsigned char port_num)
-- 
2.43.0

