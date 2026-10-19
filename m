Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792450999;
	b=Eun7a1CSdvAUjBDLomWB1UCrWsXFJWjxO0+R3Sh4kdsZersU2+G7aAP4e/sn8kkYWjmU
	 Ce0LHNPyT9+Jp5sB7GskErIQoaWJCJwbLOPwDDRkqpPFOnoDSC4iu2OeCgekDkfJ0Twxl
	 mYSAByFFAGpo6naxRq1tXNRNCrF4LGOxTv5YUFjry22/6pCwCv92eqK7rNana8ieqG8rH
	 IxQlFBASa33Zv04CHxgam0IfAZRzyxy1fwzsfmGWaETD4GxEPgtJLxP/4O/oBFf+HdafP
	 OqXvbntpZ/tvXfMIs+XCz2k5RBEEuNwYhIVlPmoFSo+LqWqQDr6mU6ScHpZyj7aN19A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792450999;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=XDtlaSExnYWqsMEa8VGfF5QYBt400ktE3qpWjPuxFnM=;
	b=uKPZcQKChKHf4KihGqkKq8dbz+Zri/R8/MS8Z46zr4j6049hVAKhlNcIXOBxypMY9wTS
	 fHVZgealDdk1tU0VspPZ3bL5mFHQ2TxjPFqLmiQxiwXCQmicksoamsdstLCZ0maFqTwJX
	 +ppBYG+8izO8nqfWYVFDFc5TpD3/hzj8G72+SdBHxW9658GkC6OinBLIyVjcrmIlDCN7i
	 fuRJk9HiBIUTx7svtTbwaHBVWfxgR8TfuPm5F+/0mBYDc8OJez8XXeVdIeHFPYoEIr/rg
	 jgAoqcoH2HUJCl6BG0Yl0efZQTU5iaryB8VIpOI3z8h3e/zetQdJr2bn4WOa8/+U5oQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XzzBROxD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58951606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 23:03:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58951606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XzzBROxD
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c315869241fso296453766b.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:03:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792450998; cv=none;
        d=google.com; s=arc-20260327;
        b=LCsMXSIAy36vRMHF0qEEWkb4UYRdKlFjX8LQwb4BNwv5cUXVR1eDqh+PsAgf/Jb2v8
         vuy0hauZ0HGx/uQl2oQ8Na5/QXbZKQ9sh438fqC1RfKzR6AYZ4zyGePxhqkb4oBY6O7/
         xau4zePtxW28gvCZtqywbDlGxiq+rwghrP1ZVrnTKVQGKMNFhv+YIXxJfgrQx4L56NFx
         d7agabjBr5HjkomVi22dCYnh9hKCun7nEoqDqumJkXs3TRl4bO0lOhYLWf1+s7h8a81E
         AurslmoIyzqMYlzefI8aLUq9TIaqA1ri8NHU4z6o+3YOKFLGOJGbne1TcBxoOgo+D9wp
         otBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XDtlaSExnYWqsMEa8VGfF5QYBt400ktE3qpWjPuxFnM=;
        fh=llU6eFrYsDWgrpYbi4uoR4oGz17RXPq31hI1iK0aKUA=;
        b=E1Obw3VlW48vtGhMlZh13rDoviQ9Ksko6t0ihna75O7slzPwHmygN7do4NE6zmTsc+
         eZHLZknyIpji0xsQ4p+caARAloyxFgUt1ebHVyW2dqXCz32AfKMRAX9CwcN5bNcd7OnJ
         D5tU6K07ujl3ys74yprCGY8v8qXV8r8wgiZDKLjq5fW7nKSNZBbI8pSIHRGg4pJSlxx2
         kWZiiTvxfh+1H9fe/5oeXWlM17WXD51sfpUOSKc3v2fXOsXTJELKVwR8bRBP4zzamwIF
         iKu56BY/su4eWnIIIVntcyGwa5F89L4Ua908pgWd3NpThK4MhYrlULFxEbMhPxhYpbKO
         cCEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792450998; x=1793055798; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XDtlaSExnYWqsMEa8VGfF5QYBt400ktE3qpWjPuxFnM=;
        b=XzzBROxD32IdPg7PQj7Aj7TxdQnBcaRSj9035mBKfquTQx0kSnzkZMS1VhWweBSMB0
         Sfh2J+MBxVbQK73iQuJ+L1ZmHVS8+3aMnan493N9WGr8rLM8keCy5k68bvczfivpbs2E
         d24bsKReA/QrVBny9x68brCZh2uT/pj05oiV1qHcg9yELvChGFq6wcndflpIJ/fO23WT
         E0uVQPyCryvPMrfKPYXecICvOblfMvqSZ13fElkWkrqo/+azdNVCNASt6xEYaglEVCqL
         MZMXj/0At/h/fbycqLgYfcyffnLxBgrjuJV8XpQGLweVC8IFVekAu+tDbBL0V1C36tvA
         x0Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792450998; x=1793055798;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XDtlaSExnYWqsMEa8VGfF5QYBt400ktE3qpWjPuxFnM=;
        b=bJOACXAQtGcjPzYDGOfoMLlereG6GIZLYbhBnOR7V/AggpU7+LNc2uPGvC8IdkA/K9
         dnxAGr4ZRobsclLPVKxgGq/sjibx4JfuoKs71OJU2ZzNRwqY9kyMmKvgiEJ86mo7wAmq
         jRL51cxPs5qtAibwKaXla9KX1+WyeYF8YGyI+llTg12iMCb+Wm//B/0a+PNbSLoXhCkD
         /zKhjgK17waq1QDmY26cB/r+NRDr36QJCVif5R0KjJT2BKx06w+6Fjii0/3keDCJVfqj
         NcuqYYsOclOuozTlnnrqT3Ybgb/fbEBFA7O3NnXsmkXwIFG/6a3YDkpy3wWqjwkwUcBf
         ++pQ==
X-Forwarded-Encrypted: i=1; AKwUvBwsXvkw/yrxFqGOCLjkNRuAFFYlekDp/FKBiDTvdlPZzrmkS2sMP+DAvyJybLAF7dbmREwOsMKJkrYNdu4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXCAVY/Spwz713WlvOEHMkgQgu2iW8l5b+E9W8ujAvpWeLrSRz
	YYUmwD+N7tq3g0BCMGnemkIeRP2II5+5XKa4A+gwEdWtMVZc7nZRsiG2xMLTa0OF+fdIaLTzHzG
	tP9/cm0esFDMp0aeKJJb60mla2QxCPw==
X-Gm-Gg: AYBFou0ZYFy0BPjlbr0das8Bl0zylpiFJnja87kmdGTYKE6TrbG/ytAyadZCsjukqRY
	5i1sgrLoGt2hTpn4qEHi8OnDN8G/q3GkpL7K8Q8HGDYxbbUdJ1igLCQ33wsIOjFgw4+43nvl9GJ
	eEhEa362f1nUgicmzP48sQkDHu35J69PM1ws04eRbpWx+2FCkhzjBljSlcQTp4ut3tLqxwpELaS
	5x8KMXyoB0PSuYYtNGwZ6OVQkPSwDm46vNK9k18ZsCiSmxB/Ty20QqFm6wk/7UV2mQ+hZrFHcto
	gxL0YxXm7Fr/X/jqbmcDVSrzeqDnlpVhtC1sF0E9eRTjgAhMymalM/bSisrwsITlBTtr6/8PSYJ
	PNKZ2VE+ejJq1MyEts5bzTsE0cTARBKOGuWoHMRfmNw0h6vJLqLO8/db/ei8qMZzLiefB
X-Received: by 2002:a17:907:2da9:b0:c45:b99:f282 with SMTP id
 a640c23a62f3a-c450b99f2famr243449866b.7.1792450997629; Mon, 19 Oct 2026
 16:03:17 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CGME20261018035132eucas1p2ccd8f0233fd196fd8801506c1c213b39@eucas1p2.samsung.com>
 <179229547105.3971562.9800339494753406560.s5p-cec@gmail.com> <6c07141b-e2d7-49b2-8493-394d727c3a15@samsung.com>
In-Reply-To: <6c07141b-e2d7-49b2-8493-394d727c3a15@samsung.com>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Mon, 19 Oct 2026 19:03:03 -0400
X-Gm-Features: AclHuK-b8j1-fi2uZSAQdYkd1yB7zxeS2EFL02Kkr6JbCillyjdAs-mauMrGRkc
Message-ID: <CAGEsz8G1k9O2CpA23vKmUFghfN-HTFhVUtx693A0whq-mSbxYA@mail.gmail.com>
Subject: Re: [PATCH] media: s5p_cec: release IRQ before deleting the adapter
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Hans Verkuil <hverkuil@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marek,

Agreed. I'll switch to request_threaded_irq() and free_irq() in v2.

Thanks for the review.

Best regards,
Myeonghun

2026=EB=85=84 10=EC=9B=94 19=EC=9D=BC (=EC=9B=94) =EC=98=A4=EC=A0=84 2:54, =
Marek Szyprowski <m.szyprowski@samsung.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:
>
> On 18.10.2026 05:51, Myeonghun Pak wrote:
> > The threaded IRQ handler reports transmit and receive events through
> > cec->adap. Adapter unregistration masks the hardware interrupts but doe=
s
> > not wait for this handler. With no open device-node references, it can
> > free the adapter while an already queued IRQ thread still uses it.
> > Devres also unmaps the registers before releasing the IRQ, since the
> > mapping was acquired after the IRQ.
> >
> > Free the managed IRQ before unregistering the adapter and disabling
> > runtime PM. Request it only after the register mapping and adapter have
> > been initialized, and free it on adapter registration failure before
> > deleting the adapter. This also makes IRQ release precede MMIO release
> > on probe unwind.
> >
> > This issue was identified as part of our ongoing research while
> > reviewing kernel code.
> >
> > Fixes: 1bcbf6f4b6b0 ("[media] cec: s5p-cec: Add s5p-cec driver")
> > Co-developed-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> >
> > ---
> > Compile-tested with Clang, W=3D1. No hardware runtime testing.
> >
> > Based on mainline 0fcb05b72344f40806cbe810de8872f1698bf053.
> >
> > diff --git a/drivers/media/cec/platform/s5p/s5p_cec.c b/drivers/media/c=
ec/platform/s5p/s5p_cec.c
> > index 4a92d32..e83705f 100644
> > --- a/drivers/media/cec/platform/s5p/s5p_cec.c
> > +++ b/drivers/media/cec/platform/s5p/s5p_cec.c
> > @@ -199,11 +199,6 @@ static int s5p_cec_probe(struct platform_device *p=
dev)
> >       if (cec->irq < 0)
> >               return cec->irq;
> >
> > -     ret =3D devm_request_threaded_irq(dev, cec->irq, s5p_cec_irq_hand=
ler,
> > -             s5p_cec_irq_handler_thread, 0, pdev->name, cec);
> > -     if (ret)
> > -             return ret;
> > -
> >       cec->clk =3D devm_clk_get(dev, "hdmicec");
> >       if (IS_ERR(cec->clk))
> >               return PTR_ERR(cec->clk);
> > @@ -231,16 +226,24 @@ static int s5p_cec_probe(struct platform_device *=
pdev)
> >               goto err_delete_adapter;
> >       }
> >
> > -     ret =3D cec_register_adapter(cec->adap, &pdev->dev);
> > +     ret =3D devm_request_threaded_irq(dev, cec->irq, s5p_cec_irq_hand=
ler,
> > +                                     s5p_cec_irq_handler_thread, 0, pd=
ev->name, cec);
> >       if (ret)
> >               goto err_notifier;
> >
> > +     ret =3D cec_register_adapter(cec->adap, &pdev->dev);
> > +     if (ret)
> > +             goto err_free_irq;
> > +
> >       platform_set_drvdata(pdev, cec);
> >       pm_runtime_enable(dev);
> >
> >       dev_dbg(dev, "successfully probed\n");
> >       return 0;
> >
> > +err_free_irq:
> > +     devm_free_irq(dev, cec->irq, cec);
> There is no point in using devm_* API if one needs to manually free the
> resource for whatever reason.
>
>
> > +
> >  err_notifier:
> >       cec_notifier_cec_adap_unregister(cec->notifier, cec->adap);
> >
> > @@ -253,6 +256,7 @@ static void s5p_cec_remove(struct platform_device *=
pdev)
> >  {
> >       struct s5p_cec_dev *cec =3D platform_get_drvdata(pdev);
> >
> > +     devm_free_irq(&pdev->dev, cec->irq, cec);
> >       cec_notifier_cec_adap_unregister(cec->notifier, cec->adap);
> >       cec_unregister_adapter(cec->adap);
> >       pm_runtime_disable(&pdev->dev);
> >
> Best regards
> --
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
>
