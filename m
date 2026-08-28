Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B45F1E515
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 21:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787951093; cv=none; b=cZnPXI5o8Zi+Smf16JuSRS2Vufx59jQWPa87poWOQcwThOF5yFFAvmcPiduYz28jj78+z4WML7qdmKByyhCful4Ygx6C3bYD1mn4KkgGhTMmrNxy8t+s5ZoJMePreJJMOoox+fFcMqxsg3uL8Dpc3dfMoN9CjFIYTH6Fjm7re/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787951093; c=relaxed/simple;
	bh=sVI8RXn0K5RvKNWQbZO5kfJxnh28wKD18Xti5QpITb4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I4Vhk5TXhrAUavGHf+3CwOMYRdWE8yJMk+Or1743AvdmtGf3F7S3R9DssVAhbK/JrzE+LG289ooI7y4tsHGElUzGpfFHtb9mNaXL3WryX+Kh9fF+Oiunqf2wNKxxn4EAOGSyjIxVBXqj5Bdq9/+cJ2wZpdMo5RsP51Nfxp1fFJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=b7Qohvxg; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="b7Qohvxg"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=tpDd6twHAa/PaS2+jEE2ZYYOFCLJ2dCvpmqY4aoLwr4=; t=1787951092; x=1789160692; 
	b=b7QohvxgxCJC2UjUN9xPsDUx0fJI4NccBEQbTX8CCooDQtTPQIGdnu633G+Z5dEttvPx7/icjD9
	4BsdT/9mTM16x/8nl1zw8iZr115nNFkBAlLUw+WaRIRHETZIy3IOBw7z3E08giqvnjdsh9q5v8nML
	6idzGvmg6xNwBYZN0cYT/0y5uTon8o/KJ1QvLA96EK8Y6bLI544STHfdsMbsiFWTM0H1frYODBw9F
	RamJgM2Nz/ASbAzuvEr8Z5/TY4VpkIJBszmVPYGQk6J1MElxgrvxtWA5tmfzvIj0mqi6dPLi7D4u3
	hw5b1g2GorPEeEkMaLNxjkob+aWbpo1BrPkw==;
Date: Fri, 28 Aug 2026 23:04:45 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner
 <tglx@kernel.org>, "H. Nikolaus Schaller" <hns@goldelico.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clocksource/drivers/timer-ti-dm: Register
 clocksource/event only for am654
Message-ID: <20260828230445.3c2510b9@kemnade.info>
In-Reply-To: <20260828-v7-3-next-topic-ti-timer-dm-clocksource-omap-fix-v1-1-85f0e4dc6f9f@baylibre.com>
References: <20260828-v7-3-next-topic-ti-timer-dm-clocksource-omap-fix-v1-1-85f0e4dc6f9f@baylibre.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 28 Aug 2026 20:47:45 +0200
"Markus Schneider-Pargmann (TI)" <msp@baylibre.com> wrote:

> Registering clocksource/clockevent for the older platforms breaks
> booting them. The older platforms have their own implementation in early
> boot that is used to register clocksource/clockevent in
> timer-ti-dm-systimer.c.
> 
> With am654, the timer is much more complex with more dependencies so
> doing this in early boot with the other driver is very difficult and
> gets ugly. Instead it is implemented in the platform driver for am654.
> However the old platforms may not register clocksource/clockevent in
> this driver as that would break the boot.
> 
> Add a system_timer_capable flag that is only set for am654-timer that
> gates the clocksource/clockevent registration.
> 
> Reported-by: H. Nikolaus Schaller <hns@goldelico.com>
> Closes: https://lore.kernel.org/r/2013A99A-0502-4128-ACFA-B04886224393@goldelico.com
> Fixes: b8eeeca55456 ("clocksource/drivers/timer-ti-dm: Add clocksource support")
> Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>

Tested-by: Andreas Kemnade <andreas@kemnade.info> # OMAP3 GTA04
> ---
>  drivers/clocksource/timer-ti-dm.c          | 4 +++-
>  include/linux/platform_data/dmtimer-omap.h | 2 ++
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clocksource/timer-ti-dm.c b/drivers/clocksource/timer-ti-dm.c
> index 6787acac9a43..ae8777d03215 100644
> --- a/drivers/clocksource/timer-ti-dm.c
> +++ b/drivers/clocksource/timer-ti-dm.c
> @@ -1475,7 +1475,8 @@ static int omap_dm_timer_probe(struct platform_device *pdev)
>  
>  	timer->pdev = pdev;
>  
> -	if (timer->capability & OMAP_TIMER_ALWON && !IS_ERR_OR_NULL(timer->fclk)) {
> +	if (pdata->system_timer_capable &&
> +	    timer->capability & OMAP_TIMER_ALWON && !IS_ERR_OR_NULL(timer->fclk)) {
>  		if (!omap_dm_timer_sched_clock_counter) {
>  			ret = omap_dm_timer_setup_clocksource(timer);
>  			if (ret)
> @@ -1585,6 +1586,7 @@ static const struct dmtimer_platform_data omap3plus_pdata = {
>  
>  static const struct dmtimer_platform_data am6_pdata = {
>  	.timer_ops = &dmtimer_ops,
> +	.system_timer_capable = true,
>  };
>  
>  static const struct of_device_id omap_timer_match[] = {
> diff --git a/include/linux/platform_data/dmtimer-omap.h b/include/linux/platform_data/dmtimer-omap.h
> index 726d89143842..b78ee4676b98 100644
> --- a/include/linux/platform_data/dmtimer-omap.h
> +++ b/include/linux/platform_data/dmtimer-omap.h
> @@ -57,6 +57,8 @@ struct dmtimer_platform_data {
>  	u32 timer_errata;
>  	int (*get_context_loss_count)(struct device *);
>  	const struct omap_dm_timer_ops *timer_ops;
> +	/* always-on timers can be used for clocksource/clockevent */
> +	bool system_timer_capable;
>  };
>  
>  #endif /* __PLATFORM_DATA_DMTIMER_OMAP_H__ */
> 
> ---
> base-commit: e30626823a406725ce29bc75cb8ec467d3e1e326
> change-id: 20260828-v7-3-next-topic-ti-timer-dm-clocksource-omap-fix-418786f115bc
> 
> Best regards,
> --  
> Markus Schneider-Pargmann (TI) <msp@baylibre.com>
> 
> 

