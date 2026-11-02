Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793648099;
	b=BGGlEYVaus3rEPZLigtcG9Di2Qyr1f2S9jltWwI/y4cRQIDBzp70iDGumAeNlILvIkMG
	 LUdiH/bBewuvj2+3kKRcqHAjaYILktCaxGyDWUNWn5efAvjkMsTaMNaCTmrojLroGRlCT
	 uTFJOOgJBhEbDdASMrIvugETa9aOMHhMd2SyLMwZY/bKIu33BN3nbyZEJCCPKyAP8tFo0
	 1R7481pfFAwN8XOVo7UHpouLea1B+cZcjRq7GCZbKkU6/V2hC8WNHNry1Cwqf5cFTE/B7
	 ZjkUH5ZEalRgkFxPxtcAdefFWxslQfqupC7YJTdCMR0Wr9aoSNPya5yag6qEpiy2GWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793648099;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gROv1Bjx8N7dYXQ5hjVltmZn1Ef78MU0o9BvgY8hEvw=;
	b=cdmwpVKHq3JVZrjH/WqfvWMNne3dkoVdvNJf2hfNJM3a6wQCwHmn5ep31uV+IaW2Q5AL
	 0iAF2sRkfVCGGQMNPX7QYLdW0puPx+JWJOh7rKoAmcvxLeWEn9JVUyHGV2SrhDpX6TSV8
	 ytvuGaoIWmUDgr1CD1ITydoNozuyHm8qEpWCip9xe7zmtsU8XZith3yMzr/2tFHej/V3K
	 KU5lmIZhZufR4IdnPebyuYyPwr0ddRX/c66yLoyBqMk9RZUix9j9ftYZZhmB+w9hwST6i
	 nDT8wK3FoBNelzwMoY49Utxv4b7TnjvKPXWNEP4BgzTgPCX3MxMOF7cwdaTG/tMsPAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r9hlJPfH;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98832606A32F
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:34:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98832606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r9hlJPfH
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1aefd1bf74aso2194196c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793648098; x=1794252898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gROv1Bjx8N7dYXQ5hjVltmZn1Ef78MU0o9BvgY8hEvw=;
        b=r9hlJPfHFagpkqRa50MVZnGmqfyy8zNpEdUU5v6KimB7+W78x3VWj9M2wIWqiT2Q4v
         1qWTXzgMH7yacGKvc9sRrVg6auHXQMmFafESc1SBWw+kyrAnNdYWBoSMLHhta9jdW29j
         RELlqsrHdhEE2Mzx8og6jU7F0x3t861Q6NEikmiIx6LUPRQyuBxlZH7ooWtpGbbEbBJX
         p7EJeqbp9YxZDeSbqQXnZmqgKOAViptNSl4dCbH3oSoQEmKq9kOqj6bSVUu40UnEMhwz
         9XaA7KDy8IJ5QUyuhIWTm2Q9kyzmdxwO4b7Q+eQhT6zp6ir0STxW6u2rbT3QNAUdndkL
         YYog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793648098; x=1794252898;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gROv1Bjx8N7dYXQ5hjVltmZn1Ef78MU0o9BvgY8hEvw=;
        b=E3H0mojNHF/T2B3/m0ZDUEG+uC/BOaKmW9z4Tsz9pveE5q6Oga/LELP4ZYEEzEYGvx
         ExYzyDLzS5MEfsJg2vGyVdLp2ia7zWn22AZZaUyHsEMSAd5UoAhXIoK8oJz+Z3Ph164E
         GsDjTPCUl+VCEsjUVCGxc58vBy82F2cYgXTteJKMtlWJRz5+mPaKMcMnob/gjb/6ksqI
         wXNReMp/Wr4bP0iN2kERW0K6sQVH4wadluZFQ7ALNKszUYTY8Hvz9udPbrLErCpKVVgg
         u65+ZJPtlAOQq1/Wr4oZO2tVkupofFPGChOlj76UIWzlCXIchGh9Tl88htj3V1Y3L5PF
         2x+Q==
X-Forwarded-Encrypted: i=1; AKwUvByBfrsU3T6IrZsVYSIgUja6G4x1+g3A9HuHkRmAZTdu8YBnA8vshcPOHJkM1HDk2qHoM+FYfXlS5ocaAb8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIAoO823euyYjjXYCUPNpIsvrlsN9HyxZ9H8hiDOinbiKrsbBce
	NwnuRme0mCxOW/hOrGCkEV2R2i9Cg/WgD9BTTAbivIh871qoS20LS1Pbi+zM/vE9
X-Gm-Gg: AYBFou0lNQ09NWKB8EiCAl9ckOtZHt4GHBM60Uw63roSzcdrMmOPgcQSSSqdPi9pE0l
	jUb8HqcmirYGWVRJgiWvSzCkl7L8N8uIpno6cR20JzBJCZ/lXKSG4KCYJzkoWCE3g3e1xCe6efx
	5NTTW83N2fj4Scb5+m+axu7ILNBdZEUABscnq70vT5csTh5HlGvz0FSlPnUtuQ1rVYhOVtUdkPg
	HLN5KxkrLK4VkQlHt71HME2otlulenMgvFRIJ3az9w1TZt5x7RimttIIgYVuz05s7449TSR6h0v
	OQJbshQlkFTPRGxODiXqWtq49438sLkFgQDFWdWrFjTpaknyhDPITuKelvDcfVcNOTTgyUFmVEt
	49cMmdO1b1dz9/btfCQEncLsx5RpqQjRzm6/sP8p47vbEX7Tr70FdlEu2Edh14ohMe/FIW1Fii5
	Qg+Ag8pIQmDZyWSaEK+VVJw9dQfcUmN1+jVuRtuoIGHCOBhZstdR/v0MQJSYwl6P7sBohetPYi0
	ZCUAnGsgbt3Y+ons0G0FA8S6ps+zFDTusvHVoB69ANlpmen+cRc1YqrFe6BDPKpehdvgvs8v0iH
	Bu63CjS4k6oB3exhSTvVrTTaxEJvrlPCQXE0ZQPD+ExZ35CpvsrjVcGeiULMbhGGZjXC2QTtvPq
	yzMrHJloUoLxzIyl6NpNHNYXZBOPwN0rC0UPM
X-Received: by 2002:a05:701b:2511:b0:182:d0a8:d1a9 with SMTP id a92af1059eb24-1a93c6ccfa7mr18096715c88.0.1793648097585;
        Mon, 02 Nov 2026 11:34:57 -0800 (PST)
Received: from localhost.localdomain ([103.133.159.191])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac194b5437sm40089164c88.13.2026.11.02.11.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:34:57 -0800 (PST)
From: Varun Singh <varun.singh10011@gmail.com>
To: nkapron@google.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Varun Singh <varun.singh10011@gmail.com>,
	syzbot+39a2135de1558208d3b3@syzkaller.appspotmail.com
Subject: [PATCH] usb: gadget: u_serial: fix gs_port use-after-free on open/unbind race
Date: Tue,  3 Nov 2026 01:04:36 +0530
Message-Id: <20261102193436.6044-1-varun.singh10011@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

syzbot reports a use-after-free when a USB gadget serial function is
removed through configfs while /dev/ttyGS* is being opened:

  BUG: KASAN: slab-use-after-free in check_tty_count+0x134/0x2b0
   tty_release+0x95/0x1300 drivers/tty/tty_io.c:1728

gs_port embeds a tty_port, which the TTY core stores in tty->port without
taking a reference, so the driver must keep it alive. u_serial waited for
port.count to reach zero in gserial_free_port() and then freed the port.
That never worked: gs_open() returns -ENODEV without incrementing the
count once gserial_free_line() has cleared the ports[] slot, so the wait
completes immediately, the port is freed, and tty_release() reads it.

Use the tty_port kref and move the lookup into .install, which runs before
the core publishes tty->port. gs_install() takes a reference under
ports[].lock and stores the port in tty->driver_data, .cleanup drops it,
.destruct frees the port, and gserial_free_port() drops the allocation
reference instead of calling kfree(). gs_open() then takes the port from
tty->driver_data and cannot race gserial_free_line() at all.

Drop the close_wait/gs_closed() handshake: the kref makes it redundant,
and once the count is correct it blocks rmdir until userspace closes
/dev/ttyGS*, which shows up as a hung task. Keep the
cancel_delayed_work_sync(), as cancelling from .destruct instead leaves a
use-after-free in the work cancellation path. Unregister the tty device
before freeing the port rather than after.

To reproduce: mount configfs and devtmpfs, create a gadget function that
uses u_serial such as obex or acm, then repeatedly open /dev/ttyGS0, hold
some of those opens so they overlap, and remove the function directory
with rmdir. An unpatched KASAN kernel reports slab-use-after-free within a
few thousand rounds.

Found with the assistance of Claude Opus 5.

Fixes: 19b10a8828a6 ("usb: gadget: allocate & giveback serial ports instead hard code them")
Reported-by: syzbot+39a2135de1558208d3b3@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=39a2135de1558208d3b3
Tested-by: syzbot+39a2135de1558208d3b3@syzkaller.appspotmail.com
Signed-off-by: Varun Singh <varun.singh10011@gmail.com>
---
 drivers/usb/gadget/function/u_serial.c | 88 +++++++++++++++-----------
 1 file changed, 52 insertions(+), 36 deletions(-)

diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
index cdd1dfc66..906137033 100644
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
@@ -610,17 +609,9 @@ static int gserial_wakeup_host(struct gserial *gser)
  */
 static int gs_open(struct tty_struct *tty, struct file *file)
 {
-	int		port_num = tty->index;
-	struct gs_port	*port;
+	struct gs_port	*port = tty->driver_data;
 	int		status = 0;
 
-	mutex_lock(&ports[port_num].lock);
-	port = ports[port_num].port;
-	if (!port) {
-		status = -ENODEV;
-		goto out;
-	}
-
 	spin_lock_irq(&port->port_lock);
 
 	/* allocate circular buffer on first open */
@@ -629,16 +620,17 @@ static int gs_open(struct tty_struct *tty, struct file *file)
 		spin_unlock_irq(&port->port_lock);
 
 		/*
-		 * portmaster's mutex still protects from simultaneous open(),
-		 * and close() can't happen, yet.
+		 * The TTY core holds tty_lock across ->open(), so this is
+		 * serialised against a simultaneous open() or close() of
+		 * the same tty.
 		 */
 
 		status = kfifo_alloc(&port->port_write_buf,
 				     WRITE_BUF_SIZE, GFP_KERNEL);
 		if (status) {
 			pr_debug("gs_open: ttyGS%d (%p,%p) no buffer\n",
-				 port_num, tty, file);
-			goto out;
+				 port->port_num, tty, file);
+			return status;
 		}
 
 		spin_lock_irq(&port->port_lock);
@@ -648,7 +640,6 @@ static int gs_open(struct tty_struct *tty, struct file *file)
 	if (port->port.count++)
 		goto exit_unlock_port;
 
-	tty->driver_data = port;
 	port->port.tty = tty;
 
 	/* if connected, start the I/O stream */
@@ -672,8 +663,6 @@ static int gs_open(struct tty_struct *tty, struct file *file)
 
 exit_unlock_port:
 	spin_unlock_irq(&port->port_lock);
-out:
-	mutex_unlock(&ports[port_num].lock);
 	return status;
 }
 
@@ -693,7 +682,7 @@ static int gs_close_flush_done(struct gs_port *p)
 static void gs_close(struct tty_struct *tty, struct file *file)
 {
 	struct gs_port *port = tty->driver_data;
-	struct gserial	*gser;
+	struct gserial *gser;
 
 	spin_lock_irq(&port->port_lock);
 
@@ -744,7 +733,6 @@ static void gs_close(struct tty_struct *tty, struct file *file)
 	pr_debug("gs_close: ttyGS%d (%p,%p) done!\n",
 			port->port_num, tty, file);
 
-	wake_up(&port->close_wait);
 exit:
 	spin_unlock_irq(&port->port_lock);
 }
@@ -908,7 +896,40 @@ static int gs_get_icount(struct tty_struct *tty,
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
@@ -1203,6 +1224,15 @@ static void gs_console_exit(struct gs_port *port)
 
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
 static int
 gs_port_alloc(unsigned port_num, struct usb_cdc_line_coding *coding)
 {
@@ -1222,9 +1252,9 @@ gs_port_alloc(unsigned port_num, struct usb_cdc_line_coding *coding)
 	}
 
 	tty_port_init(&port->port);
+	port->port.ops = &gs_port_ops;
 	spin_lock_init(&port->port_lock);
 	init_waitqueue_head(&port->drain_wait);
-	init_waitqueue_head(&port->close_wait);
 
 	INIT_DELAYED_WORK(&port->push, gs_rx_push);
 
@@ -1241,25 +1271,11 @@ gs_port_alloc(unsigned port_num, struct usb_cdc_line_coding *coding)
 	return ret;
 }
 
-static int gs_closed(struct gs_port *port)
-{
-	int cond;
-
-	spin_lock_irq(&port->port_lock);
-	cond = port->port.count == 0;
-	spin_unlock_irq(&port->port_lock);
-
-	return cond;
-}
-
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
@@ -1276,8 +1292,8 @@ void gserial_free_line(unsigned char port_num)
 	ports[port_num].port = NULL;
 	mutex_unlock(&ports[port_num].lock);
 
-	gserial_free_port(port);
 	tty_unregister_device(gs_tty_driver, port_num);
+	gserial_free_port(port);
 }
 EXPORT_SYMBOL_GPL(gserial_free_line);
 
-- 
2.34.1

