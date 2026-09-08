Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CCA556BA3
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 13:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788872698; cv=none; b=uyKE1SNHiTdV5ax8JIUFj+jET9mgLzXT6U5aa49sNt7D4z/QRCJLB/MGaRzBYaEGz6DMsNVU2NgfAn/PywW5VrrqQtA36NXz+qt36Z5W8ybe1eiji2VwtUxBdJX2hUF4FI3PjG0WOFKKWHqj0oxX2H9xfTZUw57veabp5a4cxqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788872698; c=relaxed/simple;
	bh=MqL/Xkqtt9tuAW8ouTIoqFaGI5c67z7vZomae3ZWfzw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vjq9owkwTR8S9+ASpgyF4F/Ks2r+zkAhEJbJHW80XxMhkRkpffxSQGKQagJhiAPKbn+SJjI/o1Qj8y3pFhclWYYkkgDq5PsIKseHRsL3j4JeL0s/oJrSstIelOt9Da0AHIGHJpRfBXtHfvrIcfdR2lTl+AvqeC4wjQemb2FrFfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-97cc20c05d3so1183830241.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 06:04:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788872695; x=1789477495;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6D5/u0iibTcmvkK52s1OWfcUGM+MqNy3igZLyyuUE+Y=;
        b=hySEKsJ4gacthKmINQKtWczLirDLDnj+K7cgW0yXeZOuvFxPMyz17FUQqrJ4oSqTEP
         dMKzDI0PaMzAYiutLLjmcwX7IunPYjo+CtE3ZyySDcS9JeAC9JWInhLzj6sMGwKrQ3Gf
         MZn85t9yzuaomfIQZE8BIcL90Y+Y5JCiJuPtG0x6heY8CCXiJo/uZ2+xZ0SEdXf3GD6H
         Bw7emLQHSjZMqYFXZawCqrCLq+a7lH0TocdPN/ZGJxyLeiTX3vU9Xti5seZ31m+2oD9V
         PsyIo4X5YUqa4Ekyux4eGxcZVaxTNOQgP3k3RWhfEMLFaxapM8gIfHhBRMaNVWxCDaEL
         wVtQ==
X-Forwarded-Encrypted: i=1; AKwUvByFCmvhykh6GwQINnUrRxE9VbFYtkjCP1zrqlE4TpEFgVb7xuUIXVtZus4rp7FMeX9LpR+8a7afanLfc/g=@vger.kernel.org
X-Gm-Message-State: AFuF++n1YsAZOnf/3ixkkfQR+yqV5YN1W7LSaJx49xv7G0Ob2ep97dfB
	HVbfSHJNBV6O5RfFZv4X4e9bo0RGcFUmp8APqVJKQAZ5NV4+L7DBpq0Vp6YjNQRF
X-Gm-Gg: AYBFou3aawSTsvGBISeI3tJ4xZT/Bu5IFgBy7E8duvoRBxb52LQl5x6YuhpHwlsXiEh
	nRbI1YSboEXYoEOIHiS5R0V5wnzcxW0V16vVafPuIUZTfweRCaUxDtgsuJCmhYDLZQM1ncqDL7d
	Sy4Y72HQQb91p4WccFe5xG5QFSh7ack6VEq0cHAp3+m2OMbKwG9EP/3Yj0GuCZk75TLq9fcIuYB
	roPGd4q2Hi1SWy/8ut7XWGMbTIx2let6FOi2pfHDIxeHymAAaifE54vuksyfKJc4DTDp2bvfxC1
	7a1s2Wo3J7hZidFhENlt1OR+Y4VPR4RzaeVxPuNBLZrPZJwRJs8qGS4SRGNec6PR34qsK66hTtq
	S9wytZ6ldewYJXXDHqcYZceq/9qo52K8I2KMnlxh7BcxPSA4ULILu6HgdzcHLR51Gq4k7MlvFQJ
	uCRTMaANwavItQ7wD/iR92RaCQ+tJBkpe60uZKHKzGnVgj+67itgOyp7yCz9vLSCb0M6kPJvvo0
	NZpCf7BmecXYSLyO4udJM7vx65kC60VouFsXPb2vw==
X-Received: by 2002:a05:6122:32d6:b0:5c7:a3a3:a4bd with SMTP id 71dfb90a1353d-5c7ed3a528fmr12874948e0c.4.1788872695217;
        Tue, 08 Sep 2026 06:04:55 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec24254fsm9645493e0c.10.2026.09.08.06.04.52
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 06:04:53 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5c67175d176so2060479e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 06:04:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy8brx0T6smDsMTwBmvM7f0+MR9khrAUOqGmExbuehM1OR9GjMPntIKRVnQSFmQjp1tfdAeMAg/aEDmOQo=@vger.kernel.org
X-Received: by 2002:a05:6123:2c8:b0:5bf:b3a0:388c with SMTP id
 71dfb90a1353d-5c7ed3e2247mr13571554e0c.6.1788872692103; Tue, 08 Sep 2026
 06:04:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826174854.199139-1-biju.das.jz@bp.renesas.com>
 <20260826174854.199139-10-biju.das.jz@bp.renesas.com> <apAT6qiBpkum_SLc@tom-desktop>
In-Reply-To: <apAT6qiBpkum_SLc@tom-desktop>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 15:04:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVOhvYhWzq5_ifi-bmRmtm5X59CnztVqqpJJ3yiu2G-OQ@mail.gmail.com>
X-Gm-Features: AcwNN1X9WPT8W9e8Zwg8bWnxXuvgHZ6-hB9cMhTXuxpji9ryx29w07MWZ9A5668
Message-ID: <CAMuHMdVOhvYhWzq5_ifi-bmRmtm5X59CnztVqqpJJ3yiu2G-OQ@mail.gmail.com>
Subject: Re: [PATCH v3 09/13] arm64: dts: renesas: r9a08g046: Add vspd node
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Aug 2026 at 12:39, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> On Wed, Aug 26, 2026 at 06:48:43PM +0100, Biju wrote:
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Add vspd node to RZ/G3L SoC DTSI.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

> > --- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> > @@ -696,6 +696,20 @@ ssi3: ssi@100e4c00 {
> >                       status = "disabled";
> >               };
> >
> > +             vspd: vsp@10870000 {
> > +                     compatible = "renesas,r9a08g046-vsp2",
> > +                                  "renesas,r9a07g044-vsp2";
> > +                     reg = <0 0x10870000 0 0x10000>;
> > +                     interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH>;
> > +                     clocks = <&cpg CPG_MOD R9A08G046_LCDC_CLK_A>,
> > +                              <&cpg CPG_MOD R9A08G046_LCDC_CLK_P>,
> > +                              <&cpg CPG_MOD R9A08G046_LCDC_CLK_D>;
> > +                     clock-names = "aclk", "pclk", "vclk";
> > +                     resets = <&cpg R9A08G046_LCDC_RESET_N>;
> > +                     power-domains = <&cpg>;
>
> Same here IMHO we can switch resets with power-domains position.
> Apart from that LGTM.
>
> Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4 with reset moved.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
