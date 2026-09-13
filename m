Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D734834EF07
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 15:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789314764; cv=none; b=Qhma3kkcQXX05Atwth6dzAwLwJh3qFGfafTtGZA5KnsrQZu3be8XQs48jSDxjqp2QKee6HJ2E2flV/hi3i0L34olOpeSYk6h2IOQj/ESLa5DZYHDS2Iti7A9Vn0XguVoT1R58LZKPIJ6sX3Pq7H2Sa8znfglrsSk9DMMijuiVng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789314764; c=relaxed/simple;
	bh=dg+2Qr+O5bIrEbgfYW8CzPaMnOhuJfox7xoYSIkTiT0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iD5ED4CnWgYVDK24d09MpzCBTKmnYzA9N4jDKiaQWkR2DK6+TuRYLOwohjuEJ/pGsI2J+UaA8bs2aE6X2kvk9Oicp6X4bfAdrshaFwUrn3//G0s/lolpeBXO61MVCuKGLO3dfbeYBNqhqgbJqz8Jsh1+xgNuJAi24MwjzF9QBDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WnMqGFnD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WnMqGFnD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A71F21F008A0
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 15:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789314763;
	bh=J64BL22WjRfKK811Ckzq8S42IJIbfd0VtAbWuMwxY04=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=WnMqGFnDDFnHlfAReCslPgEvYzB1pDtjLj7mEgkFE4I6gUASFAo3u0ckrUZmGhDYy
	 gVlfUH14BrgNT0TBB1QZuuUSZECSYFtL8PlwxDubxicNJqC8iJmDizon+Uu+TBJIpi
	 /od0RWCSuOu8LOZ1NBdk0J8h1lxyyFNow3UG9BnR76uk31HIe8E6qP3J5NRoiOvyxY
	 5CwLbWSP5QIjFZwPFo45DN7Whc5y4vMVOMOLLirjDu1Tm8cGVd5HFosZtORdTZa4Eb
	 VJdKpbNDf9vxhiT0c4ybTOkAuzb1z+WlAagvUZH8WWhZyVflr1YNfyRDJSsT0ZVdE9
	 7YWgaIJ76z8HQ==
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a3156692e3so3873321fa.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 08:52:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwEjDz4eh8Y76F7LeyDBgVCkEO6GdgQOvPxQwVsldr4jSDDumRYqbZZgo6skkXh2TqjNDi+MEJh+WPFiyg=@vger.kernel.org
X-Gm-Message-State: AFuF++npTXnmn6guWZbCGjeUOGoXF5hmQzl+WdU3Pw3n6u4V51UhDPed
	5LUxXaluyD3WNyh5X+rZBzCzc9Jrtect/rulmLtr+C39gCLQ2zOz64JmPpqYIIMw70bGcv/I0Ss
	Fun1Uqc8v3jmjhoiqZJRhpbOKF53g/3k=
X-Received: by 2002:a05:651c:a205:20b0:3a3:61ec:7db5 with SMTP id
 38308e7fff4ca-3a5be1d65e6mr1540031fa.11.1789314761967; Sun, 13 Sep 2026
 08:52:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260905133452.64544-1-hppiscas@163.com>
In-Reply-To: <20260905133452.64544-1-hppiscas@163.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 13 Sep 2026 23:52:28 +0800
X-Gmail-Original-Message-ID: <CAGb2v65mRj72OrcCqXy3-Yo1UFJsLoeEiB0E_JhbYBuj-e182A@mail.gmail.com>
X-Gm-Features: AcwNN1WDCOy2sNndiTJTzu6mT4VBlt5N2NICbAPIS69BxHec14lNArKCHBdII7k
Message-ID: <CAGb2v65mRj72OrcCqXy3-Yo1UFJsLoeEiB0E_JhbYBuj-e182A@mail.gmail.com>
Subject: Re: [PATCH] clk: sunxi-ng: a523: Publish the main CCU module alias
To: "hpp.iscas" <hppiscas@163.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 5, 2026 at 9:35=E2=80=AFPM hpp.iscas <hppiscas@163.com> wrote:
>
> The A523 main CCU driver supports module builds and registers an OF
> match table. The table is not exported, leaving the module without an
> alias for its OF device.
>
> Publish the main CCU table without changing clock initialization.
>
> Fixes: 7cae1e2b5544 ("clk: sunxi-ng: Add support for the A523/T527 CCU PL=
Ls")
> Signed-off-by: hpp.iscas <hppiscas@163.com>

This and the patch author needs to be your actual name. Same for your other
patch.

See Documentation/process/submitting-patches.rst

> ---
>  drivers/clk/sunxi-ng/ccu-sun55i-a523.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c b/drivers/clk/sunxi-n=
g/ccu-sun55i-a523.c
> index 20dad06..d0c4c70 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523.c
> @@ -1685,6 +1685,7 @@ static const struct of_device_id sun55i_a523_ccu_id=
s[] =3D {
>         { .compatible =3D "allwinner,sun55i-a523-ccu" },
>         { }
>  };
> +MODULE_DEVICE_TABLE(of, sun55i_a523_ccu_ids);
>
>  static struct platform_driver sun55i_a523_ccu_driver =3D {
>         .probe  =3D sun55i_a523_ccu_probe,
>
