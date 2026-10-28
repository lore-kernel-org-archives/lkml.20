Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793198383;
	b=VEtiUuXN2nD7CtHjA2GmHuGB0xIvautATQvxbKR/Y/LoMmtisSxtEZJRkTdmi22umNDH
	 Yu8b/AQyTjogq9PVL7x8xrAQYjkFRe1CIWAQ+XNcfaDbvAGKhmtfF9L1cUt0/lP4najqW
	 WvUhyesnEzI3vH8+ri+1dGjpHnvAhVrZU8pnmWRfBrO2k0XLQMm5/e+XdjS/lhtpjOH1F
	 hds4UMjQW5EIvRKIhk8c0obA7G5zh5Q1WI+YnF5izZ1M87cIqkt4UICvfc/gFP3nZMSLk
	 jE1jjPK8fGKuL6OSlK46fLLrnjzIo8r27EJID7E98ZOSkRnzvj68sYZOMO5Gh69k2HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793198383;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=gABsC7BZjlS5MCYNYA+2CghRrf1sHAMFxNXq81jKOrw=;
	b=tRaIbquR66QAQL4L2uXGHVYbKGywwG78PsVrJ9QstL+lwXnhlLNrURnr+8WDUTYCJsie
	 157piDjk2uAKXOsUhOSMLzM9zLaWQLD8308YNCJ8jSFzpiiJWqrQyBPKNIICGwkJrgBvQ
	 O7CSmkKp5mWeQKpWDlyKrTO09RFeIPe2zWqmt0e9laCA3P9vkSu5M/g9S1tFgQ1JUjBLp
	 6XyD/bgML5F6LUymw99dLGEsCPu/4ZjwH23t/SpJ9J7boO+8kI/jttNG4AuYRKrupMdT/
	 l5IrzoGclZwrv4gMLzqf7/xLUoVGUcNehKJOytPjp21EoTdyLRdGqz92R+rea0SGMZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YjEYGMER;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2E6606A31A;
	Wed, 28 Oct 2026 14:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YjEYGMER
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E63C41F01825;
	Wed, 28 Oct 2026 14:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793198382;
	bh=gABsC7BZjlS5MCYNYA+2CghRrf1sHAMFxNXq81jKOrw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YjEYGMER/jp3keJVKFcS3B2DwmuLsLxjj9HHqmvUj1+VQMMrAO6u67TafN+Sjfs1G
	 ll8uddecuLECDskjKBXWv+bQ1dm3pF9Hu+NbWNguwFOjTx1FPQGLoOakBWbDIPBg0C
	 8/sL/uNxmDncyl6SW7pPv2p6ICciqjQiiOZwXj3fpquJ49B/Jvvtxiv8d/O8482Oer
	 AgW80c4a6KvzDCJx/gCfPXdh/ZX89DynHlSAeshze/D17fx+7o/3QZWZHKodRbCbSc
	 EmnW7jfRjt/Ja5C7DnDPYGUwF7qvLHtZ8wZQqlYVMmnre9IlTMYuiVZvdXepG8i04I
	 j0afpPnlGNlHg==
Date: Wed, 28 Oct 2026 14:39:39 +0000
From: Lee Jones <lee@kernel.org>
To: Jiale Yao <yaojiale02@163.com>
Cc: mfd@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] mfd: tps65010: queue I/O work on freezable workqueue
Message-ID: <20261028143939.GC3605912@google.com>
References: <20261016100503.2581955-1-yaojiale02@163.com>
 <20261016100503.2581955-3-yaojiale02@163.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016100503.2581955-3-yaojiale02@163.com>

On Fri, 16 Oct 2026, Jiale Yao wrote:

> The TPS65010 event worker performs SMBus transfers and can reschedule
> itself to poll the charging state. The power-efficient system workqueue
> is not freezable, so pending work can access an I2C adapter after it has
> been suspended.
> 
> Use the freezable power-efficient workqueue for every scheduling path.
> This preserves the power-efficient behavior while freezing I/O across
> system suspend.
> 
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
> ---
>  drivers/mfd/tps65010.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mfd/tps65010.c b/drivers/mfd/tps65010.c
> index 8a144ec52201..b038d67ff715 100644
> --- a/drivers/mfd/tps65010.c
> +++ b/drivers/mfd/tps65010.c
> @@ -230,7 +230,7 @@ static int dbg_show(struct seq_file *s, void *_)
>  	seq_printf(s, "mask2     %s\n", buf);
>  	/* ignore ackint2 */
>  
> -	queue_delayed_work(system_power_efficient_wq, &tps->work,
> +	queue_delayed_work(system_freezable_power_efficient_wq, &tps->work,
>  			   POWER_POLL_DELAY);
>  
>  	/* VMAIN voltage, enable lowpower, etc */
> @@ -388,7 +388,7 @@ static void tps65010_interrupt(struct tps65010 *tps)
>  			&& (tps->chgstatus & (TPS_CHG_USB|TPS_CHG_AC)))
>  		poll = 1;
>  	if (poll)
> -		queue_delayed_work(system_power_efficient_wq, &tps->work,
> +		queue_delayed_work(system_freezable_power_efficient_wq, &tps->work,
>  				   POWER_POLL_DELAY);
>  
>  	/* also potentially gpio-in rise or fall */
> @@ -436,7 +436,7 @@ static irqreturn_t tps65010_irq(int irq, void *_tps)
>  
>  	disable_irq_nosync(irq);
>  	set_bit(FLAG_IRQ_ENABLE, &tps->flags);
> -	queue_delayed_work(system_power_efficient_wq, &tps->work, 0);
> +	queue_delayed_work(system_freezable_power_efficient_wq, &tps->work, 0);
>  	return IRQ_HANDLED;
>  }
>  
> @@ -694,7 +694,8 @@ int tps65010_set_vbus_draw(unsigned mA)
>  			&& test_and_set_bit(
>  				FLAG_VBUS_CHANGED, &the_tps->flags)) {
>  		/* gadget drivers call this in_irq() */
> -		queue_delayed_work(system_power_efficient_wq, &the_tps->work,
> +		queue_delayed_work(system_freezable_power_efficient_wq,
> +				   &the_tps->work,
>  				   0);

Use 100-chars to prevent this crazy line-wrapping.

>  	}
>  	local_irq_restore(flags);
> @@ -1052,4 +1053,3 @@ static void __exit tps_exit(void)
>  	i2c_del_driver(&tps65010_driver);
>  }
>  module_exit(tps_exit);
> -
> -- 
> 2.34.1
> 

-- 
Lee Jones
