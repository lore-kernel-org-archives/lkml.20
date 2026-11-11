Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794356564;
	b=ld9QgBCllPYn8cqquatKwVa0+R7VU8cfmcZqu5xcRo6dudLv8SK/TDPX0xaQeDjkcm8y
	 AqrmwRUxUucIPz/NsAkNil3DBRp+nJ7WrP1HiplPmhVDsm5U3tmOsdulo2FgmyagTSLO2
	 FDdaajyQJFZoStAuvw7SdrUGFCdbPwPG+ooqxH5hBQZmmj3Z7brUsQHRHD4ZAVbELonhy
	 Ue9Eo7Ij/U/npGXw0cCnDA1bj5p98Ne3pYM6PiSpnZOG3WbPR/cbvq7+0MdFsi8zK4WMg
	 ESp3J6RYIwSkSzQrrm56Zcok9sPgWLSvX0YWNCw0Gut5mgYG2w86+NQU9I81GKa61Dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794356564;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:In-Reply-To:References:Date:Message-ID:MIME-Version:
	 Content-Type;
	bh=J4oicOzhhzNrrESdfBNh/uYtU90CfHBxyRHjHAR9JIs=;
	b=Q7e89/8PZrD5A2+UVRg1v09bwI7ZjhOeSup/NZOWF2P7HInImuA3San1F8qJQl/UxzC5
	 tFJBv6MaG5ga89VhGyiU8wxGzZlvoxD0jQN7fNyXfcspyL9T9Zul6xPZ80rwThrUyF3IY
	 Cconbc4BMjNB6W0REEfYSH2+U6hsZ2y0zv1ypA7TPTR3MT5oxkfU3IXXN8azAEQmjb9N8
	 jXGU1xu2WiapXLY2CYYYC5Rce8eD5HZfqF1tCyRNVa+U5StM1oyUstzNaIB6cTZK+dkBd
	 ZN4DJTJR01J5csTAtWinFQfkb6vw7M/744MA60xTmwQyTIMEPXkMGsWtQN4VBfSNoUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=lxrnUnve;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB4B606A325
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:22:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AB4B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=lxrnUnve
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e99b1e5b4cso15531235ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794356562; x=1794961362; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J4oicOzhhzNrrESdfBNh/uYtU90CfHBxyRHjHAR9JIs=;
        b=lxrnUnve40EXWhxMOyVdjBURsLMxnVf+IrFcqYPKBlfev186wtjus+SJLrXb4v0YVc
         NmnyRnJKWo8xscWJZYVQJ+btdwHUB5woeG3IV5dbBkGds6npviMOquM/zWaggTK2wWLq
         dH+50seMF0msvqI0NnS6NIgwYsXKKIWhIUSHlwmSrPMls02uz5Li4es3e/MO944Kkngn
         FEhmP7vV+BYhqN6nyFN7JQXBRitXa0hdrycDrmUXuy8SkcLdREVIO1Yd5Jv0irc78yai
         9lyJOTJyBcigAlXGpT8f67Z+F8FObd2xTsMm1yvnhaNIaWpuNOf5mxeF52UxYXerZ97Y
         lf0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794356562; x=1794961362;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J4oicOzhhzNrrESdfBNh/uYtU90CfHBxyRHjHAR9JIs=;
        b=NiMHNV9EYQUEc44aqAkmqHYu8m6NDDI4jcMiVh3kWL7rkjrN3OKaaqbbAVQYePm4Ck
         k7a76uBgyWez3bBi0Oo1dDqeqrjhfDDEUNExP2SqA/dwsVPjvTSs5AoUnXJgtL6wEvx2
         np7YkbiqrGBoYrmpP1+EUe9sNB/Yzh/KNGkwB93OoKgYyvAOkb2BGjdQ8AlA/OI4IYbl
         ppfsj9aS+hTEGYT7dUZbOiEVkcetEdwKVBUgEyQ6bAmi54nxWYGFwW3I0vVGeRG/kNy9
         v3CLEmNCbh/BQVX8lS7s/2Aenqn9b4urAPaeHbUubsyFSZGUH1AVDdZ1kU4OskwhwCjB
         rxEg==
X-Forwarded-Encrypted: i=1; AL+hErGp2NNh0NQGhPVtW8lFzcGPQWigekGXH3gwAsbTax8P1aXFfLvNcLLa19iL5fiS2Q5z5FWyr6Ajm1Kld4c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xn44ggpSENzwPdW22bWSuPfqL87VDFlR6Ueln9wW6ZJPrwkID
	LPxKb+Jy6Qs/zDRK1nQDKKo0lS6Pm2mykmVQ7zFRZxUMeTPlMfTWVua+JW4g+4n3fwM=
X-Gm-Gg: AYBFou3yhO3htzS6gwjMD7P1tNjhGca5p0hPwZoUKEV/HVwe+KZQt4/s538bdeyrOip
	rTSCRIOv64JdrUN5knlhXp80a/BgbIWq6iJR4xJ/r3UbuQVhUtBQwzYWpcKe+8QiSaqLW004P8y
	xIuBn74AQy6oOUgTWqiqnBn34w+oLbu/+JTTSotQTwLwf6Rcxo76fYMtBLC26MERlovACnMczsI
	OOCHjVeFNzVB7rxEoBW9mDmgklrPSODWlsnm29PWa9T3C3XBPXZcHM844IS3+6DXQNyE9TzVqcX
	GXns5QLN/GlsV4iooFb+zR5OWKfGzyg5vnO3MO2iujhyCuqYYx3m1hCsDFvOz1rRAa49ZiEbO/p
	nhTT3BcV5JFI8Z0kpSTbjxl4l78IAqGyYQAYW08+4jsDlHDGdBAjvAZGAThBX3m0RiYiYRAKG/i
	4USZ2MGpm7x9Y1gkD6clT4Nf4FD3yW0nudKxawYVn5/kBpHOFn3cWq2ivFAsdR3E0GeX+W8aL56
	1HUODWwPfg716wxh4LIrEx/pmi0lbJ/GHtzi3/FqsOrYvm3OilMYq4zDCSZIYxnjesuhAZjUrmG
	tfxO5BGOgk9XD3A+4Z6xsOvT
X-Received: by 2002:a17:903:b47:b0:2e9:3395:cca8 with SMTP id d9443c01a7336-2edd7a4638dmr8404065ad.46.1794356562384;
        Tue, 10 Nov 2026 16:22:42 -0800 (PST)
Received: from localhost ([97.126.173.69])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2edb6a4234csm14094595ad.10.2026.11.10.16.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 16:22:40 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Andreas Kemnade <andreas@kemnade.info>, aaro.koskinen@iki.fi,
 andreas@kemnade.info, rogerq@kernel.org, tony@atomide.com,
 linux@armlinux.org.uk, andi.shyti@kernel.org, thomas.richard@bootlin.com,
 wsa+renesas@sang-engineering.com, linux-arm-kernel@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] ARM: OMAP2+: fix omap_device with noirq_suspend
In-Reply-To: <20261110211531.679943-1-andreas@kemnade.info>
References: <20261110211531.679943-1-andreas@kemnade.info>
Date: Tue, 10 Nov 2026 16:22:39 -0800
Message-ID: <7hwlqktdww.fsf@baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Andreas Kemnade <andreas@kemnade.info> writes:

> Fixes cases where device runtime gets resumed in _suspend but then
> pm_runtime_force_suspend is used.  So the device is disabled, but runtime
> active in _noirq_suspend leading to duplicate runtime_suspend calls. So
> rather check for the device state directly to indicate if changes are
> needed.
> This relies on pm_runtime_force_resume being used in a balanced way.
>
> Fixes: 7da7fd7e66ac9 ("i2c: omap: wakeup the controller during suspend() callback")
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
> This really needs intensive scrutiny but might be a less invasive patch
> solution better suited for stable and paves the way to get out of the
> omap_device theatre without too much hurry.

This looks & feels correct to me.

I also tested this (along with my WIP patch for that NEON count
mismatch) and I have a very stable suspend/resume on OMAP3.

I tested on omap3-beagle (retention) and omap3-beagle-xm (off-mode) and
both are now reliable across multiple suspend/resume sequences with
these two patches.

Reviewed-by: Kevin Hilman <khilman@baylibre.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>

Kevin

>  arch/arm/mach-omap2/omap_device.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/mach-omap2/omap_device.c b/arch/arm/mach-omap2/omap_device.c
> index 77a75b0b9ae69..52afc9089a5a0 100644
> --- a/arch/arm/mach-omap2/omap_device.c
> +++ b/arch/arm/mach-omap2/omap_device.c
> @@ -393,7 +393,7 @@ static int _od_suspend_noirq(struct device *dev)
>  
>  	ret = pm_generic_suspend_noirq(dev);
>  
> -	if (!ret && !pm_runtime_status_suspended(dev)) {
> +	if (!ret && (od->_state == OMAP_DEVICE_STATE_ENABLED)) {
>  		if (pm_generic_runtime_suspend(dev) == 0) {
>  			omap_device_idle(pdev);
>  			od->flags |= OMAP_DEVICE_SUSPENDED;
> -- 
> 2.47.3
