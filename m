Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6E33D45D0
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 07:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788937836; cv=none; b=g8F++gunnLrh71FwXZ/KoujRpyROxqOvII5xK/Wxye4XSgdqw9l3O27oU3qwkPpL4zQVe2AAbIyvjK2SGB0tlobopeiBfNgbY/VnsjjJLDXjaFvONVU50klJ8YGphRd1UhwQO8S2px9sCRAc/FEQcMxjH/G7FVq/TFFao0IHBkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788937836; c=relaxed/simple;
	bh=/THWGp2bg4/rud78sI1EqIZl6PkCOOssgZN6WbAe7B4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=cN4yaLZg1X/+E9eMzPLaN75Cq+wwEtz6BvKnqTLJiDOJjhnhwHUeKHdvBszlyyYQhPHjo818c/o23YVXxKACEYhhNuuO+rUCvY1TZ1G0EXwA2pDD7QBxXWpQ64eHjmkzDXyUBdB6GA7iEuQnCnTt0JlyhLDs1ryMzdgS2apXv3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7e9f6a49e69so8610814a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 00:10:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788937833; x=1789542633;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AvlkIaK1hLMJtH0mczv3l0KFS7OQxsYq3J2237PlUtA=;
        b=I0SbLLi8WvIXao9VE9CdW4eYfyco2ZgBuDD0L0KLvEdo+a5O/LaDq+09dfsZiDxabH
         VwhHWn8VgNcUUgsuT0wmRgzFBhRZUCuvdCvjYqxod9MZ4bxgyIgkg/ex5yjrINTOmh/i
         lxi+LaLX6xSRetSaD6OqZGzhIM0OCrbkHVQAUtvWYw/ubb2iRdyUdIw+2N48C7UYsu3o
         fFWt03Sa+fxEq66ho3JbwnYbcLceJZYIazkA6vv1j8vbZah9uGMHJaoPi/zu8/3l8dUe
         VfDoZDMWAN8YJxSI4PwRo7k+u0Wymxj6VLPEPPrk041wEmYvW343weQGavOeLjU7fCVC
         qwPg==
X-Gm-Message-State: AFuF++lcW88LGvcBn4hK78sgMlkOk9oJihhEvqTA0IboDUdJFJfBXrfr
	+p8k8vCy5k9gHnIezC8QL388mKjOqrPQJT/+/4grF/0UPX976AV+ITWaL3Xsx8Szu8aJVTIcn4g
	nWDWFd/wzw39PXgpeAjyTPlkv7iFGrUI7ZPVD1aMiJq2gF0amIBLW7OTT90k=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:211:b0:6b7:83d6:2926 with SMTP id
 006d021491bc7-6b783d62ecamr16007140eaf.41.1788937833459; Wed, 09 Sep 2026
 00:10:33 -0700 (PDT)
Date: Wed, 09 Sep 2026 00:10:33 -0700
In-Reply-To: <6a6c3d48.5cf34cee.28a846.0008.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa10669.f81106d8.285f0a.000d.GAE@google.com>
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
index cdd1dfc666c4..4435cc42d1c0 100644
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
@@ -911,6 +946,8 @@ static int gs_get_icount(struct tty_struct *tty,
 static const struct tty_operations gs_tty_ops = {
 	.open =			gs_open,
 	.close =		gs_close,
+	.install =		gs_install,
+	.cleanup =		gs_cleanup,
 	.write =		gs_write,
 	.put_char =		gs_put_char,
 	.flush_chars =		gs_flush_chars,
@@ -1203,6 +1240,18 @@ static void gs_console_exit(struct gs_port *port)
 
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
@@ -1222,6 +1271,7 @@ gs_port_alloc(unsigned port_num, struct usb_cdc_line_coding *coding)
 	}
 
 	tty_port_init(&port->port);
+	port->port.ops = &gs_port_ops;
 	spin_lock_init(&port->port_lock);
 	init_waitqueue_head(&port->drain_wait);
 	init_waitqueue_head(&port->close_wait);
@@ -1258,8 +1308,7 @@ static void gserial_free_port(struct gs_port *port)
 	/* wait for old opens to finish */
 	wait_event(port->close_wait, gs_closed(port));
 	WARN_ON(port->port_usb != NULL);
-	tty_port_destroy(&port->port);
-	kfree(port);
+	tty_port_put(&port->port);
 }
 
 void gserial_free_line(unsigned char port_num)
