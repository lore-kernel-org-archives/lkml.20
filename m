Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8051A2E2DDD
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788763702; cv=none; b=nJNzfOBsbOZQ2qf1G6Ef5U2+F7kYQkA6FTzp3dgxwuXJ35NnIrhmJaZktAPr5X31z1V43EVjAlRa4WiA89M1NO3rEO1SMxOVwkubOPZarKl4i1+S8NLDKVXf3nl3XbzHWQd0n+dpp3GaOWMS2SIo4zwih8vo++gIZMsD4xwxSuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788763702; c=relaxed/simple;
	bh=Mhv4rd2wCwp/+VoxInxovOMdRVIznBMhhrl6LVijYYo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PaLMcZd4Lmqc7kOdAseIPODPSfhjcyaEYYnvBNQgCjf/PIcLGCxF2LGQgyPnAJO4SKmSDAlIa7gAuXZz/8aHfcRz25I96278PzYXivJQYS20hhnljp9p4VnLOWmW6HbNTQOamnf2hbx9nguGRPPnqxRDRdx/qXb0KiVd7fA9CGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=af3wOPfJ; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="af3wOPfJ"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id CDD1C1A1A1C;
	Mon,  7 Sep 2026 06:48:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A163E60383;
	Mon,  7 Sep 2026 06:48:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A3C1A11C7A2F3;
	Mon,  7 Sep 2026 08:48:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788763698; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=KAT1lNqJeGZ4A8jCgH6ZSux6ZwHox0IGS8Xy24KygiU=;
	b=af3wOPfJKzBBigC/gbpJ/xberNp0ECjDIzxrsxhuMVd7DKEo5W6IKh/j5UBIlCQUUtQP3C
	F0jNu+fW2kPw6VNx3pXdPs+yvd5Z21+2clnFwXh+MtCCbNUKnQKRM369uQzEElCMGiiUNc
	vJ+fSlRKV4mCMHhi3g3BG5/vALi0YcimdeSuRrM3wdVAKD9Ckrwau68b7H3QCFlAUHSOGi
	GXQ5DP3IJ1f49yY9PE9QqSlYdLOD0cAEQN2dVeLBjMrwpwkLY3QiTnHdkh/hs/xA6UGJhf
	06tkShcWD+9cj5s9YfldQIdZYwd4P9HEY9/4oai1+rJ2/tthFFtDOyxev63QrQ==
Date: Mon, 7 Sep 2026 08:48:15 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Qingshuang Fu <fuqingshuang@kylinos.cn>
Cc: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Andy
 Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] soc/fsl/qe: qe_ports_ic: Drop redundant
 IRQ_DOMAIN_FLAG_DESTROY_GC
Message-ID: <20260907084815.2e853d74@bootlin.com>
In-Reply-To: <20260907024046.28845-4-fuqingshuang@kylinos.cn>
References: <20260907024046.28845-1-fuqingshuang@kylinos.cn>
	<20260907024046.28845-4-fuqingshuang@kylinos.cn>
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

On Mon,  7 Sep 2026 10:40:46 +0800
Qingshuang Fu <fuqingshuang@kylinos.cn> wrote:

> Now that __irq_domain_instantiate() automatically sets
> IRQ_DOMAIN_FLAG_DESTROY_GC when dgc_info is provided, the explicit
> flag in the irq_domain_info is redundant.  Remove it.
> 
> Signed-off-by: Qingshuang Fu <fuqingshuang@kylinos.cn>
> ---
>  drivers/soc/fsl/qe/qe_ports_ic.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/soc/fsl/qe/qe_ports_ic.c b/drivers/soc/fsl/qe/qe_ports_ic.c
> index 7375f92f528b..fb3b92039547 100644
> --- a/drivers/soc/fsl/qe/qe_ports_ic.c
> +++ b/drivers/soc/fsl/qe/qe_ports_ic.c
> @@ -140,7 +140,6 @@ static int qepic_probe(struct platform_device *pdev)
>  	};
>  	struct irq_domain_info d_info = {
>  		.fwnode = of_fwnode_handle(pdev->dev.of_node),
> -		.domain_flags = IRQ_DOMAIN_FLAG_DESTROY_GC,
>  		.size = 32,
>  		.hwirq_max = 32,
>  		.ops = &irq_generic_chip_ops,

Reviewed-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé
