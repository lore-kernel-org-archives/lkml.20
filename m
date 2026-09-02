Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322844A3F26
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 15:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788361525; cv=none; b=OJS8xtTaUEebUiZq3Uzhax9ubuyTu4EXD/xTELhpCddxtcSL+7zWqFXV/fBrmrIzl8kF8T5WkCfEsJlRCPerGC+2sbeF/Obs351SPLPccMY/qm4eC/Lt+DJJItv2QipV/BOjLylUkAxO2U+Y8PD6QPgtUrJDPmPkYlG8yF1OUdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788361525; c=relaxed/simple;
	bh=2/YfSi5N9pOc6yZaIdsRfSoS1HN0gJB2ci1jIQiGiqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eDY/8fr/P7RwOZdvKWwui/eDMTSo2rnCg3Fq7TCmLIWk9qL1SBI785A15AP/T/GIHKpGBHZvmFkEPcRcl49C8Mk5kf0/CozonkZO7DXvkEtyadRlvZx5vy9CCJq0wSZzE71fZ4jt+ee0qcgH9ChGNhtIAxpxAot1Zho++J1YUdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rLwJ1rJH; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rLwJ1rJH"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so10765825e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 08:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788361521; x=1788966321; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x+YGRuTP0DFkwY53W+VAP0dMbCx4iIs4U3Fk1KxNIFU=;
        b=rLwJ1rJHc2k9EcrGlfscxbk6ArXPohokpMCWkc2EaQQAfQfXUYSwyWTlvEj5ti8+NT
         Tn1119A59T3VUwSiZaPQhWLC9aaKh32BG8tDuiR5gD0E4T+mma6mSe60y0jpxQt4+Nq6
         126yA7I7Mw8iWd50Jb3WUGk9LPhizilGKw5Gg7aAC25hM70inNuNWWbcaz9SKiB78D4D
         tOrmAXSTtzBwq0qTZjPm/seyFUrlU3h6vzvK7Y9rZQdQ3CzAY84EX2bqHcEYut7mcAQz
         Kbt7pma4zzsiyzWoYaGKUyvP2QaCYsZv238+9fKMP+35cQXD7aSfFzHZ3HMvnG4cl0Sx
         JIAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788361521; x=1788966321;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x+YGRuTP0DFkwY53W+VAP0dMbCx4iIs4U3Fk1KxNIFU=;
        b=YYxXY7zFEjG+HxL8eBhXrFmf1oFxKqI7SkAJNx08yBXpheow020UTu+qtg45WgFHFR
         QVeqwmlSCtWjCfMbn5I7RnQAoBtoTcWu1KKUEp/e5fHCRKXut49gHj58DtiiiRLO1Jos
         /n9LGQQiGmadpEEMoctMzejjDssy8iRSp4uvdthEYaP8oGM6S6lfQZjhzqXVrC8KzND8
         iLl9cqhVPwHFlu/sTEvSJ88KgFGbrxuaNlK8hPkpwG2CAaqrTT2htwuuENXRcXCur2kr
         kWp6L6VY8TOho8+NZ0drrFYH48OrEITQ4ocue+Mqwrblgy6ltvTsG/AfMXra29BPGIgA
         6tEw==
X-Forwarded-Encrypted: i=1; AHgh+RoRahCEB4OSrzkIGGjczOZSXEzoWi7TMyVnIDM20gZgTRl9Al0vNnRaIjsanrJdiiyDGR6fEH1AFY6P2Q4=@vger.kernel.org
X-Gm-Message-State: AFuF++lC5pyn8iXvsglSToCPEWYshThxskGN3VZYUOaWtmdt0/A5gCZ2
	3a+Ioaj1x42A7hHYaV5IoaOJKdQCNcc0NI3HsbVbxZbCFxr5yoEDkV8tgrF+PhbgnA==
X-Gm-Gg: AR+sD10SQ3X2soAgT7uXUjpSp11cXCvonVKtRGmQwWFinISZZvRSiuMXXzyd7xgm7qQ
	UIWrC6jS8jjAEO0IE0ZiOLGBbyc5dbZLc2GOlWCmy/yQ25tEHiwgOE5fr/BpD8uar/GkAv8F1FD
	VkapofZw24S64l15KYLLAkWQIY2ivNs2R6kgmwluO/eCEQF3vM1Bn6NYTi7GNGUoa3irnpoTFcn
	3JkcSFyAibloRBnXvz/6cqn4OnJRu2XF4VMS+IfJThGzBDoP1S3jn3hNmpVkhAb3Zm/UxgI0iX2
	78jdakIomaL6YdSR8TABOU/yAgBhSIl4khpVreFDLNnVXxYgK7v4rqsO3FEhT9mq6tMF3gotOAC
	Bw3gSJ0eohgx7mRe/RwqmsVICz++4I6R5sesG8r9BtQ9AQSVBzVMO6n3oquLaiBaHeO0vLvLbnh
	wl7Yi1/++hbCxwsmyuXqBLMylDuOcjiSw18/tjUKoXGQ51sHuBM8BeDnCpL/ejSQ==
X-Received: by 2002:a05:600c:a086:b0:495:48d7:f178 with SMTP id 5b1f17b1804b1-49ce5815dddmr111164645e9.11.1788361518474;
        Wed, 02 Sep 2026 08:05:18 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce551bf7asm40161205e9.2.2026.09.02.08.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 08:05:16 -0700 (PDT)
Date: Wed, 2 Sep 2026 16:05:12 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Quentin Perret <qperret@google.com>, Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH 05/17] KVM: arm64: Skip fixed-feature state flush for
 protected vCPUs
Message-ID: <apg7KNpamnpYi-kl@google.com>
References: <20260831163421.272420-1-fuad.tabba@linux.dev>
 <20260831163421.272420-6-fuad.tabba@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831163421.272420-6-fuad.tabba@linux.dev>

On Mon, Aug 31, 2026 at 05:34:09PM +0100, Fuad Tabba wrote:
> flush_hyp_vcpu() copies the host's mdcr_el2, TWI/TWE and debug state
> into the hyp vCPU on every entry, so for a protected vCPU the host's
> trap configuration overrides the one pkvm_vcpu_init_traps() computed
> at EL2. Move those copies into the non-protected branch, and sync the
> debug state back for non-protected vCPUs only: a protected guest's
> debug registers are hypervisor-owned, and it takes the host's TWI/TWE
> at vCPU load. MDCR_EL2.TDA traps only the guest's own accesses; it
> does not stop the world switch from loading host-supplied breakpoints
> and MDSCR_EL1.
> 
> EL2's mdcr_el2 starts from 0, and HPMN == 0 is reserved without
> FEAT_HPMN0. Set HPMN to the CPU's event counter count at vCPU load,
> the value the host's copy carried; a protected guest's PMU accesses
> trap regardless.
> 
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c | 31 +++++++++++++++++++-----------
>  arch/arm64/kvm/hyp/nvhe/pkvm.c     |  2 +-
>  2 files changed, 21 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> index ca7122b0bccdd..14e847b122abf 100644
> --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> @@ -231,7 +231,6 @@ static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
>  	u8 esr_ec;
>  
>  	fpsimd_sve_flush();
> -	flush_debug_state(hyp_vcpu);
>  
>  	/*
>  	 * If we deal with a non-protected guest and the state is potentially
> @@ -241,7 +240,14 @@ static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
>  	if (!pkvm_hyp_vcpu_is_protected(hyp_vcpu)) {
>  		if (vcpu_get_flag(host_vcpu, PKVM_HOST_STATE_DIRTY))
>  			flush_hyp_vcpu_state(hyp_vcpu);
> +
> +		hyp_vcpu->vcpu.arch.hcr_el2 &= ~(HCR_TWI | HCR_TWE);
> +		hyp_vcpu->vcpu.arch.hcr_el2 |= READ_ONCE(host_vcpu->arch.hcr_el2) &
> +							 (HCR_TWI | HCR_TWE);
> +
> +		hyp_vcpu->vcpu.arch.mdcr_el2 = host_vcpu->arch.mdcr_el2;
>  		hyp_vcpu->vcpu.arch.iflags = host_vcpu->arch.iflags;
> +		flush_debug_state(hyp_vcpu);
>  	} else {
>  		hyp_vcpu->vcpu.arch.ctxt = host_vcpu->arch.ctxt;
>  	}
> @@ -249,17 +255,13 @@ static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
>  	/* __hyp_running_vcpu must be NULL in a guest context. */
>  	hyp_vcpu->vcpu.arch.ctxt.__hyp_running_vcpu = NULL;
>  
> -	hyp_vcpu->vcpu.arch.mdcr_el2	= host_vcpu->arch.mdcr_el2;
>  	/*
> -	 * HCR_EL2.VSE is host-owned (a pending virtual SError to inject), not a
> -	 * trap-control bit, so it must flow to the hyp vCPU alongside TWI/TWE
> -	 * for the vSError to be delivered. sync_hyp_vcpu() reflects it back.
> +	 * A host-injected vSError is masked by the guest's own PSTATE.A, so it
> +	 * applies to protected guests too.
>  	 */
> -	hyp_vcpu->vcpu.arch.hcr_el2 &= ~(HCR_TWI | HCR_TWE | HCR_VSE);
> -	hyp_vcpu->vcpu.arch.hcr_el2 |= READ_ONCE(host_vcpu->arch.hcr_el2) &
> -						 (HCR_TWI | HCR_TWE | HCR_VSE);
> -
> -	hyp_vcpu->vcpu.arch.vsesr_el2	= host_vcpu->arch.vsesr_el2;
> +	hyp_vcpu->vcpu.arch.hcr_el2 &= ~HCR_VSE;
> +	hyp_vcpu->vcpu.arch.hcr_el2 |= READ_ONCE(host_vcpu->arch.hcr_el2) & HCR_VSE;
> +	hyp_vcpu->vcpu.arch.vsesr_el2 = host_vcpu->arch.vsesr_el2;
>  
>  	flush_hyp_vgic_state(hyp_vcpu);
>  
> @@ -288,7 +290,8 @@ static void sync_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu, u32 exit_reason)
>  	struct kvm_vcpu *host_vcpu = hyp_vcpu->host_vcpu;
>  
>  	fpsimd_sve_sync(&hyp_vcpu->vcpu);
> -	sync_debug_state(hyp_vcpu);
> +	if (!pkvm_hyp_vcpu_is_protected(hyp_vcpu))
> +		sync_debug_state(hyp_vcpu);

nit: We can't use the else arm below?

>  
>  	if (pkvm_hyp_vcpu_is_protected(hyp_vcpu)) {
>  		host_vcpu->arch.ctxt = hyp_vcpu->vcpu.arch.ctxt;
> @@ -329,6 +332,12 @@ static void handle___pkvm_vcpu_load(struct kvm_cpu_context *host_ctxt)
>  		/* Propagate WFx trapping flags */
>  		hyp_vcpu->vcpu.arch.hcr_el2 &= ~(HCR_TWE | HCR_TWI);
>  		hyp_vcpu->vcpu.arch.hcr_el2 |= hcr_el2 & (HCR_TWE | HCR_TWI);
> +
> +		/* HPMN == 0 is reserved without FEAT_HPMN0. */
> +		if (system_supports_pmuv3())
> +			u64p_replace_bits(&hyp_vcpu->vcpu.arch.mdcr_el2,
> +					  FIELD_GET(ARMV8_PMU_PMCR_N, read_sysreg(pmcr_el0)),
> +					  MDCR_EL2_HPMN);
>  	} else {
>  		memcpy(&hyp_vcpu->vcpu.arch.fgt, hyp_vcpu->host_vcpu->arch.fgt,
>  		       sizeof(hyp_vcpu->vcpu.arch.fgt));
> diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> index 459bd9eb7e4bc..e85f13233da08 100644
> --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> @@ -102,7 +102,7 @@ static void pvm_init_traps_mdcr(struct kvm_vcpu *vcpu)
>  
>  	if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, PMUVer, IMP)) {
>  		val |= MDCR_EL2_TPM | MDCR_EL2_TPMCR;
> -		val &= ~(MDCR_EL2_HPME | MDCR_EL2_MTPME | MDCR_EL2_HPMN_MASK);
> +		val &= ~(MDCR_EL2_HPME | MDCR_EL2_MTPME);
>  	}
>  
>  	if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, DebugVer, IMP))
> -- 
> 2.39.5
> 
