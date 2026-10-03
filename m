Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC592368D4A;
	Sat,  3 Oct 2026 07:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791013977; cv=none; b=jVXjx6qg+h2IsMJuNz1tqkaM/28LgZActEj8T9G3iOCLZ/OAGlV2MUlrWUpUewO7R1IDm94utvMPEo+/auO4/cmDDHYgn0cJPGlBf+J4L6D/amSuV3guN0qtbInxj+BcA7uWkm5V5KZZqOCHHoO3H4ErWNpqIKEtTz95NwUg+UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791013977; c=relaxed/simple;
	bh=yVcORQ/SI+eD6i2oz/HrJ6jHEXxTk376wKhfDONYQCI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IOevu1R5QxPxGjmBh117JGb5Fqmcr5v7FJyT2YWNPARgay/E1oT38UyVYSUQxqmc+ybyH3JBszlSa15uUofuEQsY+Lo3F7Tv6RX5H7rhfCIqI1sGUd3y03fZV4VxHWOcbsLLpK5GfJq13sbUr5jVYa1M/63LYnmH1uni0RvMTkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jDF/V3yi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jDF/V3yi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAF231F0089C;
	Sat,  3 Oct 2026 07:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791013975;
	bh=SsZuLX1m5zBOGB/eTfR7O04naF7e4Rh6urcz2t1OfiM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jDF/V3yiAeZqLJ+4mM5sdB7kaKvqMGPe6A/ImYmXxZOrgRDv8QMiZBdRhZpDltKtx
	 jiVRJ4RszghdYNtE53sc4ScaSg54p3HdXfKyWldFehfLC3IULNt4la9zWSVhee6dgF
	 jG8TlcLPKLHkg8OuKdNMRIq0uuB7WT/1AtZvCX9XktZjAIW72JfOGCMSmq/He36Yjj
	 FQ3NuM4epnWm+pUuH5YRUrG4dpmjwldOC42i01Qz+/E4wg/5vB7JSnC73tNy5STWGN
	 z2xx4WWpDgclVDjQ0Pul9CoXRPLgM8LFpHGdo0k8wgAm8ivd7ftbV99qnP39b/iWVo
	 QoLi16kLuEdHQ==
Date: Sat, 3 Oct 2026 09:52:52 +0200
From: Vinod Koul <vkoul@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: broonie@kernel.org, alsa-devel@alsa-project.org,
	yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
	Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
	venkataprasad.potturu@amd.com, Syed.SabaKareem@amd.com,
	Mario.Limonciello@amd.com, Richard.Gong@amd.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/9] soundwire: amd: allocate sdw_amd_ctx pdev array
 dynamically
Message-ID: <asC0VC--CaFMJ_ow@parshuram>
References: <20260917090407.3828816-1-Vijendar.Mukunda@amd.com>
 <20260917090407.3828816-4-Vijendar.Mukunda@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917090407.3828816-4-Vijendar.Mukunda@amd.com>

On 17-09-26, 14:32, Vijendar Mukunda wrote:
> Replace the fixed-size pdev[AMD_ACP63_SDW_MAX_MANAGER_COUNT] member of
> struct sdw_amd_ctx with a dynamically allocated pointer array. The array
> is sized by max_manager_count via kcalloc() in sdw_amd_probe_controller()
> and freed on all error paths and in sdw_amd_cleanup().
> 
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> ---
>  drivers/soundwire/amd_init.c      | 12 ++++++++++++
>  include/linux/soundwire/sdw_amd.h |  2 +-
>  2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soundwire/amd_init.c b/drivers/soundwire/amd_init.c
> index 15d117172bdb..94d766b3f8af 100644
> --- a/drivers/soundwire/amd_init.c
> +++ b/drivers/soundwire/amd_init.c
> @@ -62,6 +62,7 @@ static int sdw_amd_cleanup(struct sdw_amd_ctx *ctx)
>  			continue;
>  		platform_device_unregister(ctx->pdev[i]);
>  	}
> +	kfree(ctx->pdev);
>  
>  	return 0;
>  }
> @@ -116,8 +117,16 @@ static struct sdw_amd_ctx *sdw_amd_probe_controller(struct sdw_amd_res *res)
>  
>  	ctx->count = count;
>  	ctx->link_mask = res->link_mask;
> +
> +	ctx->pdev = kcalloc(max_manager_count, sizeof(*ctx->pdev), GFP_KERNEL);

why not use managed api for this?

> +	if (!ctx->pdev) {
> +		kfree(ctx);
> +		return NULL;
> +	}
> +
>  	struct resource *sdw_res __free(kfree) = kzalloc_obj(*sdw_res);
>  	if (!sdw_res) {
> +		kfree(ctx->pdev);
>  		kfree(ctx);
>  		return NULL;
>  	}
> @@ -127,6 +136,7 @@ static struct sdw_amd_ctx *sdw_amd_probe_controller(struct sdw_amd_res *res)
>  
>  	sdw_pdata = kcalloc(max_manager_count, sizeof(*sdw_pdata), GFP_KERNEL);
>  	if (!sdw_pdata) {
> +		kfree(ctx->pdev);
>  		kfree(ctx);
>  		return NULL;
>  	}
> @@ -134,6 +144,7 @@ static struct sdw_amd_ctx *sdw_amd_probe_controller(struct sdw_amd_res *res)
>  	pdevinfo = kcalloc(max_manager_count, sizeof(*pdevinfo), GFP_KERNEL);
>  	if (!pdevinfo) {
>  		kfree(sdw_pdata);
> +		kfree(ctx->pdev);
>  		kfree(ctx);
>  		return NULL;
>  	}
> @@ -171,6 +182,7 @@ static struct sdw_amd_ctx *sdw_amd_probe_controller(struct sdw_amd_res *res)
>  
>  	kfree(pdevinfo);
>  	kfree(sdw_pdata);
> +	kfree(ctx->pdev);
>  	kfree(ctx);
>  	return NULL;
>  }
> diff --git a/include/linux/soundwire/sdw_amd.h b/include/linux/soundwire/sdw_amd.h
> index 40ba84c3b2cc..476de2c30389 100644
> --- a/include/linux/soundwire/sdw_amd.h
> +++ b/include/linux/soundwire/sdw_amd.h
> @@ -139,7 +139,7 @@ struct sdw_amd_acpi_info {
>  struct sdw_amd_ctx {
>  	int count;
>  	u32 link_mask;
> -	struct platform_device *pdev[AMD_ACP63_SDW_MAX_MANAGER_COUNT];
> +	struct platform_device **pdev;
>  	struct sdw_peripherals *peripherals;
>  };
>  
> -- 
> 2.48.1

-- 
~Vinod
