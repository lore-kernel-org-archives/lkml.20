Received: from mail-vs2-f40.google.com (mail-vs2-f40.google.com [74.125.227.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9AC2472076
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790325426; cv=none; b=pfq932tXBj8h0NTT0SyoJqxoi9/tY8Ndw0k3MMF3jwsIEYKBQYBou2lZGQdwQzaV5gvBXLatmPkeXQK7Vcq99lq87fH/v9aG9nxTTR7jPtoClsO2imh+/0NQNa5wH8JFkyejroLD7iqDXCaGvX9l0AHMv5MGggTj7cAFjwc5DT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790325426; c=relaxed/simple;
	bh=ynpwjG+I+W6n5EtE22Z7G3rUSMwbcRn+9MipAwmrRDc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=htJGz8xCenIZoVImKoXprhqQcQCzDOlE0gmIp1yqh/h+35TuBLaQs/QfxctmuNhrs7yWtGzcGAM7XUkzZPREgeSDufitghzefZEX5NFZrjuz8WlDxE50Y9gaFbjhLO+Ih8+rdrjxcPYh+9wk5ID/9ND50EGD+aTFoVklZ1fdlX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f40.google.com with SMTP id ada2fe7eead31-7a03fe69236so196730137.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 01:37:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790325420; x=1790930220;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qCNI8jGo1Ov8X30u+i1BBvFQUriwSK3GJhOUtQAjv2Q=;
        b=TfcKEac0+rleiOKy4JSqojdE2hXoksTvMUWT413UVISsaX2la/MsXHZKFcFcNxubcQ
         EChcuAgYvZnlNGanoO4ANtf6Mk4sIQcsXp7/N6+BVmL6izeKXgL+JR5xHifXQCiIwx8R
         0tRD12+2QcfhXSXGYSvvAj7ju+jxgI4U+RYSkkx7Tg95YgHdinEvEj/6YQH9dHKUNH8L
         d5YsPOb53eSfDsMszhDLcZxbNa6XM3oiQFmUTE5apz/SegFALBO0UlqoEwII5/p2LkC5
         DpHadMmD5KD7zByt96HGGFuESx5+cpZ/SK7i5OH/HV7i22nOBJNmIBRH53CsFN9sXHaT
         Zoaw==
X-Forwarded-Encrypted: i=1; AKwUvBwwoIlRMw+TkzPsJ4HgLWK1f71WE4mTYOBtGl9d9cB8C1JLLQLRDG5caGzweS35AYPUHIRRfHZ0BcYpk30=@vger.kernel.org
X-Gm-Message-State: AFuF++lc0yFoTQ0xP3nVG5M8BLGVFzjxFkwBTmurjlKqTT6039wWfz+z
	Ej30OrS4TYowVMA0iuL4m7JeoznOXSLgT1Pp2+BoW4allwxX9KngGzB2BcmeT1io
X-Gm-Gg: AYBFou0V9wd66sAKSzCJm+w6hdbIzLrMvwJ0ZOjwUqErLmcWHW7aE10x9ZQc294KH4x
	lEIcQFPOV7iGH706lC4xbaTq+SMIZhlFSjhVz/xY4oYiAldkjNxlrvNT7C+cVGvOetblFEUZLGk
	wmRLi3QfHei3jGVSXZmG+IZZl31/uARUhv96bVvLNOi/hYiOcBwqO4rJHWfM4WHtfZ3Gt9+FCzJ
	Wz2L/LfJWXgpO2uiqe7lxsL94e2PwhHbaW5tGYntTA09dwPCBjY52JZDUkbl7lcV6VX57NuSggG
	RCO4xsoEfd+R1tP4jScjCP81L/2l3sq/Qq1xmyWr9S2yoMraZDrxTCC7dFQq6Ea6Rx6hxLnoJL7
	46jHqVcWLNvA6lxZ4Fj3AyAqDv3XsjCjTbqrqeAGEeD0DyFntqklTwUYfFJ8I8vzkHdcICWfes4
	QB1xl9x4r8WqDZZ9+LZQOgl9RLXO/cora0lpqGXGebZ0u929+k09lmbT9ltTdZjYF/r7/4yDO4R
	Qnsj+fRtXdxEx4ivPCZI5RZB0bkrLnmvYyAnoz94y5WNa0L
X-Received: by 2002:a05:6102:162a:b0:7a5:1d50:ac35 with SMTP id ada2fe7eead31-7b1c76179a1mr475283137.21.1790325419692;
        Fri, 25 Sep 2026 01:36:59 -0700 (PDT)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com. [74.125.226.204])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9861afee4c1sm1772160241.7.2026.09.25.01.36.58
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 01:36:58 -0700 (PDT)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-982db8d3b1eso194450241.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 01:36:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByZCqgpYZ+OEaGPnCmUcpGnE3J5jX75GLso64pJbhD8S6YAXNhW3L7S0NEfrI4Zv5osRjBeOmH4iUxhAEM=@vger.kernel.org
X-Received: by 2002:a05:6102:3f4e:b0:779:5049:87b2 with SMTP id
 ada2fe7eead31-7b1b34d3523mr571652137.0.1790325418233; Fri, 25 Sep 2026
 01:36:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-rzg2-sr-boards-v8-0-94c4674927e8@solid-run.com>
 <20260904-rzg2-sr-boards-v8-1-94c4674927e8@solid-run.com> <CAMuHMdXtcxyD4Zh+HyM1D43zu8KND-18FiLhi9OXTHZPojRH=A@mail.gmail.com>
 <29a64d27-b19e-41e3-8d2f-768cfa8de2e6@solid-run.com>
In-Reply-To: <29a64d27-b19e-41e3-8d2f-768cfa8de2e6@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 25 Sep 2026 10:36:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVHSdXX_xaNAGGtwpUHH2K4NUaDZVsLPjC+aqL6stKxag@mail.gmail.com>
X-Gm-Features: AclHuK8NKCeC4Y5XQE8QASTp0kSvhUAEgHHcCqI-Lvtiu6JPf2U_mHtpxgJb_YI
Message-ID: <CAMuHMdVHSdXX_xaNAGGtwpUHH2K4NUaDZVsLPjC+aqL6stKxag@mail.gmail.com>
Subject: Re: [PATCH v8 01/11] dt-bindings: soc: renesas: Add various SolidRun
 RZ/G2 based boards
To: Josua Mayer <josua@solid-run.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>, 
	Linus Walleij <linusw@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jon Nettleton <jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"

Hi Josua,

On Fri, 25 Sept 2026 at 10:29, Josua Mayer <josua@solid-run.com> wrote:
> On 9/23/2026 3:42 PM, Geert Uytterhoeven wrote:
> > On Fri, 4 Sept 2026 at 13:56, Josua Mayer <josua@solid-run.com> wrote:
> >> Add bindings for various SolidRun boards and System on Module built
> >> around Renesas RZ/G2 family of SoCs:
> >>
> >> - RZ/G2L SoM [1]
> >> - RZ/V2L SoM [2]
> >>    (shares PCB with G2L and has very similar programming model)
> >> - RZ/G2LC SoM [3]
> >> - RZ/G2UL SoM [4]
> >>    (shares PCB with G2LC but programming model differs largely)
> >> - HummingBoard IIoT [5] (RZ/G2L, RZ/V2L, RZ/G2LC)
> >> - HummingBoard Pro [6] (RZ/G2L, RZ/V2L)
> >> - HummingBoard Base (Ripple) [7] (RZ/G2L, RZ/V2L, RZ/G2LC, RZ/G2UL)
> >>
> >> [1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2l-som/
> >> [2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-v2l-som/
> >> [3] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2lc-som/
> >> [4] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2ul-som/
> >> [5] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-iot-sbc/
> >> [6] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-sbc/
> >> [7] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2lc-base/
> >>
> >> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> >> Signed-off-by: Josua Mayer <josua@solid-run.com>
> > Thanks for your patch!
> >
> >> --- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> >> +++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> >> @@ -508,6 +508,14 @@ properties:
> >>                 - renesas,r9a07g043u12 # RZ/G2UL Type-2
> >>             - const: renesas,r9a07g043
> >>
> >> +      - description: SolidRun RZ/G2UL based boards
> >> +        items:
> >> +          - enum:
> >> +              - solidrun,rzg2ul-hummingboard-ripple # SolidRun RZ/G2UL HummingBoard Ripple
> > As RZ/G2UL is pin-compatible with RZ/G2LC,
> The SoM is, the SoC is more complex.
> SolidRun uses the G2L/G2LC package 15x15mm while G2UL is 13x13.

IC.

> You are correct to expect HB-IIoT, however due to the reduced pin count
> and feature set it is not useful and will likely never get supported by SR.

OK (same for RZ/Five ;-)

> > I guess you could have an
> > RZ/G2UL-based HummingBoard IIoT, too?
> >
> >> +          - const: solidrun,rzg2ul-sr-som
> > Is there any special meaning of the "sr" in the middle of this and all
> > other SoM compatible values?
> > If it just means "SolidRun",
>
> It does.
>
> > I think it can be dropped.
>
> The "sr" is merely to avoid name collision with other SoM vendors.

OK, for non-DT situations where there is no vendor-prefix.

> > However,
> > you already have that for various SoMs with non-Renesas SoCs.
>
> Correct.

OK, so keep it for consistency.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
