Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792452797;
	b=3xsPggQnvfgCmlHjnqMHrz0oc58BdzhCF6iwIM8t1SGLo91F2V0lapgmHmzTXXel+y4D
	 kBe45R4GeR79cI1TWhs6WrDNvTa56KcvEGxTetQRQNJqAtM0qsXRLrnQ8JudQeJZqc3+x
	 azEx3vB7MDTuisWmx1eRZaQ/DRTO43t//4cP6vL/RE0zxilqP1Gn6J2SSeFX1NR9pKDyv
	 y0U3A2raXBGUkn29GVW8I227f2Rr41XuiiKvZ8Horfe4Wr5tInOzukGseQbagaMntC8Li
	 tag7G6oVUGMkHNeZQstxCq42nIt6KdHTHFTa9oPrIMNyOZzzbtJ21RkbLYAPLre3nRg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792452797;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=paK+OUo9iJsVsNln4mfvklUIDtP3YZCTZFLlIDNQgB4=;
	b=Pb2DR5zXe9HdOC+RdNd/+fcYbZaHRmLT77PancpwiZFTNOGI3zksaDQK2FR0dJnVYUkI
	 +I7reDBKK9nUQDar2Panv99RBWIMJyJg75TBt95IGUuyOyDUj4Euu499Rt7Mu+4q/UlSq
	 WWWGZjYzE2bHbS3YApHgLqF8/heQ2Xzk/x0LQymyE6S3YQm0xUJXr8rEW+xeJjq1k61J7
	 7M+d2n03DO9OKlZFk/NKBRvzpIktrME6DGSE/435rTRuVhlhjUz4Ana/stOeSoJQ2Q0AK
	 O9ns+SwHw4QgkPsFaw4rhJDOu5WH+w2JAn/FJ9B472fPdtd9t8pYP4m280PD+ZCA5kg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="Minqm/hR";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C857D606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 23:33:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C857D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Minqm/hR
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e9f6a16aedso7928425ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:33:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792452796; cv=none;
        d=google.com; s=arc-20260327;
        b=MWIxLjGue7lyhIqg8tmkyOB9MN6di7ZthSATmMSvAU8pYxEhYfD6Fjh/wUvUQwL+qr
         wxX3dnVM+5UCLVAenHfAkp3Y32zlJSmc5Fgj/nrq61xlleHKNgpYUQxdnxUo0/BtCvVw
         Y6OxwjuwqQKGIpfPbAFGGBwdpJFrDQ/p9MZevm07nc3m5wYTo9xWAJPY1QSOM3EGv2l4
         RLKbGQpK2MzAddETBIHANYk8Y8xEWW6wg1hacyY8Plj3NOXwdvnU4gQF09F5IteZC4fj
         JURVTU9ra3D8sYCYAdsC9ZTMtITOqfHXfuPHkrirzRsHjcQhuDKibqFxcf65HhHefauF
         PRaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=paK+OUo9iJsVsNln4mfvklUIDtP3YZCTZFLlIDNQgB4=;
        fh=lxhFY+YMCn4yzoipw4dDVNe/G268ILEahcSkMVsvnf0=;
        b=MqKBFfAgX1OxUSwNU4b5/ZFBVSHFcdXtdtxm91lfQfvptug70ya9VcIIZfntqxFzEj
         /QsrHJD3SQBITahYzjGWNMaWM/06bhRiY5ZYHuG5H6hLDgZZnHLmgdyyxHyB7jNIN/LZ
         7oo9jAh4cJQf6W+6ZxxI9FPI9m6vSkJaOK1X5GRl2GRiEVYECVwIbDxYp0/qUxKE+Rtv
         Qz1JqplZ/Qnl90sazG1DNea8IbTolB5SJ0A8B0SpQC35HcTKpuPMCgFvhPtwWBhh54FP
         32OJe8OjgVEYnmNG9xplxQqIOASO4UYF9biMDn4mHY6EUGqoCr+XAlh0IgOp6UiexXBU
         kGdw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792452796; x=1793057596; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=paK+OUo9iJsVsNln4mfvklUIDtP3YZCTZFLlIDNQgB4=;
        b=Minqm/hRw8YMsj0Lyx0nJK9pwlVoK/tK2J1zdqZO5g8gQMO8DtfLyVm5Zl/H2/OI4F
         W1nintkiBBPh0B37IburnYfXUfz7kClcFw2N6XtIL8KjtvtfMPwIIKrs8DOxp07KeBK7
         C9BaylMHJNiym3n0qQfacmyFKKIw9VGQsx5AYb8dJ3JGL2I0SeLdP6bOKI+9cDVf+UXf
         fWkRv0ok3TZqolijQLOTfjj9tgCy156FqwwmADEfU+/q5pIaHzze4mKls8F0SwPnwCP+
         VZyR92P/s+MUFi4i/HsJRrZmj52aZZV3rbXUTL2So8y/w2BTtntGIW6oITIwmNY8MfwA
         gTOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792452796; x=1793057596;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=paK+OUo9iJsVsNln4mfvklUIDtP3YZCTZFLlIDNQgB4=;
        b=J/j9o9AO6/W4inyQLpeTzr1QTrNObN3QMq+GhAgg7Nww/wHrL9ZAm26guILEIjOizP
         CplB42l8E2z6xcwIA0H9SKhBcsk/qbk7HCdqCYx61Jm2aHWQvN9MpXXtirdFWnfXNkQx
         nE/lco+S6L9KRSy1Oxha+JJsAge6pfki116PG5YMPcCf59Ybjy5Z1MW7iFPqxC3c5yrj
         +eS9on1kK3pTvIfuasnZEfh0Ae+MY1G03aCR6aeA48i319zMKae39aug+M1zoV8ynEtC
         PYaiqIXLseTcjF1GRkqpKZbuPH7y0of0tsjHnZnIQiETeqBSq/h+7mCcDfypwIT0KzBi
         V5og==
X-Forwarded-Encrypted: i=1; AKwUvByYHCFtjjwmO3/DUAr1Rtxe1ntR9Xh/JYXJDt2h0G1lBO9VkG08uSwdJiLw5B7yB+oSh7o34r3Rk+w1U0U=@vger.kernel.org
X-Gm-Message-State: AFq9FYKpTJHFli0Uz0UPUbjJIgjkTmZP9VJjIe1jnY/YYGJz8N23WMdy
	rA4RQIx2CzV1MCSJG447UkO0Ot97JFZ7Rmue2DRFwX2cwwU0POGCciDn7eU4tAb0JXFKinA6YMR
	iSO9ZXB1VdfMLvjuietirOP/82Gv3qw==
X-Gm-Gg: AYBFou0wTxPJqIVz8nd2ePBiwYM+mmbX6IccDqeDWm5U6OjEtf3k54Lt4dciOBX/HID
	J2ZHqlzbTiD9yka2Z8vwFxWf0tt6O2Kgnppd7JhRjPEnf2FWDpIv8kCIFIIJyletzINNfY7zvup
	bsp2taNwNLERsMCgU6lzp8YNznQlawb8ZjgMJhdyoMulXorjePtkhlhDP2zP9/0WwOgkWq6b0R9
	5nvB3kJIhtAAunG5KNBy9mbWq0ZAvA+EPVefKC0ZUxPpQZvhE6HCotqd/IppccsMYQDMJSVqhR+
	EDUanR5vAmMrcy3QEBsH5I7HHRzYUqNU2XhlsFtpzbzsm9qDmyGFaH02fCFUhxMdlck2ns7+gFr
	84OUceEfW3vNFxUsl8goRVxmyxFRGAzpG27I2usWRHNiCC+hZN7ZydEfxv6kK4hsOjBuC
X-Received: by 2002:a17:902:f546:b0:2e9:84f2:3738 with SMTP id
 d9443c01a7336-2e9a6834a2emr79859875ad.6.1792452795935; Mon, 19 Oct 2026
 16:33:15 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016030749.3689266-1-mhun512@gmail.com> <cb5f15d3-5a03-4f67-b7f4-36f5b74610fb@roeck-us.net>
In-Reply-To: <cb5f15d3-5a03-4f67-b7f4-36f5b74610fb@roeck-us.net>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Mon, 19 Oct 2026 19:33:01 -0400
X-Gm-Features: AclHuK_IbLOCcDvjz5ABrJnrXeVOgZB1X-J2gGnBU3GtVhfrrBWPb8Wo6dOytRU
Message-ID: <CAGEsz8ELcC8afKxnFa34uL8+TyzR6-nn3HtEx=Vx2sNtSHWdEA@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (sht15) Stop deferred work before releasing its resources
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

You're right. I've switched to request_irq()/free_irq() in v2, with
read_work disabled and drained before freeing the IRQ.

Thanks for the review.

Best regards,
Myeonghun Pak

2026=EB=85=84 10=EC=9B=94 18=EC=9D=BC (=EC=9D=BC) =EC=98=A4=EC=A0=84 11:57,=
 Guenter Roeck <linux@roeck-us.net>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Thu, Oct 15, 2026 at 11:07:49PM -0400, Myeonghun Pak wrote:
> > A measurement can return while read_work still accesses GPIOs or
> > re-enables the IRQ. Regulator notifications can likewise leave
> > update_supply_work using the regulator after it is released.
> >
> > On removal and the applicable probe error paths, disable and drain
> > read_work before freeing the IRQ. Unregister the regulator notifier
> > before canceling update_supply_work.
> >
> > This issue was identified as part of our ongoing research while
> > reviewing kernel code.
> >
> > Fixes: 251eb40f5ccd ("hwmon: sht15 humidity sensor driver")
> > Assisted-by: LLM
> > Co-developed-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> > ---
> > Compile-tested with GCC, W=3D1 (x86_64). No runtime testing.
> >
> >  drivers/hwmon/sht15.c | 16 +++++++++++++---
> >  1 file changed, 13 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/hwmon/sht15.c b/drivers/hwmon/sht15.c
> > index 7bb2105..6c5b2a1 100644
> > --- a/drivers/hwmon/sht15.c
> > +++ b/drivers/hwmon/sht15.c
> > @@ -31,6 +31,7 @@
> >  #include <linux/bitrev.h>
> >  #include <linux/gpio/consumer.h>
> >  #include <linux/of.h>
> > +#include <linux/workqueue.h>
> >
> >  /* Commands */
> >  #define SHT15_MEASURE_TEMP           0x03
> > @@ -986,15 +987,15 @@ static int sht15_probe(struct platform_device *pd=
ev)
> >       disable_irq_nosync(gpiod_to_irq(data->data));
> >       ret =3D sht15_connection_reset(data);
> >       if (ret)
> > -             goto err_release_reg;
> > +             goto err_release_irq;
> >       ret =3D sht15_soft_reset(data);
> >       if (ret)
> > -             goto err_release_reg;
> > +             goto err_release_irq;
> >
> >       ret =3D sysfs_create_group(&pdev->dev.kobj, &sht15_attr_group);
> >       if (ret) {
> >               dev_err(&pdev->dev, "sysfs create failed\n");
> > -             goto err_release_reg;
> > +             goto err_release_irq;
> >       }
> >
> >       data->hwmon_dev =3D hwmon_device_register(data->dev);
> > @@ -1007,9 +1008,13 @@ static int sht15_probe(struct platform_device *p=
dev)
> >
> >  err_release_sysfs_group:
> >       sysfs_remove_group(&pdev->dev.kobj, &sht15_attr_group);
> > +err_release_irq:
> > +     disable_work_sync(&data->read_work);
> > +     devm_free_irq(&pdev->dev, gpiod_to_irq(data->data), data);
>
> With this here and in the remove function, what is the point of using
> devm_request_irq() ?
>
> Guenter
>
> >  err_release_reg:
> >       if (!IS_ERR(data->reg)) {
> >               regulator_unregister_notifier(data->reg, &data->nb);
> > +             cancel_work_sync(&data->update_supply_work);
> >               regulator_disable(data->reg);
> >       }
> >       return ret;
> > @@ -1023,12 +1028,17 @@ static void sht15_remove(struct platform_device=
 *pdev)
> >       hwmon_device_unregister(data->hwmon_dev);
> >       sysfs_remove_group(&pdev->dev.kobj, &sht15_attr_group);
> >
> > +     /* The read work can re-enable the IRQ, so stop it before freeing=
 IRQ. */
> > +     disable_work_sync(&data->read_work);
> > +     devm_free_irq(&pdev->dev, gpiod_to_irq(data->data), data);
> > +
> >       ret =3D sht15_soft_reset(data);
> >       if (ret)
> >               dev_err(&pdev->dev, "Failed to reset device (%pe)\n", ERR=
_PTR(ret));
> >
> >       if (!IS_ERR(data->reg)) {
> >               regulator_unregister_notifier(data->reg, &data->nb);
> > +             cancel_work_sync(&data->update_supply_work);
> >               regulator_disable(data->reg);
> >       }
> >  }
