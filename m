Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADF8457E6D
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 17:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789406954; cv=none; b=kedTh4z+iYQQzC9AULgpyoKeFQf1fJLqhpnK09C1CCdJiNeyR8i3Slv89kBt6OMRA3HmOiR9Il5vUawCZl6JEPiJuXtdEjRk59Oj6Ts67Kchp/FBD7ihxyOjOVeZT5O/gofA0/AVOYy+pKRdp8jpXnVANxz1sQJuSwf9MLkVXKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789406954; c=relaxed/simple;
	bh=L1VXsdM/kax6rRlPlpjSuL9HfeLJx9UTWUqPhEH9lWY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iGmx01mQPFvNokpZNeXGdP6mSCfgD+1Pw4IjshLpVpPs+ooa6vlYY4fSh1gwr4WzMLRpTVZ73RcQujPpkXv6IbD6HBHqugHNdm4qYG3sTaSOHTM8qhLM2kLwQS3xFkWnvl+MMDuVGQhTALHWseA2uzIK5TZD6DXvmHoU2hHrTuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97eaa1155b1so1266238241.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:29:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789406951; x=1790011751;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FY+CeR3ViFOh1Uwf42KLiS0O9XW6l4dUqQ0DH9Ddl7I=;
        b=pPFbgPkBQGgLtrfN0x3E8qmYrs2p38UYlpoa74T3p1nEuQqYFFjdAk7cwn8DabwJ7t
         TSY5aIa/a/Cb4wosY9lbK+GsIg/XRUHlTuMh+qB4NRM4le6MGbzqzcme9yNhEmcqFHST
         /ehDBKxXhVpTgOMkGnev0ZgZ82miU8ifAEm3fcgBhFWmRTWJZDLQigPQqqa22k6TkktY
         zNpQBhL8gFMLmSTeWbA0kk5K/7uNjeEwKqbjtq+yLYtCUnXQqkcOMpTWk8x6YRWoVpxr
         yOnzcTVfczPqEw7/41+m6aZvGSCTABCOltya6wOQOTgDbdX1OkojRi02xLuFVRQwrVJ+
         803g==
X-Forwarded-Encrypted: i=1; AKwUvByrm1IS58G+Hm5PcjItKbsKVjPZfjMsOR4F/SJmS7ajqTc5/L9yE6L5Sh7zJ5yylD9quavhiS6uNxieZrA=@vger.kernel.org
X-Gm-Message-State: AFuF++kyfNVkIupMIfWGo6LZF+PKb5Pwfeb38hjZA/BeFPlS/QijhszU
	2TGHSnRRBUfyGTWdefDOavvE/n7AbdYVzCruenxJzY7tSHW339tJG/jha7FPSpJf
X-Gm-Gg: AYBFou2Yr/e8iz2eblQ8iqeFh1D1iWvGvcaY4swwh8Gug9Oa883ZA6OYMmB0l8iVPiD
	3Q+ZjhWFJxkm/NrqBM8fhluZLlr9ugFUsJeu5DAUquCO3vQWl4rMoBzbzo5LQW9uQOLnhgbAljB
	9MaaEuzA9Sgjiy6hnmQLmX8e4QrAxSWueGwnf5ynPjaR6tBeXEbYA9P6lfHWDcMjvVoB6YxylZP
	rc5n9hTJB+QiE7zv3BX7SOC81H1eUvhB+t/98putYG9GkwiYmLbdWz9W+ku8hOW4/pW/+bNMMhE
	5UHnijxLaEHCy3Bv8j4XSOgVi2evxHdSIFDp0JIwBdqgey54wbepe1FdL/eI/pmxAg6WCn/qmRb
	V5RwCbXYGdi+CBjZMI8LFMyuzUjwZG7mkKabqfKztisnBvR2rJ4PzhyTqZQdI7EKkWUXvOv9TYC
	ONCME3Ws3IBsIwmn30YFBIRxurwmtVZH2LCy0mdqLcnOhWVdyeTCPkrYmbxArZVu0FEhLssTcCF
	Cyz0/G8UnI0Pr1b+8heLrxRVYMOB/hs5q6D
X-Received: by 2002:a05:6122:3a02:b0:5c6:8480:35c8 with SMTP id 71dfb90a1353d-5c981e9762fmr5125257e0c.8.1789406949499;
        Mon, 14 Sep 2026 10:29:09 -0700 (PDT)
Received: from mail-vs2-f21.google.com (mail-vs2-f21.google.com. [74.125.227.21])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-982b9fac504sm12122288241.8.2026.09.14.10.29.09
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 10:29:09 -0700 (PDT)
Received: by mail-vs2-f21.google.com with SMTP id 71dfb90a1353d-5c83397eeeeso1469203e0c.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:29:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwNcIYM/EFtYU3WwtFN5HVWVjxVsphIUCoTTErs33TMmi3NYBWXGgwObp6Qmw3HL2T5PG0b8VhfCBsKL5Q=@vger.kernel.org
X-Received: by 2002:a05:6122:6992:b0:5c8:2c83:9cb with SMTP id
 71dfb90a1353d-5c981abc29cmr5328408e0c.2.1789406948981; Mon, 14 Sep 2026
 10:29:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788943229.git.tommaso.merciai.xr@bp.renesas.com> <0e2d1c3bfad30090784ca52a20f21b001b662527.1788943229.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <0e2d1c3bfad30090784ca52a20f21b001b662527.1788943229.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Sep 2026 19:28:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUJ63Bdwx=+6M-4HhsJuY2sqodh5cpxSMZfWpoUAnEhHQ@mail.gmail.com>
X-Gm-Features: AcwNN1Xc60GOOHQBIk-obYhOrWDLq9jmMnCcKuxJsWOoFFbpr-LREz3rUfzZ1C8
Message-ID: <CAMuHMdUJ63Bdwx=+6M-4HhsJuY2sqodh5cpxSMZfWpoUAnEhHQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] arm64: dts: renesas: r9a08g046: Add USB2.0
 host/phy device nodes
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, biju.das.jz@bp.renesas.com
Cc: tomm.merciai@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tommaso, Biju,

On Wed, 9 Sept 2026 at 10:55, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add USB2.0 device nodes to the RZ/G3L (r9a08g046) SoC DTSI, covering
> the USB PHY controller, OHCI/EHCI host controllers, and USB2 PHYs for
> both ports.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi

> +               usb2_phy0: usb-phy@11e10200 {
> +                       compatible = "renesas,usb2-phy-r9a08g046";
> +                       reg = <0 0x11e10200 0 0x700>;
> +                       interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
> +                                <&cpg CPG_MOD R9A08G046_USB_U2H0_HCLK>;

No clock-names, while other SoCs using the same bindings do have it?

> +                       resets = <&phyrst 0>,
> +                                <&cpg R9A08G046_USB_U2H0_HRESETN>;
> +                       #phy-cells = <1>;
> +                       power-domains = <&cpg>;
> +                       status = "disabled";
> +               };
> +
> +               usb2_phy1: usb-phy@11e90200 {
> +                       compatible = "renesas,usb2-phy-r9a08g046";
> +                       reg = <0 0x11e90200 0 0x700>;
> +                       interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
> +                                <&cpg CPG_MOD R9A08G046_USB_U2H1_HCLK>;

Likewise.

> +                       resets = <&phyrst 1>,
> +                                <&cpg R9A08G046_USB_U2H1_HRESETN>;
> +                       #phy-cells = <1>;
> +                       power-domains = <&cpg>;
> +                       status = "disabled";
> +               };
> +
>                 pcie: pcie@11e40000 {
>                         reg = <0 0x11e40000 0 0x10000>;
>                         ranges = <0x02000000 0 0x30000000 0 0x30000000 0 0x08000000>;

Looks like U2H[01]_INT and U2H[01]_WAKEON_INT are missing,
but they are also not listed in the DT bindings?

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
