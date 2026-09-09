Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F40C2E266C
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 06:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788935581; cv=none; b=QFBYC8YO7nOwge+c9PBsjswUZxNFWNAy/3PpOsFC7F0GdDFUox2GIxo1YXB6ABPe1LAVNaaoM/t60k0fGdJadNM8N2XTgDCB3+d0VlwDddfzXWM6Ot94MudEpKv5bI/DcTZmyckJly8eu8vtwabSnm65V+pKE34KOO4zDWaNQa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788935581; c=relaxed/simple;
	bh=bC9ZGyGmBp9fDHyuGpE9S+oHZAi6oA9dM8Wix+xNEp4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Is2OJP1HcGyB1swDJG8/kUrcsHKl0F3OiYyuJdxb8NcIUFHqtY1RzXisKfxEBMFo0rcAC7msy8Dru42M++HFVLGZ2cTSK15wzuEE7QGBolhJWF1k3C8DJOHdWHK364viC81peJvPDMkAEBZIi4eUiKUGEmO12PNBpwyPxAUUGi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7e9ee20bde0so6810868a34.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 23:32:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788935578; x=1789540378;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0GbK2YZ2wA9OapREmocMo0LRct5jz7bBnq+fHC+waGI=;
        b=dmAuvEAMSf3p2ql4YX1Jn4IbcunPU+jUeOn7aDfypYEedN13QP9O4nPqVulDmFHvWh
         0pmNsovWk3AMsObZGd9JJ0t+SA56TCTN+9Qxcjj52ZBnBOkjaalyJVcPsOM0NyQFGXEt
         3EvbgIUg0oy4kW0G26mfSGAMg9Mq98Yl+pe8pgdEv16B3gufO3ZG4hrXbf4tLcxp8f92
         qMgjDfUejwavryoQ8xFJI3RZHEFn6xIgkfLNcpMZAIKFg6QTawnhFrD4t+o9O3DVCNZM
         rjT/FSHWXQrgWvFMhg8/xPGoXNBMa4h557F3iBi1qCqLWDWwX1EvHnTBK3Tz8lZsEChL
         1+xQ==
X-Gm-Message-State: AFuF++lb8wQ8npazGHtEYTO4n/XOLS/lJvlSQDLjYkSTR0DOSQzdmUIF
	Hz1kMIvs/y4Y+sGdTk6vj4zomcghszzKLO3ysVLfE8g6Oy35kmdu1k5bBQQuzQN9VK3bleLZufR
	cava4MmnAzPZQKXq6YD+atvrzdiAyizIRX57mk+bRouyej43XVBe8r+YrGkI=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4b10:b0:6b3:5741:591f with SMTP id
 006d021491bc7-6b6fea866b5mr32499694eaf.26.1788935578498; Tue, 08 Sep 2026
 23:32:58 -0700 (PDT)
Date: Tue, 08 Sep 2026 23:32:58 -0700
In-Reply-To: <6a6d375e.2d659fcc.1d46f5.01a4.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa0fd9a.f81106d8.285f0a.000a.GAE@google.com>
Subject: Forwarded: Re: test patch
From: syzbot <syzbot+31117fde582fe6a0cd62@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: test patch
Author: syedtayyabfarooq08@gmail.com

#syz test

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
