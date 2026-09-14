Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABC2422E2E
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 22:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789424368; cv=pass; b=EGhMqb/kjQh5WfsEjspYWleR05eigUko/nswaM18Y3nVD3wybS3BDwdMQeFhtswrOJoKV4UAIlqOL3icvk1g/EYTPV2JlD6KdtFFO9aT6488eV02tMBVIv1ouccAcN7WFg4/xlCY0IKYjtQOxVF+wXmzRfgzUSAkm6WgsYrKZr4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789424368; c=relaxed/simple;
	bh=wZ4qmPT0QMruFr9VXDHGmFjNNOoufqS/JOgpwyJQpCg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bWMA9nRR1l9syZgUbdMIGJXnyN2YToiOtQm0NUJd+GI4erIhXN1zWEeJjbcMmgpRLJOe9aRc1n1WlvyIPznSBMfzO8hEP0WnFyTXSG6mEzcD0+QDx/mcbiHVEBG9BFJTv2Vq4W9lAbfquWAtMhiJlPVFFGfEwL0PTrC5UshmoBs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mbsjgelm; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mbsjgelm"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a9cb66f7b4so4109464a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:19:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789424365; cv=none;
        d=google.com; s=arc-20260327;
        b=r29FQUvz9EuqEakpwNqtUulwrrd9vsROytP6hjoWifRQBMf2APzVgMjWXv7M7uQsHa
         vcGf6QzCoCQbcmVkv0KTMs2ns8FYKfYwYlEQUwwMfJaG0h+nZgm61xJyeMxU1Ureg/rG
         ZFyPiU3b3iZsSZs3Cq1MgWL8A2k+zajBsG3DBrHFV486Gpr+df8nN1aJ3CNTsnOrzxoz
         bR4xmH56WaQikHUMkpF4BfL6zkBBj8ZFnN1tgS8v/VW91WyHRXj1Ft7iqFJ3DWtULfXa
         DBNoSZJ2w8m7xD7Xy5U28WtSj/ggzO4uMEBq4VSojoUhNSUyl4aju98D/bFxFfRq+Gtf
         1YQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eieWMJNDganQMnVOMWmefej0YEBfyVXPwdqVtASgytA=;
        fh=barHz75xLB989ier9ffuFA+nYdVsIu5h7QYFcsOLyIg=;
        b=lCF4Tkp0aNE9p+0/5xp/TTP57sz2IvE9U4y1CyzucDt7GJVo3nJQT+HfqFgp30zyuC
         m9NWoIhMRDRVbN7kNV+mLG4xCTqtRVdqvj8xCX1D2isnBonpf4J337QSO4h7CCdzAh99
         tbHR8wR6sNA7UHT0egO8Um3tPnyRiuVpdRcYXyzxkd1yFAqftDSPDQsJEEKinpCIkg7A
         JqUwgNy4MzWRbJP9J6Sb0s4eG0E/xjrpscvmwmY3+Friv5C2TSDsQQiZSANVTizyUHZc
         CdCd1eoxBe6fPbNOazDNKrOROYdaZdmT0jtzh8WpHZVGOBPxSUUDEGGB7oZCTGgJhUEW
         S+Jw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789424365; x=1790029165; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eieWMJNDganQMnVOMWmefej0YEBfyVXPwdqVtASgytA=;
        b=mbsjgelm4uuUExOHxryg7XhRRUBno0nDXHe1tsdFFVA7xDzlo39pDnUx6Pd6zZqRqM
         frxpUe47OgO/Erwrg+A7qbaltw3dYUn/bAtkU83+01YT+HjqP5HTYf/S3EsigCMQuzJh
         PB1bA3V/Qxzos4VOK6DSkKKuzHGjZ7DgNJ1i2BH4mYK7l5OWsgv8VaaJrRPkxvxq1PrJ
         mvsqpa3FdG2zAMiugrEN5Dh9X/6rZ82Lpa3kfj4exS34ZYr2rMYhcpV0pSv1s+JoEqg2
         rU9Pd4I9tl/zu3C0cQV103x73LcSu0VDcYNM71g9gahAqOMSAAh/7q9aKt7nRxPdbBda
         ciHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789424365; x=1790029165;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eieWMJNDganQMnVOMWmefej0YEBfyVXPwdqVtASgytA=;
        b=sx6Wb99/Mm9tL0rX5gyaA8K3WrwFiIvH0gjWX+J7Efi40wgaZ4+JzN68dibPYoJiSp
         WL8izFDuLTZnyQlO1RfNqskjQBV4CUCvDRbcyb7x5/kgVkrci81X96eKlkZNoDBg7XDS
         jX06UILvpct7JSGfvDXsH2ddMm3jraM2apLCgcTG5VuFoAcKRn3LYdDwNxLgzWH4WHkp
         eLEeRwu8L5MCVRX4TMTrrSK7h4qv8VQbTNIYBIdTaTR6G0UHCWOPx1t0Yiqi9h0AWemz
         mp+7VU5sIdfJgm3xIyPx2kRmXZl7c+1wPjdYY//hdPsAzWCapwZYGm5xQNofsT9ssOl3
         1rqw==
X-Forwarded-Encrypted: i=1; AKwUvBxBYrlEED9zZYs3Z5dQLyPuhBHBDxEy72Q9ApOxn6x0jNmZInMAC9kvQYNBPwX859ITTGs+8TeCbhceoAk=@vger.kernel.org
X-Gm-Message-State: AFuF++nfh0yLp0KkfW1uiYfHRUnMx446DkywkupADLrR/4Uk1Lbp8JqR
	fzhlI1VDWBQGfrEN8qZxyFsrAwEy2b8MSp8x/vNAPrL7vR+scZ9s3CHkfmJUTFce0n5bgLxEOk0
	AYcQx/en4qERtVBRXcNkKIpIqhNeMNQ==
X-Gm-Gg: AYBFou3cb8ada+QEUyblIvoGgi54FB+qv841Scl4Lquqn2KkU+6LB3wNmssl3rQagMd
	gjIN6vQwJ9e8yPtM5YLzkp6jVSY3ZbcPRT7QNuCiT2u+SMZ3zKcl7dE9PERIfaJJ7Tiz44WpvIG
	5MlqsFNSogRNq+9g+VcWDVGkiaEgtBqLJJaELniPRM95Y5WXIwUwmcMJjCYctJcmJwTHmQaVP62
	mXElPvLwQTAykaCr/gq2rAwA4iKrnVRQnVPbncsYWnvcYLxBuRYBIRS9cyhdDLz64LbAGdnH2A2
	N/vJ4xbnIp5qRoPWD1fl76+wXGOp2BFM64J52tiKpF/dKDgnpiQB/mjb9VgYMellKHbXQMh4jHb
	KsQYnCiaj0hCElFV4+ldtgze0Ax5XrxhycOlZUK5pgxVt3WSdcEcnFblQgSwNb/57W8ke
X-Received: by 2002:a05:6402:414e:b0:6a9:941e:ec76 with SMTP id
 4fb4d7f45d1cf-6a9f6219af1mr3022439a12.2.1789424364586; Mon, 14 Sep 2026
 15:19:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913012148.9800-1-mhun512@gmail.com> <2b1101ed-ee5c-4a44-bdaf-a789964dfd0b@lunn.ch>
In-Reply-To: <2b1101ed-ee5c-4a44-bdaf-a789964dfd0b@lunn.ch>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Mon, 14 Sep 2026 18:19:12 -0400
X-Gm-Features: AcwNN1W__BdC7hnTIVKAFxapwBUaL0k1oK8CvdPcqRs25p2wVyVe5d8GRJnHUOM
Message-ID: <CAGEsz8GUiXT18xzGGjzEvZEX+1axY7f3Fcj3mHk8UAJdEEzCJw@mail.gmail.com>
Subject: Re: [PATCH] tg3: clean up PHYLIB resources on probe failure
To: Andrew Lunn <andrew@lunn.ch>
Cc: Pavan Chebbi <pavan.chebbi@broadcom.com>, Michael Chan <mchan@broadcom.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

I'll remove the redundant USE_PHYLIB check in v2, as both cleanup
helpers already check their initialization flags.

Thanks,
Myeonghun

2026=EB=85=84 9=EC=9B=94 14=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 4:10, A=
ndrew Lunn <andrew@lunn.ch>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Sat, Sep 12, 2026 at 09:21:48PM -0400, Myeonghun Pak wrote:
> > tg3_get_invariants() can register an MDIO bus and connect a PHY for
> > USE_PHYLIB devices. If tg3_init_one() later fails, its common error pat=
h
> > releases the mappings and netdev without undoing those PHYLIB resources=
.
> >
> > Disconnect the PHY and unregister the MDIO bus before the remaining
> > teardown. The existing IS_CONNECTED and MDIOBUS_INITED flags make both
> > helpers safe when initialization only completed partially.
> >
> > This issue was identified during our ongoing static-analysis research w=
hile
> > reviewing kernel code.
> >
> > Fixes: 158d7abdae85 ("tg3: Add mdio bus registration")
> > Assisted-by: OpenAI:GPT-5.6
> > Co-developed-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> > ---
> >  drivers/net/ethernet/broadcom/tg3.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/net/ethernet/broadcom/tg3.c b/drivers/net/ethernet=
/broadcom/tg3.c
> > index 73a4b569b..4662e0e92 100644
> > --- a/drivers/net/ethernet/broadcom/tg3.c
> > +++ b/drivers/net/ethernet/broadcom/tg3.c
> > @@ -18047,6 +18047,11 @@ static int tg3_init_one(struct pci_dev *pdev,
> >       return 0;
> >
> >  err_out_apeunmap:
> > +     if (tg3_flag(tp, USE_PHYLIB)) {
> > +             tg3_phy_fini(tp);
> > +             tg3_mdio_fini(tp);
> > +     }
>
> Looking at tg3_get_invariants(), tg3_mdio_init() is not conditional on
> USE_PHYLIB.
>
>     Andrew
>
> ---
> pw-bot: cr
