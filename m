Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6911C84D0
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790170955; cv=none; b=LCBscpM3qA6czrP+c26X0RCfPDcE55GVsKzDtyUk6F+jERcNgwgqRH4UnObtvJFoUpcAaIJpgkpFxb4L4FPIhQXRMlwRpD9R4uWuqWck7S0N9KcvghmWBjEaF7jsH5jk27hA3WXShax3cFtQQ9Q1C9uX4OuNp7EFDbfhaP+EUQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790170955; c=relaxed/simple;
	bh=zQLNcKwt8lnNKrUhZWYc0UbpzKFARTsV6kXIZiSRVZ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cqt5Ffq376b4LLaCeaMAGRFZ1iI3OTEAhz5OIgE7VG4z3rbeXOQ9YWetqITei7hjdqSZ8BxpfEskZCdWccg07wii3UPhfy8WSMXS9fNEYB1VPOQb36H/cDctac2c0UF7VNxr0/6M8fztfQttW2cJLg/qxFci6qU6Z5SbcfBsLXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-78564319a92so292255137.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:42:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790170951; x=1790775751;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cZcaHlSLoWG/YlsEmorJF69zsl7G8OYYQpV3ToGZCjU=;
        b=bnJLHAkBbGY7Zt/XrJ03rHElGMwU8lWgHvzaH3a+tEdHDmBujlcVNarY43cjTxC4MB
         n8n0x9bwkz/Af6YAjgucaQX2WVzuK/n6sOJ2MWGB/cERDwWBjeouNi+DDzE2vBBOjdmL
         e0YuUiCHxGDJ8DLL5eS+u72oRVlO88GFKAbG1QU0BYCNLzzwvMS0ftX7sRvdv4QREqEw
         QfkhFI5Q6nE0IO/wq+hTiYfecumE+5g0Y8Vwv4faZ9NArmFx5ZYUeQhv4K3PJpzt5M7e
         TsmsjZtpBek+PMKK5ihJVYCnrL/zg4Fc9Zc6xWAwV1kHzG5xhLm2hGc2CrQUGDhDysGS
         pb5w==
X-Forwarded-Encrypted: i=1; AKwUvBwHevpUr8wlMX8ZqiIZqSe/BstfMT+pm/qzF6WqE13WKHrPMbib9EaVacN17UuwGSfyFna5hXROXjvzxzQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nAjQbUZXeCtuPfIsclljimDyW4MIQAO71qTTLehH0nTLxmp1pZ
	CcWIRzbzKwaIQK+EaWUVmUWwA9eBUE5xv+0Xtn4a0S867EL/oKkPBv4DPySdL0reIqU=
X-Gm-Gg: AYBFou1KpcNnyvzHFi0aeDciVxIdEk3fFPKzBlWlmyNhNwshvsZhwPpHpcGyohBq/H4
	E/foUHXlZJgE87aisoC/65ns5aRZ5nB2fifdNPFiyv1QhBCconSFn9axPDPWeWInBEDbkd2ly01
	J0B4SVl+GowPUMRJzK6unblZNAJRuCoxAl0G3jSWFHhJOBOnJhFkeXXPNh9weD17HT27gL1pSQa
	Xl0vEmA/E423eqySdKHwXhhuNPqR8hwpULlepqgeY1Hq6F3uIdvCV4Ac5rFXv6mqWS6zj45Dz32
	1NQpWdB+XmNNdt8M0J8n9dOLx/uHFQ2H3nV28eAirNrPCRYMeM0MjZm45c/Y3hGBswphAoeQjUh
	vDOY5Xyl/ihqD/bkK5lOPvgdvOlbAhwdyW5MvTXCyhYMdzMTaGEvIRNVg3WtbIf9d+sGpIb6RSj
	eClb1HCAXDBNsGphzQYEb3AoCpjcWK88no90LNoHtKcyEqyks70/C/RRozuujwNVtcEQJwHZ0v+
	Uzn6TZnz1v6f058SQ0B3uMqCENCDdTD+Pj/
X-Received: by 2002:a05:6102:3f06:b0:7a7:366c:92b1 with SMTP id ada2fe7eead31-7ac1d2d8286mr2287244137.23.1790170951203;
        Wed, 23 Sep 2026 06:42:31 -0700 (PDT)
Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com. [74.125.227.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-985169f62a5sm3593964241.4.2026.09.23.06.42.30
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 06:42:30 -0700 (PDT)
Received: by mail-vs2-f41.google.com with SMTP id ada2fe7eead31-785643199baso349214137.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:42:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwI0FUgFGPxagpBqZn4TN+4UoTdYFSUBK4POTgkOOBfJy7MejKB8L6tGVvnXG9q9FzKAFoGaJBm8fZAWUY=@vger.kernel.org
X-Received: by 2002:a05:6102:390e:b0:7a7:195a:1b26 with SMTP id
 ada2fe7eead31-7ac1de3a707mr2471914137.32.1790170950472; Wed, 23 Sep 2026
 06:42:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-rzg2-sr-boards-v8-0-94c4674927e8@solid-run.com> <20260904-rzg2-sr-boards-v8-1-94c4674927e8@solid-run.com>
In-Reply-To: <20260904-rzg2-sr-boards-v8-1-94c4674927e8@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 15:42:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXtcxyD4Zh+HyM1D43zu8KND-18FiLhi9OXTHZPojRH=A@mail.gmail.com>
X-Gm-Features: AclHuK-TckegHvHKUKBwHK2truVsVTBXY6gTl27m7I0mB2ihxriiWdVUDyPODHw
Message-ID: <CAMuHMdXtcxyD4Zh+HyM1D43zu8KND-18FiLhi9OXTHZPojRH=A@mail.gmail.com>
Subject: Re: [PATCH v8 01/11] dt-bindings: soc: renesas: Add various SolidRun
 RZ/G2 based boards
To: Josua Mayer <josua@solid-run.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>, 
	Linus Walleij <linusw@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jon Nettleton <jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"

Hi Joshua,

On Fri, 4 Sept 2026 at 13:56, Josua Mayer <josua@solid-run.com> wrote:
> Add bindings for various SolidRun boards and System on Module built
> around Renesas RZ/G2 family of SoCs:
>
> - RZ/G2L SoM [1]
> - RZ/V2L SoM [2]
>   (shares PCB with G2L and has very similar programming model)
> - RZ/G2LC SoM [3]
> - RZ/G2UL SoM [4]
>   (shares PCB with G2LC but programming model differs largely)
> - HummingBoard IIoT [5] (RZ/G2L, RZ/V2L, RZ/G2LC)
> - HummingBoard Pro [6] (RZ/G2L, RZ/V2L)
> - HummingBoard Base (Ripple) [7] (RZ/G2L, RZ/V2L, RZ/G2LC, RZ/G2UL)
>
> [1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2l-som/
> [2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-v2l-som/
> [3] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2lc-som/
> [4] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2ul-som/
> [5] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-iot-sbc/
> [6] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-sbc/
> [7] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2lc-base/
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> +++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> @@ -508,6 +508,14 @@ properties:
>                - renesas,r9a07g043u12 # RZ/G2UL Type-2
>            - const: renesas,r9a07g043
>
> +      - description: SolidRun RZ/G2UL based boards
> +        items:
> +          - enum:
> +              - solidrun,rzg2ul-hummingboard-ripple # SolidRun RZ/G2UL HummingBoard Ripple

As RZ/G2UL is pin-compatible with RZ/G2LC, I guess you could have an
RZ/G2UL-based HummingBoard IIoT, too?

> +          - const: solidrun,rzg2ul-sr-som

Is there any special meaning of the "sr" in the middle of this and all
other SoM compatible values?
If it just means "SolidRun", I think it can be dropped.  However,
you already have that for various SoMs with non-Renesas SoCs.

> +          - const: renesas,r9a07g043u12 # RZ/G2UL Type-2
> +          - const: renesas,r9a07g043

The rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
