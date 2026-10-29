Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793294138;
	b=0O8ujG9tYaPjidp3iyLoP4Ik3ivUnbIaJY408bbQYyyaBTfe7WnXus9Lmrqsy3tr9eL4
	 V6N/wCa0MySNhnrlAlF3D6H5q6lxALornsQ91ZYaclhaemaxk5UkP+tJ5yn4nbv0zI4uU
	 OvT23aeLuQ1RcAn02pwyRPZtVfUdE/LNf1XwsGZ7KlPlZv3gassBpxkS9DKKR2vILK+FB
	 NXD7f1T1ivabSmee/PAe3FFIxgOfAbldwC9qEuh6zRqt5VP0HSzz3Xb5i+/4FxNBVUAe1
	 ghFp48q64jHRYlORz4kqyo2dvxygF5vS8AeRyVS6+td+wQ6cXSB0czdB01/Uz74zfnQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793294138;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=bfkoGr6eHduUtBaHwkrM0dSWX67wyi9EvMSHv231Bb8=;
	b=qfGINGMQiDTsHu94thGEQd9yQf3hFEOTMD1Nz2lT1HS8vm73UeBhXAK3pR8zrZ5+cYpp
	 3CGzD56JjO6HU20CsLT5QmigdBXUGJR1nhuPdQf7jfU/Vbc0tajwa+Lzp6ti1UMZAVcnh
	 PLAAXHY7ME1ytH0NL3pjYf6dG75NGbRecAa3vc5LNs+g/MStKrUO8MGPhsL9fP8ZXkHLh
	 ItyWYbB0jliak4xS2QnkdvGtfhEGaGdIJeNxHD7EhQxznv0GA1ILi+PdKpP/zOXSAGBB/
	 yzjjnKppK0JDyVFtauA5dBOXFKW3yD/w/my92CcOgNwbOhWT5qu4nvn82aUPKtZJZUA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qg2kzRNb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929BD606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 17:15:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 929BD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qg2kzRNb
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b1dae0febeso3583330a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:15:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793294137; cv=none;
        d=google.com; s=arc-20260327;
        b=HREg732spmCNcmvCtlxWmaynx/+wCJUsAeaRcchwZZJ2mBa8f8e96s2BNLxQ2j2CPo
         VxDx6MTKRpJghyXxxGiW5OPFBGvRg+e1sJGObmNVs3ZrLkKRLal4ViyQ+AX7q3gT3I1C
         T0ZKGL4j3t3Nx7DTkVm0ytpv1xNxW9aHiUvup1c8dJ8j3vYLIu3GFioEsTJnUiBPu4ws
         7/Z6R1bxicA+r9dkI74wfHgHRn95fPirfnZ5oLohjfOlAqsMVCIz9aOpbxso5fgGGlsD
         KabTByHZ5wuLK6zFONv17LfT/5o1AKwXsS7I9AOP/J9USzj67DI6lUgJfChhlnH+t2BP
         WpEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bfkoGr6eHduUtBaHwkrM0dSWX67wyi9EvMSHv231Bb8=;
        fh=lzWCcYQ4xT/GfqntCsQv+X8DD/TblQ16Kb3treOItDQ=;
        b=p3zIL2LupSjheENYvvOMxC71U5Q1IO7bXPXpSly/DXXmHJXgs4RX+FHX1t4zG57Lak
         cdbpPgelys+MIpLYAf69A76dhjz5rQzYAoGAyK0WJrnh9UXyTMYhCYWZcEvGEi8Rc1yc
         HZxo7UYdP7+T0CZxoTrD9MNEfaRzk12cAZvbEkFlexcYcwaVyC1+wkY8tdynNz1iCw8K
         Uo67lbYgWRaW7BiyYxSSb7ZaKFJi8q9K18qO6P/CJNGniaY1pF+QmOnSRF0I6478A9SF
         Y6LYu7evNr4xxMdvRBTavQnVqcjezYMm24cxgwKp0kmCMxg+ff1F5mcQrzHkFdfbEaCY
         B+yA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793294137; x=1793898937; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bfkoGr6eHduUtBaHwkrM0dSWX67wyi9EvMSHv231Bb8=;
        b=Qg2kzRNbKHLPWJYfxjKjHkXAfeB0MLO0or0OFQdurJB00WngcgaQU4vvDLCoI0aH2B
         N3ggPFa6Vs0Z5AbGMDAa5CV5wGTnP0SRBhx1Hne0ABkzIRjIoQAV+ZPEqRfPKAD7ocDK
         ImFFvAjsytnE0TKc+HxRS0yh6n5/GyaatdDdqNVfubZ5jUFvqB7TUDYuwq1Z+OG3phTv
         jtI0oKQYFY5769oohWqV78E+yp57ZEaxfyz1vvB7DRWPycHqWXfMJR8KBrm3xEr7oST3
         kSMNXwIhPLnHhKhqnWAT+8ApIxhPz5aOYTykHWTmOl0LQptDHZZLLW+HAfDRUgp1F2kz
         oMgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793294137; x=1793898937;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bfkoGr6eHduUtBaHwkrM0dSWX67wyi9EvMSHv231Bb8=;
        b=DFhb/xJU5OkNFS35ktCBwA4NlLj02b3JHjn0pC30wYKrCL8du5Zajsdj0DyL6gL3oo
         XkuzRNWewJ8+Fi6KkAHr2XKwo3sslCkzfnvHNyFwhfJwzj5ebay2zV7L1wrQzXtYGGpj
         c7zkeSBHj9pJgOnWXVK+QIBYjmIS2Hi/XFC7wCM/v5ihGZpwTpgdfDZcW95hIFZNw17J
         DU1jUX04TByyngLA0bB66e0zHCFuWZY5ufkMG6GwAT7jTZ4FGqURuym0UsQ7OwL+cPRS
         luUyubm3kpblQJ8blPD5COdZZjqXL21t0x2RVrt/s0WvGzIcFa0Ftou5vEqeu3quoBED
         xoKg==
X-Forwarded-Encrypted: i=1; AKwUvBxaE0wmEzYGpKpUNDPumzzUrbRY/zawO8+wEAxAYiLOlAErqWgu3GcXfulzKZJziUiVgTPO6Dua7NV2JG8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLyrvEbxCiCzSWgxoaPTEaLF1y03jRpdfw+vwstF12cd9I1U8XX
	qvCO4fbz22py9sJk4Qha6L2hrrG+RdDzuVRpGF6GWpGFvM9glhii4vJaAE4e6FMgGTTM0ZoQ10v
	BHimdf4zIByOWeS23htVTDPsANrQ+izY=
X-Gm-Gg: AYBFou2GdBfR/JPAubg6Y4Uko+gbf6VniNx8PhpqeWH+EvnW/2f3xdEYeYEFyOWRNqx
	lydTiPUhxJI7pUS7oWd6/EYDHnnpcxySA0zdRolQbA1i/9g7jEudXtLizch8QGGzb5DKYR08wi4
	R+ru6Jhy/QZN9/3gpZZTn1dI8CtGpJT6W/OhSQaKHPX9gikdY1erL2s7536WCN2Bjmm/6E8sru9
	At2rI/GN7kfnPDQtdU5MQGAlbNXNg4ym8DmPpqIAW5ETzKjH1z/T3dSYOzlqQPSsaf4ydsVSxpO
	NZHgJccFX9FD6nvQcwzmShPKdpq0eR+HP55ameNkBmR4G/D1X+QRL6CoynLXK1et8WZLE5GZamA
	DuI/5nVq7P1HiepgKv/FCfScg6N7EF8AI1W7OvMlm/NNgYyTwyIph1cekPR+IVo0psxyYmkkjlc
	dHjUWvZr6x7+24yMduzzqMKgNCSRgcVWklSX8d7/v1M25Oq2ejTqR5Pcsrfm+WCbDISlD7GY1lf
	BuviU/X7EDB72sxgpQ54Zts5OE5BQ==
X-Received: by 2002:aa7:c687:0:b0:6b3:f840:59b5 with SMTP id
 4fb4d7f45d1cf-6b49cc019b3mr3067325a12.27.1793294136580; Thu, 29 Oct 2026
 10:15:36 -0700 (PDT)
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
 <20261029-submit-serial-8250-dma-cancel-v1-v8-4-3fd56ba352ed@gmail.com> <auNV7Vco5O3vVwRH@ashevche-desk.local>
In-Reply-To: <auNV7Vco5O3vVwRH@ashevche-desk.local>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 11:15:23 -0600
X-Gm-Features: AclHuK8a3pNXQ_IsYXCQfDMZzFxdEUJPDH5qKP3q2TLb8CO-tQBpFEH7zYCUMxU
Message-ID: <CADvTj4oi6dFzWkjFXie1U49A70Y7Mb=4exga-=2SmG7fN2pLrA@mail.gmail.com>
Subject: Re: [PATCH v8 4/6] serial: 8250: drain canceled TX DMA before reusing
 its buffer
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

On Thu, Oct 29, 2026 at 8:19=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Oct 29, 2026 at 01:37:00AM -0600, James Hilliard wrote:
> > uart_flush_buffer() resets the transmit kfifo before calling the driver=
.
> > serial8250_tx_dma_flush() terminates DMA asynchronously and clears
> > tx_running, allowing a new write to replace tx_size while a detached
> > callback has not yet run. That callback can then consume bytes
> > from the new transmission. Reusing the reset kfifo can also overwrite t=
he
> > source of a transfer that has not stopped yet.
> >
> > Reserve the flushed FIFO storage through serial core before returning
> > from the flush callback. Keep tx_running set until a worker synchronize=
s
> > the terminated channel, suppressing old callbacks and new submissions
> > during that interval. Return the mapping to CPU ownership before releas=
ing
> > the reservation and waking writers. Normal transfers continue to use th=
e
> > FIFO directly.
> >
> > Reuse the locked completion processing after retirement, including OMAP
> > delayed register restoration and transmitter-empty handling. Take a run=
time
> > PM reference around worker UART accesses and drain the worker before
> > releasing the channels. Shutdown releases the FIFO reservation after
> > stopping DMA and unmapping its source. Serial core keeps writes and wak=
eups
> > gated until startup or resume makes the port ready again.
> >
> > Track a flushed FIFO separately from the transfer length. If terminatio=
n
> > fails, retain the reservation until normal completion and account the
> > completed bytes without advancing the reset FIFO. After successful
> > cancellation, process a zero-length completion once callbacks have drai=
ned.
> >
> > The race was found by inspecting cancellation and restart while prepari=
ng
> > H616 UART DMA support.
> >
> > Retain the tx_running check in both completion callbacks. Releasing the
> > reservation relies on the DMA provider draining detached callbacks when
> > dmaengine_synchronize() returns; provider callback-lifetime fixes suppl=
y
> > that guarantee for controllers which previously lacked it.
>
> ...
>
> > -     bool                    shutting_down;
> > +     bool                    shutting_down:1;
> > +     bool                    tx_terminating:1;
> > +     bool                    tx_flushed:1;
>
> What is the meaning of bool XXX:1? Have you checked with `pahole` the res=
ult?

These are one-bit boolean fields, intended to pack the state flags
into one byte.

I've now compared layout probes using the kernel type definitions and
saved build flags, changing only those bitfields to ordinary bools.
For the complete v8 structure, including the RX flags, pahole reports:

                            Bitfields   Plain bool
    ARM32 / Clang               212         220
    ARM64 / GCC                 368         376
    ARM64 / GCC / PREEMPT_RT     368         376

The sizes are in bytes. All six flags share one byte in the packed
version. This saves eight bytes in each checked configuration.

The packing is a layout choice, not an atomicity mechanism; updates
still require the UART port lock. Given the measured saving, I'd keep
it unless there is another concern with using bool bitfields here.

>
> --
> With Best Regards,
> Andy Shevchenko
>
>
