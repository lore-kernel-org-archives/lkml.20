Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.222.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793383745;
	b=c/k0m8sW0haBhIHTIDq3y6nfB1zz1n6+QGQK1PBDQIT1qENNVVwAEfAyXFMOL1jwAtns
	 HRmz6tav4bqfxpRY0ADGHPscglHWRWU3tvEB5PpMqa1mjJHP8OItfjdsCghzuEBd2Qit8
	 SewsEH0OGCd8iUOlSIBFFFiLx00rsiPe0R0makc9FVrxtjxUWBQ/W5p8Q449cyQHFj5BW
	 uK/7wJRvsFpkV+D1E252kpj94QQZcPe9ko7wwHBhu6nEmrSrS0K5SYqO2KYSPhJJe7En2
	 qBcoxHiLB8FGBqGUsP7MRavAwY8kdjSHSgGT7HYfM6ATOGxEuwsvlOHQs4h2yoTYQzw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793383745;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zCM05k2C0awIth60s9Z4jRxjplzssn0gUpe0d+ZqU04=;
	b=2K++axCc+VweoffBdds04qPJfbWeG/TfvoPxrmsJvXXLhKRaFLlKzex9QYaTJhPXo5UY
	 Ze61iMADz7wUM6IT8rZpiOiAKJga/wr9tdpg0gIoyeP0dgN/lxzyYzEuwvbcujQ+QvKaV
	 IG6XMxM0wkosmcvoqg6JhgQsrBY4NegqwNQFJyd1lst5678c9A+fc7K7x8TWQJ/7RyayN
	 hlwYYpO9VDko5S+lXHepyRtYTzqFpTyQ9RMvdHZKZJfjyYIxxvCwQb0+NPAUahEDC6lov
	 ++vtBFrqdLfJ9Fi5wUwCPlfT3A3tl/6x+KD/raxGdmkKF5ntFOB6wyetRk5bVND3Igw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y6d0F7jo;
	arc=fail smtp.remote-ip=209.85.222.54
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A5F606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 18:09:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6A5F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y6d0F7jo
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-9906a5410f5so1924841241.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:09:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793383744; cv=none;
        d=google.com; s=arc-20260327;
        b=RK66gxLDAau3135thNfbYE818ZUNGwvYmeW1D3E42Nxejwmu5W6pdr+3VIeVbfr5OJ
         V/IEnxo+b9RVlSB9ROiMeJohtyUY8bduVFiQTfVm5bsaomYMxr/nCUEV+cNP2rrMtJK9
         CsoLzSTgwCUkv48bxFNe80H9n1AwdzRLO9ebuZq/6X4AkN7fVaIodvmQzX9Q2d6qs4WR
         zzsP5Y+4ZJ4ruBTb/RbS8vtwoq0Ri2NghZETwR23ggZV2QfGf1+Xofh5rJ7qlv+JEc6x
         B8Kk1q8PiQgZW3/UoZc7f9u78vg6uKpKXARioWsmyyj8SbyNpzXjloO+KLWsv36zEhq2
         C/XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zCM05k2C0awIth60s9Z4jRxjplzssn0gUpe0d+ZqU04=;
        fh=DLYyRU/Dg0Pd8LckKR/Sj0F+9fKxoQqtIKUmS3hmLD0=;
        b=pCHWP/QHWXz/H12mmioswAdULo0hrb+vE1LBoJerYFzjXdQufKEtJFZ9Bb+vGy/KBW
         Rs7xxoK7M3UZW5SnLPG6EbS/E1BiGPJ2Dnc7FUvYyFP+4ZPco/KMBtowTHEmSaR/Gb5V
         XSRNFvOCXrg4W3+wk+xP2Is+sNkiNlMCtPekh407lIZJGgSDrT6UYelp3ID8u5JS+NwF
         hdu7iLUIrlW9y3vpUvtL3TkwL6l895Q6W5Ua2S6o9UhREX8YNu5k6aCwELWYQSu/S6Oe
         l4uXMGZdT/q3kW4RZn7c4ejBZws95vtIYFslszwA7jHOErso/hXwIxKZT0tD51SZ0YXj
         cV6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793383743; x=1793988543; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zCM05k2C0awIth60s9Z4jRxjplzssn0gUpe0d+ZqU04=;
        b=Y6d0F7joUSae8PapTk6Km5L3QXiHXvGNI5bavYI7EHmrkB3vAxwC1wtFDdZPhmU9uF
         J9n8gkUbWTyWFe6MqEKCp3bk+yIJSk6VIJWId/b+6QX70NMAYdlkh2SvKdTjxrAALdul
         5V2Png6tfbTWj1SQYYks6G+w9qrDuqrEox0wfr+cjMzTKSrJ4n8ujKavhGrNJU0sELKo
         dbVtNXqbDrJzqrNqhkbm02eSHsIBGYWLpBIFTZvyp55nKWhNp+El0Rr0jGD1KlgJjfIy
         0JdSSKNIsONQmjkaAXL0t+UJK9QyEU2MKbdinjBYc9iHzlUrvRFZaBZSdkbfQWO/g+Cl
         h2WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793383743; x=1793988543;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zCM05k2C0awIth60s9Z4jRxjplzssn0gUpe0d+ZqU04=;
        b=ZdoJ1mmKDu/VilymOMgmHt85mvEGU+3kbxfyuPZaoVBikqI8h2B9awZvJPiMvHcNaR
         l/SlwBsXc3VY+iekUFNDyGo91S7+ywEYPJZyrb4AocByQLXMLE36IAzfR66Q5Capf5in
         d6HYEn9WjWsOIc33VnL2fVJA2QNM+Px3dhC9G9HzeYgrABVfyPLyvqD19osAtztBzCBp
         +vHkZcmVBed1NuFBE8uhG3uNDgS7IddeNBYJLsZ9TFqz8OFjWl4qHC0IPfhUudtXkOCo
         E0yQWT3D1P78Liaq3uWO9Ma5eTDGLxrrvtxooUU+Zz7dSrqhizLY3Eebp9Wo5tYaqcSa
         M7sA==
X-Forwarded-Encrypted: i=1; AKwUvBzFCWQCVopj8zagWVaV7tKw9nkC/zzPT8JA8KW+z6HZUKTTMmuoHPbwlx5eZuVpaC+MfDwvZkYF9NuUduI=@vger.kernel.org
X-Gm-Message-State: AFq9FYL2B5DB4NEn8ZYhQHdrMxqRWq8Tm5+HW2JRaaJxKRxB6nK3Kd3l
	pK0cDf7bcZt92Tt8eNOhsAiEUH5Tww/pGfaW32Fnplo4M4Gf9kE3/I1Yn6IjMpibJcjFedlw0Gs
	5IOv199SdBy2mnDprYm2hEQBF7pdZZEE=
X-Gm-Gg: AYBFou1uS6frVgm2cpVOruxvmtCopBzgA69a6MB9eDkcZAm4tr03k4U0NwV1lWjKpJ0
	PikXZw6rspYSE75WqtVLigWNOLzodJR8FL//HsYNOeF25lhfjWGhPBoWDXzpN28pWAaRHPOS7qD
	gbe3ns3c52+TIOSoraCTaaVhQ1KlYcsxZvAnhVJ114/429rsB7oH2mNEjhmfqa5WQVTRhiXFZl4
	UOkuwBJ/7aqXekSDfjPsHkpFuEt5qLVe4GmztkEyi+e66LLPo1SO5kQ3Y3ezFOTL9SMkjyYMa7Z
	JUrpDM7yy42XAic4/7C5ejIWvwvjlFgUBYNzRr9GFbS1gODSzm5iusfgDC3FapQHWqKJsduUzCa
	c67fg67SRLPEGz2oCKCmFjIb5xsfPvmzWI9o+9fU6crB4GasfSla3UV0Zzqo7JEtYqejAduGVRS
	Q9FqJBHAy9dt7vxaBK3GuiJi9btBno5Fq4HBTOgyxDrTlU2f0RWWki1kty9vadM1ylmE5TGQOov
	j0xQgx8oFWx1BEnVoppqA7q362DYQ==
X-Received: by 2002:a05:6102:e07:b0:7b3:9d2e:c1a2 with SMTP id
 ada2fe7eead31-7d0543af600mr2250112137.42.1793383743550; Fri, 30 Oct 2026
 11:09:03 -0700 (PDT)
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
 <auTZtteCFnuoMD3p@ashevche-desk.local>
In-Reply-To: <auTZtteCFnuoMD3p@ashevche-desk.local>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 30 Oct 2026 12:08:52 -0600
X-Gm-Features: AclHuK8c5dKv2-dU28EFYCOPnAfJ1MA-zFVMtXg5QQ7p9buAg8gKSWCKNovPJxw
Message-ID: <CADvTj4rXXAEnTyu_AzpF41a2YSHHG1ANozCUSePBoH3QZYbBQg@mail.gmail.com>
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

On Fri, Oct 30, 2026 at 11:54=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Oct 30, 2026 at 11:09:53AM -0600, James Hilliard wrote:
> > On Fri, Oct 30, 2026 at 3:40=E2=80=AFAM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Thu, Oct 29, 2026 at 11:19:59AM -0600, James Hilliard wrote:
> > > > On Thu, Oct 29, 2026 at 8:24=E2=80=AFAM Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > On Thu, Oct 29, 2026 at 01:37:02AM -0600, James Hilliard wrote:
>
> ...
>
> > > > > > +     while (rx_ret || tx_ret) {
> > > > > > +             dev_err_ratelimited(p->port.dev,
> > > > > > +                                 "DMA termination failed: RX %=
d, TX %d; retrying\n",
> > > > > > +                                 rx_ret, tx_ret);
> > > > >
> > > > > > +             msleep(100);
> > > > >
> > > > > Huh?!
> > > > >
> > > > > > +             if (rx_ret)
> > > > > > +                     rx_ret =3D dmaengine_terminate_sync(dma->=
rxchan);
> > > > > > +             if (tx_ret)
> > > > > > +                     tx_ret =3D dmaengine_terminate_sync(dma->=
txchan);
> > > > > > +     }
> > > > >
> > > > > This is unacceptable. Sleeping is okay, but value should really m=
atch the
> > > > > baudspeed and other parameters of the transfer.
> > > >
> > > > This sleep is backoff after dmaengine_terminate_sync() has returned
> > > > an error, rather than an estimate of UART transmission time. Each
> > > > retry asks the provider to stop the channel again; elapsed time is
> > > > never treated as evidence that the resources are safe to free.
> > > >
> > > > The particular 100 ms interval has no hardware-derived justificatio=
n.
> > > > However, I don't yet see a sound way to derive the retry cadence fr=
om
> > > > baud rate either. RX can be waiting for input, TX can be held by fl=
ow
> > > > control, and callback retirement is a separate requirement from
> > > > moving bytes through the UART.
> > > >
> > > > Do you have a particular provider failure mode in mind where retryi=
ng
> > > > termination should follow the serial transfer timing? I'd like to
> > > > base the interval on the condition that can make termination succee=
d,
> > > > rather than substitute a wire-time estimate for an arbitrary delay.
> > >
> > > Termination of DMA sometimes require to clean up internal FIFOs and o=
ther state
> > > machines. That's what happens on HW side. In the software waiting for=
 too much
> > > may lead to the very big undesired latencies. The value of 100ms soun=
ds insane
> > > to me for the HSUART cases (megabaud range of speed). Also note, not =
every PCB
> > > design uses HW flow control, so this may be even worse for them.
> >
> > The 100 ms interval can add unnecessary teardown latency if a failed
> > termination becomes retryable much sooner. There is no hardware-derived
> > justification for that particular value.
> >
> > The FIFO/state-machine draining is part of the provider's stop sequence=
.
> > For example, DW performs its FIFO-empty polling inside
> > dwc_terminate_all(). If termination succeeds, this patch proceeds witho=
ut
> > the retry sleep, regardless of baud rate. The sleep is only reached
> > after an error during DMA release, not during normal RX delivery.
> >
> > Baud rate can influence how quickly a transmit FIFO drains, even withou=
t
> > flow control. However, the termination error does not tell 8250 whether
> > that drain is still progressing, how much remains, or whether the
> > controller needs a different recovery operation. That distinction matte=
rs
> > when choosing a retry interval: a shorter interval reduces the added
> > latency, but does not establish that retrying can recover the channel.
> >
> > There is also a specific API detail here: dmaengine_terminate_sync()
> > returns immediately if device_terminate_all() fails, without reaching
> > dmaengine_synchronize(). Consequently, an error leaves callback drainin=
g
> > unconfirmed as well. The retry cadence can change, but resource release
> > still requires successful termination and synchronization.
>
> Most likely this is AI slop. I can't see the justification for 100ms.
> Can you explain that?

100 ms was an arbitrary backoff to avoid a tight retry loop if
termination keeps failing. It was not derived from the baud rate,
FIFO depth, or a DMA provider's recovery timing.

That motivation explains sleeping between retries, but not choosing
100 ms. I don't have evidence supporting that particular interval.

>
> > > > Regardless of the retry interval, shutdown cannot release the buffe=
rs
> > > > until the provider establishes that DMA and its callbacks have stop=
ped.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
