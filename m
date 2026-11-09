Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794233508;
	b=NdETqaL+5uDuXRUJeIPSdpqBw4ncseNW3JcWReCQS4vTLw+ez5sqgyC867uHWT/3DlPU
	 1mQVuW/q0qXbhaDxyEsvl2ybF1Wwi2Ck5Y9zdvYELfzX4wDdBOZndkVPdaQv2zJ/69x9O
	 fmqpM2jTAlBdVOoETasAAN+oCqJ2b/OrfzfXkrsWo6xcLrVqBL5o3UN5PZH9qzIzmeRkJ
	 Xr7nQySwee4qe6fxVoZbdkPebjr+rUFcubbCMRdS1kyt1GxVzVv5IdelGpNHOawmObsZq
	 V9sHLyz2GC9E9R/yCrIGq0O6EB3qn1Gb6ZZxooXbR7vZB9vNcT++BYOKjr67TO/aL1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794233508;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3AfDa9PrmKFOUuLwYXr48+FwSVAThPKzPqwShk2NnLU=;
	b=KxmkRsH+qnVXcMomqoJ5rg0OHqtxqTLC8Pe+j1qAI25XoLr9JJurkY8rOKmrUdOy7S5G
	 PHGNkCuUkOvrnI1QcyAd9dtBgADiTRiShsdlZJzIZVfBxBGLg0YDaAgLtO6RzdALSOWMl
	 X05aBk7P2cCEtwMmmqLLtpAm2/S30p9YlSMv4fQQxSe8YJA+ZK9HKB4ovK0mMUy9FcgJG
	 3p5YruDoLRqyYqmUnAngZwNcq0RGj3qpC6xMW0qTPvy+rGuNbGVrgbsc70OSpb09m/5w5
	 KOVznrRdkJtRF90HrH2lbeJM58mu5xsx2WWpNdosy99vOXgPZxDLpERjnlnuABSRlzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fvunSNdO;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A43606EE99
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:11:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7A43606EE99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fvunSNdO
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so1536411eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 06:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794233507; x=1794838307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3AfDa9PrmKFOUuLwYXr48+FwSVAThPKzPqwShk2NnLU=;
        b=fvunSNdOWof62LwI8mk0lZVJWc/xyH/geslsGUaHejny8KpR6x9nME1aevP8HjJW+j
         1VTlQ+gp8hS0y031k+l06G07gUyvSMNy3S0nip9gtdIShDdZD7DRU7X557s8odlZaQMX
         QzrjomNFoZCYOcHk3fN4gWQdwd/6glWVDKNIkXw3Poll3Tty248SNkmrVP13HfBdG9A8
         8pSiue1dcN6ONRITiQFCxf5/zSJ+sBpcr7xWy4aBjRTrcBhLaVXuXSPdeKFZjxLTUAMS
         165pQQi03aop4LOvkH6L0ktPJZMkJ68QY+wVzGiddxJky1fVuXkUfgXbhYmUwsTF79ja
         7WhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794233507; x=1794838307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3AfDa9PrmKFOUuLwYXr48+FwSVAThPKzPqwShk2NnLU=;
        b=Jb2qpv7tNSrwmzffA0vtAQXiOoevW4EyGNoYvBPJBq+6psU8MMF2N3huE7zVXu6mMS
         +kIHmY79UnmozV7NJ903zcyD0fsCN+c6+45WdqhKP9urRD/qsaSf/EVCTwWVx89uFni3
         t82zgGnFizRBmms/KNbj1kOPCTmBQtp5KJewiB5B7uhTajbCjZKAfWhYqIckiVqkZpkG
         MQciPkLQ5ORUmFBDDyTHm0mufJxarAKffHTWSDmedoUyo+ou3QJ8EfEop/6Xh6M+teE5
         zvfOiv5WIX0q3anINXuBFXYrFGF1QTU5r3vMfeRzWOpYEfbfbhg0adXUrCy36be/5X6F
         2OAg==
X-Forwarded-Encrypted: i=1; AL+hErGvw5EsHB1SsyRSz7Hdi3Ua9hKDLtNd2GWe/jGhNy8tKalcAX9y7hvCIJUK4oJjQZEs5dNDCR+n++zp3bg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ogv76W2Ca7chHWHE4znonF0RlGPAgZ928jCXKpsxX2uBNNlDI
	EuK1TeNPOfWLf3AWeF92iqObdh4v6a5janwvRspi/3dfBrWu/dntMVzJ
X-Gm-Gg: AYBFou1tCM6hpRez4qKCEEb4nD2ShrnEZuSuRjYOBnEd/7dn+Fd2+3ZDJfVFm7We5OO
	PfO1BIqUWkcw5OfebgLVFtAmi5LHA6Y26919hXFEWPJiYm8jSCERDHRC2G0ySY1TEaUisdEAFVC
	feHIVFXTS3+qYlQOwc2jNyVfA1la+WHA0EOWTqqPS7SkM33wBB5XRHIE6tRcph1/1JKt0viQdfV
	lUfw1VehJiOtkJIG/S0z5J+4rGg+8/A5NGgg6PcmbEDYMITLOEw6cnHDu+TPhwxugt84E5XeK+k
	BvSJ/jSEY1B+Veu/O1yXvR1lHwwAyzaOm30caWpEvQCzhrGD9I0fSoxCCBexWhKGjiTSv6K99r3
	4zROf2EPA/drQpSKzBVY8kgieHIG3ghWTFWCzAAXxDkJUi+OsY6tPm1TxS5+Qr2h3CaXiXdqGIj
	eIGNMB5zyIhkiAHVgeAwq7dJTLYHNSf2dol77IpKpgRJaxN8ltTk0oh9i7qWPkV8RKV4KfmOdRa
	WaNYtepS1n+c6U2pB7n7ewsOc4ggipSZh1OuDfgGHKqenDuVuVPQ9Eatgvwi5l2yZl1dhC8TuEh
	/jDwZg4RNaEgE9Qdoca8288ms/ukxz1f5SliKc9WEMuzc3ll1Dcv7AOO2ZtS5wK/1ZDmfGOOmd1
	UW20EnATwgLdtzEgdhi6PDUpULcbaLce7
X-Received: by 2002:a05:7301:c83:b0:35e:2c6:d46c with SMTP id 5a478bee46e88-372566144c7mr6838219eec.10.1794233506564;
        Mon, 09 Nov 2026 06:11:46 -0800 (PST)
Received: from localhost.localdomain ([103.71.17.60])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265a16c49sm12727082eec.10.2026.11.09.06.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:11:46 -0800 (PST)
From: Varun Singh <varun.singh10011@gmail.com>
To: nkapron@google.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bigeasy@linutronix.de,
	syzbot+39a2135de1558208d3b3@syzkaller.appspotmail.com,
	Varun Singh <varun.singh10011@gmail.com>
Subject: [PATCH v3 2/2] usb: gadget: u_serial: fix gs_port use-after-free on open/unbind race
Date: Mon,  9 Nov 2026 19:41:10 +0530
Message-Id: <20261109141110.3538-3-varun.singh10011@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261109141110.3538-1-varun.singh10011@gmail.com>
References: <20261109141110.3538-1-varun.singh10011@gmail.com>
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

syzbot reports a use-after-free when a gadget serial function is removed
through configfs while /dev/ttyGS* is being opened:

  BUG: KASAN: slab-use-after-free in check_tty_count+0x134/0x2b0
   tty_release+0x95/0x1300 drivers/tty/tty_io.c:1728

gs_port embeds a tty_port, which the TTY core stores in tty->port without
taking a reference, so the driver must keep it alive. u_serial instead
waited for port.count to reach zero in gserial_free_port() and then freed
the port. That never worked: once gserial_free_line() has cleared the
ports[] slot, gs_open() returns -ENODEV without incrementing the count, so
the wait completes immediately, the port is freed, and tty_release() reads
it.

Use the tty_port kref. gs_install() runs before the core publishes
tty->port, so it looks the port up under ports[].lock, takes a reference
and stores it in tty->driver_data; .cleanup drops it, .destruct frees the
port, and gserial_free_port() drops the allocation reference rather than
calling kfree().

The close_wait/gs_closed() handshake is then redundant, and once the count
is correct it blocks rmdir until userspace closes /dev/ttyGS*, which syzbot
saw as a hung task, so drop it. Keep cancel_delayed_work_sync(): cancelling
from .destruct instead leaves a use-after-free in the work cancellation
path.

Without the handshake a line can be freed and reallocated while an old
tty_struct is still in gs_tty_driver->ttys[], which only release_tty()
clears. A new open would find it via tty_driver_lookup_tty(), take
tty_reopen() instead of gs_install(), and run gs_open() against the
orphaned port. So gserial_free_line() now hangs up any tty still on the
line, as usb_serial_disconnect() does, and gs_open() rechecks that
tty->driver_data is still the port registered for the line.

gs_close() also no longer warns on a zero port.count: tty->driver_data is
now set before gs_open() runs, so tty_release() legitimately calls
->close() with a zero count after a failed open.

Reproduce by racing repeated open() of /dev/ttyGS0 against rmdir of a
u_serial gadget function, with some opens held so they overlap. An
unpatched KASAN kernel reports the use-after-free within a few thousand
rounds.

Found with the assistance of Claude Opus 5.

Fixes: 19b10a8828a6 ("usb: gadget: allocate & giveback serial ports instead hard code them")
Reported-by: syzbot+39a2135de1558208d3b3@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=39a2135de1558208d3b3
Tested-by: syzbot+39a2135de1558208d3b3@syzkaller.appspotmail.com
Signed-off-by: Varun Singh <varun.singh10011@gmail.com>
---
 drivers/usb/gadget/function/u_serial.c | 80 ++++++++++++++++++--------
 1 file changed, 56 insertions(+), 24 deletions(-)

diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
index e172050f1392..f279a2c6507c 100644
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
@@ -615,8 +614,9 @@ static int gs_open(struct tty_struct *tty, struct file *file)
 	int		status = 0;
 
 	mutex_lock(&ports[port_num].lock);
+	/* Reject opens on a removed port, or a stale tty after line reuse. */
 	port = ports[port_num].port;
-	if (!port) {
+	if (!port || port != tty->driver_data) {
 		status = -ENODEV;
 		goto out;
 	}
@@ -648,7 +648,6 @@ static int gs_open(struct tty_struct *tty, struct file *file)
 	if (port->port.count++)
 		goto exit_unlock_port;
 
-	tty->driver_data = port;
 	port->port.tty = tty;
 
 	/* if connected, start the I/O stream */
@@ -693,15 +692,14 @@ static int gs_close_flush_done(struct gs_port *p)
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
+		/* A failed open can still reach ->close() with a zero count. */
+		if (port->port.count)
 			--port->port.count;
 		goto exit;
 	}
@@ -744,7 +742,6 @@ static void gs_close(struct tty_struct *tty, struct file *file)
 	pr_debug("gs_close: ttyGS%d (%p,%p) done!\n",
 			port->port_num, tty, file);
 
-	wake_up(&port->close_wait);
 exit:
 	spin_unlock_irq(&port->port_lock);
 }
@@ -908,7 +905,40 @@ static int gs_get_icount(struct tty_struct *tty,
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
@@ -1203,6 +1233,15 @@ static void gs_console_exit(struct gs_port *port)
 
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
 /* Caller must hold ports[port_num].lock. */
 static int
 gs_port_alloc(unsigned port_num, struct usb_cdc_line_coding *coding)
@@ -1217,9 +1256,9 @@ gs_port_alloc(unsigned port_num, struct usb_cdc_line_coding *coding)
 		return -ENOMEM;
 
 	tty_port_init(&port->port);
+	port->port.ops = &gs_port_ops;
 	spin_lock_init(&port->port_lock);
 	init_waitqueue_head(&port->drain_wait);
-	init_waitqueue_head(&port->close_wait);
 
 	INIT_DELAYED_WORK(&port->push, gs_rx_push);
 
@@ -1235,25 +1274,11 @@ gs_port_alloc(unsigned port_num, struct usb_cdc_line_coding *coding)
 	return 0;
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
@@ -1277,6 +1302,13 @@ void gserial_free_line(unsigned char port_num)
 	tty_unregister_device(gs_tty_driver, port_num);
 	mutex_unlock(&ports[port_num].lock);
 
+	/*
+	 * Hang up the tty before the line can be reused. Drop
+	 * ports[port_num].lock first: it takes tty_lock, which gs_install()
+	 * already holds when it acquires that mutex.
+	 */
+	tty_port_tty_vhangup(&port->port);
+
 	gserial_free_port(port);
 }
 EXPORT_SYMBOL_GPL(gserial_free_line);
-- 
2.34.1

