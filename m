Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7F8545D82
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 11:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788953759; cv=none; b=skyqisVT9JXgO+5JF85Z34BL0gFiTLyyP2utIBTeWKJ0n6Hd6IyNAmBPVBkEEwxs7xUYbFHXz8Pnm56hT/KVBpr0DERnWKKQAkJFH91FJIR859tacotq5rbVZ6y9qiSVmKGYfVTKJdWeV6Y/Ub6a2cYxWJtg/D0vhv1PZL3VGy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788953759; c=relaxed/simple;
	bh=oCU01YivwJbUBircYjcviMhc40cFOJbBqfZg5wLJQBs=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=fAeGO5C0JglcOKh5L7ybSSnfeLF9HPYZPCg8Gdvmdd6urQ5OJMgsk4/POArZdZE8jyosiGHMECLMx2usdy/kNyrz8uBxJUk0dJU+vaSZX6jgTy0qJ+IIzeAMjrhFq7N2F20qvJVveEFvHQ8yqsmScRWAIODIKa4nQsy4WzMlgBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-46a4168b520so4715793fac.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 04:35:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788953757; x=1789558557;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=suDSVGULQ7RRXfUM2r8E2WQFKHP8imG06SfshgKkzaU=;
        b=AoumU/edpk/D000HR3wgE7ep+KByzBrSaENB9li44/8uI8prTDAY7KFOKktKzGWlqW
         J+r5n18tL3XWyDwC5pK4SSQbkoHpnS6IuXMs67+0lZ1Ee4QHKigWJnFiisDmzERIZoAh
         qtIx+Z8soRV0noZVxJfzvMh16OupjcC+ZZNLMk8qEMjCjI++dl41F/o4gIXPFKbUaESh
         hDO+qJvHh9CljJy2m3Bie0TCEGeL5QXNcP5V5KcEVO2dwvSxsqAqsTAVoqKD2EPZ2gI3
         9S0+hSWvdBBmgcnWCaW0pqifTtjDzLejEenk05mFgkWf+DX7IXNSK81YJ9Swzkl++2at
         SVRA==
X-Gm-Message-State: AFuF++nCIu9s1Kj8WLlQGcZ34bcJkMA6AHx3W8V08lB0uTfa+KDR/qBB
	qI06F8b4NbvmzIRznR0g9jn1P+G3Gnb6H/lF0+HjVUyuuOh+KJ/w9fpNuJmmufh8OIg1WqLHvJR
	RjwAGuVqWtsZK5mM4Mgt1RX7sXrUIH7pn463QQqu2x0/ZitK7lmDzzbNm2x4=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:81cc:b0:6b1:9f9d:7a00 with SMTP id
 006d021491bc7-6bee25409d4mr462455eaf.5.1788953756885; Wed, 09 Sep 2026
 04:35:56 -0700 (PDT)
Date: Wed, 09 Sep 2026 04:35:56 -0700
In-Reply-To: <6a6c3d48.5cf34cee.28a846.0008.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa1449c.f2639fcc.29487d.0002.GAE@google.com>
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
index cdd1dfc666c4..c2fba561ba03 100644
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
@@ -695,15 +730,17 @@ static void gs_close(struct tty_struct *tty, struct file *file)
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
-		goto exit;
+
+		goto exit
 	}
 
 	pr_debug("gs_close: ttyGS%d (%p,%p) ...\n", port->port_num, tty, file);
@@ -911,6 +948,8 @@ static int gs_get_icount(struct tty_struct *tty,
 static const struct tty_operations gs_tty_ops = {
 	.open =			gs_open,
 	.close =		gs_close,
+	.install =		gs_install,
+	.cleanup =		gs_cleanup,
 	.write =		gs_write,
 	.put_char =		gs_put_char,
 	.flush_chars =		gs_flush_chars,
@@ -1203,6 +1242,18 @@ static void gs_console_exit(struct gs_port *port)
 
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
@@ -1222,6 +1273,7 @@ gs_port_alloc(unsigned port_num, struct usb_cdc_line_coding *coding)
 	}
 
 	tty_port_init(&port->port);
+	port->port.ops = &gs_port_ops;
 	spin_lock_init(&port->port_lock);
 	init_waitqueue_head(&port->drain_wait);
 	init_waitqueue_head(&port->close_wait);
@@ -1258,8 +1310,7 @@ static void gserial_free_port(struct gs_port *port)
 	/* wait for old opens to finish */
 	wait_event(port->close_wait, gs_closed(port));
 	WARN_ON(port->port_usb != NULL);
-	tty_port_destroy(&port->port);
-	kfree(port);
+	tty_port_put(&port->port);
 }
 
 void gserial_free_line(unsigned char port_num)
