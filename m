Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29DB55581E8
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 17:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792084048; cv=pass; b=LEGSQ9p7EVwbzSBovhSEilUjukFTB3JsqU7GHuyz/2j3q56fJkUmbwVW4r2rP0PJXM0eRAS0+nMx9lRLxmi0Bgd+oi+amGMzvrB7+MZfIa4p10zNIt75bEquoHAQQ0GmJUiX5bMtVyIf4YehIYL5lG+Y7l24vmbF6Use1k1NZTc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792084048; c=relaxed/simple;
	bh=TQWSF+hQXVkwcjIKu5CbKZ1m9kqfy6YQdFbRnYAAUMI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ljY3ID3/Dwr13SFE/8/ktMWyOrvancZYumQcIaf5VrYvplh/q12WETOI47iXiWhlpz/EbItKb5WxKsGvRtq48n86DBzRIfAy3e1LAP7qtr4efN1AAbWpBqnEfMMJH5v6sVq9rjWLNrxXo+Fi854zLGbnJRq7OYBdLTO/lAQftzY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m6kD8zXW; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m6kD8zXW"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-6798eb0d190so1757604d50.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:07:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792084034; cv=none;
        d=google.com; s=arc-20260327;
        b=mmBbvy5SGm4DDJzByOHmKXjF2pYPczXzVjsiuL668Zi9j5CrcF9cKIFMZhjgyNzqx9
         lsOn0WK09V9kwQmgIHItpT6sO2uj/lPS6+sH2kJ9nUHpiyRqOyUyOdRAa10VgbXaUTET
         268oQkWAeiRo4S2IzMNZjXpqKsA3HbXBvfdwFhe3WMPJ6+SZEXVE+amKt30CIr9HNBRE
         YpUxS4c/nWmBbJBgGD2IFtlg/6o6S0QaBe7YzxKDUqo6g1hmRpcVPu8ibT4/5ceJnm2l
         IoaP2wRfxVAXg4r+rp0Y6T4ZAv1/SrcPoM5SU+o+qkTDNcWh36BTqdCaRJo8nzy9vJav
         K6GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NVmHsDqBQJBCxGh36k+fMkdYB80rlDP45cvKKDDFmfE=;
        fh=9K3yuV9FypltMa8ozkYwj1uR65C1uqGb/MAPQSoYzEY=;
        b=QvlqxR50uYMeALNPqhE73WgSMN5vizj/OV1KnvVrM3MigZ3jUDoHH92giw0btCPPEu
         i/SPnTgFQd+NyA4qUrJfYhhPQbs7ikDYvTNycT5oRySQiuTIocqmAW6eYQQkf9KM9EDP
         eGYSSJTDTHVtlzE/9EL/yd+8exlRUslNPH87NftJ4xFe5YOeLx9QaTHAf8pqinZvtb/w
         AGUMLQ/6ulcaGEdxmvKAkr9vMAIUWbqY2b35qTJzD6jHJ1N2Ygo7ZZKxT7JcOcywbaTS
         vu1d68DRwC807FpRBC4KLFBZbBrqI3QgeyjgDjO1wFMCjkLY97BjhnIVgzEZCWk5BUxJ
         6UTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792084034; x=1792688834; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NVmHsDqBQJBCxGh36k+fMkdYB80rlDP45cvKKDDFmfE=;
        b=m6kD8zXWcnmAiMQzVyuLdidYavXtf+nQ7ABr3woBFglpqfezYAe8wvEANjiTg5RvWv
         ou5XcH4D+9KegDL6JVchuviQsJjDVplt1gMuB2Jo5ABdm57SXXfwq7IEx4dySTyuvTrp
         Kcuf0Rn0dbOzVLf9byOY0ksZjidHLtNZKtVqnn9kHHZtYgzJJZDMz8B6OumJYNWngfr/
         1L1tNCawWilOWbVq1B8cOqWtBNdG/yRYT/Jav85vZAySj9zP3D7TxP7sX8fjeKW/SA2m
         /BojeSywaiHwEJEmP+lx4E52BeSt+DqmZ4yblcJYt4f28++i8Cfx2t/RRDxzJp439Hpx
         y6fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792084034; x=1792688834;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NVmHsDqBQJBCxGh36k+fMkdYB80rlDP45cvKKDDFmfE=;
        b=oXBZsoP9QOP8U0S7WpqdWaaWhpHVhVeu1EsgEYjIYu0rjoID7We0cAOwTGAg/urIX2
         xugGnwlLeJqGN6Gg+ru/fL0yh3f/D4DF70k6HF2M4YKEHykjm3EJjzEoRU5PsskAEM6+
         h4uIn0ZSDw2FDd+xah3PFPHEfuwK4KA2KylH4gqPnnyAQVpAPHihhYNnMp9J94CGnfP3
         YYTBGrX1R3kRaJSTQO4Zrv7EosgbxMojdDP88TthWiopXpI7NufvFvmZCInnvgxxGfgS
         lRyS8p3yZSXOTZJiRpDwAXOQuWeixydJAhZafDIrl0CAopGfeo/9TYIND3JGRLwKCpXS
         Pc4g==
X-Forwarded-Encrypted: i=1; AKwUvBy6vPkaorjw8pCRCqYprM4EIjU+z23WS2Ay2oGsN6qq+fnqzlMJ4mVAuEu1ao6do55GWVspfCmRIwDQauU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKTGcFiVQaA9AK6eZM/VFqgft+R75ZELu03O9pZysJFjavnViHa
	7OKKFMdYv00nGlkWXebuqsVppcgEBjGmqObL/n5v0La0GojXz2aLHfqqlsZHt3bv6yX1rQ9SLM/
	eoquqwHEt8I7kGVoAa0ujGukG96PjwRo=
X-Gm-Gg: AYBFou0LDygOzZ1TXIAOPfzMcJ0Kl5VFht9cSAehQu6bJEhdG4J5RjcPV5g5inUnbKt
	b+2jwynTMWSGZ3jE/2YKTn4OhKT0iVDULsZ0mOMUXr8KhyzKFBiwWX3FnzUA6okODqRNc4QR8FE
	4u+L7t5qWEVI01l0FGwwbed+QAzatTgzsBZRSL/U9MmDCCptM5447njYFiTvk9k9V9jlJq5oaHn
	3z1MIBKp9+QDj/GvUgnuLqR3TcrAHfLbksRjG1dwWLs8lRszB2wvCyqq0erypVRMAn50AaJqL31
	e0IOhh+2HZxLo4m0eS+bdmHOfvWqvqaQTCZU/mgYWYtMZMjPbnrJoSiy
X-Received: by 2002:a05:690e:bc5:b0:679:8da6:28cf with SMTP id
 956f58d0204a3-6798da62973mr1956198d50.98.1792084033716; Thu, 15 Oct 2026
 10:07:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008-04-k3-pm-support-v2-0-6f778a53dd2d@kernel.org>
 <20261008-04-k3-pm-support-v2-1-6f778a53dd2d@kernel.org> <20261008-df80c21d73b287d09b6baa78@squawk>
 <cbba422d4ba9bd4a036536a50fadc2760efa1ae2.camel@icenowy.me>
In-Reply-To: <cbba422d4ba9bd4a036536a50fadc2760efa1ae2.camel@icenowy.me>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Thu, 15 Oct 2026 19:06:00 +0200
X-Gm-Features: AclHuK8t02_cYn6UunMFOXXUfkheTlCkH2rjdH9KDS5vlihve2Jh2xK0A1qMWCU
Message-ID: <CABdCQ=MQ5soNSRQ97aOytYCjtKpqZJ0frP3mqh+mL2Dsw+A7Gg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: power: spacemit: Add power domain
 controller IDs
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Conor Dooley <conor@kernel.org>, Yixun Lan <dlan@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 08, 2026 at 03:44:29AM +0000, Yixun Lan wrote:
> Add initial power domain driver support for SpacemiT K1/K3 SoC, The Power
> Domain Controller is SoC internal module which is part of APMU (Advanced
> Power Management Unit), it is responsible for managing power across multi
> power domains, which includes power on/off, isolation, power-on sequence.

Tested on an OrangePi RV2 as part of basic enablement for the PowerVR
GPU. An RFC series for basic GPU support will build on this.

Tested-by: Iker Pedrosa <ikerpedrosam@gmail.com>
Reviewed-by: Iker Pedrosa <ikerpedrosam@gmail.com>

El jue, 8 oct 2026 a las 12:31, Icenowy Zheng (<uwu@icenowy.me>) escribi=C3=
=B3:
>
> =E5=9C=A8 2026-10-08=E5=9B=9B=E7=9A=84 08:27 +0100=EF=BC=8CConor Dooley=
=E5=86=99=E9=81=93=EF=BC=9A
> > On Thu, Oct 08, 2026 at 03:44:29AM +0000, Yixun Lan wrote:
> > > Add initial power domain driver support for SpacemiT K1/K3 SoC, The
> > > Power
> > > Domain Controller is SoC internal module which is part of APMU
> > > (Advanced
> > > Power Management Unit), it is responsible for managing power across
> > > multi
> > > power domains, which includes power on/off, isolation, power-on
> > > sequence.
> >
> > You should prob mention that this APMU is already documented
> > elsewhere.
>
> Maybe it's also meaningful to mention that APMU already has #power-
> domain-cells property, because the first reaction of me is to add such
> a property (and then found it already there).
>
> Thanks,
> Icenowy
>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > pw-bot: not-applicable
> >
> > Thanks,
> > Conor.
> >
> > >
> > > Signed-off-by: Yixun Lan <dlan@kernel.org>
> > > ---
> > >  include/dt-bindings/power/spacemit,k1-power.h | 14 ++++++++++++++
> > >  include/dt-bindings/power/spacemit,k3-power.h | 12 ++++++++++++
> > >  2 files changed, 26 insertions(+)
> > >
> > > diff --git a/include/dt-bindings/power/spacemit,k1-power.h
> > > b/include/dt-bindings/power/spacemit,k1-power.h
> > > new file mode 100644
> > > index 000000000000..41ef540b5c44
> > > --- /dev/null
> > > +++ b/include/dt-bindings/power/spacemit,k1-power.h
> > > @@ -0,0 +1,14 @@
> > > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> > > +
> > > +#ifndef _DT_BINDINGS_SPACEMIT_K1_POWER_H_
> > > +#define _DT_BINDINGS_SPACEMIT_K1_POWER_H_
> > > +
> > > +#define K1_PMDOMAIN_VPU            0
> > > +#define K1_PMDOMAIN_GPU            1
> > > +#define K1_PMDOMAIN_LCD            2
> > > +#define K1_PMDOMAIN_ISP            3
> > > +#define K1_PMDOMAIN_AUDIO  4
> > > +#define K1_PMDOMAIN_GNSS   5
> > > +#define K1_PMDOMAIN_HDMI   6
> > > +
> > > +#endif
> > > diff --git a/include/dt-bindings/power/spacemit,k3-power.h
> > > b/include/dt-bindings/power/spacemit,k3-power.h
> > > new file mode 100644
> > > index 000000000000..519fbf946312
> > > --- /dev/null
> > > +++ b/include/dt-bindings/power/spacemit,k3-power.h
> > > @@ -0,0 +1,12 @@
> > > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> > > +
> > > +#ifndef _DT_BINDINGS_SPACEMIT_K3_POWER_H_
> > > +#define _DT_BINDINGS_SPACEMIT_K3_POWER_H_
> > > +
> > > +#define K3_PMDOMAIN_VPU            0
> > > +#define K3_PMDOMAIN_GPU            1
> > > +#define K3_PMDOMAIN_AUDIO  2
> > > +#define K3_PMDOMAIN_LCD0   3
> > > +#define K3_PMDOMAIN_LCD1   4
> > > +
> > > +#endif
> > >
> > > --
> > > 2.56.0
> > >
