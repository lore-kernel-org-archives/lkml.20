Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793312861;
	b=Pu3f06LnWQWenEGp/lvNU7gL9VhavgvM+0s0Z9+Ut5YpLs4QNJ46DRZXkSswosuUK8eX
	 Ec6NIk859onIiBwR9ii6+6/VZJCCTW4IHa3tTCY6D+CKM0x0GmrmXKUQEQVQJIhwZvPJ1
	 7mA2COoP+dn6ZBRWFSK+kPvvwk6Y39wAIAjAvmntHo8ConcT8Zp9Y6lHOJ0L57LsvwnO2
	 uwbKvmgEWpzy5WX4mtsn5vTdqRLDZaA4IgrxTtyOJ4B7CF8KLvsbthC+f3N6nMYWF+LNt
	 UspyRquDPQ76hDuRazj1KA4UnmJXogCQfsuL2805ZTFikfLV7HG8NdsNzSaGHcwHnvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793312861;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=XxsrJQyS+nOjzlF7/QV42KG9lGt3qkw3rRZfnV8/yI0=;
	b=DLYd+wTHEywW1U6dao/q9JQT9BGeGFCWWH8DH/2B7kMrWL3nxDbx6BQMTpHJqUrDD/yD
	 5ItGlef+5ShkxZbOrsJttgZbsL8aRbsQLL1vxurNfOAV6PGK0gzs1ZNj6b6dDgd7FiWws
	 CN8tUSjix6U9Ut3OhYr+zsBoTB4fb/1kpQ3fQZoz1TJOqiD3o56rY9GtKDN+jElK7K7nL
	 5BPCqwJek6u8F3FmaowY/EVBFOXd2QPGJiz72zsBlFJ7d7YCRGODKyGTcM31ZSbcv7w18
	 gooLinVCwEfXJfGOtQJzYaMcK/LQs/Q7H9xAaJeCVRueNmdexTfV/wOifS4NIPD97mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=PV3brxFj;
	arc=none smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8F8606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 22:27:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E8F8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=PV3brxFj
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7f48c750afcso113897a34.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793312860; x=1793917660; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XxsrJQyS+nOjzlF7/QV42KG9lGt3qkw3rRZfnV8/yI0=;
        b=PV3brxFja/0ViHKA6sjZ1s7p6JZlJ2qsB1aIR+5RuuFzXqw57gy5VPm0tKmmP1npQb
         Mk2NbiTQZBafhn1D6ImE8MgzmNgdP++v3nFGCD5jSaH3QUkpE7TNQzIt8LuS3xnXdAZn
         8VFqAvUzKxgHNWNQ1OKNE/hxBSmtWW05yvgV4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793312860; x=1793917660;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XxsrJQyS+nOjzlF7/QV42KG9lGt3qkw3rRZfnV8/yI0=;
        b=v7d8YmRGXmD551CsgJhzFy7Sr0qFKlzmkyQ+2Y2Ps2py9lLj9sXuiDhCTl8tg3krMn
         +Rjes7J8MSvoBFqqi/X9IDkdQbpzYVErPMsFilhn9ZQse7nBCH0AHYE4bKp3/79NOJHz
         ioL+Viregm9OsxM/rOfwrQN48izviaK1Sa+Wi4qfQmxV1WNChgh59PU1aeEJM4w6yDTa
         oeAuvrnP6yb9GhvS8zRzcOr2V6YeL+or3awZ+raP6ttFOtKPaYJ9AhAix3jMqfO9+bqV
         uEQLPqngR2VZZdVL/ovKtjyeNkrGJt624UdQdLJ9Hc/EMyK+qVLRgwtzVg9RBsSCXA80
         Wcrw==
X-Forwarded-Encrypted: i=1; AKwUvBw3OCAD7iiOkhbj/LIlNqPv93T4XibpP5aXRUB7e5saZT0zk+RRxzNDBQhErBpCbJbWWRKUzXu4MirPkV0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIstJH/CfrwyIJ+Dax9EADjtDjGxOyOHf7CmvpF8z13j5uYG4EC
	pos8eV3gHgbA2GOueTrGc1ZGBQCvVJZm44apD8/vMwnhNB4yrU2UO0vteV9mOkjaHg==
X-Gm-Gg: AYBFou1w28TYINUT/CAJXEGRGGPZ1LZLm7df+IBKl/2RxAaxoQNIpIKtZkTuX76Pj+O
	Xzs8u9tlNoXmvuHpfpAH51VyWBvGOIdPZTLYrMR80yvPM7M9Id/P+7a+FdXhps+IGP1XNKKRr84
	2iqc7P8N+LU3dX5XM8Lb/7iCpgMsWzX+qCwcKCB8K7jk2U1qxPLLz6o0Q5WIl71Cy13AMtJsaxc
	KiVDQ9Jjoa5V0br5hms8t/jiW9pzReAloy2KmxpE6X/xBJe8DnKPoefnNa7xe5kf5m8LyH/vbV9
	HdxzUe0XO5AAnab5dnjyxzF7WS2eJm8z9hTvZ66ecrernaZAuRSBuxu1TbI2IX+Smx1eqip1itf
	LCJ5inSd/X7LgCq3szAGhB9ww6W/tfQ46WiVJlpf3lKS7eqHKLjiH/WIceQiPer2j9g3Z2kAlYV
	s9rRQDC/tlwuHwfM23hNFqZ4/B6yVXvAtWdnqeoWWbsb4UqoPmF2VgVPhait/uGPsp/+Pq8FmWR
	xjHD2msLQZ2RfgL1chPa3vO08oDwTcOwy/wzsRQUqR4vzsURGeptdZHspu42Sls7OzLTel2N2b+
	X5vz9LNTr4/eneeoRTb98KYG7OdjprMaO3+Fw4TQ8PGd8ntbmd4w9A/P5hE/0RCbaEVYGsLetm4
	ukVWqhEwjzY70L7Qap1QdX6GGsSwol9YTf6JZ
X-Received: by 2002:a05:6830:2641:b0:826:b77:adef with SMTP id 46e09a7af769-85d363b89f1mr545837a34.14.1793312860205;
        Thu, 29 Oct 2026 15:27:40 -0700 (PDT)
Received: from rrangel.c.googlers.com.com (194.246.27.34.bc.googleusercontent.com. [34.27.246.194])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d3545b89asm718163a34.6.2026.10.29.15.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 15:27:38 -0700 (PDT)
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
Subject: Re: [PATCH v8 5/6] serial: 8250: retire canceled RX DMA before reusing the receive buffer
Date: Thu, 29 Oct 2026 16:27:33 -0600
Message-ID: <20261029222734.3086943-1-rrangel@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261029-submit-serial-8250-dma-cancel-v1-v8-5-3fd56ba352ed@gmail.com>
References: <20261029-submit-serial-8250-dma-cancel-v1-v8-0-3fd56ba352ed@gmail.com> <20261029-submit-serial-8250-dma-cancel-v1-v8-5-3fd56ba352ed@gmail.com>
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

Thanks for the v8 updates and for opening PR #1 on the TLA+ repo! Confirming
that the v7 issues in Patch 2/6 (lantiq, dz, zs, jsm_cls), Patch 4/6
(__dma_tx_complete tx_running check), and 8250_omap.c shutdown locking all
look resolved in v8.

On Patch 5/6, we updated our TLA+ model for the new rx_pause_pending worker
retry loop:

> +	ret = dmaengine_pause(dma->rxchan);
> +	status = dmaengine_tx_status(dma->rxchan, dma->rx_cookie, &state);
> +	if (status == DMA_ERROR) {
> +		ret = -EIO;
> +		goto recover;
> +	}
> +	if (ret && status != DMA_COMPLETE) {
> +		dma->rx_pause_pending = true;
> +		serial8250_out_IER(p, p->ier);
> +		return ret;
> +	}
...
> +	for (;;) {
> +		scoped_guard(uart_port_lock_irqsave, &p->port) {
> +			if (dma->shutting_down)
> +				return;
> +			if (dma->rx_pause_pending && !dma->rx_terminating)
> +				serial8250_rx_dma_try_flush(p);
> +			retry = dma->rx_pause_pending && !dma->rx_terminating;
> +			recover = dma->rx_err;
> +		}
> +		if (!retry)
> +			break;
> +		usleep_range(1000, 2000);
> +	}

This cleanly resolves the race where a full 4 KB transfer completed in
hardware just before dmaengine_pause() ran while its DMA completion hardirq
was still pending (once serial8250_rx_dma_flush_work() drops port->lock and
sleeps, the pending DMA hardirq runs and marks rx_cookie as DMA_COMPLETE).

However, what happens if dmaengine_pause() fails on a *partial* RX transfer
(0 < count < 4096 bytes) during a normal UART_IIR_RX_TIMEOUT where the remote
peer stopped sending and is waiting for a reply?

(In PR #1's Serial8250RxLifetime.tla, Spec puts WF_vars(ProviderProgress) on
Receive at lines 67-70, which forces the remote peer to always keep
transmitting until count == Capacity and CompleteInHw fires.)

When the peer is idle after sending a partial burst (< 4096 bytes):
1. Hardware never reaches 4096 bytes, so status remains DMA_IN_PROGRESS
   (neither DMA_COMPLETE nor DMA_ERROR).
2. If dmaengine_pause(dma->rxchan) persistently returns an error (-ENXIO,
   -EBUSY, -EAGAIN, -EINVAL, etc.) on that partial transfer,
   serial8250_rx_dma_flush_work() loops forever in `for (;;)` calling
   usleep_range(1000, 2000):
   - It holds a runtime PM reference (`guard(serial8250_rpm)(p)`) and wakes a
     system_percpu_wq worker 500-1000 times per second until the port is closed.
   - RX interrupts remain masked in hardware (`rx_pause_pending == true`), the
     partial bytes are never flushed, and the port never falls back to PIO.
   - On 8250_dw, dw8250_idle_enter() gets -EAGAIN from serial8250_rx_dma_flush()
     while rx_pause_pending is true, causing dw8250_set_divisor() and
     dw8250_check_lcr() to silently abort baud-rate and LCR updates.

Since the only reason to retry pause/status is to let an already-pending DMA
completion hardirq run after port->lock (and local IRQs) are released, could
we bound the retry loop in serial8250_rx_dma_flush_work() to a small number of
iterations (e.g. 5 retries)? If rx_pause_pending is still unresolved after the
retry budget expires, calling serial8250_rx_dma_recover(p) under port->lock
will set `dma->rx_err = true` and `dma->rx_terminating = true`, letting the
worker exit the retry loop, run dmaengine_terminate_sync(dma->rxchan), and
switch cleanly to PIO.

We pushed the updated v8 TLA+ models (`Serial8250RxDmaV8.tla`,
`Serial8250TxDmaV8.tla`, and `./run_v8.sh`) to:
https://github.com/ismell/linux-8250-dma-tla

Thanks,
Raul
