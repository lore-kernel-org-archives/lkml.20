Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793629285;
	b=RwZAiZGRCd/mlIt6bjXMp8iuvotAK/DcVR2zA55IWMvUyKy2a8fSjzVupcgfvj65csPH
	 +RuGqFHzUYTtVKgi7Ei6Z+vf9+EsE/KM7NU6ZF7bXPuR3W6NGOtS5HLNmXUlFPR3wAw7Y
	 TCpHyh4y8w1PC2SbfDW3JOZXTxRXBvhkctmoemuhoxVEKtQ6CmXE6ItpuxMXjBPmn/r6T
	 orL4U3EHGeRNxIZ4g+9ZOJaiXMhlOHenKijx5lOIxbdDYLSHjU1ADbMxCvi3MVQOmafMp
	 5zeChcC9ne5uO7z/nDCM92SpAovOwcaPSq1KzhO45CRg3R5IRZrZdbLLNHeqEDt7kDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793629285;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=3ji/RNZ20nE8AsnN9V5/uNaOxgK+7G8URWli+zWVq9U=;
	b=jtgsonD91jw4Ht5sHXQ0PjYkJMVFsFE74IQQlZthD1fCIsFUUBC2VguymmwmxrWRop4A
	 tRm6SYIYk61wg8AX9e285QnHj47MjV3N49gYOiJ3VBU3Q7RnKEgKGYchevCe8LPq/Rxna
	 k0Igcj8poZ4ryy+paSMTtPMLH6jsjxRtJPTuYD7U4mkt7xukDcAPQ0ggEwGkYpDdfmYiR
	 +PWgxjLlR8tqPVqqImi1tTeVUbK6GOynE3YDEBwLc5rkg8BAW8ShdFtqwam1x4EAcE9g8
	 /oW4pPkrx2n2Ezc4OJfwhGTCs8e3hTTdsepEEQ/jn1TykEUPIul7dPKAZYkkWZ1/GNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LUEEU0Sr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB6A606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LUEEU0Sr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EFCA1F00A16;
	Mon,  2 Nov 2026 14:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793629285;
	bh=3ji/RNZ20nE8AsnN9V5/uNaOxgK+7G8URWli+zWVq9U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LUEEU0SrMHB7u0ZvtA93nNY42eOtOHb3WX3BbLZoRHvNvBx292gRAva8d9GNgsptO
	 TEzZJ5z1C2YaMBGM9VqT9uQpB5SrOYMISBLKpPhJbpMX80VgV4V+42wws+eZ9Ey5Zw
	 x5TnStOA9Pws5s7iWVxcLpNcWRH0kZPnh0hKJYRkmTvA58N/VMTNenAjP4CgaUDQIu
	 CbnJVzZ7EsLletxKR7MkWdgEXxZR7z5aAOr26izK4z5L4vjRwsk3XTccZ6E7BTfMHZ
	 rQj7TCf3+TnchGQBe+0sdwQ42YXQKuJyLL9ll1qr0fcIuxe7gQu8HkivB48JN6AHKs
	 8JKi1gizLlUgA==
Date: Mon, 2 Nov 2026 15:21:20 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/10] irqchip/gic-v5: Use firmware node name in ITS
 warning
Message-ID: <auicYCM6KykNHLln@red-moon>
References: <20261102-host_gicv5_fixes-v1-0-743b61626fc5@arm.com>
 <20261102-host_gicv5_fixes-v1-7-743b61626fc5@arm.com>
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
In-Reply-To: <20261102-host_gicv5_fixes-v1-7-743b61626fc5@arm.com>

On Mon, Nov 02, 2026 at 01:33:00PM +0000, Sascha Bischoff wrote:
> The common ITS initialiser can be called with an ACPI firmware node.
> If firmware leaves the ITS enabled, the warning dereferences the DT
> node pointer, which is NULL on that path.
> 
> Use the firmware node name for the warning and drop the DT-only pointer.
> 
> Fixes: a97efa5ba5946 ("irqchip/gic-v5: Add ACPI ITS probing")
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> ---
>  drivers/irqchip/irq-gic-v5-its.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>

> diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
> index c5d057f713134..8628de326f28d 100644
> --- a/drivers/irqchip/irq-gic-v5-its.c
> +++ b/drivers/irqchip/irq-gic-v5-its.c
> @@ -1109,7 +1109,6 @@ static int gicv5_its_init_domain(struct gicv5_its_chip_data *its, struct irq_dom
>  static int __init gicv5_its_init_bases(void __iomem *its_base, struct fwnode_handle *handle,
>  				       struct irq_domain *parent_domain, bool noncoherent)
>  {
> -	struct device_node *np = to_of_node(handle);
>  	struct gicv5_its_chip_data *its_node;
>  	u32 cr0, cr1;
>  	bool enabled;
> @@ -1129,7 +1128,8 @@ static int __init gicv5_its_init_bases(void __iomem *its_base, struct fwnode_han
>  
>  	cr0 = its_readl_relaxed(its_node, GICV5_ITS_CR0);
>  	enabled = FIELD_GET(GICV5_ITS_CR0_ITSEN, cr0);
> -	if (WARN(enabled, "ITS %s enabled, disabling it before proceeding\n", np->full_name)) {
> +	if (WARN(enabled, "ITS %s enabled, disabling it before proceeding\n",
> +		 fwnode_get_name(handle))) {
>  		ret = gicv5_its_disable(its_node);
>  		if (ret)
>  			goto out_free_node;
> 
> -- 
> 2.34.1
> 
