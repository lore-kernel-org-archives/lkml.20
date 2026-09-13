Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F94637C0FC;
	Sun, 13 Sep 2026 08:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789289833; cv=none; b=qdbLDcHErGZSwIxAhGfC39kEd5FiOh/sQpaHb+ZilRkrLelQSXKmzuC0AlNAmXr/NIcxgDyb69lcJiQqghzdQDcFfzCyFOpreUTBBWg9V2B5M+0MoI4DntXjLWEM89JgYgZjCqP3FWHdBCdtSwcas/lZOufQOTsvxQZwdeZTHVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789289833; c=relaxed/simple;
	bh=Cy+pmIUtAUcO+P/VwCgO2OhSkR1wrDNRzfKOjaSmFjs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nRsC8gmQHUna3T8QC6V4PphWKv290NG/qlcaPKwME2w91n0EK7ifflx3fttBWhEAv2TNNUSeHg4lbT78mM0Lnv0djhHJOz/eDMsZMGToIsp3WM8Kc7QD77skxQKo+gvCtTjeMNa9t9hApa5fdMXqt7FeftrcQPhGvxQbLOdE8Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bivupdBC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bivupdBC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A41C1F000FF;
	Sun, 13 Sep 2026 08:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789289831;
	bh=1iYZQpYj6ALduOuqAJTduI2u3Vut2aTKr0l8zVHBH5A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bivupdBC/Edl3m1mbbY+hVxRNnNcnTlgJ4eWTlfD1lwJ7BTntcLdzAyBpJfuu2nwT
	 JceUeVFmzjxa59nn+e9EveKjbuZyIIEYYnX52VHShNeaVxA39fdNG19+PMM7eqh/BD
	 qayzvYe8noiW+ZrlGaGRjUiSkk0OvwV/B63m30Cq0J+S1UqgnWvLhRTGhQGCB/bX/l
	 HyZPMJhmufEWAQ6EV7IjH6jl/IEI/fEUqeN5Lwj1jxAkg+X0bOPQ7bPVZllq9YIR5Y
	 wsqj3J4lgA/Op+2iEO1zZpb+PORuVgNK7kZgcln/1lkF2W4T60LFCwgqO+lsL9NdYv
	 JSjVOx/EtRJbQ==
Date: Sun, 13 Sep 2026 10:57:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Judith Mendez <jm@ti.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] nvmem: uniphier-efuse: Add ti,am62p-efuse
 compatible
Message-ID: <20260913-cocky-angelic-cougar-1961db@quoll>
References: <20260910155509.1425682-1-jm@ti.com>
 <20260910155509.1425682-4-jm@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260910155509.1425682-4-jm@ti.com>

On Thu, Sep 10, 2026 at 10:55:09AM -0500, Judith Mendez wrote:
> Add ti,am62p-efuse compatible to uniphier-efuse. Leverage the
> nvmem provider to supply silicon revision information from GP_SW
> efuse registers on AM62p device.
> 
> Signed-off-by: Judith Mendez <jm@ti.com>
> Reviewed-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> ---
> Changes since v2:
> - Add Kunihiko's review tag
> ---
>  drivers/nvmem/uniphier-efuse.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/nvmem/uniphier-efuse.c b/drivers/nvmem/uniphier-efuse.c
> index 85f9372fb97ca..d0953b99d7e18 100644
> --- a/drivers/nvmem/uniphier-efuse.c
> +++ b/drivers/nvmem/uniphier-efuse.c
> @@ -59,6 +59,7 @@ static int uniphier_efuse_probe(struct platform_device *pdev)
>  
>  static const struct of_device_id uniphier_efuse_of_match[] = {
>  	{ .compatible = "socionext,uniphier-efuse",},
> +	{ .compatible = "ti,am62p-efuse",},

Why do you need this change?

Best regards,
Krzysztof

