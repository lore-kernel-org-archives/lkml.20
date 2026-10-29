Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793300896;
	b=Y5N98M9NXf0K0G+JK0SjlTCmJ2k5Xhao8p5Zeeej/CZTAbJUD1r0DyrbTmSsSKj5Vi+a
	 cZXM5cB9sxEmdzoar/gPAM3P0VoX7/no4TN+5xM5fBQw2/UEXxswTDD7UL8EXsak8JaPj
	 fmTpjEHoPGFfzn1ClG7Bf309ycEaYqqiXnz0V1eeg6xPvpnzn4YbZmPW4QuqXfdJNAWZL
	 NBfIKgssOeya7gSilwWaaHD/MHBadf/0w7aQwz3jrn8gRYoQ9okZVgG5zDw9GwB6rwUvN
	 dV2VzN/MPrOnOM+VYr/db9FQDalUuXpXBgUHGNElwAZJ1B1SPZmT8WXktXNvMI4cwpg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793300896;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=u3pPXjv4Wwx+POQttN+7x1MDfExsUHeAJSF+oGYWqgM=;
	b=LyIbXlH18A2JX6FAUjBo4yWiZ4FeEUr3OhDBk6kaVGLWMq9j1hkn0Xan7YXtjqJqPbZq
	 WefE6jKLkXApR7rR+ufSzNYoeYPMDQPM1yvj4vM/yRQbMOk10Rhj1Fa6XGQz/NqRXAuPM
	 PrZvyBUkgcNFN8hRQrZUmAWe7jeMyYHF3n7nIdbvJKZ4L+QHSO1OC/qMOYpts1bsOaM4f
	 11chSjcU5W/YuEVwpenapn7GQ3xURiRbvVj4/0630wn1d/O3qho+iXK5z9H64q9+/ESAg
	 ZSRYjUFxOQTxTH7m4syvrFcy/Ozhv42Ez5Xjh1j64mNSfqmqCYXed6r8Kzt0dHiRohA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yCAGxuYm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.180
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3CB606A321
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 19:08:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C3CB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yCAGxuYm
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5ebf39def3aso3648e0c.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 12:08:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793300895; cv=none;
        d=google.com; s=arc-20260327;
        b=Mk87ATppqTq9ZhGmg+/LrtL5QJwJHUMjVgC3EF7i6nl343g8zxeNVKZ1EVNVxJX/x4
         yv1I2KyQhEleqm400ruRMVbnNO/EuQNJ/32t+e5KL3PNG3klOhav/FwUlPzM2Jsr8joy
         KbELHbxng3E47Uvz/oV7dMmicoMzAdo3EYxRx+BSoc1GsCWgBWUmwk9TC17Gtm7Ii/P0
         bvHJTTRtw5I7KfjltuV6XfmjR/uOeCYyQPE4jOYznLJ2jUEdnJvlET8hGgProd9db2ir
         kniUr+ScwbiQ8mCc8A+uC3oQFd85pJNtcQkGjsIxYvWf1Bq/RK13+bGZad9yr3lzBxqH
         cd8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u3pPXjv4Wwx+POQttN+7x1MDfExsUHeAJSF+oGYWqgM=;
        fh=Z9jRMwiPXoLVPZJa3DySGzlvz3lG7vQeK3518hFi/74=;
        b=NrAeBQJmuPIE77hUqEkIcYjN0aUry/5uRym0rrcAiucjHtJDuKXDxta7WXCykFIWfc
         4o7HFYuC1hPxoYRYYpUowzH7fyhzJar9O4gxeYpZPuA0MCs7Nd8v7fbRIVS1Sg8LUxAC
         NGxL3OfqnvITxpHDIq/Ed7/aQ6+r6+/w86r2Fu13+Hh4d6ymdBawKXLnuhB5Mes/CWQn
         vefxh1PlLzDOg3koIDICneKeipuV9wDQmTRBTdjsVd2DWb+aXYMYQRl2scJWRv9qzb8f
         T1Ymh6rwu/8CP5jEnQMcU4FNkfCY3s8Jua8Vrx0QamTJCCGvmehMjY1yO2Hr4BXaJGhh
         mAcA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793300895; x=1793905695; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u3pPXjv4Wwx+POQttN+7x1MDfExsUHeAJSF+oGYWqgM=;
        b=yCAGxuYmwrHIgmNv9ZiFwfNSpYDff3cIORj47ZcLMJc1M/JfIUPfFYJ0hgfFLheU5y
         k8+jCl1HJd8pxaAifNyTOo3nW/vfq8JV7w7a+1aWKDmS8As2p32MovbjXtCnATsdC/3U
         jdVBmjOs4X/8Qf4Y3CkbE128NmtvbpR7JtzhUUMW+dSysSKqFmF7VD0vO99xtRuYqJdF
         Tun6zrf+HCH22iD6Y9s0suAei1XujF6WsjdUEXeC1zL2GExoYD9pEwxZKMmHMhMYGH+g
         xM3O0+QHW8dBcPGN6lVsU5YYNy7Qqqr/NHfULULcnU2gJ5W00w9HQ+konuJ3NjwDgqf7
         HCSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793300895; x=1793905695;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u3pPXjv4Wwx+POQttN+7x1MDfExsUHeAJSF+oGYWqgM=;
        b=Vj+S+oAPT3LaOO/sxKfnznQ7dvVW9vsldJrqgmzHhz27V8w6KJrUJwGsO4fsH2wkcN
         Htfd8dMRN5mp3mNEhJQ/3rM0T0jsmuhukVeow1zFYdNL3NfHSZqfdDbIyEjG3/IPJ60T
         XbGBZz6FbIyQpd1fVVg1lHHmE+ECjUqmUg59ZVfRIY3xmNiSWSU6V67ZmLmEM5DNbZBt
         gQRelbAz5ivYJBKEqmxD20HFoT4kULH2kfHGsUW5cEWvLvIDmqFNkAaz0WD5iKJWFwDB
         LqKbbJSNz7UrZMwohvXAQbcVBk/vkujuGRJEeM75VuDtrcVbGvU2x5iglY4+KiDQPNmV
         cLOw==
X-Forwarded-Encrypted: i=1; AKwUvBw1k7HcRK2zTGtSvX1zLfZwaJTYvyTEf6Kf0MpSl4KmHbo/ywUV9HAYnmbhCrka4aBZaL/4azsvUDrZAZg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHaV7J8wWHltAqL5BiAS301zQYsmq9wJBjve2BsJQhY9t2weE4
	TYtDlTIo/7kdd5yPEwHy0qLcKWzUDWGLZLJNqP55oVR3EkmGk2ANtau3TZXAozqbS94AZiQFKNl
	kTR1EZyfzj6W2hPT/yBVO08F7p/MEtCs=
X-Gm-Gg: AYBFou28AZUUKRFp2flON/84mhb3sTolxkBWjuZWkX5dxlO+0tY65mRuwORQ9TQ99CM
	+xewIrYBlBjDv38stRH8e7kJBInUYVcVkWn8GtzRINGl4y2D4H5Jdp5rQMIuvsWq4AuS5YqAvk2
	x009B3Vo0RyT7BFHw7Ul0RSgM3NQ4RuWS5uHceqRAwFVRPqJDUvvtvTFreoBiqGnJspxEpV2Cye
	UWjWm8JotGKUH8KBxJKz1c9LSDEKHNuMb97wiDYOLEtJgiVqt1zz3GHJZmkvey37S4r3O4R22z7
	MPX6hzP1JER1YzHt1rnqayE+28Dh+owhn8dPaUfeFdGovHjVG2b5meCSHdVVlC5TIHeRdcvw97S
	m9h22Drp7vLXHaVQrNGzIFztfXgctWZkdaHUGRfvODWKPFm/dbLhu5SYpk59iel6LydP855cPUB
	M0voRCHtH8lvPqkB4pcTnbN8tOxFoScHim+SeUIzhuVNYZJrh0tms8uHfI3kjo6eiqxzxEsTOMs
	BKsL9vO36nYM8olGsvCMYXJt8Tsmg==
X-Received: by 2002:a05:6122:46a8:b0:5ce:ab22:1749 with SMTP id
 71dfb90a1353d-5ec6851cd7amr118633e0c.1.1793300895346; Thu, 29 Oct 2026
 12:08:15 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027-submit-h616-uart-fifo-v1-v4-0-d37e018fd0a6@gmail.com>
 <20261027-submit-h616-uart-fifo-v1-v4-4-d37e018fd0a6@gmail.com> <auHW9nkDqZUXeHNZ@ashevche-desk.local>
In-Reply-To: <auHW9nkDqZUXeHNZ@ashevche-desk.local>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 13:08:03 -0600
X-Gm-Features: AclHuK-Rn80HNyPsHmS5HIf099B7rRnzpvWxOBqe3P7d4FosCUXTUKkW9AmBT7o
Message-ID: <CADvTj4o6N6sXk1YvYgMF6d5jyAGZCtyaZUe81ZP10qfhOPwd-g@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] serial: 8250_dw: configure the Allwinner H616 UART
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 5:05=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Oct 27, 2026 at 05:05:32PM -0600, James Hilliard wrote:
> > H616 has 256-byte transmit and receive FIFOs, but its optional DesignWa=
re
> > component parameter register reads as zero. Generic 16550 probing leave=
s
> > the port using the 16-byte FIFO configuration and its trigger-level tab=
le.
> >
> > Keep PORT_16550A and describe H616's fixed 256-byte FIFO depth in platf=
orm
> > data. Use common Allwinner setup helpers to configure the transmit load
> > and receive trigger table from that depth.
> >
> > Derive the receive thresholds from the documented 1-byte, quarter-full,
> > half-full and FIFO-depth-minus-two mapping. On H616 these are 1, 64, 12=
8
> > and 254 bytes; the normal 16550A half-full FCR setting selects 128 byte=
s.
> >
> > Build the threshold table during setup and use the shared 8250 conversi=
on
> > helper to select the nearest lower threshold for sysfs writes.
> >
> > Serialize trigger changes with termios and hold a runtime PM reference
> > while programming FCR, preserving the FIFO contents. Propagate runtime
> > resume errors before changing either the FCR shadow or the hardware.
> >
> > Advertise automatic flow control so CRTSCTS enables MCR.AFCE. The
> > DesignWare termios path selects hardware CTS handling, so the capabilit=
y
> > must be present for the corresponding hardware control to be enabled.
> >
> > Select the fixed configuration through the platform setup callback.
> > H616 has debug-divisor and RS485 control registers at the offsets used =
to
> > detect DesignWare hardware RS485 and fractional-divisor support. Avoid
> > those probes and retain the BUSY-safe integer divisor hook and software
> > RS485 handling.
> >
> > Use the existing SKIP_SET_RATE quirk to keep the UART clock enabled dur=
ing
> > termios changes. Its clock is a gate on the shared APB2 source, rather =
than
> > an independent baud-rate generator.
>
> ...
>
> > +     unsigned int fifo_size;
>
> This is should come from DT (based on the property or compatible),

On some Allwinner SoC's fifo size can come from the FIFO Clock
Control register[0].

>
> ...
>
> >       u8                      no_int_count;
> > +     u8                      rxtrig_bytes[UART_FCR_R_TRIG_MAX_STATE];
>
> Why do you need it here? Can it be provided via driver_data?
>
> ...
>
> > +/* The trigger is the masked, unshifted FCR receive trigger field. */
> > +static unsigned int dw8250_sunxi_rxtrig_bytes(struct uart_port *p, uns=
igned int trigger)
> > +{
> > +     switch (trigger) {
> > +     case UART_FCR_TRIGGER_1:
> > +             return 1;
> > +     case UART_FCR_TRIGGER_4:
> > +             return p->fifosize / 4;
> > +     case UART_FCR_TRIGGER_8:
> > +             return p->fifosize / 2;
> > +     default:
> > +             return p->fifosize - 2;
> > +     }
> > +}
>
> You don't need this, just provide a set of numbers directly.

In v5 I added FCC based fifo-size discovery for A523[0] which does
need to compute these values dynamically.

[0] https://lore.kernel.org/all/20261029-submit-h616-uart-fifo-v1-v5-7-53b4=
33aebbf8@gmail.com/

>
> --
> With Best Regards,
> Andy Shevchenko
>
>
