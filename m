Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2196936998A
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 19:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790970376; cv=pass; b=KlaQu+WLmaMIqNLXE1mIz1TAEzcXaocVnaqZdnfY4WRvZnVhh36A9IBGTPuDCTEVc5i8jFh6FMUVkfCPZPTgnppcpy+izG8wwnBj4VsLKiN4T8M1h0IMseBH1/GbuedYpSjg9FOe8rbpPFL7SZs1bIGEkZM11LhEKOY/qt8lnxU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790970376; c=relaxed/simple;
	bh=eV4eVULHeRB9/WvE6vWxRi3GO+s9jvutjnBVR7s/Nlk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AQW//hAtf0a5rQrS4J/tKb78q88zW2ksth32+1i9ZPGbcufu4HylQKUzib1gcyO/63gWE4pS2Z5vCqjfJTNrBQrdsGejC01yNeLpPcpa+ialM9IKUJiy1Jnhv0RmIlQHGW5OlwldO3OyznmXnO84AIDwq0J8aLaxo31GSVwKLZw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hpdwoyQK; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hpdwoyQK"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6ae14eecc64so644620a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 12:46:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790970372; cv=none;
        d=google.com; s=arc-20260327;
        b=c1xNx1tIXUVrO6GuHfCn42gzW/pQ8N29jVmzj/U8e6aAC1guopFgOYwwRu739vtGoT
         ppjWnrfolobTPzJGmuScdqQe/uUi/4qwbpueP3ZcUn2svJZDV2h5gKOE0yW1GImejrO9
         hcuL96+/4urI9h+del4QuxAZHXTrOmF73YGnIQleUeLYXkyX1A3LGiMQrlMpcBz/vOxZ
         qYyM581hq84qy6hxRSld6MPTWQSdVy2aFaFmNf2a3DeHcIMyAvFm57w3wUTgL9nSuHh/
         A2nCVjgi59/2xhfUu5KS5ra4vT31h2Q0UfAvT9Jdr4crRrXySDiquPCzIbHc+zUYmE6W
         0lYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j+6anAjBWwwyq2myOIAQCnGt8ykxWfOmfyjZNrQsOg8=;
        fh=RAkSsWPTAcD1uF+j10AgSia7dmurNIn95shK9ot9UPM=;
        b=jfeD1iZcELqsB4NJXfjDK39a+OjDSrEvrdu8XGmcVH8DIxjZwADWZSuCXZUlR9IW3h
         SGP2X2z3tX+obyiHv5xW0AL6sxnXe3demBBwR+JQe/azjUw/HLqYsO4/3hBAIE5ASIqj
         UujLv8lcvRVvhl5werxcgV56yDd/BQ7TSny7jbImTUc7d9M4yhWU1b76l0fT/oio19K5
         /7BDRoWb16S8CiXGW2N1iXsyG/PsWVikJkPJpgKsZkiXgOucVitJXb0Y8FzeIbEKJ0/y
         INPZSD6ifjmr4LqGkrSYfntjo/XLqsCau5XPYJSjZcYkUdcfPtbm5dR66UlmJzZ+KDTA
         dIsQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790970372; x=1791575172; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j+6anAjBWwwyq2myOIAQCnGt8ykxWfOmfyjZNrQsOg8=;
        b=hpdwoyQK3ZlfbVpYyYrDlfpkP0UnrmLf2qzB9OHHo5Y7iGGmfExdxV92u2L/+GiHmy
         g7OTAZ6wFDRSQqRJ/98ilOoprU7N+2pWNMBlVUiZZfYkLUvVF3uOR64ofc6efWiffN7e
         LuGiAdnpYwqSgtn+nf9P5XJGzbukXdsTrz+lf3K+L2cqdKFkH9erB3lAmDD9i344VhsB
         kUoH6bm3cN5ZMBHM6c9Ev3gfw+SPK93RPa2cY5eonh2XqnkGM8ThYoVGBgNb6ZVnbkgo
         gFDWF5NBGBg95V8kFeYoeM91a+FTAWbyBI4/svQe7nV17zmpneMcYh2fXoh+CSM+BB5C
         201w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790970372; x=1791575172;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j+6anAjBWwwyq2myOIAQCnGt8ykxWfOmfyjZNrQsOg8=;
        b=ZDek+7czAat0Zfp4ULWU9FhJiSlhOkWYKftnt7hT02xCxNKvwH1cSmIKo+A15ADUk6
         v1ecYFlO5irAMuT1XKIy4+yV7gDSH6HkHTtyhwQZUnk8H7cp0N9nkXT9oq0tJqZ2gUoW
         DA+Hux/3Gh7pLrldQ6JMZhWQrMn7BklEqmr9TPwwsE5KABEXM9JwmlDiDzy5cE8v/eyN
         Gwxzue4RZdPArugMOUGZ4Nb4TtmAa+ewgoo99+xp7WTBZB61uLfWeeg4GVMxLP+7l3yn
         y1Cit2u5RD/JcSYu3bsX6P2IM0U0Blr3rF36jCeNssHbyS2UMPD+uUBF/E8wa5UXLh0r
         Lkig==
X-Forwarded-Encrypted: i=1; AKwUvBwu0RdCfjCdEL1kMLP2ejoiBBbGe7bgkgHe0YfvSpdrYlcpu0DAsDD2Zf37PO3OWIpIsP10Qt8oRcemcLM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+14s5YXmWrFapGZhCnsTALdr075wjp1QVFvKU3bqpwqghkpAB
	Wsi1GV3b+PynZMTg0QstIKir8KYvvCyJ+xr/EFJ+wfW1TKm7sTXD93ubxjS/MLna//OlHgIUpjp
	8gB7a/bi0Oso5bBnNpcrc/xreLyzyAgdmCTU6Og==
X-Gm-Gg: AYBFou3R+93bscu0yENmmnmtf4gKczmjhcBGTIGe7m2C8TG3c0mvLm6UR9Rn8A39Z/8
	EM+pD2XtHmXHu1btxn9nwEqL3U4gVdqrx+wg6hXtgALu2oJj16GB3/RwCiMZt7JAW3TtayWFwiL
	uBr9XU1HmblybqcgWr9MprclUxU/y2H5HcJ4VnZX8PlUpMU0Tt0iwJ2DFw35d2gC0DJ5cs5YNoC
	NIpHLMuB1jnoarC8/vY5nDbmuZ3QAsocWXCW0WDFil5iatnRu+HXKJ7n68XE8zf8BcVZAsIBjET
	9Y7+0D031PjO5ZIiDtE1lsmSRbF1K+ASA+jLB9RuwJXqCHaidPMvNBvgKeW+H8LhBHslAcnyCz7
	aDxHS0WY4ZWJrG+cfkV2S6ItlSd8+ho9IgJIu7WskBaes/VPGTPyKvxPTEEJs35x4Gy/q
X-Received: by 2002:a05:6402:5389:b0:6ae:16f5:5bf0 with SMTP id
 4fb4d7f45d1cf-6afada04d25mr366851a12.29.1790970372050; Fri, 02 Oct 2026
 12:46:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917200136.75721-1-mhun512@gmail.com> <ajjy7y3ycnfqrofts457he5zlv34ncqg3n3g2qxgdgod5vbb2u@u56cc6pxihau>
In-Reply-To: <ajjy7y3ycnfqrofts457he5zlv34ncqg3n3g2qxgdgod5vbb2u@u56cc6pxihau>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Fri, 2 Oct 2026 15:46:00 -0400
X-Gm-Features: AclHuK-OVkulTTcELXTW6ppNQtuiiKOubv_hU1rUhsWYHuSBkRjxBxVA6Daq1vQ
Message-ID: <CAGEsz8FO4vN2yg=n7-Md9PBm5XVNjSiWAkH0fXNANZkYgUOkhw@mail.gmail.com>
Subject: Re: [PATCH] soc: fsl: dpio: Free the IRQ before releasing the I/O object
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Christophe Leroy <chleroy@kernel.org>, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ioana,

Thanks for the suggestion. I've moved devm_free_irq() into
unregister_dpio_irq_handlers() to keep registration and unregistration
in sync.

I'll resend both fixes as a two-patch v2 series, with the probe
error-path cleanup first. That removes the unnecessary unregister call
before the second patch adds the managed IRQ release.

Thanks,
Myeonghun


2026=EB=85=84 10=EC=9B=94 2=EC=9D=BC (=EA=B8=88) =EC=98=A4=EC=A0=84 6:44, I=
oana Ciornei <ioana.ciornei@nxp.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Thu, Sep 17, 2026 at 04:01:36PM -0400, Myeonghun Pak wrote:
> > The DPIO interrupt handler accesses priv->io, but dpaa2_dpio_remove()
> > releases that object before tearing down the interrupts. The IRQ was
> > requested with devm_request_irq(), and unregister_dpio_irq_handlers()
> > only clears its affinity hint. fsl_mc_free_irqs() returns IRQ resources
> > to the MC resource pool without freeing the handler. An interrupt can
> > therefore access the freed I/O object before devres releases the IRQ.
> >
> > Explicitly free the managed IRQ before returning its resource to the
> > pool, and perform IRQ teardown before releasing the I/O object. This
> > also waits for an in-flight handler while the object is still valid.
> >
> > This issue was identified during our ongoing static-analysis research
> > while reviewing kernel code.
> >
> > Fixes: 993fec7e11ca ("bus: fsl-mc: dpio: add the DPAA2 DPIO object driv=
er")
> > Assisted-by: LLM
> > Co-developed-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> > ---
> >  drivers/soc/fsl/dpio/dpio-driver.c |    6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/soc/fsl/dpio/dpio-driver.c b/drivers/soc/fsl/dpio/=
dpio-driver.c
> > index d5198ffc4455..fa82cdcc4922 100644
> > --- a/drivers/soc/fsl/dpio/dpio-driver.c
> > +++ b/drivers/soc/fsl/dpio/dpio-driver.c
> > @@ -263,6 +263,8 @@ static int dpaa2_dpio_probe(struct fsl_mc_device *d=
pio_dev)
> >  static void dpio_teardown_irqs(struct fsl_mc_device *dpio_dev)
> >  {
> >       unregister_dpio_irq_handlers(dpio_dev);
> > +     devm_free_irq(&dpio_dev->dev, dpio_dev->irqs[0]->virq,
> > +                   &dpio_dev->dev);
>
>
> I would suggest moving the devm_free_irq() call inside
> unregister_dpio_irq_handlers() so that we keep the register_ and
> unregister_ in sync.
>
> Thanks,
> Ioana
