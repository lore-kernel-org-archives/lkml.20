Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793631255;
	b=0etExiFTs6Kgr1VNtgdDzpQLw93FSM5JWHSMHbAhz7PXJfBdhpP5MSATgw+QylwueQNZ
	 xUd2nCBlns6yR6W+t2pwQ9rTqikrbZ4cEnuG3lmVGgqe96THoexny1f5PQidmZQ84cgRA
	 GKvc2DYFOu28DYXAM6sxSYX9sKb26o62lPIuV2vjFEdoMPZiInGBitDB/7R5kN1umzLRz
	 KNSI8gTk0Jx39O9jpwnzU+i7rmWuOYcsAnT0OB9xf9Xfif/8LrrbI/DOBnLxNy56FEmiR
	 7Rfg2E/FgJKa9prHUcJnjQHhemXoqUx+EZFN1ZpTipeGlp72BJdB9tuG8tXM0/lOnSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793631255;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=9OYNXyiMp/NC0QRIeIQvA61Kb8/WnJv+aMx46NH/CgM=;
	b=2fyYsTyIG1fvM/L6c8ukvz7g011wJ6Hrz/dIVzRKnIkkQkI+pBXaN6C7QaeJT7blSTuB
	 SVQYhLT3ZfkU+hURs5JG+HwgjOuIazA19zNLerJDo1pSHxrIl1LIVcuzu+oSFszWfdgk8
	 PhxngZD7ry6B00VaEPvcd2FVOjWcZARZ1yjjca5V+r0PMbGtRc3yW8gLQUWMcadSVj/EM
	 c8/B6o7iYMdBu7s9ApJ8Ydw3obv4AFe3ZNsDrY8cA4ZvQ3JVjLjOff4dlvNYAUegBWCJd
	 MFXHbXGg+kFzg5HBNTqrjsrsLKhBLpzyA+uv5ZT0y3OLYB66GfZQYVMkJmw7MQI3LMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bn6RzhIh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723196079938
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bn6RzhIh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94B6E1F00A17;
	Mon,  2 Nov 2026 14:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793631250;
	bh=9OYNXyiMp/NC0QRIeIQvA61Kb8/WnJv+aMx46NH/CgM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Bn6RzhIh4hpXuKH7GJzk4gNKkUiQVGCXQtZ1YIOR4tzWUIYftJVzDT3L0tiQlV2qv
	 Z+X//2tzu8B5eG3FLO8Eu9eeRXQEgocpW/1HV0pQIgR5pxyI3KrTVEEsbmWwVjejIg
	 G6OVISi3CRHkSmiyrcaM8j7B8aBFQdzTQ+/35EhJQ4ShcUM+Ff6AGaHUa6WJo8BaWu
	 IcKWos0NV5mvbnmrvdkzF8KPNgqMc4FaJl4XYJS5pAhvCGxXOAaG+JHVoc80NDu2En
	 Cv4SwoO1vFtpueKoDN5+Z2Li5zkVN7JtHPROxO/i2E7sYDCtMs+NP6XQIQKAL+OAi1
	 L3WyPNL7qOKCA==
Date: Mon, 2 Nov 2026 15:54:05 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/10] irqchip/gic-v5: Release ITS MMIO region on DT
 probe failure
Message-ID: <auikDS0RE5E13z8I@red-moon>
References: <20261102-host_gicv5_fixes-v1-0-743b61626fc5@arm.com>
 <20261102-host_gicv5_fixes-v1-10-743b61626fc5@arm.com>
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
In-Reply-To: <20261102-host_gicv5_fixes-v1-10-743b61626fc5@arm.com>

On Mon, Nov 02, 2026 at 01:33:03PM +0000, Sascha Bischoff wrote:
> of_io_request_and_map() reserves the ITS configuration frame region.
> If ITS initialisation fails after mapping it, the error path only
> unmaps the registers and leaves the region reserved.
> 
> Keep the resource description and release the region on that path.
> 
> Fixes: 57d72196dfc85 ("irqchip/gic-v5: Add GICv5 ITS support")
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> ---
>  drivers/irqchip/irq-gic-v5-its.c | 7 +++++++
>  1 file changed, 7 insertions(+)

A minor note on coding style below, other than that:

Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> 
> diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
> index c0f3982229194..91abe63cb5cf9 100644
> --- a/drivers/irqchip/irq-gic-v5-its.c
> +++ b/drivers/irqchip/irq-gic-v5-its.c
> @@ -1188,6 +1188,7 @@ static int __init gicv5_its_init_bases(void __iomem *its_base, struct fwnode_han
>  
>  static int __init gicv5_its_init(struct device_node *node)
>  {
> +	struct resource res;

FIR tree ordering.

https://docs.kernel.org/process/maintainer-tip.html

>  	void __iomem *its_base;
>  	int ret, idx;
>  
> @@ -1197,6 +1198,11 @@ static int __init gicv5_its_init(struct device_node *node)
>  		return -ENODEV;
>  	}
>  
> +	/* Save the region to release if ITS setup fails after mapping it. */
> +	ret = of_address_to_resource(node, idx, &res);
> +	if (ret)
> +		return ret;
> +
>  	its_base = of_io_request_and_map(node, idx, of_node_full_name(node));
>  	if (IS_ERR(its_base)) {
>  		pr_err("%pOF: unable to map GICv5 ITS_CONFIG_FRAME\n", node);
> @@ -1213,6 +1219,7 @@ static int __init gicv5_its_init(struct device_node *node)
>  
>  out_unmap:
>  	iounmap(its_base);
> +	release_mem_region(res.start, resource_size(&res));
>  	return ret;
>  }
>  
> 
> -- 
> 2.34.1
> 
