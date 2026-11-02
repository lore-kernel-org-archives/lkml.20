Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793632979;
	b=dpgE5W+WPS6lZAbKF5lS3vuAH++/8Hx1kDW0ZSlEoHqfG0vnjNA9UhIOc7DJu8td6Irp
	 wtWOdwdJhyBsYOHqQSR4eKqoxtq6jIoWlsZtYAPQ3St4M7VZTfWsWmjfNxdK/nudwYXX0
	 4wjZy22e1J9zPkegbAwQd8ixXuN7LaEKA58RnP8p4MdJuWUYY8qA1nGauQzXpijfviS6I
	 ysvFiU4pw5uMcmCwHiUqfEpZo+pt6dINqTcoVmwike0l6ehnt1Y8yke7MjpzM/kktVugn
	 TFvc/4KVHs8PUOYB7nrST6aF5KguLqmJoyYV42QV1UqCBEmdeDPS14NiwfFsmkoBdQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632979;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=kQ1PWAmFEtKoBEC+bNwIuh8gN874WNEQ3lk9n+F20OI=;
	b=bYIT5KKZZ+v5HnWLJ3Tv7iMLCWPUmhvwncsLfwYtQ9r/V21/4cA0/0khUbNbwRyz7AtM
	 Ht7PJnmcXEoV76r/4rBpZ4x02pyx13156FWybqPsJKouNdWmg+i/+G4TS2nGJgIJM7TbY
	 +VuBq1uh85T0I8MHDWw3hMIhMFhLJx7VlW1DVSPT4vZRr1MGLdTnpPazy8q2N1wJSuIs0
	 vUSQfHw5i4d+8wcojSsThZnfrWFTecn8xJANYRO+HtVYGwZtpjDakyI3c+ie59b3Eh27B
	 Pn4m8S/YSd1qEwIPocjQ76Q3Zr0V3Q1nBoMULGYYrPuuWuNmCzxj+pEzwT2AxLtJEjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UvQAJycX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C6660C4120
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UvQAJycX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E7F11F00A18;
	Mon,  2 Nov 2026 15:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793632978;
	bh=kQ1PWAmFEtKoBEC+bNwIuh8gN874WNEQ3lk9n+F20OI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UvQAJycXDc0VLTbkhhERsC98qh02IDp+owl+L///nSFLXG/ONRDArnzh94iOBrFoe
	 fzUbUPFk9i7kQB5ssg8/X8TP2knPuh4Jbf3QfnKshec+rFdN+sGAzYPmOV9FQblGYE
	 rumOc4qsb3h9+gn3CucJYP3q5+I3TTDkwPuyeiSdEK8qT9gzfH29jXnH3TMAJ/NGGT
	 0hVKihLC2DKelzCrzAL5//Wn5IS5wZmXcLmrHAR9fJCj4oW1qGT7gtRr8ZQy5F4ehP
	 ftfrdOZL2ebYPmmsA+J3zHoAfzUkKgAc7rIHyh2Aim1ROsv2hrDwWIQOJ/uxzQU6nT
	 J6ZfzZE1Ukiwg==
Date: Mon, 2 Nov 2026 16:22:53 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/10] irqchip/gic-v5: Invalidate ITS device cache before
 freeing ITT
Message-ID: <auiqzTXn2FoSLbor@red-moon>
References: <20261102-host_gicv5_fixes-v1-0-743b61626fc5@arm.com>
 <20261102-host_gicv5_fixes-v1-8-743b61626fc5@arm.com>
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
In-Reply-To: <20261102-host_gicv5_fixes-v1-8-743b61626fc5@arm.com>

On Mon, Nov 02, 2026 at 01:33:01PM +0000, Sascha Bischoff wrote:
> A cached device table entry can still reference the ITT after its
> memory is freed via kfree(), even if the DTE has been marked as
> invalid. Once the memory has been released, it could be reallocated,
> and it would be unfortunate for the hardware to interpret this as a
> valid ITT.
> 
> Invalidate the device cache and wait for completion before freeing the
> ITT during device teardown.
> 
> Fixes: 57d72196dfc85 ("irqchip/gic-v5: Add GICv5 ITS support")
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> ---
>  drivers/irqchip/irq-gic-v5-its.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
> index 8628de326f28d..4de07bbdc4923 100644
> --- a/drivers/irqchip/irq-gic-v5-its.c
> +++ b/drivers/irqchip/irq-gic-v5-its.c
> @@ -556,6 +556,7 @@ static int gicv5_its_device_unregister(struct gicv5_its_chip_data *its,
>  				       struct gicv5_its_dev *its_dev)
>  {
>  	__le64 *dte;
> +	int ret;
>  
>  	dte = gicv5_its_devtab_get_dte_ref(its, its_dev->device_id, false);
>  
> @@ -568,9 +569,10 @@ static int gicv5_its_device_unregister(struct gicv5_its_chip_data *its,
>  	/* Zero everything - make it clear that this is an invalid entry */
>  	its_write_table_entry(its, dte, 0);
>  
> +	ret = gicv5_its_device_cache_inv(its, its_dev);
>  	gicv5_its_free_itt(its_dev);
>  
> -	return gicv5_its_device_cache_inv(its, its_dev);
> +	return ret;

Patch is right, though we don't check ret (gicv5_its_device_unregister()) so
rather that pretending to return anything useful I'd just drop it
(gicv5_wait_for_op_s() spits an error already on timeout, not sure more than
that there is anything we can do at this stage).

Again, this is a fix so I can clean this up later:

Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>

>  }
>  
>  /*
> 
> -- 
> 2.34.1
> 
