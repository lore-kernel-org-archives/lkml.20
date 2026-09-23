Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32EF2E738A
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 21:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790198249; cv=none; b=jgTgHqHts8Sc/9B50gGiRm0cHjl6oHyeSlnUMp7gd7n3ZmcnV3kO6c/3DZd7f5hgvt+cDUKoBLPZt6X+LDl/SUpS6EbPjiO2BepTd/cshA8shGZcOZyCiwRmlfSOqGaMpfITwkHClVxCf0BfhBrg4pg02zvSYzpFn8qZ8Ir+Dj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790198249; c=relaxed/simple;
	bh=LcXuePjtl2W9YsHMLCydrUdYk69iIHGpmbCxJSwqc4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z24+G7eFL8AiIWvJCBkii/+PbuS8X7CHjZ3qk5eHP2XxBXBfa1M3+rQYlrjS5KpuoLZt0GfebLFzCq9I9U0MHmF8FO+IxAtholwliJ5xnocTghwEE6K0gxpdIkVnPRQZhTJRDJGvylqcR049yGxK4AVYFkTHij2tHno72/uJIwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Snx1vjV4; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Snx1vjV4"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccb1a98dso912633a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790198244; x=1790803044; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VOIjs3wmQAgHgZ83QmrBpj8tiZLeHbDXLko9JL+GaUk=;
        b=Snx1vjV4tsum7GCNnFx0467N4WgLp+Blyeo2jnkB0EgaNRrMzZOC3IP2zmfoWiV2CC
         QlwEZ1Nucwl9RQYCUuivB1nkIVBWw5eyBQwGRZpp6WBsZSnj2fQd0g+j0JBYz4d2HRTK
         /9CANf6mucV8flTdWHcwr0jUjuD4mQaydXn0TqmXNVl6nZY1boebVUIXqXKarEHTtW+H
         Q8yo7kJ6AIZyLo1HfhBFPP1aib1klBmL6BSwmAyFshc52iQwP50l9y9AtEVTg9P4Px2D
         /GO6eiWoRnJ+5flzmdTyHl7fGjiAlpMFo6ONbH9UAKpQJBWkhFnFmeUIct3YXeRTwRzh
         gX5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790198244; x=1790803044;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VOIjs3wmQAgHgZ83QmrBpj8tiZLeHbDXLko9JL+GaUk=;
        b=FkyGuxzivZYMIOS+wY9nCDA+C+WlJyEaVYMTR17BmvQ3d6dtATg6wE0d0yRySRsrcM
         vy4hyH00AhAJMjo+QqUDAvQ0zs2tfMnKRchcno2mgUfhGWyBlyNtL2aGC4/F1A76Ye/c
         PrCNkYyNkOBOn8GMi/PVy0t88PUD8L30TKBnuNKmbpiJOPK7DS+J0+//gt7mS7QsTd6y
         Oh5BnnTjaxvkL6Aeiiqfskf6JiT+x3ApKA9ogKEbtLpfOc5DUKC4Ern/DbyxyozFKiLv
         nfkbCYcKdcasmMFSUlTACKvXbHXn75P3CEAPb54BQVFvXJgQn4BET69q6UnPzSGK7JL2
         pzDg==
X-Forwarded-Encrypted: i=1; AKwUvBxPLj1Hpq7aUxjJWhMPBrPmrisMLbC4I7/u26HPVF5MM61xVy95KO2TDz+t3VcHGz386M4F3fQPRBgbEO0=@vger.kernel.org
X-Gm-Message-State: AFuF++k0ZSC2OZGksyrjobDnVcR7HssBacuFi+Bg1o+cVVoObMBXRulq
	IG72Ioy0Qv/Jijj7ZDv1pzOrFuqVxcMoHZ5/beZDILktTspvgVqrcyH2
X-Gm-Gg: AYBFou0P72/zjUsOLsiDLoh8VXem9H7T153ECn2TV/+hU2c3TGtZCIgucuKLdZtSHGm
	Aqk/b8AIPRN1A+Ju8/8JgLyoVRMgRC6iOQYlvwaRCRchwpJbqRma3A4CAKOQoEDx0CTTGoDcwWd
	8QO8xCM6uDpJmXj3rDxSJ8NJha4OhzsVFfdsQgYU2vOvhWVHsVhThGiM72Bt6imcnTOzVbkfkww
	eOEckN4rWsbIk+pRPzsmqSee7z8JMeGViKYGZHjqIOBNox+yVaGC9vozBC1+2KoEgwt00gC9ni4
	Xnku5CEGmMZ9Xoufv2V+BIROIKQ3EdXNXQsKJzZZU2P9v8MlWl72jgqVewgqyo0nIzZ1yH6qC1b
	68zWtugZiCeCCJjTAtX5aWZWBisbYH4I1tjM0V55i4k/VQMDmtAxiRM+AnCtzLc6hdAIOonxGBm
	crqu1aA+fvjolSU0Btaq66PmkMS8NfHrw4nb1c/PCnU7GaPmLgL0d108qKa9wibqcFoIWYA49zQ
	5mWehH2ee4C/c7V/4zRhdI5
X-Received: by 2002:a17:90b:3852:b0:39e:6c6a:656c with SMTP id 98e67ed59e1d1-3a09896a59amr321272a91.47.1790198243551;
        Wed, 23 Sep 2026 14:17:23 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a097663e1dsm884946a91.7.2026.09.23.14.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 14:17:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 23 Sep 2026 14:17:21 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v6 4/8] watchdog: rzv2h: Propagate WDTDCR access errors
Message-ID: <fb5f25b4-33e4-4cb1-b790-3fd078c61e5d@roeck-us.net>
References: <20260923104054.3324830-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260923104054.3324830-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923104054.3324830-5-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Wed, Sep 23, 2026 at 11:40:50AM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> The WDTDCR helpers access the register directly using readl()/writel() and
> therefore cannot report failures to their callers. WDTDCR is located in a
> shared syscon region and will be accessed through regmap in a subsequent
> change, where register accesses can fail.
> 
> Make rzt2h_wdt_wdtdcr_count_start() and rzt2h_wdt_wdtdcr_count_stop()
> return an error so their callers can propagate failures.
> 
> Handle these errors in the watchdog start and stop paths and unwind the
> resources acquired before the WDTDCR access, restoring the reset state.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v5->v6:
> - No change
> 
> v4->v5:
> - Dropped checking rzt2h_wdt_wdtdcr_count_start() return value in
>   restart path.
> 
> v2->v3:
> - New patch, split from v2 patch #1 to make thing easier to review.
> ---
>  drivers/watchdog/rzv2h_wdt.c | 35 ++++++++++++++++++++++++++---------
>  1 file changed, 26 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
> index 9774fe8e441e..a65e5d6c48ad 100644
> --- a/drivers/watchdog/rzv2h_wdt.c
> +++ b/drivers/watchdog/rzv2h_wdt.c
> @@ -87,18 +87,22 @@ static int rzv2h_wdt_ping(struct watchdog_device *wdev)
>  	return 0;
>  }
>  
> -static void rzt2h_wdt_wdtdcr_count_stop(struct rzv2h_wdt_priv *priv)
> +static int rzt2h_wdt_wdtdcr_count_stop(struct rzv2h_wdt_priv *priv)
>  {
>  	u32 reg = readl(priv->wdtdcr + WDTDCR);
>  
>  	writel(reg | WDTDCR_WDTSTOPCTRL, priv->wdtdcr + WDTDCR);
> +
> +	return 0;
>  }
>  
> -static void rzt2h_wdt_wdtdcr_count_start(struct rzv2h_wdt_priv *priv)
> +static int rzt2h_wdt_wdtdcr_count_start(struct rzv2h_wdt_priv *priv)
>  {
>  	u32 reg = readl(priv->wdtdcr + WDTDCR);
>  
>  	writel(reg & ~WDTDCR_WDTSTOPCTRL, priv->wdtdcr + WDTDCR);
> +
> +	return 0;
>  }
>  
>  static void rzv2h_wdt_setup(struct watchdog_device *wdev, u16 wdtcr)
> @@ -148,8 +152,14 @@ static int rzv2h_wdt_start(struct watchdog_device *wdev)
>  	rzv2h_wdt_setup(wdev, of_data->cks_max | WDTCR_RPSS_100 |
>  			WDTCR_RPES_0 | of_data->tops);
>  
> -	if (priv->of_data->wdtdcr)
> -		rzt2h_wdt_wdtdcr_count_start(priv);
> +	if (priv->of_data->wdtdcr) {
> +		ret = rzt2h_wdt_wdtdcr_count_start(priv);
> +		if (ret) {
> +			reset_control_assert(priv->rstc);

It seems to me this does way more than handling the error:
it puts the module into reset and calls pm_runtime_put()
on the parent. This is a substantial functional change
that is not explained.

> +			pm_runtime_put(wdev->parent);
> +			return ret;
> +		}
> +	}
>  
>  	/*
>  	 * Down counting starts after writing the sequence 00h -> FFh to the
> @@ -169,8 +179,13 @@ static int rzv2h_wdt_stop(struct watchdog_device *wdev)
>  	if (ret)
>  		return ret;
>  
> -	if (priv->of_data->wdtdcr)
> -		rzt2h_wdt_wdtdcr_count_stop(priv);
> +	if (priv->of_data->wdtdcr) {
> +		ret = rzt2h_wdt_wdtdcr_count_stop(priv);
> +		if (ret) {
> +			reset_control_deassert(priv->rstc);

Same here, and the logic behind taking the module out of reset
in the stop function and putting it into reset in the start function
isn't obvious to me.

Frankly, I think it would be much better and risk fewer problems
to just ignore the theoretic errors from the regmap functions.

> +			return ret;
> +		}
> +	}
>  
>  	pm_runtime_put_sync(wdev->parent);
>  
> @@ -219,8 +234,10 @@ static int rzv2h_wdt_restart(struct watchdog_device *wdev,
>  	rzv2h_wdt_setup(wdev, priv->of_data->cks_min | WDTCR_RPSS_25 |
>  			WDTCR_RPES_75 | WDTCR_TOPS_1024);
>  
> -	if (priv->of_data->wdtdcr)
> +	if (priv->of_data->wdtdcr) {
> +		/* best effort, ignore ret */
>  		rzt2h_wdt_wdtdcr_count_start(priv);
> +	}
>  
>  	rzv2h_wdt_ping(wdev);
>  
> @@ -251,11 +268,11 @@ static int rzt2h_wdt_wdtdcr_init(struct platform_device *pdev,
>  	if (ret)
>  		return ret;
>  
> -	rzt2h_wdt_wdtdcr_count_stop(priv);
> +	ret = rzt2h_wdt_wdtdcr_count_stop(priv);
>  
>  	pm_runtime_put_sync(&pdev->dev);
>  
> -	return 0;
> +	return ret;
>  }
>  
>  static int rzv2h_wdt_probe(struct platform_device *pdev)
> -- 
> 2.55.0
> 
