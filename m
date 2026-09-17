Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0DB4EB85A
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789660785; cv=none; b=dAWEjDxR5GzkJKo7gq90I0fMuinEuhK3naoXesmk0l1BbDyGipW1ubM7TEMa+pJ8hc453gpBBLd2N5UiPA7sNJcksO7ce7LjF5fF+4HM4dFDFzNHQMtL7sOWMn8ajtiHKOuPND5yzeL7UO59jiFaR9L1xuC3Tfc0GhvmMmQF5vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789660785; c=relaxed/simple;
	bh=X2pME3ibNSwS8UknHRji+fQhVUcSlHTLZQ+0i9r5JOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DS3v3XzxVqyNrAHxJS8UCPSSskjzXiKwyvDll2+FpaFsLgZv5kNVvlrlupEhEoUtBRBh8ORRtZVA0/qvdEwOwZvKMHrOFrlZz+5EKwDCVOkqEh8ITYCCiuOyo2MR0S6v77BNpPngoNEN/86PMqtWt9kqnBGM+kcK3g3NqO5MUTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=JuWSSj4b; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="JuWSSj4b"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 56D374E407AF;
	Thu, 17 Sep 2026 15:59:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1ACD360580;
	Thu, 17 Sep 2026 15:59:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 413BC11C7B083;
	Thu, 17 Sep 2026 17:59:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789660780; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=sMoCcH9XiE1LhJF2aQGX5bUN/rkYCmBdzeN2NEvUkW0=;
	b=JuWSSj4bsBQhnt1XEQqd9FsYL8y4AVSCDWiJfIPQUnkh1euaXiAmZxeVQTWI3CNk07ZEnk
	5A8r8JzsPqYRPfzZhGK3Cln1woutjNsVrh0KElb4Tqsle61ViwhdCHeqE6koBfzqxHpfVO
	e/2VdECtZil5/2jh1jkOwMu98TKWGYJzwBJ4D4L8IwDWOOt+HIEpCh4ytaN12mxD8iejM8
	0gKaJXQc6wfBATr/i/gMfQj4/alZZP6kYc0oHXqf7hv80NpoH5r5+c9x0uuYl4RN4Mi1f4
	+ae7HtzJkiZwj9X+odJ/AK9b0OX7/DCiB6Khara/sOwNUa+T65T+Cnby9Kgbow==
Date: Thu, 17 Sep 2026 17:59:38 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: at91: Replace __ASSEMBLY__ with __ASSEMBLER__
Message-ID: <20260917155938d9150ac2@mail.local>
References: <20260821083645.200344-1-thuth@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821083645.200344-1-thuth@redhat.com>
X-Last-TLS-Session-Version: TLSv1.3

On 21/08/2026 10:36:45+0200, Thomas Huth wrote:
> While the GCC and Clang compilers already define __ASSEMBLER__ auto-
> matically when compiling assembly code, __ASSEMBLY__ is a macro that
> only gets defined by the Makefiles in the kernel. This can be very
> confusing when switching between userspace and kernelspace coding, or
> when dealing with uapi headers that rather should use __ASSEMBLER__
> instead. Let's standardize now on the __ASSEMBLER__ macro to avoid
> this confusion.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  Note: This has been split from an earlier bigger patch of mine into
>        a separate patch to ease reviewing
> 
>  arch/arm/mach-at91/pm.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-at91/pm.h b/arch/arm/mach-at91/pm.h
> index 50c3a425d1400..2193e1ab98476 100644
> --- a/arch/arm/mach-at91/pm.h
> +++ b/arch/arm/mach-at91/pm.h
> @@ -25,7 +25,7 @@
>  #define AT91_PM_ULP1		0x03
>  #define	AT91_PM_BACKUP		0x04
>  
> -#ifndef __ASSEMBLY__
> +#ifndef __ASSEMBLER__
>  struct at91_pm_data {
>  	void __iomem *pmc;
>  	void __iomem *ramc[2];
> -- 
> 2.55.0
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
