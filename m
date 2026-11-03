Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793723884;
	b=Ln7rhHjzEayYNXkHuxpX+K3nkFg/ePuPzu0RXYduR6kdFU7u0C5Ihq0WIXWadECMSM9d
	 wlnJm0vVXRAgoV1pzdFLqF1nL9Y3wNixYCfU4e0xSbhZ+UFHJm/p6JQzvnhwgUgGv5Ub6
	 BSkkfOc2Zy4e5OyCLXZ8fJEv+5d5ctbHVFLpRg0XCVJeA16YuZHUNzi1AEw+cHGO+e9Ky
	 rnRkvaM1MgsDkJ+2qd/+sUda1mhb+eA826MtK5UzW9tYiJ+NddvC5guSjF1xp2hl4nNLw
	 BpsDWLfBolBmsMMrUGKG7SYY/6o7Tb9oPf/8lYmALMAbEq7/PdMseHwxN7pr8Gn3CrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793723884;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=CWv72uCOCqMYoLAg7IauldxNcJXBuFWTSZgkJBhwQnA=;
	b=ro3418oFtNUgNKm325YdYTK6joiauzGMADVNPyVhzCErvSayNXQRIA6uiVp9PskqsMEM
	 GfYrM532HAVAGdL7xzaNuGF2TvmXTVET42ljsNQdl9n0EPzbl6BRZ6PaASgTNx2FuqvVj
	 l0pIyvT9Lk52N/PAzHJAMNKIauSzQJLNnIshvw5kCJMwlJ6RW7lf+3Skvc/7nLMiqf3K5
	 c+SGf0f/4yXD+GeUaMBdKmcuEY09y2Gpz5eHamU3KKr5ByXW2jjXHFomMbB3nUT3Xpo09
	 yJ9YSQmmOchB136iUh86dOUqjTdpe7toXRrGFBdhDQdgOJ3AAls73+k/XS28Ydbeskg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RiI7X+Y1;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE15C606A33C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:38:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE15C606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RiI7X+Y1
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e09aa5264so2243965f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793723882; x=1794328682; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CWv72uCOCqMYoLAg7IauldxNcJXBuFWTSZgkJBhwQnA=;
        b=RiI7X+Y1OQT7mlICAaroBCmsBUUfgvOQ0p1FWYX4xK2TsS4JUvL80YPyJ2N2b3fqNe
         xfZ5Gtp7r4ZUKDiFErgUXthbpVR7KImLaQzaxMInakBo+BVKJteJvhy8LhW+QyWvnIQF
         gaVDjepQEVZ/v9r25ymqgkOPqPm2sJvw1x34TaR7maPdUUB4GV2bSmUgrZSfURPLUw2Q
         Pr3Gc1mDy4DRPy0gHDyrKAH0ETu2fkts4EODd2JUEwfptI21w9JWhnlzDxIAaciME6sh
         bD9YY1M/jjVbH1ZnbkVYHhIXIQlUP6801ghr1aWv+WwOYai5vk6Z8/fYqSxkKH9YZztk
         zJcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723882; x=1794328682;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CWv72uCOCqMYoLAg7IauldxNcJXBuFWTSZgkJBhwQnA=;
        b=dwNLaNYUEMbJQ8mppZpySPQYRPBH+/tDetkc+2FmUawxNlg08symzHRwXdeCIm2IUs
         VOK0vh5e3iqtSwfXJP/axsr8rjHoTveZ1vMAGW8c+asss6hxhWo88GfoXmVDJ9bluKvz
         llaV6VQV52CHJOgoZZQRAHekV77zFIT3OCMtX67h2AK64HhCH6BjC9qO8pAbx6pp2YGO
         BHwXBxr2DAH54Z28UEEyFEAWWGUsLHFnnybopNL2lgNIpzR9ueZLfKsQIAXajdr6Izi4
         aTEuP6QXrXQx723XgYUYHZTsQ77FfrDoRf8z8RNRDXxe6Py3lI/VCkZ1XY2Fz+7PtoWQ
         Z55w==
X-Forwarded-Encrypted: i=1; AKwUvBwrd9hOxej5DArUgFR5JB9OhELzSSKrHh1f9Xqb4cnyQicP45/WycuWDM/rFqkpKom9M7qu42cMD6Cu9BI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8N16sV6IdjLjn5i25wo3Y/fjwu2MDRyXsmkYeg8ioewdWa/M59
	2Nkpgx4H4nwBr/HjfeiDd8eIEEkXFs/U0n5UxD6WC+Y7zcsMDXaVML4T7SvF8oJ42Q==
X-Gm-Gg: AYBFou20wArM6klLx9KmWb+X1wKHPmU9SKCYJLQquXS1zugKNU1ZoBHyF1b8NomsDTE
	aoOwtBmVVITmYA3W8KEpXvw9KuDP+CSL8ThKpF9PQQnk9S3CRRjQB5XHYdzceYQODG95SKxZcOo
	o1HM5wwnmT7FF+KgRJAPnFF+wG5y602FRHoivF2egUcYFCMCeX2Ys9BDSOezx++omuxmtLyppWI
	VBnt0H6DEgtCUdWcuGh8BYeS24HbJ92O7LZ3NwcrxgroSJW3wvfJxIksb5kjviUzva9mp/F0l7j
	RysegYqkh0gMW9L/swh9NNCwI5ElT2q/orCtAQP/BMaE60tHqRIdxBHmCPoB0pvmefZPYOIqw7G
	fZcI0LAZ4+13kO/cUVK10cFBfHghsRKzetMJTonvyJ1W9/7wx5txsRd4QOHPoI2hRdD/TgQ1Z0t
	iPwi5hKnc7Q5h9qIUsqINJaYXfC0OcUJIRfRMDfdy+Spk4kRTYAveNlCD+/up7O8nmyJTmESBPS
	hBRuvx6UHPj/YbOPTLktFFEGK0FNZfaTHXBzqCXTfQnn7BOaILJ2hM9NXbdB39DyhEyQma4iPHE
	entksGFqMc+Ra7Cfh1GyPW7MMweLZUmbaCwWsNOwXq796tnJ9azE8Ir2e9fS7yREbQ==
X-Received: by 2002:a05:6000:310d:b0:48a:f59f:8b70 with SMTP id ffacd0b85a97d-48e6e4f8c71mr33055012f8f.46.1793723880548;
        Tue, 03 Nov 2026 08:38:00 -0800 (PST)
Received: from google.com (0.182.34.34.bc.googleusercontent.com. [34.34.182.0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8a84esm28271412f8f.39.2026.11.03.08.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:37:58 -0800 (PST)
Date: Tue, 3 Nov 2026 16:37:54 +0000
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
Message-ID: <auoN4h8iloqPuepc@google.com>
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
> 
> Fixes: 4ddfab5436b69 ("KVM: arm64: Reschedule as needed when destroying the stage-2 page-tables")
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
> +
> +		if (kvm_vm_is_protected(kvm))
> +			__pkvm_pgtable_stage2_reclaim(pgt, start, end);
> +		else
> +			__pkvm_pgtable_stage2_unshare(pgt, start, end);
> +
> +		cond_resched();
> +	}
>  }

Just thought that it is a bit weird that pkvm_pgtable_stage2_destroy_range()
does cond_resched() while kvm_pgtable_stage2_destroy_range() does not.

How about instead kvm_stage2_destroy() refines start/end with some accessors
calling in pkvm.c pkvm_mapping_iter_first() / pkvm_mapping_iter_last()?

>  
>  void pkvm_pgtable_stage2_destroy_pgd(struct kvm_pgtable *pgt)
> -- 
> 2.47.3
> 
> 

-- 
Vincent
