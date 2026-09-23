Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBD7471266
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 20:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790195513; cv=none; b=b598RXsnrdmTuYeyxjbUyGQ4XADhDtLJwbjTiPrpqjZr2t9e0vy8fUI+sKmSWtKKTs6zgRTM0bpwxMWnPfolwfPPZk7KSrUtYbiIlEAKytJuUAM00qHAl+SGzT582/BkVZ0fE66HJgVZDnqrVAoxTcYDgF+gqiW5WeEUV9DZ9b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790195513; c=relaxed/simple;
	bh=CmlUEM4sXJgQXXI09jwaWv7YShfEpoD6a38+PKkoAEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jxB3Y0Px0wvzPu2ViXpMMUhu48rzfmvN7i+2pYJiUIvKt57196xxrstM62vu9r/vj3il+aqOvFWwxd9Dk+Xeu7fcXUT+yXm7X365CRzJeECvrnkyrT78HUcmUNVFeCO70k5+Mu7cuJ4iTx2h3WycqWHNwTtLS3SM2q34Xy8zoYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=BpU2XKpZ; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="BpU2XKpZ"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 2A8CB40E015D;
	Wed, 23 Sep 2026 20:31:39 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Mr9u49VVtFZD; Wed, 23 Sep 2026 20:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1790195488; bh=wJJ2ZkB5fS4a+bI6PBYMvLvuqugp7HHkf4Kf4crCAv0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BpU2XKpZQo5FXFfmU03hPMc/SLJDdzyeETXhS8syGgeKDkvB9svJGTyS1y15Y6oe2
	 4lstnaYoJYnmCxw0jXtt3dutji3N1Dn9UvOCcWFRdDdQ3BN/oZ/ZOuWr/Q+VJJlGvw
	 uOOPI3UNvRkoFsF0FPD9dLW87d1rntPheSyILdgNDyScCPexZl5OuVl3OcLWZmT6k0
	 D3W4w33OIIvdqe1Mx4hpyMKoZjc0RrdzwIOYLpsuYKvhW3b3DSVXzzdejO34UZUEYN
	 U3vwmUMOP4RsVlmDmg3GreW4CuTt19zcm+P1C1dP4J532CumZKXfsw+6qCJz3x8kWj
	 7xJGINtqBnuwtzv9tmR6aEmFk8HKMs19Uva9ZAfdooFzgVzzbhtTYCWeutjQWwGsh3
	 UVAfz33+wu1BhE4dV7aON5MdNS+p9/mRg5/2rDvozfFFt/bALEfX+Wigxmq7yktp5w
	 6UoaCHa3ZVuBRWeD8HRrAN/63B2bKdIuAAeve2qxXMjFsPEuf/qcbSyJWnCCLz1EDP
	 HA7hKe5DE43hqFhe+ryDtewv33yhJgNa1MLxSqYP/52HkBV5/YMYeR87J/jxfwLWpv
	 ISlrTso2HrHEmP8+EAYZAKM7Rdf8y/mpo56DusyvJqzDiLKH+ZgjPSj7cAM+tzBYbG
	 imNWuwo7+6BIoLap18tMwC3A=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id B9B2C40E00E8;
	Wed, 23 Sep 2026 20:31:22 +0000 (UTC)
Date: Wed, 23 Sep 2026 13:31:19 -0700
From: Borislav Petkov <bp@alien8.de>
To: Melody Wang <huibo.wang@amd.com>
Cc: x86@kernel.org, LKML <linux-kernel@vger.kernel.org>,
	Tom Lendacky <thomas.lendacky@amd.com>, ardb@kernel.org
Subject: Re: [PATCH v3 3/8] x86/apic: Add an SVSM APIC driver
Message-ID: <20260923203119.GCarQ3FyKyw6g1smgx@fat_crate.local>
References: <cover.1789927246.git.huibo.wang@amd.com>
 <69bd40ce677aeac56cf53b10910c602d60604393.1789927246.git.huibo.wang@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <69bd40ce677aeac56cf53b10910c602d60604393.1789927246.git.huibo.wang@amd.com>

On Sun, Sep 20, 2026 at 06:16:55PM +0000, Melody Wang wrote:
> Alternate Injection replaces hypervisor-based interrupt queuing and
> event injection, requiring guest-controlled queuing and injection. In
> order to perform this guest-controlled queuing and injection, an SVSM
> is used to update the guest VMSA to perform the required actions.
> 
> The guest uses the SVSM APIC protocol to communicate with the SVSM to
> perform selected APIC related operations instead of using standard APIC
> MSR access.
> 
> Add such a SVSM APIC driver (which implements a subset of an X2APIC),
> for the APIC emulation supported by the SVSM.

Simplified the commit message a bit:

"Alternate Injection replaces hypervisor-based interrupt queuing and event
injection in favor of guest-controlled queuing and injection. In order to
accomplish that, an SVSM is used to update the guest VMSA to perform the
required actions.

The guest uses the SVSM APIC protocol to communicate with the SVSM to perform
selected APIC-related operations instead of using standard APIC MSR accesses.

Add a such SVSM APIC driver (which implements a subset of the X2APIC
interface), for the APIC emulation supported by the SVSM."

> 
> Signed-off-by: Melody Wang <huibo.wang@amd.com>
> ---
>  arch/x86/include/asm/sev-common.h  |   1 +
>  arch/x86/include/asm/sev.h         |   9 ++
>  arch/x86/kernel/apic/Makefile      |   1 +
>  arch/x86/kernel/apic/x2apic_svsm.c | 236 +++++++++++++++++++++++++++++
>  4 files changed, 247 insertions(+)
>  create mode 100644 arch/x86/kernel/apic/x2apic_svsm.c

...

> +static inline u64 svsm_apic_icr_read(void)
> +{
> +	struct svsm_call call = {};
> +	u32 reg;
> +	int ret;
> +
> +	reg = APIC_ICR;
> +
> +	call.rax = SVSM_APIC_CALL(SVSM_APIC_READ_REGISTER);
> +	call.rcx = APIC_BASE_MSR + (reg >> 4);
> +
> +	ret = svsm_perform_call_protocol(&call);
> +	if (ret) {
> +		pr_err("%s: error: %d\n", __func__, ret);
> +		sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_ALT_INJ_FAIL);
> +	}
> +
> +	return call.rdx_out;
> +}
> +
> +static void svsm_apic_icr_write(u32 low, u32 id)
> +{
> +	struct svsm_call call = {};
> +	u32 reg;
> +	int ret;
> +
> +	reg = APIC_ICR;
> +
> +	call.rax = SVSM_APIC_CALL(SVSM_APIC_WRITE_REGISTER);
> +	call.rcx = APIC_BASE_MSR + (reg >> 4);
> +	call.rdx = ((u64)id) << 32 | low;
> +
> +	ret = svsm_perform_call_protocol(&call);
> +	if (ret) {
> +		pr_err("%s: error: %d\n", __func__, ret);
> +		sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_ALT_INJ_FAIL);
> +	}
> +}

Those two look very similar now and since we're unifying them, you probably
should unify those two too.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
