Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793082765;
	b=0diIc6aEF1RyqF0Kl+Dxl1JZDOr6R8ckv2pM1QXrQB4Sviy+2okHL7OB51HJCGkC0KBE
	 qo/Tgny18mjNgjL3107cnjJSKeZGAIKMFeSMTaziih30Uk99vNXQL80hPeAGtZ+StVWtF
	 GfNGitN2dcbbrziGx7SU0bTGuxK8ddKhJtAx8tbELF3aONwn3YMQ2/ImGhOucRPfZhFGx
	 lIsLcsjPc+W63YnyeoPlxjHc7N8w1yC4Myjw9Sk8POdxEytn0tGTjPth9opXBi7IUxzyb
	 TWKu30m1IZ36/QC5A5QO3sUcZ+4ZL/RCYnWtL2ZaiPbeNDAqgJ/VTGO/iYkz7aJKBqQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793082765;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YNC+5Q8ywcVhaGkJ70ug7xQ9xzmTEHv9efz0hGnifpU=;
	b=tpAjN1F4oR9IJUw6UFNA2LTt5V0rvZRmL/4XYUX4Bt4NQ9Pnf0JB48CjK8H0dlTHv/TV
	 1i8EZqVk3+sWeXAzzz8+AXNc4WuRqNTqQGeUGYxzfcc4FsLDLRNTVKgMg4t3x3GI/E8FU
	 vwL7pik3Ji+hFHf3PsXLJa8phnxA7lJmlNy7mBjD+U7L4N1OauRcOJ6Fpb7vHjXdXxW0W
	 VnsKhV9I/SQpgsqZKbL7ssVaq+bBegiQ+5OSTpzywiasFLw1f54I5sMzDpFgO2uUur7Ux
	 skkp4humDhI+VWQLVALAtesSdHAjrpFBN3lnlZ+lU+5aVC9QSxnkt3czRYGaO4J8rEg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=T1EUY+2q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.170
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7362606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:32:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7362606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=T1EUY+2q
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5e9528732b4so3053787e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 23:32:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793082763; cv=none;
        d=google.com; s=arc-20260327;
        b=O0x1P/vhM8+MPNLLsQyUA4/dQtyVVhnLe36fQtIh9nOhLDSbGKd8GQcisHvhR0ZzlT
         RAr1T99l6SQLo+x0HsGn3RwKpq468DFQKilupdGvB/GnULFPpUTfNQDllAlrdrWr8aIV
         YGkbVO7vyV8TWS/j35xcrvCtERj3mZzpyX5vcLOsH0YKbMw3mdeFluLZY4STDRJF2A/3
         QvCVyeZgBf+cHYRzlstIro+tMoAo43GyKmisbiR1DuJbc/ihRWLC/z1ii0ZQuTfpbms2
         0185njYgi3oIuxUxeYSVns+iEIxfWTnwg8TGipJBtczafF2/DPRuL+n4qZqLky7hRosE
         wE8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YNC+5Q8ywcVhaGkJ70ug7xQ9xzmTEHv9efz0hGnifpU=;
        fh=M0TC8WJBnuTqej9Vza9d5A2z4PFQTWrJOEgOyaJLCoo=;
        b=Sj4szAdsfHzDkczFA5+e8XTPjUZlPm3arwQD7+yGdNZld+ermKA3qMFYf6LrDTTYm3
         /WzG0M4cb9hgRFH6giBs/JyZXwzPzRLbgR2jPGKkBfZ+Jh1feus60oOcdClzyXaM+S5a
         Pc9Bjg33WW3adI/1BOyMwY51Iaxg7CFYJZCzBqBL2z7YZIHll/qCZg+2YPGntP3PFFGV
         Yk908WRogKWSKZ0B4jsEGHqtNtnA/2R8AAsnBns+8+QsFbWDaYZpg6+NAJ3isy3cLzWR
         gZMv+fVo4vUD4gfa7KDpWSs4ADr/siCFjW08DpfF4GhxY6jLBnb9Z+APf2DNxTVPk4XU
         +07w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793082763; x=1793687563; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YNC+5Q8ywcVhaGkJ70ug7xQ9xzmTEHv9efz0hGnifpU=;
        b=T1EUY+2qXsctc1tc/qq7ArsLq0EMQ3l3tMckOGlsXUXZXg3pUyx66odPL8RGIP3fTo
         lCzolKrjt84LSV3V8/fPTRxef5J9tF1UzGopXPIoDMAKYJrD4Qcg/lA87ntLSErMpkdD
         Ovg+hPsdL3bpX8oh1fKaZJ/7VmdlfIGeSLhQBxfg6lqnj5JAxR70KOFMJ1KOodL+6cr5
         8YUXui+rwr52ywhomIVEkSeHRSLRTGfa52u+18yIfH/pokp8BcfwZYVkIOOjq/+FaVn2
         Ng3f8hK78sjIm8G0IlliLYaQnaB75TIgAKtr232zQHkCZ+DoD2GStZ4BwHsS3DpweVxU
         nsHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793082763; x=1793687563;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YNC+5Q8ywcVhaGkJ70ug7xQ9xzmTEHv9efz0hGnifpU=;
        b=UbAk0pvTzaC4ca2V7mrNXQKcp4RvysUvYL/r/bYPIhqZNQZcGaYQ87i5qChixTjdoV
         DdtBmO8Zdulvrk0PxLNkRTghnyaMD7vVGCQsV9yWGMhO9EFH1/MvAzL6VwlJeFFS3r1i
         uh567tq0epeoiRtaXEfac5VnF2cDs4dXcHPq7HIVllEJY6Uzug9NseorW3lmEVklGESi
         HF6Q1fjoAUSN+qEFY2iiO0Dxsf3YLPeto08I7VDsqJj+D2RDdnDkbGDLmv/G26P1VgOM
         AtNrrHUfdAq0b0wlJ3EI+9X8nbps0SXQsNaUn9CsDtow1B+KiRB3eM7jouwd1i+bVB+N
         Zx5g==
X-Forwarded-Encrypted: i=1; AKwUvBy6HExm4R91akzHdJdZwAfg4JmI/ga8zgSbsRAqOKXdIztg7r0EjUUqNAEaaNJQQpmpTaC9jr/QTcqMi6E=@vger.kernel.org
X-Gm-Message-State: AFq9FYKaSJ8PYHHGuT8rtrQXf+82C3S51BzgONBRY+j7MRlCDP4q7vz3
	Sqohgi6UWQauyKg9l/oB360WyQnRfvMLDbfE+Sy5yGsprJuFVPXRioUIDhJ6eiwBpNocJSKwzJx
	Q3QEr1aHAR/UmXl58rNw1e0YjBwPebng=
X-Gm-Gg: AYBFou1txsX0qt9jcDVZYwxtrAHQGAFQR0sE8n/fWyFk00LL3Jzf1YAXD/y5jsv3+Vk
	Fxq0Gz25h7LzV7nJ1vU6/GJSdcCHzsrI8IFUVzIBzDwuyPSFA5vCxJE+A0if9OhjTmLEF9ogDst
	TUNlzzZMQuOKTYpp91nKnkHrvrsxwOCEs1/OJpEoByviibLREDAbvmvJioC5hS5C2rHjNluacGd
	3JpZAaOBBz2IwzTHxGnf9lS0GpkjhpGnAi2eBMEyilzH16P9COl7B9y0XXXagREkjbAyi385fGY
	o21djDy5weFZI7Zyp+YK4dYZq4NcniVdpXwFpmFjJsTx0BVz9UhB6cF+18nXP820lJXjuTv3qMw
	vzTT75X89hppkLnnA8twj+00T2CKr6sS/TNXwBNfJPxFBNznuCBHfsHyHbXgOzRGUPvKxhKt8hy
	h2OJZwXV6oQe1VhHU6S7ssTjPpKk/Kf0HtAawFAe56fCANkLTCzSb9K487XP7wftx0xxWAb6Vio
	cm0+HM4KAFThLjsCxGCXrkoIB0scg==
X-Received: by 2002:a05:6122:511:b0:5e9:731b:850a with SMTP id
 71dfb90a1353d-5ec2325307bmr3697218e0c.11.1793082763616; Mon, 26 Oct 2026
 23:32:43 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024-submit-serial-8250-rxtrig-lifetime-v1-v1-1-731b78d5003d@gmail.com>
 <53624662-e94e-4fcb-9902-7fa4143c7689@kernel.org>
In-Reply-To: <53624662-e94e-4fcb-9902-7fa4143c7689@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 27 Oct 2026 00:32:32 -0600
X-Gm-Features: AclHuK-VteJCDyZWMTDi6g_Udz_eBxnBl4fZK7ID0EFFDg2cuYephSJCH3PY-eQ
Message-ID: <CADvTj4omDXXWBLJ__7jDjJHgkPe8NTc3BrVp0snexe-ETKNctg@mail.gmail.com>
Subject: Re: [PATCH] serial: 8250: clear RX trigger callbacks when removing a port
To: Jiri Slaby <jirislaby@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Crescent Hsieh <crescentcy.hsieh@moxa.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-serial@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 12:09=E2=80=AFAM Jiri Slaby <jirislaby@kernel.org> =
wrote:
>
> On 24. 10. 26, 22:05, James Hilliard wrote:
> > serial8250_unregister_port() removes the device supplied by a driver an=
d
> > normally re-registers the persistent slot as an unknown legacy port. Th=
e
> > slot retains its RX trigger callbacks and sysfs attribute group, so the
> > replacement rx_trig_bytes attribute can still call the removed driver's
> > code. Unloading that driver leaves the callbacks pointing into freed
> > module text.
> >
> > Clear both callbacks after uart_remove_one_port() has drained the old
> > sysfs users and before registering the fallback port. Its RX trigger
> > attribute then uses the generic handlers, which reject a port without
> > FIFO capabilities.
> >
> > Also copy the callbacks unconditionally during registration. A replacem=
ent
> > port without custom handlers must use the generic implementation instea=
d
> > of inheriting callbacks from the previous owner of the slot.
>
> I don't understand why this is a problem only for the two callbacks.
> Care to elaborate?

It isn't limited to those two callbacks. The specific path here is the
rx_trig_bytes attribute recreated for the fallback PORT_UNKNOWN port.
Its show/store handlers call get_rxtrig/set_rxtrig directly, without
requiring an opened or initialized port. The FIFO capability checks are
inside the generic handlers, so retaining a custom callback bypasses
those checks.

The other callbacks have different protections: serial8250_init_port()
clears pm, for example, and uart_port_startup() skips startup for
PORT_UNKNOWN. Those protections do not cover subsequent slot reuse.

In that replacement case, startup and set_termios are also copied only
when the new driver supplies them, and serial8250_set_defaults() does
not reset them. They can therefore retain the previous owner's handlers
too.

This patch addresses the direct sysfs exposure introduced by the
referenced commit, including replacement of these callbacks when the
slot is reused. The other retained callbacks need a broader cleanup of
the replacement path as well.

>
> > Fixes: 8a6c543cf8b3 ("serial: 8250: allow UART drivers to override rx_t=
rig_bytes handling")
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >   drivers/tty/serial/8250/8250_core.c | 9 +++++----
> >   1 file changed, 5 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/tty/serial/8250/8250_core.c b/drivers/tty/serial/8=
250/8250_core.c
> > index 42319843cb5b..c638e10c43e2 100644
> > --- a/drivers/tty/serial/8250/8250_core.c
> > +++ b/drivers/tty/serial/8250/8250_core.c
> > @@ -830,10 +830,8 @@ static int __serial8250_register_8250_port(struct =
uart_8250_port *uart,
> >               uart->port.get_divisor =3D up->port.get_divisor;
> >       if (up->port.set_divisor)
> >               uart->port.set_divisor =3D up->port.set_divisor;
> > -     if (up->port.get_rxtrig)
> > -             uart->port.get_rxtrig =3D up->port.get_rxtrig;
> > -     if (up->port.set_rxtrig)
> > -             uart->port.set_rxtrig =3D up->port.set_rxtrig;
> > +     uart->port.get_rxtrig =3D up->port.get_rxtrig;
> > +     uart->port.set_rxtrig =3D up->port.set_rxtrig;
> >       if (up->port.startup)
> >               uart->port.startup =3D up->port.startup;
> >       if (up->port.shutdown)
> > @@ -953,6 +951,9 @@ void serial8250_unregister_port(struct uart_8250_po=
rt *uart)
> >       }
> >
> >       uart_remove_one_port(&serial8250_reg, &uart->port);
> > +     /* The fallback port must use the generic RX trigger handlers. */
> > +     uart->port.get_rxtrig =3D NULL;
> > +     uart->port.set_rxtrig =3D NULL;
> >       if (serial8250_isa_devs) {
> >               uart->port.flags &=3D ~UPF_BOOT_AUTOCONF;
> >               uart->port.type =3D PORT_UNKNOWN;
>
> thanks,
> --
> js
> suse labs
