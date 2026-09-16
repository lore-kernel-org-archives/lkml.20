Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF42A481A8C
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789593967; cv=pass; b=mTCVpfJrH6EwoUUXCIy5S+ZyRrDKm0XtK47GfVTIRhKlOy8VdWiNdKDyDZ8WanHNaPF19zI77QaeZCKZnIhL036S7G+hTxE4CIZohFJnEMprhem//lXUZEO5/0tFOb5/cs5BEQEaXgetfwdsZ/bFyln2sHH6+3dB5ATQhz+D1PY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789593967; c=relaxed/simple;
	bh=PaEyW8ziV39/D+o3TZiBGYjeiJYSGmcsepQiVBnz1sM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jLHZTMLv12HS9/yci+azrX0SW1iOzT4AfZSFNvY1DAAbjVyZ6zcRfi6fkj5JIuGR3cNaVnbQ01tT6uYOLyq0WYU1rvLhifoyKGgj3KiSMIu1GK1PO7RJtiGKIakyHqZ7Un6+CF8e+ZEGDEFbK2RXGShjHTOK0ZvYoHluUpapXQQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MfIu5n/t; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MfIu5n/t"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f55eff0so29928266b.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:25:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789593953; cv=none;
        d=google.com; s=arc-20260327;
        b=dpn7BmaTDSGMI6PkprKsbjGzYpGzW70er5VorfZkKSE4S7VISDZYVPxrAawW8aOXLd
         WYWruxcpbSdcjtAQG7NVohBwKl3XCE2Vpzu8MG0Y6KWyJ3k/QA1MisTMO6Ut5IV0Wmi+
         oKbe4Mdl+dafa4SHxWSv42+26J888JL2bOsumhwexZSKvESLkZU9RhnaWnVUVvXsyIcG
         HZ7Dz9JJAJ5OFir4FeWvrfee813KtyqMWDXn7+TCH7K1ZbyQ6wUdO+64gm6pV+uQWcFG
         baK/b8rDhjaBP6+eMAyd0D6bvnopi54PqzPcf4LqOBWCYDBssd2L61Ngjcp44FCBXmXx
         2iEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=24dq6MGP09BQVdqu/qtRfDCvRFA88J8G77yWogi+o5k=;
        fh=2Nk1cyykclwBdD+l8snopGGGbPiwBuh7cUgsRTdJBY4=;
        b=grF76MgdWQnSAHTZk+uVrDlmegWmrjnmHIYFr4emQiJRvqxvWgHLPujyuGFnqbIjfI
         2e1u829P8travsClkaY3vO/dW8uSuwVrykyCxjbHGxixSAy30hxNsYvmz54lSXJNaDca
         Dxo9FPab2rhTG/dCMlyl0TxfNNfCUyIXu0YuTt7vQKMSEiWsU3gNSSGbGkkYF9DZ4/I6
         ffm+fpX5G/XLFzKHuM/BsYG3WxA9FrcuUI2kwiHTzxmLFCcHhPBn3JuF9Dq8l/bfBMmf
         inevvnvNqc6piCSNvy14t3Jgh37F/n92LaRVSMyXaBN7LTGg5nR6i/PsKmiJBU+va9Sr
         xObQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789593953; x=1790198753; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=24dq6MGP09BQVdqu/qtRfDCvRFA88J8G77yWogi+o5k=;
        b=MfIu5n/t1RRV2o/akMJ+Y31OkeyhzD2pq7zmpeZYO4oUGALZZNAW6R7ZQrHOdY01oY
         aJCPZXbJd3tR0RcGsB4VR7z1EqiWPQcldm+1+WF3JPxZGZH8edKlprJ76XvmSAAOTqUp
         kbRmPNf80/Yrs8PE3nnlzjAQHj7a8IgBsHlnK0l6XljHuaNLSn+jGOMK9vXt/jisRZ1o
         OrO/1DWdFp5ykOXUlwTpXDkiOkthwoRpfliaERFEdiswXKomJuwUAdWvnSnp73u/3IrQ
         OHl5f1FrRzafawmfnwoqLbAh2NzN/bE+8PMZfYNlHv9uf8BLgPeaxO7nfbO8miWoWCaK
         vtiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789593953; x=1790198753;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=24dq6MGP09BQVdqu/qtRfDCvRFA88J8G77yWogi+o5k=;
        b=NCWkOOti8tXnINK1C3v7DfJanrEB4eIDMeCGzldLtV+U6JgDLvsDniHjyyCvBJ1rJk
         1X7kQbk3QEvGgm5cTTPKi15qVvdOQZ4TQ6M2S/5EMqi8mdLZV8FWnbnxKHcCD1tcMNC5
         r2BI/qIwVBQJD6frY8JUBEIvYxuLnmx1m+JdMRH+VXNW//+BVUgBio9oewLvQBuWQkYc
         +PWDgkj9ODY+eZtUo8pKdazGHuNKquPbt4o57Fol6u4T65FCVNTFg6SrscZJyO1qM4Cv
         0oSthXSeIiQ3vUQo91KU3lp75dA8dtlfGqkud7DeBSVIFq0Rv2sggxude+xGdHx1UyNd
         Ht5g==
X-Forwarded-Encrypted: i=1; AKwUvBxSX0xfhXKTLtiiLjsfSxtByhXgnsY2kpp3q2oR+z9hB0mwH1RQ8bzalUYILTqbJA5wd26EIvgUHvFs0yE=@vger.kernel.org
X-Gm-Message-State: AFuF++ltVtyTblcEoqzKE6V03wsDVeRh6+lBUr9aayTWKckdTeLz/twy
	hzzcSAY8kzn39kTjQzQxEXzsfuAWBSKghBRka7hSc321EpivFBqXtx/XynvPOZAzN0ULGmi+jVE
	kIVB3MIiMJyLMpkzhfMSstApPGRJ9Ey4=
X-Gm-Gg: AYBFou2ADv1LhDrJm4Q7KuI1SGb0FqfQQpnEn5DIaqZ2RoxdZpLYFwD4YTIYyqLvL/w
	/YJ5zDN9y7kliX6h9cpAQO87bhEqPGo4sGre53bWSVPd44WYmYqyIdv8S4Kkivsizz9gbUNkLap
	kup3rVNuxctUzNId7OYWRTOPOFCe1a/XwXiTNEn6ynDxNak5FMK8UeCN3ATeOYILukcF6TrCIFs
	S32eEVfAU1mXfVLzDe4cYn97grFfE8+ECyfTIBv4y72tj3we9+Hk0FcWoLqpkQirsNCvtQsn443
	hHniryJoCfkB4hizlJuQl6d5enBNCVXTgrz2JmWN/SlL3jZi67aGQfyUcrLpPt58ktKKmnmCFRN
	VqXhb0KBRdYoFpRo/wo90okGBmo5QNcLE6RmtdlFfSGmlp9ZLdhxb/p+YHOCJQYzw0TMZ5YlC4M
	QgNDt8qTu6woRyRFVzUdd0NGtQx59sfsK+1ZpoqatYKfkWY0fycSrMIIJchwxhEfH/4saJAC1Qi
	TvV
X-Received: by 2002:a17:907:9343:b0:c29:62d8:68af with SMTP id
 a640c23a62f3a-c29e5311f45mr285472266b.47.1789593952818; Wed, 16 Sep 2026
 14:25:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915181709.11323-1-rosenp@gmail.com> <aqrxFTWEsJmFIrel@SMW015318>
 <CAKxU2N_zEA1NxAp6H6J6COjTwUv8NK909m3OZ2kcyVCpCby18A@mail.gmail.com> <aqr7Lfji97j_0nVd@SMW015318>
In-Reply-To: <aqr7Lfji97j_0nVd@SMW015318>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 16 Sep 2026 14:25:41 -0700
X-Gm-Features: AcwNN1V3Sj2lR93W3zP_MWf1RpGY0ZFkZFuGnqEzbiPZuRWy3aeiqO_w5mHISZk
Message-ID: <CAKxU2N-bWXPHNgg2jLjZ8dUFQELr8RV3kWhKdSi8gKF3_9JRVQ@mail.gmail.com>
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

On Wed, Sep 16, 2026 at 1:25=E2=80=AFPM Frank Li <Frank.li@oss.nxp.com> wro=
te:
>
> On Wed, Sep 16, 2026 at 12:47:52PM -0700, Rosen Penev wrote:
> > On Wed, Sep 16, 2026 at 12:42=E2=80=AFPM Frank Li <Frank.li@oss.nxp.com=
> wrote:
> > >
> > > On Tue, Sep 15, 2026 at 11:17:09AM -0700, Rosen Penev wrote:
> > > > Allow the BestComm DMA engine to be selected for PowerPC
> > > > compile-test builds.
> > > >
> > > > The freescale ethernet and sound drivers now need a dependency on
> > > > PPC_MPC52xx as they use headers/functions from that platform.
> > > >
> > > > Assisted-by: LLM
> > > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > > > ---
> > > >  drivers/dma/bestcomm/Kconfig           | 3 +--
> > > >  drivers/net/ethernet/freescale/Kconfig | 2 +-
> > > >  sound/soc/fsl/Kconfig                  | 2 +-
> > > >  3 files changed, 3 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/drivers/dma/bestcomm/Kconfig b/drivers/dma/bestcomm/Kc=
onfig
> > > > index 5dd437295964..153b5492c93c 100644
> > > > --- a/drivers/dma/bestcomm/Kconfig
> > > > +++ b/drivers/dma/bestcomm/Kconfig
> > > > @@ -5,7 +5,7 @@
> > > >
> > > >  config PPC_BESTCOMM
> > > >       tristate "Bestcomm DMA engine support"
> > > > -     depends on PPC_MPC52xx
> > > > +     depends on PPC_MPC52xx || (PPC && COMPILE_TEST)
> > > >       default n
> > > >       select PPC_LIB_RHEAP
> > > >       help
> > > > @@ -34,4 +34,3 @@ config PPC_BESTCOMM_GEN_BD
> > > >       depends on PPC_BESTCOMM
> > > >       help
> > > >         This option enables the support for the GenBD tasks.
> > > > -
> > > > diff --git a/drivers/net/ethernet/freescale/Kconfig b/drivers/net/e=
thernet/freescale/Kconfig
> > > > index b34c0fcfddea..d81984fcec64 100644
> > > > --- a/drivers/net/ethernet/freescale/Kconfig
> > > > +++ b/drivers/net/ethernet/freescale/Kconfig
> > > > @@ -38,7 +38,7 @@ config FEC
> > > >
> > > >  config FEC_MPC52xx
> > > >       tristate "FEC MPC52xx driver"
> > > > -     depends on PPC_BESTCOMM
> > > > +     depends on PPC_BESTCOMM && PPC_MPC52xx
> > >
> > > use seperate patch for difference subsystem.
> > The issue is this patch exposes the issue. It's also extremely
> > difficult to get anything into net without the maintainers claiming
> > this is pointless churn.
>
> Maybe you try enable COMPILE_TEST for FEC_MPC52xx also
IIRC it compiles but does not link.
>
> Frank
>
> >
> > >
> > > Frank
> > >
> > > >       select CRC32
> > > >       select PHYLIB
> > > >       select PPC_BESTCOMM_FEC
> > > > diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
> > > > index 04940879dfd8..101bc952aa14 100644
> > > > --- a/sound/soc/fsl/Kconfig
> > > > +++ b/sound/soc/fsl/Kconfig
> > > > @@ -234,7 +234,7 @@ config SND_SOC_MPC5200_I2S
> > > >
> > > >  config SND_SOC_MPC5200_AC97
> > > >       tristate "Freescale MPC5200 PSC in AC97 mode driver"
> > > > -     depends on PPC_BESTCOMM
> > > > +     depends on PPC_BESTCOMM && PPC_MPC52xx
> > > >       select SND_SOC_AC97_BUS
> > > >       select SND_MPC52xx_DMA
> > > >       select PPC_BESTCOMM_GEN_BD
> > > > --
> > > > 2.55.0
> > > >
