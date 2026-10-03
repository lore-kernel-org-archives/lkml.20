Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC86448D03
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 15:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791042634; cv=none; b=QuXEq6bk9bCf7w4DM8jFrl16S4lDY4IQczfYMaX8KigvJNSgisiGfm5fvM23nZsw1LymyTZIWILDcmpEOsjsKXCGEYnTqcJYxQcZjrOrxQM9tQ+dBUa8Y4UNjsoWEBReFPYDxUqBT+If/BJETs9s4OJk+PED24t3Eyje6zF79wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791042634; c=relaxed/simple;
	bh=VCFZL8C7CskzounbxL3E1vIVFsfQTCnNmtrH/w2/R7g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rKNkAstFa5zk1Ue24Mdrgp/HFpKCPt3DYxXOTy9qayUoMH52N4V9B31gJVegA0ZZI9yPhIxjmvBxVj5hSbjAQoezuNJMqmuHlh0oJ+eEYduNkFns6+rTSfSCLM/0S5nT3PFFkqAZjGzMKNvoQYqrXEZfjM5KK8dLKsa4cIJRaVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O3KmMy1k; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O3KmMy1k"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so6285455e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 08:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791042630; x=1791647430; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tLpRB5yATHQpX0YPaKzhPzon6/tpk2LiYbV0aGm14kM=;
        b=O3KmMy1ktsfB2cPq0pFa/ayTgXXWwwknZSDwbw3Yerq8gtTtcnn0wxmop0hWKn7Ay9
         UfXATnMgHBpTsxZXUsNKkfDHXEka3FyziVTOzLS3FTZu8XgJigKaD2saDBR5yLh70x7m
         1GeyYAEwwJcHtfp3Gq9WuyOh7hpHU3R9d9iCznD7oLqd0daA/ElCR7p0FssH3xIZmu8K
         HdVI7BmM/HrOyTzOFr7Tb2/TKfohVjRCimfoBeFaJ/comgFwkXZvLeJz8A/xdrQT89p8
         avfPhptFpHAtySsl21OVBIIPvCpY6lqofGG7xXoDgfA9zO7k/pqc4/IF0LwfLFfA9NiO
         kgZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791042630; x=1791647430;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tLpRB5yATHQpX0YPaKzhPzon6/tpk2LiYbV0aGm14kM=;
        b=W1JtPMX4FDxzRQVjDHLQjrXqruGj2mumbIZ+smRGu1C1y61YlAFVTm4FouhDV0oIU+
         VEcEiTLQLqwm2jF+IfcduDILpTE6DTE1Lc5i4jdbnGDvb521mlFgi7rYnZ1xMgLRBVxz
         BtFbaOTnfZEpzfEyy/+O1tCuS7BR1MQu+SikEGUpkxVTk519QMVxjxa8IPqL7P5JITpw
         /l1WxmtGG5AgNZYQtQRUFlX+7WENXahVRdC9LTk+I3WQKwxr2kbhdT1YYES5HuFSZdgZ
         1C2wwLkxggYvXpo8DZ2phfKWXOf+aizOaAgLV9UMEu66wVRsKP81NkwHpRblEb0Rba9e
         jAUQ==
X-Forwarded-Encrypted: i=1; AKwUvBxxgyjMe6hIkFeM2J3t+ex0BjJZ5BVpUwbNOnfdyzStm1KETwCIO6X0ufcVwIxU1IBbagI11FkJDzxEnOI=@vger.kernel.org
X-Gm-Message-State: AFuF++kH8tTkXUxjt1uIkkXIBJwizL8b1droyGC8bEucTX1/VSv0m+RJ
	uQfuZtTOqKQlj4XzUPbyiTa8fMoyEj2YZIKrHy7MCJLTpu/ua+bxQZw0
X-Gm-Gg: AYBFou1SvXbPgzEQrmGmyGOMZMVd+sdwyM4SxsuIYqMUbu1Ck/YFEI6NY0mgYS1dYtt
	S8T7dGO7LACyss/16mDWfmV1IcWKtlU0LWpT719xU2RBV9fffg05GPfRKzwMMQIdWblnGA8ddpd
	+WsHyHnKhAzrzWSe196tRgp/YQvDxAWmRKRvi6sIXwGpBJ9e55zpKYuhgVPOlsByQf3m/s+GCFB
	RUfEnbGsYFiFpUtd07wUrJ7bfNhf9Hm9Tk++wdFxAZes0jEmG64i71lv9o79wPkqc+S4WO82o2I
	Ql122kjULirKYj3h5KHOwNoI2czMMbpUwYosbokoVrg2fTSdFOhIT4fYalPjrlHxOsaM4hBlhds
	n/sqOGMuh+k32YG3sFzP8D9WpwO4V8eAdGDvAXNrRItzjy7AAOZTgA3OwIC5gcepIRFXCOq6ANf
	JIPqKD5Xf+fT+rUgkBS7sBYNR1RETToJj4M/G+Sj5HUjZFun3juDusKUT6g+xcq1Q3rDZTnOBDN
	1MjxkrF4H9l+esBjkE9DdtwQ2MLc0Pvh7o994xXEFqxfRwjP52X6XG+4wotPtVwhzgMiSnlBvuP
	MWPM
X-Received: by 2002:a05:600c:3110:b0:4a0:b6:4619 with SMTP id 5b1f17b1804b1-4a168069b91mr46835855e9.0.1791042630024;
        Sat, 03 Oct 2026 08:50:30 -0700 (PDT)
Received: from lap.lan (xdsl-31-165-251-31.adslplus.ch. [31.165.251.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380fa61csm13483899f8f.17.2026.10.03.08.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 08:50:29 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Loureiro?= <joaofl@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	Sherry Sun <sherry.sun@nxp.com>,
	Frank Li <frank.li@nxp.com>,
	Alexander Dahl <ada@thorsis.com>,
	linux-serial@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Jo=C3=A3o=20Loureiro?= <joaofl@gmail.com>
Subject: [PATCH v2] serial: fsl_lpuart: add support for GPIO-controlled modem lines
Date: Sat,  3 Oct 2026 17:50:22 +0200
Message-ID: <20261003155022.466971-1-joaofl@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

LPUART has no register bit to drive RTS to a chosen level: UARTMODIR only
offers receiver-driven auto-RTS (RXRTSE) and RTS-during-transmit (TXRTSE).
Consequently lpuart_set_mctrl() and lpuart32_set_mctrl() ignore TIOCM_RTS,
and their get_mctrl() counterparts report a hardcoded
TIOCM_CAR | TIOCM_DSR | TIOCM_CTS.

That makes it impossible to talk to a peripheral which is driven by a
software controlled RTS strobe and answers on CTS.  TIOCMBIS/TIOCMBIC
silently do nothing, and because CTS always reads back as asserted, a
userspace handshake that waits for CTS to follow RTS can never complete:
de-asserting RTS and waiting for CTS to drop times out every time.  Boards
that route the two pins to plain GPIOs cannot work around it either, since
the driver never looks at rts-gpios/cts-gpios.

Wire the driver up to the serial_mctrl_gpio helpers, as imx.c and
atmel_serial.c already do.  set_mctrl() forwards the state to
mctrl_gpio_set(), and get_mctrl() runs the flags through mctrl_gpio_get()
so that a described cts-gpios overrides the assumed-asserted default.
Boards without such a description keep the previous behaviour.  Modem
status interrupts are enabled from startup() and disabled from shutdown(),
with a .enable_ms callback for the serial core.

The same limitation was reported for an i.MX 8XLite board that needs RS-485
with a GPIO RTS [1].  This change was developed and tested on an i.MX95
board whose barcode scanner is driven over LPUART with a manual RTS strobe;
with it, RTS toggles as requested and CTS is reported from the real pin.

[1] https://lore.kernel.org/all/20260210-rearview-hungrily-536a95fc3385@thorsis.com/

Signed-off-by: João Loureiro <joaofl@gmail.com>
---

Notes:
    Changes in v2:
    - Resend: v1 (Message-ID <20260819144458.253967-1-joaofl@gmail.com>)
      never reached the mailing lists, so it could not go through CI.
    - Rebased onto tty-next; no functional changes.

 drivers/tty/serial/Kconfig      |  1 +
 drivers/tty/serial/fsl_lpuart.c | 35 +++++++++++++++++++++++++++++++--
 2 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
index bf680d22199b..cbf6b44d8a3e 100644
--- a/drivers/tty/serial/Kconfig
+++ b/drivers/tty/serial/Kconfig
@@ -1316,6 +1316,7 @@ config SERIAL_FSL_LPUART
 	tristate "Freescale lpuart serial port support"
 	depends on HAS_DMA
 	select SERIAL_CORE
+	select SERIAL_MCTRL_GPIO if GPIOLIB
 	help
 	  Support for the on-chip lpuart on some Freescale SOCs.
 
diff --git a/drivers/tty/serial/fsl_lpuart.c b/drivers/tty/serial/fsl_lpuart.c
index c8575c965203..909253aab212 100644
--- a/drivers/tty/serial/fsl_lpuart.c
+++ b/drivers/tty/serial/fsl_lpuart.c
@@ -27,6 +27,8 @@
 #include <linux/slab.h>
 #include <linux/tty_flip.h>
 
+#include "serial_mctrl_gpio.h"
+
 /* All registers are 8-bit width */
 #define UARTBDH			0x00
 #define UARTBDL			0x01
@@ -291,6 +293,7 @@ struct lpuart_port {
 	bool			is_cs7; /* Set to true when character size is 7 */
 					/* and the parity is enabled		*/
 	bool			dma_idle_int;
+	struct mctrl_gpios	*gpios;
 };
 
 struct lpuart_soc_data {
@@ -1528,6 +1531,7 @@ static int lpuart32_config_rs485(struct uart_port *port, struct ktermios *termio
 
 static unsigned int lpuart_get_mctrl(struct uart_port *port)
 {
+	struct lpuart_port *sport = container_of(port, struct lpuart_port, port);
 	unsigned int mctrl = 0;
 	u8 cr1;
 
@@ -1535,11 +1539,12 @@ static unsigned int lpuart_get_mctrl(struct uart_port *port)
 	if (cr1 & UARTCR1_LOOPS)
 		mctrl |= TIOCM_LOOP;
 
-	return mctrl;
+	return mctrl_gpio_get(sport->gpios, &mctrl);
 }
 
 static unsigned int lpuart32_get_mctrl(struct uart_port *port)
 {
+	struct lpuart_port *sport = container_of(port, struct lpuart_port, port);
 	unsigned int mctrl = TIOCM_CAR | TIOCM_DSR | TIOCM_CTS;
 	u32 ctrl;
 
@@ -1547,11 +1552,13 @@ static unsigned int lpuart32_get_mctrl(struct uart_port *port)
 	if (ctrl & UARTCTRL_LOOPS)
 		mctrl |= TIOCM_LOOP;
 
-	return mctrl;
+	/* A cts-gpio, when present, overrides the assumed-asserted CTS above. */
+	return mctrl_gpio_get(sport->gpios, &mctrl);
 }
 
 static void lpuart_set_mctrl(struct uart_port *port, unsigned int mctrl)
 {
+	struct lpuart_port *sport = container_of(port, struct lpuart_port, port);
 	u8 cr1;
 
 	cr1 = readb(port->membase + UARTCR1);
@@ -1562,10 +1569,13 @@ static void lpuart_set_mctrl(struct uart_port *port, unsigned int mctrl)
 		cr1 |= UARTCR1_LOOPS;
 
 	writeb(cr1, port->membase + UARTCR1);
+
+	mctrl_gpio_set(sport->gpios, mctrl);
 }
 
 static void lpuart32_set_mctrl(struct uart_port *port, unsigned int mctrl)
 {
+	struct lpuart_port *sport = container_of(port, struct lpuart_port, port);
 	u32 ctrl;
 
 	ctrl = lpuart32_read(port, UARTCTRL);
@@ -1576,6 +1586,15 @@ static void lpuart32_set_mctrl(struct uart_port *port, unsigned int mctrl)
 		ctrl |= UARTCTRL_LOOPS;
 
 	lpuart32_write(port, ctrl, UARTCTRL);
+
+	mctrl_gpio_set(sport->gpios, mctrl);
+}
+
+static void lpuart_enable_ms(struct uart_port *port)
+{
+	struct lpuart_port *sport = container_of(port, struct lpuart_port, port);
+
+	mctrl_gpio_enable_ms(sport->gpios);
 }
 
 static void lpuart_break_ctl(struct uart_port *port, int break_state)
@@ -1844,6 +1863,8 @@ static int lpuart_startup(struct uart_port *port)
 	lpuart_request_dma(sport);
 	lpuart_hw_setup(sport);
 
+	mctrl_gpio_enable_ms(sport->gpios);
+
 	return 0;
 }
 
@@ -1915,6 +1936,8 @@ static int lpuart32_startup(struct uart_port *port)
 	lpuart_request_dma(sport);
 	lpuart32_hw_setup(sport);
 
+	mctrl_gpio_enable_ms(sport->gpios);
+
 	return 0;
 }
 
@@ -1956,6 +1979,7 @@ static void lpuart_shutdown(struct uart_port *port)
 
 	uart_port_unlock_irqrestore(port, flags);
 
+	mctrl_gpio_disable_ms_sync(sport->gpios);
 	lpuart_dma_shutdown(sport);
 }
 
@@ -1990,6 +2014,7 @@ static void lpuart32_shutdown(struct uart_port *port)
 
 	uart_port_unlock_irqrestore(port, flags);
 
+	mctrl_gpio_disable_ms_sync(sport->gpios);
 	lpuart_dma_shutdown(sport);
 }
 
@@ -2441,6 +2466,7 @@ static const struct uart_ops lpuart_pops = {
 	.tx_empty	= lpuart_tx_empty,
 	.set_mctrl	= lpuart_set_mctrl,
 	.get_mctrl	= lpuart_get_mctrl,
+	.enable_ms	= lpuart_enable_ms,
 	.stop_tx	= lpuart_stop_tx,
 	.start_tx	= lpuart_start_tx,
 	.stop_rx	= lpuart_stop_rx,
@@ -2466,6 +2492,7 @@ static const struct uart_ops lpuart32_pops = {
 	.tx_empty	= lpuart32_tx_empty,
 	.set_mctrl	= lpuart32_set_mctrl,
 	.get_mctrl	= lpuart32_get_mctrl,
+	.enable_ms	= lpuart_enable_ms,
 	.stop_tx	= lpuart32_stop_tx,
 	.start_tx	= lpuart32_start_tx,
 	.stop_rx	= lpuart32_stop_rx,
@@ -2912,6 +2939,10 @@ static int lpuart_probe(struct platform_device *pdev)
 		sport->port.rs485_config = lpuart_config_rs485;
 	sport->port.rs485_supported = lpuart_rs485_supported;
 
+	sport->gpios = mctrl_gpio_init(&sport->port, 0);
+	if (IS_ERR(sport->gpios))
+		return PTR_ERR(sport->gpios);
+
 	sport->ipg_clk = devm_clk_get(&pdev->dev, "ipg");
 	if (IS_ERR(sport->ipg_clk)) {
 		ret = PTR_ERR(sport->ipg_clk);

base-commit: c44a4925cdac02af781ebfae96df68a7bf3580b0
-- 
2.55.0

