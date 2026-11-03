Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793717563;
	b=YfJdVUYjM6I5UvL8SrfnUPPTppmObYVIu0adtbAwsD3fWLm/k7MAkoXps8uXs9bVG8h3
	 H7LDuwD8FUYruYPF3+bCwaWgUAdz6zXm3JSL5hBpraPtQ1/CJoZQtUgHr6abGeHhcpNu4
	 vz0kSziVNkIroBc1ML8L8OVKfRSHei/11VlApLuAbecYaPzdZu0jOCqvj46QQotEEynGa
	 mLPtJF4UHwB3YIdpgXGe3FYcCcEoN9pEWpsKvyYJDEoXFRvxve41Iw8xIIZp8TutXzpeJ
	 lLJnA5ZHNsZ255BmeyPQxJyqJq0dGovZIqTErqfjDaeiWWFugpj5STUxboKAkEAh5xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717563;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=WaOsrEmAYoqVhViGwTJTcykgEVpjZAmCdFfMPnWGgSQ=;
	b=lEbCnqkJQS7yqJyVPcsDoJ3X6P5PXvfGAW/5GqpB7qj8zTEkwhMuDRnMXfF/YCyfTUE/
	 aHNV+Eord8nIUPGa3QVMhRdRwjUBp0ygQk6olZzrpvGAAhWmjnriXcbUTVBpfFP8uXw3N
	 D07gfk2luqfj4JNAD2t13BvNjSEJDZI+qk6ZUHmFVqEBVil9q1l2CAcUm2SL+02N2OzBM
	 CCd/DZic0EPB80zJgLPI+k4eQLWmJqZXfGzVecRNU3vMtSZ7995pFdFlAmsCUFnHhvOmT
	 Ktw7k2dAHc3HCyvoV788fKL0idtvfWI701u3P5mNkDVw86VgpmmQArJCPkOP1WR03Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=D6YH80jO;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30ACB606BA34
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:52:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30ACB606BA34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=D6YH80jO
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso40366315e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793717561; x=1794322361; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WaOsrEmAYoqVhViGwTJTcykgEVpjZAmCdFfMPnWGgSQ=;
        b=D6YH80jO1Zi3E8BghI++8Cu9HfhepHASViq5SfBFIS04slEMTPod8X1i/mUWqHfY2W
         zd4Tz0FQqjhG8x9rTNRvZIozmCT5ZOMqQL1Gka400uFMgHwy/XXzgDY8N1RoU3ntTfok
         U/tep+N9Z5yDIUbTDc4eMtJT0qxCABifQtJuCtU/ssphQwNOw128ZKDODp94P8zH1fBG
         4BvGk0fNoXwh1rZuCugurXiBhS7hzjQoEqlP3y+SEl9U3YYuG1TkAeQNlxVF0bDsk4Iu
         52bDBxScSb0AzEsJ4ZbuAID2urU3t8iHH6Lk7njgOMn1ETZWGhIORyS/njtcDrzXSNPH
         QTjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793717561; x=1794322361;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WaOsrEmAYoqVhViGwTJTcykgEVpjZAmCdFfMPnWGgSQ=;
        b=vCSK1vcMVCP0G+HdMyOuMtXNsV80juPJFnYxqyaDHnmyDgedjT6zjv3+NcjUflCgRt
         TP1eg+vnqHwq57lw6xaoDDO8zNa40J96hvlamZy7jnOm9F9C0rO72Eskmsc9EQMDiMnP
         RN4N2nL36NCQIOoKr2ySVJl4sK+uK0GKLiqfP87liup8TWFjDB8s10sy7pmASqny/e2z
         I9R6PZhRBb7J6OCeMnIDNfjgbMA1/fyZmQVLFPAYf2VNqh1oTQ7U/hyjrI8Vn9kkSTzs
         5JZN5dFCDOYP6EIyZ+rvV67B/84V+pWoDXJSGwuJR8Ugp+X3crJGKvgpuBnQqe7K2W+3
         Odag==
X-Forwarded-Encrypted: i=1; AKwUvBwmQJEV3Y+8nhsZqcOHRInc3TTg6yRSMGfxYNQyaXCBPEfYQYPZPeM8JU9p+87vrmG2WipCmgqFCKN2NoI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9NdzVUIgvB/w225Kq8YacKaTY04lHIEI0Z8PanAfilrL7hQNwL
	six63pBbBmkXG2j2BOMdSxlX/m06HRTjMOAfzSChw1j54d9LQHvog/ZFP9Ge7vtgXQ==
X-Gm-Gg: AYBFou0InhhFZzVZAlaucO4t9BZSULyJ4ueHYj/jhwEE3vK/S5PjTybl0Ok++cH3PyF
	T1FABngJPnqqwSf6KrgHMyFPE6vhxEQI8u6ZJQTL4Pr5e82gmFFAp+qCP8Hle5dY72szlNaaYC3
	DMXMYmylWEe6FSOUs6IDqeIcURI0/aroFlLQ8Fm88dB3OR9f0k4M1gVjYcZH9aJedX8mKSt9RFR
	Dy5XjWRr2QUSQof+/bNbqSp0JB17kwOOZlQMnpBhKq0AI6PPvxr6HORl3YDcwpT7X0tU6gJLJun
	vZSErC8mDo8YjrxFACiikmZP4rCzmDIdFgX1QZ/YZy4oFZ9oMvvyp/16bYORXHdUsL5dg2v43GN
	EOljqaCUZxj8PN/0wZ35WyVdUAPUFCz/b5HjbXYpxlOUJOqIQhhZibMPJD7XexAqX61sUIcj8Tt
	NIvgWz+wmpUQFXlxI0xsD45BEx1sc5QQz0h4gugMT3DVdr7K4Bezb7iV49zy/xxa8Ri5411pMwi
	s/QK4Ju88dM59hyJbMiJyFyBBvkMdIt3+7z4I1leBrdx/2dZ7HouD/x888hFu/jumRwWxypZCFl
	TXSncLRixWH7cXFTI39Ba3062BFPbbUeS2ST5O1MpaEMH6aSIYKKZNQmx2N6rEaf
X-Received: by 2002:a05:600c:8b04:b0:4a1:fb01:13 with SMTP id 5b1f17b1804b1-4ac17a3683bmr312931635e9.18.1793717560966;
        Tue, 03 Nov 2026 06:52:40 -0800 (PST)
Received: from google.com (0.182.34.34.bc.googleusercontent.com. [34.34.182.0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a555e59dsm69647405e9.0.2026.11.03.06.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:52:40 -0800 (PST)
Date: Tue, 3 Nov 2026 14:52:36 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH 1/3] KVM: arm64: Don't walk the whole IPA space when
 destroying a pKVM stage-2
Message-ID: <aun1NJNtnOeSL4oc@google.com>
References: <20261103084742.1302597-1-fuad.tabba@linux.dev>
 <20261103084742.1302597-2-fuad.tabba@linux.dev>
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
In-Reply-To: <20261103084742.1302597-2-fuad.tabba@linux.dev>

On Tue, Nov 03, 2026 at 08:47:40AM +0000, Fuad Tabba wrote:
> Since commit 4ddfab5436b6 ("KVM: arm64: Reschedule as needed when
> destroying the stage-2 page-tables"), kvm_stage2_destroy() steps through
> the IPA space in block-sized chunks, and with pKVM each chunk is a
> lookup in the VM's mapping tree. However, pKVM gives every VM the host's
> IPA limit, so with LPA2 a teardown makes 2^27 lookups with 16K pages
> (2^22 with 4K), nearly all of them for empty space.
> 
> Walk the mapping tree once instead, and reschedule after passing each
> mapping to the reclaim or unshare helper. The unshare helper can't
> reschedule itself, as the map and unmap paths call it under the
> mmu_lock. A failed unshare now leaves only its own mapping behind, not
> the rest of its chunk.

Not a problem now, but don't we make the device assignment story harder?

> 
> Fixes: 4ddfab5436b69 ("KVM: arm64: Reschedule as needed when destroying the stage-2 page-tables")

Isn't it an optimisation?

> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>  arch/arm64/kvm/mmu.c  |  7 ++++++-
>  arch/arm64/kvm/pkvm.c | 17 +++++++++++++----
>  2 files changed, 19 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 1db10d8d6db73..42977cf8a7f5d 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1022,7 +1022,12 @@ static void kvm_stage2_destroy(struct kvm_pgtable *pgt)
>  {
>  	unsigned int ia_bits = VTCR_EL2_IPA(pgt->mmu->vtcr);
>  
> -	stage2_destroy_range(pgt, 0, BIT(ia_bits));
> +	/* pKVM walks its mapping tree, not the IPA space, and reschedules per mapping */
> +	if (is_protected_kvm_enabled())
> +		pkvm_pgtable_stage2_destroy_range(pgt, 0, BIT(ia_bits));
> +	else
> +		stage2_destroy_range(pgt, 0, BIT(ia_bits));
> +
>  	KVM_PGT_FN(kvm_pgtable_stage2_destroy_pgd)(pgt);
>  }
>  
> diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> index 016997288fd23..992ed3ca6bdd9 100644
> --- a/arch/arm64/kvm/pkvm.c
> +++ b/arch/arm64/kvm/pkvm.c
> @@ -504,6 +504,7 @@ void pkvm_pgtable_stage2_destroy_range(struct kvm_pgtable *pgt,
>  {
>  	struct kvm *kvm = kvm_s2_mmu_to_kvm(pgt->mmu);
>  	pkvm_handle_t handle = kvm->arch.pkvm.handle;
> +	struct pkvm_mapping *mapping;
>  
>  	if (!handle)
>  		return;
> @@ -513,10 +514,18 @@ void pkvm_pgtable_stage2_destroy_range(struct kvm_pgtable *pgt,
>  		kvm->arch.pkvm.is_dying = true;
>  	}
>  
> -	if (kvm_vm_is_protected(kvm))
> -		__pkvm_pgtable_stage2_reclaim(pgt, addr, addr + size);
> -	else
> -		__pkvm_pgtable_stage2_unshare(pgt, addr, addr + size);
> +	/* Called once for the whole IPA space, so reschedule between mappings */
> +	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping) {
> +		u64 start = __pkvm_mapping_start(mapping);
> +		u64 end = __pkvm_mapping_end(mapping) + 1;

__pkvm_mapping_* are rb-tree internals. I think it is better to use explicitly:

  start = gfn_to_gpa(mapping->gfn);
  end = start + (mapping->nr_pages * PAGE_SIZE)

Also, I wonder if we'd better WARN if the mapping isn't aligned with the
destroyed range?

-- 
Vincent

> +
> +		if (kvm_vm_is_protected(kvm))
> +			__pkvm_pgtable_stage2_reclaim(pgt, start, end);
> +		else
> +			__pkvm_pgtable_stage2_unshare(pgt, start, end);
> +
> +		cond_resched();
> +	}
>  }
>  
>  void pkvm_pgtable_stage2_destroy_pgd(struct kvm_pgtable *pgt)
> -- 
> 2.47.3
> 
> 
