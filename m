Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429EB40BCB2
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 11:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788433792; cv=none; b=gvP6JGngrfCbC1auEzYHxK8vQulQ0iwCcyGBUo2mBQemnSYTSjmNgX3oxdGB8IJVNTbginW7nDAfOrWV8c3pzIV4r/4AHtthElmYYVq3J/lfPaOvNDnofidgwADwPGc2kcfUzzooSGNLuxNW/ET2GEHjO9i+tkxMIfIeBqAEGs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788433792; c=relaxed/simple;
	bh=MvCFVlXRGByOIhRN+Z6i330y3l8bkjq43iP163kFZRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ck0I6eoBfjNnmTLI5jNlDAvqWZ66nghzopue1Tj7lX73SAg0IH2c7qfLsVaJGWwZRJf7iSjSa1h+ogoMA3tp2e39UWYUJsYjZWpnYEisA/D6X+MfnIpBtjxR55wMK9eAtRmEH7BAR2kdY40Jji7mvxTMPfoCTfxGOJd6G+OPuSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PfCn7SWV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PfCn7SWV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E47351F000E9;
	Thu,  3 Sep 2026 11:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788433790;
	bh=RpgQCAYNbZP9siX4KCxyHdbb59bodNXUCqeNa5ZOnPA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PfCn7SWVbDoO2Dv0Gy6DRlybrdxi4rjdOMO6LbPlP8yCsqdhTpyTjKtDeQ8uVwzB/
	 B61P4kHgi5AeKxHJcQ43nUKArsWVPJsPsgZU7Vg7EsP/quPfxJd5SF4fbekmiVi3OG
	 U3PbWyZdqa13tJXhZUMCnl1XweYOZUmgWrBsFDAicfuNGrkvwNfQ6yezqrEYZZxp/7
	 DF2O/VK1J8/QQWU2WEr7iGImUDMAcz2poGHiIN3BG/V2mHZs4kIRpUdmdC0Dks9iXe
	 Zpt2PPONDX0uj6WV+ge53QpqWnfYsPvP6HpvpnIfWEEKN5FTTmSdxLP9A2KLd75dZj
	 Rq0V3VP+p9PFw==
Date: Thu, 3 Sep 2026 13:09:46 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Jiangshan Yi <yijiangshan@kylinos.cn>
Cc: maz@kernel.org, tglx@kernel.org, radu@rendec.net,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	13667453960@163.com
Subject: Re: [PATCH v2] irqchip/gic-v5: Install root IRQ handler last in
 gicv5_init_common()
Message-ID: <aplVev7iGTgUglQS@red-moon>
References: <20260903104014.587068-1-yijiangshan@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903104014.587068-1-yijiangshan@kylinos.cn>

On Thu, Sep 03, 2026 at 06:40:14PM +0800, Jiangshan Yi wrote:
> set_handle_irq() cannot be undone: once a handler is installed, any
> further call returns -EBUSY, so the set_handle_irq(NULL) in the error
> path has never worked.  Drop it, and install the root handler only
> after gicv5_irs_enable() has succeeded.

Thank you.

Yes, that's what I should have done instead of trying to undo a fatal error.

> set_handle_irq() only fails if another root handler is already
> installed, which cannot happen on a GICv5 system.  Should it ever

Nit: define "cannot happen". It should not happen.

> fail, the system is unusable: panic instead of unwinding.

Yes that's what needs to be done instead of trying to fix things up that are
clearly fatal.

Apologies for this churn.

> Link: https://lore.kernel.org/r/87fqzrmywu.wl-maz@kernel.org
> Signed-off-by: Jiangshan Yi <yijiangshan@kylinos.cn>
> ---
>  drivers/irqchip/irq-gic-v5.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)

Reviewed-by: Lorenzo Pieralisi <lpieralisi@kernel.org>

> diff --git a/drivers/irqchip/irq-gic-v5.c b/drivers/irqchip/irq-gic-v5.c
> index ac2d423b1723..c365f8150300 100644
> --- a/drivers/irqchip/irq-gic-v5.c
> +++ b/drivers/irqchip/irq-gic-v5.c
> @@ -1166,21 +1166,18 @@ static int __init gicv5_init_common(struct fwnode_handle *parent_domain)
>  	if (ret)
>  		goto out_int;
>  
> -	ret = set_handle_irq(gicv5_handle_irq);
> +	ret = gicv5_irs_enable();
>  	if (ret)
>  		goto out_int;
>  
> -	ret = gicv5_irs_enable();
> -	if (ret)
> -		goto out_handle;
> +	if (set_handle_irq(gicv5_handle_irq))
> +		panic("GICv5: unable to install root IRQ handler\n");
>  
>  	gicv5_smp_init();
>  
>  	gicv5_irs_its_probe();
>  	return 0;
>  
> -out_handle:
> -	set_handle_irq(NULL);
>  out_int:
>  	gicv5_cpu_disable_interrupts();
>  	gicv5_free_domains();
> -- 
> 2.25.1
> 
