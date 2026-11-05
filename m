Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793871927;
	b=Yu3w36SJVPVnHmeUhtDXxj1rkpcLVRMgkX0eRARi3gFoZ9FAO2xmtOVMAAzLqrAx2BL2
	 48ZLV16WFEOyTc/6uqW2o+vcVuor8AmXWYlnyWKNPz2uDb0D67OG+OmCLMOUypphbY3iK
	 G4M0LKwWeSwj+ogm2GccEPzfOdfYv4h6tpRjuI3wBW1ZAYvtMpu2lootW0s+vL1d8Zhtr
	 Zw5iu6mwlzJti5IR49oaaIpJ9/67XP2JTlYFyw3VW0YQQaFVTVa7WuDPkgpWvgl2OTnwT
	 bUfAY924fdOyNt1v7XDPWYX9BG/4BwJD9q/yp7wuz2P2gBNdRAV8GjFfF2Vwu9sNM7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793871927;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=hI6E0pWdIjYridUcVEtGitpYPVkZ0Czh5YzRDUq6aT8=;
	b=TmkQjWupDKWn5emyDDYkfLjQfH2O0lJe5PletpwKIkowTd2uwWNpDdX1vo1+A35km9aF
	 fetsSWqVYTGWzqMAPbvsHrKILsNxJD+RUSodcpQycU1tn2xpgmzFdHrG79SgebGlsmjzT
	 nWIn8Gt/I7cMOqKvSFKcA2M/AhCJ1F7TWIzT7YVp2mp9qZ5Tvp9KB7eg5OgpzmjSQq89h
	 X+Ap9IaPNcV5r12yT0qY+IknYsJJhfRr36RlmRGBYsxjPHghklwbHt3yD9UYN/075EUSj
	 KIgyGzIfDQDSTTn1hn7lvqT/06S7/drK9SFQ/hE0e+A1QolToNEpHwEV9ZxjCo8WkQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mjRF0ayA;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0624C606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:45:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0624C606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mjRF0ayA
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48dfdd0678dso1332654f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 01:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793871925; x=1794476725; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hI6E0pWdIjYridUcVEtGitpYPVkZ0Czh5YzRDUq6aT8=;
        b=mjRF0ayAVGhc6Iglb2XBgW3Um2rykApuZ4i97O20j5nCTzKeqUqapHtIJJ9q38bMVd
         5AJIp73fWGSJHlrQrBatXa0tTE/XNO4xHhLKkWTzWA9wAwjPOVW7QKqh4HQUcXi6CfSy
         KdW8JVcIWedWOqUPtE7IDVDNV0ScpHu3J/59U3N/idwAN3NdOmwBRt8BmEqiSDyxnW6P
         lDyecpjWv+PM1FXPIY9l5P688c8qOBkk/oVFrnhjsyI76BrCkxO2EneCdz5RT6jv937Z
         VJQ8qDh/gAtdEElMoWk2wc7LBKC5SS8igpiKQwPLh35Hsc3F/LyKOFjLqevDTIjOH84V
         DNxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793871925; x=1794476725;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hI6E0pWdIjYridUcVEtGitpYPVkZ0Czh5YzRDUq6aT8=;
        b=Wn9WEKDdi7/ionGqwM0m5bancUNw2rKGDvSNVoTt25t0W4AUoTmSof1envD0x4vE7Q
         Nl0qErfxsYp1EsRKHbu/O2JgmZXDcah5NiKxRP9HtMDV/0QUmI+mEteVifk0WESIfmJ5
         DYpVL44abyZiT7arT+bUTgySjhrRwTtNpigMk4hYU5fxid07ggOQY4nJMSs7NJbXgSD3
         /3nlL3uR8TRAZZuGqoKr2xEiIe038ol2yW6KDg9oWo8I0mNP/QunA+ilDn69B7+V+lJv
         o817MgMZ5/7t3r+q2o0syq0+XJ1KeNR2b4oxh3c+ao6Gh04yIXaL7eV/F1V0xayoM1o5
         kCgA==
X-Forwarded-Encrypted: i=1; AKwUvBz/c79npCb26zB+mIC9D64OAiydSHSHMx90Nes/i5DaY7aDQZIVHkzQLClazhKJe5gZujKGbmxpsfClCS4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Bn3xMCb4wKyC6rg/plNF6Q3sxrkR+hKRnThCChhTaNXPLMMrf
	2uqwa/ou5w/eFoHhuWfz4qwYOkOJfP7xwr+oDwdeB1e3NdqZooGEILkyR9Z/87kVJQ==
X-Gm-Gg: AYBFou12gxiS+iEmhNi4WkwcooY9fOOi7s37ZvA3WSjXEgncyKRp8uogqY8P+kjJLNj
	YFmYI68juRpqwm6hUuxDqg8FZSNhoU261QZVwlCDuIvvBK/Yg8xwy4EHnDVD3TM5leBs1ig5DyA
	X60bMmsZDRqvzUTf1jH11yOjs1IZA+cwhTLotFII9j/7pU/13KcVZpUbK5JR+16BY4zA79Lih/c
	s8ntUcT1gJXPa2OP3YP4PWXrxp0dqPUBetFVjbLqOgo+oxIZpEE2/L9ugTY5jDcBKuENDPAYvBQ
	+MBSXVQh4xR3972JCgh5ijxs/+Vz4f4/AKYbncZc5lTgK5bzaW0rgk+WUvAn8WnUY+u4ELZqfMS
	m9mFkGhZdBD5Gx91MyQQFb1QtBliV9xK6IZqpaYH77xiR64NpFlFicd00zu5xYbTMPDHLEzdLrk
	JfMX4MCStLzJ92B/DkK/zTyved17RTp5KNWOqVMLuNI8KM8f9OKBBlmE1fOLXG9ce95JRA3IcJE
	8w2SSOlF/gQtTFSBbhczyr4b8yrfcP41H3NamN4GpnJd494LlYZEEOsu7BH0zADsSAI9sn08J4S
	A/dGKN5810KS9dzTDXIroitluay1ZSKr0POxN25U7x9I1hZmIZzHNXp4afRyqGR1
X-Received: by 2002:a05:6000:1842:b0:48e:3cec:b852 with SMTP id ffacd0b85a97d-48e6e500962mr42464044f8f.40.1793871924816;
        Thu, 05 Nov 2026 01:45:24 -0800 (PST)
Received: from google.com (0.182.34.34.bc.googleusercontent.com. [34.34.182.0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fece998absm9721233f8f.22.2026.11.05.01.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 01:45:24 -0800 (PST)
Date: Thu, 5 Nov 2026 09:45:20 +0000
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
Subject: Re: [PATCH v2 2/2] KVM: arm64: Resume a pKVM stage-2 teardown at the
 next mapping
Message-ID: <auxQMCboC9bhfW7h@google.com>
References: <20261104124451.2148724-1-fuad.tabba@linux.dev>
 <20261104124451.2148724-3-fuad.tabba@linux.dev>
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
In-Reply-To: <20261104124451.2148724-3-fuad.tabba@linux.dev>

On Wed, Nov 04, 2026 at 12:44:51PM +0000, Fuad Tabba wrote:
> pKVM keeps a VM's stage-2 mappings in an interval tree, and
> pkvm_pgtable_stage2_destroy_range() releases the ones in its range.
> stage2_destroy_range() still calls it for every block-sized chunk of the
> IPA space. As pKVM gives every VM the host's IPA limit, a teardown with
> LPA2 makes 2^27 calls with 16K pages (2^22 with 4K), however little the
> VM maps.
> 
> Return the address of the next mapping instead, or U64_MAX when none is
> left, so that the teardown skips the space between mappings. No mapping
> crosses a chunk boundary, as pKVM maps at most PMD_SIZE, so the next one
> starts at or above the end of the range. A VM without a handle doesn't
> have anything mapped, so return U64_MAX for it straight away.
> 
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>  arch/arm64/kvm/pkvm.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> index f21c3326dda68..77315c83c61b3 100644
> --- a/arch/arm64/kvm/pkvm.c
> +++ b/arch/arm64/kvm/pkvm.c
> @@ -504,9 +504,10 @@ u64 pkvm_pgtable_stage2_destroy_range(struct kvm_pgtable *pgt,
>  {
>  	struct kvm *kvm = kvm_s2_mmu_to_kvm(pgt->mmu);
>  	pkvm_handle_t handle = kvm->arch.pkvm.handle;
> +	struct pkvm_mapping *mapping;
>  
>  	if (!handle)
> -		return addr + size;
> +		return U64_MAX;
>  
>  	if (pkvm_hyp_vm_is_created(kvm) && !kvm->arch.pkvm.is_dying) {
>  		WARN_ON(kvm_call_hyp_nvhe(__pkvm_start_teardown_vm, handle));
> @@ -518,7 +519,10 @@ u64 pkvm_pgtable_stage2_destroy_range(struct kvm_pgtable *pgt,
>  	else
>  		__pkvm_pgtable_stage2_unshare(pgt, addr, addr + size);
>  
> -	return addr + size;
> +	/* Mappings left by a failed release are still in the tree, so look past the range. */

Hum, not sure I understand that comment. Which release are we talking about? The
_reclaim or _unshare? If yes, we don't propagate the error and WARN if any of
them fails. So we don't expect any failure here and I'd say there's nothing
special to do?

Additionally, in any case, iter_first(addr + size) seems like the right thing to
do and is self-explanatory.

> +	mapping = pkvm_mapping_iter_first(&pgt->pkvm_mappings, addr + size, U64_MAX);
> +
> +	return mapping ? gfn_to_gpa(mapping->gfn) : U64_MAX;
>  }
>  
>  void pkvm_pgtable_stage2_destroy_pgd(struct kvm_pgtable *pgt)
> -- 
> 2.47.3
> 

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>

-- 
Vincent
