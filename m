Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794174228;
	b=U+buozF8p7i8v7hNLVDXFVr/zQZtXfXRwGZd755PFCsyKpvBYaqF6AATfghPnTH2MxV6
	 cf2i4MKNF0YujaBXSbrB5jI9PTnTlM3CrWPSX7Iu80ZlZtjEinoAQ051UY4zccZB8S034
	 Ber9/cWySOHjrFyfPCTspzu1NSPZHoakgVz7eWvZ3jrZnuZMjeSGLttgqJcYz+UgNxTse
	 9eILHh80z5oa/OZuDmVfW+8RzsXGSVzmbvdrQxohB9BC0cakxMf6Bi/s7GI8tRp90tuoj
	 EFfSm/uIj10lEY6kxzPzPR248GtCnOzzKffUAc/1Asj7ct2AX/zC5BXyoG6Xb9IjzkQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794174228;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=yF5DlePqIQ89+6+ZQRbgYQTljhQluORNLYxIsg7wESg=;
	b=nyHfTsThn2U78PNN56NEkx0NIJxtyI2T6sCnV6h1e1JTbZ1V9JYsQ6i3HnZvqAMecBw3
	 m2nTRCDa8NSHu/tziL/PB7MRcGQt90ixgxXAygt30W7wp6TURcFYQzR0You9j24fiMHnv
	 bH4dQnFKW7kezQHychn6vF9ituJ0Gt0e4RYglHjezrSroSzj9IXjkTZD/Cln2L/TH2Pwg
	 v7CQYpchFT4sHUVv6t3PT7F8aT3vGWFZ+HPlSWAmzzW6G0PNzpcMMAPwg/GmvyvL6sGGq
	 qiO1Q4wwwU/681gcEZuYWMQkCnnkDNGDc5eJVokOf/BVW97KvBeIftKkB6m5zJw+8IQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lVbVExxJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB10606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 21:43:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDB10606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lVbVExxJ
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b581b6b0e9so284133a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 13:43:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794174226; cv=none;
        d=google.com; s=arc-20260327;
        b=nUGHk94b/vkgUvXX9lXfUvyQaoAUsLy2dPg/BbldCM91AR6clYxlENjrtaUrHq4vi2
         TVrXJYJ1kfFL+UbFi37XQ7GAeTFg4Cs1KAaEB4c7SaEJxdcsb+vPY+JZSx2Pv0S1sLEa
         6vNF8XiTn6MxAMaU+YV7/gOh1vMOa9uRZCTCwXdKpJu/MBuxvda5XL4IIZy3nKEZ3yb7
         c8tcwMNJ8WLOrp2XpDsTFRoq3WLXnjJH9jn1m7HbiJsWo5BYoBkrz85tKgQU/mU9CUkz
         rXUh2ZPKEnxlx0F4lwV1pfdo1bG2huO120agrkjnCxhgDveJFoqLqTM1FHnfX9rn6yfu
         Z7ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yF5DlePqIQ89+6+ZQRbgYQTljhQluORNLYxIsg7wESg=;
        fh=1pd93Pbfvw9XMYOGDrsoHU3HEKSzWC0RnJIpqQhcJBI=;
        b=NURZoSA7ocNA5wQkOGRt5Tn9XsEcpG8ZmHj9DSCFdbKMxjKPgL2VyuubxgZ166kJ0q
         kYPtXEKVWBNhDNjPtgbu83Fgs0jFNlWXJXBIrFj/OZAtZpVOapRBR2VMUH97cAA7vqp3
         x7r4F1HOGJO/YwePQJ9ugDRN0jY87Cd8dZWPQWR4spc2PQmYoymjvQJZqxYbZmBV43wA
         VqHYuVbJMsFFo+cBnK83C59UK1WL3+zO56XtSBCMPpVLWIaX5Dpg+HsG/VfI+IvnpZDL
         Q4THYawN3elIPEd9T/07Ba1dGTttm6yQpzIEFcJIIDeyuku3GWUofdJxbb+4ClNlOs+F
         4fBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794174226; x=1794779026; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yF5DlePqIQ89+6+ZQRbgYQTljhQluORNLYxIsg7wESg=;
        b=lVbVExxJPle9fN9czzDRc2qwUN0TbTIx/fvGQhJpEu1AQKv8K5Nk899e7aDyco7WDI
         GjyhkSTIxFtHLYx67q8X6jUzYFfFJ5Hew2IRb2hs7H3IRQXAOezGg+5kyOp5/q8tlvCJ
         /LPbQf1pnbId+2g0TlomKEkpz9ZTHA9aRcXuXzMkCgW4e+yg7mnV76Uube/eo0P0Fj5h
         I9Tn9EunR1ZPreIlMmgJdMgZFCDReZSuXOLB80S/ejgeELC/C9jCh3/GqVd4L3kMHyhO
         NL5ICTd2EqQrQlTPUR3PerZrRHafY0QPGMKfQsIosrvwsUp7QIaFmbzlSsGbxSK/gyEu
         AmEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794174226; x=1794779026;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yF5DlePqIQ89+6+ZQRbgYQTljhQluORNLYxIsg7wESg=;
        b=RElytf6gpBOeXk/SHQdwLayCd98Vfayj4Hbu9jLc2z0C45uhQ/BFIQ8brPZ5dUKXlV
         BbG0Wr69VkRaxegRi5aVt+K2fs7B8IxPU1qMATj/eSrDTMTksDW7Skl9CDbY3XTJ3M8N
         C5qBe1X2rgLtiQA5O+qCYb+s9V6V/O6UozeMlmLCTy8w2g0MahLqOfsgWnbohAXfbhwI
         L6Nxp7I93wk5zH/Bqjoz2zzPjpXkNeYFRAKMQcdaQMn0pHp8OtbEo6YGJSBsqp0MnCTc
         MYip96OJNkxsZosUq+c4z6tg0ysqHDLbH72mCrWQ/oSkGoz7qSIaPZ27BEjVjmyMFy0u
         iJkw==
X-Gm-Message-State: APuU4Z/T71Lel/4QWX2fp8gBtmChsr5tVRYigsWVJ8MFNEt2l0ivMuor
	2172xEycwPloNvAHSA4zaqwIAWiZA//UeCyEh68MrAsD4CwFuIols+sQ+mxwtRqIx5p5Ipzgdem
	Rk76AT6U8UFn0ij6zpHCLm8/uAYPaLxk=
X-Gm-Gg: AYBFou21nhIlu9WqCiq7u/N2d2lmnVvU01kDK9K5L/KnzHi/Q0JcWSJaoO/1pEw9T8u
	b1nbMqJhVvvpDwClSwgFlpXcJ0MK15jPgyhOVEHteiYKldZ1/S0UVm9hR3zk8Qg43r0XkJZzdbo
	YQYINPjcZT2EIx7fixcId92RWdObd8KBEtk1/0NzIy8LDlALnieaJeOMgjxb/K1XtPrve46qXTM
	AIN0mLFNilQwJ+QwGxtD9Md09/c8cD9cB5gaLhwyPcpgNhrj41XPQaX7Yws0zdvNKJFK92J/NqR
	VAVnUUZmhQD0W2CpFTwNy8sxyffUIb4QvzHZHi5hxLsupfnf6def6kPaXB0lM5Dt4+cE8qAQikM
	btDQBoDmwn50Tqg3YcD1W2PzqlSREVQgClTaYvBcw7jQmzEH9RT7uXzkMFOAmciUlW4u8SOMZgC
	ugJjZAyZRMattEx2wvL3tCyYege+E9hMhexYwsDdoLR+JwUQOw5zxCvyDT0grJH62BgpJmXKrMA
	ZjVuwwsDZHqVaYvGFJC2Uo1Ym5bTxJdeSRLda4/fcN6yttcWw==
X-Received: by 2002:a05:6402:540c:b0:6b5:8579:5404 with SMTP id
 4fb4d7f45d1cf-6b7223ff1aemr1460739a12.9.1794174226025; Sun, 08 Nov 2026
 13:43:46 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106221201.15054-1-rosenp@gmail.com> <874idrvywk.ffs@fw13>
In-Reply-To: <874idrvywk.ffs@fw13>
From: Rosen Penev <rosenp@gmail.com>
Date: Sun, 8 Nov 2026 13:43:34 -0800
X-Gm-Features: AclHuK-q9mIprFpGs2w9IFL_gHJvsOACYe0dBvp3Yc9PUXEJrDYNlOx2P333gQs
Message-ID: <CAKxU2N_BbnyY3ZPsaOPRdMQU7S7FjFxb6Y9E-rcF6OezZVRA2w@mail.gmail.com>
Subject: Re: [PATCH] irqchip/ath79-cpu: Flush every write buffer of a shared interrupt
To: Thomas Gleixner <tglx@kernel.org>
Cc: linux-kernel@vger.kernel.org, Radu Rendec <radu@rendec.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2026 at 12:41=E2=80=AFPM Thomas Gleixner <tglx@kernel.org> w=
rote:
>
> On Fri, Nov 06 2026 at 14:12, Rosen Penev wrote:
> >
> > -static unsigned irq_wb_chan[8] =3D {
> > -     -1, -1, -1, -1, -1, -1, -1, -1,
> > -};
> > +static u32 irq_wb_chans[8];
> >
> >  asmlinkage void plat_irq_dispatch(void)
> >  {
> > -     unsigned long pending;
> > -     int irq;
> > +     unsigned long pending, chans;
> > +     int irq, chan;
> >
> >       pending =3D read_c0_status() & read_c0_cause() & ST0_IM;
> >
> > @@ -46,8 +47,11 @@ asmlinkage void plat_irq_dispatch(void)
> >       pending >>=3D CAUSEB_IP;
> >       while (pending) {
> >               irq =3D fls(pending) - 1;
> > -             if (irq < ARRAY_SIZE(irq_wb_chan) && irq_wb_chan[irq] !=
=3D -1)
> > -                     ath79_ddr_wb_flush(irq_wb_chan[irq]);
> > +             if (irq < ARRAY_SIZE(irq_wb_chans)) {
> > +                     chans =3D irq_wb_chans[irq];
> > +                     for_each_set_bit(chan, &chans, 32)
> > +                             ath79_ddr_wb_flush(chan);
>
> So the CPU provides 8 interrupts and 32 sources, where each source has
> its own specific flush register. There is some distribution mechanism
> (firmware configured or fixed in hardware) which maps a interrupt source
> to a CPU interrupt. When two sources are mapped to the same CPU
> interrupt then they share the interrupt line, i.e. the handlers are
> requested with IRQF_SHARED, _and_ both flush registers have to be
> written to so that the interrupt handler can observe the data and figure
> out whether it should handle it or not. Correct?
Almost. The 32 is only the width of the mask. The flush registers
belong to the DMA masters, not to interrupt sources: each master (GE0,
GE1, USB, PCIe, WMAC) writes to DDR through its own write buffer in the
DDR controller, and each buffer has its own flush register. AR934x has
five of them.

The wiring of the devices to IP2-IP6 is fixed in hardware; the DT only
describes it. IP0/IP1 are the software interrupts and IP7 is the timer.

The flush is done in plat_irq_dispatch() before do_IRQ(), not by the
handlers. So for the shared IP2 on AR934x, both the WMAC and the PCIe
buffers are flushed, then ath9k and the PCIe controller driver (both
IRQF_SHARED) each check their own status and return IRQ_NONE if it was
not theirs. Otherwise, yes, that's it.

>
> I kinda decoded this from your change log and tried to map it to the
> code. It looks correct, but for heavens sake this needs a bit fat
> comment explaining the magic behind all of this. Even for your own sake
> as you will have forgotten the gory details three month down the road.
Will add.
>
> Btw, as this is the interrupt hotpath, this for_each_set_bit() loop is
> pretty inefficient when there is more than one interrupt source
> associated with a CPU interrupt.
>
> What you want (as a patch on top) is:
>
> ath79_ddr_wb_flush_many(unsigned long sources)
> {
>         __ath79_ddr_wb_flush_many(sources);
>         // Document WHY this needs to be done twice
>         // The existing comment is useless...
>         __ath79_ddr_wb_flush_many(sources);
> }
>
> static __ath79_ddr_wb_flush_many(unsigned long sources)
> {
>         u32 __iomem *base =3D ath79_ddr_wb_flush_base;
>
>         for_each_set_bit(idx, &sources, 32)
>                 __raw_writel(0x1, base + idx)
>
>         for_each_set_bit(idx, &sources, 32) {
>                 while (__raw_readl(base + idx) & 0x1)
>                         ;
>         }
> }
>
> or something like that. For a single interrupt it's exactly the same
> outcome, but for multiple interrupts mapped to one CPU interrupt there
> is an obvious speedup potential, no?
This gets hairy now. arch/ code gets involved. I'll sent as a series.
>
> Thanks,
>
>         tglx
