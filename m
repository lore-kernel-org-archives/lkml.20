Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701EC450412
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789111821; cv=none; b=Qa+XDudgSJiRdQZ4QQ5MT3jV6yJ7KbDYUzyL6ZKvMufVqMP3+cpSeEO1G3eoPFp/YWDlF/KBHz7wp0WYFj0SmR7ZCT1G54v5onLUGEPS/2E5xgMF/Jk3vQVeaJDhKwzqvy1o7zqThpOqDg865aEozWu5RTlOvdFtUiQwRPLv4n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789111821; c=relaxed/simple;
	bh=nBRcMjQEBi9TasUe+AUNNqnHYGiTdDTW6S94t2D6rbg=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=pMHTFQBa9MQiEo0jQykSYEnTAapZrIXaReSWpLmmwEQZjKw16P1r50lzqD3RVkyBeIaBrDNDYBakD7iE50ZyInSlf7NE16TAKyJXZOBeVpRGzK3Xm2Ax+caPEI61xBM1jz82pK2qBCI/mjUBr3FaMhyQDnvrJ82lxVrCqgPF97U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jQ6fO7Mu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jQ6fO7Mu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC20F1F000FF
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789111819;
	bh=5WO1YBrP7HjAXnzBHltF9eV+QVQh8CB0Voi7rKsI0QY=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=jQ6fO7MuZ3wOYvlXFdFiHiy5yaxhfBr+oTEGfVW2Jt0f8kL377Y1bO6eMzMhw9wOn
	 nvlqHuSaTSQHsN+UB3/R8vR5RXu/pjRtPw/xMx5OkHexquzRUEtswFyRGu/QuQDZLK
	 XnGMtmMmQ5PPEmUX0ekiV+3W3KoLinAvUQTgFznPnsfc/c98Rb2ipgZrlHM6XlIsDL
	 gQ3IeSMSI7kDFWJGOLpV+nrBFgesj2SPpzFRxz7NAsF4oXqdWpKVoejQhKivkio2X/
	 NMgXQGbpTsB2uRlJ64Cu9X/XUQpP0ayPwUxuGuI3EqQIcJzJQmrKT9cBXJjwDA+pkK
	 r/W27IcX7AWng==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 4BFE1198003A;
	Fri, 11 Sep 2026 03:30:17 -0400 (EDT)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Fri, 11 Sep 2026 03:30:17 -0400
X-ME-Sender: <xms:B66javsr-YBIVAltbemhtrfdBQYr8mURp7D9dlQzpiEjTg8ZFGxcDQ>
    <xme:B66jarQPjtiPEyFzycJvYANNHj3PBXifr6U-BDef7vFao9BqXRWBZ8k8iQ5GZhtxU
    mYswoWUpXhnjSVwCRIBplJf9Z4NrWSdrsnKmc8yY4XYu7tyT564eYia>
X-ME-Proxy-Cause: dmFkZTFhO74tkXIgShyrPOQB4nZIB5C2Uyc/LIMWVkFgmGyN9/UZ9blZaV2CoNlFvFx1ge
    j3QjHxBKxmSbh9X/itnpyD7Dz1nC6rvoepwszc2jLLtvW1SLJ279eZNc3Ygp4huacA8s+P
    7dlbLKpXOjj9jXiauMNdJbBd7endblzLSYDBpbbt4Wts9wqCUyWzhiN3kfzFvTDFhYtV+x
    Q/jkuPtKd92hdif0eVovvI3G47DqwuFHAxzZUfFjKR5V1QfIGipC/rXARBSg9tu6Posw8V
    ZSebovirngK0qtregN6mlrrxvz4L4Ru99DKVVkN0qW7vatAhVY/gRRTD6wAaCl4CnenZsy
    3AGOKBQioYqabA57JSpU4rpT/4LPlTQIJ+MOHDCaoyOnBGQP0CY4bdhi3TLlWBzB5JyvaZ
    vCPt6lFrOM8CWztIirmkArAxlDrTcKqw8HMNOPJyrTJsxoHtNluBEjA35ogDTE26Ze52E/
    rA4Hm/rQKbAOmowPhQSrH2SwpwoCmz8InWIY1v5hvwJDkLlznletD7fbDCBKEgAznMAe7t
    wDMDoyieUv6Gv6rjAWkjV+DwW4Cc/LsYpq3BslnT98dungk8DollkyreZ6CnAPoLpoIv/Y
    4bktYcBUUOXdLTWDzoikyGWjaJ41mXwpDMBAFr4NpwJEdG3BSxArDQ0or7kA
X-ME-Proxy: <xmx:Ca6japXcmda8WL1kC0R65kItvx_QpCLJSlQ9-WTy9sBC6YBQIminGw>
    <xmx:Ca6jajopWn055Oplvk3OS5DCj3XJy7-pdIw43NWVJBv_YgiSYG3ZNA>
    <xmx:Ca6jalQFwCGnmvMTemsycqFImMD4_fILwtgVsxa4vT9G7Z3TnomtQw>
    <xmx:Ca6jat23ZDOEj4WcJIn-r2KJn6m-Q2Im0Zzo_RrPTeNeQ5-MG7D_yQ>
    <xmx:Ca6jahCVWxgqHudWCIPCBLke7MfsU-cKVqH0lWv3dSDmaG6_EuprD2fp>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 5C6BDF8007E; Fri, 11 Sep 2026 03:30:15 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 11 Sep 2026 09:29:54 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Breno Leitao" <leitao@debian.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-team@meta.com
Message-Id: <6e2b619c-4ef8-445a-a97a-19ff6e9c5aca@app.fastmail.com>
In-Reply-To: <20260910-arm64-hibernate-va52-v1-1-a584d9a7d65e@debian.org>
References: <20260910-arm64-hibernate-va52-v1-1-a584d9a7d65e@debian.org>
Subject: Re: [PATCH] arm64: hibernate: clone only the linear map that exists at runtime
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Thu, 10 Sep 2026, at 15:53, Breno Leitao wrote:
> This is similar to commit 1537e55728ec2 ("arm64: trans_pgd: clone only
> the linear map that exists at runtime"), but in a different place.
>
> swsusp_arch_resume() clones the kernel linear map with
> trans_pgd_create_copy(..., PAGE_OFFSET, PAGE_END). PAGE_OFFSET comes
> from the compile-time VA_BITS, so a CONFIG_ARM64_VA_BITS_52 kernel
> booting on hardware without LPA2 -- vabits_actual is 48 and the fifth
> level is folded -- hands the walk a 3.9PB window while its linear map
> only spans the top 128TB.
>
> On a VA_BITS_52 4k kernel with CONFIG_KASAN_GENERIC in a 4GB VM, I see:
>
>   swapper/0: page allocation failure: order:0, mode:0x920(GFP_ATOMIC|__GFP_ZERO)
>    hibernate_page_alloc+0x10/0x1c
>    swsusp_arch_resume+0x70/0x320
>    hibernation_restore+0xa4/0x138
>    software_resume+0x15c/0x270
>   PM: hibernation: Failed to load image, recovering.
>   PM: hibernation: resume failed (-12)
>
> Fix it by copying the linear map that is the actual one, not the
> compiled one.
>
> Fixes: a6bbf5d4d9d1 ("arm64: mm: Add definitions to support 5 levels of paging")
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
>  arch/arm64/kernel/hibernate.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>

> diff --git a/arch/arm64/kernel/hibernate.c b/arch/arm64/kernel/hibernate.c
> index 7bf1174277772e..424291c547f02a 100644
> --- a/arch/arm64/kernel/hibernate.c
> +++ b/arch/arm64/kernel/hibernate.c
> @@ -423,8 +423,8 @@ int __nocfi swsusp_arch_resume(void)
>  	 * Create a second copy of just the linear map, and use this when
>  	 * restoring.
>  	 */
> -	rc = trans_pgd_create_copy(&trans_info, &tmp_pg_dir, PAGE_OFFSET,
> -				   PAGE_END);
> +	rc = trans_pgd_create_copy(&trans_info, &tmp_pg_dir,
> +				   _PAGE_OFFSET(vabits_actual), PAGE_END);
>  	if (rc)
>  		return rc;
> 
>
> ---
> base-commit: c68a982815dcce5464e3bf2a31ac94f5146c04ca
> change-id: 20260910-arm64-hibernate-va52-f738ede2144f
>
> Best regards,
> --  
> Breno Leitao <leitao@debian.org>
