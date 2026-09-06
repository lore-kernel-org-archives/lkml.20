Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CC5363C48
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 18:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788719710; cv=pass; b=kulI1j4EfM+T+EPvv6Fndt+3NbzlYCPxl0Q3Xn9SIeCvVGwYYE1NxeCDbt8lr5b4Crv1SWTp1Ru9lFZZcmXeJX42Q6z+u28S5BMdunQKxwWw2WfroMJyu7VpH36DiB9Wp2OvwEFkagj3BI606rOkARgVCgYki+ysmKKjVOL6Sh8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788719710; c=relaxed/simple;
	bh=gcjo7X7TgdtYVBm0U7AcwGrVdqNvvg6DEAZgwHyKEnI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ppW6RrAbh2ceoVl5EgfWyJxicg/CFJ4JCpJjzrvHt3M9oFj8RXQHJnAMED23Zuux2TyIgMAtLvkBZ2FZFCBckJ+lK/ZzmgWVyY0R6OJVneDNMtIVg0PztQ5OUvw8scbOt5SYsDX0AX2sm04m1IxNjzzSTcFHpI+uYFzSJOBprwI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qSnANY30; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qSnANY30"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a0c8283146so4209842a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 11:35:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788719707; cv=none;
        d=google.com; s=arc-20260327;
        b=Jl4PJW4eciRFJ4JyWaULSOdrMbTv2noKeWgmkOD77OHTHsr9dsRuka+rlnOqtDAE8z
         UuO5lEzsTlVdjb+DIkEaSZID4jdLZTvsp0ZCJaM2n9fMapTUif8GE85AECiOS8NQYzYw
         z8lJV2MLNXlquJeBcGUQ0b2ewtEf3GHPeZmMbW32ti2PTRI68yibOezvNgOv/eBG8VHo
         ZmPpFhAyqpeq4ykjpEDtCjaMJeFQf6ID4K7gJCmrXH6/BWUNsClPQuyA7Xye3DIoVs+k
         6ReSfovTGHwewqzviSoqOW/SxBg2jQKYImuC+eJTLFGkK9VTbe/ich5a0esXxfD4Wi9j
         GfTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QNOWeposu7NNUn8WrDV6ig4k8+bJ9kjipPF8HrDzWyY=;
        fh=PT69/HNXvStc4WjhLmwE7xITMca+U8+SGpjBEU8pX+o=;
        b=XlvhKPol/uEXzNqLfl62eNilCsLbFSaaNi8Vmk1E+md9cfNCdMVoD5FPlCdbjyzqOu
         euCnA8rgr1Dv1IbMajPgniqMXnie6M2k77hMcfEUmhX6yRpMyXagF5C+yLdbiNtYtFG0
         A02VLhkxkeCXoChJ+9U5zYbsChV996p7xIQFOyjdMwzxUemnM9y4/t6jQ92OHbvIMbeU
         jVzZYOF5yBgCc4BsHNQgfhAq8D/1mKRU6JRjF5lP1o7j0Hv8ydT/CoMu1H8spHyoU8pi
         Vyc+P8+I28MVDEjeYAC3eEhl14V+lazG85zzggXaV6Tr2XbesQL4pSsWAQ/YJfN7rEc8
         q6mw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788719707; x=1789324507; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QNOWeposu7NNUn8WrDV6ig4k8+bJ9kjipPF8HrDzWyY=;
        b=qSnANY30gIXZgGWY8xjtA5xIgzJQSaa2dfZsP+qJOPP/AR9u4u4Hg/HPZcOqgVuBZi
         07CHc/lAwBflEIqojLvtv4fTIwUb0nspLuv9RsVEyWz7riuqBbYFPGMlpdnbhvvfYmmV
         AmqwmMbUZFdmUkOmQKHcx4ahq0xuYar0YX8vA+FOdpnhdNQvKnMIhcR44s8ejZfIcK+Z
         25Q/U6WKculOTTR8keUZrEeJxc3BLyaw9F1I6bFYg+gg7sbzWtwryy6SdukxSaCnW9OL
         opAWpX1Z4OBtN7/hkRiwotTVHP3KGjnut7bN11Inncplzx6n2k1ZH8DBqp2RffGgRHKP
         fbSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788719707; x=1789324507;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QNOWeposu7NNUn8WrDV6ig4k8+bJ9kjipPF8HrDzWyY=;
        b=LcnMq8ftA3OP53eHedsIBVmIepS/7Aa7MPpJoOwdS7aAHt12svAQ8hDLDyMUPlMGnX
         E2WrI71EeRVmEoTwWHUuOONiDsKBFgDzFLhht4HsrFUcjPK6NU63Pk4x9qZZXl4XqxP0
         2Cy98xxhSKMkHGNUWJAEfZb+1JzHvNuCalRJEzak4iHE6T5hrGv/579ErBE8/rAtay7l
         OZ1eyQIXCVjGwHzp0mraJT/JeVGjGPI9bd6W1MwECLBxPlasafcHuGnPiiHyYmm2jMbR
         uyjyD0ltCzVO2nJtbs7gTr6HySpTpAKSu0RtC0bwgfqn5ebd2qtfBdmy8NEM+5/YoVj+
         z5tA==
X-Gm-Message-State: AFuF++m+gdu11DeZ0i5HA0S0P5l6QvVHV0JBh24SBp5VeWmr4wIWNsaU
	z4qlzxz0Efr471VQl/+pif7pzwV8joAlfN8dcSJSKl+Nh9vUmUX4uaaqUtDnqSSZGArdrULTXna
	1nfnj0gccgIVx8qfLxLOMP8QVJJWqtnREGXEf
X-Gm-Gg: AYBFou2VM9iH7zsdz+L/1+O1JEuLbGpvA2XTsiqfbxxWdZXEL74394T+DnvQct+dzlW
	M9Mm7YjOCIpmicFw+E/pYWP1z9Bs61WCwEmrFUuDc6GtAg0wiqATWCbKfuExDfwr26lDS1JKpMN
	LV8SAWjx0PcaorsTWA7BIEfW4lH81dD1expPe57lU6wGbcWH88gjpUlHrWmAcphCzXleuNxwNaS
	ofNDT1/m8I5p6ZD7rnXrno2wJXYuGphQd96+b/8WB+rOTVcytqOz2Dh6d6YntTlyOtp/miClUMS
	b/4y7M8dWWAIGWtwgX2f25YYEdfy2ndtDOMRBLU+gmGA2tP8tfKvM0SvEpAVv1Xu0hlcJZqRDoD
	1AIjJ6FFQCrsmnkLeihFnBFaR1FfwT4hDQGItIUI3/a4fd+wm48hYorBBOPTrlh2vp/5CJkM3zB
	nce6i6od+xVxuicufKt4STGa1Es1y9AiocC4/fZ+eYgkKDKyaLTCI8OHg=
X-Received: by 2002:a05:6402:3607:b0:6a7:ea53:f629 with SMTP id
 4fb4d7f45d1cf-6a7ea540cb1mr5093046a12.40.1788719707472; Sun, 06 Sep 2026
 11:35:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721202450.485171-1-rosenp@gmail.com> <20260721202450.485171-2-rosenp@gmail.com>
 <3bfabe23-b88d-4548-a7a4-06bf526c3a31@kernel.org>
In-Reply-To: <3bfabe23-b88d-4548-a7a4-06bf526c3a31@kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Sun, 6 Sep 2026 11:34:55 -0700
X-Gm-Features: AcwNN1XdxhSE4gT0Ub5DNJ0UgjC2JpWyjJ-bzCvAoSX4i2XP8yQNgtoAbnjvbjU
Message-ID: <CAKxU2N-xfKn_AChcAse_nxFBznxog+OLYW2htBwKHd_Mxk0BUA@mail.gmail.com>
Subject: Re: [PATCHv2 1/4] memory: fsl_ifc: Fix optional NAND IRQ handling and
 migrate to platform IRQ API
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 8:29=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 21/07/2026 22:24, Rosen Penev wrote:
> > Switch from irq_of_parse_and_map() to platform_get_irq() for the main
> > controller IRQ, and use platform_get_irq_optional() for the NAND IRQ
> > which is optional. Guard free_irq() calls on the NAND IRQ with a
> > nand_irq > 0 check to avoid passing invalid IRQ numbers on platforms
> > without a dedicated NAND interrupt line.
> >
> > Get IRQs first as they can return a probe defferal error. Helps avoid
> > doing actual work in such a case.
> >
> > Assisted-by: opencode:big-pickle
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/memory/fsl_ifc.c | 43 ++++++++++++++++++++--------------------
> >  1 file changed, 21 insertions(+), 22 deletions(-)
> >
> > diff --git a/drivers/memory/fsl_ifc.c b/drivers/memory/fsl_ifc.c
> > index e89e0c6cc4bc..dce94d8b05b9 100644
> > --- a/drivers/memory/fsl_ifc.c
> > +++ b/drivers/memory/fsl_ifc.c
> > @@ -89,12 +89,10 @@ static void fsl_ifc_ctrl_remove(struct platform_dev=
ice *dev)
> >       struct fsl_ifc_ctrl *ctrl =3D dev_get_drvdata(&dev->dev);
> >
> >       of_platform_depopulate(&dev->dev);
> > -     free_irq(ctrl->nand_irq, ctrl);
> > +     if (ctrl->nand_irq > 0)
>
> 0 is a valid IRQ for Linux, I think.
No. platform_get_irq has

WARN(ret =3D=3D 0, "0 is an invalid IRQ number\n")

and 0 is an error with irq_of_parse_and_map.
>
> > +             free_irq(ctrl->nand_irq, ctrl);
> >       free_irq(ctrl->irq, ctrl);
> >
> > -     irq_dispose_mapping(ctrl->nand_irq);
> > -     irq_dispose_mapping(ctrl->irq);
> > -
> >       iounmap(ctrl->gregs);
> >
> >       dev_set_drvdata(&dev->dev, NULL);
> > @@ -204,9 +202,21 @@ static int fsl_ifc_ctrl_probe(struct platform_devi=
ce *dev)
> >       int ret =3D 0;
> >       int version, banks;
> >       void __iomem *addr;
> > +     int nand_irq;
> > +     int irq;
>
> Why do you need the intermediate variables?
In order to call platform_get_irq before any allocation happens in probe.
>
> >
> >       dev_info(&dev->dev, "Freescale Integrated Flash Controller\n");
> >
> > +     /* get the Controller level irq */
> > +     irq =3D platform_get_irq(dev, 0);
> > +     if (irq < 0)
>
> ... as also shown here.
>
> > +             return irq;
> > +
> > +     /* get the nand machine irq */
> > +     nand_irq =3D platform_get_irq_optional(dev, 1);
> > +     if (nand_irq =3D=3D -EPROBE_DEFER)
> > +             return nand_irq;
> > +
> >       fsl_ifc_ctrl_dev =3D devm_kzalloc(&dev->dev, sizeof(*fsl_ifc_ctrl=
_dev),
> >                                       GFP_KERNEL);
> >       if (!fsl_ifc_ctrl_dev)
> > @@ -246,23 +256,13 @@ static int fsl_ifc_ctrl_probe(struct platform_dev=
ice *dev)
> >               addr +=3D PGOFFSET_4K;
> >       fsl_ifc_ctrl_dev->rregs =3D addr;
> >
> > -     /* get the Controller level irq */
> > -     fsl_ifc_ctrl_dev->irq =3D irq_of_parse_and_map(dev->dev.of_node, =
0);
> > -     if (fsl_ifc_ctrl_dev->irq =3D=3D 0) {
> > -             dev_err(&dev->dev, "failed to get irq resource for IFC\n"=
);
> > -             ret =3D -ENODEV;
> > -             goto err;
> > -     }
> > -
> > -     /* get the nand machine irq */
> > -     fsl_ifc_ctrl_dev->nand_irq =3D
> > -                     irq_of_parse_and_map(dev->dev.of_node, 1);
> > +     fsl_ifc_ctrl_dev->irq =3D irq;
> >
> >       fsl_ifc_ctrl_dev->dev =3D &dev->dev;
> >
> >       ret =3D fsl_ifc_ctrl_init(fsl_ifc_ctrl_dev);
> >       if (ret < 0)
> > -             goto err_unmap_nandirq;
> > +             goto err;
> >
> >       init_waitqueue_head(&fsl_ifc_ctrl_dev->nand_wait);
> >
> > @@ -271,10 +271,11 @@ static int fsl_ifc_ctrl_probe(struct platform_dev=
ice *dev)
> >       if (ret !=3D 0) {
> >               dev_err(&dev->dev, "failed to install irq (%d)\n",
> >                       fsl_ifc_ctrl_dev->irq);
> > -             goto err_unmap_nandirq;
> > +             goto err;
> >       }
> >
> > -     if (fsl_ifc_ctrl_dev->nand_irq) {
> > +     fsl_ifc_ctrl_dev->nand_irq =3D nand_irq;
> > +     if (fsl_ifc_ctrl_dev->nand_irq > 0) {
>
> ...but not here.
Will fix.
>
> >               ret =3D request_irq(fsl_ifc_ctrl_dev->nand_irq, fsl_ifc_n=
and_irq,
> >                               0, "fsl-ifc-nand", fsl_ifc_ctrl_dev);
> >               if (ret !=3D 0) {
> > @@ -292,12 +293,10 @@ static int fsl_ifc_ctrl_probe(struct platform_dev=
ice *dev)
> >       return 0;
> >
> >  err_free_nandirq:
> > -     free_irq(fsl_ifc_ctrl_dev->nand_irq, fsl_ifc_ctrl_dev);
> > +     if (fsl_ifc_ctrl_dev->nand_irq > 0)
> > +             free_irq(fsl_ifc_ctrl_dev->nand_irq, fsl_ifc_ctrl_dev);
> >  err_free_irq:
> >       free_irq(fsl_ifc_ctrl_dev->irq, fsl_ifc_ctrl_dev);
> > -err_unmap_nandirq:
> > -     irq_dispose_mapping(fsl_ifc_ctrl_dev->nand_irq);
> > -     irq_dispose_mapping(fsl_ifc_ctrl_dev->irq);
> >  err:
> >       iounmap(fsl_ifc_ctrl_dev->gregs);
> >       return ret;
>
>
> Best regards,
> Krzysztof
