Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0853BB117
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 19:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788548472; cv=none; b=obKFNNFdOGowbh/gogWTvQQatlfuI9ByJDmDwd1qkdQynnDPA88I+TFWFmCXTDqJ5a7DpHnKSxtmNG48EbRSoR93H7NWfJLNJJlfWB430tiyeWmYj3gtQx2QfhLXEabdwbW5unCTZJDjxl4abhHsO0bP7och0FRBfatuDrRrUGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788548472; c=relaxed/simple;
	bh=g9tgsg4yqnSAMJo5kY6mXq0PH2NelBacUUL3GjIWDcs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bxiKf2k1bk9iQqXDuJHp5gitAClUAaIyBnP6ILUcOkyE0R60XRevV48+U+acImbyURtOgWPjYAm5T69I4aNthCRx3+6kdxzH7lndEGyWzqaIoai9TdqIcGlG0V3ujE5vi/BjJQae2o8VLrBS8hS3O0S/b4srfBfLJzT1oyWG34E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UWslN8VT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UWslN8VT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B5F61F00ACF;
	Fri,  4 Sep 2026 19:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788548451;
	bh=BRw6QX3F0kqzDQvc8Txrjq/R6k0aiCJr3Pfe7plpCu8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=UWslN8VTQVPw2ryT/T4dCzBkqQtqt57mKXp9YsSx/49yE8cFKEzDgZoCK2u/GYZqk
	 nnQba5gSu7jOmPgxKOBAWCKmIbhkkSIEch4KoBYUKNL46uImgggXtJYKasEH5vh/mN
	 Ef/oQ1eyzsqZM0Jhsl5EALipxBHZYHtES87STJx8TYzFh8beK4E9mphJJTiJaQt3Mx
	 QQOfrt3RKMLzJJyvWV9K+cwpZ6CLf5AlBBgLZwu/8UonnV+dv/JJ7XrIB2jmRtVwbi
	 YdCrzJxz0Hnt7Zmyw5oIvXUEj+xdElazcgC3LZ4QP6UF6C67i/XboSZ/zPpGr++ycw
	 ZRU7CU8nIkjEw==
From: Thomas Gleixner <tglx@kernel.org>
To: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
Cc: Farhad Alemi <farhad.alemi@berkeley.edu>, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] regmap: irq: Free the irqdomain we create
In-Reply-To: <20260901-regmap-irq-deallocate-domain-v1-1-4bfed4aff559@kernel.org>
References: <20260901-regmap-irq-deallocate-domain-v1-1-4bfed4aff559@kernel.org>
Date: Fri, 04 Sep 2026 21:00:48 +0200
Message-ID: <87mrtw7sf3.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Sep 01 2026 at 22:55, Mark Brown wrote:
> When domain support was added to regmap-irq it was not possible to
> remove domains, this was added later by 8ee99ada293b (irqdomain: Support
> removal of IRQ domains.).  We did update the main removal path to free
> the domain but forgot the error unwinding case during creation that is
> now in regmap_add_irq_chip_fwnode() after some code motion, meaning that
> errors during instantiation result in an unused irqchip being left
> hanging around.  Add the missing irq_remove_domain() call where the
> comment says it should be.
>
> Reported-by: Farhad Alemi <farhad.alemi@berkeley.edu>
> Reported-by: Thomas Gleixner <tglx@kernel.org>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  drivers/base/regmap/regmap-irq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/base/regmap/regmap-irq.c b/drivers/base/regmap/regmap-irq.c
> index 99b55b1053ee..715eb9e7aa2a 100644
> --- a/drivers/base/regmap/regmap-irq.c
> +++ b/drivers/base/regmap/regmap-irq.c
> @@ -963,7 +963,7 @@ int regmap_add_irq_chip_fwnode(struct fwnode_handle *fwnode,
>  	return 0;
>  
>  err_domain:
> -	/* Should really dispose of the domain but... */
> +	irq_domain_remove(d->domain);

That won't work.

The case which is affected is the one which allocates interrupts
upfront via alloc_irq_descs().

In that case the domain creation will associate allocated interrupts
because info.virq_base is > 0.

This wont trigger the WARN_ON() in irq_domain_remove() because it's a
fixed sized linear domain, but irq_domain_remove() will leak the
interrupt descriptors which still have a reference (pointer) to the irq
chip and the domain. So the same UAF is still there :)

What you need to do before removing the domain is

     if (irq_base > 0)
     	irq_domain_free_irqs(irq_base, chip->num_irqs);

Thanks,

        tglx

