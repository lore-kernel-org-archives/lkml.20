Received: from mail-yx2-f41.google.com (mail-yx2-f41.google.com [74.125.224.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8D44EB846
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790615201; cv=none; b=YwfbP/xj/8/r4125ob0mUxo3mTvaYEGxzQxrx8ZZumZhCX9/7SnDLSZdiM/FEAjykvuOLqrQlTZ1Kpmz5K8B4VEGSlsb6CmCGL+6bxL/3FozrgdieF0gouxECYfsXiNCidXRuDJ+my/FmUEwTGEJROfgXlDsP3Vbc1jm4dhQ+L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790615201; c=relaxed/simple;
	bh=+hIOk59b2H3pTCZgJaBTE5mJHtyR19kXkDBOZEQc6yM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OijxTEnBiR0fJLB22+FT1cDNmSeuZIbZ4FJnxRUeVA5USbhxep0G9MMMn+rfJGcI9rcWKA/9Vh3eVtZgNR6XMTdQGJayXIlAelH5jtlWvGgbs3gcmpB/iixEBUHQtSm5s8mB0d+qGcX8wnVoqMeTqNJ5ppHWX4xhld3fA6QZNTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.224.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx2-f41.google.com with SMTP id 00721157ae682-8a860e532bbso28682917b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:06:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790615199; x=1791219999;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pwLC5W4u+V0GTSh2RZtGBKpKQq0r57Jm6ZwK/nvUP6s=;
        b=qYz+tstfdA+3JHnbakDWtoyIhCe33GeTvTITpGEU/3Ax6/tl4X+a5SgUYoFTp95kMX
         1BfjF8APBMBJVlcdXu3rY+bYqTNrpjnDY3cyUXf6tQOHdYOWSdcHvkzuQDTKpPjyq+xn
         U0bEcY4ngSPhTm37ClOva+TFR+qDZeBf7A5ts0IdzfYcEC1N6nT4bxvaQxGb3Vj+uiXf
         0QBcxFK9QKP/2ZLY0WHULDoZy5rQUHuiqzPct6Yt3cfTvi9q6BFiIhXv5SnX/AuV9EnJ
         Ffohit85MU96HV2WxQHcrFn8r8CLITTpRaUIhlmENcnzhuBU+1bcDxgMxPH+8T1wid9i
         7BiA==
X-Forwarded-Encrypted: i=1; AKwUvBwfRhBjH9AKQ9wABnaEN3WUwY4ozKRnJXIO8MGaqezdeFM4u3c7Q/IJlUFAJRnpaYV48zpIScfXKfYU7F4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJB6FQw0SNTVeT2PFBbW6EVisD0+56eEKISkKBWKw3/f3YPbLV7
	tmVTYcYjtd1Yie7aKV2swavmYxJ98mAhHLlbOMybq8PFwX9cWWPMDq3j1ILgOUKV2wU=
X-Gm-Gg: AYBFou2iy5Pmy6cZHK6EoeoQfW4CCM1ri15XBbg0Nn/FjqLaSl38n4Hgd4lJDTN950m
	4L8JD4Cx/bFm6jEXU/ZXNXiBtaV7jXMF90WlFJY9QBnMgjNX1A8oYY65wv5AAqGSpLVkOgm90OF
	la9xW0FZmEuddCtbZf9IUxZ1V1j6QrlZBu4vS9rFJfBJwbwNJJEAGjiIgFU8dL+BbyiWTEzVf+l
	bQx9wcWZTajjWcbDUJJ+ccLcXEvGw+jUqNCGdYbUoujTadaA2FdFS094ewwn+MU6kMDYplQ+3E2
	0VIxBRO0Fna7S47iltvB6c2CXXU8QH7CCK1nsPOd4U8EeUq+89EdKdhEu0xaQGlP71k4SVURpdP
	UaeHRnfQNX2hBCJfHC/kqOJ/A3ExaotcngzjWlvIQISzq/6wL1hj6Kro00OtJzrZ73vU5WNogQR
	u9X8pKaLNw6JocFxTSpcDetjV106vsFS00M10Jf8yL4M548UsnUCI2/RwOtBewCAGiajCHTdwbU
	rWjPHmAEBujeSJZSAWYmXWn4ta6q8BGJdVbsQ==
X-Received: by 2002:a05:690c:c4e8:b0:8a8:7fda:15d8 with SMTP id 00721157ae682-8a87fda3529mr34471677b3.1.1790615198715;
        Mon, 28 Sep 2026 10:06:38 -0700 (PDT)
Received: from mail-yx2-f43.google.com (mail-yx2-f43.google.com. [74.125.224.171])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a86108f052sm48042997b3.49.2026.09.28.10.06.34
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 10:06:35 -0700 (PDT)
Received: by mail-yx2-f43.google.com with SMTP id 956f58d0204a3-66e4ab201ebso3176602d50.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:06:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxAZ+wqajrPLBbg58XKq1LIQpl+GBewlNIwmUCri4Wp8M6NZReBdeZTv46uGyCEEzLN4MAV1HbuFfmgQa4=@vger.kernel.org
X-Received: by 2002:a05:6102:1627:b0:7b3:67d6:4d7f with SMTP id
 ada2fe7eead31-7b367d65363mr1527719137.17.1790614816969; Mon, 28 Sep 2026
 10:00:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-rzg2-sr-boards-v9-0-5901e0fc9e44@solid-run.com>
 <20260928-rzg2-sr-boards-v9-8-5901e0fc9e44@solid-run.com> <CAMuHMdUEC9YoZySP3+-UMP0s9XHg4OOsS1Lh65ew2zka=5RC+Q@mail.gmail.com>
 <1a208595-6442-43d3-b1e8-c4f93856a7ea@solid-run.com>
In-Reply-To: <1a208595-6442-43d3-b1e8-c4f93856a7ea@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Sep 2026 19:00:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXAe7U1u69L-O5bvErXN6V3L-=59ewYezcEHcoDodjQpg@mail.gmail.com>
X-Gm-Features: AclHuK_mHVsKKXBL6m4Sk57vt_PCy6cF4ftlcvUQYkzUcI9-oEgY3mVcHJJ2ndQ
Message-ID: <CAMuHMdXAe7U1u69L-O5bvErXN6V3L-=59ewYezcEHcoDodjQpg@mail.gmail.com>
Subject: Re: [PATCH v9 08/11] arm64: dts: renesas: add support for solidrun
 hb-ripple with rzg2l som
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
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Josua,

On Mon, 28 Sept 2026 at 18:21, Josua Mayer <josua@solid-run.com> wrote:
> Am 28.09.26 um 18:10 schrieb Geert Uytterhoeven:
> > On Mon, 28 Sept 2026 at 16:40, Josua Mayer <josua@solid-run.com> wrote:
> >> Add support for the SolidRun HummingBoard Ripple [2] with RZ/G2L
> >> SoM [1].
> >>
> >> The HummingBoard Ripple is a reduced version of HummingBoard Pulse,
> >> featuring:
> >> - 2x USB-2.0 Type-A connector
> >> - 1x 1Gbps RJ45 Ethernet
> >> - micro-HDMI connector
> >> - microSD connector
> >> - mini-PCI-E connector with SIM slot supporting USB-2.0 interface
> >> - MIPI-CSI Camera Connector (not described without specific camera)
> >> - RTC with backup battery
> >>
> >> The carrier board is identical between RZ/G2L, RZ/G2LC, RZ/G2UL and
> >> RZ/V2L SoMs, yet only the RZ/G2LC combination has a product page [2].
> >>
> >> While the variant being supported here is named "Ripple", shared include
> >> files are still named according to the full board for consistency with
> >> schematics, silk screen labels and other SoMs on same board.
> >>
> >> Description for microSD is shared with HummingBoard IIoT.
> >>
> >> [1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2l-som/
> >> [2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2lc-base/
> >>
> >> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >> Signed-off-by: Josua Mayer <josua@solid-run.com>
> > Thanks for the update!
> >
> >> --- /dev/null
> >> +++ b/arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-ripple.dts
> >> @@ -0,0 +1,17 @@
> >> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +/*
> >> + * Copyright 2025 Josua Mayer <josua@solid-run.com>
> >> + */
> >> +
> >> +/dts-v1/;
> >> +
> >> +#include "r9a07g044l2.dtsi"
> >> +#include "rzg2l-sr-som.dtsi"
> >> +#include "rzg2l-hummingboard-ripple.dtsi"
> >> +#include "rzg2l-hummingboard-pulse-micro-hdmi.dtsi"
> > This new include is not needed, as rzg2l-hummingboard-ripple.dtsi
> > already includes it:
> >
> >
> >> --- /dev/null
> >> +++ b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-ripple.dtsi
> >> @@ -0,0 +1,125 @@
> >> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +/*
> >> + * Copyright 2025 Josua Mayer <josua@solid-run.com>
> >> + */
> >> +
> >> +#include "rzg2l-hummingboard-pulse-common.dtsi"
> >> +#include "rzg2l-hummingboard-pulse-micro-hdmi.dtsi"
> > Same for patch [09/11].
> >
> > Patch [10/11] is fine, as that one does not share
> > rzg2l-hummingboard-ripple.dtsi.
> >
> > As the rest LGTM, I can fix that while applying, so no need to send
> > a v10.
>
> Thanks!
>
> Since Sashiko also found a small issue in patch 11/11 ... v10 can still
> be considered.

OK.

> To the includes, I would actually suggest a different solution for the
> duplicate include,
> considering that I got confused about it:
>
> diff --git
> a/arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-ripple.dts
> b/arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-ripple.dts
> index 493a2b9b51d25..95a36f8804b55 100644
> --- a/arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-ripple.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-ripple.dts
> @@ -7,8 +7,9 @@
>
>   #include "r9a07g044l2.dtsi"
>   #include "rzg2l-sr-som.dtsi"
> -#include "rzg2l-hummingboard-ripple.dtsi"
> +#include "rzg2l-hummingboard-pulse-common.dtsi"
>   #include "rzg2l-hummingboard-pulse-micro-hdmi.dtsi"
> +#include "rzg2l-hummingboard-ripple.dtsi"
>
>   / {
>       compatible = "solidrun,rzg2l-hummingboard-ripple",
> "solidrun,rzg2l-sr-som",
> diff --git
> a/arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-ripple.dts
> b/arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-ripple.dts
> index 3df7c67d75a25..0c73871524541 100644
> --- a/arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-ripple.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-ripple.dts
> @@ -7,8 +7,9 @@
>
>   #include "r9a07g054l2.dtsi"
>   #include "rzg2l-sr-som.dtsi"
> -#include "rzg2l-hummingboard-ripple.dtsi"
> +#include "rzg2l-hummingboard-pulse-common.dtsi"
>   #include "rzg2l-hummingboard-pulse-micro-hdmi.dtsi"
> +#include "rzg2l-hummingboard-ripple.dtsi"
>
>   / {
>       compatible = "solidrun,rzv2l-hummingboard-ripple",
> "solidrun,rzv2l-sr-som",
> diff --git a/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-ripple.dtsi
> b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-ripple.dtsi
> index d5bd9b7de4282..aeb92630f4c6b 100644
> --- a/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-ripple.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-ripple.dtsi
> @@ -3,9 +3,6 @@
>    * Copyright 2025 Josua Mayer <josua@solid-run.com>
>    */
>
> -#include "rzg2l-hummingboard-pulse-common.dtsi"
> -#include "rzg2l-hummingboard-pulse-micro-hdmi.dtsi"
> -
>   / {
>       aliases {
>           /* this board does not use second phy / ethernet on SoM */

That sounds good to me, too.

BTW, there seem to be more commonalities that can be factored out of
rzg2l-hummingboard-ripple.dtsi and r9a07g044c2-hummingboard-ripple.dts.
Of course that can be done later, too.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
