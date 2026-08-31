Received: from mail-vs2-f1.google.com (mail-vs2-f1.google.com [74.125.227.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2D93B42F1
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788163998; cv=none; b=GoCDo3d7WGIT0+AEK/ihWuYqzdymdFxsuqQKt3nS+hyQcmnoXl559iZFSNmI/aIIJLcnHQmUF/r8lMILsuZPq8BcV8KvxnDdgOC36WK+37aKERuVSkwWNxCPdwDI4hPV3nrKO8HbCzMOZEbZGvdg5SfWOs2EnzX8quGNbzIeGbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788163998; c=relaxed/simple;
	bh=+qn3x8nquazRyDm0Q+Tw3miio+SG11ZPkQozR/1R4To=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ALVaW5GW6iIghS2ceI8Vb1t2uw9VTb8HEzYFkZb20HifO1JiSS1kjQUed7NgozWi+yOCXoko09Vqg9ztOryFY4UVjSKVT5qdKqUsi6TiQiS9uK7JddLJfndW8l4w7ti7b2wtUGgjBaw3zt52GMUipjc1EYdBH3MtO7poPurEegs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f1.google.com with SMTP id ada2fe7eead31-74acc945b83so3094128137.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 01:13:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788163995; x=1788768795;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n+6mIWWcx/hgj72l0+IMwbJPq4HotcZmhxU6vYoZhGw=;
        b=gdmmi1qCrEwQNXXEext3txqJNigtLHnHwtkap52LtsOdFcz7hv9DL3A5eYBDXCp07e
         ltUxHGl5q3Ex2E/Jf55FqxYt0ZUlB6SskmiFh9+30yiG56ZJwrZGVr1IaCWIgZjbTiT6
         Y4Ggks1IMcfZ4/GkNtkodHUVPABC/IL3W09WCdJZtfa2jbJC5R20iJWwNz1Oy6PXZPow
         8HALCjgSIXo4je28oIOzh+VMMvHb9DAVathzqv/bJK9OhyIlGF7oKS9RE2+Ok0ZziOz2
         HgCGJoDdLSxaOFqoPhf7R7pxnmtmUBKWOP1yY5VSWIKYiXMxbTsRj81ByjZVYOr/lLt9
         YxYQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpeodc2SYA6TbwmT4zUOTEnVTsPQTu6M+9FwYWG5JAht3mWeJm9Kbd/kHj+Scabk0MexAvUir48uxiIRiM=@vger.kernel.org
X-Gm-Message-State: AFuF++kWxrsZJO6xkEbSqb0EOgmKqb/pi9ewDjYs8ayUhd0Mmw0nrhvx
	IrUxyU8I2Qi5MXP46Dl4+Qku/jTYv5E9+quIHJm6a8/NotivcrtezVSkonJXrjFa1uE=
X-Gm-Gg: AR+sD13NcaH/Dq/F4ZDmMrmy1xLpvIPz2IORLSRZhr+cmjIuNp9SDHj//qPAkU9I/Am
	Xkn55+D3D5muL3+dZghcSFh3FaCEez2SBUrPmifVK65fJa+TPUHjyoz+29UKQBYja2HQD/cUuSL
	wAG5SPstqGhkbGXNn7703sTXJG3tdT4DZUozNS9nyWEhjYyDzryOEX+SGAVoiAEb7zqQIfPJUuu
	c3KsywRyleDhPBYw3Ks91rqTMx5P+fDFWFy6/x+y++s3cP00UKCdyB9yepWFrK3XTuKXaOSn/G4
	x7NDmf5qDUjTS3STno9CRbD+VLdf3ExVaclTJm4VtYpb4aGzj2lj6yPIrPk8KEmyUIvt4OoNEcA
	eEmZUiRNAk4YROX91x7T4o+PNoYNz/JqelOyoqJkJXwQ1WjfJDyVfSIU6/DFVT92OE2qPWDdqK5
	2rAqxe6bDe74pboWHzbe4A9y7rkFohZY2g8jvRzRGVuJePBTz8DI1vOuttYfnUJkMcdKlHaa3GE
	LWtkfLdJOP779m9FBeSNcT3Pg==
X-Received: by 2002:a05:6102:1620:b0:785:e444:15de with SMTP id ada2fe7eead31-785e4442a4cmr8102558137.6.1788163995412;
        Mon, 31 Aug 2026 01:13:15 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97e84b6d55bsm7607100241.10.2026.08.31.01.13.15
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 01:13:15 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-782df51b4c1so2326612137.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 01:13:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrQ+y7oL1+QVnYc5yabWXE0kh6rZgg57MoHO+2UvmbMTDAPi3AMr8bkPZQgAxh/dvbfyBLDhwA3O+ZvMAk=@vger.kernel.org
X-Received: by 2002:a05:6102:f9b:b0:77f:7df:ddd2 with SMTP id
 ada2fe7eead31-785972e710emr9471412137.1.1788163994928; Mon, 31 Aug 2026
 01:13:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828192223.402422-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260828192223.402422-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 31 Aug 2026 10:13:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWEz=NoDkvvSjZqNwDQE7+F-JqEeduD0-E-NXTj4Ykbuw@mail.gmail.com>
X-Gm-Features: AcwNN1W_pE0AEcDpr5Qk2q9RcyT_OX0D891rRk8joGtPW1leA8taoV55ukV4EjA
Message-ID: <CAMuHMdWEz=NoDkvvSjZqNwDQE7+F-JqEeduD0-E-NXTj4Ykbuw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: phy: Document Renesas Multi-Protocol PHY
 driver for R-Car X5H
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-phy@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Conor Dooley <conor+dt@kernel.org>, 
	Hai Pham <hai.pham.ud@renesas.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Phong Hoang <phong.hoang.wz@renesas.com>, 
	Rob Herring <robh@kernel.org>, Tam Nguyen <tam.nguyen.xa@renesas.com>, 
	Thanh Quan <thanh.quan.xn@renesas.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Vinh Nguyen <vinh.nguyen.xz@renesas.com>, Vinod Koul <vkoul@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Fri, 28 Aug 2026 at 21:22, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Document Renesas Multi-Protocol PHY present in R-Car X5H (R8A78000) SoC.
> This is a multiplexing PHY block with inputs from five IPs, and outputs
> to four separate IO blocks. The five inputs are two PCIe4, two USB 3.2,
> and ethernet PCS, each connected into the PHY with up to 4 times 2 lanes.
> The inputs can be multiplexed to the four IO blocks as needed.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/renesas,rcar-gen5-mpphy.yaml
> @@ -0,0 +1,125 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/renesas,rcar-gen5-mpphy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas R-Car Generation 5 Multi-Protocol PHY
> +
> +maintainers:
> +  - Marek Vasut <marek.vasut+renesas@mailbox.org>
> +  - Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: renesas,r8a78000-mpphy   # R-Car X5H MPPHY
> +      - const: renesas,rcar-gen5-mpphy  # R-Car Gen5 MPPHY
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 5
> +    maxItems: 5
> +
> +  clock-names:
> +    items:
> +      - const: mpphy01
> +      - const: mpphy11
> +      - const: mpphy21
> +      - const: mpphy31
> +      - const: mpphy02

These look like provider-centric instead of consumer-centric names.
Please add descriptions, so it is more clear what they are, especially
for the last entry (which should perhaps be the second entry?).

> +
> +  power-domains:
> +    minItems: 4
> +    maxItems: 4

Why four? (yeah, SCMI...)

> +
> +  power-domain-names:
> +    items:
> +      - const: mpp0
> +      - const: mpp1
> +      - const: mpp2
> +      - const: mpp3

Likewise.

> +
> +  resets:
> +    minItems: 5
> +    maxItems: 5
> +
> +  reset-names:
> +    items:
> +      - const: mpphy01
> +      - const: mpphy11
> +      - const: mpphy21
> +      - const: mpphy31
> +      - const: mpphy02

These look like provider-centric instead of consumer-centric names.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
