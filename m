Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4013937648F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788534448; cv=none; b=L5QlX2eZvMWIm8+Je6DIi2BZfVH3ccx7ov01m9VwGESy8KpGEairjE4rRI1UhnYDXdax9NgmiMY2xtOXpUZKwQS4zeC1ccM8uqjgN+2zv9UhZCVzBEXkp8fXMnw593r2edPXzrXQgQx8aAk+iyN0jXF1kv/w38nXldtwyZ1cmBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788534448; c=relaxed/simple;
	bh=ghXH2BJF4jduj/BjXt7Xua8zEA4xRov01HKEMrdgGlc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hOyA2QXy33mBk6AbLEVNuCBBN6cpZCpx6y9fivDzwec4amt5kEjR82ZHxlVEZcgSStpi1PVkRdaWkB4mnneXPTAUKva79DLudIufK9RjjqtQKWPx/usjOQdShnJ6jluX4Lka9f7iXemEh9iqypYgogX5R409XRdhJl7PCigkKMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-4583b1703d3so679920fac.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:07:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788534446; x=1789139246;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=inqGTZSC3u1CgB7ts6dRXUQ1Jo9pob/IqZxPyHHBxZ8=;
        b=RmShdZFjrG7/8ZKnWdDbjf5p+rnk9y49gGcxEO2pBYG0l+8/LXcBfKn6o6K0l7Cy0N
         sCp5Bye4WH8p6HfSVrguirolmhmAez+nYXoU2Tl/Houm6NZXPRHGTpdEVmzb4Tdam9XW
         OLHz0XLJuLO8d5qyXfeyEvxVU6SJeqiI8fiRA3ee4mg5ZbQ6GGht/dA9YXqDJwNOGHum
         J3A8pNQPpCxlns20/KnNuXGOF64YaB6+FAJHFOwyWQ4J5bgxNRIIOn7NP0gz67ALCVaq
         DP3E1CkEfsMmMTzp+TM47Yz/ecmIPN0tVWFfX2hRv1dc5DUWYApXXFe1b71FZrLjsukd
         6lkA==
X-Forwarded-Encrypted: i=1; AKwUvBwF7xZhXjOhSde/c0sYtOw4aUmFGsxLRQ4RgCLNPovT/HrnOQoGUXm8ZKBwoTBuROLvwy0e+UaRjPB8Vx4=@vger.kernel.org
X-Gm-Message-State: AFuF++nwAiSzJhvFlg3wnfkDDZAyBx/7UMk1opy3ngyMMK7IVz53yjJu
	1aDM7OivDSAfAh5SBGYBQngGa2DrQAPiJNUmar1ZGZXXwLXUBKQdj5ZopplIGY2m
X-Gm-Gg: AYBFou0917J/vq9DYdq2l3gePBLDH0ajUVVzg3ceW+oUIsTY/Bl1sUL/knIrfjIWcst
	pKDSMYc68h574nrtz1AMXYUH6kjGoVhfuhJXeesevpwKTYPwdHBgSm2022hQoYpkuLeDUgZBGea
	u+JV9cuUGN3pKsyefpk0xa3y4vcyDcB8o5JXc7XloQlM3vGHw6YGCrOKrPxfrjijY+jcsRD+gmo
	i7946zBLxCoAHCcueOe/er6y1DzOwHcmwthsvDFFZD465r6zu02xKFusrLvPCSq4s6+mBr9lOUw
	B6p1vhDR7dt+/5rSJnF+UWjeUIOrgTutOSEvJP3A4KLAsUBS9JvIXeTS07Y9TK20K8iGZdegBue
	jLD8lvSNF5d0g5GC5UDrZJ82k8kSGrvSJRyAkJoxdLRd8vQMoDHlKY0h97+J9gJ9NS2Mwzc/7AD
	Gg6iRhwENB0L86YRfCW4L5Snq0fV8gHlqXak5cx+ldrojHX045XhTzEvPVarPFInvztPaofMS1g
	Z8bOVApR/3cvIV6Lfvqedxtt//1/ZfGyu3Z
X-Received: by 2002:a05:6870:d24a:b0:475:e0a7:9f2c with SMTP id 586e51a60fabf-475e0a7aa5dmr2360557fac.26.1788534444426;
        Fri, 04 Sep 2026 08:07:24 -0700 (PDT)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com. [209.85.160.52])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47554935962sm2181079fac.12.2026.09.04.08.07.23
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 08:07:24 -0700 (PDT)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-46fdd5884d0so451572fac.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:07:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByeCh6ejAzGIogx670Lcqw7lVUDPp4rtfSR41aa1wbaDJ9ds6pHmax5/Kuly0MDmxCOsBI6vLc3X5L83kc=@vger.kernel.org
X-Received: by 2002:a05:6102:2907:b0:778:9033:e337 with SMTP id
 ada2fe7eead31-78a4a7186d7mr1918546137.7.1788533980738; Fri, 04 Sep 2026
 07:59:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821150408.73829-1-ayman.chaudhry.kc@renesas.com>
 <20260821150408.73829-3-ayman.chaudhry.kc@renesas.com> <b2f486b8-a391-41bc-8a7f-dc81c6752205@kernel.org>
 <TYCPR01MB11865BD2FC199EFC6BE613A5DA2A82@TYCPR01MB11865.jpnprd01.prod.outlook.com>
 <a7cc6bf8-706a-4b51-a0ce-d6246045d5da@kernel.org>
In-Reply-To: <a7cc6bf8-706a-4b51-a0ce-d6246045d5da@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 16:59:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWuhpaEjzoLowag=RUMah-LjtSkmkDSJu_ZaYYHAHHcSg@mail.gmail.com>
X-Gm-Features: AcwNN1XOIqok-XF1Ox7YMle_czDmXRTGGzFdPMRVImnv13pc2p3_Z9A1m7XbeZw
Message-ID: <CAMuHMdWuhpaEjzoLowag=RUMah-LjtSkmkDSJu_ZaYYHAHHcSg@mail.gmail.com>
Subject: Re: [PATCH 02/10] dt-bindings: power: Add r8a774a3 SYSC power domain definitions
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>, "magnus.damm" <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Ulf Hansson <ulfh@kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Tue, 1 Sept 2026 at 16:15, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 01/09/2026 16:11, Ayman Chaudhry wrote:
> >> From: Krzysztof Kozlowski <krzk@kernel.org>
> >> On 21/08/2026 17:03, Ayman Chaudhry wrote:
> >>> This patch adds power domain indices for the Renesas RZ/G2M v3.0
> >>> (a.k.a. R8A774A3) SoC.
> >>>
> >>> Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>

> >>> --- /dev/null
> >>> +++ b/include/dt-bindings/power/r8a774a3-sysc.h
> >>> @@ -0,0 +1,30 @@
> >>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> >>> +/*
> >>> + * Copyright (C) 2026 Renesas Electronics Corp.
> >>> + */
> >>> +#ifndef __DT_BINDINGS_POWER_R8A774A3_SYSC_H__
> >>> +#define __DT_BINDINGS_POWER_R8A774A3_SYSC_H__
> >>> +
> >>> +/*
> >>> + * These power domain indices match the numbers of the interrupt bits
> >>> + * representing the power areas in the various Interrupt Registers
> >>> + * (e.g. SYSCISR, Interrupt Status Register) */
> >>> +
> >>> +#define R8A774A3_PD_CA57_CPU0               0
> >>> +#define R8A774A3_PD_CA57_CPU1               1
> >>> +#define R8A774A3_PD_CA53_CPU0               5
> >>
> >> No, value is 2. Or not a binding.
> >
> > The values are pulled directly from the R8A774A3 hardware manual and
> > as a result are not sequential.
>
> So not really a binding.
>
> > This is compliant with header files for similar devices, so if we were to change
> > the approach now it would probably make things more confusing for the
>
> No, it is not compliant. Maybe it is done the same way as old devices,
> but feedback was provided already for a few years, so plenty of time to
> accept it.
>
> > user and it would also require some special handling. Given that this is
> > compliant with the style for similar devices adopting the same bindings,
>
> It is not compliant.
>
> > it's easy to understand as the numbers come straight from the HW manual,
> > I would actually prefer if we could stick with this numbering scheme if
> > possible.
>
> Nope, as explained many times already for obvious reasons. Otherwise
> provide me clear pieces of code which you bind here (as in DT bindings
> header purpose).

I agree all numbers < 32 match a documented hardware bit, so technically
we could use the numbers directly in DTS.
Note that unlike e.g. interrupt numbers, the power domain numbers
appear multiple times in DTS, and are also present in driver code
(drivers/pmdomain/renesas/r8a774a3-sysc.c).  So having defines means
having less magical numbers in driver code.

BTW, due to similar pushbacks against offseted interrupt definitions,
we are now ending up with duplicated defines in .dtsi and .dtso files:

    arch/arm64/boot/dts/renesas/r9a09g077.dtsi:#define RZT2H_IRQ8   24
    arch/arm64/boot/dts/renesas/r9a09g077m44-evk-cn15-lcdc.dtso:#define
RZT2H_IRQ8  24

So please let us have our symbolic definitions ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
