Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1717618A6DB
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788763664; cv=none; b=sL/pvSp9lFI4zPE6hiGMDEwEfn3Hb8/w2VIj8dw2xH7T1cj1LMiG4jACu/lBRU6kQP5epjgR0NRZoeVCJtIRmmP8fbjDOQDI6IGz8Z1rsTJKvtBBTWqGewl0vv26iH3GiKOmlW51Xo4+172i6ok/48mbfNjSnzV5PaKTzYaVnX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788763664; c=relaxed/simple;
	bh=q7dejwismKGXipVTjxZMyp44RBiyx+EMiqVBHWCQVkE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fTPBlVNu3xPFm2PoprjJB21G6fBsLHzXo+9IgFUJmJzxAdTFJMZP2HbNO+ldGxaw/WINDcIjvTBhTqMpaU+w/QYRs43Z+MGOgkP8/L+i9/+Ah+VKU7p/rKGyFfwTmakr7iUY1fozX6naHAIhD3BYfkt0wzo7f8rL1On0lNJ8l74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ppvYUMSI; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ppvYUMSI"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id CB3B51A1A1C;
	Mon,  7 Sep 2026 06:47:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9790160383;
	Mon,  7 Sep 2026 06:47:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 347FE11C7A2F3;
	Mon,  7 Sep 2026 08:47:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788763654; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jVKf/buKG28nI4K26HKG66HfBmfBPFACd6CZI6zEQtc=;
	b=ppvYUMSIHbik51/JpBQ5yeYOZELCN5LD9bVv7F9ucIv/tB6jnyOxbJ9OLjGy8V/w2L/rXt
	Akd3jmjc8ddbknsp0RipUqrFr8WaSEZ2i7OsOOTGWofTOWuYNR8h+tmNPS1tMskCBmI6lz
	8iMr48zbQGtD5GS+yoPuAPunBBo5pHnU2NuViDgm6+tluYt7YT9nDu6P7pWG8SON8MYhof
	kOTpeyhBNonYq+eg/3Br09vhk4XtEe9cMX30dRHyK3MuqzuY19efpXF7C8054RBT0ujFZu
	sek3NkTDfnXGMlX61/HDhdaelGmIGd7EJvHMSUsBAGyP0hKHTfgz1hzwiLCV+A==
Date: Mon, 7 Sep 2026 08:47:32 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Qingshuang Fu <fuqingshuang@kylinos.cn>
Cc: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Andy
 Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] irqchip/lan966x-oic: Drop redundant
 IRQ_DOMAIN_FLAG_DESTROY_GC
Message-ID: <20260907084732.6409f32d@bootlin.com>
In-Reply-To: <20260907024046.28845-3-fuqingshuang@kylinos.cn>
References: <20260907024046.28845-1-fuqingshuang@kylinos.cn>
	<20260907024046.28845-3-fuqingshuang@kylinos.cn>
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

Hi Qingshuang

On Mon,  7 Sep 2026 10:40:45 +0800
Qingshuang Fu <fuqingshuang@kylinos.cn> wrote:

> Now that __irq_domain_instantiate() automatically sets
> IRQ_DOMAIN_FLAG_DESTROY_GC when dgc_info is provided, the explicit
> flag in the irq_domain_info is redundant.  Remove it.
> 
> Signed-off-by: Qingshuang Fu <fuqingshuang@kylinos.cn>
> ---
>  drivers/irqchip/irq-lan966x-oic.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/irqchip/irq-lan966x-oic.c b/drivers/irqchip/irq-lan966x-oic.c
> index 8af08d0e4182..5122f3f1b353 100644
> --- a/drivers/irqchip/irq-lan966x-oic.c
> +++ b/drivers/irqchip/irq-lan966x-oic.c
> @@ -220,7 +220,6 @@ static int lan966x_oic_probe(struct platform_device *pdev)
>  	};
>  	struct irq_domain_info d_info = {
>  		.fwnode		= of_fwnode_handle(pdev->dev.of_node),
> -		.domain_flags	= IRQ_DOMAIN_FLAG_DESTROY_GC,
>  		.size		= LAN966X_OIC_NR_IRQ,
>  		.hwirq_max	= LAN966X_OIC_NR_IRQ,
>  		.ops		= &irq_generic_chip_ops,

Reviewed-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé
