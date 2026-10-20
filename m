Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485085;
	b=eq5q6YKobscYCGFR2gaLVFGUO+WElE0PaKmyG9RL5LLyofJkkhv0Ah4UApen6vZzyuQs
	 HTAzZPJnYHxAX4OT3CQ2h6HlrdWJ3vHufUM0jTDCjt9hCh21zPLU98QjUVRaIrZV3+XO0
	 seLJdorxN4jGXuUASDDaXg9uVwF0MyDN//XULRA36mlI594tTitCVFEC+zvIy7De4/hfz
	 T5pCTEGDcT0pEPnLw2bRWLeXsN+SJXZPTxNr+mUkoa9r4uP7gsLcWR1ql5qL9B7sofmTY
	 QgOhUCd9W5nxvSMhq0MFwdjhk2guYS6/sFNbeH9BmAHj2Qrz0kT7Cl7ZIyhxRuTwuXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485085;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=aXThUahDPZjGbRfHjcT4v6EeFVqqPmsU8xiktNdbhT4=;
	b=1FAmatNawmAhHq2z37cMonQFR0tOQa37JdLpTGcAGp9eOdJEAGSp8oZ87QJ3plYBsadq
	 +hE+zs2Ke/I/+HLEMUeTyk9214ct0/I63VWwAuc6spHwLhYNGM7GTZJYSyIB6yRgojMTM
	 XRb1K/6FbDbHN6NiJht7QRvOarEdtuVfoxhQzrcDpTM02IT9PrcVIL7yFLikzgFnIYbTL
	 wM84Ec7Q3QbSKoyzYZR9c3gx1igE86lggAuHEXCfV0EP/spM3wZY3UL+EbEoygIZuvFNz
	 Pa6lYrzYqZM34hYy1fvZ9m17epsaUlKmzLqQNSJ9t1hyWYDxY0NYaiWqxVhGTWn38Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=q7mobaSs;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64DB60A2613
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:31:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D64DB60A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=q7mobaSs
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a018dc1f98so20880705e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792485083; x=1793089883; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aXThUahDPZjGbRfHjcT4v6EeFVqqPmsU8xiktNdbhT4=;
        b=q7mobaSswQQcVvZ/xoLdGvghoijUmwbl35KNXcESp4mPqEOBdU2ZrdcLkHeV2xy51N
         kzkDhsp+zn4ueBp5Sycc90WVp+uAw9V02AwdHNxbt4uu7ZeteX69br4tNYoQY7iEV4Cx
         FK8xonlimMtdbE507ShGPh84CdL4LkkjfS9pbIekEwNVJm/ebxL8gcyg47m4PxZizmJV
         cDEkjv7TU9auUbJEhveZ5AQn/Nxx8CSgnOySDLN5Tdq8D8ssj7C3vXIEr4B4hOVBRarS
         qH6eCFHxXCL1+WJ78MdN0x2EVGySTVlQ5IhIJb5/ms0Wy3vmTvJYPGfto2TgrkkwAZzP
         y/8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792485083; x=1793089883;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aXThUahDPZjGbRfHjcT4v6EeFVqqPmsU8xiktNdbhT4=;
        b=Xeu5LVJsDhJEe+QpQQVUEPnLMKHaXduYGSesAfZmd8W/HmpkJMvSq17NX7Z1jSrCv3
         dJgYiqvYKYqn0Km1KFEvcYHxc1zHY3X1kvx7fba5qPVAMv/KCT8B5xPekfm3fjQimYTj
         9kMprwYhlLyhvn28Ud57ktB1wG/wFU4L2+qiA4mAnhiyPdXt0qFNPM/4OUYRt4HtiFDC
         ToQgJj1VsIhV+ObupFVvzQ6GSA7OxHvCM1XlN+l3a5YUq3/b/RB9FUJolwKUiJjU96ss
         NhM4ptG/5OloREV5gnqQq6loC9qBy3f+YvDmv6yqENg4wt6dbNqzIuByepGdteG2x+kK
         It3w==
X-Forwarded-Encrypted: i=1; AKwUvBzNqv06kmlBDA77O2tvvbaeA+XMN7St6IUQEX2SVrprQauBH6hvVTzIwL/a3b3fq34uUx5M/6Pg1rTl+Do=@vger.kernel.org
X-Gm-Message-State: AFq9FYIOzWbYnec8Hpd5S87w4TKmCkwOo/AKmoBs1MXU8QxIdHLp1nIH
	DkC0fbxmIZipvmxP/usDRrSTTf0cOyOqeSC5h/q4kjohMl28BXfNGobI/4BiOqfuEw==
X-Gm-Gg: AYBFou2PgY3fjxvUtLrHa7bbepa7Npb5sYx5LFhO7j0x7Scrtp4sd3HDUaV+v1Dp7z9
	5RvnuGBTQbTvc/zdHZaHHNByhj0rIYwJ6PYcx6K+qD/UiQ7iVNPxzMJqz06mi0Uvzqc6kR1CbEP
	JxijWNnsJo+DWuoyG7MQXcfflQwZLIDR617XryVJna2RnUZPw83LO98gzuYQmDRK4Gh+RxTmqek
	FL4rc3fsATg2StUf3TJ4QzabOvN68yhHFouP5fGOKCrjNEiMDfZqgn5a/6HrJpE582EZbCrKVxZ
	xG3Y9WjWTMGEnzPJhZRnqD+9In+gNHnPV0Asqgv8r47a8Qn+d/HFfq2TrrSEj5qRentm+yXJ93I
	+Y+mG2kVv+alcAgXTtxgK5l1goIZKZyDwqxXjfwYKfgZo6a14ESFuILg35+wPnsmFUIHACXQS3T
	aSHOJ85LCIhD0rLHjzL4kVEyYf70z6OotgZko6MmsFvp/Rd35UiitKfB+3JuLn90inITrPkPBSp
	2BLFqs0e3kJ0+h/P7/qzgeOcqvFgkzO1FCeprJcJPA=
X-Received: by 2002:a05:600c:8709:b0:49f:ff73:9971 with SMTP id 5b1f17b1804b1-4a1d75f8f28mr203436305e9.18.1792485082200;
        Tue, 20 Oct 2026 01:31:22 -0700 (PDT)
Received: from google.com (197.183.140.34.bc.googleusercontent.com. [34.140.183.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d324f8sm48973225e9.6.2026.10.20.01.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 01:31:20 -0700 (PDT)
Date: Tue, 20 Oct 2026 09:31:15 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Quentin Perret <qperret@google.com>, Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] KVM: arm64: Ensure TLBs and I-cache are private to
 each vCPU in pKVM
Message-ID: <atcmp8kdDdoM4RnR@google.com>
References: <20261020074311.1873316-1-fuad.tabba@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020074311.1873316-1-fuad.tabba@linux.dev>

On Tue, Oct 20, 2026 at 08:43:11AM +0100, Fuad Tabba wrote:
> All vCPUs of a VM share its VMID, so KVM flushes a physical CPU's TLBs
> and I-cache for the VM whenever a different vCPU of that VM is loaded
> there. pKVM guests, protected or not, run on the hypervisor's stage-2
> and VMID, and the host doesn't flush for them. Nothing at EL2 flushes
> instead, so a vCPU can hit TLB and I-cache entries that another vCPU of
> the same VM left on that CPU.
> 
> Track at EL2 the last vCPU of each VM loaded on each CPU, and flush
> when it changes. EL2 can't allocate per-CPU memory for each VM, as the
> host does, so use one per-CPU array indexed by the VM's table entry.
> Reset the entry's slot on every CPU when a VM reserves it, so that a new
> VM starts with no last vCPU, whether the entry is unused or was left by
> a VM that was torn down.
> 
> Fixes: fce886a602073 ("KVM: arm64: Plumb the pKVM MMU in KVM")
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
> Changes since v1 [1]:
>   - Dropped patch 1, which added a CPU number at EL2. The last vCPU is
>     now tracked in a per-CPU array indexed by VM table entry. (Marc)
>   - Moved the check from __pkvm_vcpu_load() to pkvm_load_hyp_vcpu().
>   - The array is unsigned int, initialised to UINT_MAX. (Vincent)
>   - Dropped Joey's Reviewed-by, since the patch changed.
> 
> Based on kvmarm/next (dd0bc00e3e920).
> 
> [1] https://lore.kernel.org/all/20261014125510.2928306-1-fuad.tabba@linux.dev/
> 
>  arch/arm64/kvm/hyp/nvhe/pkvm.c | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> index ac020d0501d2e..1fc59229c8e86 100644
> --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> @@ -38,6 +38,9 @@ unsigned int kvm_host_sve_max_vl;
>   */
>  static DEFINE_PER_CPU(struct pkvm_hyp_vcpu *, loaded_hyp_vcpu);
>  
> +/* Per VM table entry, the vcpu_idx of the last vCPU of that VM loaded on this CPU. */
> +static DEFINE_PER_CPU(unsigned int, last_vcpu_ran[KVM_MAX_PVMS]);
> +
>  static void pkvm_vcpu_reset_hcr(struct kvm_vcpu *vcpu)
>  {
>  	vcpu->arch.hcr_el2 = HCR_GUEST_FLAGS;
> @@ -261,6 +264,7 @@ struct pkvm_hyp_vcpu *pkvm_load_hyp_vcpu(pkvm_handle_t handle,
>  {
>  	struct pkvm_hyp_vcpu *hyp_vcpu = NULL;
>  	struct pkvm_hyp_vm *hyp_vm;
> +	unsigned int *last_ran;
>  
>  	/* Cannot load a new vcpu without putting the old one first. */
>  	if (__this_cpu_read(loaded_hyp_vcpu))
> @@ -290,8 +294,18 @@ struct pkvm_hyp_vcpu *pkvm_load_hyp_vcpu(pkvm_handle_t handle,
>  unlock:
>  	hyp_spin_unlock(&vm_table_lock);
>  
> -	if (hyp_vcpu)
> -		__this_cpu_write(loaded_hyp_vcpu, hyp_vcpu);
> +	if (!hyp_vcpu)
> +		return NULL;
> +
> +	__this_cpu_write(loaded_hyp_vcpu, hyp_vcpu);
> +
> +	/* TLBs and I-cache are private to each vCPU, see vcpu_prepare_mmu(). */
> +	last_ran = this_cpu_ptr(&last_vcpu_ran[vm_handle_to_idx(handle)]);
> +	if (*last_ran != vcpu_idx) {
> +		__kvm_flush_cpu_context(hyp_vcpu->vcpu.arch.hw_mmu);
> +		*last_ran = vcpu_idx;
> +	}
> +
>  	return hyp_vcpu;
>  }
>  
> @@ -652,6 +666,7 @@ static int find_free_vm_table_entry(void)
>   */
>  static int allocate_vm_table_entry(void)
>  {
> +	unsigned int cpu;
>  	int idx;
>  
>  	hyp_assert_lock_held(&vm_table_lock);
> @@ -670,6 +685,9 @@ static int allocate_vm_table_entry(void)
>  
>  	vm_table[idx] = RESERVED_ENTRY;
>  
> +	for (cpu = 0; cpu < hyp_nr_cpus; cpu++)
> +		per_cpu(last_vcpu_ran[idx], cpu) = UINT_MAX;
> +
>  	return idx;
>  }
>  
> 
> base-commit: dd0bc00e3e9201fd49b62ff9cc07890c89003afe
> -- 
> 2.47.3
> 

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>

-- 
Vincent
