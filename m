Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0FC34EE862
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788535155; cv=none; b=Bbjt70HE5XwQTVPpr0Wj+Uf9vEc3JAjqtEqtaeC9oqZI7NDYMMKd/6oCr5Y5Jg16zjhCSljAeKDq3aBmD1OJ8WUpsNDBbNzeJ0JneBK+vZYmUcG/GY4SwnSxze+sThTxpq8CqS+rUJ6mphheplS3W3Kb9ZpcM2mQ6UYGKUJjMU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788535155; c=relaxed/simple;
	bh=JdVCxnVQYFP4TOKeo9FsLFQFwC0NNmBlp0/i/P4coqo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OnGaHauQqUNVR6t/I2cQGohGxer8xRfK5Hgwj+al61GyzAEm51nu20gGpqCb1tC38o6w2DFciZ98HMgZ7VJe7xNOLLP1JrZ4zn2e8ShPD1B8pdvtq4PxQmF+wCtnTtWMdxZ1ibGnQckghELlaQOCEtHVftk++XHie6M5QqMpC+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SIANVk6u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SIANVk6u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD5141F00A3D;
	Fri,  4 Sep 2026 15:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788535153;
	bh=sb+7o6VluJUr4pgOxVOmEZU3X8Z5KwhcLH/28uXxjTc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=SIANVk6ufrm7VG83T47c95+edZsJzGZbnpEcZv0Ya4ai4p3V5z2k4uEuxIqDUbKnU
	 H7w31EVO2awHhTWwQuhL/ofA4xls7/5iSnSMWuRwm4WfNOJIP1cQfoBgBYOniWoUef
	 cMArq5Ys6qiWMwXcjkNlqeNc8z5rY8zSdNRfllJblwXIRaqyLNEx0Zn7ZP/q2se79+
	 46nfx1Lwr4Zx9VqHL8UkaHrpL9f1VZ0iftQ3iJtv994rnAj3gWwAN4ILku3C3YhMSP
	 zak4BcJQUgBEHul9XptL6BzTkb78GR8+jVTpJPhIcrDnb88/a1DnJj4GL+fky7vhYb
	 OZSBp1BRqCpPA==
From: Thomas Gleixner <tglx@kernel.org>
To: Qingshuang Fu <fuqingshuang@kylinos.cn>, Radu Rendec <radu@rendec.net>,
 Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, Herve
 Codina <herve.codina@bootlin.com>
Cc: linux-kernel@vger.kernel.org, Qingshuang Fu <fuqingshuang@kylinos.cn>
Subject: Re: [PATCH v2] irqdomain: Auto-set IRQ_DOMAIN_FLAG_DESTROY_GC in
 __irq_domain_instantiate()
In-Reply-To: <20260904070943.934476-1-fuqingshuang@kylinos.cn>
References: <20260902065939.441981-1-fuqingshuang@kylinos.cn>
 <20260904070943.934476-1-fuqingshuang@kylinos.cn>
Date: Fri, 04 Sep 2026 17:19:10 +0200
Message-ID: <87se3p6o41.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Sep 04 2026 at 15:09, Qingshuang Fu wrote:
> When a driver uses irq_domain_instantiate() with dgc_info to create
> generic irq chips, the domain is expected to automatically clean up
> the generic chips when irq_domain_remove() is called. However,
> __irq_domain_instantiate() does not set the IRQ_DOMAIN_FLAG_DESTROY_GC
> flag which is required by irq_domain_remove() to trigger cleanup.
>
> Currently all existing callers of irq_domain_instantiate() with dgc_info
> manually set this flag, which is error-prone. If a future caller forgets to
> set the flag, generic chips allocated by irq_domain_alloc_generic_chips()
> will leak on domain removal.
>
> Set IRQ_DOMAIN_FLAG_DESTROY_GC right after irq_domain_alloc_generic_chips()
> succeeds inside __irq_domain_instantiate().
>
> This makes automatic cleanup the default for all users that provide
> dgc_info via irq_domain_instantiate().
>
> This is the correct location for several reasons:
> - irq_domain_instantiate() is a high-level wrapper which internally
>   allocates the generic chips, so it should also take responsibility
>   for arranging their cleanup.
> - Automatically setting the flag inside irq_domain_alloc_generic_chips()
>   would affect legacy callers like __irq_alloc_domain_generic_chips(),
>   some of which perform custom manual cleanup and could hit use-after-free.
>
> Fixes: e6f67ce32e8e ("irqdomain: Add support for generic irq chips creation before publishing a domain")

This does not fix anything.

All users which invoke irq_domain_instantiate() with info->dgc_info
populated set the flag, no?

And instead of adding a bogus Fixes tag, you could have made a series
which removes the redundant flag from the three perfectly fine working
drivers.
