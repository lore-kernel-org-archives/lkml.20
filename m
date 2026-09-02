Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E8A4A8A24
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 15:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788362822; cv=none; b=Dj/qHPxBJHuqHVdBpMpcCdqQscvuGHivHaQJS+00gAAIxmWZoKUXtvUP0QXz8px+jVMnwWt01VAfbeoubK40waY3nUeDHH38Gg2cfFP2u8NZp/4g7F0GLlOgS56U84k+QcApTAzrXqlED9fb2uwIXWlMBSkrQsDl4MMTFpVlKtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788362822; c=relaxed/simple;
	bh=XJw/3qLdMVreWxf4FjGR+cbdVl/3cC31DxO0jrJHwXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AVMzIf9eEj+REn1u7WR1pYCa9MLSvENeRLDuI1VwhIh1TqARPvFxtpvfFnGeTeIbNLeZ91YtIVqB65HNgZc5S796Nto/Zwg9QTovSiOORI/4MzWT4Xbp+XF4FydgfOCDzZufjtYYShkOsgKbiqvnE1WTCF6xQ7/ovSijI/TTuA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uDUXxz0U; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uDUXxz0U"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49ccfae359fso8295065e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 08:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788362816; x=1788967616; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sjVl9xzFfNgY952LphDWb8k5JraTM7MAooStXeF8NfA=;
        b=uDUXxz0UENyOwfDzEQaxEmjn3puY8xEr7tCiMI7JK84hvODUtIvHP2ih/Ftik7Q+Gn
         jnWNKqRFNhpOiF6G17f8RPWJmdkv8hpkqXTmqA6O5EzDTs7oYDLBD0E9cdSMSRA9w9K9
         N43bjFvxv1R7TrevqWiE88j6phQkN4tDqvCo0ECPlHUUACMPKxGAB/hEOPEcD3SKm5cP
         gssOXzv8m6Ym/hFg1hIf8YoL9y+bXfHhOXqoxUGUOvhzD1todpqrlaTNPSMOSeCyFnlU
         aC0eqhpL65LQlrQGS5yDSLm053ubAXb5Fw/z2DBsFf3enwIs1VDj2B0C/Pu7QTYjaKBS
         yy+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788362816; x=1788967616;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sjVl9xzFfNgY952LphDWb8k5JraTM7MAooStXeF8NfA=;
        b=p7m8dJa1DWqlYe7Pjxg0+Ul7kSCwEe3OAox5VJluVz2U9Gwi2FoBL4d06zijca0Tm0
         m4sbhI3ggf0/AvjGU5z02Upv0mxWP3c+xtx9EGsyPRv3CRs6ZZC0nhjbAubnDFzssj0h
         vkf6A8dqVy5sqoTAkltcf3d5B1ChUmr9veHI3Ai2dS/HbJQWI+KH0g5Tp6IVpn/EgUa1
         sT6ozewPVHJ6shcvdM5Y9KFwYfcCxQGHabffvk6lFM4/EeQZt78IhEMKc8YcFYnYjIMD
         miKvBwCRo/ICjCSW7f3OKH1YDm3l/+DGrJ5tsGaqbgQDHPW6V6kfNCsPWI8Txl+lwLlN
         cTcA==
X-Forwarded-Encrypted: i=1; AHgh+Rr6nNNMmJUVGQyj2U5CCXeeUtajzsemwjUk7P4OQ11+X9Lxj1IrLUT0UP30VqVZhvPRbbmQwgfeqE+z/KM=@vger.kernel.org
X-Gm-Message-State: AFuF++k3c/Fd1kMfpz2cUoy2BceVynxTB0d7S3oPdhU884VD8MoY4XCD
	ltDUqRQhG74rnTLLylEHfnTETswfPaVSaBLzGTFu8kcJ7G7C2pMMUEJ6mh4g2yUAdw==
X-Gm-Gg: AR+sD10rvra2CFOlJ3q5+vuJMiL82Zij0JUaGrh5rgDdPjTLFNFBjXH+bVDbmgm8BRu
	9MS4MMttALIzRvHJHW6Frer71e8er18Rlr1axvvy/nFuatlsX4vt2qoeyupsww48fDS4oMgr1lm
	hRHfithbOK1cdbcSwRMSdPtQXL4igBUEnKg4HssaY6ygrrfrUA8X36qhlRRdE9fzfDlgoM+Kga/
	G+qxX/SnZ1w/FPeI0Rq9JxhjAFK+j1py9NncUQ2J30Xcq+w43ANetuZ86gWYz3WIIHMZ7wFXPNf
	AHOhcAbA7OK1ydod325KgOaPkZxk5Q9R/nZ8ExEemFQSJ9us+RFe5tvEhKP38Ek1KMENXng1p//
	sV9RFKrVEC1+z6Mjo2uhfPT7nmBi0oIskgWu0VtS4dIwTwMt7qKiFsFzSmkdpqyOs/RpzacT4UI
	4bjGEIFklrjTrjbNxD0PCKFZOWBfYZ75G4yZbcbRdNMpXRKjfNDtA5qKr2tfEfb9obNJd6mX/Yw
	Cg3+X+G7lCYVoVIr/2/8SpTO28+Qag4biC0kLgdKbA=
X-Received: by 2002:a05:600c:1906:b0:499:8b13:3a98 with SMTP id 5b1f17b1804b1-49ce57e7a9dmr97272945e9.4.1788362815816;
        Wed, 02 Sep 2026 08:26:55 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce4642235sm77916425e9.2.2026.09.02.08.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 08:26:54 -0700 (PDT)
Date: Wed, 2 Sep 2026 16:26:51 +0100
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
Message-ID: <aphAO_nmoTzI6Yvf@google.com>
References: <20260831163421.272420-1-fuad.tabba@linux.dev>
 <20260831163421.272420-6-fuad.tabba@linux.dev>
 <apg7KNpamnpYi-kl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apg7KNpamnpYi-kl@google.com>

On Wed, Sep 02, 2026 at 04:05:12PM +0100, Vincent Donnefort wrote:
> On Mon, Aug 31, 2026 at 05:34:09PM +0100, Fuad Tabba wrote:
> > flush_hyp_vcpu() copies the host's mdcr_el2, TWI/TWE and debug state
> > into the hyp vCPU on every entry, so for a protected vCPU the host's
> > trap configuration overrides the one pkvm_vcpu_init_traps() computed
> > at EL2. Move those copies into the non-protected branch, and sync the
> > debug state back for non-protected vCPUs only: a protected guest's
> > debug registers are hypervisor-owned, and it takes the host's TWI/TWE
> > at vCPU load. MDCR_EL2.TDA traps only the guest's own accesses; it
> > does not stop the world switch from loading host-supplied breakpoints
> > and MDSCR_EL1.
> > 
> > EL2's mdcr_el2 starts from 0, and HPMN == 0 is reserved without
> > FEAT_HPMN0. Set HPMN to the CPU's event counter count at vCPU load,
> > the value the host's copy carried; a protected guest's PMU accesses
> > trap regardless.
> > 
> > Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> > ---
> >  arch/arm64/kvm/hyp/nvhe/hyp-main.c | 31 +++++++++++++++++++-----------
> >  arch/arm64/kvm/hyp/nvhe/pkvm.c     |  2 +-
> >  2 files changed, 21 insertions(+), 12 deletions(-)
> > 
> > diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > index ca7122b0bccdd..14e847b122abf 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > @@ -231,7 +231,6 @@ static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
> >  	u8 esr_ec;
> >  
> >  	fpsimd_sve_flush();
> > -	flush_debug_state(hyp_vcpu);
> >  
> >  	/*
> >  	 * If we deal with a non-protected guest and the state is potentially
> > @@ -241,7 +240,14 @@ static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
> >  	if (!pkvm_hyp_vcpu_is_protected(hyp_vcpu)) {
> >  		if (vcpu_get_flag(host_vcpu, PKVM_HOST_STATE_DIRTY))
> >  			flush_hyp_vcpu_state(hyp_vcpu);
> > +
> > +		hyp_vcpu->vcpu.arch.hcr_el2 &= ~(HCR_TWI | HCR_TWE);
> > +		hyp_vcpu->vcpu.arch.hcr_el2 |= READ_ONCE(host_vcpu->arch.hcr_el2) &
> > +							 (HCR_TWI | HCR_TWE);
> > +
> > +		hyp_vcpu->vcpu.arch.mdcr_el2 = host_vcpu->arch.mdcr_el2;
> >  		hyp_vcpu->vcpu.arch.iflags = host_vcpu->arch.iflags;
> > +		flush_debug_state(hyp_vcpu);
> >  	} else {
> >  		hyp_vcpu->vcpu.arch.ctxt = host_vcpu->arch.ctxt;
> >  	}
> > @@ -249,17 +255,13 @@ static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
> >  	/* __hyp_running_vcpu must be NULL in a guest context. */
> >  	hyp_vcpu->vcpu.arch.ctxt.__hyp_running_vcpu = NULL;
> >  
> > -	hyp_vcpu->vcpu.arch.mdcr_el2	= host_vcpu->arch.mdcr_el2;
> >  	/*
> > -	 * HCR_EL2.VSE is host-owned (a pending virtual SError to inject), not a
> > -	 * trap-control bit, so it must flow to the hyp vCPU alongside TWI/TWE
> > -	 * for the vSError to be delivered. sync_hyp_vcpu() reflects it back.
> > +	 * A host-injected vSError is masked by the guest's own PSTATE.A, so it
> > +	 * applies to protected guests too.
> >  	 */
> > -	hyp_vcpu->vcpu.arch.hcr_el2 &= ~(HCR_TWI | HCR_TWE | HCR_VSE);
> > -	hyp_vcpu->vcpu.arch.hcr_el2 |= READ_ONCE(host_vcpu->arch.hcr_el2) &
> > -						 (HCR_TWI | HCR_TWE | HCR_VSE);
> > -
> > -	hyp_vcpu->vcpu.arch.vsesr_el2	= host_vcpu->arch.vsesr_el2;
> > +	hyp_vcpu->vcpu.arch.hcr_el2 &= ~HCR_VSE;
> > +	hyp_vcpu->vcpu.arch.hcr_el2 |= READ_ONCE(host_vcpu->arch.hcr_el2) & HCR_VSE;
> > +	hyp_vcpu->vcpu.arch.vsesr_el2 = host_vcpu->arch.vsesr_el2;
> >  
> >  	flush_hyp_vgic_state(hyp_vcpu);
> >  
> > @@ -288,7 +290,8 @@ static void sync_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu, u32 exit_reason)
> >  	struct kvm_vcpu *host_vcpu = hyp_vcpu->host_vcpu;
> >  
> >  	fpsimd_sve_sync(&hyp_vcpu->vcpu);
> > -	sync_debug_state(hyp_vcpu);
> > +	if (!pkvm_hyp_vcpu_is_protected(hyp_vcpu))
> > +		sync_debug_state(hyp_vcpu);
> 
> nit: We can't use the else arm below?

or actually could we move the check into sync_debug_state() just like
sync_hyp_timer_state() does?

> 
> >  
> >  	if (pkvm_hyp_vcpu_is_protected(hyp_vcpu)) {
> >  		host_vcpu->arch.ctxt = hyp_vcpu->vcpu.arch.ctxt;
> > @@ -329,6 +332,12 @@ static void handle___pkvm_vcpu_load(struct kvm_cpu_context *host_ctxt)
> >  		/* Propagate WFx trapping flags */
> >  		hyp_vcpu->vcpu.arch.hcr_el2 &= ~(HCR_TWE | HCR_TWI);
> >  		hyp_vcpu->vcpu.arch.hcr_el2 |= hcr_el2 & (HCR_TWE | HCR_TWI);
> > +
> > +		/* HPMN == 0 is reserved without FEAT_HPMN0. */
> > +		if (system_supports_pmuv3())
> > +			u64p_replace_bits(&hyp_vcpu->vcpu.arch.mdcr_el2,
> > +					  FIELD_GET(ARMV8_PMU_PMCR_N, read_sysreg(pmcr_el0)),
> > +					  MDCR_EL2_HPMN);
> >  	} else {
> >  		memcpy(&hyp_vcpu->vcpu.arch.fgt, hyp_vcpu->host_vcpu->arch.fgt,
> >  		       sizeof(hyp_vcpu->vcpu.arch.fgt));
> > diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > index 459bd9eb7e4bc..e85f13233da08 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > @@ -102,7 +102,7 @@ static void pvm_init_traps_mdcr(struct kvm_vcpu *vcpu)
> >  
> >  	if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, PMUVer, IMP)) {
> >  		val |= MDCR_EL2_TPM | MDCR_EL2_TPMCR;
> > -		val &= ~(MDCR_EL2_HPME | MDCR_EL2_MTPME | MDCR_EL2_HPMN_MASK);
> > +		val &= ~(MDCR_EL2_HPME | MDCR_EL2_MTPME);
> >  	}
> >  
> >  	if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, DebugVer, IMP))
> > -- 
> > 2.39.5
> > 

-- 
Vincent
