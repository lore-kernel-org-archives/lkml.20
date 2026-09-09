Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03F83EFFA9
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 07:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788939838; cv=none; b=VzMnekTSBCTsJm7XK+bAIKV2F/K0mBH7HazFTJ+FMXnKQSzXPToNCFiBT5RJWr/8BF3HZw4blcZCW2GldaqMOAVw774eh0/dtsPvVLtCsQCwkfQMNEnbJJh0cdjfhEtPT61erpVCEgG9WB+7rSc2EEtA0QQx/FrDlhORXojGRTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788939838; c=relaxed/simple;
	bh=9yc14kv9vv0ac8fv1uYJcHFWFcqHf9NP7Ogx1611OGE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dEWjpVqb/y9x+NKkAVJt62iU1JK1pyi+hMhJIesZx6fCmZsu0w/MP0sGQx8jhcs7ZtzTb5x5C/gAE0/0xVr4/fDh1C6WJdjY5fG7wOVx6OxFypjOw0TBCUxc8PcClFR0M5nKqK5RuUY9GUP707NVRHVli6itRbxi9I55gIf0FWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a0794669a6so8321709a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 00:43:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788939835; x=1789544635;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2rInCUUC/UXiPpHJ1CPYpbMNMz1oCA9yxKCwNhHDaNM=;
        b=mAHzg3KjENBWYz2GX25758ioGkN7mDz94GN3Uo823NWyoTw+xGZjV6s/szmCk62ThC
         KpNcqjqXHF6KlMI3T5dEZLNQP8iXwUtHF5jxG3FeiSbYySWaoG3BjNZAnvXKXvLQfZEo
         fW+4/2sINg6pcDuY1YGDBdcNejH1dzUMZJgCjHdulqvcnYsa5PE6GbXAPRW4Gsd0m8HJ
         g7uggSPLXzvs2D5H5VCRwq8eHc7uYVaPjn7EANv2UQX2Hl+t+Hwg3cWgeRiODoaqlLXT
         baqvXIGHzq9nG0g2mE215p8e3GJySNDHmLfhcChpuVjTsCx8ucwJQnvWe6wqE0ZmjleT
         LMiw==
X-Forwarded-Encrypted: i=1; AKwUvBwUcpJ3IGMhrPeS2/d7WI5Tajt9R32RtfQDpkn0d1800Q9Ux3gwpcDvelprUMDPack+plOlJxTtzBag1Ww=@vger.kernel.org
X-Gm-Message-State: AFuF++nuTdV9wzDE0C8UwkIcZf8dWh1mnaRLWr0MDwkLQHofoWDH9lFL
	nxynx2ZRQjikLfjtFYTXzndn4hJ4VKPC9nOsuOSigRQRK2s7xgXQseCj5CGRomHCKLI=
X-Gm-Gg: AYBFou3xwVsIW0xQGzWeEFVlDI8lMefza3kTykwuCxdR0mO1NidV45Llc9JHXiztGXF
	7qblj/izxEOW+Y5OuS7q8vCmp3wEvF7sy3KrCplyb8oy4ERPcyDGVmDWGrV9DkKoL4aatwYA1j+
	TKUuVnpbb75p35P2ZPiGYCfTPJ67ANjgPVI3UzhE4LO2VRdZ+03GZpVPh1DdCoTbCtQgnhWtsEV
	2CV0UXLfnRgkha4vCK3YaAx2nPTzA8yv71afWM/WysSr5lgnyqa/GHtJZ1jaWus1M0cIQek2/j7
	g16k56VmWwcdj34LAt7bAGFFSQ5F5KEY4jogqiPHun3IH1j6Ww+d7xeCL5BmUwNBUwWOxeH5RHe
	82x8fRGz2g9fV+CVoYT0HdF7/Ev7FAIdt+22jSjvHNpY55OMR8XoP3deF8aUvUZn5XCJIb5ga37
	oi7D+r1ZBCyDimWkRKmx1N3gGPpYB1VR6aDdqaoEGed29H1YJgsiSI1ij4tI+ocgEWXMFyY5V5F
	0KS6kXe8b9QMhsE/Jumzo6apeYVrs1OEYbt
X-Received: by 2002:a05:6402:915:b0:6a9:93c7:ca57 with SMTP id 4fb4d7f45d1cf-6a993c7cbebmr815159a12.22.1788939834945;
        Wed, 09 Sep 2026 00:43:54 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a993d6611asm382326a12.25.2026.09.09.00.43.48
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 00:43:53 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a18e24ad25so7121225a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 00:43:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzXhjQnSjQxXM+WTr09elM8stMOIzgsQhKBsFJXMv+ScS/z6UCgvJcosQ1l+d/7MMVh5km3887z8wUgeJ4=@vger.kernel.org
X-Received: by 2002:a05:6402:f05:b0:6a8:e223:fee3 with SMTP id
 4fb4d7f45d1cf-6a8e223ff92mr2011006a12.43.1788939828389; Wed, 09 Sep 2026
 00:43:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826174854.199139-1-biju.das.jz@bp.renesas.com>
 <20260826174854.199139-14-biju.das.jz@bp.renesas.com> <CAMuHMdWKpWtp6dXe_1qk+GuV-n065LjHNQBGGEfsOfVz9_T1+w@mail.gmail.com>
 <TY3PR01MB113466B5A606D636420D7BD5586B02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB113466B5A606D636420D7BD5586B02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Sep 2026 09:43:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWQAAugUtYNgkKrY=TFZbiAa61=jBg_fj__L+hRUBCR_A@mail.gmail.com>
X-Gm-Features: AcwNN1UM-4yUAnjvwz3HU9UugHpIoEhFheoRD6Ksts2TAyZGkKbX5f7QzfQ8BYQ
Message-ID: <CAMuHMdWQAAugUtYNgkKrY=TFZbiAa61=jBg_fj__L+hRUBCR_A@mail.gmail.com>
Subject: Re: [PATCH v3 13/13] arm64: dts: renesas: Add LVDS overlay for RZ/G3L
 SMARC EVK with ITE6263
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "biju.das.au" <biju.das.au@gmail.com>, "magnus.damm" <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Wed, 9 Sept 2026 at 04:57, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Wed, 26 Aug 2026 at 19:49, Biju <biju.das.au@gmail.com> wrote:
> > > Add a Device Tree overlay (r9a08g046l48-smarc-lvds-ite6263.dtso) for
> > > the RZ/G3L (R9A08G046) SMARC EVK board to support LVDS-to-HDMI output
> > > via the ITE 6263 HDMI transmitter.
> > >
> > > The overlay enables the LVDS controller and the display unit
> > > (DU/LCDC), and configures the ITE6263 on I2C2.
> > >
> > > Update the Makefile to build the overlay as both a standalone .dtbo
> > > and a composite .dtb (base DTB + overlay).
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc-lvds-ite6263.dtso

> > > +&{/} {
> > > +       lvds-to-hdmi-out {
> > > +               compatible = "hdmi-connector";
> > > +               type = "d";
> > > +
> > > +               port {
> > > +                       lvds_to_hdmi_con_out: endpoint {
> > > +                               remote-endpoint = <&it6263_out>;
> > > +                       };
> > > +               };
> >
> > No DDC?
>
> The driver uses parent i2c bus as ddc-i2c-bus. That is the reason not added.

Neat trick. Do you know where that is handled? I couldn't find it.

> > > +       it6263: it6263@4c {
> >
> > hdmi@4c
> Ok.
>
> >
> > > +               compatible = "ite,it6263";
> > > +               reg = <0x4c>;
> > > +               data-mapping = "vesa-24";
> > > +               ivdd-supply = <&reg_1v8>;
> > > +               ovdd-supply = <&reg_3v3>;
> > > +               txavcc18-supply = <&reg_1v8>;
> > > +               txavcc33-supply = <&reg_3v3>;
> > > +               pvcc1-supply = <&reg_1v8>;
> > > +               pvcc2-supply = <&reg_1v8>;
> > > +               avcc-supply = <&reg_3v3>;
> > > +               anvdd-supply = <&reg_1v8>;
> > > +               apvdd-supply = <&reg_1v8>;
> > > +
> > > +               ports {
> > > +                       #address-cells = <1>;
> > > +                       #size-cells = <0>;
> > > +
> > > +                       port@0 {
> > > +                               reg = <0>;
> > > +                               bridge_in: endpoint {
> > > +                                       remote-endpoint = <&lvds_out>;
> > > +                               };
> > > +                       };
> > > +
> > > +                       port@2 {
> > > +                               reg = <2>;
> > > +                               it6263_out: endpoint {
> > > +                                       remote-endpoint = <&lvds_to_hdmi_con_out>;
> > > +                               };
> > > +                       };
> > > +               };
> >
> > No audio?
>
> Binding describes audio port, but ITE6263 driver supports only video mode compared to
> both Audio/Video support on ADV7535 driver.
>
> I will add audio entries once we have driver support.
> Hope it is ok for you?

That's fine, thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
