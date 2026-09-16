Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BB443CE71
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 19:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789588101; cv=pass; b=OvpMBsLCczqjYJ8NkmKEQ9OHydNI+5m3SQwS9uOblBc2opHu6m033oue1RVqR8g46H47sczFWA5UWdEaRpajl1q43oLx2mVEdWX9FhmMpiEtEeunpNeKFH7GrSPA1kxfyq+bv9txGPKbmym29U075se08E9EIdYKN7zI4HDAc4M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789588101; c=relaxed/simple;
	bh=wU+5155qdUPgw7RyzztSXCOgYlXDyq4rSWa8o9Db53U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u/Y0Ugl7kGFNf4dgJlgN0mCaBuMOMowKr6vlV6WfMU38zjgTFsIxUwJRE1GAgL7nbKG1JV5+2HbxrXh47Ej3+tU+aeOO+VP8u4deq9riSNJOi1A+XQh7KT6lnZzJ01nedl9jDADmVbmC7U7VXaqKMIiPDTOCp0upL3cUFYFMOoA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H3wCsWwr; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H3wCsWwr"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f7db0so19541166b.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:48:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789588086; cv=none;
        d=google.com; s=arc-20260327;
        b=lUVt7rGPiWvqXPJRj69B38gv4xJ3MbNaTiPTlkC/luu4yPkeXPw4pGqm+tnr304mTh
         m9ZECT1moyZMMRROoTfUXaYMkIRte00JmpNhnBZUmOceg3kdLMLH0U6p/17kR4qAicdS
         nVjF5T0vFpKC//8zJBp3NLHK4KZDChS6sPU8/HFedW0iYBw5kFBotS52uz4VMIKbuxgY
         rAKR3YUgLviuHsDwr22hVP0cMAQPArqlCqTIoAmhnkZo9DA+gxk5rgTnasYqcOtGa5LJ
         tHXLPbAoUmOod32OzDVLYV+DOBqHFgBLgWGbd4dnucBIxZ4gb1P1Kdowhh8x8k8a7Axc
         /94A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uUwNANsqCyAEnoTGeTMQrWBhCYCOT0fgfggYDa58xD4=;
        fh=8APPJYb60qH4pCtK5Jw9PjcJR3xASFAMuJWrdyDpoxY=;
        b=BpfanS1TJcGT47TW+aH9kcU0LY9pR2iNmDeWSCvyu3+aNAHOhim33hv/hfqP01G+9l
         nGI2eMWOHm59m2wC8dn6UkAYr+5OT1MFzlNByJYuT4Ufd7zl6QRXZx+fHMHsuXk1rpm9
         ee7HsXpsHu+uxJo+CP7AoQJUYj7qbU2YSKnDzliwrVNU9a1me2qK6GWnfnyMWd3TT91m
         3h+5uHiAXDZnKg8E0KjYx47NurvtzxjA1gc9KN2L2rKx1TG7DUsUOHV3V/5+6SwoS2QB
         lBghCw3OoDKltkSrFzyiAm3T+HhSn5/Y2iLbdv0o6K23nPodVspV//kzP4b/U3wETigg
         6HXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789588086; x=1790192886; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uUwNANsqCyAEnoTGeTMQrWBhCYCOT0fgfggYDa58xD4=;
        b=H3wCsWwr/wqoeV/byKUorfvf1//TjUw+lUK7PZ9FoQIuayEavGD8iAfUto4Hkte2DN
         0ib2TCGLehY9/G9o5/uX6fhPxzN2r0AKAfWGA4owTHgu/Mkig9DY8I7i5arikNQgnp9+
         ypFKml4y2hCIXDS1sXJCgn9kca7+HjVMlMWduaCdE63pFw9FFc3mO3j7D4D8NLj1Xr9o
         e/Z05HuQtzAaWV9++IziI688FmAOUIhiuNOWbDMg3m1pnDq9yv1wQlSAltuU2lNX9Xop
         K6nXE051Mvv3w6GaUSZnrLIjH4qVI9L6AblZV6NQJuvwQQn0xkn1Z3WRcwfe0Xon7Wkf
         PJqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789588086; x=1790192886;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uUwNANsqCyAEnoTGeTMQrWBhCYCOT0fgfggYDa58xD4=;
        b=BM8FjT+yGjFDngOp6geqO53BXY23hCexfhPpTX06pbPZyTxBhLj8/t03/kFE/3fixC
         Q7W9Sc7dzl7TI77WIprcYZe4qNVkAlFzRgnCQqmaQfJujHvFhZGr6kRn+MPyFTT5d8wY
         GhvlF4CwUtPvCMS5zhXBiA+WqpJj5GjZ/RAlf95AEOO/YrCA2Wp9WBEVNMugH2jnf4mU
         KGNFs46XjCdySD30OS8EMOSrGVKOE938yL/mpaI3XqdJN7WOuxyyrrdoHS9dzaz9lKWj
         utE+4gZ0l3eYBDflxVcEztW/2V+/nwhe4QpMJG7BaBoAHnnFKgw3b1MGPvuNxBf1+ox+
         rLTQ==
X-Forwarded-Encrypted: i=1; AKwUvByWBUsOZhzmsPgdL+Bqb+tmTffNMg2CQgGp9u/ANdlT4UKlr++Ym4Cr9rtr+RHRceQduz/gYTaPN0mR+18=@vger.kernel.org
X-Gm-Message-State: AFuF++lsKsp/c639iHIcqf1eNa2gssNGTH8+SE/hh9VyYjYH9w5+FWGS
	y+Xbsqe4u3eOSCfNyLIP5l5Bm3XnXa3tn+ohHNQc15xbdm5e8EXfKYDRkKqDP7y8MIPrrfIKfWB
	wphqSqkZ6O22LOAzRTxBHznkdoF6DNAE=
X-Gm-Gg: AYBFou0D0CHEbwOS058mQLjewddG8M2a0//s6S0NdukxdzsKvFGcBPbjIw5ADYRGESP
	RI4OzsyfNYhfpbfdFdwOHKaRHQDVAx1TzTnFlN5/I/T2RE50WJ2CTEDPnc4BDKKUF1m7t0MRPGt
	9Vl/yVlX0v0CmhlXOohFQEklWf16tfBdpmI3W1DuWkNWdIbDpvUhht9K2c4IXkRSGdwbN+JCaIQ
	Yyxln2GiR1wG4OTEwtqpcE9OLh+0K5RIrttF9p1fw5KluK+EktxtoNbaxHkR7E87zwvB0aAbwte
	D2Onq2w6XgtEcEpp6N3CQ1TyX05ZFN3k2lFmML0CB3O5UNvSwnrjkgTrr0x3YfViqoIl0dZgJXU
	LsmquJT8FtM0H7OAq+m0NQbEjEdUZV8h8k/I6rEg8Teyel4eJf5mgzc2Yz8kQSoTmTMatR52sXQ
	YD+BCV6STciim61L1aZO+F/bU5AS+nwFvYP+9T0N6zBAxd9iT3730cT8uOn+NzUw7eVQ==
X-Received: by 2002:a17:907:c705:b0:c29:6400:ef8e with SMTP id
 a640c23a62f3a-c29e5413d2fmr269131466b.42.1789588085865; Wed, 16 Sep 2026
 12:48:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915181709.11323-1-rosenp@gmail.com> <aqrxFTWEsJmFIrel@SMW015318>
In-Reply-To: <aqrxFTWEsJmFIrel@SMW015318>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 16 Sep 2026 12:47:52 -0700
X-Gm-Features: AcwNN1VWEP860etYY_BLQbwSQ7HYCEYQgEcVWOM6xtWBlz1ixaj6SyE77I5cWWg
Message-ID: <CAKxU2N_zEA1NxAp6H6J6COjTwUv8NK909m3OZ2kcyVCpCby18A@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: bestcomm: Enable compile testing
To: Frank Li <Frank.li@oss.nxp.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>, 
	"open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 12:42=E2=80=AFPM Frank Li <Frank.li@oss.nxp.com> wr=
ote:
>
> On Tue, Sep 15, 2026 at 11:17:09AM -0700, Rosen Penev wrote:
> > Allow the BestComm DMA engine to be selected for PowerPC
> > compile-test builds.
> >
> > The freescale ethernet and sound drivers now need a dependency on
> > PPC_MPC52xx as they use headers/functions from that platform.
> >
> > Assisted-by: LLM
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/dma/bestcomm/Kconfig           | 3 +--
> >  drivers/net/ethernet/freescale/Kconfig | 2 +-
> >  sound/soc/fsl/Kconfig                  | 2 +-
> >  3 files changed, 3 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/dma/bestcomm/Kconfig b/drivers/dma/bestcomm/Kconfi=
g
> > index 5dd437295964..153b5492c93c 100644
> > --- a/drivers/dma/bestcomm/Kconfig
> > +++ b/drivers/dma/bestcomm/Kconfig
> > @@ -5,7 +5,7 @@
> >
> >  config PPC_BESTCOMM
> >       tristate "Bestcomm DMA engine support"
> > -     depends on PPC_MPC52xx
> > +     depends on PPC_MPC52xx || (PPC && COMPILE_TEST)
> >       default n
> >       select PPC_LIB_RHEAP
> >       help
> > @@ -34,4 +34,3 @@ config PPC_BESTCOMM_GEN_BD
> >       depends on PPC_BESTCOMM
> >       help
> >         This option enables the support for the GenBD tasks.
> > -
> > diff --git a/drivers/net/ethernet/freescale/Kconfig b/drivers/net/ether=
net/freescale/Kconfig
> > index b34c0fcfddea..d81984fcec64 100644
> > --- a/drivers/net/ethernet/freescale/Kconfig
> > +++ b/drivers/net/ethernet/freescale/Kconfig
> > @@ -38,7 +38,7 @@ config FEC
> >
> >  config FEC_MPC52xx
> >       tristate "FEC MPC52xx driver"
> > -     depends on PPC_BESTCOMM
> > +     depends on PPC_BESTCOMM && PPC_MPC52xx
>
> use seperate patch for difference subsystem.
The issue is this patch exposes the issue. It's also extremely
difficult to get anything into net without the maintainers claiming
this is pointless churn.

>
> Frank
>
> >       select CRC32
> >       select PHYLIB
> >       select PPC_BESTCOMM_FEC
> > diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
> > index 04940879dfd8..101bc952aa14 100644
> > --- a/sound/soc/fsl/Kconfig
> > +++ b/sound/soc/fsl/Kconfig
> > @@ -234,7 +234,7 @@ config SND_SOC_MPC5200_I2S
> >
> >  config SND_SOC_MPC5200_AC97
> >       tristate "Freescale MPC5200 PSC in AC97 mode driver"
> > -     depends on PPC_BESTCOMM
> > +     depends on PPC_BESTCOMM && PPC_MPC52xx
> >       select SND_SOC_AC97_BUS
> >       select SND_MPC52xx_DMA
> >       select PPC_BESTCOMM_GEN_BD
> > --
> > 2.55.0
> >
