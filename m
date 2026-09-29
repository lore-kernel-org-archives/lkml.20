Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49363451D6
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790666303; cv=none; b=bcyPrcSEVGg03mlm/kkSAk6sbqbLyVRzIFJ2A5dODzUPHD2QJul1RzWCLKOpu36a4bo9Jk4ycrxqsjvAEgM+dZJf34UtKtzU0yAOEjLH+GCiKKSgidk1O6OA6hmTAA7jn+l+v8ioylJth2NZiQI/dXPQhnij4lo5wKvI2o7OE4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790666303; c=relaxed/simple;
	bh=QJnK+hiTvlC+rNNX506wVat7FuReEWPSNNtyFaDcZZ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PCFzJrBeqIrdko+vFZ2xsmwUEoNwBMrW4KfIgurcWqsZOCx2i3nVgpF1b0j1Ii1OVhBOcCGa268OC5oF2OeEz22NvSDwNTs05m3hnuvAijRvzGESFpwa3w3sIalzp4aZ1+1nLWumnpAqlGQjfm+3UkF5m5/y4IB1H9MDv0UmCwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e96a8ba8cso2515577241.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 00:18:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790666301; x=1791271101;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=urkJD58hMoHePd0JRK9qieDP4sEy8iL733/oAqpv72A=;
        b=a3IAcYaSsLvDaqdL73OKF1yPns+0m6lGdPEdYHvKNU029YDPAgYzxWAdXNJCJ+t0Lc
         pPIHdTi2/qeTYVEge1ETwZB/8kW3zrhr0vMN35HMZfjpnxKP/po/U6yUdNoYLL+3L3is
         HcRzViiQ4/H+T2Q9PO8Zvq0ehi76Vql2SbWmYoLLxwN00cDmeiv4PialvoecvDlFfoln
         GmWkg1xQSNib9pUS74HN2PGOpNTGko3L7RaQkcbsTtQrCcsjpQhAhZ4qpGQCUNkmkzdp
         z2GyK6MG2QBvNmeaI7uS8kLtZf0gKW+Ot7IxlFmH5oadE5LhTXghgHdJOhAMId0QOSDA
         9pzw==
X-Forwarded-Encrypted: i=1; AKwUvBwwhwc83pzPsiYbU4KmEbTxxtulCBLFihFuu2Zpa+gRgXkMfGVjuYZsaOLoFeiY7QOQtiZHC0aW2SQsfyM=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4YH51rR5s9a/fFhnim5bAQ8sBUr3p1S52iLb+m3kWaCXGfRlR
	ensXXsdC50gu4afURLsZ9Lxd+dG3gol+XcaGqWaP9D99KpB3VSuIennWxIzG2NgWgfI=
X-Gm-Gg: AYBFou1wvwpQiCyxr7ySzju+se5EWAc6fy+Qh1/S0pOPfnjkTXvioVX7vb5C9TpczCw
	upRjNFZjKNjkKDwM8q8JSkzKAQNPou5Fr4uamj6BU3A6zfB1myKmN5IXsop2BNeYy1KNGnIJLOC
	kfrHmbngFFAx9PpIcbJNU4Bal0dzvt9jWvEinzxNiWaUTE3R+SQR2b7tko9GSyleP9jxvJbv+Ba
	Jpfco520J1K5vHFQaEi2mUAGUzmYKsO7+fLXdQO7o8Dm8IlVo3+0iUd8c4KXKhR2hNhAaJDOMkF
	qNStNEJUEB2DV7KI/xobxCPBmktAKLGE0eP2o6rFNLkU+i07UrrJRk2IyRj977NRC5k+Za56ixZ
	ZzyHJPBLW4wM88jcPlI1ouE/qCRnQHjshIrh1qeOnrVd7Iz0XhmIkmDFOHxsKPRb6dcnTl4xWq2
	2Ne8Pmb0bM4Do8+s8mbskgsSqxdE8a2LAM9u0q/b7+csNwjXGytu6k0AHUz1fb434g5PwKE/SUV
	ITAnZp+Eb5W1mvSx3RZdTZ4K/9Uh4NLq3ZG
X-Received: by 2002:a05:6102:3907:b0:7ad:3ad3:997a with SMTP id ada2fe7eead31-7af1c6914d8mr6610586137.5.1790666300661;
        Tue, 29 Sep 2026 00:18:20 -0700 (PDT)
Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com. [74.125.227.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9889b08b6fdsm10294084241.4.2026.09.29.00.18.20
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 00:18:20 -0700 (PDT)
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-790b4aeb66bso1922862137.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 00:18:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxtRp3yUChFP+9XMXjuTOx0vO6Q9rpW7GYv2ocqW9/V8Q39TwG3Buzlf+rEiIvF0gc+z+p0YgLO7xq9MzQ=@vger.kernel.org
X-Received: by 2002:a05:6102:8096:b0:7a1:f7d2:e81a with SMTP id
 ada2fe7eead31-7af1e6ef2f8mr5696434137.19.1790666300095; Tue, 29 Sep 2026
 00:18:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921195943.107247-1-ovidiu.panait.rb@renesas.com>
 <CAMuHMdUGwQXvtLeQZ3KfO0giAhyEBgWSLqmxqx=7yqGqMr+hDw@mail.gmail.com> <OSCPR01MB1276943F1EAC14670506E6DF5D3822@OSCPR01MB12769.jpnprd01.prod.outlook.com>
In-Reply-To: <OSCPR01MB1276943F1EAC14670506E6DF5D3822@OSCPR01MB12769.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 29 Sep 2026 09:18:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWoQuPv=pVOpvY45_3p0hS2Xq34RYTkhEahA65RMb2nxw@mail.gmail.com>
X-Gm-Features: AclHuK9Q5JzW_HuTZFfkVo6R7FOP85PvaDuB-wCgnkQCGgceBABngBZwKKdNjU4
Message-ID: <CAMuHMdWoQuPv=pVOpvY45_3p0hS2Xq34RYTkhEahA65RMb2nxw@mail.gmail.com>
Subject: Re: [PATCH] spi: rspi: Fix DMA mode when the DMA controller is built
 as a module
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: "broonie@kernel.org" <broonie@kernel.org>, "geert+renesas@glider.be" <geert+renesas@glider.be>, 
	"linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Ovidiu,

On Wed, 23 Sept 2026 at 13:07, Ovidiu Panait
<ovidiu.panait.rb@renesas.com> wrote:
> > On Mon, 21 Sept 2026 at 22:00, Ovidiu Panait
> > <ovidiu.panait.rb@renesas.com> wrote:
> > > On the Renesas RZ/G2L platform, the RSPI driver falls back to PIO mode
> > > instead of using DMA when the DMA controller driver is built as a module
> > > (CONFIG_RZ_DMAC=m):
> > >
> > >     renesas_spi 1004b000.spi: dma_request_slave_channel_compat failed
> > >     renesas_spi 1004b000.spi: DMA not available, using PIO
> > >
> > > The driver requests DMA channels through
> > dma_request_slave_channel_compat()
> > > which returns either a valid pointer or NULL and cannot handle
> > > -EPROBE_DEFER. If the DMA controller has not probed yet, the driver
> > falls
> > > back to PIO directly.
> > >
> > > Fix this by replacing the dma_request_slave_channel_compat() call with a
> > > regular dma_request_chan() call. dma_request_slave_channel_compat() is
> > > always passed a NULL fn_param in all code paths, so it actually behaves
> > > like a plain dma_request_chan() call.
> > >
> > > Fixes: e825b8dd2b36 ("spi: rspi: Add DT support to DMA setup")
> > > Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> >
> > Thanks for your patch!
> >
> > > --- a/drivers/spi/spi-rspi.c
> > > +++ b/drivers/spi/spi-rspi.c
> > > @@ -1355,6 +1339,11 @@ static int rspi_probe(struct platform_device
> > *pdev)
> > >         }
> > >
> > >         ret = rspi_request_dma(&pdev->dev, ctlr, res);
> > > +       if (ret == -EPROBE_DEFER) {
> > > +               dev_err_probe(&pdev->dev, ret,
> > > +                             "failed to request DMA channels\n");
> > > +               goto error2;
> >
> > Doesn't this make the probe fail if the DMA driver is not available
> > at all?
>
> Yes, if the "dmas" property is present but the DMA driver is not available
> at all, the probe will keep deferring. This matches other drivers I checked
> (spi-rzv2h-rspi, spi-rockchip, spi-bcm2835, etc).

IMHO that is bad, as it means the driver won't work at all if the DMAC
driver is not available...

> > > +       }
> > >         if (ret < 0)
> > >                 dev_warn(&pdev->dev, "DMA not available, using PIO\n");
> >
> > The driver still falls back to PIO in case of a missing "dmas"
> > property, right?
> >
>
> Yes, without "dmas", the driver still falls back to PIO.

But that's hardware description, so the "dmas" property will be
present anyway, regardless of the availability of the DMAC driver.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
