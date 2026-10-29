Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793261665;
	b=pv5ud/4pgVMvTRxF2lCGeQXD4czgNl4Fy6qOTcnYukcJbwQQ55gTrbnIUrmRKRzelKfw
	 MvdSrV7nW8bpk6/mkPWH5jWFmzYwN+0eB7ovTrX3Dqs9Rs7woUdC5RNiJJvNG+wCDL69I
	 /VFL4Ulgd15UhFnZZCuDKF3zrwaINuabZIwjK6Lu70c0NTFk1ZGzJeqMlR8yWEncO1m52
	 jIbWZLZhqJpJNoSflBGrVw00F25SdvfhRpBSI+7VINgzhpgOQWQQpwhKjgPDAY75eEiBA
	 FswRQ+3xu15RCzObdRoGEVNCNclcSBaMs5fvC+Kmli68aYR6PbOxaQ0MYVbHinMYASA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793261665;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=XRqdz8CmBop39zT0MOnXVWaLPZs5c98CxtCs0iCmyZ0=;
	b=Tb8X/ah3K2F0hgjuyOj8LkRIb1PXjXJN6pqPi6jt7/o6fOAOfAj8iHKbhE8mk5Zha8NM
	 IkEXbSGNYtaz6yvQ6WyYjegBbS33LyFHJcPiyq/ILfSsjEc9/LvLCAv5RHZuhozJXQsrt
	 e1x1O3Alm4iVTP3s5ie0t6Ujj3r9KV8B4PvbwDrhW8dAhqfQ1KzVOxXQgQqSbqo/bD/v+
	 zpCif4007Ukwx2gMUv6Kqe7NkFhixNz3e3Amr37xuXeviGVEDC22Efgb5tost6RDGZUMn
	 mazTTYbNVqLcJfXVcSnaWGv/fYXjwwZr9ifKbcbIt1dOHGxqjJ+jJWPj1jL3VIllySA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ND8m6DLV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.41
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A305606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:14:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A305606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ND8m6DLV
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-97ccbba8e86so570474241.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:14:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793261663; cv=none;
        d=google.com; s=arc-20260327;
        b=GcybiPtbGTQMf3lvySNtRl5gUqU8QWEDeIJ6xEQ7aCd4W+QwPMh8BMnB1zdaH8H3d9
         KPTANsRXZdQQDUogJRJ6jQKTv/ncGkxGrevY+ytIbywVnzS8GsADs/8wcorEUcsHXBR3
         GVnBfaLBGtlv6mnKUdEn/FyCL3ecfiAinq7fG/zkXY6/r4zP4G0G+UrsjylZaNPMjvFA
         FHBzAQ6YjjNpJD9v/EHQ2XZ1u7ffWKfi+QbrEvAbl0beTZ8gWPpaI3WsXXtLTWbt94zC
         H08OAsXqCvlA+2SfUnefrihTpImJuDutCLNVVuBK3fPTZNMQGcimsjYvtt3FGyFulq1x
         RF/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XRqdz8CmBop39zT0MOnXVWaLPZs5c98CxtCs0iCmyZ0=;
        fh=L12d2Dd/3MIMdyLgjvm0FoPbxS31P23zlgCL1z6z1rs=;
        b=b3/cgcIRgWjS00RBJGPCbWEwdrvnQtwQ6SVK+fOEfj9LD2PhnkdhLY4GEuCqU0UNN3
         D+oEsymplSDEoghesxL0z+VV8taEpqz3j4Wge2Ce2HtS0RG4AOkpjg3oHDFTDEAggGGu
         lNFGzTyGLj8qV/RRn7QheAY3Yd+uqW1NvLGAqXcePaRFBeafI0lHm5Xjv5QgL7r46acs
         cHlfbq7kI/OxV4gDO5caB30pTmPcpbVzrCUo2LsHCFqSKlbF+SKyMTFW013VGrRghokE
         G4t2mK2tWLWv/LDi2BpMoYkh3J6ELBnzuWgaYN3kCRPosaj4pCNbseGcWF9j91j05RPY
         pChw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793261663; x=1793866463; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XRqdz8CmBop39zT0MOnXVWaLPZs5c98CxtCs0iCmyZ0=;
        b=ND8m6DLV16WWuekpMoLR812L+eu31U1myLQ6nrOupj4bwLsMer37A88fkbPpuJivo2
         buLxk6PuSeWeI1XYI1H7eSTkuK//cqvN0F6ZkxSI2dnCWqoppwqAirEGfsIGKKNViLo+
         uyNcWafSBTD5b14OUsWIYt5XgxXgsq93hP0y0YierUXE9TJffVG5/4LGs1o2fhfMMXVA
         Qp6kNiuis0kMZgX7AcDTRYwshNn52APSHWdgdBVKTksd+BgpJma+BhttiIVLmku2txIe
         r2rxdUITukKnUY4NiNQS9IBIea0nsfUEB2hYwoJWN+DMXCEP56QQkfb3zB8u5jM6qJ8/
         zA5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793261663; x=1793866463;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XRqdz8CmBop39zT0MOnXVWaLPZs5c98CxtCs0iCmyZ0=;
        b=eTR8sGi3SRWeVUadx15AQnIA0XOM2ODfiNxuIEaUTUszje/LmQslt8J7ccA6w9JSkt
         8N1dz/Ji3junE2K5uI99oRrZG3zb1r86fcoGuJky34yGhn9omEU2149/mHPtJWpdNOlj
         Dnq8nF7ZBh/zH7bqvfi72p8vDfCEE7ueVEHqjMkIDYEGICfhB73h8DEwAKjPc3yiwial
         SXOO4Ba8rrqYzfLw45oKhgZBw4laemXQKLSiL+/PUOQrKbpTaYYZAyHTPzWqdxUTot/W
         G8X1uoC0mZMKuEGPFwRLorZDaGmOYdiPeY+SmNGZ7/wvfWQVawx9PekP29UVKeBQlACx
         P0ew==
X-Forwarded-Encrypted: i=1; AKwUvBwFNPPWHywFse8iEs11HgQwuxx4ZwyqAvo4ztKqhBsq/+QkJrC5pu3iOJ2amzzHoAwrMewQWte3eqCHW2U=@vger.kernel.org
X-Gm-Message-State: AFq9FYJSSDltHw7eI80T1lP5LyFKjXBhB6p9vPyipxF7hTZ/Pr0tlXqA
	3yqxJcVLsdbDyWtwQFWvv3xRSSkJC/w+Ra8QSqrZAJ0opNcUa7iw6AoP0oXk0bsL6yD6WweW+yS
	4hv4cxqhATuZCTPyCQ9p0uX6RZqNYIdo=
X-Gm-Gg: AYBFou23qXqjJGOS3yGNAVeoM92MqI1wPMraYUkqc6pWMpniFh7Pyahp3yopW/na9iI
	hsOeIKbwbaPOQYGIENFPmk8gj7cAczeeRH7ClKVv0NmPNeDpxiIGk51cbHQ2Y1FjCzUYh2IQekn
	2iQTccAqGr8w/SKYXk5f9vEyp8vhsie8FkA4m3mDcCBUi1rAYa4U4Oyv8cNro6R3FRxpRX8A3zg
	+UMUeJSUEKqyTDVhQb8PFdenZP0WoMe3oKhcyq3zFmwQzpNHyHEu8gkWt44dEPQkA6nK4GMoAFv
	VH/XInUX/M3qYAQmkonzmAdJ2ruFBKurXonQibkOyOBdy/rfL4wRT/gwwTIJyD7Ky/oUnUnHGPO
	mK54v2MZ3mSXKnlqAHADrMl8w75QJat2obMbm0rO7MiFECjN3RRTyIi2a8T1+8m0tkizdR/cKzQ
	H1Dh0IVyVhZKbDdDLeO4y1UYmBGra7MnAmnqtaeg3JcRlo+waB8bDHA2tLWLSpBIharHB0M8OTY
	8lUVsRNeNrB0p6Xiz7fUrotpwycWw==
X-Received: by 2002:a05:6102:424c:b0:7cc:2712:cafb with SMTP id
 ada2fe7eead31-7d03a5708f1mr2019992137.15.1793261663187; Thu, 29 Oct 2026
 01:14:23 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027-submit-serial-8250-dma-cancel-v1-v7-0-985a023ba4b4@gmail.com>
 <20261027-submit-serial-8250-dma-cancel-v1-v7-4-985a023ba4b4@gmail.com> <20261028204847.3471382-2-rrangel@chromium.org>
In-Reply-To: <20261028204847.3471382-2-rrangel@chromium.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 02:14:10 -0600
X-Gm-Features: AclHuK92fmKJThZ29uPEx3r2hwaWsXISrLYNiraGYBJq2R2TpOOpVIz5KsrBhR8
Message-ID: <CADvTj4pEo3uj2bLbP6RwD=P+hW2omQ9x_sn_ag_FHzxUknX-nQ@mail.gmail.com>
Subject: Re: [PATCH v7 4/5] serial: 8250: drain canceled TX DMA before reusing
 its buffer
To: Raul E Rangel <rrangel@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
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

On Wed, Oct 28, 2026 at 2:48=E2=80=AFPM Raul E Rangel <rrangel@chromium.org=
> wrote:
>
> Hi James,
>
> > @@ -37,26 +40,35 @@ static void __dma_tx_complete(void *param)
> >       struct uart_8250_port *p =3D param;
> >       struct uart_8250_dma *dma =3D p->dma;
> >
> >       guard(uart_port_lock_irqsave)(&p->port);
> >
> > -     if (dma->shutting_down)
> > +     if (serial8250_tx_dma_blocked(dma))
> >               return;
> > -
> > -     if (!dma->tx_running)
> > -             return;
> > -
> >       serial8250_tx_dma_complete(p);
> >  }
>
> Removing `if (!dma->tx_running) return;` and relying solely on
> dmaengine_synchronize(dma->txchan) to drain completion callbacks breaks o=
n
> DMAengine drivers used with 8250 UARTs that do not implement
> .device_synchronize (where dmaengine_synchronize() is a no-op), including=
:
> - drivers/dma/sun6i-dma.c (Allwinner H616, cited in the commit message)
> - drivers/dma/dw/core.c (dw_dmac)
> - drivers/dma/pl330.c
> - drivers/dma/mediatek/mtk-uart-apdma.c

The provider-side fixes are posted separately for DesignWare [0],
sun6i [1] and MediaTek [2]. The v8 consumer changes require those
callback-drain guarantees on the affected controllers; they cannot
compensate for a missing provider synchronization implementation.

>
> On those controllers, if Transfer #1's completion tasklet (vchan_complete=
,
> dw_dma_tasklet, or pl330_tasklet) has already dequeued the completed desc=
riptor
> on another CPU, dropped the channel lock, and is waiting on port->lock at=
 the
> start of __dma_tx_complete() when uart_flush_buffer() ->
> serial8250_tx_dma_flush() runs:
> 1. serial8250_tx_dma_flush_work() calls dmaengine_synchronize() (which re=
turns
>    immediately because .device_synchronize is NULL), acquires port->lock,
>    clears dma->tx_terminating =3D false, and calls serial8250_tx_dma_comp=
lete(p)
>    -> uart_xmit_unblock(&p->port).
> 2. If no new transfer has started yet (dma->tx_running =3D=3D 0), Transfe=
r #1's
>    in-flight callback acquires port->lock, sees !serial8250_tx_dma_blocke=
d(dma),
>    and runs serial8250_tx_dma_complete(p) a second time even though
>    dma->tx_running is 0.
> 3. If a writer has already started Transfer #2 (dma->tx_running =3D=3D 1,
>    dma->tx_flushed =3D=3D false), Transfer #1's stale callback runs
>    serial8250_tx_dma_complete(p) while Transfer #2 is still active in har=
dware,
>    syncing tx_addr for CPU, advancing xmit_fifo by Transfer #2's tx_size,=
 and
>    submitting Transfer #3 concurrently with Transfer #2.
>
> In addition to implementing .device_synchronize in the affected DMAengine
> drivers, __dma_tx_complete() (and omap_8250_dma_tx_complete() for symmetr=
y)
> should keep `if (!dma->tx_running) return;` and check
> `dmaengine_tx_status(dma->txchan, dma->tx_cookie, NULL) =3D=3D DMA_COMPLE=
TE`
> (matching dma_rx_complete()).

I have not added this check. It could reject some stale callbacks, but
dma->tx_cookie may already identify a replacement transfer, rather
than the transfer whose callback is executing. It therefore cannot
replace draining old callbacks before releasing or reusing storage.

There is also a complication with the existing classic DW provider:
its status path can scan descriptors and invoke completion callbacks.
Calling it from the callback with the UART port lock held therefore
risks re-entry. The DW series [0] removes that behavior, but callback
draining is still required independently of a status check.

The intended guarantee is that termination and callback draining
finish before a replacement transfer can reuse the canceled
transfer's storage.

[0] https://lore.kernel.org/r/20261023-submit-dw-dma-synchronize-v1-v3-0-c6=
2bf048f5ce@gmail.com/
[1] https://lore.kernel.org/r/20261023-submit-sun6i-dma-lifetime-next-v1-v3=
-8-ef1acb0be768@gmail.com/
[2] https://lore.kernel.org/r/20261027-submit-mtk-uart-dma-synchronize-v1-v=
3-0-aad7a6b3c62e@gmail.com/

> We modeled the v7 TX and RX DMA cancellation state machines in TLA+ to ve=
rify
> both the counterexample traces above and the fix:
> https://github.com/ismell/linux-8250-dma-tla

I extended this a bit as well:
https://github.com/ismell/linux-8250-dma-tla/pull/1

One issue in general I'm frequently running into is that there's such a
large amount of correctness issues with this driver that it's tricky to fin=
d
good boundaries to split fixes up into.

>
> Thanks,
> Raul
