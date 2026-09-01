Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CA1336886
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 01:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788225602; cv=none; b=sJkxgEqPb2XQ/aIEeSL7vcxcukGpbXpJnLUbBIp2ybQkZQM+l2HV1nmr2RHMnu2fwqqi9NFro6CgLEtd5VovK4TU9p7CxBSPoje7aYzglwF9Xjuix/Ld7Ffr7kc9U7xRPkBaHVMKHkf7uNRYPdqot9MZcxAf+i88o/ngwNRAL5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788225602; c=relaxed/simple;
	bh=sS6SZ8FbkzchoyF7CtaI0vqqdIUT+xPtvrX9xH/SqWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qceQaUdwPK89k+xXmqqarfGQsPE/ZibgF4lgDDhxZcaSDGu2SBso11doQa4GaPXnzX+mJ2ceufNoFcgEd6FVTxPGGjn0MQmwDa/fneOg77k1dAzqXYsL1NZdEcz10ptwoFp+FGejF7gruQCZzCMBaDzvts+uA4LwIZ9zZ3Qty1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=cXP2AI6j; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="cXP2AI6j"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id F27C640E01ED;
	Tue,  1 Sep 2026 01:19:55 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id TVAX1s4Te-Ok; Tue,  1 Sep 2026 01:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1788225585; bh=ixKs/tdPJBE2+jdpG2nGdi0XRZUDpK3NPI2pK8nxRSk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cXP2AI6jNQIiOW1gubLTv+Wzt+bSKwRtDCsI3x2POcUETpBK4rKKQceMLBrlcyROE
	 VTpZNbEl2KbJejDB0mWRofR7+Yrhqw0phd81+8Fw3TIBB3hWhIvPeCrX2QoFJmCtOW
	 mG/XV3VCkwtqukL0/JiEyKwtHF4mZR0l5AWLCMxe4wApcg4v8tad5Of+W4KgxKeAFe
	 HwBe7iFXbA9kOnu+Ekt40qYDLRP4bGDE3X+YkfjO7ZUeD8c2y6vglzauQ1rgyP8aRb
	 vmMuJYbEgPGXD+RUdQgsqsxnIDPEM0qZziv4OxF7iHu7VmeROYQ3JYvOR3uW1k9jde
	 FTBZP4z4Hz8RKJyPcVeSiThFJYG+iPF9dkfqlfiJF42GOc07u+gMrtSa3GM4tudlck
	 u4a7WXCu/ejK5YALa2E9ybRCZgwdjbuXqEOIFYoO42nzsKP4ZHYDo6nscjE7cXNtiw
	 HgcDvKOFDMza2blD4cMDEtRyCv9+oqvu8+L0/EZOc/dv1FeKqYEmXsfz01aaiw9P2K
	 b0W0DpgioYAq+fdrT2f0oBC5l88G5cD9irRiW/xs+n16cnvihT4g8yioZERT6B5yhU
	 I1+qhQsMxxQC7Yti+2Luzm96/0CQOxCyBhDJQYQjrGr+0/NFEHiO0Nor+H8P5C3UQ8
	 NnboWW0L0X7IA4heUJQNijw0=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 5CFEB40E01E1;
	Tue,  1 Sep 2026 01:19:37 +0000 (UTC)
Date: Mon, 31 Aug 2026 18:19:34 -0700
From: Borislav Petkov <bp@alien8.de>
To: Melody Wang <huibo.wang@amd.com>
Cc: x86@kernel.org, LKML <linux-kernel@vger.kernel.org>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Claudio Carvalho <cclaudio@linux.ibm.com>
Subject: Re: [PATCH v1 1/8] x86/sev: Make SVSM calls preemption-safe
Message-ID: <20260901011934.GGapYoJvmhws1D7iAL@fat_crate.local>
References: <cover.1787973545.git.huibo.wang@amd.com>
 <8e6e89b87e34a8eb2a20d52b0d92c26e7a61ac42.1787973545.git.huibo.wang@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8e6e89b87e34a8eb2a20d52b0d92c26e7a61ac42.1787973545.git.huibo.wang@amd.com>

+ folks who added the vtpm stuff.

On Sat, Aug 29, 2026 at 03:39:39AM +0000, Melody Wang wrote:
> Two functions in the the SVSM vTPM guest implementation do not disable
> preemption when fetching CAA.

"	... when fetching the SVSM Calling Area Address (CAA).

The SVSM CAA..."

This way, you introduce what CAA means and then use the abbreviation.

> The SVSM calling area is a per-CPU structure. When a thread is preempted
> and migrated to a different CPU after fetching the per-CPU Calling Area
> Address (CAA), the SVSM call will execute on the new CPU with the

and here you can use "CAA" directly because you've explained it above.

> original CPU's CAA. Which is wrong.
> 
> Move the CAA fetching operation inside svsm_perform_call_protocol()
> which disables interrupts around the SVSM call and thus runs
> preemption-safe.
> 
> Signed-off-by: Melody Wang <huibo.wang@amd.com>

Should this be CC:stable so that it gets backported?

I think we want to do that and mark it with

Fixes: 770de678bc28 ("x86/sev: Add SVSM vTPM probe/send_command functions")

> ---
>  arch/x86/coco/sev/svsm.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/coco/sev/svsm.c b/arch/x86/coco/sev/svsm.c
> index 916d62cd17dc..92ea93f506c0 100644
> --- a/arch/x86/coco/sev/svsm.c
> +++ b/arch/x86/coco/sev/svsm.c
> @@ -74,6 +74,15 @@ int svsm_perform_call_protocol(struct svsm_call *call)
>  
>  	flags = native_local_irq_save();
>  
> +	/*
> +	 * 'caa' is a per-CPU variable. To avoid using a stale or incorrect
> +	 * 'caa' if the task is preempted or migrates to another CPU after it

"... or migrated to another CPU after the CAA has been fetched..."

> +	 * is fetched, always fetch 'caa' and then issue the SVSM call with
> +	 * interrupts disabled. This ensures the correct 'caa' is used even
> +	 * under preemption or CPU migration.

s/even under preemption or CPU migration//

That's kinda clear.

Leaving in the rest for the newly CCed.

> +	 */
> +	call->caa = svsm_get_caa();
> +
>  	ghcb = __sev_get_ghcb(&state);
>  
>  	do {
> @@ -321,7 +330,6 @@ int snp_svsm_vtpm_send_command(u8 *buffer)
>  {
>  	struct svsm_call call = {};
>  
> -	call.caa = svsm_get_caa();
>  	call.rax = SVSM_VTPM_CALL(SVSM_VTPM_CMD);
>  	call.rcx = __pa(buffer);
>  
> @@ -345,7 +353,6 @@ bool snp_svsm_vtpm_probe(void)
>  	if (!snp_vmpl)
>  		return false;
>  
> -	call.caa = svsm_get_caa();
>  	call.rax = SVSM_VTPM_CALL(SVSM_VTPM_QUERY);
>  
>  	if (svsm_perform_call_protocol(&call))
> -- 
> 2.43.0
> 

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
