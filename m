Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2DF43F8DE
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789457697; cv=none; b=b+oxZnXH5ZZFNaXQmQjUbUBWFNGp0xHiIRsj18kBGhsRxcGA3Cde4IRRzgp0ilaedVJ+6CglnzK49hdv3i2Hz7Th4X2lkE27rMXa3Pcx+LOrSJKR9pI2A7sKIGD0xBYrvlhOdM3oVIKMKmASAl9WmwlypkxMpjEoNt4J8fEPzxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789457697; c=relaxed/simple;
	bh=1Rx3K6NjcaYr7X9/zKmWEltz4krh7XzXKYH9gyxPsjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ohVjxKVfZwGgKYw0oWDnCDVh/ZWDLgJyOjdUD3AzsgAvvGnIV9aueGI1IZZGnwfE1wVcanQgXcl7NGtxI4cc2eNYPuTCcOZ+I7foX8U85ntv6ioZZJMK7n+XYjghhthLc9IGfH67ySMbh4HTsn+YIzONmzJ14nSVNiGPYBToKJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PQl+X5k2; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PQl+X5k2"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7355e411so21382335e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 00:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789457693; x=1790062493; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=62UkEF2WigrS8Qx3ZV8XeKxYeA/oVOGI4GnA4AVT89E=;
        b=PQl+X5k2+zkmmshxYSrhrCAaG+WeC7TQT9n0jw156yKL/HREhcXG77EkuThnlZGwkG
         BQ0SLu4ruhHHOxx+4qoAy2ppSCPCjW5J4d+NtmH8x2MAnjA0L78lL187W59BcDVlfwHY
         DkBnGd06Om82yqM4vUn/Bmky/AEHRQqa5/Ky0JyZ3GfHmZdOTId0udG/rRcdq4ejE6DT
         KZAVh/kOdbJ2uqaVliL8gbx2sb0XYdVDX4DVsWm4T/RQZFJ3DV+f8VeKpUGLi+U46FvQ
         6yviBzPQgZeK4xR+8M6p97aWFnUs0MI4IMU/V1VRuCr+TRnA5KA6mo9A/TjkqDPXbLjH
         d20g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789457693; x=1790062493;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=62UkEF2WigrS8Qx3ZV8XeKxYeA/oVOGI4GnA4AVT89E=;
        b=qmp8herwxflC9/J8IL/qiTFL4mPXGyp7IiCty/5VtMPrMv2W5euEmLvGwnrMhUsnuM
         C6/4WwwjzxlD6ipfk7LM5gt9rBWeHtQ5c+2DK4/lr71lZO8lvfKdYW1fRAJF3IbvX5GS
         LgP+xB3NU1KB3V5e1fHVRdtX6bX6iP8xD293jqEglMHG0qan3elzaRAg16YDtFV6ZWUt
         z5sud0JfLkzsgxhWu8gQk9tEmVVZ0L5zhNIj/Hg9VelifndKqmyq1mfLFr7PsmDAJzIX
         o0UTLGUJi/foYEVgynk2oAdo2ue1mjgLJlsQC9rfl77jhQIrEbX2o9qTTLQc93Y2wu/H
         Mw1g==
X-Forwarded-Encrypted: i=1; AKwUvBy0hGRq4yoI1Pbdbcv4TsbPuGJtijOzRdIqwiOuzjTh5tv5A20OBbKdHofKFKffYzi+MVBaskPtNevF01Q=@vger.kernel.org
X-Gm-Message-State: AFuF++kZI/spuDtp5aDzRyK2vYk3FBQhpICJkbk+jBJWqI6Z0z/+0GLp
	dUrUS4ABpH6symi7DXXdMW0U17vrMcSTtD42Z6PFu+z/tSGOh4QJc+yFtyUsmnwGUQ==
X-Gm-Gg: AYBFou1vkG2SkPd01cepMLIWaT2jLVk9EnoTVleMrpfJRzqSXDvOpgp/bjy57zIBuq8
	CbSMVSVM/zXmINCBynse6lgUysyiWrmZGmoyBBWfVG+J5HWDlENeoTSZ6L0izU91r8Hs+FIrIFA
	/7567lVjgVULeYUDgBIAwdrFirwYaGYJhXkNC9e0E1O1OFo5u989RZ/UdR51hwaCQaHL5E3Qtuz
	wZPpp9Am26fgx7VKAEzLdFLNeXpjOQwzWwzRc+Z8U4nxaqk734kmf0SONmnkWTAJSGua8aVbUGh
	mG7dF+tane60OrhcoYbY2Ct2Gp5xhLCBgKTBycVjJiFH9XxyfkrgWS1/ZKoJIFrk3k0lkdUmvo/
	o1T03YgwPUn18HT7Q6qlHx/C01H6RP+M6CUUvVApbiTdEFMJTFNNZreVCIHecmz0gBiQ+kDdZU4
	VXaa2CK93CvZP4G7tKGRrEruQMk96bNbTjqvVQtG0yQnewYk468cOa0bl5l6aniTpLSilBOu1pu
	vkimjjelfECEIYbIzkVNxcMoNzRQdzZZ0a91xF33Ms=
X-Received: by 2002:a05:600c:a00d:b0:49e:663c:c69f with SMTP id 5b1f17b1804b1-49e7a686db5mr168895005e9.15.1789457692234;
        Tue, 15 Sep 2026 00:34:52 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d66ab6esm51074165e9.2.2026.09.15.00.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:34:51 -0700 (PDT)
Date: Tue, 15 Sep 2026 08:34:48 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	catalin.marinas@arm.com, will@kernel.org, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	mark.rutland@arm.com, steven.price@arm.com, qperret@google.com,
	tabba@google.com
Subject: Re: [PATCH v2 1/2] KVM: arm64: Validate the host vCPU's VM before
 reading it under pKVM
Message-ID: <aqj1GKamuBraiub0@google.com>
References: <20260915070418.3209779-1-fuad.tabba@linux.dev>
 <20260915070418.3209779-2-fuad.tabba@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915070418.3209779-2-fuad.tabba@linux.dev>

On Tue, Sep 15, 2026 at 08:04:17AM +0100, Fuad Tabba wrote:
> On an MTE-capable host under pKVM, enter_exception64() reads the VM's
> MTE flag through vcpu->kvm, which for a host vCPU is a host-writable
> pointer nothing validates. The host can point it at any address in the
> hyp linear map and read back bit 1 of that word through PSR_TCO in the
> vCPU's CPSR, or panic the hypervisor with an unmapped one.
> 
> Get the VM through a get/put pair around the read: a loaded vCPU's is
> the hyp VM, an unloaded host vCPU's is read once and pinned, and a
> pointer the host never shared leaves TCO clear.
> 
> Fixes: ea7fc1bb1cd1b ("KVM: arm64: Introduce MTE VM feature")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/all/20260914070536.877D91F000FF@smtp.kernel.org/
> Cc: stable@vger.kernel.org
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>  arch/arm64/kvm/hyp/exception.c             |  5 ++-
>  arch/arm64/kvm/hyp/include/hyp/adjust_pc.h | 18 ++++++++++
>  arch/arm64/kvm/hyp/nvhe/pkvm.c             | 39 ++++++++++++++++++++++
>  3 files changed, 61 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/hyp/exception.c b/arch/arm64/kvm/hyp/exception.c
> index 754e2dc1df54a..6e60d890afa4a 100644
> --- a/arch/arm64/kvm/hyp/exception.c
> +++ b/arch/arm64/kvm/hyp/exception.c
> @@ -70,6 +70,7 @@ static void enter_exception64(struct kvm_vcpu *vcpu, unsigned long target_mode,
>  			      enum exception_type type)
>  {
>  	unsigned long sctlr, vbar, old, new, mode;
> +	struct kvm *kvm;
>  	u64 exc_offset;
>  
>  	mode = *vcpu_cpsr(vcpu) & (PSR_MODE_MASK | PSR_MODE32_BIT);
> @@ -109,8 +110,10 @@ static void enter_exception64(struct kvm_vcpu *vcpu, unsigned long target_mode,
>  	new |= (old & PSR_C_BIT);
>  	new |= (old & PSR_V_BIT);
>  
> -	if (kvm_has_mte(kern_hyp_va(vcpu->kvm)))
> +	kvm = vcpu_get_kvm(vcpu);
> +	if (kvm && kvm_has_mte(kvm))
>  		new |= PSR_TCO_BIT;
> +	vcpu_put_kvm(vcpu, kvm);
>  
>  	new |= (old & PSR_DIT_BIT);
>  
> diff --git a/arch/arm64/kvm/hyp/include/hyp/adjust_pc.h b/arch/arm64/kvm/hyp/include/hyp/adjust_pc.h
> index 4fdfeabefeb43..a4fb04faa7d09 100644
> --- a/arch/arm64/kvm/hyp/include/hyp/adjust_pc.h
> +++ b/arch/arm64/kvm/hyp/include/hyp/adjust_pc.h
> @@ -13,6 +13,24 @@
>  #include <asm/kvm_emulate.h>
>  #include <asm/kvm_host.h>
>  
> +/*
> + * Under pKVM a host vCPU's ->kvm is host-writable: the nVHE pair
> + * validates it.
> + */
> +#ifdef __KVM_NVHE_HYPERVISOR__
> +struct kvm *vcpu_get_kvm(struct kvm_vcpu *vcpu);
> +void vcpu_put_kvm(struct kvm_vcpu *vcpu, struct kvm *kvm);
> +#else
> +static inline struct kvm *vcpu_get_kvm(struct kvm_vcpu *vcpu)
> +{
> +	return vcpu->kvm;
> +}
> +
> +static inline void vcpu_put_kvm(struct kvm_vcpu *vcpu, struct kvm *kvm)
> +{
> +}
> +#endif
> +
>  static inline void kvm_skip_instr(struct kvm_vcpu *vcpu)
>  {
>  	if (vcpu_mode_is_32bit(vcpu)) {
> diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> index 459bd9eb7e4bc..9bdc7a9b84b8c 100644
> --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> @@ -11,6 +11,8 @@
>  
>  #include <asm/kvm_emulate.h>
>  
> +#include <hyp/adjust_pc.h>
> +
>  #include <nvhe/mem_protect.h>
>  #include <nvhe/memory.h>
>  #include <nvhe/pkvm.h>
> @@ -304,6 +306,43 @@ struct pkvm_hyp_vcpu *pkvm_get_loaded_hyp_vcpu(void)
>  
>  }
>  
> +static struct pkvm_hyp_vm *loaded_hyp_vm_of(struct kvm_vcpu *vcpu)

pkvm_get_loaded_hyp_vm()? to align with the other.

> +{
> +	struct pkvm_hyp_vcpu *hyp_vcpu = pkvm_get_loaded_hyp_vcpu();
> +
> +	if (hyp_vcpu &&
> +	    (vcpu == &hyp_vcpu->vcpu || vcpu == hyp_vcpu->host_vcpu))
> +		return pkvm_hyp_vcpu_to_hyp_vm(hyp_vcpu);
> +
> +	return NULL;
> +}
> +
> +/* An unloaded host vCPU's VM is mapped at EL2 only while pinned. */

Could we get the last paragraph of the commit here? As this describes quite well
what this is doing.

> +struct kvm *vcpu_get_kvm(struct kvm_vcpu *vcpu)
> +{
> +	struct pkvm_hyp_vm *hyp_vm;
> +	struct kvm *kvm;
> +
> +	if (!is_protected_kvm_enabled())
> +		return kern_hyp_va(vcpu->kvm);
> +
> +	hyp_vm = loaded_hyp_vm_of(vcpu);
> +	if (hyp_vm)
> +		return &hyp_vm->kvm;
> +
> +	kvm = kern_hyp_va(READ_ONCE(vcpu->kvm));
> +	if (hyp_pin_shared_mem(kvm, kvm + 1))
> +		return NULL;
> +
> +	return kvm;
> +}
> +
> +void vcpu_put_kvm(struct kvm_vcpu *vcpu, struct kvm *kvm)
> +{
> +	if (kvm && is_protected_kvm_enabled() && !loaded_hyp_vm_of(vcpu))
> +		hyp_unpin_shared_mem(kvm, kvm + 1);
> +}
> +

It seems strange for pkvm.c to provides function that aren't prefixed with pkvm_
and declared into adjust_pc.h and not pkvm.h. I wonder if adjust_pc.h should't
just

struct kvm *vcpu_get_kvm(struct kvm_vcpu *vcpu)
{
	if (is_protected_kvm_enabled())
		return pkvm_vcpu_get_kvm()
	else
		kern_hyp_va(vcpu->kvm);
}

>  struct pkvm_hyp_vm *get_pkvm_hyp_vm(pkvm_handle_t handle)
>  {
>  	struct pkvm_hyp_vm *hyp_vm;
> -- 
> 2.39.5
> 

Beside those nits:

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>

-- 
Vincent
