Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793177600;
	b=M4gB841McerprFKlKNbX+U/O8+vqDGBKnGbPcHSuFa+kbpX4nCwzYr46j/hHei2/g7jb
	 gMVxjot90N33wFnVg4p+rywAxXG5lmGU+8vENkQ08w+LVkNE1w0JcTOdUWK8N2cS6A7rT
	 7MFK9zzApXHEIjDKPMqcIxcDwZT6mSKPuwpWPwGukYemsEDIUxTKd0W2NnYTsqwX70tNZ
	 kCOF13BXVb10xUHWNuMSYShYxM3x/AYvRSPrxPDRZjQZ03wJgTGyNvrdGShyINepbsgJs
	 OFWNe9cI2lzXrlWnRSVBI8aUPsk6LE1Al1mQqZ10aKxkQYNeIavmV5l+a2Vvyz2ZCKQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793177600;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FlHhSlz8HMhmsAgAah+96UUmNr3q3P/5A9H7JsgocBA=;
	b=geQbHcqMo+/M6YazEdGeV6fxOtdQFT7NDKb2n9Lckg/gws/YIa7NEb0bG/xR1AELvLJM
	 zsYoH1otv9Q3t/eMAY1ij3cZx+Ce9jcDqyu5WpEC7OEyUuvR087Pz06jkjStdxMK9PTL0
	 xhp466ab3jL8IjGQebdlwyCZ1Wi9xMjWPB2lOouzzYbV0dqY7bjgUbC7gfVWxApMf0zb8
	 JhnI1jXgu3ZnOuheqw88D0f2GVDdwmJhPlaml/WTp8LiXEgWgPGM4kZzyhv3FfBYS3muA
	 Qs9z2XLoGzwEP90frbtQXh9FsSMhxJja2SgUKliEbbEvR/TYL7IGdho0cZ2qHjGfNzg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vGEmwoFg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.171
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4983A606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:53:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4983A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vGEmwoFg
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5e9528732b4so667110e0c.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 01:53:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793177599; cv=none;
        d=google.com; s=arc-20260327;
        b=Gg/I4wWKJtxZUtMKCC4DVX613RMKeu5jQKfRX3aoXXwHytMdsTF7DGQXhkNNiNO68p
         cdy2ai90H/8LcyK7YhOMkIOteVQqBVaEevot6pwXDezUOEBUrkeKGV8jP7gjfat6nc2/
         sPVinL4A3avPbFIAnPJ8eq6XhDbOwedvDNd8hei0YoMgk9KWuswI6dGfI/ZX2LHITr+D
         3DrZdcCQGxQN5nc+CUYmlt186A70XDc57hXhrORhIE8hfi4T9dKFlyQeo1O/lTthPIo5
         BbFiSmy7bm0ob81i6NR2kVzJYHTQD/sdOxbRblvc5H/N6JrliJV5+6fK3vtyCSbJvlI2
         1ufw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FlHhSlz8HMhmsAgAah+96UUmNr3q3P/5A9H7JsgocBA=;
        fh=yQP8SA0ZF++z829cUTymSBObLAqD8Fuu1yhG7cb+gHE=;
        b=SxB4r5znNXw+hl0M+0wfpFptvpCck95riH5n2uzeSVPdYyTQ0Gws53WTh5DxvB/1JF
         JtPUoXKctWd1rToqLLNSG1OsKmd20yVw0072YQ+XorDYrLwdM9iw9R23o8uU14qfKKdx
         TOnm6gueYgbVJg0lWMm/dHI7SKhET8/Be3SmuUHIPTA25EIZGKu+/LGPd0ccSKEj0qFz
         0ClACbsubxujaZyRrxyjhtjWRZBgHfucFV3VvqGs/vBv6sTxmerbuSfFYMv7dD+hUaQT
         frJgASJwroeCZJQIZoMYwmeW+VGYad7M95/0/RBbdaBZ1s3KIuf5vCLkrd2sIhuI0ico
         3ZaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793177599; x=1793782399; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FlHhSlz8HMhmsAgAah+96UUmNr3q3P/5A9H7JsgocBA=;
        b=vGEmwoFgFjN3MB70sRjXFNgu6IsMYvINUtKLGsqbJu9pJS3LhrjXT7SBpQONpVZZhB
         woNMQFKe5c3T6aXPBB/iEZ4Dnd20ixw6foHpJFFLfMxZV7yHHnA+8gx1xF4oKIinhXJJ
         Hjm4lQrwpmMW0jfyisZ8lidUsynUXFdxXUhfZqy9na09b7RusJHOCUJdkZ/4yUhJ/aAV
         72UjNHVDkklfDNNJ6T4741SJSWggtEXNxGMOx4cLd2CkYn8uRKyLntAPEdha6zDqcFC4
         0KpFtpknqblL0prH+nIEt/QbKEP7PxRnHyBKLR6YfegvtA24ZzaumRnTzkz8TS+ZQ13c
         SOzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793177599; x=1793782399;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FlHhSlz8HMhmsAgAah+96UUmNr3q3P/5A9H7JsgocBA=;
        b=LzMpFhI/RNRYinM5O52yyHZxxZDyg/Mi/7z2PDYMLapD4W0P0EnzGnQU1psT+wbUSO
         BPkjSw+FBixOMelHMWPHSl5s438R0TWYb6Yu95mSWuuXyfCodRGd3vKFxqoswJ4h/ptD
         d8TtBxiNulaSB8EoYnC+CnO8O8O/6cDiA8RoUbKNOcfi7BgU0BHP2xrZO1ULg7CFc52L
         wFW6OXQPM/zxlLtHGnlVw6SwbfiHsb9utdU6rhhmxOFfNFVkIpXcNMCAr25TTMWheOid
         rq06019ImOtWnryaPSnQo3RpfLuevKVC2I7Jcu8kVigE1V+0BWY5Q/sWIaB9yC5enNhE
         DtPA==
X-Forwarded-Encrypted: i=1; AKwUvByX5a1GMoaHWaX7fkQ4SbR0B2XkJk2SmtovsbNiFwZPtoQEo7YrEOBh3H7WeBSKwnEk0922QdHoEmi8Wko=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZ+6Qee/S8z6JITBKDPbJgBQ/XTN4oYkl4zc547UYR420COMKd
	MNYktChawYfkNaipqi/5gEBSBO6L1TIy9eUIPVeSEbty/QocWj1XDfYyPiiaSDfK4eLY7zitvsD
	OXve0TlTohM0N4xfNbkfYejaDcl4Myhg=
X-Gm-Gg: AYBFou3pIqYyCD7D1JSgt0u5i90tWaNXeVUKV3lyTOaT93YZ/s4C46uyzyq3yMeIT23
	UoLkNx+Rig5M9vx7oNwLm+nnzsnhg5u2nRe9YayF5EythTHSz3IKIgUEV6nYYKG6wGc+zMBY6Iw
	xXKcaAhNfPTT29oe5Shr96QZEFpMbuK/LUupzN58EE6bIYY6uPE93Vzo+7L16eh3Ni29A3eUqVP
	iyVjxrwNL2osgT4tzIFOWkxzgBJleEotMWlv5uL3T7GeLa79iIa0EelS9DT2KHslrsiZ9sGLcuc
	EfGRjhyj1cod2GzQf0GmBFrAl4vq7/QUesLJxih365D7tRcRxFemhKTLm2Gaq2DEhbUv7bpw/Tb
	KTOMThnmZ5BYxPaXMwsIG5gaDfcbzdB4olzY/B9IGpqDafYPqYLHUIXSzqpdpOz4OerT6D1c2Zk
	82KNOt0r0Zpsa2EF0UCbXUCTQyb1XZeQ0pR70jbR+3Kej+YNu0rOCAW/CQcWQU+zXIv4E8vysKx
	ivDJOA+fnz/c/Q1MVQ38lT2D99J+zw=
X-Received: by 2002:a05:6122:e22b:b0:5ea:df96:c394 with SMTP id
 71dfb90a1353d-5ec4cbc53dcmr735009e0c.5.1793177599205; Wed, 28 Oct 2026
 01:53:19 -0700 (PDT)
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
 <20261027-submit-h616-uart-fifo-v1-v4-4-d37e018fd0a6@gmail.com> <c8668925-efec-da4c-193c-5e85c5bbcf15@linux.intel.com>
In-Reply-To: <c8668925-efec-da4c-193c-5e85c5bbcf15@linux.intel.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 28 Oct 2026 02:53:07 -0600
X-Gm-Features: AclHuK_mnaE8FYNJJORUUY4g9ttUI8htgnnSLpHl_6Eypp3F-37DUlSMbLaTo6U
Message-ID: <CADvTj4pquJ=WV3UuQc1PxazSWh48cPi9jY5G7nNORgvyV0-Dww@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] serial: 8250_dw: configure the Allwinner H616 UART
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	LKML <linux-kernel@vger.kernel.org>, linux-serial <linux-serial@vger.kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 2:39=E2=80=AFAM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Tue, 27 Oct 2026, James Hilliard wrote:
>
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
>
> You do that, I can see from the patch, but I came to read this changelog
> to understand "why"?? You provide zero reasoning for this design decision=
.
>
> Since you fifosize is constant as well, so what benefit building it on th=
e
> fly servers?

The intent is to keep the FIFO depth as the single platform-data input
and derive the thresholds from the common Allwinner mapping. Other sunxi
integrations using that mapping could then supply a different FIFO depth
without duplicating the threshold table.

Building the table once also lets get_rxtrig() and the shared
bytes-to-FCR helper use the same derived values.

>
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
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  drivers/tty/serial/8250/8250_dw.c | 94 +++++++++++++++++++++++++++++++=
++++++++
> >  1 file changed, 94 insertions(+)
> >
> > diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/825=
0/8250_dw.c
> > index 1351523f0c47..2f156c01c5a1 100644
> > --- a/drivers/tty/serial/8250/8250_dw.c
> > +++ b/drivers/tty/serial/8250/8250_dw.c
> > @@ -19,6 +19,7 @@
> >  #include <linux/io.h>
> >  #include <linux/lockdep.h>
> >  #include <linux/module.h>
> > +#include <linux/mutex.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/pm_runtime.h>
> >  #include <linux/property.h>
> > @@ -63,6 +64,7 @@
> >  struct dw8250_platform_data {
> >       u8 usr_reg;
> >       u32 cpr_value;
> > +     unsigned int fifo_size;
> >       unsigned int quirks;
> >       void (*setup)(struct uart_port *p);
> >  };
> > @@ -81,6 +83,7 @@ struct dw8250_data {
> >       unsigned int            in_idle:1;
> >
> >       u8                      no_int_count;
> > +     u8                      rxtrig_bytes[UART_FCR_R_TRIG_MAX_STATE];
> >  };
> >
> >  static inline struct dw8250_data *to_dw8250_data(struct dw8250_port_da=
ta *data)
> > @@ -657,6 +660,89 @@ static void dw8250_octeon_setup(struct uart_port *=
p)
> >       dw8250_setup_dma(p);
> >  }
> >
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
> > +
> > +static int dw8250_sunxi_get_rxtrig(struct uart_port *p)
> > +{
> > +     struct dw8250_data *data =3D to_dw8250_data(p->private_data);
> > +     struct uart_8250_port *up =3D up_to_u8250p(p);
> > +
> > +     guard(uart_port_lock_irqsave)(p);
> > +
> > +     return data->rxtrig_bytes[UART_FCR_R_TRIG_BITS(up->fcr)];
> > +}
> > +
> > +static int dw8250_sunxi_set_rxtrig(struct uart_port *p, unsigned char =
bytes)
> > +{
> > +     struct dw8250_data *data =3D to_dw8250_data(p->private_data);
> > +     struct uart_8250_port *up =3D up_to_u8250p(p);
> > +     int fcr, ret;
> > +
> > +     fcr =3D serial8250_bytes_to_fcr(data->rxtrig_bytes, bytes);
> > +     if (fcr < 0)
> > +             return fcr;
> > +
> > +     guard(mutex)(&p->state->port.mutex);
> > +
> > +     PM_RUNTIME_ACQUIRE_IF_ENABLED(p->dev, pm);
> > +     ret =3D PM_RUNTIME_ACQUIRE_ERR(&pm);
> > +     if (ret)
> > +             return ret;
> > +
> > +     guard(uart_port_lock_irqsave)(p);
> > +
> > +     up->fcr &=3D ~UART_FCR_TRIGGER_MASK;
> > +     up->fcr |=3D fcr;
> > +     /* Changing the trigger alone preserves the FIFO contents. */
> > +     serial_port_out(p, UART_FCR, up->fcr);
> > +
> > +     return 0;
> > +}
> > +
> > +static void dw8250_sunxi_setup_rxtrig(struct uart_port *p)
> > +{
> > +     struct dw8250_data *data =3D to_dw8250_data(p->private_data);
> > +
> > +     /* Allwinner RX thresholds differ from the standard 16550A table.=
 */
> > +     for (unsigned int i =3D 0; i < ARRAY_SIZE(data->rxtrig_bytes); i+=
+)
> > +             data->rxtrig_bytes[i] =3D dw8250_sunxi_rxtrig_bytes(p, i =
<< UART_FCR_R_TRIG_SHIFT);
>
> FIELD_PREP(UART_FCR_TRIGGER_MASK, i)
>
> For clarity, it might be useful to split it into two lines using an
> intermediate variable.
>
> > +     p->get_rxtrig =3D dw8250_sunxi_get_rxtrig;
> > +     p->set_rxtrig =3D dw8250_sunxi_set_rxtrig;
> > +}
> > +
> > +static void dw8250_sunxi_setup(struct uart_port *p)
> > +{
> > +     struct dw8250_data *data =3D to_dw8250_data(p->private_data);
> > +     struct uart_8250_port *up =3D up_to_u8250p(p);
> > +
> > +     p->type =3D PORT_16550A;
> > +     p->flags |=3D UPF_FIXED_TYPE;
> > +     p->fifosize =3D data->pdata->fifo_size;
> > +     up->tx_loadsz =3D p->fifosize;
> > +     up->capabilities =3D UART_CAP_FIFO | UART_CAP_NOTEMT | UART_CAP_A=
FE;
> > +
> > +     dw8250_sunxi_setup_rxtrig(p);
> > +
> > +     /* Use software RS485 with the Allwinner register layout. */
> > +     p->rs485_config =3D serial8250_em485_config;
> > +     p->rs485_supported =3D serial8250_em485_supported;
> > +     up->rs485_start_tx =3D serial8250_em485_start_tx;
> > +     up->rs485_stop_tx =3D serial8250_em485_stop_tx;
> > +}
> > +
> >  static int dw8250_probe(struct platform_device *pdev)
> >  {
> >       struct uart_8250_port uart =3D {}, *up =3D &uart;
> > @@ -878,6 +964,13 @@ static const struct dw8250_platform_data dw8250_dw=
_apb =3D {
> >       .usr_reg =3D DW_UART_USR,
> >  };
> >
> > +static const struct dw8250_platform_data dw8250_h616_data =3D {
> > +     .usr_reg =3D DW_UART_USR,
> > +     .fifo_size =3D 256,
> > +     .quirks =3D DW_UART_QUIRK_SKIP_SET_RATE,
> > +     .setup =3D dw8250_sunxi_setup,
> > +};
> > +
> >  static const struct dw8250_platform_data dw8250_octeon_3860_data =3D {
> >       .usr_reg =3D OCTEON_UART_USR,
> >       .quirks =3D DW_UART_QUIRK_OCTEON,
> > @@ -929,6 +1022,7 @@ static const struct dw8250_platform_data dw8250_td=
a54 =3D {
> >
> >  static const struct of_device_id dw8250_of_match[] =3D {
> >       { .compatible =3D "snps,dw-apb-uart", .data =3D &dw8250_dw_apb },
> > +     { .compatible =3D "allwinner,sun50i-h616-uart", .data =3D &dw8250=
_h616_data },
> >       { .compatible =3D "cavium,octeon-3860-uart", .data =3D &dw8250_oc=
teon_3860_data },
> >       { .compatible =3D "marvell,armada-38x-uart", .data =3D &dw8250_ar=
mada_38x_data },
> >       { .compatible =3D "renesas,rzn1-uart", .data =3D &dw8250_renesas_=
rzn1_data },
> >
> >
>
> --
>  i.
>
