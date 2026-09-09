Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959625540AE
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 15:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788967887; cv=none; b=Xf3eSTOtImOfEjlfu3o7WMOmiigvvzo9xZq36pvQ8VL/UvhNyh4D52JJvwYUZdyrSNmIC4sfxMYuA7Y6pgJYww2cIKh0/ikaqU3fe6TId5RK7G87ybWeI6lcOgH5XK2aV4c+PA3e3K6XIgu56d9dtUeCzNRlReuD5dm+L4CW6+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788967887; c=relaxed/simple;
	bh=cWd22r2u/Sd1yN7AwMDP27IBd84axRoEi/2XAth0xWs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tImgmgIuT1dywIs83b6zoP3fc1Pmkn5+m0mz8kUu6frGk9gAw1I0hDZW3CtyuZC0/QOz6UAEZ6mFRGdGRGI1rgkA+uagJQRyH2sPXhK/NCPb/wQg9uM/fHNGydvYb7BZL/bRwA7TvOUwMRwDb2izVJxa0cYnB2qoZXWTQoPn688=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e80579b7dso330705241.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 08:31:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788967884; x=1789572684;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NEpc/1/47AsHfaTxY/tAR9B9xl8xB58wnw6vmMA8FEI=;
        b=DyZkHq9LsdQtJSzaxOQkT5worM/Hnv7R7VUjvx9MXjkQyPshhdCpP2NZBoTMLhfuRB
         TXZlctEWpJKyVg1I9g2nD9ls+2pV1lbsISM7DYjFSrcd4x6/0sleiAA0iOtxOASKDVos
         im2fYG0LCkLdbkNI28UhH4nRx6hnRt9o+Nyeb8SqSt1z1EhZAv+6FGIJYBcCc4ZTbkXx
         sL/1IRV9YOicohY5hGTpa68MHrqFQKla30WvvNtXefDzaO07l31OHahCY/UThsWc8ikj
         B63hXlgEIPH5oO9FRXu8tApTiK4NI6nDBiIrqXEtL0RWORPl8+MzPh2HwZcnwDhViE2i
         6nIw==
X-Forwarded-Encrypted: i=1; AKwUvBwKaoFKh31dkptOECKOyb5sw9Fk4M2bDLNefUGuBDDvbBOAjnQxdbVcCMhk2QoKK9eujk3N6REAQraNssQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kenJ5OzFXkJav5oM1PDG4wQymb/FPSQOuIdQXPcB7d2de4Gf+2
	mbcPWndeczd8HLjeUzI1vUBSonuAL5J+EMVxdx0WqE3OcmE1VnYw5ETnQDzkTppqdy6Y0A==
X-Gm-Gg: AYBFou2iocsY/AgYYV6Sy890jUIm8bDLHnun7UQNKyQAdrU2E5w3NwPZENozgBsBXET
	WCCHZqm35Fg+rrD8/ck4HKhTiB1Mw3iRhqd7N8VDc8DpmbE5prChKSOo/UWkC81h7vlZdXrwHa/
	KXFLDhp+/eE/Qc7cuNVUgWMEQPrxk5MWcLeE8aUvnsmZrmjMkdzhhVSmrmhjb20Vnchf0camwfh
	k6ve41y+Br6ovaSJtl9IHoQRFzgP4odOI1xwAX1BIu9oOBEIF1zNX9mMABVwKPYoYEGFnLEO0zu
	FF8WVCAXJR4uG0Ilw47iqZO8dtAj1GO1HTe/FzvC+OCJNsQEzq5vLsVygDcrQbVwJsOpneQmlLS
	2zBNRC9cvm5kLCYiC9c/i3W8CM9HIpuJo+OvHXgs5JIpYvQZj3bl4aU7u8MRZCecM/5fCDD+k30
	U7eLh0vVC+cA7mHZAnjknof6uOdzAxp33YhcTsZM5qkq5FngAnBuoqx5hqHIJ2iqJerRNKcxQMq
	VuEd/gBagomTYUncR9epDUy5CzBMjXPmyu+nxI=
X-Received: by 2002:a05:6102:3f87:b0:780:7e65:f0ab with SMTP id ada2fe7eead31-78f7380daa6mr2568502137.1.1788967882938;
        Wed, 09 Sep 2026 08:31:22 -0700 (PDT)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com. [74.125.226.204])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808ed1d832sm12518153241.4.2026.09.09.08.31.20
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 08:31:20 -0700 (PDT)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e7c7bc5bfso352209241.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 08:31:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxQBTgNGWyakuBmZEW5ghdz2ssjb1QuSLmAYpmDwBqvtNn9H74FsRuRLhn2lRjVdukBV7FN1bR7lxf4DX8=@vger.kernel.org
X-Received: by 2002:a05:6102:8095:b0:783:f3bf:f9aa with SMTP id
 ada2fe7eead31-78f757d562emr2534584137.8.1788967879800; Wed, 09 Sep 2026
 08:31:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909151423.28358-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260909151423.28358-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Sep 2026 17:31:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVVcbwz1OK9tL9zn5RR_4YyML6++OUVUgmswPpaxdmRSA@mail.gmail.com>
X-Gm-Features: AcwNN1U9fr4mtgt5B_Ox8jzqkFHdJzcqPtQLtvvJUBaj2_brnmaTf7bMLwSgx_8
Message-ID: <CAMuHMdVVcbwz1OK9tL9zn5RR_4YyML6++OUVUgmswPpaxdmRSA@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: sparrow-hawk: Add overlay for
 WaveShare 2CH CANFD HAT
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Wed, 9 Sept 2026 at 17:14, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add a DT overlay to bind the WaveShare 2-Channel Isolated CAN FD
> Expansion HAT on the Retronix R-Car V4H Sparrow Hawk board.
>
> Current device link is at https://www.waveshare.com/2-ch-can-fd-hat.htm
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> V2: - Drop the unique spi controller node identifier
>     - Switch IRQ to active low
>     - Sort compatible and reg properties
>     - Add "CN7 pin 22" comment
>     - Move pwm1 node to the top and add comment
>     - Rename MSIOF0 PFC node

Thanks for the update!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-ws-2ch-canfd.dtso

> +&{/} {
> +       /* Fixed clock dedicated to SPI CAN on 2-CH CAN FD HAT */
> +       clk_can0: clk-ws-2ch-canfd0 {
> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               clock-frequency = <40000000>;
> +       };
> +
> +       clk_can1: clk-ws-2ch-canfd1 {
> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               clock-frequency = <40000000>;
> +       };
> +
> +       /*
> +        * SPI_1 is operated as GPIO SPI, because MSIOF5 can not be
> +        * muxed on the pins allocated for SPI_1 on this CANFD HAT.
> +        */
> +       spi {   /* SPI_1 */

As this lives at the root node, I'd rather change it back to
spi-ws-2ch-canfd while applying, if you don't mind?

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4, with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
