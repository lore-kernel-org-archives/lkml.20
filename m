Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01493556B8C
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 13:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788872689; cv=none; b=oJbPe6F9/crFLmz9g4Idq4pYagt2+wxa8IA9EDWljDFYv/MLPBrQSWhqMc4p97fSWF3oerj9hvB8pO2KivWozVt86yj4qucJTCdNfBEljIzOGNlHVOSc5NSKg/EX/c1AWCJ+krmESNpDC7qukEPZQJHyuON+y9y2zIAGS2NjLLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788872689; c=relaxed/simple;
	bh=QielMTt5kZGRA9qslagGlyuEZEWfmqWZ+CWbXIZJoTA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W8F4uY9/Bi4CJmXPtlb1une7BQNTiaNkapvWgFx5t+V59itHdp5WZJ+PFMYqQsh9awT/Ld+DBnZeS039caYzwl+qrreqrqh9Z5Jv9fUAhfG4LcEcag7MO1bzQmuAsYgOBzvYsbFSIp2cMMwKx+dur6gcgrmG64t57t5Mmo+aen8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5c652293bcdso5054453e0c.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 06:04:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788872687; x=1789477487;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=r5dLsgIsqu5pg0i7fE8t17PFsu5iOt2muwNdqto+9Q0=;
        b=mgZUc0vAJuhpzOrrul4UI9aNosSwhGDYxfmqEoO/N3LQud0SP969ZzZiCFmjsVgbkc
         ewBRHIir6zkLwXlQRmjF9YtcAX7x3oesckF6JtfotPgxO7jfqM1MfS3Vf92Zg7Mjc8q2
         NNAguotX5hv8RH2wh5XcieXTEGc1zJm6N6GYbKyBhdRRtbZkOCfAf/ueMEhvDksfjpMk
         /FZ14wOORjm8Z+uuOVKMK+oR6I+TMMqOtnPBqMu8t6aUfpkTLhFjdA+5KfLYAAFy9OT1
         KbMgjXwz5T7DVKLA+7xn8uGWhaWEuaKSsn93ziodJwzxxtayKDxkqOH66nM8n1ilq1ey
         wzWg==
X-Forwarded-Encrypted: i=1; AKwUvBzu4mCYza31muxA0nB9nC0uZte+5qGlxMy/djDBukgB37KK45GMY1f9Y2qwU38AVjlZidlRh7mQRKIBw5M=@vger.kernel.org
X-Gm-Message-State: AFuF++k6/VtHeZ6p8e1Tl2NhwdDoe0tOWCzq4Tz6iDLtIQe5btfnbLwJ
	qhkU2TWjQkLAy4eVKrfIH8TZXPhyuDscrAVSTq5QdmQtOJFRcWKE7mTVczY8YdvB
X-Gm-Gg: AYBFou3GcZGV+hesu7mS4tBmixq7unLy2K2qSgKFOobscxvRzb718xfdDm6yIJUv0mm
	2E8AKbE9QBgG5olHJSp7kib+VpMphOx7DrrY7t+C+mRlUa3ngV6wSrsOdmA5Je02q61v5jaTqzw
	JOgB26CQBWAeQI8SoKtaFCWLXcGrndWckkcg1wVmVaWuVJOpIaOnN081CNOZAT/RZ+ReKJFu98e
	mXkQbxE4Fv8xofU35FZlH6WHUHczq8j5sYHran4UMEtcTNbaKbFVkEkNiin3Oo2LIGjIyXKHeRR
	4fQYJPw1vEoovJgwU4fHiGrd8gFOxAgHOdsw2fkPWYU/ObAIGxCBYhhEMUGgrQtJSVUg/WZOMeJ
	lQ5VJq2seO0sM2b8R9/M5ud3lOjIJ86r2YRDix0scCZqkTE70rjj5QjXSf4/8P3hgapPVa7Ii6R
	DCBUXJ7/nzDDBnyHcds3wUz+XxeNLjPjGL1Wt8Ac9uplWjpI2gwJ1LjMtABDrlV/i3MoVylchyZ
	3iZBSJmRBuETHXoCYkRpV7erS+U2w==
X-Received: by 2002:a05:6122:792:b0:5c6:6189:c756 with SMTP id 71dfb90a1353d-5c7ed4a07b0mr13843656e0c.2.1788872686666;
        Tue, 08 Sep 2026 06:04:46 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec3b2cb1sm9656487e0c.16.2026.09.08.06.04.42
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 06:04:44 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5c7bf03c4d0so3502634e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 06:04:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxmPRH3T375r+3WTZlShWpKaEaxwV4tJ8/u5n6JwcqNnQrZb3jUedB5hJpOP4xASSv8UGwbJy//rxI4cUA=@vger.kernel.org
X-Received: by 2002:a05:6122:792:b0:5c6:6189:c756 with SMTP id
 71dfb90a1353d-5c7ed4a07b0mr13843335e0c.2.1788872682402; Tue, 08 Sep 2026
 06:04:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826174854.199139-1-biju.das.jz@bp.renesas.com>
 <20260826174854.199139-9-biju.das.jz@bp.renesas.com> <apAS50JiLKRBgKs1@tom-desktop>
In-Reply-To: <apAS50JiLKRBgKs1@tom-desktop>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 15:04:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWucyUMVMWKrQVM=0vq7wYpajbKhQxoOR7B37cakOwx0g@mail.gmail.com>
X-Gm-Features: AcwNN1U_zOQWTR9B9fm6IwJ4cRT-Y5AkSHwVnBmCWdF0OYXdSbkMzmBVZOWCSQE
Message-ID: <CAMuHMdWucyUMVMWKrQVM=0vq7wYpajbKhQxoOR7B37cakOwx0g@mail.gmail.com>
Subject: Re: [PATCH v3 08/13] arm64: dts: renesas: r9a08g046: Add fcpvd node
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Aug 2026 at 12:35, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> On Wed, Aug 26, 2026 at 06:48:42PM +0100, Biju wrote:
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Add fcpvd node to RZ/G3L SoC DTSI.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > v2->v3:
> >  * No change.
> > v1->v2:
> >  * No change.
> > ---
> >  arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> > index 9f5ea62efc2c..ad38aee2efb3 100644
> > --- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> > @@ -696,6 +696,17 @@ ssi3: ssi@100e4c00 {
> >                       status = "disabled";
> >               };
> >
> > +             fcpvd: fcp@10880000 {
> > +                     compatible = "renesas,r9a08g046-fcpvd", "renesas,fcpv";
> > +                     reg = <0 0x10880000 0 0x10000>;
> > +                     clocks = <&cpg CPG_MOD R9A08G046_LCDC_CLK_A>,
> > +                              <&cpg CPG_MOD R9A08G046_LCDC_CLK_P>,
> > +                              <&cpg CPG_MOD R9A08G046_LCDC_CLK_D>;
> > +                     clock-names = "aclk", "pclk", "vclk";
> > +                     resets = <&cpg R9A08G046_LCDC_RESET_N>;
> > +                     power-domains = <&cpg>;
>
> Maybe for consistency with:
>
>         - arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
>         - arch/arm64/boot/dts/renesas/r9a07g044.dtsi
>         - arch/arm64/boot/dts/renesas/r9a07g054.dtsi
>
> You can move reset entry to the latest position.
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
