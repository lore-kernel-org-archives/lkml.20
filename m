Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9A03CD8C9
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789028464; cv=none; b=IRUazv6k0zNd3uf60+Y9+R/MH+L2mvssfrlKlkFmrdb6K11pbxdpSMwqc1CcCx4A5O8IujPPfde9gYwFXYeRC+vKY9LhQ0+D+jUFAp/S3nGYq7zx5BSvhAfQOUOER0S2BFKeBx4vAOWsihj+05muyMP7pIwi6lkJtygM28M/cVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789028464; c=relaxed/simple;
	bh=xTPgzq0JWJUkAsfOWDQuzY/ns3lnWJuoUvRjglcxr6A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tz23BAVRLDhR2mYCWLpKz2Uo376vPP+BfSIGarWPkhhB/qPKajl9CUIUopxlODpPZObtypSGamEiBkpoUY8rdCPqUridHFmvdzBZ4gyS1hd4FszqjrYB940dqekOtWA1HAsjbjN0kaq72XwSc9LN7PLeCSba+ikJX99cegwAdEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZQ2Rz6Na; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZQ2Rz6Na"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-499ac87c92bso71885125e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 01:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789028461; x=1789633261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xgClJtEr8d0GwZI2HCdCNWAFW5HteuKdFM5N4ZIWRLk=;
        b=ZQ2Rz6Na6xV73SX2MNW/Ta61aGUCllVrCU+58f/vohy6SGVWTYigqJ/n5Tr+z56vlZ
         ZITxyj7y+qSgh6ksivdkHV6AI/E946IzFQLKyznOK83NoMLqgFTRKCDmOqgpzB6IeKP7
         alm6Tsk0SnPIOIScEE+MaHAKXMZUvKNge0glnrRlwFIFIIT2OkO9asXambWYYRZvPsJl
         RdgRIVEDYAWFdI+XpSWXGMkYq6XZHEbG24DQDmQCTKx6zFn/haDTjR7aa/GSI8ka0Vwr
         erbR9fFJ74QF2wKAZfQnc1BLBBHmXmTSh7R4PeppU5Oju2HJ5fkwpzxhTPwA5V1JJjGO
         jFRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789028461; x=1789633261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xgClJtEr8d0GwZI2HCdCNWAFW5HteuKdFM5N4ZIWRLk=;
        b=gR7hQSsoTOq+kKRqZOyGmWKxtfEheNeon4QpTE9iu+lLIH1bwFZdn1A5e+f20a4Z0F
         pg9QAOxcpkw7X9C03GefpVfcoWVl6YdWxjD3r3XsLowiGYUhLbbgH0YK5SO6eV72JZa+
         R9Sl1lx/JAeDp0NbtPZ/r8AaBGEsWLyI19Wm9lXPjb889qCumgVPRiV+vpLyDpDPmfMF
         LC+OJuo7PQAcCd+KxKwh2+yrBbZK/RK/5JlRKnu4qNjx+6t8T6V6AcZNUM9yAgcq4EA0
         JCjZ0Q022cKCSE8DP+A5Nc5JM5JeVoZTME10z8P+5KKJ8MUq72GmBimiao8g3Je6f5la
         Ryqw==
X-Forwarded-Encrypted: i=1; AKwUvByz5rgU5N5WyzfEAcAyhyux2ntEalGIXkZ8Govr8OBuh/MXaa8g/ZPJRwBZLbINpleRoAaeXP61gVBEri4=@vger.kernel.org
X-Gm-Message-State: AFuF++nObmd8hdFIxEFAGFJ8/UbDL/LLlpubkYh2m5A6er2wIIUx17cU
	slJyct4zUQPFHgv9qAsxjeZS+UaTsDpGXU/kSw3covXRbrgn3LGNeb1N
X-Gm-Gg: AYBFou38K2Osf9efyGGiNs7h8ukvd7WzD7zd/jxHKrSoDU6zvJCK/7nuF7rhOMVqk4M
	9IEHQ9T+xvGfiZSlu3ANxDqGq/v4hUaOHSo8yjpQ36jppmC3CAaljoheVsxyrtaXp0fj26Nzfop
	DfBwpQta3gsDI0FGHWCeHMEl4GLh9t+3j+Z81J6RJI3eziyXnYPtyw1vRJao/Xw37O1TzuXlpwk
	X2BLPK2bJEe/4DJRKjRq9skrc6qfwgcNA57fVkBgya6P/hCsiBFOHW/x4l4e9AhVbEvO7HNqejX
	/tfdOvbRJq81DCVdVRs5aplcS7VnqgqRlnYjV/fuQ75mSzkadUfZ9cYl5XgzP3+IePum1zQVGHH
	XG8EWC+4dv7viJ5u1TC1WhNnVYjcszrljKsscUtX/CCV+O3wvZzXGcZU8fB06HZT5gTnJ7iJdbz
	GP++Ppib87rLsKRNvxBCdvZyMRrax/B6A0td01oFqXJ+AJS/yV65sQu2oP98Fiij4O/UovJWgrh
	uK/IoCJJxyksBYStl76+X9k4dGLKbtS/qhR+ey7woaviZbHtqZvQ80=
X-Received: by 2002:a05:600c:34c2:b0:49d:10d6:fd55 with SMTP id 5b1f17b1804b1-49d10d6fdeemr236778155e9.1.1789028460698;
        Thu, 10 Sep 2026 01:21:00 -0700 (PDT)
Received: from LS-Tayyab-Farooq.dreambig.corp ([125.209.88.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c0f8d9sm57415865e9.15.2026.09.10.01.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 01:21:00 -0700 (PDT)
From: Syed Tayyab Farooq <syedtayyabfarooq08@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	David Brownell <dbrownell@users.sourceforge.net>,
	linux-usb@vger.kernel.org (open list:USB SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: Syed Tayyab Farooq <syedtayyabfarooq08@gmail.com>,
	syzbot+fe63e4d633540f230624@syzkaller.appspotmail.com
Subject: [PATCH] usb: gadget: u_serial: fix use-after-free between tty open/close and gserial_free_line
Date: Thu, 10 Sep 2026 13:17:19 +0500
Message-ID: <20260910082008.12397-1-syedtayyabfarooq08@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

syzbot reports a slab-use-after-free in tty_init_dev()/gs_close()
involving struct gs_port. The port is allocated when a gadget serial
function instance is created via configfs mkdir (gserial_alloc_line())
and freed via a plain kfree() in gserial_free_port() when the instance
is removed via configfs rmdir(). Nothing prevented a concurrent
open("/dev/ttyGS*") from racing with rmdir: the tty core could still
reach gs_open()/gs_close() and dereference the gs_port after it had
already been freed, since the ports[] table entry these functions
looked up was a bare pointer with no refcounting tied to the tty core.

Fix this by giving struct gs_port proper tty_port-managed lifetime:

 - Add gs_install()/gs_cleanup() tty_operations. gs_install() looks up
   the port once under ports[idx].lock, takes a tty_port_get()
   reference, and stores the result in tty->driver_data. gs_cleanup()
   drops that reference when the tty_struct is released. This ties the
   gs_port's minimum lifetime to the tty_struct using it, so it can no
   longer be freed out from under an open tty.

 - Give tty_port a destructor (gs_port_destruct()) that does the
   kfree() that gserial_free_port() used to do directly, and
   switch gserial_free_port() to tty_port_put() instead of an
   unconditional kfree(). Also, tty_port_destroy is automatically called
   when the reference reaches 0. The struct is now only actually freed once
   its last reference (held by either the ports[] table or a live tty)
   is dropped.

 - Stop gs_open() from independently re-deriving the port from
   ports[port_num].port and reassigning tty->driver_data. gs_install()
   is now the single place that looks up and pins the port; gs_open()
   re-deriving it separately could, on an unlucky race with the port
   index being freed and reallocated, leave tty->port and
   tty->driver_data pointing at two different gs_port instances, with
   the one gs_close() uses left unprotected. gs_open() now just uses
   the already-validated tty->driver_data, while still holding
   ports[port_num].lock across the first-open kfifo allocation to
   serialize concurrent first opens against each other (kfifo_alloc()
   needs GFP_KERNEL, so it can't run under port_lock).

 - In gs_close(), a tty's .close() can legitimately run against a port
   whose port.count is still 0, e.g. when gs_open() fails and the tty
   core unwinds via tty_release(). The previous code treated this as
   an impossible state (WARN_ON(1)), which trips panic_on_warn on
   syzbot and isn't actually a bug -- it's an expected outcome of a
   failed open. Treat count == 0 the same as any other "not the last
   closer" case and return quietly instead of warning.

Reported-by: syzbot+fe63e4d633540f230624@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=fe63e4d633540f230624
Fixes: c1dca562be8a ("usb gadget: split out serial core")
Signed-off-by: Syed Tayyab Farooq <syedtayyabfarooq08@gmail.com>
---
 drivers/usb/gadget/function/u_serial.c | 64 +++++++++++++++++++++++---
 1 file changed, 57 insertions(+), 7 deletions(-)

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
-- 
2.43.0

