Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53145279DAF
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 03:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789097253; cv=none; b=kuF0ecHYcQQyUtzyJgvlInQJhw2LOfVt7+7uuDRD/9KLVEMctUZvpZaAhdTqLi/ra58G8o7s1n6fNVBAJdqiNuwwm90DUcajhkuBrvYX2D5+G3w7CiPxGGEBo2lOTm2HZ0Bic3Uas5u5KHEm961E/yy/tAqhNgo4Yc+pQwmJ3s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789097253; c=relaxed/simple;
	bh=w9f9ltRAeAUmFZBIPM3GkNrSof8YUoxjY51Vd/Ac9g8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q8dLf5GUZ4b8v5p8jU0wda/N8ANwwKgFY5GB3Zr6SME9XMun442+WJH/9jCLEtOhkQkm1LH7lkYBLp5u1XvjK4jvkHBxQ348hQI7B3q82JwVJuk+jfBlgdtYGsOcCNmFDqq4Br9FN1O9kr+weBHckI/7sjdrdpEro2nFTmebFyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=A1CYpYZN; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="A1CYpYZN"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id EBD9540E00B9;
	Fri, 11 Sep 2026 03:27:28 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 11lncGSCMfKg; Fri, 11 Sep 2026 03:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1789097242; bh=vyQ8O1aDdhfYJ4Jn7BffntS8yrx1ZyhxjbSQYbMjg34=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A1CYpYZNNw2ph6QZf1MDEpYVYJUvnVw62Y2DXF28fFz439AeGjEEOS3xV/cWk/hFm
	 ZcY+GNlpbjm4y30N0VeZ3CNzskasr/K2wAsPTuIEfRAgV3wuXVRKfQG0iU0m4/yqmv
	 9yjAmNzc9YnnkCrNuZQuAv0Lh6n4eClMIgSCIyDWXciHjvIghF70liGcTCLaKXzlSt
	 F8v5xkIIYoLZGv8zc1dU4r5T/2xGgu0sjSSOChyaxo0DYH+doTwPOVvDlRsEhF6dr8
	 oIBYqnl6a2OUTjLZFr1oSteZND2K3/m/Djoc07XXRiDcIe4iDVGTpGxXrnDtFRUHvy
	 z0p+/KDG8o403CH5fmUjZ7MQmEhVxPE0TPSSet9mp2Nbz2Lm2ejoLswrrUNrTUbbnh
	 5Z1UhMuRnNGVzmU5j9pJtSqqhWfKxxI1jDV4YkLwsT6xVgsNrQNp+FoMyN8LeJH5dP
	 4IPa3wqec0UdBbUj8DUuF9BzWMxmzGL9CeU0HWEmE7LVI1WLmhU5vOhMxtvrW3vwyg
	 hDhOkC7K7QIu/jMTIvzbEDcaJffuzqaFShK96q+2KbsD/4HkNynUeURON9neZYHaNB
	 ZhZbYnp+0pegQJRCVzh8r74MIiLW3rPRTlBtMfh6YeKlL7N3iIasI/YgmvAyaIVuSX
	 8RVFkj09jb3AjnI/ag2itk04=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::3a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 02C1E40E01ED;
	Fri, 11 Sep 2026 03:27:17 +0000 (UTC)
Date: Thu, 10 Sep 2026 20:27:14 -0700
From: Borislav Petkov <bp@alien8.de>
To: Melody Wang <huibo.wang@amd.com>
Cc: x86@kernel.org, LKML <linux-kernel@vger.kernel.org>,
	Tom Lendacky <thomas.lendacky@amd.com>
Subject: Re: [PATCH v1 7/8] x86/sev: Allow the guest to configure interrupt
 vectors for the hypervisor
Message-ID: <20260911032714.GGaqN1Ergd2yV3DDLn@fat_crate.local>
References: <cover.1787973545.git.huibo.wang@amd.com>
 <297d8f4d28d49ff84467ae2cd14cd298289593d6.1787973545.git.huibo.wang@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <297d8f4d28d49ff84467ae2cd14cd298289593d6.1787973545.git.huibo.wang@amd.com>

On Sat, Aug 29, 2026 at 03:39:45AM +0000, Melody Wang wrote:
> The SVSM APIC protocol supports 5 API calls. SVSM_APIC_CONFIGURE_VECTOR
> (shortened to SVSM_APIC_CONFIG_VECTOR for brevity), call 4, provides for
> the guest to configure an interrupt vector which the guest allows and
> the hypervisor can use to signal interrupts for it.
> 
> Implement this call, and make the default interrupt setting permissive
> to allow all interrupts when detecting an SVSM and Alternate Injection
> is enabled.
> 
> Signed-off-by: Melody Wang <huibo.wang@amd.com>
> ---
>  arch/x86/boot/compressed/sev.c | 12 +++++++++++-
>  arch/x86/boot/compressed/sev.h |  7 +++++++
>  2 files changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/boot/compressed/sev.c b/arch/x86/boot/compressed/sev.c
> index a8a175c90fa8..479b74c75b4b 100644
> --- a/arch/x86/boot/compressed/sev.c
> +++ b/arch/x86/boot/compressed/sev.c
> @@ -520,7 +520,10 @@ bool sev_prepare(void)
>  		return true;
>  	}
>  
> -	/* Register Alternate Injection */
> +	/* When the guest is running at VMPL2 with Alternate Injection enabled,
> +	 * register Alternate Injection, and configure all of interrupts as
> +	 * permissive by default.
> +	 */

Kernel comments style format is:

	/*
	 * A sentence ending with a full-stop.
	 * Another sentence. ...
	 * More sentences. ...
	 */

>  	if (early_is_sevsnp_guest() && snp_vmpl) {
>  		struct svsm_call call = {};
>  		int ret;
> @@ -535,6 +538,13 @@ bool sev_prepare(void)
>  		ret = svsm_call_msr_protocol(&call);
>  		if (ret)
>  			sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_ALT_INJ_FAIL);
> +
> +		call.rax = SVSM_APIC_CALL(SVSM_APIC_CONFIG_VECTOR);
> +		call.rcx = SVSM_IRQ_ENABLE_ALL;
> +
> +		ret = svsm_call_msr_protocol(&call);
> +		if (svsm_call_msr_protocol(&call))

That looks like a typo here and Sashiko is correct:

  |Does this code inadvertently execute svsm_call_msr_protocol() twice when
  |booting an SEV-SNP guest at VMPL2 with Alternate Injection enabled?

IOW:

	if (ret)


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
