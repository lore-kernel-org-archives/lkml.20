Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90931A6811
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 01:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789004081; cv=none; b=LkfLawykqAWhrfxKwlWq9yA5CIZmR4VnwB5Cx5RkRAkZp62Gx6kIiLYX7etW2bnAhyFJuzrHZAhmzXiWL/o3+x79CTP3ZVDNfkuqHJwrX8Se+pGjXifOxe8rAPOaCmU7c63Ijf8B93YRPq8oQKRtjQV1C/HYdp5ks7yzaC8/vYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789004081; c=relaxed/simple;
	bh=1Xvq+UeFOACbMD6FikYtCusL0FnxSEvSVl2fjWDdxuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P3EP/w37GO5Q9ptZBu84UIDMmK2YMXeMifuzrwkmvxm/40m4fo6aeJ3YKAQ2Z6U92trX9zR+wBUkaDeKSvHJxXfKo3ROG+qaLxdUdapoc+FCd/ApuRIvYRLhYf2pE2A8FtCi8N3+3IFOXolvGoKLULJa1sx7etBIwY71GKrGXGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=MIo4OiTb; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="MIo4OiTb"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id D7F3040E00B9;
	Thu, 10 Sep 2026 01:34:36 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id sziD0aMq6eqH; Thu, 10 Sep 2026 01:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1789004055; bh=g1owsa3i2u7oPerTIrH3fxCOkucuCFo92voW+waLK28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MIo4OiTbfuP2AReGC7xi/S9liHKnRIu2T5Vt9u4litmVUw+sM4Rpzm8BkmBiNOB8e
	 hRdgd0p8L+SPwriDiFJ4hPNMNb6iWtcxwK1cXxjmufLyYLfJ9EXs1Ng9bxnUJuAsyO
	 qibRsa6rUZYhtk7z1cFtlN2tA3fox3frM37G+lXz2pmtT1lMZYKWQ46mP0AoA4f5Lu
	 5NFZ7PWqMvjDc+4OVEEIb1NFLrj1+g8lJgTeLkh0IC/7p5XhA/ZnpaBK6Sm2saSbIu
	 /sWdrWLbmjR9YUGtuJ4mQgXk0fkX0UNII75s8sgJ9tRSQmQbUNUc0zJvdLq1htaRa8
	 GrngbUEdCTYlVOa/7gjmn71tC/K9gzUjvmfswaBJQG3oUWOpL/n7mgS61ukZxx6/w7
	 GMhSsrRQIbTNYZhnuJeaBm9zYeIZYpqEd2Qt+2AFPZ9NFRDs0h8wD/RcwN9J/RpPxn
	 D66lARgirfxRmAx8Ey4NdzG0oPaJ6AGAvvrsUgFHA5I238j5ZPJ1OsqrbsfqcMDv4T
	 3jXSSRorbmmbizNh9AAKm41MvyuXqdkR8sWxtMJNb2rB3T1MpqZd07em2+Sy67ZzYY
	 hJ/rQlOmXxom1TSC7X/G8fzIO8Gw/x4Ksu3LmgfvIOrAqQq/liYY8qBjPcKwmLOEtF
	 T8KREOJYcmD84/pJOP6cDcJU=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 6528140E0320;
	Thu, 10 Sep 2026 01:34:10 +0000 (UTC)
Date: Wed, 9 Sep 2026 18:34:07 -0700
From: Borislav Petkov <bp@alien8.de>
To: Melody Wang <huibo.wang@amd.com>, g
Cc: x86@kernel.org, LKML <linux-kernel@vger.kernel.org>,
	Tom Lendacky <thomas.lendacky@amd.com>
Subject: Re: [PATCH v1 6/8] x86/sev: Register the guest with the SVSM APIC
 protocol
Message-ID: <20260910013407.GCaqIJD0YlUCYaPHQN@fat_crate.local>
References: <cover.1787973545.git.huibo.wang@amd.com>
 <10ac277c26ad416d480e5c9ebfb89eedd4bd5b95.1787973545.git.huibo.wang@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <10ac277c26ad416d480e5c9ebfb89eedd4bd5b95.1787973545.git.huibo.wang@amd.com>

On Sat, Aug 29, 2026 at 03:39:44AM +0000, Melody Wang wrote:
> @@ -520,5 +520,22 @@ bool sev_prepare(void)
>  		return true;
>  	}
>  
> +	/* Register Alternate Injection */
> +	if (early_is_sevsnp_guest() && snp_vmpl) {
> +		struct svsm_call call = {};
> +		int ret;
> +
> +		if (!(sev_get_status() & MSR_AMD64_SNP_ALTERNATE_INJ))
> +			return 0;

Function is a bool - this needs to be

			return false;

> +
> +		call.caa = (struct svsm_ca *)boot_svsm_caa_pa;
> +		call.rax = SVSM_APIC_CALL(SVSM_APIC_CONFIG_EMULATION);
> +		call.rcx = SVSM_AI_REGISTER;
> +
> +		ret = svsm_call_msr_protocol(&call);
> +		if (ret)
> +			sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_ALT_INJ_FAIL);
> +	}
> +
>  	return false;
>  }

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
