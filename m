Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793804825;
	b=fqEPhe2vVxMk9uQgInmORX0ZQANuVp4QheJqsbjMMCeksOwKt5eJG+KVWPGgGHqLsHJ+
	 Z6nHQNIBGIhlIDI5aLecScz/G4h1+zK12L2teh3P4MQZV6GOC6I0YWQFqzXtOXAOF82f+
	 IVRF+zq+/V9X/SviWEXd+RSkyM81YayoT2jpx4JFKEXugiyDHF2YHLaRvrT2ibvArjuyy
	 KssMVP0HheeKXL20mjKkWSDsBbjiggnkylOdxGSu8brQSxYtbTQwCClU8HU0F07CMUTbX
	 bLqaDX5EZbkt8ZTsdGAn1ShLqKWiw3bezCgn9HgL0hAeK02QDA+yd0/8om9SZe2uaSw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793804825;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-Zoho-Virus-Status:
	 X-Zoho-AV-Stamp;
	bh=cZy7ePD4DdIPwF2XQcC5BRW8F/nz7rDC1xt3Cq9n+9w=;
	b=yW08G9cSzvrRcGrvlURvDPl5op0HCceOsSr35RbtJ00GRHQHRhNRHmxA2UJUv8h/gCx5
	 vboVS5Dy2BuX/KJUr4gNcqD1tDM1xo12bdoqkuZcst7tidtMdjm4+CiOi+sGH8fw34Ujd
	 GN1AsfRmpKSP6UHODUloyRXJgUoFd9BQ4VuQCAfYXL5sT1huI5OsLeMuIzGo0e8SiGy/m
	 RWyF4ZQCB+oXWcJ+6M05w3jij00uZ2p5OBs28nzLtZW7bV5Beqv3fjwIdXkNena3iJgnH
	 sB7dGPta/XFe7khatUzQx0z+3hFGreXmJbtMdycGNiX6EYuUTtxsg9rNFUgNAhCfoJg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=be+fQcd4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DC5606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:07:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0DC5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=be+fQcd4
ARC-Seal: i=1; a=rsa-sha256; t=1793804806; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aHAffin/VSM27M+4w9q3BpBRFmAOUuAMVmRLossHQca+AUClmUciZfehrdir37pV1hQzoNndBo7cTce8VwSEg5VIcTiWqZMSSATkh/cGp5pn9dFYKgexu3qmBdfvg+P25JVmVzh8bJaGvgPg+Bn16djZctib+9Hvn/hsyrVoCms=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1793804806; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=cZy7ePD4DdIPwF2XQcC5BRW8F/nz7rDC1xt3Cq9n+9w=; 
	b=M/o9fDNHf0yopV2myiFwCCyArHsq9UJb9SJWxaMmZiOI8orEAMDVwE5VydoIpu27eoqHAuN2wLkNZ0lqprilwdwd2q5BOPhcMrT5rxUbHXlwmQkTsOLZqGT37N8v9MQ24CoBDrQ0SHEVDOaLmETZF8qw7mG6mJr9UuAPScCO7FA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: a=rsa-sha256; b=be+fQcd4lBtrr9la4iC3bK4lg/e68/h0/90+TEs3gLArJLab8XqvH9vAlqmiS9fNnt+YtmPCyCsYYHmHTVY7Jj+wLaJmO0mMMcNB7FCUjPOI6XIVfkOwvYAFSU//qsyG1PUFD/P6bdAK5r/a7r+DqLCg0kCBOS1bUMt/c3C0Ex0=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=cZy7ePD4DdIPwF2XQcC5BRW8F/nz7rDC1xt3Cq9n+9w=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1793804804616951.6136448367613;
	Wed, 4 Nov 2026 07:06:44 -0800 (PST)
Date: Wed, 4 Nov 2026 15:06:40 +0000
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: =?utf-8?B?TWljaGHFgiBLb3BlxIc=?= <michal@nozomi.space>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, 
	Steven Price <steven.price@arm.com>, Rob Herring <robh@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panfrost: Unprepare clocks on system suspend
Message-ID: <autHpRZK-06X0Uu5@sobremesa>
References: <20261003194820.840641-1-michal@nozomi.space>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261003194820.840641-1-michal@nozomi.space>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/293.791.62

Hi Michał,

On 03.10.2026 21:48, Michał Kopeć wrote:
> With GPU_PM_CLK_DIS, system suspend only disables the GPU clocks, which
> leaves them prepared. Some providers power a clock down only in
> unprepare: MediaTek PLLs are switched off in mtk_pll_unprepare(). On
> MT8188 this keeps MFGPLL running through suspend, and TF-A refuses the
> 26 MHz-off state because of it:
> 
>   suspend: bus26m total blocked = 0x40040000
> 
> The SoC then only reaches a shallower sleep state, never signals sleep
> to the EC, and the EC reports a sleep hang and wakes the system.
> 
> Use clk_disable_unprepare() on suspend and clk_prepare_enable() on
> resume. Both run in process context, so preparing is allowed.
> 
> Fixes: 56e76c017918 ("drm/panfrost: Implement ability to turn on/off GPU clocks in suspend")
> Signed-off-by: Michał Kopeć <michal@nozomi.space>
> ---
>  drivers/gpu/drm/panfrost/panfrost_device.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
> index 485349faf2511..3f1a8109a79a4 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
> @@ -507,12 +507,12 @@ static int panfrost_device_resume(struct device *dev)
>  	}
>  
>  	if (pfdev->comp->pm_features & BIT(GPU_PM_CLK_DIS)) {
> -		ret = clk_enable(pfdev->clock);
> +		ret = clk_prepare_enable(pfdev->clock);

My understanding of the clock API is that clk_{prepare|unprepare} are often most costly than
disabling/enabling clocks, so forcing an 'unprepare' at system suspension time for SoCs that
don't have this requirement sounds wasteful. I would say for SoCs where this is a necessity,
add a new feature to 'enum panfrost_gpu_pm' like GPU_PM_CLK_UNP and OR it into its relevant
struct panfrost_compatible. Then, do clk_{prepare|unprepare} in SYSTEM_SLEEP_PM_OPS only
when the feature is set, leaving clk_{enable|disable} as is.

On top of that, would you mind rebasing this onto the latest drm-misc-next? There's been quite
a few panfrost changes wrt to RPM and clock management, so the patch no longer applies.

Cheers,
Adrian

>  		if (ret)
>  			goto err_clk;
>  
>  		if (pfdev->bus_clock) {
> -			ret = clk_enable(pfdev->bus_clock);
> +			ret = clk_prepare_enable(pfdev->bus_clock);
>  			if (ret)
>  				goto err_bus_clk;
>  		}
> @@ -526,10 +526,10 @@ static int panfrost_device_resume(struct device *dev)
>  
>  err_resume:
>  	if (pfdev->comp->pm_features & BIT(GPU_PM_CLK_DIS) && pfdev->bus_clock)
> -		clk_disable(pfdev->bus_clock);
> +		clk_disable_unprepare(pfdev->bus_clock);
>  err_bus_clk:
>  	if (pfdev->comp->pm_features & BIT(GPU_PM_CLK_DIS))
> -		clk_disable(pfdev->clock);
> +		clk_disable_unprepare(pfdev->clock);
>  err_clk:
>  	if (pfdev->comp->pm_features & BIT(GPU_PM_VREG_OFF))
>  		dev_pm_opp_set_opp(dev, NULL);
> @@ -545,11 +545,15 @@ static int panfrost_device_suspend(struct device *dev)
>  	if (ret)
>  		return ret;
>  
> +	/*
> +	 * Unprepare as well: some clock providers, e.g. MediaTek PLLs, only
> +	 * power down in unprepare, and a running GPU PLL blocks system sleep.
> +	 */
>  	if (pfdev->comp->pm_features & BIT(GPU_PM_CLK_DIS)) {
>  		if (pfdev->bus_clock)
> -			clk_disable(pfdev->bus_clock);
> +			clk_disable_unprepare(pfdev->bus_clock);
>  
> -		clk_disable(pfdev->clock);
> +		clk_disable_unprepare(pfdev->clock);
>  	}
>  
>  	if (pfdev->comp->pm_features & BIT(GPU_PM_VREG_OFF))
> 
> base-commit: 70456f05d4b6396b22048c4b8cd3cb98ecf9f9e3
> -- 
> 2.55.0
