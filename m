Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F644CCDC7
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 06:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788503190; cv=none; b=hswpMeDfAqdo2KN4uTncOMZ0Em1V2YjoyBbEhsprwdV/W00KQzFyPjaKfD1IW80+rsOuddqBJLqlfm9NwE4JK+2NxQ8wI4DbHSKfhRPxEnmgvGTz5jLpRb+PUyQUb27hEo5DUPy/gKKXIvQ0aXb8FFBwjBkYvhumQVPB9AYoUic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788503190; c=relaxed/simple;
	bh=kkKA8SAH9hZOJlVOjZSOJld2MLgV6NzAcmQeHlxWh9k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=axHCLf4e20Kv9k1aN8ga6lJEBzo983p0shv7cVwelcLIKC4sjbwSx1/CIdkL+0RJzRILalAi2m3tDLjfV+2oiCe6eB1WnA1Ieq/iYUHUmsQjY7QZnFxBXdjbZ1epsUdGe9JiUtcCxJG/B3M6p+EGUcvSfLNYUJFRImLbsf077pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XNMcL3lG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XNMcL3lG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76F701F00A3D;
	Fri,  4 Sep 2026 06:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788503189;
	bh=WFnGtxG72PKlHRZC9Gz/OUi5e6vbf4w6UnPPxcACL5E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=XNMcL3lGokbKVZMW8VvLSbaqVfn5mJHDziZhQKG2TuqK5Zihdy/50OB2YbYu15yHr
	 xKuozUoKdEbbw9ZAaU+7ptvwr/u/fR8GHgqwTqiFwT4PZGVjW0H5PpFuEkcq3YNCLh
	 a7Y4fjkH1r0X8DvP4uHQMbD/3cdtEJkI1m60VaVpJi4ucomiZEbQ1kYmxkI6Xyb+OP
	 c5ChLKc6WOjiWk3SIXAS4A4xU7GoamAA1sDvZsArCeJXRZONpHMQxMgt98xY88nQsV
	 rnt2nlMEF6cndRK3cD/PLWE0eSwk5cQ9kv4QYItfOMP5T/VcSRep0f1HtT/6I//PiR
	 CnFlcnOB82v8w==
From: Thomas Gleixner <tglx@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>, Qingshuang Fu
 <fuqingshuang@kylinos.cn>
Cc: Radu Rendec <radu@rendec.net>, Andy
 Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] genirq/generic-chip: Set IRQ_DOMAIN_FLAG_DESTROY_GC in
 irq_domain_alloc_generic_chips()
In-Reply-To: <20260904003731.2fed5a25@bootlin.com>
References: <20260902065939.441981-1-fuqingshuang@kylinos.cn>
 <20260904003731.2fed5a25@bootlin.com>
Date: Fri, 04 Sep 2026 08:26:26 +0200
Message-ID: <87v78l8rcd.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Sep 04 2026 at 00:37, Herve Codina wrote:
> On Wed,  2 Sep 2026 14:59:39 +0800
> Qingshuang Fu <fuqingshuang@kylinos.cn> wrote:
>> diff --git a/kernel/irq/generic-chip.c b/kernel/irq/generic-chip.c
>> index 2c8bc6ce082e..13b634053a3e 100644
>> --- a/kernel/irq/generic-chip.c
>> +++ b/kernel/irq/generic-chip.c
>> @@ -308,6 +308,7 @@ int irq_domain_alloc_generic_chips(struct irq_domain *d,
>>  	dgc->gc_flags = info->gc_flags;
>>  	dgc->exit = info->exit;
>>  	d->gc = dgc;
>> +	d->flags |= IRQ_DOMAIN_FLAG_DESTROY_GC;
>>  
>>  	/* Calc pointer to the first generic chip */
>>  	tmp += dgc_sz;
> The flag has been intended to be use with irq_domain_instantiate() which can call
> irq_domain_alloc_generic_chips() internally. Callers of irq_domain_instantiate()
> call only irq_remove_domain().
>
> Indeed calling only irq_domain_instantiate() and calling both
> irq_domain_remove_generic_chips() followed by irq_remove_domain() is, in that case,
> not consistent too.
>
> IHMO, if the flag IRQ_DOMAIN_FLAG_DESTROY_GC need to be automatically set
> somewhere, it could be in irq_domain_instantiate(). 

Yes, in the 'if (info->dgc_info)' branch.

