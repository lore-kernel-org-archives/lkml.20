Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31AB436A01A
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 16:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790354048; cv=none; b=r5FCB+S/JNj/o6RON2b2Ajh4U02BjF3KHB0cU09kv9solZieQoWWvhnfLAbriNEioPeWHfG154XPNMu6xlbo816ewjVZWBhdIGtAXjEXDcMNlRhrOZHGQJ3fZ3xh+cHKnuKrAegMx5HCzTsORkO3HiT4LAB2j5qyR/TwCW2Qzd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790354048; c=relaxed/simple;
	bh=z1MMBW/k+eb49Qcp/2rEAdku+hrMenCSSpsg1SGiR6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=elVDdf2uLbuJ97YIvCd3Cg7CJDtnK1uoqy+hYqHdve6i8bYxawFBJO39P1ZBUS/+b6bbSshrZqKfTBkeqlO/PvQ2IM/GRtZKCcidipF9cxWrpZGj+5PImZNgBAdT0aoRtf2MtrvyvzqFQOS6uc9Db8DjT91Rz3Z5b5KBvkoQY8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=UAfsBFPJ; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="UAfsBFPJ"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C1EA169C;
	Fri, 25 Sep 2026 09:34:01 -0700 (PDT)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 135E43F86F;
	Fri, 25 Sep 2026 09:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790354044; bh=z1MMBW/k+eb49Qcp/2rEAdku+hrMenCSSpsg1SGiR6E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UAfsBFPJw7gPQ3SEOl4sjuq+C4NIG+QvCaZyg5xh4qIysSIbcRSEWQXPZRw7Fochj
	 QgIzag8v8ZZWI5/+gZdT244vkTar1eEHFB7IiJDATTpjYHuxBDiRhIAozS9FgV9+vC
	 DxiQY9F6qIxqeuSBpJwiOlUSIdCnvf77/QH7Af/Q=
Date: Fri, 25 Sep 2026 17:33:47 +0100
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Fuad Tabba <fuad.tabba@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Quentin Perret <qperret@google.com>, Vincent Donnefort <vdonnefort@google.com>, 
	Fuad Tabba <tabba@google.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/4] KVM: arm64: Don't WARN on an unsupported TLBI OS
 from vEL1
Message-ID: <qn2q3e3hagurkljew23gnpbf5xg5dwagzzujw4z5c7vutyic3x@fvhragb3jlz6>
References: <20260925090619.852995-1-fuad.tabba@linux.dev>
 <20260925090619.852995-2-fuad.tabba@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925090619.852995-2-fuad.tabba@linux.dev>

On Fri, Sep 25, 2026 at 10:06:16AM +0100, Fuad Tabba wrote:
> A VMM can trigger the WARN_ON(!vcpu_is_el2()) in handle_tlbi_el1() on a
> CPU with FEAT_EVT2 and FEAT_TLBIOS but no FEAT_FGT, by setting
> ID_AA64ISAR0_EL1.TLB to NI and having the guest execute TLBI VMALLE1OS.
> 
> Without FGT, HCR_EL2.TTLBOS traps the instruction. KVM records no FGT
> trap information on such a host, so triage_sysreg_trap() doesn't UNDEF
> it. The instruction reaches handle_tlbi_el1(), which warns before
> checking whether the guest supports it.
> 
> Check support before the warning.
> 
> Fixes: 0cb8aae226768 ("KVM: arm64: nv: Add handling of outer-shareable TLBI operations")
> Cc: stable@vger.kernel.org
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>

Looks correct to me:

Reviewed-by: Wei-Lin Chang <weilin.chang@arm.com>

> ---
>  arch/arm64/kvm/sys_regs.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index 44aae52c473d7..0ce29ce678b08 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -4257,6 +4257,10 @@ static bool handle_tlbi_el1(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
>  {
>  	u32 sys_encoding = sys_insn(p->Op0, p->Op1, p->CRn, p->CRm, p->Op2);
>  
> +	/* Without FGT, HCR_EL2.TTLBOS also traps a hidden TLBI OS from vEL1 */
> +	if (!kvm_supported_tlbi_s1e1_op(vcpu, sys_encoding))
> +		return undef_access(vcpu, p, r);
> +
>  	/*
>  	 * If we're here, this is because we've trapped on a EL1 TLBI
>  	 * instruction that affects the EL1 translation regime while
> @@ -4279,9 +4283,6 @@ static bool handle_tlbi_el1(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
>  
>  	WARN_ON(!vcpu_is_el2(vcpu));
>  
> -	if (!kvm_supported_tlbi_s1e1_op(vcpu, sys_encoding))
> -		return undef_access(vcpu, p, r);
> -
>  	if (vcpu_el2_e2h_is_set(vcpu) && vcpu_el2_tge_is_set(vcpu)) {
>  		kvm_handle_s1e2_tlbi(vcpu, sys_encoding, p->regval);
>  		return true;
> -- 
> 2.39.5
> 
