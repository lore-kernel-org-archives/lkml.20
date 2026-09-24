Received: from sonata.ens-lyon.org (sonata.ens-lyon.org [140.77.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96161207A20
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 23:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.77.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790293492; cv=none; b=gVGKa/LSGc1wVyaOgltemIaFEt4Z8H4/4tt50sKOU8/6d3Gt+K8kF/Sen5NKUQqwODYl8K8EArRlsMNdZTQx2qZT7Bs8HUerR6HYOV23EUqc24KJSKaKsurIGp2vXnyt0HoC2ZClJ3cFPXOLvxh331DdmBRJWJ+jC5KDUXcZm5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790293492; c=relaxed/simple;
	bh=G2d4QcB6YfU4Zr50WO35/9tq6gdr7ZpW/DeC11rLVgM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qa00bQijWtYH6pyNs8BGVw7lez9y4O5mvjkVS1Hhn1RkyJ97dDPX6G2w4eTTwM+/Kr/l/kAGWqP+rnXDHp1Dh+77saSylyIQAOnHepADBSCQSfbXsWjDhHUoCTgopyLa1S1DksddULimeih4hrs4hEKwlvJqjzubF/H+HWYi/q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ens-lyon.org; spf=pass smtp.mailfrom=bounce.ens-lyon.org; dkim=pass (2048-bit key) header.d=ens-lyon.org header.i=@ens-lyon.org header.b=OAwnGeg/; dkim=pass (2048-bit key) header.d=ens-lyon.org header.i=@ens-lyon.org header.b=OAwnGeg/; arc=none smtp.client-ip=140.77.166.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ens-lyon.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bounce.ens-lyon.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ens-lyon.org header.i=@ens-lyon.org header.b="OAwnGeg/";
	dkim=pass (2048-bit key) header.d=ens-lyon.org header.i=@ens-lyon.org header.b="OAwnGeg/"
Received: from localhost (localhost [127.0.0.1])
	by sonata.ens-lyon.org (Postfix) with ESMTP id 6F74BA48BD;
	Fri, 25 Sep 2026 01:44:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ens-lyon.org; s=dkim;
	t=1790293482; bh=G2d4QcB6YfU4Zr50WO35/9tq6gdr7ZpW/DeC11rLVgM=;
	h=From:To:Cc:Subject:Date:From;
	b=OAwnGeg/h06b4RfAQb3rrrLkxGffXZZhPrP83wLIeZ7OBbfGP5b5P0TyzXzHU1IIf
	 6oGW2G4ps66v+WU2K7VhQrCCC0qeD27l2Cmta8GJhyas6gmyfiOb8Kmh3cDTKN9W2o
	 Fw4jZ9xqrASH7Gz8AdFUZhRJFZ9M9kHzZApG4m6HWupQyFpbJvGvJKZtjclm7bLOea
	 UMCtkDinEPCjYER4QfD5CDfyTNADYtvIbQYwkGU3hOyNpzGUVhDllX7ZGZWAvNqltC
	 8YlK5BDMH/yZ+RQZ7ZN/KCmAB7FwHfApYb7I0EKYPpyUi00Mg2yxTJoV83dLJHn3bI
	 60nDbXuwA45ng==
Received: from sonata.ens-lyon.org ([127.0.0.1])
	by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VbIIu35lnJSq; Fri, 25 Sep 2026 01:44:42 +0200 (CEST)
Received: from end (lfbn-bor-1-980-210.w90-120.abo.wanadoo.fr [90.120.173.210])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by sonata.ens-lyon.org (Postfix) with ESMTPSA id CDA74A485D;
	Fri, 25 Sep 2026 01:44:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ens-lyon.org; s=dkim;
	t=1790293482; bh=G2d4QcB6YfU4Zr50WO35/9tq6gdr7ZpW/DeC11rLVgM=;
	h=From:To:Cc:Subject:Date:From;
	b=OAwnGeg/h06b4RfAQb3rrrLkxGffXZZhPrP83wLIeZ7OBbfGP5b5P0TyzXzHU1IIf
	 6oGW2G4ps66v+WU2K7VhQrCCC0qeD27l2Cmta8GJhyas6gmyfiOb8Kmh3cDTKN9W2o
	 Fw4jZ9xqrASH7Gz8AdFUZhRJFZ9M9kHzZApG4m6HWupQyFpbJvGvJKZtjclm7bLOea
	 UMCtkDinEPCjYER4QfD5CDfyTNADYtvIbQYwkGU3hOyNpzGUVhDllX7ZGZWAvNqltC
	 8YlK5BDMH/yZ+RQZ7ZN/KCmAB7FwHfApYb7I0EKYPpyUi00Mg2yxTJoV83dLJHn3bI
	 60nDbXuwA45ng==
Received: from samy by end with local (Exim 4.100)
	(envelope-from <samuel.thibault@ens-lyon.org>)
	id 1x9t7J-000000001Id-0Who;
	Fri, 25 Sep 2026 01:44:41 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: gregkh@linuxfoundation.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	w.d.hubbs@gmail.com,
	chris@the-brannons.com,
	kirk@reisers.ca,
	speakup@linux-speakup.org,
	linux-kernel@vger.kernel.org
Subject: [PATCHv2] speakup: Drop now-unused serialio operations
Date: Fri, 25 Sep 2026 01:44:39 +0200
Message-ID: <20260924234439.4991-1-samuel.thibault@ens-lyon.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The only users of serialio (acntpc, decpc, dtlk, keypc) don't actually
define a read_buff_add method, so start_stop_serial_interrupt were not doing
anything. The other functions were not referenced at all any more since
bbe6fb5b96bd ("staging: speakup: migrate bns to tty")

Signed-off-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
---

Difference with v1:
- Remove rs_table and serstate
- Remove SERIAL_PORT_DFNS
- Remove struct old_serial_port and related macros

 drivers/accessibility/speakup/serialio.c      | 193 +-----------------
 drivers/accessibility/speakup/serialio.h      |  17 --
 .../accessibility/speakup/speakup_acntpc.c    |   1 -
 drivers/accessibility/speakup/speakup_decpc.c |   1 -
 drivers/accessibility/speakup/speakup_dtlk.c  |   1 -
 drivers/accessibility/speakup/speakup_keypc.c |   1 -
 drivers/accessibility/speakup/spk_priv.h      |   6 -
 7 files changed, 1 insertion(+), 219 deletions(-)

diff --git a/drivers/accessibility/speakup/serialio.c b/drivers/accessibility/speakup/serialio.c
index 3418ea31d28f..c344296be9f6 100644
--- a/drivers/accessibility/speakup/serialio.c
+++ b/drivers/accessibility/speakup/serialio.c
@@ -8,22 +8,8 @@
 #include "serialio.h"
 
 #include <linux/serial_core.h>
-/* WARNING:  Do not change this to <linux/serial.h> without testing that
- * SERIAL_PORT_DFNS does get defined to the appropriate value.
- */
-#include <asm/serial.h>
+#include <linux/serial.h>
 
-#ifndef SERIAL_PORT_DFNS
-#define SERIAL_PORT_DFNS
-#endif
-
-static void start_serial_interrupt(int irq);
-
-static const struct old_serial_port rs_table[] = {
-	SERIAL_PORT_DFNS
-};
-
-static const struct old_serial_port *serstate;
 static int timeouts;
 
 static int spk_serial_out(struct spk_synth *in_synth, const char ch);
@@ -45,111 +31,6 @@ struct spk_io_ops spk_serial_io_ops = {
 };
 EXPORT_SYMBOL_GPL(spk_serial_io_ops);
 
-const struct old_serial_port *spk_serial_init(int index)
-{
-	int baud = 9600, quot = 0;
-	unsigned int cval = 0;
-	int cflag = CREAD | HUPCL | CLOCAL | B9600 | CS8;
-	const struct old_serial_port *ser;
-	int err;
-
-	if (index >= ARRAY_SIZE(rs_table)) {
-		pr_info("no port info for ttyS%d\n", index);
-		return NULL;
-	}
-	ser = rs_table + index;
-
-	/*	Divisor, byte size and parity */
-	quot = ser->baud_base / baud;
-	cval = cflag & (CSIZE | CSTOPB);
-#if defined(__powerpc__) || defined(__alpha__)
-	cval >>= 8;
-#else /* !__powerpc__ && !__alpha__ */
-	cval >>= 4;
-#endif /* !__powerpc__ && !__alpha__ */
-	if (cflag & PARENB)
-		cval |= UART_LCR_PARITY;
-	if (!(cflag & PARODD))
-		cval |= UART_LCR_EPAR;
-	if (synth_request_region(ser->port, 8)) {
-		/* try to take it back. */
-		pr_info("Ports not available, trying to steal them\n");
-		__release_region(&ioport_resource, ser->port, 8);
-		err = synth_request_region(ser->port, 8);
-		if (err) {
-			pr_warn("Unable to allocate port at %x, errno %i",
-				ser->port, err);
-			return NULL;
-		}
-	}
-
-	/*	Disable UART interrupts, set DTR and RTS high
-	 *	and set speed.
-	 */
-	outb(cval | UART_LCR_DLAB, ser->port + UART_LCR);	/* set DLAB */
-	outb(quot & 0xff, ser->port + UART_DLL);	/* LS of divisor */
-	outb(quot >> 8, ser->port + UART_DLM);		/* MS of divisor */
-	outb(cval, ser->port + UART_LCR);		/* reset DLAB */
-
-	/* Turn off Interrupts */
-	outb(0, ser->port + UART_IER);
-	outb(UART_MCR_DTR | UART_MCR_RTS, ser->port + UART_MCR);
-
-	/* If we read 0xff from the LSR, there is no UART here. */
-	if (inb(ser->port + UART_LSR) == 0xff) {
-		synth_release_region(ser->port, 8);
-		serstate = NULL;
-		return NULL;
-	}
-
-	mdelay(1);
-	speakup_info.port_tts = ser->port;
-	serstate = ser;
-
-	start_serial_interrupt(ser->irq);
-
-	return ser;
-}
-
-static irqreturn_t synth_readbuf_handler(int irq, void *dev_id)
-{
-	unsigned long flags;
-	int c;
-
-	spin_lock_irqsave(&speakup_info.spinlock, flags);
-	while (inb_p(speakup_info.port_tts + UART_LSR) & UART_LSR_DR) {
-		c = inb_p(speakup_info.port_tts + UART_RX);
-		synth->read_buff_add((u_char)c);
-	}
-	spin_unlock_irqrestore(&speakup_info.spinlock, flags);
-	return IRQ_HANDLED;
-}
-
-static void start_serial_interrupt(int irq)
-{
-	int rv;
-
-	if (!synth->read_buff_add)
-		return;
-
-	rv = request_irq(irq, synth_readbuf_handler, IRQF_SHARED,
-			 "serial", (void *)synth_readbuf_handler);
-
-	if (rv)
-		pr_err("Unable to request Speakup serial I R Q\n");
-	/* Set MCR */
-	outb(UART_MCR_DTR | UART_MCR_RTS | UART_MCR_OUT2,
-	     speakup_info.port_tts + UART_MCR);
-	/* Turn on Interrupts */
-	outb(UART_IER_MSI | UART_IER_RLSI | UART_IER_RDI,
-	     speakup_info.port_tts + UART_IER);
-	inb(speakup_info.port_tts + UART_LSR);
-	inb(speakup_info.port_tts + UART_RX);
-	inb(speakup_info.port_tts + UART_IIR);
-	inb(speakup_info.port_tts + UART_MSR);
-	outb(1, speakup_info.port_tts + UART_FCR);	/* Turn FIFO On */
-}
-
 static void spk_serial_send_xchar(struct spk_synth *synth, char ch)
 {
 	int timeout = SPK_XMITR_TIMEOUT;
@@ -169,50 +50,6 @@ static void spk_serial_tiocmset(struct spk_synth *in_synth, unsigned int set, un
 	outb((old & ~clear) | set, speakup_info.port_tts + UART_MCR);
 }
 
-int spk_serial_synth_probe(struct spk_synth *synth)
-{
-	const struct old_serial_port *ser;
-	int failed = 0;
-
-	if ((synth->ser >= SPK_LO_TTY) && (synth->ser <= SPK_HI_TTY)) {
-		ser = spk_serial_init(synth->ser);
-		if (!ser) {
-			failed = -1;
-		} else {
-			outb_p(0, ser->port);
-			mdelay(1);
-			outb_p('\r', ser->port);
-		}
-	} else {
-		failed = -1;
-		pr_warn("ttyS%i is an invalid port\n", synth->ser);
-	}
-	if (failed) {
-		pr_info("%s: not found\n", synth->long_name);
-		return -ENODEV;
-	}
-	pr_info("%s: ttyS%i, Driver Version %s\n",
-		synth->long_name, synth->ser, synth->version);
-	synth->alive = 1;
-	return 0;
-}
-EXPORT_SYMBOL_GPL(spk_serial_synth_probe);
-
-void spk_stop_serial_interrupt(void)
-{
-	if (speakup_info.port_tts == 0)
-		return;
-
-	if (!synth->read_buff_add)
-		return;
-
-	/* Turn off interrupts */
-	outb(0, speakup_info.port_tts + UART_IER);
-	/* Free IRQ */
-	free_irq(serstate->irq, (void *)synth_readbuf_handler);
-}
-EXPORT_SYMBOL_GPL(spk_stop_serial_interrupt);
-
 static int spk_serial_wait_for_xmitr(struct spk_synth *in_synth)
 {
 	int tmout = SPK_XMITR_TIMEOUT;
@@ -288,31 +125,3 @@ static int spk_serial_out(struct spk_synth *in_synth, const char ch)
 	}
 	return 0;
 }
-
-const char *spk_serial_synth_immediate(struct spk_synth *synth,
-				       const char *buff)
-{
-	u_char ch;
-
-	while ((ch = *buff)) {
-		if (ch == '\n')
-			ch = synth->procspeech;
-		if (spk_serial_wait_for_xmitr(synth))
-			outb(ch, speakup_info.port_tts);
-		else
-			return buff;
-		buff++;
-	}
-	return NULL;
-}
-EXPORT_SYMBOL_GPL(spk_serial_synth_immediate);
-
-void spk_serial_release(struct spk_synth *synth)
-{
-	spk_stop_serial_interrupt();
-	if (speakup_info.port_tts == 0)
-		return;
-	synth_release_region(speakup_info.port_tts, 8);
-	speakup_info.port_tts = 0;
-}
-EXPORT_SYMBOL_GPL(spk_serial_release);
diff --git a/drivers/accessibility/speakup/serialio.h b/drivers/accessibility/speakup/serialio.h
index b4f9a1925b81..189c0dd9ce41 100644
--- a/drivers/accessibility/speakup/serialio.h
+++ b/drivers/accessibility/speakup/serialio.h
@@ -8,31 +8,14 @@
 
 #include "spk_priv.h"
 
-/*
- * this is cut&paste from 8250.h. Get rid of the structure, the definitions
- * and this whole broken driver.
- */
-struct old_serial_port {
-	unsigned int uart; /* unused */
-	unsigned int baud_base;
-	unsigned int port;
-	unsigned int irq;
-	upf_t flags; /* unused */
-};
-
 /* countdown values for serial timeouts in us */
 #define SPK_SERIAL_TIMEOUT SPK_SYNTH_TIMEOUT
 /* countdown values transmitter/dsr timeouts in us */
 #define SPK_XMITR_TIMEOUT 100000
 /* countdown values cts timeouts in us */
 #define SPK_CTS_TIMEOUT 100000
-/* check ttyS0 ... ttyS3 */
-#define SPK_LO_TTY 0
-#define SPK_HI_TTY 3
 /* # of timeouts permitted before disable */
 #define NUM_DISABLE_TIMEOUTS 3
-/* buffer timeout in ms */
-#define SPK_TIMEOUT 100
 
 #define spk_serial_tx_busy() \
 	(!uart_lsr_tx_empty(inb(speakup_info.port_tts + UART_LSR)))
diff --git a/drivers/accessibility/speakup/speakup_acntpc.c b/drivers/accessibility/speakup/speakup_acntpc.c
index a27e6bbf05da..1cc6147cafac 100644
--- a/drivers/accessibility/speakup/speakup_acntpc.c
+++ b/drivers/accessibility/speakup/speakup_acntpc.c
@@ -305,7 +305,6 @@ static int synth_probe(struct spk_synth *synth)
 
 static void accent_release(struct spk_synth *synth)
 {
-	spk_stop_serial_interrupt();
 	if (speakup_info.port_tts)
 		synth_release_region(speakup_info.port_tts - 1,
 				     SYNTH_IO_EXTENT);
diff --git a/drivers/accessibility/speakup/speakup_decpc.c b/drivers/accessibility/speakup/speakup_decpc.c
index 1bf36d1e5477..4837cac8bafa 100644
--- a/drivers/accessibility/speakup/speakup_decpc.c
+++ b/drivers/accessibility/speakup/speakup_decpc.c
@@ -487,7 +487,6 @@ static int synth_probe(struct spk_synth *synth)
 
 static void dtpc_release(struct spk_synth *synth)
 {
-	spk_stop_serial_interrupt();
 	if (speakup_info.port_tts)
 		synth_release_region(speakup_info.port_tts, SYNTH_IO_EXTENT);
 	speakup_info.port_tts = 0;
diff --git a/drivers/accessibility/speakup/speakup_dtlk.c b/drivers/accessibility/speakup/speakup_dtlk.c
index fa826568937b..0a57f7ea894c 100644
--- a/drivers/accessibility/speakup/speakup_dtlk.c
+++ b/drivers/accessibility/speakup/speakup_dtlk.c
@@ -377,7 +377,6 @@ static int synth_probe(struct spk_synth *synth)
 
 static void dtlk_release(struct spk_synth *synth)
 {
-	spk_stop_serial_interrupt();
 	if (speakup_info.port_tts)
 		synth_release_region(speakup_info.port_tts - 1,
 				     SYNTH_IO_EXTENT);
diff --git a/drivers/accessibility/speakup/speakup_keypc.c b/drivers/accessibility/speakup/speakup_keypc.c
index 9356f6379560..1e2edc5c4b8b 100644
--- a/drivers/accessibility/speakup/speakup_keypc.c
+++ b/drivers/accessibility/speakup/speakup_keypc.c
@@ -306,7 +306,6 @@ static int synth_probe(struct spk_synth *synth)
 
 static void keynote_release(struct spk_synth *synth)
 {
-	spk_stop_serial_interrupt();
 	if (synth_port)
 		synth_release_region(synth_port, SYNTH_IO_EXTENT);
 	synth_port = 0;
diff --git a/drivers/accessibility/speakup/spk_priv.h b/drivers/accessibility/speakup/spk_priv.h
index 9da57ead17cb..704ff9f120d3 100644
--- a/drivers/accessibility/speakup/spk_priv.h
+++ b/drivers/accessibility/speakup/spk_priv.h
@@ -32,9 +32,6 @@
 #define SYNTH_DEFAULT_DEV "ttyS0"
 #define SYNTH_DEFAULT_SER 0
 
-const struct old_serial_port *spk_serial_init(int index);
-void spk_stop_serial_interrupt(void);
-void spk_serial_release(struct spk_synth *synth);
 void spk_ttyio_release(struct spk_synth *synth);
 void spk_ttyio_register_ldisc(void);
 void spk_ttyio_unregister_ldisc(void);
@@ -49,10 +46,7 @@ ssize_t spk_var_show(struct kobject *kobj, struct kobj_attribute *attr,
 ssize_t spk_var_store(struct kobject *kobj, struct kobj_attribute *attr,
 		      const char *buf, size_t count);
 
-int spk_serial_synth_probe(struct spk_synth *synth);
 int spk_ttyio_synth_probe(struct spk_synth *synth);
-const char *spk_serial_synth_immediate(struct spk_synth *synth,
-				       const char *buff);
 const char *spk_ttyio_synth_immediate(struct spk_synth *synth,
 				      const char *buff);
 void spk_do_catch_up(struct spk_synth *synth);
-- 
2.47.3

