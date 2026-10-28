Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793220534;
	b=lio5cHstrJIgyIhzyEmPtkPojp79q04BEsdeG5Bia9gDLDE1hpRZvScC9+chQLCKnmDs
	 IkMGknvYCK1WUZwXuoxhVjnmi7OFMsNwEcrNNvtlxZqUhGTFRwX7/8RPDAxSNelMMymYW
	 e7i1C/W1EygIU88Hfh8fH0tqWgOFkk7o018ri669xZol54Sg5KTH4YnALsE5QdIAnbxEb
	 okuSYnIwueAjNSXv42ztPV5OzMzW+N9h3B4k+h9CcBXR5QFCIeq0GFhvLoRUYdnSTZMlb
	 SwqPnB5Hx5in+pWTSxpiWLJ3I0GIHsWiDAypM87tWl1RFe/rTNcf9CFB5qEI/gdlmlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793220534;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=KlFs5O5F58aRmAuOBc20ZN5pSWMjbwV9elx9B8mpSCE=;
	b=nvQWUTeabdjRyXCZ+tEWeJJGRciiiN1qo1QoS0JmR3IC5ZQjoozReawXhQ5MhIgJ8Rc9
	 N5SlNOvm3fxgYl8naL2jAqXK2upyFlS4+Hy+dSNMLJuWatYtLB8aNsopZjqv9mbwHeOiF
	 oMycgOHuKImcILuMvi9CGx9sMv7e6ry3zIoTc/pGoLbr/IsUULGEYE4a+arxPh8wiNKUJ
	 j6udzM9o1//vJFfpJSl3HN1HwsTtf7jiSa1ltbmABsREeaq4G2FzZVeISVh+wC6knG+tk
	 4s6jOkxUi8FuCifpA69Tt7ZL039q53Bce6it78325CzNzO24gTGPD1cudHYVdefWkQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=UJmEjCNw;
	arc=none smtp.remote-ip=209.85.210.42
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5F8606A32E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 20:48:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE5F8606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=UJmEjCNw
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-843b6f8e2c7so1685412a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793220533; x=1793825333; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KlFs5O5F58aRmAuOBc20ZN5pSWMjbwV9elx9B8mpSCE=;
        b=UJmEjCNwH0eXXFRY+rzERh00mhJ8UM+qtWMshC2fkVmbjNm87fx0j2kuFLS+4sJTiZ
         exfv28jgUUV3E0xDyPqFmVPOWPKhC23AxWz+5bS81J3PqvZHaFZhUNPAGWDyX8vSLXvs
         1h0s2rJsmBR0IhwHDSjBEMx8KeXim6wOp+CYA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793220533; x=1793825333;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KlFs5O5F58aRmAuOBc20ZN5pSWMjbwV9elx9B8mpSCE=;
        b=r2cVVSeummafaG1hiHz2irp1jXcR2nf99WI25fzMsgUd0XP04y7VEbhmViiKQqsbdS
         Kaao4d40AnYmHwIoXoX8e5SW5XuL/5NjhZYoFaBKeaDbwJyPegRYwZByRnfbVEcARuA+
         tproEsJvmZDvhtqa8ECtqpGmzbIOZyo5L2knV9+aNu+HbZhkYiTqNnAr3yCdKbHfpR1j
         RxsBccczfJmVYtE96Zq9ZaqsgIBqDqMiOLOyMaXHnesrMD5v/ptI5jrivhMIoXVyuXA/
         i8gbFyCmWv/AFQB6mdZI1PFINnd8qi7ZMEbERCXkcVD46Nwd0KSnzWqVKaKC/Zr2kx/I
         +JLA==
X-Forwarded-Encrypted: i=1; AKwUvBxbXABMBnTpZEp4Pu/IPgLe7HMzt3UHf47g+LH88lrCY7oL1j7JOJf8mNxqA/RCVlhyaSVk+go07D7g7wk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLVCE5y07mrUBmZua6svXq8di9yBwSODr1TuEZMryUVVoP/H4MC
	Us251wUftynGVJvRuav50fYAA87THS9ovAQPjrXy2c8DiNwguDFLrUlGJNdBH3gy7g==
X-Gm-Gg: AYBFou1CBIy13uSrDOA90VWry11wucCiftW9QZk/joq5bFaXMgfGmimlH98ZlzHz71r
	JzN6Slub8fqI3rig/wpeF97SjGv/U6SblB4SOmEiU59K9xhi2gSk0HYf+xeKbNmLJq3jf1r5rRE
	kEi7iphHaI/yTEXsuEz/porsLCTsXtRPDkQYiDfTpYbqAymfmtRRq6q5W0FEvmih/N4kTK09b8w
	3kMqBjeHD2XnHADTEaswIGmWWQzqqbaD9mtM6sFw1YxB8xhYXJ2UZYF+DUnuJsDogyoB2ejH52f
	hQ+im8TsWcbrtVwCkvnX0mCNjSfOeJ0yovXGdYizUdyaSZsFQj4WXTMTQNpdKvpNSrvGQnaq1tF
	BvcHTjX/IupD3+6NRp3TPVYQBECeS5soQMzE4yjK8pTBA8vIV9vvNuUFm9+Q0MBEmPx5HTVsCOc
	k0ZN7+1y7KDNHyvbTvJXx3F/tKv2CgAR///X0EdWu/CRFJ6B9wtO4Ky4nUo+Rt55R6PC5UZnTnr
	KEtWhHZiLqNED+BVGSaJocEToZvjUjumre6adUJoYBfRQh5xdwqTDdSP1X3JM4SaGZwCuRWM0Q8
	1C8a3CQCnf3We2Nw6CSrd8kkuCQT0bomD/dAmcJu3M5M2v+l2Mq/7+OWdUYNx4C9sO3FUpCZZ7S
	2dOLDYW6W9GW68y1b1Q==
X-Received: by 2002:a05:6808:4fe6:b0:4d6:90d3:e18b with SMTP id 5614622812f47-56383e93e14mr3396274b6e.52.1793220532771;
        Wed, 28 Oct 2026 13:48:52 -0700 (PDT)
Received: from rrangel.c.googlers.com.com (202.168.136.34.bc.googleusercontent.com. [34.136.168.202])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-563c363902esm2281137b6e.2.2026.10.28.13.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 13:48:52 -0700 (PDT)
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
Subject: Re: [PATCH v7 4/5] serial: 8250: drain canceled TX DMA before reusing its buffer
Date: Wed, 28 Oct 2026 14:48:46 -0600
Message-ID: <20261028204847.3471382-2-rrangel@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261027-submit-serial-8250-dma-cancel-v1-v7-4-985a023ba4b4@gmail.com>
References: <20261027-submit-serial-8250-dma-cancel-v1-v7-0-985a023ba4b4@gmail.com> <20261027-submit-serial-8250-dma-cancel-v1-v7-4-985a023ba4b4@gmail.com>
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

> @@ -37,26 +40,35 @@ static void __dma_tx_complete(void *param)
>  	struct uart_8250_port *p = param;
>  	struct uart_8250_dma *dma = p->dma;
>  
>  	guard(uart_port_lock_irqsave)(&p->port);
>  
> -	if (dma->shutting_down)
> +	if (serial8250_tx_dma_blocked(dma))
>  		return;
> -
> -	if (!dma->tx_running)
> -		return;
> -
>  	serial8250_tx_dma_complete(p);
>  }

Removing `if (!dma->tx_running) return;` and relying solely on
dmaengine_synchronize(dma->txchan) to drain completion callbacks breaks on
DMAengine drivers used with 8250 UARTs that do not implement
.device_synchronize (where dmaengine_synchronize() is a no-op), including:
- drivers/dma/sun6i-dma.c (Allwinner H616, cited in the commit message)
- drivers/dma/dw/core.c (dw_dmac)
- drivers/dma/pl330.c
- drivers/dma/mediatek/mtk-uart-apdma.c

On those controllers, if Transfer #1's completion tasklet (vchan_complete,
dw_dma_tasklet, or pl330_tasklet) has already dequeued the completed descriptor
on another CPU, dropped the channel lock, and is waiting on port->lock at the
start of __dma_tx_complete() when uart_flush_buffer() ->
serial8250_tx_dma_flush() runs:
1. serial8250_tx_dma_flush_work() calls dmaengine_synchronize() (which returns
   immediately because .device_synchronize is NULL), acquires port->lock,
   clears dma->tx_terminating = false, and calls serial8250_tx_dma_complete(p)
   -> uart_xmit_unblock(&p->port).
2. If no new transfer has started yet (dma->tx_running == 0), Transfer #1's
   in-flight callback acquires port->lock, sees !serial8250_tx_dma_blocked(dma),
   and runs serial8250_tx_dma_complete(p) a second time even though
   dma->tx_running is 0.
3. If a writer has already started Transfer #2 (dma->tx_running == 1,
   dma->tx_flushed == false), Transfer #1's stale callback runs
   serial8250_tx_dma_complete(p) while Transfer #2 is still active in hardware,
   syncing tx_addr for CPU, advancing xmit_fifo by Transfer #2's tx_size, and
   submitting Transfer #3 concurrently with Transfer #2.

In addition to implementing .device_synchronize in the affected DMAengine
drivers, __dma_tx_complete() (and omap_8250_dma_tx_complete() for symmetry)
should keep `if (!dma->tx_running) return;` and check
`dmaengine_tx_status(dma->txchan, dma->tx_cookie, NULL) == DMA_COMPLETE`
(matching dma_rx_complete()).

We modeled the v7 TX and RX DMA cancellation state machines in TLA+ to verify
both the counterexample traces above and the fix:
https://github.com/ismell/linux-8250-dma-tla

Thanks,
Raul
