Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABFD4DF4B5
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791891724; cv=none; b=f0VuMQAJ1SohK/x5sxQTVqYIuWuGSRcWO0fi2Gwhmn8f7utc2ajJ+Ta9sonsOyg2pj/YM5W0V7wzSbOjXJFxwiRPtgjBi5Oq5ECeX7IeRgroWFfxnsmcPE1qYo/sAZr73cW6YqwqsrYoyf7PbwowyMjA1u+iaxXNyIBkpwu0ASA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791891724; c=relaxed/simple;
	bh=k5veFeTTHtqbcVUOmk8kP3kRfVRBO7Pptciq5IbVpOA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O0piBg6R8qAPf2dwuXclRhD0DrHgHy2vX1+JaVWWTrBeGY5oBcYmC7NRYKAlGELLs8lil2HL0JoImUeHOKewS1bmPfEhPTiECXIDjrlJ16f39YQWDk7xhyiu4o+h0OXgWSECf4cZxAsjDmQv1wtP+yP2f7IdcT3DJQbP4u4idno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c2acc1e170cso461021466b.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 04:42:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791891721; x=1792496521;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WEZ3XROOQ5wml3OCk98kzhYlw6diUWNF5eLEQIKJbBE=;
        b=oq6O3p+oARi36sCyentkkM0c0FTXKaG3rAnf8h629sgveLlcwwalaLbnjf/ixZUCP6
         HjH6cMStAEy1x616PP4xO/TC5Ju1ecQenJiu9bZ9svV+9JVnrBU/wyieeD+RZPDyelCC
         dUOnYdnFwCfYaWKSwaie/pOKDXkLUcUnCOlWhbFbMZgTqT+ewfRlfINtWE00f4LPtJA4
         WH4K0ut6nzzDd0RwtGlsCSzqb7NlXKXQMFLHqRSfhL85dQ55uSMKihOSbV/PmCqRsEn+
         3CLuyhklFTrMwAGkjy095ZTM70JZPMXDEXASUUjZsHdx3N7s97BDDFn6ogG4uV3fc1cJ
         CMLw==
X-Forwarded-Encrypted: i=1; AKwUvBzznS0IKp8I4rVxscIWXC9QMc0nBEK4PGN5ZIlfgnGA9fhLtqJpPfpWaEYvdl9Kfw+6BRODnIfJQO1uqvE=@vger.kernel.org
X-Gm-Message-State: AFq9FYI45lODoYp68RVGrsidmyhD4YqdtjcZa/ky1bTq07iKPPJxLMoy
	i0UZ8TA1lInwbwHaF8N+eA3oGF0FCNo9o6jFtENKEuCGKZJMqKD0iiiPOZgtReaIhJU=
X-Gm-Gg: AYBFou3nyPcfx9RQHhD69UBMccQ3TyK7sKbATOzp32vKyywKVVyS1Tcpb8UFJi+Lq2s
	BphTQcxnuhs50+9G4wy095e/McA3ASgMTLhJFZksAInpKmoi8uxotnQbuJXNOOayzQJC3KtuU8p
	SPbzShBf9FecGEtVIV1gbIc4Bw+UucFd8cT9JHexN5wq4az00jHK6WI3j+E3g0I5aNcHp77qrCd
	kpuE8kHMD8+5g3QpzKo136Gm2j/S4hcnJRJEnzMrf4JQ4i5aO0U7QDKFmSVWIgdOfH5+uBHI/Yy
	ZIENVEJcNKvlm1OKD7pTSj2MxXrsM1LMeaIYrAEWtQ3YdfPRciWvvpGeb9Ixz0qNiKZ1afZibUU
	xxlzM5lbzppNBCu49qZW/2K1EYl8e59souvoRBjaCkCtL+9JSdVVSd8eJzCf2/jaICDuakyOBeY
	CKAePbrWiJy7uxMbaDQiZLUmGED+wh/oVOPjN1W/xBQohnmZq+aaDePW6EHyVuXOEh46n2B1mia
	vMJjEA4coVh6NngeEm3IwkV2iPl0taTqdh0
X-Received: by 2002:a17:907:2d8e:b0:c29:f5d8:9c7d with SMTP id a640c23a62f3a-c31aa0c11f4mr1142060366b.44.1791891721072;
        Tue, 13 Oct 2026 04:42:01 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c32a4954a3bsm432908566b.64.2026.10.13.04.41.56
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 04:41:56 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c2dc63f8d8aso477473566b.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 04:41:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByviK5FanJDxbs6UcWBpRsjLWim9KxfWr3eG4MGwcHOr+Q6rn4P3et+L3SNHVNw8vasCxTKKxMpQ3LlxIo=@vger.kernel.org
X-Received: by 2002:a17:907:e158:b0:c34:e9fe:82ed with SMTP id
 a640c23a62f3a-c34e9fe8db4mr355591866b.28.1791891716374; Tue, 13 Oct 2026
 04:41:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013-paul-v7-3-rc1-edac-v6-0-2f1d6f2f74db@bootlin.com> <20261013-paul-v7-3-rc1-edac-v6-3-2f1d6f2f74db@bootlin.com>
In-Reply-To: <20261013-paul-v7-3-rc1-edac-v6-3-2f1d6f2f74db@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 Oct 2026 13:41:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV1nuiSAKbCrD0mWJX7rC4T=fxO5LC5ksRD440YSL_3cw@mail.gmail.com>
X-Gm-Features: AclHuK9GyhuxP1j4sSDne1XJEsD6-l0raq_tLn-7rYWcCt7pn2fMfEYbVEbwDsM
Message-ID: <CAMuHMdV1nuiSAKbCrD0mWJX7rC4T=fxO5LC5ksRD440YSL_3cw@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] ARM: dts: renesas: r9a06g032: add EDAC node
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-edac@vger.kernel.org, devicetree@vger.kernel.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Herve Codina <herve.codina@bootlin.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"

Hi Paul,

On Tue, 13 Oct 2026 at 12:45, Paul Louvel <paul.louvel@bootlin.com> wrote:
> Add EDAC node to the SoC base device tree file.
>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Paul Louvel (Schneider Electric) <paul.louvel@bootlin.com>

Thanks for your patch!

> --- a/arch/arm/boot/dts/renesas/r9a06g032.dtsi
> +++ b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
> @@ -164,6 +164,15 @@ dmamux: dma-router@a0 {
>                         };
>                 };
>
> +               edac: memory-controller@4000d000 {
> +                       compatible = "renesas,r9a06g032-ddr-edac", "cdns,ddr-edac";
> +                       reg = <0x4000d000 0x1000>;
> +                       interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&sysctrl R9A06G032_CLK_DDRC>, <&sysctrl R9A06G032_HCLK_DDRC>;
> +                       clock-names = "ddrc", "pclk";
> +                       status = "disabled";

Should this node be enabled by default, or am I too naive?

> +               };
> +
>                 udc: usb@4001e000 {
>                         compatible = "renesas,r9a06g032-usbf", "renesas,rzn1-usbf";
>                         reg = <0x4001e000 0x2000>;
>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
