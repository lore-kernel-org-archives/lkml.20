Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CD7370D41
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 16:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789316373; cv=none; b=Qu82++60dAFfxQ7NvsS/EhmVadny+Isa8wjWWagyunToTmTz7WxPcMIfNEEzGAQEts8zei6KMgRqJplMcPoCsMD5A4HOgunRQyaIiRNbSd0XYvGFJzMpDs0OkB2rbyIHYVh0ASqcjmKkixM1wgveizDVa6/baLt2N1tsuNwclkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789316373; c=relaxed/simple;
	bh=KIR3o+3A1UUmD5skg6L1G6Sxv8CKuaG86LXOpAPQGLc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mnTUIoIB2R1aC7YeY5h3KKLKs20m7aRoc0iKCUIb3NFxlwyk+ZQN89hBANZcGYRA9f6uQhI6Wo+K/2DYCoeGy9cF5o6MKJhGQwJuv9F3hS+04868fKIZT/d1i+VtyQrQHK2VR9Qj1alFWvxGqdSceZyCkGftTXRDQuXj0ouDfv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BrfG23hB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BrfG23hB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C74CB1F0089E
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 16:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789316370;
	bh=Gbr8BsktfR+a1EaDYZ2USzm9WWAfk0q22+veUNOHUVk=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=BrfG23hBES9HcMNEMPteo3eYejy43Wdu2nWC8rXpr52hll/lNlurXrU9mfGSDWgyw
	 W0nTDpy8xyl+bbQ2cQmBm2qR7iZzbTSHhTUaapRVHjyEwpquY/MsEZnUMmJtq3Rmpz
	 /Y6hCsbJM0Z91M2Dh3sBVIWqSbotjcGRTNvhAHYhPm942bcMEZePsQj/SItZWtia+k
	 Lq0tG1Ns5lb0c/f42kgpHYYqxjt7SCFhrxByfFaiFdVcFspEFdR2nUOu8iEnfaaW8o
	 sJLtR1qEV2lT8Asv1Y80p2vb0P31K/L+gnZnnHsWSRGS9XEwYmJtWi4Xm8DRHyfokp
	 ShVJGjTORW/Ug==
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a2ff17443dso16254271fa.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 09:19:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxallhV3iq+/+i875y+TND2VpRrQZNTcVSETBai8ZtZX89JQZizPQKNkR74a7zGNSbv8Und0yA43drdTmo=@vger.kernel.org
X-Gm-Message-State: AFuF++lW13hhMEUm+bKH+AZEo3sTyLUrTvN2qujb7yf/KnRIQ9JIXKCG
	ylfAB8XCYVtj6n2m7Stk0sk7Me5GqAF/q3WPix1ND0ea1IUo/3zIP0WOG59QbBo5IJP3Nuxezsl
	41VZWer2R7Xr//7v0HPZfYmSS4PJDbJk=
X-Received: by 2002:a05:651c:2121:b0:3a5:b187:c7ae with SMTP id
 38308e7fff4ca-3a5b187c8cdmr20143951fa.9.1789316369058; Sun, 13 Sep 2026
 09:19:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906-sunxi-clk-no-p-v1-0-cbde21c9fe69@pigmoral.tech> <178931616050.1372417.13697138134958064084.b4-ty@kernel.org>
In-Reply-To: <178931616050.1372417.13697138134958064084.b4-ty@kernel.org>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 14 Sep 2026 00:19:15 +0800
X-Gmail-Original-Message-ID: <CAGb2v64p7ZoYrK=fpQ+V8ZiLAALqfrtKVtQYdmNq9KGGKnAX6g@mail.gmail.com>
X-Gm-Features: AcwNN1VNp8ZTWcZawmR5nP_tvFoqU5e4dwI7SMu7ihcAACDG16NmdRqwhCQslB8
Message-ID: <CAGb2v64p7ZoYrK=fpQ+V8ZiLAALqfrtKVtQYdmNq9KGGKnAX6g@mail.gmail.com>
Subject: Re: [PATCH 0/4] clk: sunxi-ng: a523: Fix single-divider clocks
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Andre Przywara <andre.przywara@arm.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 12:16=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wro=
te:
>
> On Sun, 06 Sep 2026 15:06:37 +0800, Junhui Liu wrote:
> > Sashiko pointed out two issues in my series adding clock driver support
> > for the Allwinner A733 SoC [1][2].
> >
> > First, ccu_mp_set_rate() generates an invalid mask when an MP clock is
> > defined with a zero-width P divider, clearing unrelated register fields=
.
> > Second, ccu_mp_set_rate() does not handle CCU_FEATURE_UPDATE_BIT, so
> > divider changes are not latched by the hardware.
> >
> > [...]
>
> Applied to sunxi/clk-for-7.4 in sunxi, thanks!
>
> [1/4] clk: sunxi-ng: div: Add feature support to M clock macro
>       https://git.kernel.org/sunxi/linux/c/da543a093f65
> [2/4] clk: sunxi-ng: sun55i-a523-ccu: Use M-only clocks for MBUS, IOMMU a=
nd DRAM
>       https://git.kernel.org/sunxi/linux/c/88735a2ffbea
> [3/4] clk: sunxi-ng: sun55i-a523-ccu: Use P-only clocks for high-speed ti=
mers
>       https://git.kernel.org/sunxi/linux/c/4b41d0ffa9d9
> [4/4] clk: sunxi-ng: sun55i-a523-r-ccu: Use P-only clocks for timers
>       https://git.kernel.org/sunxi/linux/c/b260db91603a

After pushing things out, I realized that I based the topic branch on the
wrong base commit. I rebased things and forced pushed, so the commit hashes
here won't be correct.

Rest assured that things have indeed been merged.

> Best regards,
> --
> Chen-Yu Tsai <wens@kernel.org>
>
>
