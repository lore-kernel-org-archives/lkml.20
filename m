Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792682426;
	b=TshrnFsonIVYtUmn8dpxRQB+5/QRngPobV2bQ/hPow9+1k4smYvN6CQpYAnbFSvRmDhm
	 6vkF7R8svfa7D7I0y3SmYyfqMlfW0xlthqqakNZ+VTiN2Ve/01c1xxaQzT+yxTqQOQHUJ
	 m2JIQQY7H0k4hPMgF7eCtnGlq/OYy9L+Q6JefkvkWD9pgEjpl6hbugfksR8omhEzyiT7G
	 sjamzrZx7Xa07KdEaRVTIGCjgvp4sKnK1BpYcDCBq/DwyZrQsj3Z6pI1hGmv8SvJ2ko8y
	 XLRl5qadJjb2nA4OaME757/c83+SAnsJ/U+TdFvN/GgAMlRSjMX8uhxz875DEzvaSmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792682426;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=rRi45sW2+bKKrACqOGGFs9zVqBs9HnBDWjRGt4baDbY=;
	b=ifuVJTQj3fw0JkuWaJDu1pUHhPHN5lnZEqbzVW6iVnNi7a47yvoSWgoufkX3ONYFvXmX
	 q9CGRKCvW8S1FXO9lbTlFT1U2DtSFADm0lkxYNsVtJ4A8ZxLO6zDoSMh0PDmc8fSKfAQA
	 V5LWRzZi5glSyDa3D8Pyl+yO8to8MtVp356yLWQT1mpEBF/YQttJtK//dIwOJsrPTnOvw
	 1PbjLw3DXeqc3o6GSr2FCy4wcseKzIyLiIfMQIQvZ323BOxsd/K4A331e355uvrfzGgRP
	 WqY9a0sg4t/DNNzshuFeI5gj7RF+91fu3Nnd2OpwTCpFicfEOnnOGKxQphP14M47u3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=cMb86KTk;
	arc=none smtp.remote-ip=209.85.161.43
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B76D606ACDA
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:20:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B76D606ACDA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=cMb86KTk
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6f5a0893610so1212463eaf.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792682424; x=1793287224; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rRi45sW2+bKKrACqOGGFs9zVqBs9HnBDWjRGt4baDbY=;
        b=cMb86KTk8lCTxsh5V69XHaUYwuaSrvX6oIvt8qinCGAkllJxt++dqbZuO4jBWGCynU
         KLRmapo+9/nZ2Y+fK1g5ifPZ5Hd4c9R+amxHoZLMUFH3aBvTUztK60dCHqcNU0V2bvto
         ljlvuZDuVYMdxevQ+GwIsX7abVbGs+oCgFh0M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792682424; x=1793287224;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rRi45sW2+bKKrACqOGGFs9zVqBs9HnBDWjRGt4baDbY=;
        b=Gov5m6YAZIoOGzcboswWU8FOb5NlkKEOL+R3goL6ySZr5MgaJPV1OgndkdfBlLGn5z
         nsSwX5cq9SefulCMhKlGf7CfwLe2cALuMMeAcSL6iFV+cNHd1/IEYngO3cSt4KMPKZ4L
         2wS1kiXpI2C/VajC2QzjsTw2cZygpy1EyC0Lm9wQQBfVflzrD9gaa1NypAQXDATG3ZeS
         89t5Qjxk8E1Xy/3Ef8y1dxz/xnZFnolWpx4VVElsnoQiOpnQKoFMIK6NY0oKeLlpyEez
         XDkaZo0tk1lgamY5Dgi56g9GKFcpWr1lal6kUmnB/yPjMTsqDKMUuFeYtB65p4UJwgib
         wafQ==
X-Forwarded-Encrypted: i=1; AKwUvBzqexgzCmGpx4zfSBMrA4TlLo+ZkK4G8zu/mWdV93JeZKcpJ0XDedlg5GE0bdyfLxpk9PxU+rULDwdpOWM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+0gUIVQS3MSJdukxC+suC7dmBss9cln1eTqC3pTqZIiV9dxfb
	NYyq17pfNFBgbfFjpWCoBg5IsXcJ1twiOuvmUOEdA26YEG32Ls4JXaEbTujQCfbJUg==
X-Gm-Gg: AYBFou3+ucATVkdAzcvIlmHCtHi5LCuTX2+nieHQO5WIxrnZBKDXUDNkzqGDeoyL5Fo
	4/UFQVCS9x9zzaY4bGlDddGc2rJ8fIgU2g1aEC47SL2YxguLWJ5KCEa75Iuxc6BNrHeDilh3LB9
	V0+XjqGxYGGKVB/IoNZucPnVmy0Ka7bKGmptl8ZbZK3nra7GYK0HodKJKV7PJCWmVfCD19OaBVv
	DuppITuBVRHbSDjT8LYjo8C8yz7kq15JKuUYRXP2TV52jC/5qq3sifL7Vr52VieY/kL+OOZgeZb
	yZifpW1lP9S+eLcyfF7mcozDWoRHWCy+M8655pAoKX7SKFEf0/Pg1VugqEDAr0puy/7Ers7nUHb
	3OUWmxBfTMNdQRS986sZztJS44tKj9iEF9QONEIW2RAihNeqLTrb3skIZ/keIF+eshI0N6ujBJe
	x0oOqvYwkprnb9a83JDuu/TooOQKBaa4RwMHM9WlwSG88zhkBHTGsNrf3/9ouq5+LKpOSkGCu0f
	Df5eOZ7qgZaR0Xf7vNHamE9xN4uqojCut1i7y9kFGW1LKZK2vDL5tcnn8FxaK7atM0FMxf19ohd
	BNT2LdOOu6AGXOmoZ4p6bAh+oyVlXbxm5V7Gyn1R6hRS
X-Received: by 2002:a05:6820:1388:b0:6dc:16e5:d37c with SMTP id 006d021491bc7-70942b811f1mr3814505eaf.85.1792682424578;
        Thu, 22 Oct 2026 08:20:24 -0700 (PDT)
Received: from rrangel.c.googlers.com.com (202.168.136.34.bc.googleusercontent.com. [34.136.168.202])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84f774321d6sm4814a34.9.2026.10.22.08.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 08:20:23 -0700 (PDT)
From: Raul E Rangel <rrangel@chromium.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Ilpo =?UTF-8?q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: Re: [PATCH 2/2] serial: 8250: retire canceled RX DMA before reusing the receive buffer
Date: Thu, 22 Oct 2026 09:20:19 -0600
Message-ID: <20261022152019.1621716-2-rrangel@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261021-submit-serial-8250-dma-cancel-v1-v1-2-efe2b89f2303@gmail.com>
References: <20261021-submit-serial-8250-dma-cancel-v1-v1-0-efe2b89f2303@gmail.com> <20261021-submit-serial-8250-dma-cancel-v1-v1-2-efe2b89f2303@gmail.com>
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

Beyond the two issues Sashiko already flagged (`dma->shutting_down` not
checked in `serial8250_rx_dma_flush()`, and `DMA_IN_PROGRESS` rejected after
`dmaengine_pause()` leading to an unhandled `UART_IIR_RX_TIMEOUT` interrupt
storm when `!serial8250_rx_dma_flush(up)` returns `false` in `handle_rx_dma()`),
there are a few additional issues here:

> -static void __dma_rx_complete(struct uart_8250_port *p)
> +static enum dma_status serial8250_rx_dma_complete(struct uart_8250_port *p)
>  {
...
> -	ret = tty_insert_flip_string(tty_port, dma->rx_buf, count);
> -	p->port.icount.rx += ret;
> -	p->port.icount.buf_overrun += count - ret;
> +	count = dma->rx_size - state.residue - dma->rx_pos;
> +
> +	if (tty_insert_flip_string(tty_port, dma->rx_buf + dma->rx_pos,
> +				   count) != count)
> +		p->port.icount.buf_overrun++;
> +	p->port.icount.rx += count;
> +	dma->rx_pos += count;

1. Accidental revert of prerequisite patch [2]:
   This chunk reverts your prerequisite patch ("serial: 8250: account for
   partial receive DMA delivery to TTY") in `8250_dma.c`, restoring the old
   `icount.rx += count` and `icount.buf_overrun++` accounting.

> +static void serial8250_rx_dma_flush_work(struct work_struct *work)
> +{
> +	struct uart_8250_dma *dma = container_of(work, struct uart_8250_dma,
> +						 rx_flush_work);
> +	struct uart_8250_port *p = dma->port;
> +
> +	dmaengine_synchronize(dma->rxchan);
> +
> +	guard(uart_port_lock_irqsave)(&p->port);
> +	dma->rx_terminating = false;
> +	dma->rx_running = 0;
> +	if (!dma->shutting_down && (p->ier & UART_IER_RDI) &&
> +	    (serial_lsr_in(p) & UART_LSR_DR))
> +		dma->rx_dma(p);
> +}

2. Spurious RX DMA restart during `dw8250_idle_enter()`:
   In `drivers/tty/serial/8250/8250_dw.c`, `dw8250_idle_enter()` sets
   `d->in_idle = 1` and writes `0` to hardware `UART_IER`, but intentionally
   leaves `UART_IER_RDI` set in `up->ier` so `dw8250_idle_exit()` can restore
   it. `dw8250_idle_enter()` then calls `serial8250_rx_dma_flush(up)`, which
   schedules `rx_flush_work`. If `rx_flush_work` runs while `d->in_idle == 1`
   (while the port is in loopback mode reconfiguring LCR/divisors),
   `p->ier & UART_IER_RDI` is still true and `rx_flush_work` will restart
   `dma->rx_dma(p)` in the middle of the idle sequence.

3. Missing runtime PM reference and `serial_lsr_in()` side effects in
   `serial8250_rx_dma_flush_work()`:
   - `serial8250_rx_dma_flush_work()` runs on `system_wq` and reads
     `serial_lsr_in(p)` / starts `dma->rx_dma(p)` without acquiring
     `serial8250_rpm_get(p)` / `serial8250_rpm_put(p)`. After the RX timeout
     ISR exits and drops its runtime PM reference, the port can autosuspend
     before `rx_flush_work` executes.
   - Reading `serial_lsr_in(p)` outside IRQ context clears any pending
     `UART_IIR_RLSI` in hardware and starts RX DMA before any saved LSR error
     bits (`OE`/`PE`/`FE`/`BI`) are processed with the corresponding byte in
     the FIFO.
   - If `UART_IIR_RDI` is enabled in hardware, why does `rx_flush_work` need
     to poll `UART_LSR_DR` and restart `rx_dma(p)` at all rather than letting
     the UART interrupt handler start RX DMA (or drain via PIO) when data is
     present?

4. `dmaengine_resume()` on error in `serial8250_rx_dma_flush()`:
   `serial8250_request_dma()` only checks `caps.cmd_pause` and
   `caps.cmd_terminate`, not `caps.cmd_resume` (e.g. `pl330` and
   `mtk-uart-apdma` implement pause to read residue before termination, but
   do not implement `.device_resume`). Also, on Renesas RZ/N1
   (`DW_UART_QUIRK_IS_DMA_FC`), `dw8250_handle_irq()` has already cleared
   `RZN1_UART_RDMACR = 0` before calling `serial8250_rx_dma_flush()`, so the
   error-recovery path leaves RX DMA disabled.

Thanks,
Raul
