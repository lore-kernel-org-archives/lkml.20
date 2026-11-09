Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794196290;
	b=zDFOhXcIdalUQIjp54OwVeOSMh50jZqqq2zzalCrPNrlo4lIhF35kagJAG0kQ71YvHAv
	 EysRdQkrlKmmy81R9QyRoQ2px3By/CEA20stIte0S9M+h+ifNT8CnaFSpLBz7/WVTqy+l
	 L+ICIkfg238K3POx+eNs7gRhuaD9MvRcbU/VPuxalrthYPcZ/MeKGKUTcJ2dkPsrM4UxQ
	 8l6Vsh8Co0w/jPIHAzrb7MPBdw7jh8yFswNp1Rgmj7gB2FKvBQwm25iJrebTsexI5xUMz
	 pGsgcF2vqbfe7ogNdF96kpcyKcrlj0B/UOfkmQWK0ZnDlZkHHLvPz1nvyppAS5swg/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794196290;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=XUfxuzZXIT5avg6gl1nxcM7YkzRMwGmAk1oGIMF99rQ=;
	b=X8hDA4mrQZiRIq3tUEN5P71/JTJjPF3W1V5beMuZviDO0ovrueJ+cgj21JuMPAAxRuO2
	 enal3E0TgT6VoDKgg8CNX7FTr055i+eVcoEOBcu3fowQLNF7EhMviyo2faMOzlnibF5xm
	 TaB9YFDh+bi/7VU8jvB+A6JIo66rEi8g7Uk+vBLyx92Ng3Px/fLW3zBBOswisVBDisZcg
	 JHoZX3EMmiBsoZ1o6iLdJO5ApcsqWGDt4knss1J6GKvLA87KRyl9tP3boeGViLE+XBBOi
	 CBziniTJ249ANx0jarUrPwCUD0Tl1Lm5WmOorSUzhJOKOQ0v9eNO3gXTUqAzY1+LCOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bmx2PlMb;
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045DD606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 03:51:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 045DD606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bmx2PlMb
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-843b6f8e2c7so618483a34.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 19:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794196277; x=1794801077; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XUfxuzZXIT5avg6gl1nxcM7YkzRMwGmAk1oGIMF99rQ=;
        b=bmx2PlMbpqjrv1lSw6wlXnQjSbxQojHqc/LxevBMdVlIXWrqHbmvYJr0lvfeImL5uQ
         8MvZvZ2JmHsACsSYyuwiraSMHsgjwbGat6pgHhHUy1k//gqOtwBi1KSg7GCQZdJgxBBf
         /lJ6DmwCUo2HB/bIPXYvyIok8cFk3fHKlKZcYl1dw47LzUMHiDOg7G8goqn8R7f7x98h
         WeBta+QUzvJ/Xw+YeC6X1eg/DffeX6dBu8nX0l9RhV7ntPST/oAwL6gUo2tvusvXr5R+
         Yyv7XreFYneaLbuqh6/BKvzqxCEMu8KcW+GKOhZComUnxi66yCEEz6ZrTpTMhRtz4vMI
         j0EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794196277; x=1794801077;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XUfxuzZXIT5avg6gl1nxcM7YkzRMwGmAk1oGIMF99rQ=;
        b=GRrf8T/pgN/wlY+tLNcnbzgSaDe/mJfB5O/8WUF4AzRVwyIb1u4x85jqDu3TOou6Dw
         eP6VsnzHouvyg0ZRAGl7jyP3I7z+hAHoSUowWi+nTQY7C3/1j+U5+bJ2ezYCbohtLTE4
         uTUqRpclkvdcLqO+57d6h2fS9cu5nURfawZ/gpRAeceOkgaY4zrbABSu2yNCKnzm2Lpr
         kT3O4Vu9OGlqS7YpyrLo7UK+HfsDqfNMxmOn/ZlRe7FhfCLU9v8FQi5iaf1H+BpV8sGa
         46LNeIc1kLSYqduEjvtD6kbhdo/CUbKCkp0wGRyz0v30adodvAKsFpy+gOth+8dj6tIO
         /V1w==
X-Gm-Message-State: APuU4Z/TLmDYxrG3qdmPiptjcUzpLpupu6tqq29+f0TU1btYQXap2qcm
	xT6t9hXyRYxwrZJecC2e9AnhC2LnHjOKyWzF8T0R8lRykLQBOEjzXmyx
X-Gm-Gg: AYBFou2mPQJjwzk9v4SVepjZJLqUbq/kOuij21qFFO1nUJq8l3kbNBdX70LZeXQyRI/
	8GN2TCMy/M8TCQAasE4BTrjGb1WIZnkSlZS53qSnK77tYu+ClubUGVKykvMZch+2+wvUvRZ77Gv
	t0ya43ELDFdCPvN3QzSdXpqXm7c9bYcI1YEqVSJ7z9bsOEKCAvnjoZbalfwUmgncHeiPE9GHJWW
	2RhU+oexKhT4pERVP54gnEszNsLIYQ9gB2PVcfuhnUc0IKkhVnNb+qel3s1RNrCSnhvYdXKHr+i
	eR+HHjbVavz2siiHRhwFVlUvaQbq1xkhCOqUG5Sivf3XAhuzK6AhnLBNyBgrN8d031E5UnsgGDN
	CtHj2+8TXJ0W3TbGYwrMf38C0C2ZEI0uHaMOVqSTicmhQiW/4t0eZm8mBV0S2Khji6orOWPXGRh
	leQfbOTNRMzltpV2SNR5LiuO7mEJHD6fOxi37hFXXq4uZv/Ql14akFEjF32/AEuDAn1CA98QyeI
	gTSUFubM04iNuwmKe8AgJdndu0hk2px0qSo10gN+8fZ6u+1jsUNQEIWIROD2EBHhEX6bbewAwFd
	gkbi8NDHUV0qDxNlvYAxco0zg4zaKVbTo/S/w3m41MvWcBG8XhezaujWtkGqXnd1/nGcfzKRCBr
	EgOqkp5tW00QrPMuOsHfiXuYsx3Mg3nn2kZ92eh/c1OlOBPskh4/0COuHikp08TZejH5KoymrDn
	4CkgbWuSSfEnDIaeLX0TuMlP2k9VgeaGWblkuYuVbEigh9vw0wxgTnKw==
X-Received: by 2002:a05:6830:34a8:b0:85d:44ee:607d with SMTP id 46e09a7af769-85f501a3163mr2198462a34.0.1794196277001;
        Sun, 08 Nov 2026 19:51:17 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f4fad32cdsm2800428a34.6.2026.11.08.19.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 19:51:16 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 20:50:13 -0700
Subject: [PATCH v10 4/8] serial: 8250_omap: quiesce DMA IRQ handling before
 shutdown
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-submit-serial-8250-dma-cancel-v1-v10-4-e6227ddb95b1@gmail.com>
References: <20261108-submit-serial-8250-dma-cancel-v1-v10-0-e6227ddb95b1@gmail.com>
In-Reply-To: <20261108-submit-serial-8250-dma-cancel-v1-v10-0-e6227ddb95b1@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Raul E Rangel <rrangel@chromium.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Tony Lindgren <tony@atomide.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, "Maciej W. Rozycki" <macro@orcam.me.uk>, 
 Timur Tabi <timur@kernel.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linuxppc-dev@lists.ozlabs.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

disable_irq_nosync() masks the UART interrupt without waiting for a
running handler. That handler can have observed up->dma and continue
using it while shutdown releases the DMA channels and clears the pointer.
Synchronizing the IRQ later in serial core does not protect those accesses.

Publish the DMA shutdown gate under the port lock before the final RX
flush and interrupt masking. Have DMA IRQ handling check the same gate
under the lock, so a queued interrupt cannot restart receive processing
after the final flush.

Drain the UART IRQ outside the port lock before releasing DMA state.
The lock excludes competing RX processing during the flush, while
disable_irq() also waits for a handler that observed up->dma before
acquiring the lock.

Fixes: fef4f600319e ("serial: 8250: omap: Fix life cycle issues for interrupt handlers")
Reviewed-by: Raul E Rangel <rrangel@chromium.org>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_omap.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
index 5e114dd8f9bf..51013dd2d851 100644
--- a/drivers/tty/serial/8250/8250_omap.c
+++ b/drivers/tty/serial/8250/8250_omap.c
@@ -771,10 +771,6 @@ static void omap_8250_shutdown(struct uart_port *port)
 	guard(serial8250_rpm)(up);
 
 	flush_work(&priv->qos_work);
-	if (up->dma) {
-		guard(uart_port_lock_irq)(port);
-		omap_8250_rx_dma_flush(up);
-	}
 
 	serial_out(up, UART_OMAP_WER, 0);
 	if (priv->habit & UART_HAS_EFR2)
@@ -782,13 +778,16 @@ static void omap_8250_shutdown(struct uart_port *port)
 
 	/* Synchronize UART_IER access against the console. */
 	scoped_guard(uart_port_lock_irq, port) {
-		if (up->dma)
+		if (up->dma) {
 			up->dma->shutting_down = true;
+			omap_8250_rx_dma_flush(up);
+		}
 		up->ier = 0;
 		serial_out(up, UART_IER, 0);
 	}
 
-	disable_irq_nosync(port->irq);
+	/* An in-flight handler may still be using up->dma. */
+	disable_irq(port->irq);
 
 	serial8250_release_dma(up);
 	up->dma = NULL;
@@ -1330,6 +1329,11 @@ static int omap_8250_dma_handle_irq(struct uart_port *port)
 
 	uart_port_lock(port);
 
+	if (up->dma->shutting_down) {
+		uart_port_unlock(port);
+		return IRQ_HANDLED;
+	}
+
 	status = serial_port_in(port, UART_LSR);
 
 	if ((iir & 0x3f) != UART_IIR_THRI) {

-- 
2.53.0

