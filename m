Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794283241;
	b=VISxxPDswzBFE4JgYEIvmu3pk/oDBqSRwvBh4H1Yyt8aJUx5ttloNJs/Z2+DfN7G9Osj
	 w/qyYFt7RedXEseXgPdPnX5ayb/fgTThf3UQgFnGzq+R8dADLm/oOEiPghiqa6jMjO7OT
	 Ku6U6c0EObl8zZPXjXNz/Efz/THh5nqGkAIMyB34mSnCsxZoZTTytY3KroHGILJTb5VGF
	 LE+cSZhWaYKMXeHJ+LRpK2Y1rFemvPtjy5dYIWvQXPhttiFkdrT52JqMqUSXnz8F8MMrN
	 L/vuRYNrGvfpvx0AYLSFTVPBN7xhaNIY/7UoUaD38o+nsXjvKEV8TvjNxDZwnboRdlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794283241;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=XUfxuzZXIT5avg6gl1nxcM7YkzRMwGmAk1oGIMF99rQ=;
	b=OVJ+m8CIh4jOqWU2NhYkE9JUlh/2n3YmZRJlFD2f5cZb3U1VKCqt4/kJ9nvbOT1HPkV4
	 iJbCMG9pWhSEW6zBrPSQFOSpuQFHvC3A2MJW+MM/M4O4lAyeYcwgMavesDHFtiL/VOP2r
	 E0YsIceYjHfPRlFdtZ3GH5KoGa1Uc0yuBTkXNmfll8CmJm9YJTnQnApCFHI7mLWsaCQpj
	 KfsvnYh0k8mhuoNgW1V9YB0qH+hbpGvvcRA/zfszENTjNvQqdY6nTp+b4aZS3WN3KwblV
	 8q7gBhywz+MBvijjy5RoKTH7oofj9koy9fejrbegIJfgyX6TZ3p9Asfv9oH0Dx2U71A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dwzy13Xg;
	arc=none smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34CA60A262B
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:00:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F34CA60A262B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dwzy13Xg
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6f5a0893610so975002eaf.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794283240; x=1794888040; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XUfxuzZXIT5avg6gl1nxcM7YkzRMwGmAk1oGIMF99rQ=;
        b=dwzy13XgZrj+ZeKWhgHCpNzdxscT1PlUN2VvUrjJgeAsEE56VzuqLLbhq/KhexZgYU
         GNOMgvt6NyDpyQ2FSPp5RAfKN7eLMvvfA6u29ntwEbDwQoN2mGjSdnogVIkJXQVZVlTi
         waApPVGiZwJUuO8Wuvd/If8FJhI456aYXBJLth9N1UjdY2UQH/unPhsePFdszvQYRfN+
         0CuVjzarm0uq9VQVxcxzXpDi8FZTImuGvoI9goQixLiVlAxNuT2eHoQGII2pumyMT4bF
         poumMSFAzW1Nx+IvAIlZj8SIIylNL1X7IKTGYhMtf/6BgEjKHpKTb3+0dlArqvSIsXki
         TWsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794283240; x=1794888040;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XUfxuzZXIT5avg6gl1nxcM7YkzRMwGmAk1oGIMF99rQ=;
        b=O+N4xo9PXU6RRlfrQMP/bqTe1mem+4RHgBfrMe2hd1xg5wwdZWEwCxP56ZxsrIpTuo
         C8OOib8Z/jtZAVw7dpuTPQWvCFvvIg5P8FfhAE16Ix6IcMX7uU2x2NlFmI+994PgZMjd
         uZp5akGktXnA4RShLOLtYvpYoUH7wR5ZqRFKSQI0oMfEYnjf3azkoJjgloFH085otw0Z
         ScTvfUkRCrJtmRESi43YcK/n18TBz7lqZzEDEjBpMEoRUi7cYQ5+mgxpEI7Eb7bGkBgS
         NxMDoZHBXoCfrcWc4bi7x0G1VBTEQzuAsGffOk9vELmVrt/dUXFN6ZeG0rswlULZkzGR
         PkiQ==
X-Gm-Message-State: APuU4Z8yHgJOfA27MryZJ13ALUe3Aiggwx16HZW7O/FbFewv4v7X1WA8
	jwJNqDMscWllkstep3FORwLczcfvP4KTH8B/tyo4CkAtg0LHw0v6QYOW
X-Gm-Gg: AYBFou15TOGiDQjQti8xsvDZRkieaYtfImnEo4FusnUjbmiG+ERVL1nRf6q/wydhg/J
	rk6k/G/1N+1IwRfUS3MmrUs5d/ZERHgp0z7sgL+xVV6AWOiQwdfTbsdSp2MK5jy+C2BV1CYP836
	qQxcoJX7quIVZg42xaWj7luoBsV1FRq1rvpMgirImmp9xBUodEzLvsnBy8RMELoTA9Bzqis1/+A
	zC5WqLxjCFNH/RMphUtPkUkJRC/33J/rbeHpS8/WXFX3lYIhEz4DAnbc1Yx9to/mUxX9rZza+N6
	ZiYb8nCYTy5Q7dtCfMHKJiHP6C8+umqUKWBygTKhVFByYPPgw68+DRSjTXi9+WynuhLOSnK9OVX
	tMQQa4MhBg1yB7KWUnY7YI8DLSf9mcMkfWxglwOqEMR4y5ItkcOaVV6E0GWn53b3xARUDyd5+Ay
	2fbk4sjkDt1+9Kpayq9QAUFZQEy+Bqu42BKjhPfyb+QT36MuD6qZWeQ99Cn6YDkSgCD0fBqddu2
	UUPJnannvjttfJsLoh9ZQE4AkSdCc2ZZQPyMw2FdLCb4+R7IiDW5J3M9aiHyF9agzCF+LELFuZZ
	YPmb6G/DpSV5wGx3s5hpFJj4GpOFT9mmLWt55e9FqDStweOpUlHUTPuz30I4Al3imGU2LduWbt+
	OC+klknqSCOM4MvpAJRRgxFnjraDAW103UjJLzkQSe1XMForj1NNA/7H4huu3wYCGJAd8KHNo8H
	CbfpY6p25agCb4DQpR1lIVa5qOtiMy2PVjmJZ8BoJ7A2wdJUn4PNgMe6fXoflxC5zHzkTjhCXG
X-Received: by 2002:a05:6820:f02a:b0:703:3ff5:ddc4 with SMTP id 006d021491bc7-718a188120cmr678015eaf.11.1794283239825;
        Mon, 09 Nov 2026 20:00:39 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dcc1d759sm1028178a34.23.2026.11.09.20.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:00:39 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 09 Nov 2026 21:00:19 -0700
Subject: [PATCH v11 4/8] serial: 8250_omap: quiesce DMA IRQ handling before
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
Message-Id: <20261109-submit-serial-8250-dma-cancel-v1-v11-4-6364edca63d6@gmail.com>
References: <20261109-submit-serial-8250-dma-cancel-v1-v11-0-6364edca63d6@gmail.com>
In-Reply-To: <20261109-submit-serial-8250-dma-cancel-v1-v11-0-6364edca63d6@gmail.com>
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

