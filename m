Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69E63F104D
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 09:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790845487; cv=none; b=ivUv8OHAQhmp4avJCY7mV/w13dmGLau/0UgTuueVhAzXSmsrMmUB5SqpAVwVS79dO6pqtmeOtOZkC1Ahb2QyeP1TzdxC9oU+yrLBPkPhVbb11tllcKrv7vmU6F2Os3/Fx+9MOns4PknkG2bEaT9WnkxFEC4UFxLIBIjDHuuRw8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790845487; c=relaxed/simple;
	bh=TdKcu6qVulTACs76qHTJ5RdT/uJeB54hFfAgiy3SeHw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CvOTaXmZN49qNO/YwmNdYMMTdN1mRk4CE/cOdc+wjQiRBYE66i+P6YBDG6/uJwFziRZHqDo8DMSxH9kVSli0KQnzPdVBfPh/6Sn31q0WbVW1tpCvQg8UXZwiruIa+RtZOcbkvbyCtWmGilIdK2/ldIXg63kJLcrQEF2Vc4KXOck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sairon.cz; spf=pass smtp.mailfrom=sairon.cz; dkim=pass (2048-bit key) header.d=sairon.cz header.i=@sairon.cz header.b=JLu4z7fU; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sairon.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sairon.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sairon.cz header.i=@sairon.cz header.b="JLu4z7fU"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48b01c4f4daso1172488f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 02:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sairon.cz; s=google; t=1790845483; x=1791450283; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qbp3jVmH+sFkYqhmX+ZJ1D5BkSS4kkEKH3MsLVvCz28=;
        b=JLu4z7fUdFsSGVwcZeC6cCYiXYsYro5nvqKWZZLeVwX0eSMmESW6QCSPMgltMcgPE8
         mRlPEPOQ9dDWOB2ohw2evg/XEHT9P0p/oOZSalPwVmebs5W+Tk4QwFyC2IwDGkHfZbtV
         86007UYegmo5CXyC/6SiFKuZ9+bad6d3uu6sVl5OaTE9tmPAW4jNYD9NHGatf5Ry9IWA
         lcbJniRrxA2oeDdL1peIK2dsXBYAL/WgsiuBzh2/wDovf6HSdKdKHjDFRh0MijF1X766
         S/MOwEmN7HIe/ZX9/jnV2orNHg/tjg+2hKDeiIU0ZlU/k7FxjHxpXqY+EU1JmogtYLoy
         40mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790845483; x=1791450283;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qbp3jVmH+sFkYqhmX+ZJ1D5BkSS4kkEKH3MsLVvCz28=;
        b=cM/PJFOaODwOwvVyKxTZBI1KRGvuhCf7Abaxn4BNRvj4SYB4v/+ptKWiuwHtqe4sGr
         HYTjDcPiydMYu97gM9flTkxsqCj01mb1roCM1sTXfviCjmMPmd6dEA6CYaVI3aVHs3Vd
         T557Xhe4XK6pNW13jYiIcw0GKseQPQoQCM8SnVusmuN+hn7QEA/+bbz3MRzYvxgx+rqH
         sINTYxFtugIThBl9GKNzSULkdksd9J3UzqVU1+wCV5nL49iUCUOIbhdXQ33Ie0fWzbix
         xMgvX2487lXADSvZlqRbpgdeAKJANWcVNeWm3DP71cjw0EIRPGdfXwe2kAli794on1rq
         90ew==
X-Forwarded-Encrypted: i=1; AKwUvBwQDHArwd1b/CB6iqozwEK5gBMTeNMT/9Ercw/0VKXTCfkdbFw6tcfmBI3bz8u+iY1zGo7d6PRZ2AKkras=@vger.kernel.org
X-Gm-Message-State: AFuF++nqPhsfTpD9KE0AftkwEc2/muz6o4YU8QziCSQCht+4qbVf/ksf
	vd9LqUc9hjKT5SJThHJU6p6l8utCHQOivgnlVXILMMAiiEgbRsyCmU98WFNSypZZuRU=
X-Gm-Gg: AYBFou1zkRVzOdfI33zD1FVSeIkm7gPEfCh143bgbSP52NrLzqXp07i53MiSIW6Ih2c
	lnVtFgXcJDG98VFjNMSQspYZ0RdCNIa1Hv8qW4WDmIUsd192LqJsEba7gnRY0g6GF1deAVshDYc
	YQRVKBTqCtdIuzU8eJUeA44JU9jo0PFpR+iWN+aFDXBn7dR7wHxIFAaHskk/MkREyCKFULCvxQB
	uzqx4k1ePckHXCZC4Lddk0z6oUv5jD0QrY+e0f7q9FOWrA6ZWJy+R1PK8MsEfJal08IPfRKVSOg
	7Gi0s5vM5GlElRnpXKgPrhjZxHQVEOehec7rMGTqFUTmW+priG5wUK1SWRO1eucdvO0FEAqOce5
	Jh7om/8Sy5tq7aoLdRhx++P0rtxAKqIrOT2doNQE7Q04K5FQFfxTM6eBw1OdYoJKFzqKtZ9npIB
	wg9xj88QWg4xYH7VA5T/qzMg5ML39TioPIlK9V3mqfe9bOnJeOOOJBMr6hJ56yKvfBLJoZ3UhIR
	YWvuhOY5r2Pcm3uWwUMSHkm+l9/z34hi2KzH3Li0zJ5WYRHL/EBcJr6Hxk=
X-Received: by 2002:a05:600c:4fc9:b0:49c:cee0:f383 with SMTP id 5b1f17b1804b1-4a01afe12a1mr63735345e9.16.1790845482560;
        Thu, 01 Oct 2026 02:04:42 -0700 (PDT)
Received: from krabice.lan ([2a02:8308:5084:6400:9c5f:33da:d2c3:ec96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f98224csm44126435e9.3.2026.10.01.02.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 02:04:41 -0700 (PDT)
From: =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	florian.fainelli@broadcom.com,
	rjui@broadcom.com,
	sbranden@broadcom.com
Cc: phil@raspberrypi.com,
	stefan@agner.ch,
	bcm-kernel-feedback-list@broadcom.com,
	linux-serial@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
Subject: [PATCH v3] serial: 8250_bcm2835aux: Add support for RTS/CTS auto flow control
Date: Thu,  1 Oct 2026 11:04:32 +0200
Message-ID: <20261001090432.1045270-1-sairon@sairon.cz>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The bcm2835aux mini UART can automatically de-assert RTS based on the RX
FIFO fill level and gate the transmitter on CTS, but the driver never
made use of it. Wire it up:

- Enable AUTORTS/AUTOCTS (with the RTS4 threshold and inverted, i.e.
  conventional active-low, polarity) whenever CRTSCTS is set on ports
  declaring the "uart-has-rtscts" property, advertised via
  UPF_HARD_FLOW.

- Gate the AUTORTS function on TIOCM_RTS in set_mctrl() so that clearing
  RTS (port close, TIOCMBIC, B0) actually de-asserts the pin while auto
  flow control is active.

- Implement throttle()/unthrottle() by disabling the RX interrupts and
  letting the FIFO fill up, making the hardware de-assert RTS - the same
  approach as in 8250_omap. Re-sync this state on termios and rs485
  changes, as those paths may re-enable the RX interrupts (or leave them
  disabled) behind the throttle's back.

- Never enable auto flow control together with rs485, which uses RTS as
  the transceiver direction control. As the software CTS fallback of the
  serial core cannot work without a modem status interrupt, strip
  CRTSCTS whenever it cannot be handled in hardware. Keep it when a CTS
  GPIO is present, as the serial core's mctrl_gpio handling then
  delivers the interrupt and the software fallback keeps working.

- Restore RXEN when rs485 is disabled, as the emulation may be torn down
  without the rs485_stop_tx() callback ever being called, which would
  leave the receiver disabled.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Jan Čermák <sairon@sairon.cz>
---

Notes:
    v3:
    - Use tty_port_tty scoped guard in bcm2835aux_tty_throttled()
    
    v2:
    - Keep CRTSCTS when a CTS GPIO is configured on the port, so the
      serial core's GPIO-driven software CTS fallback keeps working
      [Sashiko]
    - Take a tty reference with tty_port_tty_get() in
      bcm2835aux_tty_throttled() [Sashiko]
    
    v2: https://lore.kernel.org/r/20260930125620.221836-1-sairon@sairon.cz/
    v1: https://lore.kernel.org/r/cover.1786030659.git.sairon@sairon.cz

 drivers/tty/serial/8250/8250_bcm2835aux.c | 167 +++++++++++++++++++++-
 1 file changed, 163 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_bcm2835aux.c b/drivers/tty/serial/8250/8250_bcm2835aux.c
index 0609582a62f7..626e2e61ef41 100644
--- a/drivers/tty/serial/8250/8250_bcm2835aux.c
+++ b/drivers/tty/serial/8250/8250_bcm2835aux.c
@@ -7,9 +7,9 @@
  * Based on 8250_lpc18xx.c:
  * Copyright (C) 2015 Joachim Eastwood <manabian@gmail.com>
  *
- * The bcm2835aux is capable of RTS auto flow-control, but this driver doesn't
- * take advantage of it yet.  When adding support, be sure not to enable it
- * simultaneously to rs485.
+ * The bcm2835aux's RTS/CTS auto flow-control is enabled for ports declaring
+ * the "uart-has-rtscts" property, but never simultaneously to rs485, which
+ * repurposes RTS as the transceiver direction control.
  */
 
 #include <linux/clk.h>
@@ -19,6 +19,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
+#include <linux/tty.h>
 
 #include "8250.h"
 
@@ -34,6 +35,18 @@
 #define BCM2835_AUX_UART_CNTL_RTSINV	0x40 /* Invert auto RTS polarity */
 #define BCM2835_AUX_UART_CNTL_CTSINV	0x80 /* Invert auto CTS polarity */
 
+/*
+ * Set auto RTS to de-assert with 4 FIFO slots left (RTS4).
+ *
+ * The RTSINV/CTSINV bits select the auto flow assert level, which out of
+ * reset is active-high. Set them to get the conventional active-low RTS/CTS.
+ */
+#define BCM2835_AUX_UART_CNTL_AUTORTS_MASK \
+	(BCM2835_AUX_UART_CNTL_AUTORTS | BCM2835_AUX_UART_CNTL_RTS4 | \
+	 BCM2835_AUX_UART_CNTL_RTSINV)
+#define BCM2835_AUX_UART_CNTL_AUTOCTS_MASK \
+	(BCM2835_AUX_UART_CNTL_AUTOCTS | BCM2835_AUX_UART_CNTL_CTSINV)
+
 /**
  * struct bcm2835aux_data - driver private data of BCM2835 auxiliary UART
  * @clk: clock producer of the port's uartclk
@@ -46,6 +59,146 @@ struct bcm2835aux_data {
 	u32 cntl;
 };
 
+static bool bcm2835aux_tty_throttled(struct uart_port *port)
+{
+	if (!port->state)
+		return false;
+
+	scoped_guard(tty_port_tty, &port->state->port)
+		return tty_throttled(scoped_tty());
+
+	return false;
+}
+
+/* Program the CNTL auto flow bits from port->status and mctrl */
+static void bcm2835aux_update_flow(struct uart_port *port, unsigned int mctrl)
+{
+	struct bcm2835aux_data *data = dev_get_drvdata(port->dev);
+	struct uart_8250_port *up = up_to_u8250p(port);
+
+	data->cntl &= ~(BCM2835_AUX_UART_CNTL_AUTORTS_MASK |
+			BCM2835_AUX_UART_CNTL_AUTOCTS_MASK);
+	if ((port->status & UPSTAT_AUTORTS) && (mctrl & TIOCM_RTS))
+		data->cntl |= BCM2835_AUX_UART_CNTL_AUTORTS_MASK;
+	if (port->status & UPSTAT_AUTOCTS)
+		data->cntl |= BCM2835_AUX_UART_CNTL_AUTOCTS_MASK;
+
+	serial_out(up, BCM2835_AUX_UART_CNTL, data->cntl);
+}
+
+static void bcm2835aux_enable_rx_irq(struct uart_port *port)
+{
+	struct uart_8250_port *up = up_to_u8250p(port);
+
+	up->ier |= UART_IER_RLSI | UART_IER_RDI;
+	serial_out(up, UART_IER, up->ier);
+}
+
+static void bcm2835aux_set_autoflow(struct uart_port *port, tcflag_t cflag,
+				    bool rs485_enabled)
+{
+	bool was_enabled = port->status & UPSTAT_AUTORTS;
+	bool enable;
+
+	/*
+	 * rs485 uses RTS as the transceiver direction control, which is
+	 * mutually exclusive with the auto flow-control of the pin.
+	 */
+	enable = (cflag & CRTSCTS) && (port->flags & UPF_HARD_FLOW) &&
+		 !rs485_enabled;
+
+	if (enable) {
+		port->status |= UPSTAT_AUTORTS | UPSTAT_AUTOCTS;
+		/* Restore the throttle state lost in startup/resume/rs485 paths */
+		if (bcm2835aux_tty_throttled(port)) {
+			/* let the FIFO fill up and de-assert RTS in hardware */
+			port->ops->stop_rx(port);
+			/* reclaim an RTS lowered by software flow control */
+			if ((cflag & CBAUD) != B0)
+				port->mctrl |= TIOCM_RTS;
+		}
+	} else {
+		port->status &= ~(UPSTAT_AUTORTS | UPSTAT_AUTOCTS);
+		/* unthrottle() will no longer be called after leaving auto-RTS mode */
+		if (was_enabled)
+			bcm2835aux_enable_rx_irq(port);
+	}
+
+	bcm2835aux_update_flow(port, port->mctrl);
+}
+
+static void bcm2835aux_set_mctrl(struct uart_port *port, unsigned int mctrl)
+{
+	serial8250_do_set_mctrl(port, mctrl);
+	bcm2835aux_update_flow(port, mctrl);
+}
+
+static void bcm2835aux_set_termios(struct uart_port *port,
+				   struct ktermios *termios,
+				   const struct ktermios *old)
+{
+	struct uart_8250_port *up = up_to_u8250p(port);
+	bool hw_flow = (port->flags & UPF_HARD_FLOW) &&
+		       !(port->rs485.flags & SER_RS485_ENABLED);
+
+	/*
+	 * Strip CRTSCTS when the hardware auto flow-control cannot be
+	 * used, as the serial core's software CTS fallback cannot work
+	 * without a modem status interrupt. A CTS GPIO provides one.
+	 */
+	if (!hw_flow && !mctrl_gpio_to_gpiod(up->gpios, UART_GPIO_CTS))
+		termios->c_cflag &= ~CRTSCTS;
+
+	serial8250_do_set_termios(port, termios, old);
+
+	guard(uart_port_lock_irqsave)(port);
+
+	bcm2835aux_set_autoflow(port, termios->c_cflag,
+				port->rs485.flags & SER_RS485_ENABLED);
+}
+
+static void bcm2835aux_throttle(struct uart_port *port)
+{
+	guard(uart_port_lock_irqsave)(port);
+
+	port->ops->stop_rx(port);
+}
+
+static void bcm2835aux_unthrottle(struct uart_port *port)
+{
+	guard(uart_port_lock_irqsave)(port);
+
+	bcm2835aux_enable_rx_irq(port);
+}
+
+static int bcm2835aux_rs485_config(struct uart_port *port,
+				   struct ktermios *termios,
+				   struct serial_rs485 *rs485)
+{
+	tcflag_t cflag = termios ? termios->c_cflag : 0;
+	bool rs485_enabled;
+	int ret;
+
+	ret = serial8250_em485_config(port, termios, rs485);
+	if (ret)
+		return ret;
+
+	rs485_enabled = rs485->flags & SER_RS485_ENABLED;
+	if (!rs485_enabled) {
+		struct bcm2835aux_data *data = dev_get_drvdata(port->dev);
+
+		data->cntl |= BCM2835_AUX_UART_CNTL_RXEN;
+	}
+
+	/*
+	 * termios is NULL when rs485 is set up from firmware properties at
+	 * port registration, before the port has been opened.
+	 */
+	bcm2835aux_set_autoflow(port, cflag, rs485_enabled);
+
+	return 0;
+}
+
 static void bcm2835aux_rs485_start_tx(struct uart_8250_port *up, bool toggle_ier)
 {
 	if (!(up->port.rs485.flags & SER_RS485_RX_DURING_TX)) {
@@ -99,7 +252,11 @@ static int bcm2835aux_serial_probe(struct platform_device *pdev)
 	up.port.dev = &pdev->dev;
 	up.port.type = PORT_16550;
 	up.port.flags = UPF_FIXED_PORT | UPF_FIXED_TYPE | UPF_SKIP_TEST | UPF_IOREMAP;
-	up.port.rs485_config = serial8250_em485_config;
+	up.port.set_termios = bcm2835aux_set_termios;
+	up.port.set_mctrl = bcm2835aux_set_mctrl;
+	up.port.throttle = bcm2835aux_throttle;
+	up.port.unthrottle = bcm2835aux_unthrottle;
+	up.port.rs485_config = bcm2835aux_rs485_config;
 	up.port.rs485_supported = serial8250_em485_supported;
 	up.rs485_start_tx = bcm2835aux_rs485_start_tx;
 	up.rs485_stop_tx = bcm2835aux_rs485_stop_tx;
@@ -134,6 +291,8 @@ static int bcm2835aux_serial_probe(struct platform_device *pdev)
 	ret = uart_read_port_properties(&up.port);
 	if (ret)
 		goto rm_swnode;
+	if (device_property_read_bool(&pdev->dev, "uart-has-rtscts"))
+		up.port.flags |= UPF_HARD_FLOW;
 
 	up.port.regshift = 2;
 	up.port.fifosize = 8;

base-commit: 551c722f40809618230001baccf219193e22fc5a
-- 
2.55.0

