Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793469665;
	b=n/dG800oWsGUWmDwq/Gd75ZFO2PAyfhuqGZpnzbApWc6EnZX1C/hjPu5Sqj8k3P7ZDWu
	 dVkkIWduGUIX9Fkx365xaeqCVTGGL9Up8NV2vL0uaxpb8kCJi/mtcHk2xgxSgg+EqIZDY
	 rf+HQDvgIQnw7VSj+DZIpwQC3+U/uPkhzP91jAtjnhMkrDpzCPBMYzVHpKhtgZRt1avXG
	 jpgFhAT/p92sVsgPdWYexxGFPDKJeTu7HCvSkZG/IvpybaZLDNpc62AthbKYK9/fA4cLL
	 ZV/SyFLpTkWjusMxLwKVuI9oCVMh+NzbR1WKzzSMBMmH03OlfYsAmUtfYiPfSDwfU+A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793469665;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ztiV5c0DfuFx8uDKCLiUp5o+ivOB8cWRN0pJNXnNfZU=;
	b=UOQ4YTOhn+jPJvbmgIpuASUuccCMxuddb+7soj6S+0034Yg580/oBIJl/eIrsPLhOCqM
	 p4UvS05I99ZFAFvFoAEmfmlSQ76yFjlQgQ6tORuoTQjmIaTYOh5PpPb8tN2Kl7LElg1gq
	 0PRc3yml/UFLwsdLxvF2+CYxBHsic+IRaLnSzgF8CyS5qAyOVGtb/kt2qdx/a0NHLcr0m
	 xJDal1ijlWXVyMqlq3oLXguCKnqTyqBsxowKVB1pc6wEghfgD79IZu8zd6BNvHzb8A4nE
	 Z1OcLdoYc03TPr7024tUAeoVKIcrAu8wOKKJuKhK0Cigy+tEmBs1NxtCEZn7MZbFWZQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fcezRNle;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.47
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70760606A321
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 18:01:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70760606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fcezRNle
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-7ccae9f1a9eso973803137.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 11:01:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793469664; cv=none;
        d=google.com; s=arc-20260327;
        b=hT8dlEucHhX82J8DLFIgcc0gruze+c+N5L2CgvXqAZwmt0vZPGEbKKS4shjb2zjHVC
         txQ273FVKB6iS3IB6ToVrcWZAyfs+R1HUnYAcqBcccKvkS2caLeLOFoETCym6AxJweTe
         FHohpfGJRtllMOuDdPK+M2rKpLkUgleQVtwf9biZZG1FKBtgdSuHrF5gooVW2bzpItmm
         aoasiwG8FcfZ0xLIATt07zsqfiXX/xXUjAgs7+HEnU9j24D0lqbc1/kGDgeQUy5KyiXB
         V8l1qPxRKoEbbE9iFhV/e6UdD1QJpPchYer/TSwFMgO9VXFVimV2hRzHfrZ6cAqia6B5
         kOBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ztiV5c0DfuFx8uDKCLiUp5o+ivOB8cWRN0pJNXnNfZU=;
        fh=FwYzqi18pc5KuKcVyJeft52hX1u0BFC3cSh5EVM/5+c=;
        b=B24OzPojxXkmdrJn/gjEIdRWMj++t/eQiltdQwyo1jmB6BkSPwKwWW0j6caHtV7KjW
         7uZHulYL6w+6K3Zc5n5/rF5X+uFp4httTpp+jpI9/q071EybZUbzBa5svTZmGdR1+qAl
         nzSkTEub/wF3y+GKfhMx+JqKv8jwwSdluk3f1YS66im1GmfuG+FR0tAfeVhuqAIcnzdw
         RFFSGlAimZOiGsKRS/RQHWzmyfnYZgcidlMc262dHnusm4Qeqj1wu/d3sddGj0dSxups
         kn4PdRtS9gc9ZUnWz0t3CKHqn/qOuBg6iI/A1nx7ELsb3q9u9C1bibkP4LZ0Fz6CQf06
         VYXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793469664; x=1794074464; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ztiV5c0DfuFx8uDKCLiUp5o+ivOB8cWRN0pJNXnNfZU=;
        b=fcezRNleFwQLsQP0vHkl4QkmgRVIOhYlQ7PHKc6NtKPoclI8wrL3lbtK8q8YsVu+MC
         vyj0HJ79Io7x/KYMgl9+6wrVW2f/Wvcgz1UCQ9400rBT5HlUAfrAJxgeAiYbBO93kvYZ
         Tez4bl3MQwACTSDfKHYvuUGwS0DYcIynYEn94fuhXwiitJS/0WDhAlCPHZspbagSU8s+
         AFTK+kq9LcJ8qJXMe9uO8kPNPyXWoZlfKIoSPJsxkbo0APhaBABxsN3piKhSrKEnEqaE
         /FKpso3T3KhCH6huO/pti1AtLT8rbsWnrMibVjnCT0omPdZWiy0AsZKmA2GUFsBsWc7V
         i1+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793469664; x=1794074464;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ztiV5c0DfuFx8uDKCLiUp5o+ivOB8cWRN0pJNXnNfZU=;
        b=0v63fuQGlXKQhcRPSDZc8zigMQ3fb7WbOKunhJn2gtkceIfem5gNVg6l6HAdEBS2Gx
         ylkvoICjdlE72GVb7OwEyXljeTQrtLuRHCwjSLMaiAv/AVJMm2UGcfvxZQvOauhKdsUt
         R8g6GRVQ/jFr+mUcdAs1pez+Qu+P43XpgzdGNgl+749Sr0n8BEAuuoc/YlTb1UVaAsQs
         PrSyAtjBmGhP3MY8ZFpsgy51LmuZSpwJHW9z4RRoH3pS71JnlNYzFDh9Qa4r8J96grcf
         HXL09x6QhZJAW6GDt8Rav8FKl/C4f5PBi8q1dg6PmHUgT8O2FhVjhj1xkZi1WqBztczr
         sQMQ==
X-Forwarded-Encrypted: i=1; AKwUvBxz7xxKpsC0b4+FVCVbzZDVRHd0Mob0vi4kqgChDVFtXJaBDCdI+XdExH0Z9UkWitKN0y4q5e7Jflzk91U=@vger.kernel.org
X-Gm-Message-State: AFq9FYIii2+mEJNny7YxnHvtl+p1nZOdwzgp2EKmUVnhtjViJ95LTwwe
	qVnEh2j2p/47kiNJ3v2E5wFtpp3FdDPHV8BmVFgRm7nt+Gp8iz31OY7YGcrhOe8yIDgdH75YVkD
	8YqTp8rE8lfa5vF9ZW+oLkeQM/z7Vv0c=
X-Gm-Gg: AYBFou35fSF6vcGTzLJNu8rwCHHo2cgAlmE/uLqf5HDoZyxWPjGBTNpNCNjCC0LIV0H
	zPznRS2wrc0dTFRWynGJySmgZLgrQmh3dEkf+8kdrVpxdIAX0DW6DsbZdyaU6mnpLQMUcd7HcIZ
	gXNk0inmR5eP7qmmBCXwTf9DwCkWAt7SKVe8IZfEOJPQH0OmoFUHpq85kYt5trGNNA90ylrw9Mv
	8Zpm/oY/GUu4xOGGRj3KAM9wkgO0azANXfDyFooGdIWqYd/K/05F5/yFS1nLqXGenB6GU5Pj9xZ
	P2XVkmtclREdCyZs322F69ECPE86LHBda3yRqMNAoTqRqFbKKhciZIx/ZH58YiXkOeCmAXn77IQ
	5vwxSlGRQLKxzpFMQui82l1I7iBSdr1gP4ITmJklSohqv5KsBAQdyARIeD0fpbIBgB74H+qIR3i
	K4yrySAuwNhtGVnLzOBEjltRFSTy5sCzFSc8XKRfl4ApVk6L0a60K9davHnEBGHKfcoCqJjft1L
	hGVjv4N1CghBwIuF45kahEUK6wrLQ==
X-Received: by 2002:a05:6102:c4f:b0:7cc:3eb0:6ece with SMTP id
 ada2fe7eead31-7d072d53fa3mr3076240137.33.1793469664332; Sat, 31 Oct 2026
 11:01:04 -0700 (PDT)
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
 <20261029-submit-serial-8250-dma-cancel-v1-v8-6-3fd56ba352ed@gmail.com>
 <auNW_Oc-Ao5Iw-Gw@ashevche-desk.local> <CADvTj4pOg4w5LpFW_E3qzP7FZDnDgpB8LyR9xxhT_mZre21vFw@mail.gmail.com>
 <auRl9ztbav4nHi7U@ashevche-desk.local> <CADvTj4p8tjwdftg+H11ob0iaBZKxXrTdkSmhfZHjOYunm5tr9w@mail.gmail.com>
 <auTZtteCFnuoMD3p@ashevche-desk.local> <CADvTj4rXXAEnTyu_AzpF41a2YSHHG1ANozCUSePBoH3QZYbBQg@mail.gmail.com>
 <auWqUIBUs0_7bnGU@ashevche-desk.local>
In-Reply-To: <auWqUIBUs0_7bnGU@ashevche-desk.local>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 31 Oct 2026 12:00:51 -0600
X-Gm-Features: AclHuK8CrIpMhatn91Js9Zu09dawz3gtrtGWd_ctbAp5jI12V9IMTbfHBekYVDc
Message-ID: <CADvTj4rej-zOtwwN8CtchQ8A9L-fdG0dL_XwBb0zTFv5m=+j4Q@mail.gmail.com>
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

On Sat, Oct 31, 2026 at 2:44=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Oct 30, 2026 at 12:08:52PM -0600, James Hilliard wrote:
> > On Fri, Oct 30, 2026 at 11:54=E2=80=AFAM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Fri, Oct 30, 2026 at 11:09:53AM -0600, James Hilliard wrote:
> > > > On Fri, Oct 30, 2026 at 3:40=E2=80=AFAM Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > On Thu, Oct 29, 2026 at 11:19:59AM -0600, James Hilliard wrote:
> > > > > > On Thu, Oct 29, 2026 at 8:24=E2=80=AFAM Andy Shevchenko
> > > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > > On Thu, Oct 29, 2026 at 01:37:02AM -0600, James Hilliard wrot=
e:
>
> ...
>
> > > > > > > > +     while (rx_ret || tx_ret) {
> > > > > > > > +             dev_err_ratelimited(p->port.dev,
> > > > > > > > +                                 "DMA termination failed: =
RX %d, TX %d; retrying\n",
> > > > > > > > +                                 rx_ret, tx_ret);
> > > > > > >
> > > > > > > > +             msleep(100);
> > > > > > >
> > > > > > > Huh?!
> > > > > > >
> > > > > > > > +             if (rx_ret)
> > > > > > > > +                     rx_ret =3D dmaengine_terminate_sync(d=
ma->rxchan);
> > > > > > > > +             if (tx_ret)
> > > > > > > > +                     tx_ret =3D dmaengine_terminate_sync(d=
ma->txchan);
> > > > > > > > +     }
> > > > > > >
> > > > > > > This is unacceptable. Sleeping is okay, but value should real=
ly match the
> > > > > > > baudspeed and other parameters of the transfer.
> > > > > >
> > > > > > This sleep is backoff after dmaengine_terminate_sync() has retu=
rned
> > > > > > an error, rather than an estimate of UART transmission time. Ea=
ch
> > > > > > retry asks the provider to stop the channel again; elapsed time=
 is
> > > > > > never treated as evidence that the resources are safe to free.
> > > > > >
> > > > > > The particular 100 ms interval has no hardware-derived justific=
ation.
> > > > > > However, I don't yet see a sound way to derive the retry cadenc=
e from
> > > > > > baud rate either. RX can be waiting for input, TX can be held b=
y flow
> > > > > > control, and callback retirement is a separate requirement from
> > > > > > moving bytes through the UART.
> > > > > >
> > > > > > Do you have a particular provider failure mode in mind where re=
trying
> > > > > > termination should follow the serial transfer timing? I'd like =
to
> > > > > > base the interval on the condition that can make termination su=
cceed,
> > > > > > rather than substitute a wire-time estimate for an arbitrary de=
lay.
> > > > >
> > > > > Termination of DMA sometimes require to clean up internal FIFOs a=
nd other state
> > > > > machines. That's what happens on HW side. In the software waiting=
 for too much
> > > > > may lead to the very big undesired latencies. The value of 100ms =
sounds insane
> > > > > to me for the HSUART cases (megabaud range of speed). Also note, =
not every PCB
> > > > > design uses HW flow control, so this may be even worse for them.
> > > >
> > > > The 100 ms interval can add unnecessary teardown latency if a faile=
d
> > > > termination becomes retryable much sooner. There is no hardware-der=
ived
> > > > justification for that particular value.
> > > >
> > > > The FIFO/state-machine draining is part of the provider's stop sequ=
ence.
> > > > For example, DW performs its FIFO-empty polling inside
> > > > dwc_terminate_all(). If termination succeeds, this patch proceeds w=
ithout
> > > > the retry sleep, regardless of baud rate. The sleep is only reached
> > > > after an error during DMA release, not during normal RX delivery.
> > > >
> > > > Baud rate can influence how quickly a transmit FIFO drains, even wi=
thout
> > > > flow control. However, the termination error does not tell 8250 whe=
ther
> > > > that drain is still progressing, how much remains, or whether the
> > > > controller needs a different recovery operation. That distinction m=
atters
> > > > when choosing a retry interval: a shorter interval reduces the adde=
d
> > > > latency, but does not establish that retrying can recover the chann=
el.
> > > >
> > > > There is also a specific API detail here: dmaengine_terminate_sync(=
)
> > > > returns immediately if device_terminate_all() fails, without reachi=
ng
> > > > dmaengine_synchronize(). Consequently, an error leaves callback dra=
ining
> > > > unconfirmed as well. The retry cadence can change, but resource rel=
ease
> > > > still requires successful termination and synchronization.
> > >
> > > Most likely this is AI slop. I can't see the justification for 100ms.
> > > Can you explain that?
> >
> > 100 ms was an arbitrary backoff to avoid a tight retry loop if
> > termination keeps failing. It was not derived from the baud rate,
> > FIFO depth, or a DMA provider's recovery timing.
> >
> > That motivation explains sleeping between retries, but not choosing
> > 100 ms. I don't have evidence supporting that particular interval.
>
> Yep. And that's what my point is about. Any big sleeps has to be explaine=
d
> and justified.

100 ms was an arbitrary backoff for what I expected to be a rarely
exercised termination-error path. It avoids a tight retry loop, but
neither that nor the expected rarity justifies the particular value.
Successful termination on the first attempt adds no retry delay.

The constraint is that failed termination does not establish that DMA
and its callbacks have stopped. Returning from the current shutdown path
would let the serial core free the TX buffer while DMA might still own
it. Retrying preserves that ownership, but a permanently failing provider
can block shutdown indefinitely.

Would you suggest a different approach to handling termination failure
here, or a better basis for choosing the retry interval?

>
> > > > > > Regardless of the retry interval, shutdown cannot release the b=
uffers
> > > > > > until the provider establishes that DMA and its callbacks have =
stopped.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
