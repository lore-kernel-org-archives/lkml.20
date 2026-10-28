Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793220536;
	b=x/2k7bcerP2GopgCY9KJy0vkynoJf0BYcMW76ORY3JPKYWAzl5aoOLycJgZXiKZULp/D
	 867ULuBD+d6dzhLWWFloImgM/mG2uAKxYblFaXzApEXdn0zkso8CogbzbgTPSEmewS973
	 PcMpTZ9pZ/sTP78+5orFDm5dH8P4C7AJyQx+HelSHuTN9fUSwQjdXYLQ3Squ6jWvE20WI
	 ABOaAyjP8RI9z+xxeEIxKsQ1Boy31OnWDmSvf6NQ/ce7dYlQHUWl5iTK2Fu4veILbfLEK
	 0rsyU6wmrkK/cBPxvzYBrI3rM5Nm6qgFc0Bmu7vebB3pXQx9lxdDENUiUbVJPuMjTyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793220536;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=vc9uFw9UVF1A8RYaaUz33Ia3H+vJB3EZ/DUe+0FMK90=;
	b=KdMdk214sznQyQAsYDOqh1brLWUsv9MbQSJfLrm9K7WQvG/RBDRCRD3VBkMvRJhzV11H
	 MBqeejvIQ64rmAEapaOCbdt35L2Y6zLmiVirzScach8OST8wJTXdu7BD78sMxEBCJQeF/
	 TVPdU9Wxi/R1V/nvs2+FUAhPi8Dafkyai//340dt7xjIkNES5+7ywt+pm+JjtZii1euP+
	 R0A/Go6fCNqMpa7LEjyk9Tldjo9+uMLhOYM3t8qAks5TrTNWmFci6RjZ0ZVwtv5xKb3Uk
	 YNqs05nwFDFR0Sood/ecqjz8LmO9izgJObm+g9DtMaQzoOJisLNM2WkCmmJuBEqbviw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=kSLGHIJq;
	arc=none smtp.remote-ip=209.85.167.175
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F98606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 20:48:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1F98606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=kSLGHIJq
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-504ae5941faso787482b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793220535; x=1793825335; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vc9uFw9UVF1A8RYaaUz33Ia3H+vJB3EZ/DUe+0FMK90=;
        b=kSLGHIJq8n1yNc5ysWmES9Ntc1ov/5WFPhTdXo+jUEFD5soxrpRLj/9bztaAoSd0MY
         BeuEUfDzpjOx0AfwrLFqw3ouH/CxFYtKhUAsM5GsOXFz0M2zTsUVcefIWYRS6fAg/liZ
         QfbLkf5hTHyRQ6imAGkUgzqoFthCTPz+egmEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793220535; x=1793825335;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vc9uFw9UVF1A8RYaaUz33Ia3H+vJB3EZ/DUe+0FMK90=;
        b=PSr0XFU9lQEPnxSECdpxgGnhw0j5sERPzMv82LQ/EeYhOjI808qV6SFTtZtc4dwwFE
         eY1B3OM7lzfovx42DV8pY/Wgw2FDl+oZLl3RR8XvkUX9b+WHYraMs28tFt6XegeqHRh3
         GnwhGQ4LgYNMCpi+MBP9RoVrWGAfEb5Xupk9SWnUM7gswnDhvEfSzZM2RJ0ISntaHW0d
         tVOKFz81rsfIv7fGSRUlEkUy4nwU37SSP1Dv0gT+4nV/gnC6623b5tsL1aUhuMuqcapB
         l8MO6/tp4ea/BOns2kPtIL2Qgf7j2DWIPu1d6di1Yy8sYcoP9TqhttycMrc3L2xyApUH
         jLDw==
X-Forwarded-Encrypted: i=1; AKwUvBxLDr+F76CkNM7hdgi3Zh/7Jm/X94j2/YPD5ozEGYP2pCDTdE/GXs4yS44wckBENTeGAER9ofdWo6pDgXw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLIDFN7YgHYAY2tC7GEEdyLKzp8Oz62hNAYB3dHlLQZNGx6LB8S
	6dEYrr/b9/abPIz00lBYoC2erxcLzq5jH/apz/67TxmrglhutbXmwTUlUegaX2OSug==
X-Gm-Gg: AYBFou3woUT+4+CjPOIhpTfTZqhvDcR/tWo7AAz3jIXw77di+3JyZLyJU2JKsVp/+O6
	70/YOYzCK2Uz6ldmiugeHXArRS6f8X38gchMRc0VyeM3tw5iQb5eKTj8yGLKdeF0Ibr4mSm5g7B
	ZUb+dt178q8gnoA0Qbr3/33usxaRtO8g7wGdjWzdPjaIqEwbkHYC3abXndN3mXDC1nuAl04UQJW
	c6EahOthYRnsPulo7w3W4zAQC60HxL/yRYur9LQactntF4daLz3j7RohZ1hB77bDes3RciWMwer
	WMOl9BBfcj25+Z7hKtd57ObyYluc2e3RYN9nM1enilVWrObfWxJOlV7Sr86NRSovEfXR9O20u/4
	2IR0PjZ/kESk1SwVpG0N7eu78PNeGo4wS3nwWC+k2j1bbmZCSTU9S+Gukg8C/5hAdBepVoKxhMo
	uL7aVqCEG228ZuqEz+Kv+SGcfQ85DR2dTHYvsr0lAeR/wG/sA4qI66qo4hsOtcjwZKNxIHt4T+J
	JpYe1wmpWGPgx3mFoZffMWOQyapS6zYeFL+HjBKmrJ8L/YOG4FQAyiFRD5mIb8maLEyHoeyXlHA
	ES5kyZOoIwdH+eb44owlO1b8lOXPrB0pRH1fT1K/CRbvTvPtLkmQVBkkzzBziUKq+R2U0bovgKv
	sU0p20ARzcxRHGPxxKg==
X-Received: by 2002:a05:6808:5090:b0:4c3:9892:96c3 with SMTP id 5614622812f47-56385c45dbbmr2597003b6e.22.1793220534711;
        Wed, 28 Oct 2026 13:48:54 -0700 (PDT)
Received: from rrangel.c.googlers.com.com (202.168.136.34.bc.googleusercontent.com. [34.136.168.202])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-563c363902esm2281137b6e.2.2026.10.28.13.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 13:48:54 -0700 (PDT)
From: Raul E Rangel <rrangel@chromium.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Tony Lindgren <tony@atomide.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Timur Tabi <timur@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v7 5/5] serial: 8250: retire canceled RX DMA before reusing the receive buffer
Date: Wed, 28 Oct 2026 14:48:47 -0600
Message-ID: <20261028204847.3471382-3-rrangel@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261027-submit-serial-8250-dma-cancel-v1-v7-5-985a023ba4b4@gmail.com>
References: <20261027-submit-serial-8250-dma-cancel-v1-v7-0-985a023ba4b4@gmail.com> <20261027-submit-serial-8250-dma-cancel-v1-v7-5-985a023ba4b4@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi James,

In serial8250_rx_dma_flush():

> +	ret = dmaengine_pause(dma->rxchan);
> +	status = dmaengine_tx_status(dma->rxchan, dma->rx_cookie, &state);
> +	/* A completed transfer may reject pause before its callback gets the lock. */
> +	if (ret && status != DMA_COMPLETE)
> +		goto recover;

Checking `status != DMA_COMPLETE` assumes that whenever the hardware DMA channel
has finished transferring the buffer (causing dmaengine_pause() to fail because
the channel is no longer active), dmaengine_tx_status() will already return
DMA_COMPLETE.

However, dma_cookie_status() only returns DMA_COMPLETE after the DMA driver's
interrupt handler has called dma_cookie_complete() / vchan_cookie_complete().
Because serial8250_rx_dma_flush() runs under uart_port_lock_irqsave() in the
UART ISR, if the RX DMA transfer finishes in hardware just before
dmaengine_pause() is called (or while local IRQs are masked on the same CPU
before the DMAC hardirq is serviced):
- On dw-axi-dmac (drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c, used with
  8250_dw), hardware clears CH_EN in DMAC_CHEN when the transfer completes, so
  dma_chan_pause() times out polling DWAXIDMAC_IRQ_SUSPENDED and returns
  -EAGAIN, while dma_chan_tx_status() still returns DMA_IN_PROGRESS because
  dw_axi_dma_interrupt() has not called vchan_cookie_complete() yet (and
  dma_chan_tx_status() also reports state.residue = length for non-cyclic
  transfers until dw_axi_dma_interrupt() runs).
- Similarly, tegra_adma_pause() (drivers/dma/tegra210-adma.c:696) returns
  -EBUSY and omap_dma_pause() (drivers/dma/ti/omap-dma.c:513) returns -EINVAL
  if the hardware channel cleared CCR_ENABLE before the DMA ISR ran, while
  dma_cookie_status() still returns DMA_IN_PROGRESS.

In that window, `if (ret && status != DMA_COMPLETE)` jumps to `recover:`,
dropping up to 4 KB of received data and permanently disabling RX DMA
(dma->rx_err = true) on a normal transfer completion.

Also, on a related shutdown note in drivers/tty/serial/8250/8250_omap.c:
omap_8250_shutdown() (line 775) still calls omap_8250_rx_dma_flush(up) before
taking port->lock to set up->dma->shutting_down = true and clear UART_IER = 0
(lines 783-786). Because __dma_rx_do_complete() clears
UART_OMAP_IER2_RHR_IT_DIS and dma->rx_running = 0, an RX interrupt or callback
in that window can see shutting_down == false and restart RX DMA right before
serial8250_release_dma(up).

We also published the TLA+ model and TLC counterexample trace
(Serial8250RxDmaV7_HwDoneBeforeIrq.cfg) here:
https://github.com/ismell/linux-8250-dma-tla

Thanks,
Raul
