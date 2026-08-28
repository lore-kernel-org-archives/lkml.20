Received: from mail-vk1-f228.google.com (mail-vk1-f228.google.com [209.85.221.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C1C332EAE
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 14:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787928420; cv=none; b=Bhi5QaMt/DGFvyncAj1N3y9f7HmaZtzoN4ljHhINdqa9EmHTfGltu//jEfVvcp88VMFZ6qmCj796aaPSG7POo4VSwEeAYcou+t3XSx6biK/959PrHxqEqT2l+5692vseG/Pip7FN8hC+ThgXXnDNLIkVKhBouKVwubws16MtRhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787928420; c=relaxed/simple;
	bh=PyMFn68RRIN3IzGpKysy1B9f4xHkGdvkvFc5FOvKIBI=;
	h=From:To:Cc:Subject:Date:Message-ID; b=H6O4OIYJmIfArH2ei5QUhVf6MaN9vcrz0ziTf8QE81a4KlXYj/vEg0pU7m3IukmjBe627p4u0b2kXulO70Kd2QHCNhp999xjx8Gd1S39eeCFy4ZhjgMP7+RwH0VKOOA0Pw7grTssnXnIEv0M22UDQzPPg2F3qAB2zJ6FAGIWo6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com; spf=pass smtp.mailfrom=arista.com; dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b=EN5ec2xj; arc=none smtp.client-ip=209.85.221.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b="EN5ec2xj"
Received: by mail-vk1-f228.google.com with SMTP id 71dfb90a1353d-5c7991578c2so73659e0c.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 07:46:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787928418; x=1788533218;
        h=content-transfer-encoding:message-id:date:subject:cc:to:from
         :dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YA8nPi3ueKnPwe6mZk4m/RrVVcVGq0t5B55x+7fBTtQ=;
        b=OoIBOP9Lm9JyzTt2F/vglNqFqoOfipRl7gwOAASnIS95uVCjXBYoDztbZiWPFHLNf7
         lPIdRiAGzauTUU36+p6wkdXAyyQqBLpFfEqpgLrLU8uPyQnleBHiYp7GroJR1U9Khwdm
         GI3wui0JgS1jrYbRrKSV44jCON+mimczqvBkZ8K2x6IYsxbWMkzBz+vYshRSKWl0GNSb
         uMFCOR9xStMtBVUzFxzPUk+ErQUSH2HQFWANhbGyKJEDh0+hD/p/7G89GuEKjRuxVOXQ
         E/H8YbQj0OfLIQeDfbnLPNO+3vC9cZmX4iTe9c+1YZP1GO9Lt97xjR02euW3LXcOINhX
         XbFA==
X-Forwarded-Encrypted: i=1; AHgh+RqjwVqZfd6wlDZ3AVhu7LE7hIkb6GuYpIvY7wgUAqusVETY00RryXJXhccQAxXmPeqccR6L7o0vMmiFT6M=@vger.kernel.org
X-Gm-Message-State: AFuF++mw5eVI5WYOQjLOz55ayG2VjCcvueyy0hV3V+8593zMK4GosaZX
	uZ5+ViVUUUu0AcY5MP1mR2tFa/xmU5gjRXlUh5vl7Et9kdBhnRv1C5A1vJ8DxgPsOitfjdAMPHr
	Kfo0oxup0KKLNBOqqbelhDf7rlTjgiO/Dog==
X-Gm-Gg: AR+sD13z/zKRPNgLX6P4tUU3rtEAIAHOh0LwJiB2dXnuKLqM9A8xI5/v/kUZ7yAOV33
	tANWZdHbUbs0fVx9TXBVoOQwm2oShb4pTMbQXSJuoKxPrnAdT13DnKmH1XMI4L/DOQn2zqxd0Fl
	h3ACdmlLY01O296INKQGqN46paXUJbbFL+1YC3O+jeIk4r5bRb32WgwRKeTRXZpDFonAnIkDwZd
	NsEmKxEd3yCptYuS/JUkMcv8Kp5XuaeUx80mrFOCODdgGcu2GK0dXNFTiMK/yZp33tazCbjEX62
	lA/Mwli3fe4Y+C4aTx3NHMfotXh1iuiq1kk5bjt1D329Qi0nJy6InBnP5j3i3JxDefv2NDMMRka
	oSWHwOjMK5KDVlOHnMhQn4Q3QlrnPM7SA06E=
X-Received: by 2002:a05:6102:2907:b0:782:de7b:eead with SMTP id ada2fe7eead31-785962b3b4fmr2012595137.1.1787928418039;
        Fri, 28 Aug 2026 07:46:58 -0700 (PDT)
Received: from smtp.aristanetworks.com (mx1.aristanetworks.com. [74.123.28.25])
        by smtp-relay.gmail.com with ESMTPS id ada2fe7eead31-785f800dbd3sm28652137.17.2026.08.28.07.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 07:46:58 -0700 (PDT)
X-Relaying-Domain: arista.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arista.com;
	s=Arista-A; t=1787928417;
	bh=YA8nPi3ueKnPwe6mZk4m/RrVVcVGq0t5B55x+7fBTtQ=;
	h=From:To:Cc:Subject:Date:From;
	b=EN5ec2xjEDQzo5TUwvsImgohFuK2Ucq51bvpqk5Ichgg9ZdWA+bfElliISOYYeY87
	 JdMvH5TkgUgl+vCrQSimMFgYY6cW5rVlKUdA0wK6qhwU+/21sIPmEbgmBhDAu2eS3A
	 iGEWBtiMsn9ARvnwbubsmopAfOV2yGVn2waBVZMGnF4waUOZaxmvqvkK6Z451wB+ET
	 4gy6/SH2Kpwro4Woi37KpBUkaGuBZoOmqUcUDCpn/38dpIBJ0x9yTGZUmQRd1uLz0j
	 WC2BUcnVI9wRAwogxR/j/eduSwbDzf0+AQ8JVvDSvQ+fr5sgH/agqeOrHMx3c82D7v
	 t9VK2pj06Z0ig==
Received: from vm-whiteberg-ubuntu.aristanetworks.com (dhcp-244-90-77.sjc.aristanetworks.com [10.244.90.77])
	by smtp.aristanetworks.com (Postfix) with ESMTPS id 260B31003C7;
	Fri, 28 Aug 2026 14:46:57 +0000 (UTC)
X-SMTP-Authentication: Allow-List-permitted
X-SMTP-Authentication: Allow-List-permitted
From: Tate Whiteberg <whiteberg@arista.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Andy Shevchenko <andy@kernel.org>
Cc: Tate Whiteberg <whiteberg@arista.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH] serial: 8250_mid: wait for LSR tx empty before setting termios
Date: Fri, 28 Aug 2026 14:45:17 +0000
Message-ID: <20260828144617.1210599-2-whiteberg@arista.com>
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

If mid8250_set_termios is called while data is still in transmission,
the corresponding register updates will corrupt the transmission.

Fix this by locking the port and and waiting for the transmitter to
empty before performing updates. It is necessary to wait for both
UART_LSR_THRE and UART_LSR_TEMT to ensure the final character is sent.

Signed-off-by: Tate Whiteberg <whiteberg@arista.com>
---
 drivers/tty/serial/8250/8250.h      |  1 +
 drivers/tty/serial/8250/8250_mid.c  |  5 +++++
 drivers/tty/serial/8250/8250_port.c | 13 +++++++------
 3 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/tty/serial/8250/8250.h b/drivers/tty/serial/8250/8250.h
index 9337fec9394e..f99620b1cab7 100644
--- a/drivers/tty/serial/8250/8250.h
+++ b/drivers/tty/serial/8250/8250.h
@@ -180,6 +180,7 @@ void serial8250_clear_and_reinit_fifos(struct uart_8250_port *p);
 void serial8250_fifo_wait_for_lsr_thre(struct uart_8250_port *up,
 				       struct nbcon_write_context *wctxt,
 				       unsigned int count);
+void serial8250_wait_for_xmitr(struct uart_8250_port *up, int bits);
 
 void serial8250_rpm_get(struct uart_8250_port *p);
 void serial8250_rpm_put(struct uart_8250_port *p);
diff --git a/drivers/tty/serial/8250/8250_mid.c b/drivers/tty/serial/8250/8250_mid.c
index 82656645b8a6..c77e117b7822 100644
--- a/drivers/tty/serial/8250/8250_mid.c
+++ b/drivers/tty/serial/8250/8250_mid.c
@@ -210,6 +210,7 @@ static void mid8250_set_termios(struct uart_port *p, struct ktermios *termios,
 {
 	unsigned int baud = tty_termios_baud_rate(termios);
 	struct mid8250 *mid = p->private_data;
+	struct uart_8250_port *up = up_to_u8250p(p);
 	unsigned short ps = 16;
 	unsigned long fuart = baud * ps;
 	unsigned long w = BIT(24) - 1;
@@ -218,6 +219,7 @@ static void mid8250_set_termios(struct uart_port *p, struct ktermios *termios,
 	/* Gracefully handle the B0 case: fall back to B9600 */
 	fuart = fuart ? fuart : 9600 * 16;
 
+	uart_port_lock_irq(p);
 	if (mid->board->freq < fuart) {
 		/* Find prescaler value that satisfies Fuart < Fref */
 		if (mid->board->freq > baud)
@@ -231,11 +233,14 @@ static void mid8250_set_termios(struct uart_port *p, struct ktermios *termios,
 	}
 
 	rational_best_approximation(fuart, mid->board->freq, w, w, &mul, &div);
+
+	serial8250_wait_for_xmitr(up, UART_LSR_BOTH_EMPTY);
 	p->uartclk = fuart * 16 / ps;		/* core uses ps = 16 always */
 
 	writel(ps, p->membase + INTEL_MID_UART_PS);		/* set PS */
 	writel(mul, p->membase + INTEL_MID_UART_MUL);		/* set MUL */
 	writel(div, p->membase + INTEL_MID_UART_DIV);
+	uart_port_unlock_irq(p);
 
 	serial8250_do_set_termios(p, termios, old);
 }
diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
index 38fa45e74a37..4eaf417f1fd7 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -2024,7 +2024,7 @@ static bool wait_for_lsr(struct uart_8250_port *up, int bits)
 }
 
 /* Wait for transmitter and holding register to empty with timeout */
-static void wait_for_xmitr(struct uart_8250_port *up, int bits)
+void serial8250_wait_for_xmitr(struct uart_8250_port *up, int bits)
 {
 	unsigned int tmout;
 	bool tx_ready;
@@ -2052,6 +2052,7 @@ static void wait_for_xmitr(struct uart_8250_port *up, int bits)
 		}
 	}
 }
+EXPORT_SYMBOL_NS_GPL(serial8250_wait_for_xmitr, "SERIAL_8250");
 
 #ifdef CONFIG_CONSOLE_POLL
 /*
@@ -2098,7 +2099,7 @@ static void serial8250_put_poll_char(struct uart_port *port,
 	ier = serial_port_in(port, UART_IER);
 	__serial8250_clear_IER(up);
 
-	wait_for_xmitr(up, UART_LSR_BOTH_EMPTY);
+	serial8250_wait_for_xmitr(up, UART_LSR_BOTH_EMPTY);
 	/*
 	 *	Send the character out.
 	 */
@@ -2108,7 +2109,7 @@ static void serial8250_put_poll_char(struct uart_port *port,
 	 *	Finally, wait for transmitter to become empty
 	 *	and restore the IER
 	 */
-	wait_for_xmitr(up, UART_LSR_BOTH_EMPTY);
+	serial8250_wait_for_xmitr(up, UART_LSR_BOTH_EMPTY);
 	serial_port_out(port, UART_IER, ier);
 }
 
@@ -2223,7 +2224,7 @@ static void serial8250_THRE_test(struct uart_port *port)
 	 * Synchronize UART_IER access against the console.
 	 */
 	scoped_guard(uart_port_lock_irqsave, port) {
-		wait_for_xmitr(up, UART_LSR_THRE);
+		serial8250_wait_for_xmitr(up, UART_LSR_THRE);
 		serial_port_out_sync(port, UART_IER, UART_IER_THRI);
 		udelay(1); /* allow THRE to set */
 		iir_noint1 = serial_port_in(port, UART_IIR) & UART_IIR_NO_INT;
@@ -3293,7 +3294,7 @@ static void serial8250_console_wait_putchar(struct uart_port *port, unsigned cha
 {
 	struct uart_8250_port *up = up_to_u8250p(port);
 
-	wait_for_xmitr(up, UART_LSR_THRE);
+	serial8250_wait_for_xmitr(up, UART_LSR_THRE);
 	serial8250_console_putchar(port, ch);
 }
 
@@ -3504,7 +3505,7 @@ void serial8250_console_write(struct uart_8250_port *up,
 	 *	Finally, wait for transmitter to become empty
 	 *	and restore the IER
 	 */
-	wait_for_xmitr(up, UART_LSR_BOTH_EMPTY);
+	serial8250_wait_for_xmitr(up, UART_LSR_BOTH_EMPTY);
 
 	if (em485) {
 		mdelay(port->rs485.delay_rts_after_send);
-- 
2.43.0

