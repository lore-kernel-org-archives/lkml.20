Received: from mail-vs2-f38.google.com (mail-vs2-f38.google.com [74.125.227.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98254E50D5
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790611839; cv=none; b=LA1q9S3z9j+mIvR/4nkZWm2GM/CR9WpTmKPlgyKH2bn/dmuHOptXw4akKzamXuMOB+5Q2u/1kVe5a6Ps3KCbjXL72Nmoh1Un3Ou40BWEWvO8uwXbbfSayIjNOMaZJ+TWDOpracr986F2eGZDMlOKyw/tZSQdr5Us4PRv4bmpcts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790611839; c=relaxed/simple;
	bh=S5jmAjj9EtbV2wtaU3tPzm8z57h4Nf5RYtIBVSwNH7c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WbVkTGiY/Od10+hqY6Pv1xRNcPx/2U6zaxdzt3CRqZ35TYwnRc3v7iGFGIpA7WVVlT6zch4IczcvhEw8WJ8U2uXubuK2gqm/0aqoZDZi8F8KwUfSDzv+lCN1uQSoTsHl193QqRHteNIINQeYq1Ot2kCJlvTtsvnK3+EtuvtOgqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f38.google.com with SMTP id ada2fe7eead31-7b2eb9b9809so1585459137.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:10:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790611836; x=1791216636;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8Q0b6nlsGqU/6knVqqPIUET6/nAm7GVMX2LsazzutA0=;
        b=r2IW3JeJ/jgq87rcZOxn2IzayYB5dlahY3yMsG5OiK2mr8NnqeeO9Yo1NUpQckWOQc
         O/LsudxdpiKvL/wmY/Q2CGH9sQJWrvjxTUgTkt8Wg6MOEYBxxxJRNMucwfqiajxMl65G
         utoIdSwFSXhtdtbRUDIXFijimivGLVCVMitvb1vvWtN5Pw++o+ByBlrrOa6VDsObXgnW
         OET+2hxfwo4zyjtBrAlSOHlqmuwz+lg8TXBXJhRvQpYj7RsFlnk1jCa7BASike+AuaLh
         8Yl/eydDxk+2/jxV3NPwP8AoEwPPH4DT8nvYxMItEWYvnZtoG7eUkSYxwX1MajB4k387
         oECg==
X-Forwarded-Encrypted: i=1; AKwUvBwBV6+GtphvSeyyX2JwoVou+ioPBTpHvQX1ZrAztqKSQC4NbPcIS7hurYY6oYAYxQK6MvbB2j8Or73EkcE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJAKiAH9GUDD9+xZ/lky2lQ2VgbHFeT2yI+yFCIi8FhUjZL5Xdr
	WtXsUuRK1ei2sTX/e2SBDnXzyAqYTdLODZGocJ+kUCFU1VvhrXSk5cA4z5+HnywBG9M=
X-Gm-Gg: AYBFou0Ct3pqyhAttwdd99wlAeKYZLayRhwwSqEpLJQRc0Bk5WdL+kyuf0qahoZfVLL
	gEStnGOUaH60v5oe4rTrL6MK2I8Ixc3KSfWIbnnX1w1VASasOs7RtO1k+DtM2OVvS5U/2MOqEU5
	ydeV0reOkCUiEhnAbf1B5QNGVWXgD8fwITf7js90R0ZllDxyieVvjNdAXGVyZa3CJqSHVX6lIL0
	JmbpjLjB91aDY8rdHQy6u03mI3jPMpmC8aS6LeSM0ONyUpkvhgGUzXgRjLyicIjQjWEnLkrbQN2
	SR4fdj75OpBOv6OWp6lJDqOyg5NnTaR35+FsKfTip971Hm9I93GEq0SOQlx2o5FmFdSoy46TMR6
	tl4MJGdxNIlPw89FdD2DVtSSW4f2vsYd18kmBXdYphBwNBpWLAp06QAWYOiCTm0gnT84ViRiNY5
	dlhz70ZJrG8IbEr56ABlgGNpoVP0WwBZclAVb/WVEbGYE8iZVXpxDY2D1kcgngXaimg1QpO+GMp
	Bb7ey21E9pnD+M2YdsYX5+53oyZ29mThZ/d
X-Received: by 2002:a05:6102:3e96:b0:7aa:a6e5:fc76 with SMTP id ada2fe7eead31-7af1cb9e186mr5153464137.9.1790611836461;
        Mon, 28 Sep 2026 09:10:36 -0700 (PDT)
Received: from mail-vs2-f36.google.com (mail-vs2-f36.google.com. [74.125.227.36])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-988a5453f79sm4767103241.12.2026.09.28.09.10.34
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 09:10:34 -0700 (PDT)
Received: by mail-vs2-f36.google.com with SMTP id ada2fe7eead31-7b47bba7c88so863151137.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:10:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwBNhkm1DeLdVoFUtmYHKik0D3/2CHTwJZwJZ4/QNJUKrjEARXv1nyFYd8oRe4dO8qdCVQ0WtHo+3URYJ8=@vger.kernel.org
X-Received: by 2002:a05:6102:3f46:b0:7a7:19aa:8a89 with SMTP id
 ada2fe7eead31-7af1f2fdbe0mr4785652137.36.1790611833554; Mon, 28 Sep 2026
 09:10:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-rzg2-sr-boards-v9-0-5901e0fc9e44@solid-run.com> <20260928-rzg2-sr-boards-v9-8-5901e0fc9e44@solid-run.com>
In-Reply-To: <20260928-rzg2-sr-boards-v9-8-5901e0fc9e44@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Sep 2026 18:10:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUEC9YoZySP3+-UMP0s9XHg4OOsS1Lh65ew2zka=5RC+Q@mail.gmail.com>
X-Gm-Features: AclHuK-UMUf9NZIHGIv0UWf0z0Dz2lXiorAQQxBHpxwCZfCPbVVPhasZYdlvx6s
Message-ID: <CAMuHMdUEC9YoZySP3+-UMP0s9XHg4OOsS1Lh65ew2zka=5RC+Q@mail.gmail.com>
Subject: Re: [PATCH v9 08/11] arm64: dts: renesas: add support for solidrun
 hb-ripple with rzg2l som
To: Josua Mayer <josua@solid-run.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>, 
	Linus Walleij <linusw@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jon Nettleton <jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Josua,

On Mon, 28 Sept 2026 at 16:40, Josua Mayer <josua@solid-run.com> wrote:
> Add support for the SolidRun HummingBoard Ripple [2] with RZ/G2L
> SoM [1].
>
> The HummingBoard Ripple is a reduced version of HummingBoard Pulse,
> featuring:
> - 2x USB-2.0 Type-A connector
> - 1x 1Gbps RJ45 Ethernet
> - micro-HDMI connector
> - microSD connector
> - mini-PCI-E connector with SIM slot supporting USB-2.0 interface
> - MIPI-CSI Camera Connector (not described without specific camera)
> - RTC with backup battery
>
> The carrier board is identical between RZ/G2L, RZ/G2LC, RZ/G2UL and
> RZ/V2L SoMs, yet only the RZ/G2LC combination has a product page [2].
>
> While the variant being supported here is named "Ripple", shared include
> files are still named according to the full board for consistency with
> schematics, silk screen labels and other SoMs on same board.
>
> Description for microSD is shared with HummingBoard IIoT.
>
> [1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2l-som/
> [2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2lc-base/
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

Thanks for the update!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-ripple.dts
> @@ -0,0 +1,17 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Copyright 2025 Josua Mayer <josua@solid-run.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "r9a07g044l2.dtsi"
> +#include "rzg2l-sr-som.dtsi"
> +#include "rzg2l-hummingboard-ripple.dtsi"
> +#include "rzg2l-hummingboard-pulse-micro-hdmi.dtsi"

This new include is not needed, as rzg2l-hummingboard-ripple.dtsi
already includes it:


> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/rzg2l-hummingboard-ripple.dtsi
> @@ -0,0 +1,125 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Copyright 2025 Josua Mayer <josua@solid-run.com>
> + */
> +
> +#include "rzg2l-hummingboard-pulse-common.dtsi"
> +#include "rzg2l-hummingboard-pulse-micro-hdmi.dtsi"

Same for patch [09/11].

Patch [10/11] is fine, as that one does not share
rzg2l-hummingboard-ripple.dtsi.

As the rest LGTM, I can fix that while applying, so no need to send
a v10.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
