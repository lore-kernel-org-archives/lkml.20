Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793628016;
	b=UUY7op6tf8kIZ4mgzs+rWTw1Ctjj/h1fYEAUSfl1R9g8CYKAuw7q+FlIiqj2YtQoE71R
	 kdqH1jiF05EJUeNjboGLbd6KZqcOD0mdDO5uP7oPy5pvRAgyzCnuukAAPk8Z1qCFN5r5N
	 m74++o4xHJcNj3fGg8r8vLSPuj5eu1IlcmI7XFcxLH8S+mGcX2uvgC1wYux+s/UMDF5xm
	 LkDCO0dIeqSar/sVDWX1JmMaGuGuL4dfT+abwniq0hD4jTMnMxsidrUbWutoIX1bNbq7M
	 I0vK9cvNNfkn4TDmKs6Nz9+BoF8CbyOs3ld9xnmPEj4t7N1OuNttrO4pMZBTO6Oaviw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793628016;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=KVOQNq9S8wxiZlJsxhiFCiqyhdxJhzKG+tbD5jT+WoU=;
	b=TvZXP7hinSbjKrc9idz7FTHh8AZAYF8bOYWyw9bNv3+5c7S0VXe9vXHoKwvepPR7zC5x
	 53jmh0aOOFUh383f1aXuqHCp6OlBAC+9G60E/n5/B+itmbL/ErnMIkvw8p2mx3r6+RXOQ
	 NZxt9ng2qfSHMdveor364dDxMhMrVt1qsCkXhPmIvVcyg/0PCl88Juke7TgR+FH+/jpOg
	 fGhVgK/ZBOHkD7jGy+cTljiD/RBaFhn5H/+15JjEB4EiEKvXzhUt+ZUhyE+Kl3cnryVQ4
	 NiQMsaQSQ0Wb5S9VtOPbv6cRcN1/W1txucGcHmo7GSYsGLMfC4LZMi0zIBeUjVJZ/hA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mvqjtEx8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38F8606A33B
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mvqjtEx8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 013BD1F00A16;
	Mon,  2 Nov 2026 14:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793628015;
	bh=KVOQNq9S8wxiZlJsxhiFCiqyhdxJhzKG+tbD5jT+WoU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mvqjtEx8gOhMPSPaJpvzNRVGPMNOMa+DWgnf08V2WGXMsCjLy+F3WSNVYPsS1p1Aa
	 Av2ErcZ2X6SpQWwTEVzzVBezd5uQoeyOYz87Gjevsf+A/ghwCRb0M2YcborupBCHAU
	 MdnkqHd14stqQQfxonHY6bnGcGl0yKnTveZY30nBs2sUMFDQuTka8bk3wMjdZiwAMj
	 FSPMA3F083SuZOs3vGwFQucxWgwc72bi1M+RvOShlZokTWXN1aIF7RWf4+XnW8DVDU
	 I2M+hbve0Cpo7E6nt75vg5zN7cS0o1pLVN9E1W4hDg4v6h15/+m9bcQn7xNA+NtEQt
	 ilXXq11s0N82w==
Date: Mon, 2 Nov 2026 15:00:10 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/10] irqchip/gic-v5: Only set IRS DPS when 1ofN routing
 is supported
Message-ID: <auiXamQ5CbqnfeJd@red-moon>
References: <20261102-host_gicv5_fixes-v1-0-743b61626fc5@arm.com>
 <20261102-host_gicv5_fixes-v1-2-743b61626fc5@arm.com>
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
In-Reply-To: <20261102-host_gicv5_fixes-v1-2-743b61626fc5@arm.com>

On Mon, Nov 02, 2026 at 01:32:55PM +0000, Sascha Bischoff wrote:
> IRS_PE_CR0.DPS is RES0 when the IRS does not support 1ofN routing.
> Read the capability from IRS_IDR0 and skip programming DPS on systems
> without support for 1ofN routing, rather than blindly writing it.
> 
> Fixes: 5cb1b6dab2def ("irqchip/gic-v5: Add GICv5 IRS/SPI support")
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> ---
>  drivers/irqchip/irq-gic-v5-irs.c   | 14 +++++++++-----
>  include/linux/irqchip/arm-gic-v5.h |  1 +
>  2 files changed, 10 insertions(+), 5 deletions(-)

Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>

> diff --git a/drivers/irqchip/irq-gic-v5-irs.c b/drivers/irqchip/irq-gic-v5-irs.c
> index 9d60f474aa4f6..4edf787f3f97f 100644
> --- a/drivers/irqchip/irq-gic-v5-irs.c
> +++ b/drivers/irqchip/irq-gic-v5-irs.c
> @@ -541,12 +541,15 @@ int gicv5_irs_register_cpu(int cpuid)
>  		return -ENXIO;
>  	}
>  
> -	cr0 = FIELD_PREP(GICV5_IRS_PE_CR0_DPS, 0x1);
> -	irs_writel_relaxed(irs_data, cr0, GICV5_IRS_PE_CR0);
> +	/* IRS_PE_CR0.DPS is RES0 when 1ofN routing is unsupported. */
> +	if (gicv5_global_data.one_of_n) {
> +		cr0 = FIELD_PREP(GICV5_IRS_PE_CR0_DPS, 0x1);
> +		irs_writel_relaxed(irs_data, cr0, GICV5_IRS_PE_CR0);
>  
> -	ret = gicv5_irs_wait_for_pe_cr0(irs_data);
> -	if (ret)
> -		return ret;
> +		ret = gicv5_irs_wait_for_pe_cr0(irs_data);
> +		if (ret)
> +			return ret;
> +	}
>  
>  	pr_debug("CPU %d enabled PE IAFFID 0x%x\n", cpuid, iaffid);
>  
> @@ -725,6 +728,7 @@ static int __init gicv5_irs_init(struct gicv5_irs_chip_data *irs_data)
>  	if (list_empty(&irs_nodes)) {
>  		idr = irs_readl_relaxed(irs_data, GICV5_IRS_IDR0);
>  		gicv5_global_data.virt_capable = !!FIELD_GET(GICV5_IRS_IDR0_VIRT, idr);
> +		gicv5_global_data.one_of_n = !!FIELD_GET(GICV5_IRS_IDR0_ONE_N, idr);
>  
>  		idr = irs_readl_relaxed(irs_data, GICV5_IRS_IDR1);
>  		irs_setup_pri_bits(idr);
> diff --git a/include/linux/irqchip/arm-gic-v5.h b/include/linux/irqchip/arm-gic-v5.h
> index 299e75bc95255..34e22e7d4a4c7 100644
> --- a/include/linux/irqchip/arm-gic-v5.h
> +++ b/include/linux/irqchip/arm-gic-v5.h
> @@ -532,6 +532,7 @@ struct gicv5_chip_data {
>  	u8			cpuif_id_bits;
>  	u8			irs_pri_bits;
>  	bool			virt_capable;
> +	bool			one_of_n;
>  	struct {
>  		__le64 *l1ist_addr;
>  		u32 l2_size;
> 
> -- 
> 2.34.1
> 
