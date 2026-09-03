Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F753672A0
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 22:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788475067; cv=none; b=U59RUm/yGpvVgU+VYD+WwJ5ilvNL3e0wIVaCWCHO3fo8lxVMTMiKngT7l8KDC/jX4X5pSMvZGx8Yx2QcZiLsa/9yW7FYfxP4XtapTNHfuxdxoqcUEAo+J7aKDHNsIpvhtWeZw1CcpfzVZEeHgG1FMDc1AYsZMf6LUAL0bbvts30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788475067; c=relaxed/simple;
	bh=sBWiPhfflaoS2i5yCcahHVbBdAOMFvZa/aGeV2SNgnc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aqzAdaB63+QxAqljmYb2aUAIr3g1RRTfPTR3KGkq5ptR/jEwzX5iAYAMWIWJULebJqDUEyl9akGu2heLyO0t6kskkMDWFm1ayixezP6JD6FNmh2s0sp66zCeRILuXxtBtckI0qiIqlHhmPLczyRRvST2XYJRRrYb/3sD1EKKIr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=TF1wplr/; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="TF1wplr/"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8D5F41A1987;
	Thu,  3 Sep 2026 22:37:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4A02C6054B;
	Thu,  3 Sep 2026 22:37:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B74F211C7A01D;
	Fri,  4 Sep 2026 00:37:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788475057; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ekvuCdPlOy8kFQngtup3LYodqThLlohRQg0kdaFvkkY=;
	b=TF1wplr/9gPgoS8HsdJBeiDyatUmtK3+ZLAoMSaZDD/YFTrhiqHy9+SZY0Z3pa9yoQ6OZq
	oXOoGf7n9zrCX3k3Kqofh5PZaXWDonwhCGPpwHDrqR1njIjvB0SRBVjv6R0gZ/S/RN6yG1
	ug98TGUHXDU2hD0lZdK3hTTpaipp2n8lGZnRnXznYug+s56nENHz9tsGwmGYaZjqALIRVt
	sz1FzcQM8+OIWHvTb9O9Aif7l9IEkPU/UW4N/0sYd6n99iH9vBbuZEDQZkYzj4iLs3ektQ
	9Wgd8Zssk/cIhgOkrqcRb2Z+wH49j0WlThkriWOOnc3NaOsPHspll9EwIZPuuA==
Date: Fri, 4 Sep 2026 00:37:31 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Qingshuang Fu <fuqingshuang@kylinos.cn>
Cc: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Andy
 Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] genirq/generic-chip: Set IRQ_DOMAIN_FLAG_DESTROY_GC in
 irq_domain_alloc_generic_chips()
Message-ID: <20260904003731.2fed5a25@bootlin.com>
In-Reply-To: <20260902065939.441981-1-fuqingshuang@kylinos.cn>
References: <20260902065939.441981-1-fuqingshuang@kylinos.cn>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Qingshuang,

On Wed,  2 Sep 2026 14:59:39 +0800
Qingshuang Fu <fuqingshuang@kylinos.cn> wrote:

> irq_domain_alloc_generic_chips() allocates generic irq chips and stores
> them via d->gc. However, it does not set the IRQ_DOMAIN_FLAG_DESTROY_GC
> flag on the domain. This means that when irq_domain_remove() is later
> called, the generic chips are not freed because the check for
> IRQ_DOMAIN_FLAG_DESTROY_GC fails, resulting in a memory leak.
> 
> Currently, every caller of irq_domain_alloc_generic_chips(), including
> irq_domain_instantiate() when supplied with dgc_info, must manually set
> this flag. If a caller forgets to do so, the allocated generic chips
> will silently leak on domain removal.
> 
> Fix this by setting IRQ_DOMAIN_FLAG_DESTROY_GC in
> irq_domain_alloc_generic_chips() right after d->gc is assigned. This
> ensures that any domain using generic chips will automatically have the
> chips cleaned up when the domain is removed.
> 
> The flag is set using an idempotent OR‑operation, so existing callers
> which already set this flag manually remain unaffected. Even if the
> allocation fails halfway and frees the gc memory in the error path,
> irq_domain_remove_generic_chips() checks d->gc for NULL before
> proceeding, thus no double‑free can occur. Setting the flag here is
> always safe.
> 
> Fixes: e6f67ce32e8e ("irqdomain: Add support for generic irq chips creation before publishing a domain")
> Signed-off-by: Qingshuang Fu <fuqingshuang@kylinos.cn>
> ---
>  kernel/irq/generic-chip.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/kernel/irq/generic-chip.c b/kernel/irq/generic-chip.c
> index 2c8bc6ce082e..13b634053a3e 100644
> --- a/kernel/irq/generic-chip.c
> +++ b/kernel/irq/generic-chip.c
> @@ -308,6 +308,7 @@ int irq_domain_alloc_generic_chips(struct irq_domain *d,
>  	dgc->gc_flags = info->gc_flags;
>  	dgc->exit = info->exit;
>  	d->gc = dgc;
> +	d->flags |= IRQ_DOMAIN_FLAG_DESTROY_GC;
>  
>  	/* Calc pointer to the first generic chip */
>  	tmp += dgc_sz;
> 
> base-commit: 89a312991dc6e638a36adc43ccb91dbc25504c04

Not sure that having this flag always set is a good idea without any other changes
on IRQ generic chips users.

I am pretty sure that calling unconditionally irq_domain_remove_generic_chips()
in irq_domain_remove() in all drivers can lead to some use-after-free issues.

Sashiko has reported one case but maybe some other are present.
Can you double check on your side?

Also, the flag was not intended to avoid needed (and consistent) operation in
the code. I mean, if the code call this kind of sequence at init/probe:
--- 8< ---
irq_create_domain(); /* or similar functions */
irq_domain_alloc_generic_chips();
--- 8< ---

In  order to be consistent, It should also call.
--- 8< ---
irq_domain_remove_generic_chips();
irq_remove_domain();
--- 8< ---

The flag has been intended to be use with irq_domain_instantiate() which can call
irq_domain_alloc_generic_chips() internally. Callers of irq_domain_instantiate()
call only irq_remove_domain().

Indeed calling only irq_domain_instantiate() and calling both
irq_domain_remove_generic_chips() followed by irq_remove_domain() is, in that case,
not consistent too.

IHMO, if the flag IRQ_DOMAIN_FLAG_DESTROY_GC need to be automatically set
somewhere, it could be in irq_domain_instantiate(). 

Best regards,
Hervé
