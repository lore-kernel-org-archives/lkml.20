Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793294050;
	b=3BQFi8b9opamTYZwifTh4qqHO/szluGEq8MbEJj/m2f5zyMlYMTT75dhqtWJ3pFes7Hy
	 gENLGltGSSEdbmbJ/zlpC7BXIK2mYoinJ9g+AFCRFXJoTbyfKo0837hwKc8Z8SqmX4P9d
	 7j3d82uZIo1v4xcWanzS57TYrwRzymmo4bdhTzFSEiIj/sVyHjomFAQy1+lLNeulqlyJL
	 HXhgq8GFRoODNuDAZSMkPqTPi0Icqnr1aEB/DtPzPwjMVt8fURcHxA4ENsw1tWreUkJoS
	 DrFic4JUKIN05OX1f/AyGdETZnEN20oEses5XMZgS5Ijo3wft3jQWZxrlJ/Pu+Coczg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793294050;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FTbT3tgSxeUnwmRhmxtw1LLZfXKECJjTK/sp07zcT8c=;
	b=spFOEsjqeKjHLfsx8pynNgqRInG66X45QnhjkOFUCjOjA5y2cqt/4J2qZE4B6m2fQR0o
	 oOD7Gch5Mk1wMmUYDkXD058xrsjxiyAQv4MV/mOksQOrq3BziuxHtPtQ+sHFIpf6I4XbK
	 tTsDVpraT9tD2HVN2dZi2+/gBEPxurcakQp+VSFtfddqbduiIBaiAu50I0gcGcTXYa6uX
	 uUlwSJk2u9uO8tmxx2Tb0QHkS3f6dL3XQwjy55iiHUXZzhLZj4gjejuazkWOsE6wfub74
	 F5DT4Q0CNO21L/QTzv3jNTmgUf0pO8kGLCCRlmvMRdwpaSJShgH3XQ1paS6jErpDVKg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zni3Q5Gx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58662606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 17:14:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58662606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zni3Q5Gx
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b413b0a974so3605331a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:14:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793294049; cv=none;
        d=google.com; s=arc-20260327;
        b=sapfglkJVa9e6I4KkDJ7tW213/owo+gMxO0Ek3yvrKihLvpm92571NFNn0yl/VRB4s
         Uy6XQHRzodDsLol3mvvP9F+4ncHb8VdcBWKrGQFYRoL0FOe7v232HZ6beB5Gl/rhjaOB
         sy+deAlU1mN134JdzJkNrhIfUdH79m33UO4pU9BtD6VhKyjWvEV/UeyFIPG+Hchiu5q7
         cx8NEJLeIlPq6m3BD6AosXy5og7GpHNwGz1jpTYmb/SOoX4+vsibJRQrE08UM2iRLB58
         CXoU5DoNmZwML/2LY4O7EAqlPkfomuBS+3VOJrt9pbMYHvJI0hyvnDvLh9J5oywEuF1V
         thoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FTbT3tgSxeUnwmRhmxtw1LLZfXKECJjTK/sp07zcT8c=;
        fh=ZfmAp6JFYqddBgtYtyGNH5PyJdiHF+6YfyxQ0xvypMA=;
        b=WmXCMOsB/r5TNrsKCDHlp9Sfxm8yoR5O+Gsw8CRaw3riM14vdVXJEJc+R1/psEDO/S
         YciNDjCPuT2sBJ6UQsqeKc1+/Va/ZKy3MSLNT8ee1OT6sfcBJQfQ/A2RvU3Y2fL1L+cs
         A95G4547XpFZgGRKmpsAy8WxZYoySXgZoGA7YnsNmpoL8j9IvzwZuNmzen9+GThigniE
         7YSGynIKwlG9QPU5oaIy6YmpCI0znl7Lhfmk3buu2s+KOAks/1iEh/ZZeuqEYaUdJkWY
         XUDdecSrLdixQezHldMX6/W8VUUp51EsKG1D8X3DRp4ElTMgmPMW5tk02PSJdv58Bn6L
         rp9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793294049; x=1793898849; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FTbT3tgSxeUnwmRhmxtw1LLZfXKECJjTK/sp07zcT8c=;
        b=zni3Q5Gx4fdEB/c6OKot7rINlo1KgjEo+W++gLI3PzRc0rbIrQGeeyVoXJAnM2Qe/z
         fSNdXdDZ3TeF4/w08c4oWi0H1g/qsXCYW2lK0c6Fw8x6Bb8+fa9aI8wlPj2dQ3GtZRL9
         s8lBD4bBX9SkQnzvVpmpaSuZONmPNQcxLTTwhSFacM6nFomIUUFK9xBhJsP1TX7v5dyf
         TQRgiNBTg0A8tA5chpFawj6byoRME/usf0sAbINbkgegmRLFOu4GAlXJs4yWPVX4mVoP
         K3WxPN+v3jQQ086W9iMGjpiuxoiuOGVYjCxMlEyeEXek7dJc8vbSTG8lfWYzDYMKktr2
         SPAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793294049; x=1793898849;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FTbT3tgSxeUnwmRhmxtw1LLZfXKECJjTK/sp07zcT8c=;
        b=lUJkB9NEzExXUDQ6c/aZnElIhvoL+QNIy/bx5WZtvkOrDZ9fyhtoULLHto8YPHMpF1
         6TIp9SauLgOuYVuQ0Mpw2YTldZIQG/4okKnhnOqCFtgUV1Lu1z92QH92jvpWmzrD8Jdm
         JEYh96E4prK5A3OI08pZeKu+Xk6Qj5d+5vGOnQfenqxZ6To801QiTqSfa3eICwnJ17Cs
         Tgdt+Bm6tNcXTmBb+oKMtDH4AGRrtxI/1jkgI0iPcpiT40+AztdqnHXrDpadA2UI2up1
         BHzX0ApG3Pf3ZxHb5ySSZL/Dsp5+XVWLTpjj38cSJUTe9bdxAEeBHAaQkTC3YaJDINyF
         bJ5A==
X-Forwarded-Encrypted: i=1; AKwUvBzAjo62UOgbDko99K16s1YstgHlmeP4o8y6+WjCyvd9zeYJOGAhPY1DQ4DhbRNefWeSTVSssnHVI1QfXEo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLc+SELwzxN7G6zuDWWjHa8hsN/ojNSdcdokVF5y5RqqMDFXLhi
	v7XsTHoq091qFHqKqDWAVPKadiUyc0EyQQeHDC5dstRfGQ6FnusQvkRux1bUtsZnsO+qlg3/V/1
	KkEZymsjoZEt/zrWJNNxJmrII52Aq5dM=
X-Gm-Gg: AYBFou3ENjXtAiih1AjcAE9kKCETeWd+LpmQan+TkzDKFP6b8ZBxxOg/va921FN4lrT
	5paTBD8Vqdx2Ie01QEJmjsbQntGxmaNPhOayHgxInEWhsv/jlu/+JXSgtNAnasVsydjva6PTVRx
	3zTb/ItBgeTwQ9ZCYW49shNR8nd6PSlI1Gm9MdQy8eGXgMTkEOwocfpmqxuCdgjhSuyMbKYI3WU
	6BDCgf7n7kIAuJhfR/XLgytKmbo1LJqU43zqn6dLSLtMKtKTmk1hyt82v5XndIrB4xW9o1vo7bX
	uUiTnJtSAaq5K8MgeN77v4irO0lLFqlDXSjtOKCz+Rm2zAYJuBva8eBm4ORIFpps7OAR9KyGhm9
	VEUvRYGO56DNZ1y8205sF/fJWDniiVGmHi/y+rFMTIPgv2Dq6At7j0+p5TRHlAUB0cYYbqGqPpj
	AWPTxfe+NdURTb4iaV1HvuR3CuEDl+RCEDjpcneS6H8A+Rip2i93A33rmvqlJ2OYYeyH+M5uTte
	pIJ7XLQfPMai8l5mtmMnqq85qMCOQ==
X-Received: by 2002:a05:6402:1cc4:b0:6aa:9830:aa21 with SMTP id
 4fb4d7f45d1cf-6b49cb8eabemr4436038a12.39.1793294048534; Thu, 29 Oct 2026
 10:14:08 -0700 (PDT)
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
 <20261029-submit-serial-8250-dma-cancel-v1-v8-2-3fd56ba352ed@gmail.com> <auNVk_Y8iiAXyFa3@ashevche-desk.local>
In-Reply-To: <auNVk_Y8iiAXyFa3@ashevche-desk.local>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 11:13:56 -0600
X-Gm-Features: AclHuK8vSM1CWTDsGeWZ16QtCofwiUc2xcHxHUC_tVZ5DI3qrKZF21jWZD2zp04
Message-ID: <CADvTj4pwVF7u-6z3RUiHWGyG3MZGFU2WkytMRh0G16pdFwaotQ@mail.gmail.com>
Subject: Re: [PATCH v8 2/6] serial: serialize asynchronous write wakeups with
 the port lock
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

On Thu, Oct 29, 2026 at 8:18=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Oct 29, 2026 at 01:36:58AM -0600, James Hilliard wrote:
> > uart_write_wakeup() expects the UART port lock to be held. Several work=
er,
> > DMA completion and interrupt paths call it without that lock, including
> > indirect calls from uart_handle_cts_change() and the transmit helpers.
> >
> > Take the port lock around these notifications or their transmit helper.
> > Keep sleeping SPI and regmap accesses outside the locked region, and ke=
ep
> > the FSL LPUART completion lock held through its wakeup. Acquire the por=
t
> > lock after releasing private channel locks to preserve the ordering use=
d
> > by UART callbacks. In the MUX timer, publish available FIFO space under
> > the port lock and keep the hardware FIFO-drain wait outside it.
> >
> > Use IRQ-safe locking in the Atmel RX and TX tasklets and SB1250 termios
> > path, since their interrupt handlers now acquire the same port lock.
> > Preserve the caller's interrupt state when releasing those locks.
> >
> > On SB1250, lock modem-state updates after reading and filtering the cha=
nge
> > status, and wake modem-status waiters after unlocking. Take the TX lock
> > inside its service routine so RX-only interrupts need no acquisition.
> > Keep that lock across x_char handling, FIFO consumption and the decisio=
n
> > to mask TX interrupts: a writer must not enqueue data and enable TX bet=
ween
> > the empty-FIFO check and the interrupt-mask write. Each TX invocation s=
ends
> > at most one character.
> >
> > Serialize CLPS711x TX servicing and its interrupt-enable state with the
> > port lock. Disable TX interrupts without waiting in stop_tx(), since a
> > threaded handler may need that same lock. Have an already queued handle=
r
> > leave stopped output untouched, and drain it outside the lock during
> > shutdown before the transmit FIFO can be released.
> >
> > SCCNXP handles interrupts under a controller lock which its UART callba=
cks
> > acquire with the port lock already held. Collect the ports needing wake=
ups
> > in an unsigned long bitmap while servicing the controller, then release
> > that lock before visiting the set bits, taking each port lock and
> > rechecking the wakeup threshold. Removal drains the IRQ or timer before
> > unregistering the ports.
> >
> > This serializes write notifications with port-locked serial-core state
> > changes, allowing readiness and transmit-storage reservations to gate t=
he
> > notification without a check-versus-shutdown race.
> >
> > Cover DZ TX servicing and JSM Classic modem notifications as well. On
> > DECstation ZS, acquire the port lock before the SCC lock and notify wri=
ters
> > after releasing the SCC lock. Defer normal TX restart after console out=
put
> > to a worker, since console output can already run under the port lock.
> > Check transmitter readiness before consuming another character and drai=
n
> > the restart worker during shutdown and removal. Release Lantiq's hardwa=
re
> > lock through the transmit helper's completion hook before notifying the
> > line discipline.
>
> ...
>
> > static irqreturn_t serial21285_tx_chars(int irq, void *dev_id)
>
> >       struct uart_port *port =3D dev_id;
> >       u8 ch;
> >
> > +     guard(uart_port_lock_irqsave)(port);
>
> Why _irqsave?

For serial21285_tx_chars(), a plain uart_port_lock guard is sufficient.
It is only registered as an IRQ handler; saving and restoring the IRQ
state adds no protection on the hard-IRQ path. The necessary change
here is acquiring the port lock.

>
> >       uart_port_tx_limited(port, ch, 256,
> >               !(*CSR_UARTFLG & 0x20),
> >               *CSR_UARTDR =3D ch,
>
> ...
>
> Same Q everywhere (it might be legit in some cases,
> it might be too strong in others).

The other sites have different calling contexts. Workers and tasklets
can share the lock with a hard IRQ, and some helpers have callers with
different incoming IRQ states. Those need different treatment from
hard-IRQ-only handlers.

>
> --
> With Best Regards,
> Andy Shevchenko
>
>
