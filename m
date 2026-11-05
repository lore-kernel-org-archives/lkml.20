Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793864285;
	b=dJlf39PkemMXdulpAJeLe3lid/UR06jXTJ4z967CUDzX6Dm+ct47Hpv+g755FLydkiVP
	 WFyMycaSrtgg64dMceNAN8RIKnJrmhIyFBOnDq8DVDlUscPxEB+EnW/w/Fq/SLcVwwfd8
	 GAS2JP7Jtx+BgfToeQhGdtc1IzN8iWVrpmATOPfVLFd+x9EACPB5q6Y4XnOvnBj/YPKG2
	 IcHHjJR38nhVbl9buS/06yyu+F6wXHcYgvk38L05MWLvJc+2R3L9RaHOeZBY0wEQgtEwD
	 rab3YepimuGbjHwxzX1N5KsXfrG6pD+Jx1CoLu95MKEN/s4CYFoQMTEaOWVQyP4/IIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793864285;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=TG1eyQll9htKpm1l6pz9QtWqy0Nr7PBzEnyal9UacVU=;
	b=oK91CMjfLSFuohlZU+j0D0uKO29dl3RYLh/8Hn1cE8leZVPoYIRNzhDNHgUGOvGXUBSm
	 7cPn1CZIHsavcLbKYOa+oMfrCIkoMjlBl2AITDTrvTKQL42Yj2d07IXCIiE/onDyCP/M1
	 MPNwlXYXScBP50dfnlrG7rjc22H9bh31oT/6TSHUHxseKI/VeigGl4+cnXFhXM4ZaqHLl
	 yXN5olgCOmmSsmfPh1ueCiKA0nmfy8SYA5B7BwZUU6uOeb5MKDJCwAQDn2TSGLGn/BQHQ
	 L7qzhdojzQ2qPClRB+n/8pmERcKvawfJTJNskGTwJRilu+wmn7kHzCaifiGyOqZEHdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QfSHTVGc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8028606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 07:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QfSHTVGc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90D0A1F000C1;
	Thu,  5 Nov 2026 07:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793864284;
	bh=TG1eyQll9htKpm1l6pz9QtWqy0Nr7PBzEnyal9UacVU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QfSHTVGcwrQys8RV+6x3At5nZLdDK7XGzGgRHRSu8JWtk8fcy3PA4yCF7uveYwPYD
	 ImifG34ifLN9BxRMKKTAjgZdyiCfbkUvQP5ql/1C/33+Zi1ncYEng4QWnxJf0JXa5L
	 qw0nl+cwTL8lUePSvRKIBnvRzUWN0u9CR7GV55tzleee9tQDeYKoSx/RY+qiwy63zC
	 cf58EcJgLmpbsSc7NkybzCZLbd31V3bV6HVmHWaKfOnS6i2gb6MliyfaeZ2qXnmVkY
	 Haevm1iNN+m9SbjgdfBdMbcebeRQ63uV2XnCUt0LPLtxrdhBqwWWLDWcWi3N7IVLsL
	 iqVkpBK8/wZaw==
Date: Thu, 5 Nov 2026 08:37:59 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 09/10] irqchip/gic-v5: Clean the allocated linear
 device table size
Message-ID: <auwyV6kcrddK1VKf@red-moon>
References: <20261104-host_gicv5_fixes-v2-0-e47ad20ea3c8@arm.com>
 <20261104-host_gicv5_fixes-v2-9-e47ad20ea3c8@arm.com>
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
In-Reply-To: <20261104-host_gicv5_fixes-v2-9-e47ad20ea3c8@arm.com>

On Wed, Nov 04, 2026 at 05:48:03PM +0000, Sascha Bischoff wrote:
> When the linear device table exceeds the kmalloc limit, the driver
> caps the DeviceID width before allocation but keeps the original size
> for cache maintenance. On a noncoherent ITS, this cleans beyond the
> allocated table.
> 
> Recalculate the size after capping the DeviceID width.
> 
> Fixes: 57d72196dfc85 ("irqchip/gic-v5: Add GICv5 ITS support")
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> ---
>  drivers/irqchip/irq-gic-v5-its.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>

> diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
> index 4de07bbdc4923..aebab9f306476 100644
> --- a/drivers/irqchip/irq-gic-v5-its.c
> +++ b/drivers/irqchip/irq-gic-v5-its.c
> @@ -594,14 +594,14 @@ static int gicv5_its_alloc_devtab_linear(struct gicv5_its_chip_data *its,
>  	 * kmalloc limits so that the system can chug along with a linear
>  	 * device table.
>  	 */
> -	sz = BIT_ULL(device_id_bits) * sizeof(*devtab);
> -	if (sz > KMALLOC_MAX_SIZE) {
> -		u8 device_id_cap = ilog2(KMALLOC_MAX_SIZE/sizeof(*devtab));
> +	if (BIT_ULL(device_id_bits) * sizeof(*devtab) > KMALLOC_MAX_SIZE) {
> +		u8 device_id_cap = ilog2(KMALLOC_MAX_SIZE / sizeof(*devtab));
>  
>  		pr_warn("Limiting device ID bits from %u to %u\n",
>  			device_id_bits, device_id_cap);
>  		device_id_bits = device_id_cap;
>  	}
> +	sz = BIT_ULL(device_id_bits) * sizeof(*devtab);
>  
>  	devtab = kcalloc(BIT(device_id_bits), sizeof(*devtab), GFP_KERNEL);
>  	if (!devtab)
> 
> -- 
> 2.34.1
> 
