Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C55378D8B
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788520183; cv=none; b=hZEXeQw6YCVUodULw/RrGxhKhxmLutntpI+1jBCz+MK6iXSofhbHVJz7tsFi19p+aHGtR0kTyNogOJVtqKjLOSveTYmeS58CpaVmafUoSfUYTupMIXUuptjBQO7pfff1GPfmR3LfPVavHKSqBxyla8i9Cx9U9+99uzKBRKvjjp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788520183; c=relaxed/simple;
	bh=z48eblEXWMQo+3xe10YkvleCCJXFyYAqDjCpQYHNsVU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZykncpiEOqIZIShLfErofi7WsDt5F73KiAD38tJigOksR32uUB13hLfhbcmmTiPDOLo7EuEz1HU9A0HzPaD2nBPYVvWLVzqKm0bXNlIdT624hTRoOLT4BpsoIdwt/Xo+gi66UeUK5A+pziYlzl21xjhTvwPIsxzlR3fW1Bwmu3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=QjhEsuWS; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="QjhEsuWS"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C709B4E414FB;
	Fri,  4 Sep 2026 11:09:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8D51F6057F;
	Fri,  4 Sep 2026 11:09:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 003B611C7A8CE;
	Fri,  4 Sep 2026 13:09:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788520175; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6vE5NrQ+nwfeYmddTmhz3E2V/NAbwtRWbjfpr9T65oA=;
	b=QjhEsuWS17zkO7F8i6lHNi1cGyfBn0GB/YVEacmUKA84qnGjOzQs82d1U9iAOvXD6d+EDy
	GJ0kj9K88/5xSGZIfJKKQqF8++HmzqPxcKnMSAuQHqEx3obvlHPhynEoaqyvCjOg5gU2hD
	i7XhNJM8n8PDe1r/foLuGgzFd1EYD2d1k9GD8w7WEzAyn1bFm4l3xk+bSCTiKwb8Kvv8V7
	YirbA3575xV5feHZVBogSXsnTYysQLIkNu/Kf6HKNxvO5AYiuN1dVJ5iiokT+uBFEYj52b
	SO0qBg9SiGQmNWZ4Cw7rQi8BOC3j/MfsfGhr1L2KJnwb8xOcLx/aSwxLyZ7YTw==
Date: Fri, 4 Sep 2026 13:09:30 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Qingshuang Fu <fuqingshuang@kylinos.cn>
Cc: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Andy
 Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] irqdomain: Auto-set IRQ_DOMAIN_FLAG_DESTROY_GC in
 __irq_domain_instantiate()
Message-ID: <20260904130930.5403389a@bootlin.com>
In-Reply-To: <20260904070943.934476-1-fuqingshuang@kylinos.cn>
References: <20260902065939.441981-1-fuqingshuang@kylinos.cn>
	<20260904070943.934476-1-fuqingshuang@kylinos.cn>
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

Hi Qingshuang,

On Fri,  4 Sep 2026 15:09:43 +0800
Qingshuang Fu <fuqingshuang@kylinos.cn> wrote:

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
> Signed-off-by: Qingshuang Fu <fuqingshuang@kylinos.cn>
> ---
> Changes in v2:
> - Move setting of IRQ_DOMAIN_FLAG_DESTROY_GC from irq_domain_alloc_generic_chips()
>   into the info->dgc_info branch inside __irq_domain_instantiate(), as suggested.
>   This avoids unconditional flag-setting which could cause use-after-free for
>   legacy drivers with custom generic chip cleanup paths.
> 
>  kernel/irq/irqdomain.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
> index 57c819da30c2..4fdcb6df5306 100644
> --- a/kernel/irq/irqdomain.c
> +++ b/kernel/irq/irqdomain.c
> @@ -344,6 +344,7 @@ static struct irq_domain *__irq_domain_instantiate(const struct irq_domain_info
>  		err = irq_domain_alloc_generic_chips(domain, info->dgc_info);
>  		if (err)
>  			goto err_domain_free;
> +		domain->flags |= IRQ_DOMAIN_FLAG_DESTROY_GC;
>  	}
>  
>  	if (info->init) {
> 
> base-commit: a500db7819c50db59e55f1b4fa1c3baa5a2616f3

Ok, the flag is now set automatically in __irq_domain_instantiate() depending
on the setting of info->dgc_info.

Callers of __irq_domain_instantiate() have no more reason to set explicitly
this flag. I mean as soon as info->dgc_info is set, having also
info->domain_flag set with IRQ_DOMAIN_FLAG_DESTROY_GC is a redundant
information which can lead to confusion.

Users can ask "Why setting IRQ_DOMAIN_FLAG_DESTROY_GC in info->domain_flag
is needed whereas it is automatically set ?".

IMHO some patches in the series can be added removing the setting of
IRQ_DOMAIN_FLAG_DESTROY_GC at caller side in info->domain_flag when
info->dgc_info is set.

Best regards,
Hervé
