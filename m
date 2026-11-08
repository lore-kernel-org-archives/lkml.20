Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794132094;
	b=hlTdoEhY/JiNdpwByR9UD32ktrwoSdOpIKqYy9iXZ0EHucMWD3ZHUF73AL+p+nDh0Hzq
	 67BqtXa4Yzq491D4cqxc1GKWkOYGkEY6lSGwJc0QPMTCDnew+LCQE/yFRfwcGBbJnPkOS
	 Yg9qr/OplrKHawvz/WbSYdgc0F3A9rYwf4iNZWT9hTJJAzbVdANZGc6sbvvG10YNhkV4U
	 1Ejptxw4NLxXDXpaWp8IlaWzER4PFvl5qBUGwuYi/0V2FUj8kNaqFqRkwab55oWsOnEZM
	 mdYHc6bqMU+R+zbBYiNPFcbTljU4eZcc3ddD1vJeXBloTdVjgcFvFVLtUQeJ7lLnmxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794132094;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=WX7F30P2T7ZLISOO6/GkVmLyVQn6lngZWVK5uXaxz30=;
	b=dDaRLfoIZurhn6x9zEtpSfwks2P2zPdw1xeHXwW4xi3flTOZJG38mlH1dzArISKUK7QG
	 U/KO1/yALsY5mZNCBDCADmVk/C6+EThhIm86+kgda7EyCzUHsIXa0hkMWb4QHaMA5g1/s
	 BD5wZZ+2/BXafjk4XZklcM3h60sg0wDzDhjkhBkPTmDx6mDJ4biri4N3mJxtQ+tCBDZhF
	 HDzHn7sAW4Mu2HTnPr6xIBMBWwfon9pf6+Asc7M93/RDG7Hsx7owWhFuxFsCxacUzQg11
	 J2gjTgDRUbK3h85eTNFzZOJiQ4VmZWNmAp9Vn8+ZKU9OfPswavjr1/c00RDYS9j3O9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C17606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 10:01:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23C17606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4ea2c058e67so377451b6e.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 02:01:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794132093; x=1794736893;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WX7F30P2T7ZLISOO6/GkVmLyVQn6lngZWVK5uXaxz30=;
        b=rrnDYNTaPdCxGF5/eMaV0trtEYXVLOotU+rY6NiRSyeR8D8WJ4JQEzFK3OS1Gf6tfJ
         HPY+LmOe/dd3NJNUIYPkUITWrM5grIuC2Td/zzTI9Q3iCORGeZiuGl/aX/2KD4IT+83j
         0BOdVYKo8ssRLygF7zIpOxv+YsU/sud1HXmd2Sz5k3laF+jpa1yCP9obPBaH9UhSyFuf
         +WHkBH4ItF2WmI8Fhf0iowIZaEEXmf7vpHWU4j59GiCSvIuf/fk4ALnvhENRpSn2kf5I
         eFMJ/PqngyAlC4EXmUff3H0eyqtqz3ljVq/EY+SLxoEiprXuJr6K6dJ+x+Z5nLqPhcbV
         ymQA==
X-Gm-Message-State: APuU4Z+E7Z9ZdGS4vxk39g7evJ4bnV4Xxze3peMPXXDn8IGOEApSfUMi
	bKrSl7ZVtu1CofzNGky8+Xeuo2J+m4FuXiHukEAkoPZSjeAJsYhQjIlIPbyaBYDv5gAAU/KAXaL
	Y64NjlcvbeI2bZ7H8uW83yJdftFQ/noFB8QIO2209Kq8NYzlj0dbdw5H/oF4=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4f10:b0:4e9:7d56:846f with SMTP id
 5614622812f47-568145ef2eamr602758b6e.41.1794132093245; Sun, 08 Nov 2026
 02:01:33 -0800 (PST)
Date: Sun, 08 Nov 2026 02:01:33 -0800
In-Reply-To: <6a830720.dbb3a75c.20434b.005b.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af0487d.4dd4714a.f8d02.0010.GAE@google.com>
Subject: Forwarded: u_serial v3 series - test request
From: syzbot <syzbot+39a2135de1558208d3b3@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: u_serial v3 series - test request
Author: varun.singh10011@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
index cdd1dfc666c4..aca15b429f29 100644
--- a/drivers/usb/gadget/function/u_serial.c
+++ b/drivers/usb/gadget/function/u_serial.c
@@ -125,7 +125,6 @@ struct gs_port {
 	struct kfifo		port_write_buf;
 	wait_queue_head_t	drain_wait;	/* wait while writes drain */
 	bool                    write_busy;
-	wait_queue_head_t	close_wait;
 	bool			suspended;	/* port suspended */
 	bool			start_delayed;	/* delay start when suspended */
 	struct async_icount	icount;
@@ -615,8 +614,13 @@ static int gs_open(struct tty_struct *tty, struct file *file)
 	int		status = 0;
 
 	mutex_lock(&ports[port_num].lock);
+	/*
+	 * Reject the open if the line has been freed, or freed and
+	 * reallocated, since gs_install() took its reference: a reopened
+	 * tty keeps the old port in tty->driver_data.
+	 */
 	port = ports[port_num].port;
-	if (!port) {
+	if (!port || port != tty->driver_data) {
 		status = -ENODEV;
 		goto out;
 	}
@@ -648,7 +652,6 @@ static int gs_open(struct tty_struct *tty, struct file *file)
 	if (port->port.count++)
 		goto exit_unlock_port;
 
-	tty->driver_data = port;
 	port->port.tty = tty;
 
 	/* if connected, start the I/O stream */
@@ -693,15 +696,18 @@ static int gs_close_flush_done(struct gs_port *p)
 static void gs_close(struct tty_struct *tty, struct file *file)
 {
 	struct gs_port *port = tty->driver_data;
-	struct gserial	*gser;
+	struct gserial *gser;
 
 	spin_lock_irq(&port->port_lock);
 
 	if (port->port.count != 1) {
 raced_with_open:
-		if (port->port.count == 0)
-			WARN_ON(1);
-		else
+		/*
+		 * A count of zero is reached when gs_open() failed after
+		 * gs_install() had already stored the port in
+		 * tty->driver_data; tty_release() still calls ->close().
+		 */
+		if (port->port.count)
 			--port->port.count;
 		goto exit;
 	}
@@ -744,7 +750,6 @@ static void gs_close(struct tty_struct *tty, struct file *file)
 	pr_debug("gs_close: ttyGS%d (%p,%p) done!\n",
 			port->port_num, tty, file);
 
-	wake_up(&port->close_wait);
 exit:
 	spin_unlock_irq(&port->port_lock);
 }
@@ -908,7 +913,40 @@ static int gs_get_icount(struct tty_struct *tty,
 	return 0;
 }
 
+static int gs_install(struct tty_driver *driver, struct tty_struct *tty)
+{
+	int port_num = tty->index;
+	struct gs_port *port;
+	int status;
+
+	mutex_lock(&ports[port_num].lock);
+	port = ports[port_num].port;
+	if (!port) {
+		mutex_unlock(&ports[port_num].lock);
+		return -ENODEV;
+	}
+	tty_port_get(&port->port);
+	mutex_unlock(&ports[port_num].lock);
+
+	status = tty_port_install(&port->port, driver, tty);
+	if (status) {
+		tty_port_put(&port->port);
+		return status;
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
 static const struct tty_operations gs_tty_ops = {
+	.install =		gs_install,
+	.cleanup =		gs_cleanup,
 	.open =			gs_open,
 	.close =		gs_close,
 	.write =		gs_write,
@@ -1203,28 +1241,32 @@ static void gs_console_exit(struct gs_port *port)
 
 #endif
 
+static void gs_destruct_port(struct tty_port *port)
+{
+	kfree(container_of(port, struct gs_port, port));
+}
+
+static const struct tty_port_operations gs_port_ops = {
+	.destruct = gs_destruct_port,
+};
+
+/* Caller must hold ports[port_num].lock. */
 static int
 gs_port_alloc(unsigned port_num, struct usb_cdc_line_coding *coding)
 {
 	struct gs_port	*port;
-	int		ret = 0;
 
-	mutex_lock(&ports[port_num].lock);
-	if (ports[port_num].port) {
-		ret = -EBUSY;
-		goto out;
-	}
+	if (ports[port_num].port)
+		return -EBUSY;
 
 	port = kzalloc_obj(struct gs_port);
-	if (port == NULL) {
-		ret = -ENOMEM;
-		goto out;
-	}
+	if (!port)
+		return -ENOMEM;
 
 	tty_port_init(&port->port);
+	port->port.ops = &gs_port_ops;
 	spin_lock_init(&port->port_lock);
 	init_waitqueue_head(&port->drain_wait);
-	init_waitqueue_head(&port->close_wait);
 
 	INIT_DELAYED_WORK(&port->push, gs_rx_push);
 
@@ -1236,30 +1278,15 @@ gs_port_alloc(unsigned port_num, struct usb_cdc_line_coding *coding)
 	port->port_line_coding = *coding;
 
 	ports[port_num].port = port;
-out:
-	mutex_unlock(&ports[port_num].lock);
-	return ret;
-}
 
-static int gs_closed(struct gs_port *port)
-{
-	int cond;
-
-	spin_lock_irq(&port->port_lock);
-	cond = port->port.count == 0;
-	spin_unlock_irq(&port->port_lock);
-
-	return cond;
+	return 0;
 }
 
 static void gserial_free_port(struct gs_port *port)
 {
 	cancel_delayed_work_sync(&port->push);
-	/* wait for old opens to finish */
-	wait_event(port->close_wait, gs_closed(port));
 	WARN_ON(port->port_usb != NULL);
-	tty_port_destroy(&port->port);
-	kfree(port);
+	tty_port_put(&port->port);
 }
 
 void gserial_free_line(unsigned char port_num)
@@ -1267,17 +1294,34 @@ void gserial_free_line(unsigned char port_num)
 	struct gs_port	*port;
 
 	mutex_lock(&ports[port_num].lock);
-	if (!ports[port_num].port) {
+	port = ports[port_num].port;
+	if (!port) {
 		mutex_unlock(&ports[port_num].lock);
 		return;
 	}
-	port = ports[port_num].port;
 	gs_console_exit(port);
 	ports[port_num].port = NULL;
+
+	/*
+	 * Unregister while still holding the lock, so the device cannot
+	 * outlive the slot it belongs to. Dropping the lock first lets a
+	 * concurrent gserial_alloc_line() claim this line and register its
+	 * own device, which this unregister would then tear down, leaving
+	 * the new line without a device node.
+	 */
+	tty_unregister_device(gs_tty_driver, port_num);
 	mutex_unlock(&ports[port_num].lock);
 
+	/*
+	 * Hang up any tty still open on this line so it stops being usable
+	 * and is released, rather than lingering in gs_tty_driver->ttys[]
+	 * where a reopen could pick it up after the line is reallocated.
+	 * This needs ports[port_num].lock dropped: it takes tty_lock, which
+	 * gs_install() already holds when it takes that mutex.
+	 */
+	tty_port_tty_vhangup(&port->port);
+
 	gserial_free_port(port);
-	tty_unregister_device(gs_tty_driver, port_num);
 }
 EXPORT_SYMBOL_GPL(gserial_free_line);
 
@@ -1294,13 +1338,19 @@ int gserial_alloc_line_no_console(unsigned char *line_num)
 	coding.bParityType = USB_CDC_NO_PARITY;
 	coding.bDataBits = USB_CDC_1_STOP_BITS;
 
+	/*
+	 * Claim a free line and register its device with the line's lock
+	 * held throughout, so the slot and the device appear together and a
+	 * concurrent gserial_free_line() sees either both or neither.
+	 */
 	for (port_num = 0; port_num < MAX_U_SERIAL_PORTS; port_num++) {
+		mutex_lock(&ports[port_num].lock);
 		ret = gs_port_alloc(port_num, &coding);
-		if (ret == -EBUSY)
-			continue;
-		if (ret)
+		if (!ret)
+			break;
+		mutex_unlock(&ports[port_num].lock);
+		if (ret != -EBUSY)
 			return ret;
-		break;
 	}
 	if (ret)
 		return ret;
@@ -1315,15 +1365,16 @@ int gserial_alloc_line_no_console(unsigned char *line_num)
 				__func__, port_num, PTR_ERR(tty_dev));
 
 		ret = PTR_ERR(tty_dev);
-		mutex_lock(&ports[port_num].lock);
 		ports[port_num].port = NULL;
 		mutex_unlock(&ports[port_num].lock);
 		gserial_free_port(port);
-		goto err;
+		return ret;
 	}
+	mutex_unlock(&ports[port_num].lock);
+
 	*line_num = port_num;
-err:
-	return ret;
+
+	return 0;
 }
 EXPORT_SYMBOL_GPL(gserial_alloc_line_no_console);
 
