Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB120492522
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 12:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788957224; cv=none; b=p0bWt/TpN0OxdlpvxKPdnMNLgTFaBpsWIhUQLQBwwGYo9n5GmTFfh/im0kzZWSnSlcvKd/JiVNpyQCKQd+Q9U0lkrblhS1V8wZiwRjuJBfA8W3Nlah/m5ubWBzg8SgVLts1Ac7CQnGXtpBRMBUp9ctwsc1tkDiSf6vuG8z7vtx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788957224; c=relaxed/simple;
	bh=KS1N6k2YLTMDi7c0RGLz/xl9wUEpOP5ZMfi9x4dtylU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Skz6wPtP/+LmljvweVU2w1eSlRJSDR85t/w/eQl0nAsOY1R12rm7kPcE5HXU5ePIAIOMbVYQ1MaxHRAdEoB/Kyu/ABHybp0s3OWDd7zY+F/NEugi88yaEape/HijFvZgUs/0M90AkhOOEb5a00NxgnQfrr+f0DP9Nf47YPyhZbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7ec6685adabso8164678a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 05:33:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788957221; x=1789562021;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Lcl1dgouCFGOLM4r5ViGc8pC9IXATr1+8cPCCR6EmR0=;
        b=J+hZNy/95II+6bKoEQl329yICr9vkR28nWIZi0wf0WUIT3raM6giLRcZwGemQKDK+B
         93r2ZUQmzMafSpkUf0myJTfBRnyXWmcxmoSXPhuaraPP/6otoUUqEukD9WP5yJbGd1Tf
         +jT9rulikob2L68qWB4fFCfyCmDK0Z9jRtqkIR3ZnZUjMjiGeOKRwQRzLgWnO8XwrfR6
         diDyCDH405qzA154A1AuWFYyqllgUsTAV38jZinyuCYMfRdfbB7dsyYXCRvIYRrHKlaW
         WPX1zAXDsOP0c43tqncppZtFa2YNWqg5hLoOdt/mWJXVQuUrLjKmHzS5mljnYskv7hXH
         MEKw==
X-Gm-Message-State: AFuF++nwHDCIutP6niZWJav0T3B9HakaCbdnl2+Y8t/NC1aijy0JFKaL
	s5YXZXYzqYmOjIU6vlttf0gdAnyPkbsN+ItN7KeqIzD0aHaLJPKftGDnc5fTwhVqBlSV9tseTP9
	DsLlsxgJ8gXBAxbokbX5g66bJcETv29RDjbepeyUrsCrm4JZQ5aPvH9KC35k=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:8596:10b0:6b7:8415:d799 with SMTP id
 006d021491bc7-6b78415d91emr12758841eaf.68.1788957221494; Wed, 09 Sep 2026
 05:33:41 -0700 (PDT)
Date: Wed, 09 Sep 2026 05:33:41 -0700
In-Reply-To: <6a6d375e.2d659fcc.1d46f5.01a4.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa15225.6e6c5f9e.28f11f.0027.GAE@google.com>
Subject: Forwarded: Re: test patch
From: syzbot <syzbot+31117fde582fe6a0cd62@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: test patch
Author: syedtayyabfarooq08@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
index cdd1dfc666c4..5974a9303ecf 100644
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
@@ -695,14 +730,16 @@ static void gs_close(struct tty_struct *tty, struct file *file)
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
