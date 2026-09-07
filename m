Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A9C20468E
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788763627; cv=none; b=duf8JXAj6ebIy087+jKcRZG5wqGpUkKQXJj2mxVyhZy8RQ6nbPbuhAKhMFhQEA0JkH3xkeXcvyPdefh6tGvxydO/3r8fK6urSGxV4Tj3+bEhYfux/xWu/TaIeUWbGlRjz7pFelgHErZ/P3cX7mcDZf1oj+aegafMOh9MVqfEaE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788763627; c=relaxed/simple;
	bh=nAFKql0oYalhMtG0Z/6U6w3xfdFDxloFZ333DF3UyTM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y0ZWUWjgsP5EAjsrm2z7ySR0YfaHXF5K+tw7IMBuRgttvL5XtC1ItyXzdxxl0+pYjJfU5Fef6IjB7gsRHUp4AVntBfqzUI497P8dGdKH52Bh+jG7ok02Tr6alWa2QGOoqce/dJ9qSAlafNFJcoJ9mHxTfyp6rAltNOX72/ns6GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=RYZdUljV; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="RYZdUljV"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A23E41A1A1C;
	Mon,  7 Sep 2026 06:47:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7697360383;
	Mon,  7 Sep 2026 06:47:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5ECB611C7A5CF;
	Mon,  7 Sep 2026 08:46:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788763617; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=HWPMtMWhcXorVt57C0tqso846aldoS3WtOo20ekbe+o=;
	b=RYZdUljV87WZtP6CLrsuWMn5+aLSPXBHifpEoxkPm0+rIEkpPqgpMDWtiitzQ/lWIG5JZq
	pC1lZ4vOZxheox5F46NkkhHMMHPEfua4ZAkCtBXgGctia+4XtjQicEboTZ3JE/kuFewXCp
	l3hGMSy+ASB7PrhK6hJIuAJxMSd099J6m+FYZ86CJj1WEV+4JoOxuLaAGWQPbrJ/5V7Xs4
	C7JjhbN9CZISucmXYsc6EzzoZZ0I3CK/YC9eckqOs1oR+6tzmUPMiCYzYf2qQE2/vNwABS
	WAflskW+5c+JPGRTjJHh/JJCF6baFYSbrsFXff7vsKyV9cXzKh6ZDhU5hbYcwg==
Date: Mon, 7 Sep 2026 08:46:53 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Qingshuang Fu <fuqingshuang@kylinos.cn>
Cc: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Andy
 Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] irqdomain: Set IRQ_DOMAIN_FLAG_DESTROY_GC in
 __irq_domain_instantiate()
Message-ID: <20260907084653.490bfd62@bootlin.com>
In-Reply-To: <20260907024046.28845-2-fuqingshuang@kylinos.cn>
References: <20260907024046.28845-1-fuqingshuang@kylinos.cn>
	<20260907024046.28845-2-fuqingshuang@kylinos.cn>
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

On Mon,  7 Sep 2026 10:40:44 +0800
Qingshuang Fu <fuqingshuang@kylinos.cn> wrote:

> When a driver uses irq_domain_instantiate() with dgc_info to create
> generic irq chips, IRQ_DOMAIN_FLAG_DESTROY_GC is required so that
> irq_domain_remove() can clean up those generic chips.
> 
> All existing in-tree callers manually set this flag today, but this
> pattern is error-prone. A future new caller forgetting to set the flag
> would leave generic chips allocated by irq_domain_alloc_generic_chips()
> leaked on domain removal.
> 
> Set IRQ_DOMAIN_FLAG_DESTROY_GC right after
> irq_domain_alloc_generic_chips() succeeds inside
> __irq_domain_instantiate().  This makes automatic cleanup the default
> for all users that provide dgc_info via irq_domain_instantiate().
> 
> This is the correct location for the flag because:
> 
>   - irq_domain_instantiate() is a high-level wrapper which internally
>     allocates the generic chips, so it should also take responsibility
>     for arranging their cleanup.
> 
>   - Setting the flag in irq_domain_alloc_generic_chips() would affect
>     legacy callers like __irq_alloc_domain_generic_chips(), some of
>     which have custom cleanup paths that manually free the generic
>     chips (e.g. gpio-tb10x does kfree(domain->gc) before
>     irq_domain_remove()), leading to use-after-free.
> 
> Signed-off-by: Qingshuang Fu <fuqingshuang@kylinos.cn>
> ---
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

LGTM.

Reviewed-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé
