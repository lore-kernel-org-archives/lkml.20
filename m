Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF184A3F21
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788366029; cv=none; b=PaW9PXRHy60pKPgSishat5wRcZEIf8BvhH+2P0GalOOo0VGuVXnTK1RkPRz8hZ3ifSzY8RA7p8NWeLBV95KeKOhLCRGLin8pVb7FS6+Yg8zYcOggp8a28L6iP7RYF8HWGPJFEFGMWMHUFLNloYT2wgtAwlyeyeThUKxKmRi26Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788366029; c=relaxed/simple;
	bh=G6I21MeRcNKDvGWUGb45NsvcT/Pnsh04t8yZ4XvNhHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hJaZxyjJRSjAulW6JLXX2xR7fronmq0Lvrt7Rb819s3APLeDgHqmD9pShh0w2IuSPJPoamaf06qa90ivElT7822FhOSYYB6ElxUOLGJ9i+x7h4T9cozJmj7V/dh7c0vwbZJpWkTEWUWzkrR4R45FlhbdYETZbGasyIrtpON3wIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lthxi4Os; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lthxi4Os"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so1730903a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 09:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788366026; x=1788970826; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jf3OMAFii79DvFjzmmOgKmfE+xvffqJHuhaGLaLcFJI=;
        b=Lthxi4OsLnOZf+WwE9ZuLQoajt10mkYbNOf5kGkd21KArfEl5mC1yGMXP1wbyDozqd
         HfDDR8S9IA4Boz3sBI4wM2jreNjsxLsjborir4p+dNbp+xGtyz3XgDMENCoSGgV2xQUG
         hjWHELnVKjpmDP7efNfn9j1EoAmTmtgVwWdnvVkHjf5disO9W0tl1FXLvn9Gkty8316e
         vyJcvr5RNrpdqaWDIcWf+Lx3kDkHVBwGHEURmHJw9d5GbwXJ6Zw5RdHN5FlPM/pBYlKv
         rrI/NzRgTQol8VedXEdglrAMLKRBCfEGsFCz8xNKJh1UE7Do2+XuNYx4XffNJqyxdDAw
         ojHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788366026; x=1788970826;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jf3OMAFii79DvFjzmmOgKmfE+xvffqJHuhaGLaLcFJI=;
        b=dwPf2Che6b+bVRlzrgqLZs/N5KDkvZ8fIFRbGX3zwm+odbh0mIiS0LeCK+ZFRPrupr
         avqUuBt1I8RDZEW6030L/m0T+jWSRUc8blZVkNefj0b60MYMmkgaI+VGp9aYxkJgpH9W
         i/AHIR7YxoQA7KNnw0U+AeylVU8+TU70ok47rWAE9CO85AygbtPf9jUQiXQxJ0lUSlQ8
         P0fGIofgcEcoZloGyb8fHq/2rOQ9vvjaWisyjWTBACPqaAI0gp/9LsUOYf1EiC/j3/mp
         D7ZJpx/2+JQiPDZoF/Tj3hp9h8XhPWHwztZvRo5EPjm4HydFbk8z2vrGVs+RUaaqMC9h
         R7Bg==
X-Forwarded-Encrypted: i=1; AKwUvByb9++PEjmtxZKR0BKnYy3+3jivgwQlxQZp2cyo87nCMJdS5aEBbuc8/RKu0frVwyHr134QC2j+JOIjl1E=@vger.kernel.org
X-Gm-Message-State: AFuF++kMcK56b88Int8IgI0N+L4bzY+r/i60s676udlzIsE/8xtWQDO+
	boVI9Qr6w1/HIsnRg4SxEiBTyEDhD0m2yvWDUqditwiJtB3TeuHa5WT0x+mBSiUvKCU=
X-Gm-Gg: AYBFou2zuJtSLIMyj+ArkEP17f3MOlYi1tWWbM9OtzQpQkh1PCxFw4BB7oniyzF1haj
	iaxZgOcSHpPjyMeKTMayHIGmqWUkLMx8e1IErdZzrzjMleQK5PMCfwiFSQr/JN+Av3++okR41z3
	R0uNMU0tWz6WnlYNFxxjsDKaSvf8O8W6ZsSRlscDAFWeuiKs61n4pqRe6yt0RU8NKgOZceLXgMT
	eyd+8SoWn9LbgDRzF0+gHMYIrfjEhRSmn/3aaAC9FnMigioX2B5HsqTDcOo73ZixzRf4InKIjGA
	EHxsz5yxREbJGRm6NUGzXS09iKFyVFveL7LnoYH8cMX63nV9Uk07fcwYGSjEHitWFlw5ARmP2Ln
	iYljnE7p0KCdaWIr1G5SbAmBD0ZIr6Us6SyKgVd7+BfcYoY7+rmgGTViIVHRMNpTZRDi4ZKAV/6
	u2VetlGoF4h2MarwEugrky0MRaqDhAhnrMGWhnFqylCXWu4Y7SxfmojynvMYwVbZsh
X-Received: by 2002:a17:90b:268d:b0:398:ab03:95b2 with SMTP id 98e67ed59e1d1-39aee023191mr10058955a91.10.1788366025577;
        Wed, 02 Sep 2026 09:20:25 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:fff4:86c5:8d86:9e93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b0861e54csm169061a91.10.2026.09.02.09.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 09:20:25 -0700 (PDT)
Date: Wed, 2 Sep 2026 10:20:22 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Marcel Hofmann <marcel@hofmania.de>, peng.fan@nxp.com,
	daniel.baluta@nxp.com
Cc: Bjorn Andersson <andersson@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Marcel Hofmann <marcel.hofmann@ingenics-digital.com>
Subject: Re: [PATCH v2] remoteproc: imx_rproc: allow mappings ending at
 region boundary
Message-ID: <aphMxtTvcvTqgqCm@p14s>
References: <20260827123136.438798-1-marcel@hofmania.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827123136.438798-1-marcel@hofmania.de>

On Thu, Aug 27, 2026 at 02:31:36PM +0200, Marcel Hofmann wrote:
> From: Marcel Hofmann <marcel.hofmann@ingenics-digital.com>
> 
> The address range checks in imx_rproc_da_to_sys() and
> imx_rproc_da_to_va() use a strict comparison for the exclusive end
> address of the requested range.
> 
> As a result, a valid request that ends exactly at the end of an address
> translation or mapped memory region is rejected. For a region
> [start, start + size), a request [addr, addr + len) is contained when:
> 
>     addr >= start && addr + len <= start + size
> 
> This occurs when a loadable ELF segment fills an entire mapped memory
> region. This can be produced by a linker script that extends the
> resource table section to the end of its designated region:
> 
>     .resource_table :
>     {
>       . = ALIGN(8);
>       KEEP(*(.resource_table)) /* Resource table */
>       . = ALIGN(8);
>       . = ORIGIN(m_rsc_tbl) + LENGTH(m_rsc_tbl);
>     } > m_rsc_tbl =0x00
> 
> This produces a ELF program header like:
> 
>     LOAD  0x010000 0xa4220000 0xa4220000 0x01000 0x01000 R   0x1000
> 
> In this case, the segment size matches the mapped region size exactly,
> causing the address translation to fail with:
> 
>     bad phdr da 0xa4220000 mem 0x1000
> 
> Rework the upper-bound checks to allow ranges ending exactly at the region
> boundary while guarding against integer overflow. 
> 
> Fixes: a0ff4aa6f010 ("remoteproc: imx_rproc: add a NXP/Freescale imx_rproc driver")
> Signed-off-by: Marcel Hofmann <marcel.hofmann@ingenics-digital.com>
> ---
> 
> Changes in v2: 
> - Reworked the bounds check to guard against 64-bit integer overflow
> - Use u64 for offset instead of unsigned integer
> - calculate offset first and then validate len against remaining region
>   size
> 
> v1: https://lore.kernel.org/r/20260826155123.AEB731F000E9@smtp.kernel.org/
> 
>  drivers/remoteproc/imx_rproc.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 745ce52cd822..ea852ca143bb 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -540,6 +540,7 @@ static int imx_rproc_da_to_sys(struct imx_rproc *priv, u64 da,
>  	/* parse address translation table */
>  	for (i = 0; i < dcfg->att_size; i++) {
>  		const struct imx_rproc_att *att = &dcfg->att[i];
> +		u64 offset;
>  
>  		/*
>  		 * Ignore entries not belong to current core:
> @@ -552,9 +553,11 @@ static int imx_rproc_da_to_sys(struct imx_rproc *priv, u64 da,
>  				continue;
>  		}
>  
> -		if (da >= att->da && da + len < att->da + att->size) {
> -			unsigned int offset = da - att->da;
> +		if (da < att->da)
> +			continue;
>  
> +		offset = da - att->da;
> +		if (offset <= att->size && len <= att->size - offset) {
>  			*sys = att->sa + offset;
>  			if (is_iomem)
>  				*is_iomem = att->flags & ATT_IOMEM;
> @@ -585,9 +588,14 @@ static void *imx_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *i
>  		return NULL;
>  
>  	for (i = 0; i < IMX_RPROC_MEM_MAX; i++) {
> -		if (sys >= priv->mem[i].sys_addr && sys + len <
> -		    priv->mem[i].sys_addr +  priv->mem[i].size) {
> -			unsigned int offset = sys - priv->mem[i].sys_addr;
> +		u64 offset;
> +
> +		if (sys < priv->mem[i].sys_addr)
> +			continue;
> +
> +		offset = sys - priv->mem[i].sys_addr;
> +		if (offset <= priv->mem[i].size &&
> +		    len <= priv->mem[i].size - offset) {
>  			/* __force to make sparse happy with type conversion */
>  			va = (__force void *)(priv->mem[i].cpu_addr + offset);

This looks sensible.  That said, I would like to see someone on the NXP team
test this patch in different configuration.

Thanks,
Mathieu

>  			break;
> -- 
> 2.55.0
> 
