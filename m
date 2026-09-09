Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715BC492E3C
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 20:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788985766; cv=none; b=qqA+tAspeP50PKc+EpDuVp+PJXHn27EUbDAr+OC/oog5xLIafiVv6Tdf02QFIfRa2n2RfKyO+EOe5e5XvkvQcKf3wjAT0SFv72SJ/jRuxgqloi5Tba7ifbSH0AKj/INev++FrJBofiIVOOfX24DTml37Y5X1t/ho5xMB1IV497A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788985766; c=relaxed/simple;
	bh=wzvk+PIYcLaRi8VUDks/VFbo448eW8NNL+sk2s1Kai8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=sIjJA9OlSeu9KOGWzuxoYI9JEh+01plX5x1Xe1Az+IDyQd2uOjl30/ZoBb2CgqXkLU/4wDIVxaf/qchpKlP3Pr4Wg6CW7QwRMQK27jCnarIq5NhDdrClmO1IaInGq1fwl459Iu/cIUuxYJm67QI6SMknEiXPgk8a+vPQCaTstNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6bf7ab47124so40347eaf.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 13:29:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788985760; x=1789590560;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1pkn/9AEzOjk7gzkQSrpG3lOs/AOyY6JqYGB/S47TL8=;
        b=o8dtA0aE+OuLYSv7Nm4pGanKlKiLlwHlcHhT6ZR6LYr+/WdSMRR+eluGtkhg6P8ywp
         RL0GsP/yhjny39XAC/ZgEbsJOFItkIrDHc8R8LysbrDG8deTxRqSFDVvx4LR15rNGWYf
         xISzm34XbkjAcfrDNQfagk6DcsmNOKmSZbNOnV6aQye5ja4xNne5s24/E9zzixLMXM3O
         q+FKTnC14VaUp9zSuvvw02Gq5jO3y14cIZ3GyCV+iBWLtcO8L/Ev6fA10BDVpAmi2j4l
         BWampGPCXc5zwH9E4FRXxMvi4J+8ae1z8dBkKMEm4IA2rpKTwwPSjvzKabzLIjtW1hL2
         aSLA==
X-Gm-Message-State: AFuF++nqFQHc4OAAqCv5/ceMp8pm9i343OGbM4BiDw7/tWk19hlq9e+a
	IUkiraOd7NuMUSGzYxYezkIk9iMUw0AywJ6tcU73pyuOUgg6zxSWW16yZSOe9YQM3432nhiKe9g
	ALQX58AHKi+vkXJpkSwqiPT6XlTtCcDuShJmtTf3sy1aA+X8Aq0Vbn4urjig=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4d04:b0:6a0:f44b:1265 with SMTP id
 006d021491bc7-6b6fa8e0837mr21380210eaf.4.1788985760428; Wed, 09 Sep 2026
 13:29:20 -0700 (PDT)
Date: Wed, 09 Sep 2026 13:29:20 -0700
In-Reply-To: <6a7a82f8.01d0871a.3a0d52.00b9.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa1c1a0.f2639fcc.29487d.000d.GAE@google.com>
Subject: Forwarded: [PATCH] usb: gadget: u_serial: fix use-after-free in release_tty
From: syzbot <syzbot+bca09f5d8b843bbf7571@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH] usb: gadget: u_serial: fix use-after-free in release_tty
Author: adrianox@gmail.com

#syz test
gserial_free_line() frees the whole struct gs_port with kfree() once its
own open counter reaches zero. But the tty core keeps tty->port (which is
the embedded struct tty_port) for the lifetime of each tty; a concurrent
struct tty release can still dereference it from release_tty() after the
port has been freed, on a workqueue, racing the configfs teardown:

  release_tty -> tty->port->itty = NULL   (UAF)

Give the tty_port a proper reference count so it is only destroyed once
the last open tty releases it:
  . gs_install holds a tty_port_get() for every opened tty,
  . .cleanup drops it via tty_port_put(),
  . the port's ops->destruct kfree()s the enclosing gs_port, and
  . gserial_free_port just drops the base reference instead of kfree().
---
 drivers/usb/gadget/function/u_serial.c | 55 +++++++++++++++++++++++++-
 1 file changed, 53 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
index cdd1dfc666c4..5a78deea2904 100644
--- a/drivers/usb/gadget/function/u_serial.c
+++ b/drivers/usb/gadget/function/u_serial.c
@@ -908,7 +908,53 @@ static int gs_get_icount(struct tty_struct *tty,
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
+ * The tty core stores tty->port and later dereferences it from release_tty()
+ * on a workqueue, possibly after gserial_free_line() tore the gadget line
+ * down. Keep a reference to the port for the whole life of each tty so the
+ * embedded struct tty_port (and the enclosing gs_port) is only freed once no
+ * tty can reach it.
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
@@ -1222,6 +1268,7 @@ gs_port_alloc(unsigned port_num, struct usb_cdc_line_coding *coding)
 	}
 
 	tty_port_init(&port->port);
+	port->port.ops = &gs_port_ops;
 	spin_lock_init(&port->port_lock);
 	init_waitqueue_head(&port->drain_wait);
 	init_waitqueue_head(&port->close_wait);
@@ -1258,8 +1305,12 @@ static void gserial_free_port(struct gs_port *port)
 	/* wait for old opens to finish */
 	wait_event(port->close_wait, gs_closed(port));
 	WARN_ON(port->port_usb != NULL);
-	tty_port_destroy(&port->port);
-	kfree(port);
+	/*
+	 * Drop the base reference. The tty port is only freed (via
+	 * gs_port_destruct) once the last open tty also released its
+	 * install-time reference in gs_cleanup().
+	 */
+	tty_port_put(&port->port);
 }
 
 void gserial_free_line(unsigned char port_num)
-- 
2.51.0

