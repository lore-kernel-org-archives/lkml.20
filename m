Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792722025;
	b=OgCs90qVbHybXdz3xpqKwmp2VlGKTt/gQ7ZZMYpwoiI23v2W2H2K9SIbMZT4e756QolM
	 a6jAg7iAZHft2tMOrWeoKte8feHKV8e9EI4vmOnNl2pRfPqenSSGUIeUzvnJjTxWnswff
	 S8WKzTWv8y7IyGim9J5LYIAiVElbu0M9OXU2d4W5545Uqxj6oxyH76Py++en/6ujpqpyl
	 /7refj2qy162ZKRM471Msq5ofQ2mkdEXjpyVIhWXRoStd96iBbbSPnCc8KAk71uzBfr3n
	 u76EAsRBnvjgMlFudqLNdhbSluv2rAkwL0PEVO58YmUV3bfduMtdTlDzl93ZMerVXDQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792722025;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=m31+kFGOIU13FQ2niFCIhiyf7qxQvPAkGY0Wzy9JHCU=;
	b=FdUgniFfcNmEtixjUAjlGf3lCVMQnoysiC8AqUrIjdyq3tIc1jaGFKZvK94bgul/sDtw
	 heeTjcEiijYabFavScFZpyB4OHrrohXk0y+7Vv105sgoIitOSg/w0LHJCFrUfgVrDIG4z
	 IteUGzUHduYWXcO0oEIMDPxw2KT41aWVfOhpYDCycb9vA+1gWjLW2FMG2UxXhyCjag93d
	 c52anS8vY78sEyp5z9rUpcP4IU/XzXifQrPh2WSTpRCprDI75CV58O3dYGTUF3KSZVSgY
	 kxZKmsPO0B0p7mrH0MOajz69zG2Bu/cFpZWWwx6lwhPecht1HUx+TJayMN4zkqjSpyA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=As7nSnfk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.171
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDA2606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:20:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EDA2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=As7nSnfk
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5eaf169fe3dso158305e0c.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 19:20:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792722024; cv=none;
        d=google.com; s=arc-20260327;
        b=RqIU7JsnAn+IhIXyCgAtcgeji0j/0Y8j+vIviXjwUeYHtQ6mOFr57V5hZMqkA9K91D
         fIPPw5IhkPRXa7Kp/xiRPHAKPFeDnEfN11AFsjsQKOV145U2EEp5+dP6BfTgXxmCwdvW
         DtWo2uiEhispJJhZL7to56TssBHX/A2MHw7ulXr9ZCqoIfbhFmPB8hJDcMU5epmyuGdt
         02AZFeRy1ujqjXsHLPA8uYOxqMSu3bPCSQYR3kVmm+h/QfA43umDmCpucNOm7+MjYKQT
         vWAPapwwX7TYgXKe3o1YMPGPLW7Gi/TbnOr9+JpLkqDvOd5vl3YfpvGdQuglznsdCL5u
         Kuaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m31+kFGOIU13FQ2niFCIhiyf7qxQvPAkGY0Wzy9JHCU=;
        fh=QEOVIKelgXCDYitk3m+TE4PhrRH8JGh9Y9oSrYTQ32s=;
        b=RjCZx7tqHMvAdO9DMHVesCo4ihGScvVoPBVnNZCX2MhWVsqwWeF2LaQPbMbPJOz6SZ
         OmiwmXo/deoP85UZs4d7vYf1/kG1kOC5uvT12XrX0mvd/k/Pxm5R/Ih7cfKHS72YW3Gs
         dXUT7j8Evdn3J/VPbEgTFkDfi+7Rvurd0+GB261GsUlc/zl0tqQn3PfNA7J75Xh1rdLg
         D691oFFezlTmWOoFfS5TVcaWjHvVfUyQX6aViw0KLTVgjI4xu0jK3C5gwBArSa3oWdbI
         xW0QjGht7XV35BMwRDFIur6rN8h2fMy23I22Mt9kTyW6EJKk1FtSg4nnzEB/mRt9BcN4
         phJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792722024; x=1793326824; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m31+kFGOIU13FQ2niFCIhiyf7qxQvPAkGY0Wzy9JHCU=;
        b=As7nSnfkSHggMfctBcifriijdDMf3/xQzJSHc+yzOO1ArUwgMvaAt3eysez4OywqPe
         HHwJ8/wTfajUPSOuuPGVOjNIWlkJu8E3d3L71UOeRCa52KbSVoN6G1iJHxLmReisLbHH
         6e1EibhUL4ksaSEU3lBli08gVK7P4cvn+aT4T1kcXhQWIXc5KbxvD7eGUWIUCrnFUhGs
         SY04Z6Pn2IEhrFslsg6efCDxXuISZDzQ6uB/q7RcguttWSp0uSRIyfeBYyjeJoVhoyRx
         0W0+4ovki8fS2bBVulgIu96yOI1yLYXSO15sgP9JUtHwKfbrGxha9dlbmxaEkW891S+F
         xG3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792722024; x=1793326824;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m31+kFGOIU13FQ2niFCIhiyf7qxQvPAkGY0Wzy9JHCU=;
        b=o1LlRUfw2Ga6Wx+wkWsAb+uP32Rm4FwTpkG5B0XwvBuibwv59YsPx4IexgJdmPDL9I
         lL9gEWSSGdvfCOmQC1H2N/saDV6EUZ9xOYZombFsZOLec6LBn+oW2Oeku9qCb9TezFte
         IG4Y+fNdoH1GVNxgO4FjqQeLCJReTiZdsD21TQan7zlo2m4M4q9cedKOsTAfjVYnHV8m
         x0w7CnQ/R3kAs4WxfhVqeWhZbrVJy8UrP1xClKZWgM3zsdOrAsfMlWXgTT5VOw94bT7R
         NymSWlfl17UdcwtwmJpMy7PUp4dHUyhpI6oqtXL2SarzSkTNmXD/49h7KpJ3DRfngBMb
         hQTw==
X-Forwarded-Encrypted: i=1; AKwUvByEkCIJOtVnWl3En1BcEkJWEZSJpmqV7eZnAILpEwb6OBp6KLPuQkA/NkHQb/SQ3ZLcr+jB47m4JcGgnOM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJA2y4cAy2BdvA5IXhTM8N/G+uNXshI91jS7QBUVpvqDYPGy4J4
	IbSBxcxsvY/p266ZAcCV/7wi/krWjVqvXpYkIomXB4BgTVN2Feypi3alU3jeZkEKRUgMlymQL0/
	A2wgcwwYiBfZdxWghnupGCXKIBZycfZ4=
X-Gm-Gg: AYBFou3T0ABBVqzPVcU2jmACebjeSL+oNo77N5H+goqu0G5OcayovBd//bGoGq/WOF4
	fOjiIfJWGQ4NL56O3WXg865TfIuhFiN4ShxpCcNyPep4n/mNOkki39WQ4dZl+Pg4oRdztMLRsGI
	TDrUpVmUn4FYZq2SYjWahMeOUdpuHq03k6XIOVDX6LZ7zcNh/qrWgGmbzirgxFpnYvB7pz+/vHj
	sYROD/f+1etFS+yHSTbhRVLefkPwn5LZGWgDv6JrQsNJW1BrZcxKRbO/1CFYzyrfuzXPdYambpl
	PqMnn9EccZjstY3U15HNy72xstPiWULKIF3mU1UO1xRu1/L3DHLUQFezhAutoZ7vtA6zEmmTiob
	+/Bclgm6UAy304nFWU3JNYwVX7Gk+ahC6mZh2C6vblIzWTPKC8b4o08XE6nKLo1rHD7fCVgbYlm
	y8FmbdX/gTHemANlBGuMutXbz5OZVJnH/ATspcg7SEQNZqlbob7waMLC2kT+NgtHKmLi5/UTMwC
	uEorgUrE4H8xfGTVomqtEjMCTrk6w==
X-Received: by 2002:a67:e704:0:b0:7b1:6028:5475 with SMTP id
 ada2fe7eead31-7ccc325fc45mr450317137.12.1792722024045; Thu, 22 Oct 2026
 19:20:24 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021-submit-serial-8250-dma-cancel-v1-v1-0-efe2b89f2303@gmail.com>
 <20261021-submit-serial-8250-dma-cancel-v1-v1-1-efe2b89f2303@gmail.com> <atoW90cG8hz-h9tc@ashevche-desk.local>
In-Reply-To: <atoW90cG8hz-h9tc@ashevche-desk.local>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 22 Oct 2026 20:20:13 -0600
X-Gm-Features: AclHuK89aWM8taPGRZeoSyiqd2k01IuhObkpr-YSGe7k_7rKgUFx5DXk8auc5y4
Message-ID: <CADvTj4py34R+Ohin7XOh3a1az9_8SbZoZLryeMK7iUCXNumJxA@mail.gmail.com>
Subject: Re: [PATCH 1/2] serial: 8250: drain canceled TX DMA before reusing
 its buffer
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Raul E Rangel <rrangel@chromium.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 8:00=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Oct 21, 2026 at 04:37:43PM -0600, James Hilliard wrote:
> > uart_flush_buffer() resets the transmit kfifo before calling the driver=
's
> > flush callback. serial8250_tx_dma_flush() terminates DMA asynchronously=
 and
> > clears tx_running, allowing a new write to replace tx_size before the o=
ld
> > completion callback has finished. That callback can then consume bytes
> > from the new transmission. The serial core can also overwrite the old
> > DMA source as soon as it reuses the reset kfifo.
> >
> > Give DMA a private transmit buffer, keeping the kfifo offsets used by
> > FIFO-window providers. Copy only the queued ranges before handing the
> > buffer to the device. Flushing the kfifo can then no longer change an
> > in-flight transfer's source.
> >
> > Keep tx_running set while a worker synchronizes a successfully terminat=
ed
> > channel. Suppress callbacks and new submissions during that interval.
> > The DesignWare idle helpers must not pause or resume a retiring channel=
.
> > Once synchronization finishes, process the zero-length completion under
> > the port lock and start any data queued after the flush. Reuse the norm=
al
> > completion processing for OMAP too, including its delayed register
> > restore and runtime-PM handling. Drain the worker before releasing DMA
> > resources on shutdown.
> >
> > Calculate the queued length before calling the platform preparation hoo=
k,
> > so it sees the length of the transfer being prepared rather than the
> > previous transfer's length.
> >
> > If termination fails, leave the buffer owned by the transfer and let it=
s
> > normal completion release it. Do not submit another transfer before tha=
t
> > completion. A DMA completion still does not mean that the UART transmit=
ter
> > is empty; the existing line-status checks remain in place.
> >
> > The race was found by inspecting cancellation and restart while prepari=
ng
> > H616 UART DMA support.
>
> ...
>
> > +static void __dma_tx_complete(void *param)
> > +{
> > +     struct uart_8250_port *p =3D param;
> > +     struct uart_8250_dma *dma =3D p->dma;
> > +
> > +     guard(uart_port_lock_irqsave)(&p->port);
>
> Add a blank line after guard()() everywhere, otherwise it's harder to see=
 it
> in the code.
>
> > +     if (!dma->shutting_down && !dma->tx_terminating)
> > +             serial8250_tx_dma_complete(p);
> >  }
>
> ...
>
> > +static void serial8250_tx_dma_flush_work(struct work_struct *work)
> > +{
> > +     struct uart_8250_dma *dma =3D container_of(work, struct uart_8250=
_dma,
> > +                                            tx_flush_work);
>
> Make it a single line.
>
> > +     struct uart_8250_port *p =3D dma->port;
> > +
> > +     /* Neither the channel nor its buffer may be reused before this r=
eturns. */
> > +     dmaengine_synchronize(dma->txchan);
> > +
> > +     guard(uart_port_lock_irqsave)(&p->port);
> > +     dma->tx_terminating =3D false;
> > +     if (!dma->shutting_down)
> > +             dma->tx_complete(p);
> > +}
> > +
> > +void serial8250_tx_dma_prepare_buffer(struct uart_8250_port *p,
> > +                                 struct scatterlist *sgl, unsigned int=
 nents)
> > +{
> > +     struct uart_8250_dma *dma =3D p->dma;
> > +     struct scatterlist *sg;
> > +     unsigned int i;
> > +
> > +     /* Preserve ring offsets for DMA engines which implement a FIFO w=
indow. */
> > +     for_each_sg(sgl, sg, nents, i) {
> > +             size_t offset =3D sg_dma_address(sg) - dma->tx_addr;
> > +
> > +             memcpy(dma->tx_buf + offset,
> > +                    p->port.state->port.xmit_buf + offset, sg_dma_len(=
sg));
> > +     }
> > +     dma_sync_single_for_device(dmaengine_get_dma_device(dma->txchan),=
 dma->tx_addr,
> > +                                UART_XMIT_SIZE, DMA_TO_DEVICE);
> > +}
>
> This is a bounce buffer, why do we need it? Shouldn't this be rather the
> respective DMAengine issue on how to treat the pieces?

The problem is ownership of the serial core's transmit storage across
flush. uart_flush_buffer() resets the FIFO before calling the driver,
and writers can reuse that storage after the callback returns.

dmaengine_terminate_async() does not guarantee that the transfer or its
completion callback has finished when it returns. The driver's flush
callback holds the port spinlock, so it cannot wait there using
dmaengine_synchronize(). This lifetime gap therefore exists even with
a provider implementing the DMAengine contract correctly.

The bounce buffer in v1 protected the transfer's source from those new
writes, but it added an allocation and copying to normal transmission.

> ...
>
> Overall I have a feeling that we turned somewhere in a wrong direction.
> This all activity on 8250 DMA support looks like over engineered approach=
.
>
> Perhaps we need to reconsider the whole picture?

I've reworked TX in v2[0] around a serial-core storage reservation instead.
The logical FIFO is still flushed immediately, but the driver can reserve
its storage until DMA and the old callbacks have retired. During that
interval write_room() reports zero, and write()/put_char() accept no data.

Normal transmission continues to DMA directly from the FIFO. A worker
performs synchronization outside the port lock, returns the mapping to
CPU ownership and releases the reservation. This removes the private TX
buffer and copying while retaining the required lifetime protection.

[0] https://lore.kernel.org/r/20261022-submit-serial-8250-dma-cancel-v1-v2-=
0-088ea51e3891@gmail.com/

>
> --
> With Best Regards,
> Andy Shevchenko
>
>
