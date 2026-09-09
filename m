Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25CF14A60F
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 00:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788913859; cv=none; b=p2Ol0+ws+YLCPPMV5xwmmzHF42ZSf7IGeyoJR9Q29CdiPTG3F87YlxDvhighSt3CGQ5unV6SeLCoCO/DxFXPL6uXcrLPs6qH8KiYemBG0qPVc+tVDL7ZBmHvOXPoTd+LmPnPjWVjlR7gbtb15HhFlmPVukv+42sDEHFvozS7o1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788913859; c=relaxed/simple;
	bh=CaHAZvmqdZpRlMR6vBzmxQh0X9v+U1kkBr043BtlXbc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sNe0gPxpCcaCneTFnYCTprKc8IoWrB5/u9lbOjeOPtKn6H/8xVzNHeDG1n33O+TuY7HF1X4v/IcmnhMKFLcfXOb1q3WanZdwZ/iWLYGZZhQthCrZJxkLKdt73V/zC8dukKI4ztyLxzLmlQoqzFT1h0B8bghY3/FXVpNw7yHm0xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=K8VfzNDH; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="K8VfzNDH"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 97CBB40E01DD;
	Wed,  9 Sep 2026 00:30:55 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Wuwv77fQ1khF; Wed,  9 Sep 2026 00:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1788913843; bh=A1qvU3zDYLBI7HrWJQdGZGAzARUr88bwBU57A/RRjr0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K8VfzNDHyQFBZ2dELTzrgLj2Ig2aaLPsu50QZpFTn3HbPuQEBxB9lzBS4efcOesZN
	 Wg80y4nwheu7LClfUPSMpJHkRbFuDKn4xvw43q8kYjt+4Da0gG4atEdstdyaem0W0U
	 0s+OZpmmufyXZNQ14MbNPg8NzlbQLAOUaAtps1gmAWB6rBlMU8KJjSkd7/XHSt6va1
	 lvavEqg9AAFoKkrpJ1de4unkL753/+14+Hl1e7yXh0jo22pCqntrBn7JMvwBOJGtaY
	 non5fxjWOJVEpjMuxFnjGk1CVPbV0C6Y5IdorMWk3mF5ofGUL0YfLYz8TrKA2Baj0/
	 XCFJHIvgGh8EpJd2wGgnJPLnyy33MwjdN9z5vm2qBlfre+KW4DjTQWZg6YLhtYrlyv
	 O7DKCfVRQz0F9I3yUIesbwmXDxGhNjnBoHOlgSBKaaObaaDSWKrPh809mfKYCemmtv
	 RcALyCcHF8r9FB/1Ck4db7D/bCVzQYKRTy136lz0EYDYSmc3Be6jbiSsDSeEF0Nsyq
	 ayJc8tMhRkvXiCu3xK8yZI97gS5xSGh4I7RWy3Y3mf+jBcgDw/0jwFQrn6rYPaC6bB
	 4E4eqpdWtCyKMoyspPNKoNn6jP/K5r02PGMPCJKMsLs2Zc1NB9H8QtcI9lTjGlc49p
	 IECxdY6N0clxg3h21dLYYftw=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 5130D40E01E1;
	Wed,  9 Sep 2026 00:30:38 +0000 (UTC)
Date: Tue, 8 Sep 2026 17:30:34 -0700
From: Borislav Petkov <bp@alien8.de>
To: Melody Wang <huibo.wang@amd.com>
Cc: x86@kernel.org, LKML <linux-kernel@vger.kernel.org>,
	Tom Lendacky <thomas.lendacky@amd.com>
Subject: Re: [PATCH v1 4/8] x86/sev: Route unsupported APIC register accesses
 to the hypervisor APIC emulation
Message-ID: <20260909003034.GAaqCoqiInMJrGHxl_@fat_crate.local>
References: <cover.1787973545.git.huibo.wang@amd.com>
 <836a4e242279aacaa58ede597eeaf2ac6074f562.1787973545.git.huibo.wang@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <836a4e242279aacaa58ede597eeaf2ac6074f562.1787973545.git.huibo.wang@amd.com>

On Sat, Aug 29, 2026 at 03:39:42AM +0000, Melody Wang wrote:
> -u64 savic_ghcb_msr_read(u32 reg)
> +u64 sev_apic_ghcb_msr_read(u32 reg)
>  {
>  	u64 msr = APIC_BASE_MSR + (reg >> 4);
>  	struct pt_regs regs = { .cx = msr };
> @@ -988,9 +988,9 @@ u64 savic_ghcb_msr_read(u32 reg)
>  
>  	res = __vc_handle_msr(ghcb, &ctxt, false);
>  	if (res != ES_OK) {
> -		pr_err("Secure AVIC MSR (0x%llx) read returned error (%d)\n", msr, res);
> +		pr_err("APIC MSR via GHCB (0x%llx) read returned error (%d)\n", msr, res);
>  		/* MSR read failures are treated as fatal errors */
> -		sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_SAVIC_FAIL);
> +		sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_APIC_MSR_FAIL);
>  	}
>  
>  	__sev_put_ghcb(&state);
> @@ -998,7 +998,7 @@ u64 savic_ghcb_msr_read(u32 reg)
>  	return regs.ax | regs.dx << 32;
>  }
>  
> -void savic_ghcb_msr_write(u32 reg, u64 value)
> +void sev_apic_ghcb_msr_write(u32 reg, u64 value)
>  {
>  	u64 msr = APIC_BASE_MSR + (reg >> 4);
>  	struct pt_regs regs = {
> @@ -1018,9 +1018,9 @@ void savic_ghcb_msr_write(u32 reg, u64 value)
>  
>  	res = __vc_handle_msr(ghcb, &ctxt, true);
>  	if (res != ES_OK) {
> -		pr_err("Secure AVIC MSR (0x%llx) write returned error (%d)\n", msr, res);
> +		pr_err("APIC MSR via GHCB (0x%llx) write returned error (%d)\n", msr, res);
>  		/* MSR writes should never fail. Any failure is fatal error for SNP guest */
> -		sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_SAVIC_FAIL);
> +		sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_APIC_MSR_FAIL);
>  	}
>  
>  	__sev_put_ghcb(&state);

Those two functions look almost identical. I think you should unify them in
a pre-patch exactly like you did __svsm_apic_msr_rw().

...

> diff --git a/arch/x86/kernel/apic/x2apic_svsm.c b/arch/x86/kernel/apic/x2apic_svsm.c
> index b553bfde4b85..1a1aefc26726 100644
> --- a/arch/x86/kernel/apic/x2apic_svsm.c
> +++ b/arch/x86/kernel/apic/x2apic_svsm.c
> @@ -69,14 +69,17 @@ static u32 __svsm_apic_msr_rw(u32 reg, u32 v, bool write)
>  		call.rdx = v;
>  
>  		ret = svsm_perform_call_protocol(&call);
> -		if (ret) {
> +		if (ret) { 

Applying: x86/sev: Route unsupported APIC register accesses to the hypervisor APIC emulation
.git/rebase-apply/patch:142: trailing whitespace.
                if (ret) { 
warning: 1 line adds whitespace errors.

This looks like a change you made by mistake while reworking.

>  			pr_err("%s: 0x%x, error: %d\n", call_reg_str, reg, ret);
>  			sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_ALT_INJ_FAIL);
>  		}
>  		break;
>  	default:
> -		pr_err("%s 0x%x not supported\n", call_reg_str, reg);
> -		return 0;
> +		if (write) {
> +			sev_apic_ghcb_msr_write(reg, v);
> +		} else {
> +			return sev_apic_ghcb_msr_read(reg);
> +		}

You don't need the { } braces for single statements. And you can do:

diff --git a/arch/x86/kernel/apic/x2apic_svsm.c b/arch/x86/kernel/apic/x2apic_svsm.c
index 2de2c243b879..d3867a669e0f 100644
--- a/arch/x86/kernel/apic/x2apic_svsm.c
+++ b/arch/x86/kernel/apic/x2apic_svsm.c
@@ -76,6 +76,10 @@ static u32 __svsm_apic_msr_rw(u32 reg, u32 v, bool write)
 		break;
 	default:
 		if (write)
+			/*
+			 * Even if this will end up returning call.rdx_out,
+			 * that is being ignored by the caller for a write.
+			 */
 			sev_apic_ghcb_msr_write(reg, v);
 		else
 			return sev_apic_ghcb_msr_read(reg);

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
