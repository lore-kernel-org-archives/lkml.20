Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194253612EC
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 02:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788660579; cv=none; b=ST7cL+fZzscqfKZgWpbfTt4frCBbKUTBQtFaiXKK6XvSmcNEeHqB7otgKso7U+P74p5gkoG32KXofhuELwM1qgk6yetv+ToRY9eGLSjwdDgqCdGSBZSP9RUKEq8KWatMbaUNkjDYSza7C849E56uOHjCV8XuihPFSb27hGYzzck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788660579; c=relaxed/simple;
	bh=Qjt53BiJqN41+QuomciLfWh6yiPNplDOA+RNwGkav34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p6QJoVIiC5brJUA+8z+TdNmLT9YeNtjq5lVVcq50DCtTNa8w/VqZUga/i6UmbahzW28XKPenmN0lFkDrol0v9XBewnsBvojJfEehEPqVkU/HY4cOPxDu/vPbAItEN8iWrIqZW2y4bqy0aepWG7XWpkIn823xz3uO8kvA7ucr6nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=VRo1li6P; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="VRo1li6P"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 087EC40E01E1;
	Sun,  6 Sep 2026 02:09:24 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id i2Cz-Tj7GnY5; Sun,  6 Sep 2026 02:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1788660552; bh=W4GoELtfjrvHP5rF5v/+9TKAWWTKDgk9r5AVZf0vqxQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VRo1li6PRGhGFWld7dLLkHqrgzbihA3N/WBJgIbMmsv1j77AtjkZ99mXJ7xvPc6oT
	 Jr8O61dh1REWFLG5i7olQzqBvHcBLOOEvSfr7htnXOwqJH0YOlm2Yfy8W7QeLPqzuk
	 /b4YhGyqSKgqZCiV8X25GcY3CtwA6hpH4+WLB2Y3Cr3UC9BKXX+f+3G6V8RjQ/dPfI
	 k0ZF0kgPHeK1U4DZoI8kVhrLXrBdefdN0RD7PoctftWBL9lmLANJ6u+a9ciSEhI+LI
	 j6COLXplGuok/otvATDwHGIO8CYVExz/RHhkoe0D8qyp5iMU3FRZy1TJLuzfLMeDsO
	 IptndHMvCoKne//9XkG87y7kjyl+ko30KP+9ZIXJvMB54Hsnz92p9UPOqVWLO7wHzK
	 Iu21zFu/YNjBe4QoOTxWv5lK+HoYoNWZLgCKHEJWPg6H5fxxDWmvevrD0+bfS7UbtC
	 4K+sllqdIAYRLbxOvfkw/XRtvR5y/yi5HQM169JYvC4w0i40groEWSSutd4wEXakWW
	 2YIGXSQt/M9YoTU3EwLBgOe/eTppIUtf2f0pkzzMP0AugGRf6Eb3PDGlpH72LQmslb
	 AipSu3/FA2RHOAb0HrzZOuKlxw884VxExRXQxqL8OaYH4md4aUgjpZ0A2MuX7tqks4
	 1fJhSTLLuQubuKnX4qrDw220=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id AB01740E00B8;
	Sun,  6 Sep 2026 02:09:07 +0000 (UTC)
Date: Sat, 5 Sep 2026 19:09:02 -0700
From: Borislav Petkov <bp@alien8.de>
To: Melody Wang <huibo.wang@amd.com>
Cc: x86@kernel.org, LKML <linux-kernel@vger.kernel.org>,
	Tom Lendacky <thomas.lendacky@amd.com>
Subject: Re: [PATCH v1 3/8] x86/apic: Add an SVSM APIC driver
Message-ID: <20260906020902.GQapzLPjlOKjErkvIW@fat_crate.local>
References: <cover.1787973545.git.huibo.wang@amd.com>
 <778462470199fb3c71c17989e6650037e6d97bbe.1787973545.git.huibo.wang@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <778462470199fb3c71c17989e6650037e6d97bbe.1787973545.git.huibo.wang@amd.com>

In addition to the Sashiko review comments, some minor things below:

On Sat, Aug 29, 2026 at 03:39:41AM +0000, Melody Wang wrote:
> Alternate Injection replaces hypervisor-based interrupt queuing and
> event injection, requiring guest-controlled queuing and injection. In
> order to perform this guest-controlled queuing and injectiion, an SVSM

"injection"

Please use a spellchecker when writing commit messages.

> is used to update the guest VMSA to perform the required actions.
> 
> The guest uses the SVSM APIC protocol to communicate with the SVSM to
> perform selected APIC related operations instead of using standard APIC
> MSR access.
> 
> Add such a SVSM APIC driver (which implements a subset of an X2APIC),
> for the APIC emulation supported by the SVSM.
> 
> Signed-off-by: Melody Wang <huibo.wang@amd.com>
> ---

...

> diff --git a/arch/x86/kernel/apic/Makefile b/arch/x86/kernel/apic/Makefile
> index 581db89477f9..23d83f1293e3 100644
> --- a/arch/x86/kernel/apic/Makefile
> +++ b/arch/x86/kernel/apic/Makefile
> @@ -17,6 +17,7 @@ obj-$(CONFIG_SMP)		+= ipi.o
>  ifeq ($(CONFIG_X86_64),y)
>  # APIC probe will depend on the listing order here
>  obj-$(CONFIG_X86_NUMACHIP)	+= apic_numachip.o
> +obj-$(CONFIG_AMD_ALTERNATE_INJ)	+= x2apic_svsm.o

This should probably be after secure AVIC so that secure AVIC gets preferred
on machines that support it.

>  obj-$(CONFIG_X86_UV)		+= x2apic_uv_x.o
>  obj-$(CONFIG_AMD_SECURE_AVIC)	+= x2apic_savic.o
>  obj-$(CONFIG_X86_X2APIC)	+= x2apic_phys.o

...

> +static int svsm_apic_probe(void)
> +{
> +	if (cc_platform_has(CC_ATTR_SNP_ALTERNATE_INJECTION) && !snp_vmpl) {
> +		pr_err("Alternate Injection in VMPL0 impossible. Terminating.\n");
> +		sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_ALT_INJ_FAIL);
> +	}
> +
> +	if (!cc_platform_has(CC_ATTR_SNP_ALTERNATE_INJECTION))
> +		return 0;

This check should come first, ofc. IOW,

	if (!cc...) {
		...
	} else {
		...
	}

IOW, something like this:

static int svsm_apic_probe(void)
{
        if (!cc_platform_has(CC_ATTR_SNP_ALTERNATE_INJECTION)) {
                return 0;
        } else {               
                if (!snp_vmpl) {
                        pr_err("Alternate Injection in VMPL0 impossible. Terminating.\n");
                        goto terminate;
                }       
        }
        
        if (!x2apic_mode) {
                pr_err("Alternate Injection in non x2APIC mode impossible. Terminating.\n");
                goto terminate;
        }
        
        pr_info("Alternate Injection SVSM APIC enabled\n");
        return 1;
        
terminate:
        sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_ALT_INJ_FAIL);
        return -EINVAL;
}

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
> +		pr_err("svsm_apic_icr_read error: %d\n", ret);

Make that

		pr_err("%s: error: %d\n", __func__, ret);

> +		sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_ALT_INJ_FAIL);
> +	}
> +
> +	return call.rdx_out;
> +}
> +
> +static void svsm_apic_icr_write(u32 low, u32 id)
> +{
> +	struct svsm_call call = {};
> +	u64 icr_data;
> +	u32 reg;
> +	int ret;
> +
> +	reg = APIC_ICR;
> +	icr_data = ((u64)id) << 32 | low;
> +
> +	call.rax = SVSM_APIC_CALL(SVSM_APIC_WRITE_REGISTER);
> +	call.rcx = APIC_BASE_MSR + (reg >> 4);
> +	call.rdx = icr_data;

You can do

	call.rdx = ((u64)id) << 32 | low;

and get rid of icr_data.

> +	ret = svsm_perform_call_protocol(&call);
> +	if (ret) {
> +		pr_err("svsm_apic_icr_write error: %d\n", ret);

Same as above:

		pr_err("%s: error: %d\n", __func__, ret);
	
> +		sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_ALT_INJ_FAIL);
> +	}
> +}
> +
> +static void svsm_apic_send_IPI(int cpu, int vector)
> +{
> +	u32 dest = per_cpu(x86_cpu_to_apicid, cpu);
> +
> +	svsm_apic_icr_write(__prepare_ICR(0, vector, APIC_DEST_PHYSICAL), dest);
> +}
> +
> +static void __svsm_apic_send_IPI_mask(const struct cpumask *mask, int vector, int apic_dest)
> +{
> +	unsigned long query_cpu;
> +	unsigned long this_cpu;

One line:

	unsigned long query_cpu, this_cpu;

> +
> +	guard(irqsave)();
> +
> +	this_cpu = smp_processor_id();
> +	for_each_cpu(query_cpu, mask) {
> +		if (apic_dest == APIC_DEST_ALLBUT && this_cpu == query_cpu)
> +			continue;
> +
> +		svsm_apic_send_IPI(query_cpu, vector);
> +	}
> +}
 

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
