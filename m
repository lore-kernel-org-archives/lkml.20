Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793294415;
	b=Yu0TR25Cj6T/SXWQH5K0i7sSb1qmanVRJ79LhI0j3fCgOGnQc/NAyYrStHr3SZmBqRNR
	 J1kP3CIA4xF9Gz07Yvi4lE0+kySCMnkz11FX5z5DOtGR9OTZPaFQTxIkSslbdU2YLMnMp
	 ZEG8bO/GqXOMUNzO/36cKZlr1o2ioWLTSi+AHJ4gH7OL355bl1bDAW7MQDVU1tnJSm7+y
	 aTD5VOga9wzBRTLRl4dS5JGQm/ZkORzpjVRtTmhPiXzRtS5ucTcQj0w0sc7CYyPiTX/1F
	 l5hEb8+zdOtjooEIF4d95sNa3QchbKON3QpRcT8/4L6PhyjVH6S9I9l5dqyPQdx7+NQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793294415;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=DcHId9d7ZivTlUPflcKuYmygXozfLhAN5Qcceh+SBys=;
	b=eOpF87CgxVZTEnzotlX1DDsSNw1tUbAAnkSSoNM+P89HoAXQWv3WUppal5I2CT77ocoo
	 4IpBMxNQSiroml0UC9h9RUl4oziyVt/nh0zu6Kgo6io5GJzKlIogPKrr2CWtvvsxOog4w
	 V3hYXKdu6QhvpB7vNTLLQ/GGRE5jybYnOci/BXpb0kz3inp2FXcW37AP7yLokdI7O07pE
	 LMG5kb3xK9qibF1LBHl+e2o2CnLtDL+03eG/i7KcHkSlLHeWW0G1WpwO0CuvdyvLOXJOF
	 3gszLscS8s5GlZwyA2cOW2S/In9m638SSk6KBGUU3CeTChuzFOudpD0kS2u/mmrx7yg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iClSgdm3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB1A606A322
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 17:20:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABB1A606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iClSgdm3
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b40fc523faso2928623a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:20:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793294413; cv=none;
        d=google.com; s=arc-20260327;
        b=QY0kbis0KpoRLBApFGXcOi9+DK+co69xaYTS0hPnW6dUtc/0h4YmuKTMLl2LDIUd2b
         10Mmq+yq3pY1qVbAnd5OkFDEfOrETdYDK/wQf231BpoXqqfpsiM2Iz7C+SI0fNtACb+b
         CbuSzsAHkPDvBF4S2hGu1m2kniiMbMX11CRBwS5Tpj7W/Np6+F8JgANXViUlxVa1WlOb
         SJTa/ji9OFh4Z3hnA9QVV5U5XOLalqrNCEILghMTcoGLYYA/jPRgfch4+W8P2vpmrfkh
         1W+t45sltj4XHFoj0ynnmNqNx1b69FtAWpLHUjuav+s3Yw4BgkYi5/ilxEqI7Prplndl
         fUTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DcHId9d7ZivTlUPflcKuYmygXozfLhAN5Qcceh+SBys=;
        fh=U2Wk/q6MZTpnY6jTH6XBawsFN7gsa4K6CWDE5/r8CvI=;
        b=hUsS6mDMNrq2byiidXz7Km9QRv+Med38304jmvGY022ieofP2OP3XKkhig/Q9K5y6h
         DIuKdWuRWTn6qyQR8nxYzJJ1C8UtuKoMZUXTqNBK187+bxxAFAPDoCUXJWDYLuOeeaF/
         2sWo5l2Y+UMYdgK8EYG3GvbOjn3dSQqRV//EbwMpzG15phKWKtDoFiFxRuMqvKU+JKnq
         S0yIg4aZQaoqMJgUrHaodda5zPjYQ2fT/pml6KKMvJIa3ZwB4CiMhPlKsrv34sJcRUus
         B00UDdlaxM5aNyN0v08rXuEgY4/HE8dxOW8Sy06XqMCiJszlqzL4kGti5e5JqcbE1GgR
         seJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793294413; x=1793899213; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DcHId9d7ZivTlUPflcKuYmygXozfLhAN5Qcceh+SBys=;
        b=iClSgdm353+66m+jUetFLdNYfYlVqGyk/v1YeLwzDgxxrEWL99dgYjUWx0ioykPrm1
         AyG6Hw/UYVEyJG22bvUNGQ47dclMxQMgHPHQSJcl4uo1xrF+b+TBgYNVRhOjFSyFgLHD
         I+FCG5zu/14izwa4G60MTsaz28yyHB5CCeuaMbMrK3zXPDqDECVloGf8TrhKshdhpWI7
         YRyxKcFoRyDpPW7Ubb+UP76LmjfYRy4aYMurmRMP1L2J56IKeSGHIkMFwpTv0Leewfvf
         agi5Ru84lorLuvqTkiLetnhRwGwUBideyMt3vt7PfN1GUrJ1B/RpcsPYr4IOv3g5AsfQ
         L64Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793294413; x=1793899213;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DcHId9d7ZivTlUPflcKuYmygXozfLhAN5Qcceh+SBys=;
        b=qHt9Z9od0qUAuHtGe4XRBwY52U+rRxlbWsy6M9vo0k6hhuyhf/2Ppq/5QcSTNoGXfM
         sI6f2lg2I8nutrHwuyWoXqyuObCM1LKgLQMCD/UQi/1MQzDBP5Mjw9GQwvZVREvTBFHB
         et8KfL4GEWpUhNhoYi4Q+zPNmbVyZMzVaHYWJ8w4pk+g4gpJeJk4nVf9GPejmZ28PD3E
         CuDetuVFJqSw6sR5TIAO5YYLSDfRBI7SFWF20aR3rExzVtqrKtb6hJ/Jhxt//JKmxdUf
         1JSj/wJD4R0NJfDEuPqSLvxurYRwrTS9N6n+pQKqFmUwh4GTG0GoxfJ42BhgwYBEJ9pP
         ObSA==
X-Forwarded-Encrypted: i=1; AKwUvBwhjrhl7cqWOhDs5I1GVu+7YZhILIYvEA5wZyDShPGdcSiI1+xAbvHsmLdDHnqE9g+cUbv06Id1I+E1scs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKUuCIFryzft2V+mCFC6q4TVrI3LeRwYi7pxje67KEu/horYPvG
	ZkCRPJG22ztdwf3pKKajO2wpXQww6uf8K7Ql1oPOobR4A/7xqFAawkTz4xSqrZcieIQlgCMj+l8
	VdAq02hsQaTqwNjziFTOSUxV92pQN7Zk=
X-Gm-Gg: AYBFou2v7F6l1Cc6aLWJMnNO8BRPvKD/3TquaMiTGuJTNtecWM//Yj0ZTt9/2Fmjqr0
	O1oIUQq3RM3gr65icZMSDJDabNlOG2/cZes92TYO4jm263fUkEe9kzJ7lvnpSzYcLj5Dn9IMxat
	b3chiRShbGZlUaZQDLcK1z412FfGDKfzS8abIjmj+fzBqjFfFVJZKu/6dZGv22r6XGnESANn1mj
	ejzCC0UlVajaWTBDHeloMk5mFI+UPKFMm0QzySRPcZ1eCLiMIcb7tAuJah1mTsStHv7ld5RB8G+
	VZ72E7wNKcor8MwRdhtJedwSWX1wOX5S9UQT/xTiYXkMtQrT2A2MB+QIYZ9GQ/ot5aNz9AYD3iz
	7wRm8h0zQP+OCL2K5bmtUVs7D4/kFYuPTYl7TgZn47At8sgoz1pTVtd9HJVTECY6gTi4XwNB7zx
	vJpoq2IOt6jRjfIuRzc466RUgMLt84ApbcIXdIyUThgV7fNQ0FyNQoowKt3Ie/R/2whLCQ61i7D
	81psVM7TMnxavevk+RZ0x2Ii0W9hg==
X-Received: by 2002:aa7:c1d1:0:b0:6b4:201f:17db with SMTP id
 4fb4d7f45d1cf-6b49cbdfd84mr3081067a12.18.1793294412721; Thu, 29 Oct 2026
 10:20:12 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-submit-serial-8250-dma-cancel-v1-v8-0-3fd56ba352ed@gmail.com>
 <20261029-submit-serial-8250-dma-cancel-v1-v8-6-3fd56ba352ed@gmail.com> <auNW_Oc-Ao5Iw-Gw@ashevche-desk.local>
In-Reply-To: <auNW_Oc-Ao5Iw-Gw@ashevche-desk.local>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 11:19:59 -0600
X-Gm-Features: AclHuK-0pW6JI4DxQzs96I_p0R94o9xpuy7K0elsSNWPWKpDy78P7tTWYrgR_Gg
Message-ID: <CADvTj4pOg4w5LpFW_E3qzP7FZDnDgpB8LyR9xxhT_mZre21vFw@mail.gmail.com>
Subject: Re: [PATCH v8 6/6] serial: 8250: retain DMA resources when
 termination fails
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Raul E Rangel <rrangel@chromium.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Tony Lindgren <tony@atomide.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Richard Genoud <richard.genoud@bootlin.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	=?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, "Maciej W. Rozycki" <macro@orcam.me.uk>, Timur Tabi <timur@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 8:24=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Oct 29, 2026 at 01:37:02AM -0600, James Hilliard wrote:
> > serial8250_release_dma() ignores the return from dmaengine_terminate_sy=
nc()
> > before freeing the coherent RX buffer, unmapping the TX FIFO and releas=
ing
> > the channels. If the provider fails to stop a channel, the DMAengine
> > wrapper returns the error without synchronizing its callbacks. Hardware
> > or a detached callback can then access the released storage and state.
> >
> > Checking the error and returning early would not preserve their lifetim=
e:
> > serial core frees the TX FIFO after the driver's shutdown callback retu=
rns,
> > and port removal can then release the callback context as well.
> >
> > Require successful synchronous termination of both channels before
> > releasing any DMA resources. Retry failed channels after a sleep outsid=
e
> > the port lock, leaving channels that have already stopped and drained
> > alone. Keep the shutdown gate and storage reservation in place througho=
ut
> > the retries.
> >
> > A permanently failed DMA engine blocks close or removal. This deliberat=
ely
> > retains the buffers, mappings, channels and callback context until the
> > provider can establish that they are no longer in use.
>
> ...
>
> > +     while (rx_ret || tx_ret) {
> > +             dev_err_ratelimited(p->port.dev,
> > +                                 "DMA termination failed: RX %d, TX %d=
; retrying\n",
> > +                                 rx_ret, tx_ret);
>
> > +             msleep(100);
>
> Huh?!
>
> > +             if (rx_ret)
> > +                     rx_ret =3D dmaengine_terminate_sync(dma->rxchan);
> > +             if (tx_ret)
> > +                     tx_ret =3D dmaengine_terminate_sync(dma->txchan);
> > +     }
>
> This is unacceptable. Sleeping is okay, but value should really match the
> baudspeed and other parameters of the transfer.

This sleep is backoff after dmaengine_terminate_sync() has returned
an error, rather than an estimate of UART transmission time. Each
retry asks the provider to stop the channel again; elapsed time is
never treated as evidence that the resources are safe to free.

The particular 100 ms interval has no hardware-derived justification.
However, I don't yet see a sound way to derive the retry cadence from
baud rate either. RX can be waiting for input, TX can be held by flow
control, and callback retirement is a separate requirement from
moving bytes through the UART.

Do you have a particular provider failure mode in mind where retrying
termination should follow the serial transfer timing? I'd like to
base the interval on the condition that can make termination succeed,
rather than substitute a wire-time estimate for an arbitrary delay.

Regardless of the retry interval, shutdown cannot release the buffers
until the provider establishes that DMA and its callbacks have stopped.

>
> --
> With Best Regards,
> Andy Shevchenko
>
>
