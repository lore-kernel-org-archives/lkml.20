Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2906C27703;
	Sat, 19 Sep 2026 00:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789776375; cv=none; b=TCOQzfQaEVVBnTCNgwbeDy04ihidnedueYzC0QC5YZzdR9mNufXFkhlOXMf6OPuZe6kEpTWIQyRGPQATwD2vOkOH6J7L4YxILc6Di4QL8ruxHe/eD/cXT2nWNy4/qoJG6z1E6pw61fsXcgQdVvQL1YNHiBuQZg7Jeba2UClmuYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789776375; c=relaxed/simple;
	bh=PZjxDqdtreqBoxW0dc9Qwx0T2try/rmxITdlGAT/wEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lrE8ehJDoLcznNWl8xbBhF1Aozo0ZXU5G7SlaKbgHtugEKkIA9/25LEbbbUP91YV2JzWXg4hXWQO0OeG8NbYInv+HcwkJWRWK55x+Z095fyh31WSgwHvfyUJDz1uGkgXGk4BlJV8QoAN1EMRxpNy+GqKssKmFHDmvj3oHa1lsnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WHt/yal8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WHt/yal8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24DD11F000FF;
	Sat, 19 Sep 2026 00:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789776373;
	bh=K0LdpFbLfSrouSaQWx1WxcGgOL0IJnEb3kf1PZZgOz4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WHt/yal8851lJexzW7Zy1gfBoxenPxj+oanpo5DnIn0n4Oos8HUsmE9MfIR3dsQcE
	 K58rNv0O+N3L7LHXmDecDWZoSAHhDLc+blEDv4Y5Etsr8OmkRFldnxLM5QMgIMV+ve
	 dKErdN+nziQzGs0QVUoYVvCql5PSIY33Gf/GvL2mGdBkAtjUCzj5219XQxBT41xgBk
	 KXjAQiJ/AsVEqAXW9C8IeIGHK1B7BS6FBZRXmfoQiBGktfsYyV5QEk9cJajBXA60AA
	 pBLi29QnIR3q+RwCILttXqBKCWTVLTz9pLrJjWaiJU0nzyM/NYbN3XzaruSGTac8Um
	 u4UEtm1cJDdcA==
Date: Sat, 19 Sep 2026 00:06:11 +0000
From: Yixun Lan <dlan@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>, Guodong Xu <docular.xu@gmail.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	Conor Dooley <conor.dooley@microchip.com>,
	Bo Gan <ganboing@gmail.com>
Subject: Re: [PATCH v3 5/6] irqchip/aclint-sswi: Add support for SpacemiT K3
Message-ID: <20260919000611-GKF297024@kernel.org>
References: <20260918-k3-aclint-v3-0-cf4fd4050e14@pigmoral.tech>
 <20260918-k3-aclint-v3-5-cf4fd4050e14@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260918-k3-aclint-v3-5-cf4fd4050e14@pigmoral.tech>

Hi Thomas Gleixner, Radu Rendec

On 00:29 Fri 18 Sep     , Junhui Liu wrote:
> Add a match entry for the spacemit,k3-aclint-sswi compatible. The K3
> SSWI device requires no special handling and can use the existing
> generic ACLINT SSWI initialization function.
> 
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  drivers/irqchip/irq-aclint-sswi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
Ping irqchip subsystem maintainer, how do you expect to handle this patch?
There are some dependencies between dt-binding, the driver and DTS file..

Would it be ok if I take it together via SpacemiT SoC tree? and probably with
your Acked-by? Thanks

> diff --git a/drivers/irqchip/irq-aclint-sswi.c b/drivers/irqchip/irq-aclint-sswi.c
> index ca06efd86fa1..d3ef2cd3b5c5 100644
> --- a/drivers/irqchip/irq-aclint-sswi.c
> +++ b/drivers/irqchip/irq-aclint-sswi.c
> @@ -179,6 +179,7 @@ static int __init generic_aclint_sswi_early_probe(struct device_node *node,
>  }
>  IRQCHIP_DECLARE(mips_p8700_sswi, "mips,p8700-aclint-sswi", generic_aclint_sswi_early_probe);
>  IRQCHIP_DECLARE(nuclei_ux900_sswi, "nuclei,ux900-aclint-sswi", generic_aclint_sswi_early_probe);
> +IRQCHIP_DECLARE(spacemit_k3_sswi, "spacemit,k3-aclint-sswi", generic_aclint_sswi_early_probe);
>  
>  /* THEAD variant */
>  #define THEAD_C9XX_CSR_SXSTATUS			0x5c0
> 
> -- 
> 2.55.0
> 

-- 
Yixun Lan (dlan)
