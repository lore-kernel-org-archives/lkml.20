Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793630768;
	b=qPNyDudi2Ze2g1nomTZ1ocy8X9wm3xkiawH9dRpSfSWZcyABPGT3dRlnWlV3rEUoCA6C
	 yZKfoRnJyzdDMcv3fn5IBa2QF3T337uON4qmdbwKg1E3zQzeQu0rs6lt1cPaqwWULz3gz
	 7Fa4DSnLRVAYqL/QFoEcebVFl3ztybWT48sYOAbiUWoUIzw4bpU94R+C9ZP7Bmy9aOT+r
	 JzJRdr/S2XBPS2jaEnk/L41qb0qrHHpzWIistO5fIu1OiBE63RnGu4mJph3Dqhh91w0m9
	 I3riujMQgx/CIoKDAe8fn8KF6Te0t0zvAQ4PWqZu0p+ewWwgqvUnkobvUsmhh08WGEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793630768;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=/WWmJnwldp5o5eeWM1lXiHDypa5/5oBu3TEWPCUu+dw=;
	b=hTnZfLQmeIjZ4w/mIfdSOLRFrpxN1mTHIdcaRfJfbCs0HCpB4BmFHcV9de2/a/rLp5ci
	 n2L1McJgmm4OG7pg8U6iVw9JAHQNEQl8vV4lucr2NXrKtAVCXjduXeVXdYTJU9D+r/egI
	 uxhoCKPGbZHqqodOTapV7tk381I0Ubkyl3EBvMUI0bRMIPSMeaNDE1lDr88yRJoXKIfeD
	 uGaRQq2JqZVJgLxQxAKMyOnOj3oylq8YNHnWwqNAg336bqg3xrh4xfeD2eH5bZbu0Fcta
	 1pp0GxlD+x0CySHJ9YjkxL2H59Cbsn/qUR4hlIvyFediygHS3NlFOtI88PonfBALj8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lGVizo0L;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB5E606C3CA
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lGVizo0L
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B23A81F00A16;
	Mon,  2 Nov 2026 14:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793630768;
	bh=/WWmJnwldp5o5eeWM1lXiHDypa5/5oBu3TEWPCUu+dw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lGVizo0L+8RuLsNUtlO+zNM2+q1ntFpybYeOz3XvGOl7Nf9tUtrMKp+29KsO8Ae+O
	 fi9+XbumetfQFbWRIx4i8Yqix9/HewLMKh9yVtnBBJVifqo/kGXKDKUOfs8oW/b7qw
	 9xCwSfyUe79pKpVRcsJaV1mA6fLdwKt4VIxnOptN1RNrajSUi/MZeCRaLMmQmooWtc
	 8VPOU5r+kP72Fk5E4YahVGWg4/ONtqEFBZjKqrNn9xY+YxLzaB96S5D8OQy1KmTo6f
	 e5hZBfwMVTcsPUKRf+oJ4jt1Ay9im2eVdYm+k7KBPTJ977zpfux8j7cAbWwGNjNGMg
	 7+xuuIR/gIbzg==
Date: Mon, 2 Nov 2026 15:46:03 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/10] irqchip/gic-v5: Clean the allocated linear device
 table size
Message-ID: <auiiK0ksqPMbHAmX@red-moon>
References: <20261102-host_gicv5_fixes-v1-0-743b61626fc5@arm.com>
 <20261102-host_gicv5_fixes-v1-9-743b61626fc5@arm.com>
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
In-Reply-To: <20261102-host_gicv5_fixes-v1-9-743b61626fc5@arm.com>

On Mon, Nov 02, 2026 at 01:33:02PM +0000, Sascha Bischoff wrote:
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
>  drivers/irqchip/irq-gic-v5-its.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
> index 4de07bbdc4923..c0f3982229194 100644
> --- a/drivers/irqchip/irq-gic-v5-its.c
> +++ b/drivers/irqchip/irq-gic-v5-its.c
> @@ -601,6 +601,7 @@ static int gicv5_its_alloc_devtab_linear(struct gicv5_its_chip_data *its,
>  		pr_warn("Limiting device ID bits from %u to %u\n",
>  			device_id_bits, device_id_cap);
>  		device_id_bits = device_id_cap;
> +		sz = BIT_ULL(device_id_bits) * sizeof(*devtab);
>  	}
>  

Or sz = KMALLOC_MAX_SIZE;

that's what we are doing after all.

I wonder whether moving:

sz = BIT_ULL(device_id_bits) * sizeof(*devtab);

after the capping out of the if and do:

if (BIT_ULL(device_id_bits) * sizeof(*devtab) > KMALLOC_MAX_SIZE)

to check whether mem alloc should be capped makes this any easier
to read.

Regardless, this patch is a fix and it is right to make it as small
as possible:

Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>

>  	devtab = kcalloc(BIT(device_id_bits), sizeof(*devtab), GFP_KERNEL);
> 
> -- 
> 2.34.1
> 
