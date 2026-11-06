Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793987511;
	b=yXKduUJ3ufRU8gYdGd76s1mXCQVjCUoc2Eom9e5bZ/Ois4HkzI0dG+kw17H3J8rGRAsS
	 mXf6m5ImIrvn1mG5NFwQjknYT1QsqL8aVdd+cKubCySpgPKLVqv1u44RET1qO1ZgWyx+M
	 g9VAw4ZOx7Z2FEDn2Ld8Q4yOu4Rbe8K7Hy/z6x46Aqutv+ZOhwwLh78yGvVJDEskSkbgt
	 8nx9LAN7HTMOy6FKJx0Gj3rPEwpCQwVEsuTwlR8k+cHETKCMdAp++0AL7pCuyp+o6HYQJ
	 vdtcSdHtZOjB5kDTOwielxTxkHIfI4aRMxxFVjTnzsh8mcR8IeDVddSDbatuwjz8QyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793987511;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=6WEB/QmqGNShWN2WfpdxFDs5dt086xZeyrUN/pg7o0I=;
	b=KzawSQgwmCCJ8s3UF/PW72Mxt3rrPNmAHqmw69Jzul71qZATT0HBcK0BspWJVOkZhX6w
	 RuGg+83Rkp6WtTYdlaViLLLOP0CGcaFCuCMNw0BNeNGtMX2MjJw3aJXGZQhGcjC2BsKAD
	 Dkc610zruTEVrXxEclA5wt4ji3UFmQTBmR14RVFU09Z/SP2bKevI9IcmzRO1kcH1jzqDm
	 xDrq01KRm0mzlz2IXln31LSFZJFWfe1rtOa9DVQZFCSdCLoXhJqvG6G0BqldQz2F0EdHY
	 IHVmVK63pWnvGGvYjuFOXNlauy99ks5aQi7hg5b0XHQs92p31kQY78RB54aVU3OyCrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SfWnW+pY;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D7B606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:51:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29D7B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SfWnW+pY
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4b7252a32c8so8087435e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793987509; x=1794592309; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6WEB/QmqGNShWN2WfpdxFDs5dt086xZeyrUN/pg7o0I=;
        b=SfWnW+pYyUwOMGSdBGHMoixeHCbffSAajOYltsvFXeb8G1aGGwNOsjpy/pzGGJH5co
         F2k0Qp3wT79r1aCHEa8tnSJ9jfgUrxBq2e8qN/4yZep8COwwSF7U3p7/R563H+mBLl28
         D0cldKz+2DVmlWdEqgteclR45OM0JP+weL/agwc3ez+2gMONtMFvdEtSEO7OI/6NX+HB
         v+zEx2pxCv83ynG42gi9aOuRQ6SuHXQy6T1Wpg1QRmMbLy+1/YAJHEnByWy03Zgf5+66
         /eqvLlDqpxDcqwycbg8lZPAZmZusX1LrD0zXCv5gOpm1U3vGcEuOBfZQAT3Wa8Ckf4Kd
         xI4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793987509; x=1794592309;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6WEB/QmqGNShWN2WfpdxFDs5dt086xZeyrUN/pg7o0I=;
        b=Aa16PzpJAws5Xvq2htZso+qz0JWxJftTw5Zoujsr6BMUwiIESRsiudMLNhATfBQvKy
         kkxf5IV/242lJdbXpTiLxdkjWEbodWcEsSgu1+yq/iIoCXZZgCI5NMUZ4JXhBY07hB3a
         evhfjyMPnxiJSvp6g5PBHkmlIH88SB0LyZCIQ8MjLbtfD2/eA9Bp0D0yrUcG9FHo2vbo
         EIoAH17GBxq7EpWxajh+kNIknhwsxSazjt5SBCuaiDYFRGC6UPethYkjt2rtFXcZxvBW
         IWi+SmkFytaDgOJNi4DXq6uC+TdNrwPzsWzyIFbpfq1l3wfF1pFxxb/twvTQ4soC3cPZ
         I7bA==
X-Forwarded-Encrypted: i=1; AKwUvBwb/uKIVOLEibs0w4rlAvw5WrVcxUYeJcHiiujpZb2k9EvTXBX3NTs88pAgJV/wnufdsmlv4fYAYYqe1Yo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/7z+l0tuXqQtKWD3lDajE1wn5vqTL1uYYi0yvAdPK2TAQqD6hK
	yI3f3unNaM7F+nFeSaOk1FsN/jkQ/XlbGdH34MVNyDhXk3MA/rF9szfKnDHWSjoqaQ==
X-Gm-Gg: AYBFou1QmjuCLdR7moAAlEzZcH5rBk33dutBEa41tZZeY3xOUtDdqW+KxhDcu98YUoP
	WfZ4xYwOyjxNSuZlWVrGGqSVb/B/ZBEI/80zBZ9Z+Hv8Ch1iby0oC72Q6sjqqIOoDTyAwrPpe5O
	7ln5lWAO72ZFwLO9YBByxDHnbiKqCuNSRDaMmr3c5dFAvEJs4VLhOxKeMGFHb13UhsThQTMx/G8
	3P6YKUXfPCAqLNGLO1aTn523rGWqKNU6tbiTtQ5CY0WEqW4MxrrR0b/oOLgfrQQmXFDies2ijsX
	/TleC17LhrGkA2AcVzq5bnrW5isatvvkYIEXObGFergNxJFYvmTGwqsfvVu6v3Ij92PCAOHCK73
	M1PRuSZQ4v3kD9TCgxyRny8lEaJ5+5ZytgJlKuAf6v9gPK+zee962fMJ9Ssot7rrJlSFJpEqV2k
	VfpWjMibaZZsJ80Ixi4eghf1oBWXXYCwxzC3q1nTA0z947Qkk8mJ3IaKUzUlkq7Yu7Nr3WCKkry
	XFtAScVn9O6S6+B1R4jras5AZN74qXJ8CH7AEXr3ZxarZc5NxOi+XXppL8FwGf8yqqmRSTdgMf4
	9/juKNksmLFzYaAHF2bLckCfd0iM1h2LGaO1TcoyfFD+d8NvOR5G8oCbEjK0+eNOiGF1ZVgj1lM
	32D4gT4m1eA==
X-Received: by 2002:a05:600c:620c:b0:4a1:813f:2a60 with SMTP id 5b1f17b1804b1-4b6dea6881fmr58086205e9.11.1793987509034;
        Fri, 06 Nov 2026 09:51:49 -0800 (PST)
Received: from google.com (0.182.34.34.bc.googleusercontent.com. [34.34.182.0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b76cbd082dsm7811725e9.1.2026.11.06.09.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:51:48 -0800 (PST)
Date: Fri, 6 Nov 2026 17:51:44 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Fuad Tabba <tabba@google.com>, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] KVM: arm64: Allocate a protected vCPU's SVE state at
 EL2
Message-ID: <au4TsO50x7BcFYpi@google.com>
References: <20261105130456.1617185-1-fuad.tabba@linux.dev>
 <20261105130456.1617185-3-fuad.tabba@linux.dev>
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
In-Reply-To: <20261105130456.1617185-3-fuad.tabba@linux.dev>

> @@ -1243,6 +1253,9 @@ int pkvm_reset_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
>  			    PSCI_0_2_AFFINITY_LEVEL_ON) != PSCI_0_2_AFFINITY_LEVEL_ON_PENDING)
>  		return -ECANCELED;
>  
> +	if (vcpu_has_sve(&hyp_vcpu->vcpu))
> +		memset(hyp_vcpu->vcpu.arch.sve_state, 0, vcpu_sve_state_size(&hyp_vcpu->vcpu));
> +

Why wasn't this line around before?

>  	kvm_reset_vcpu_core(&hyp_vcpu->vcpu);
>  	kvm_reset_pvm_sys_regs(&hyp_vcpu->vcpu);
>  
> diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> index 32e82653ebf7e..06ea91415ad8b 100644
> --- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> +++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> @@ -570,6 +570,7 @@ static const struct sys_reg_desc_reset pvm_sys_reg_reset_vals[] = {
>  	RESET_UNKNOWN(MAIR_EL1),
>  	RESET_ZERO(AMAIR_EL1),
>  	RESET_ZERO(MDSCR_EL1),
> +	RESET_ZERO(ZCR_EL1),
>  	RESET_ZERO(CNTV_CTL_EL0),
>  	RESET_UNKNOWN(TTBR0_EL1),
>  	RESET_UNKNOWN(TTBR1_EL1),
> diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
> index 10eb7249aa9e8..aaaa1b8634ba4 100644
> --- a/arch/arm64/kvm/reset.c
> +++ b/arch/arm64/kvm/reset.c
> @@ -52,6 +52,8 @@ int __init kvm_arm_init_sve(void)
>  		if (WARN_ON(kvm_sve_max_vl > VL_ARCH_MAX))
>  			kvm_sve_max_vl = VL_ARCH_MAX;
>  
> +		kvm_nvhe_sym(kvm_sve_max_vl) = kvm_sve_max_vl;
> +
>  		/*
>  		 * Don't even try to make use of vector lengths that
>  		 * aren't available on all CPUs, for now:
> -- 
> 2.47.3
> 

-- 
Vincent
