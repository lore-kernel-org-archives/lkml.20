Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793099124;
	b=C4I5cixMlWLCZdXs2h/p98RoHWKYMiTXnLd//tToSh914gD1po+vg7A6U+tuWpT04lAb
	 Vh9BLpW4O1n4noG16f1+XQwVhsHMoIWeXHgJusMzcaqmvP6tB7wZdZ8FX0iNdNGbNbx+R
	 1s5JtQjZB9azvxfQROUXhtlPjSsaqVb7pOgKecMzX4ytUBdZa5QeTzV5kLudQgIh8wSvO
	 Vn4/qLyHBMXEROhvirDRgsWxiVtmVdXwbVBgR8nUsqAE43ZgPwIF6/7rG11o72KjV0WN9
	 kFzkZlrHNPYHZhZ9RXV31eZ/Ad1qyRSpHIWCFbv4KOuiuDMJwkdwkVYfvsZ89h/gmxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793099124;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=2O75Mv2XtxZlV4hudBgTA9FuTJanexSJUKv97fAgems=;
	b=sX1tnEjQqUb3hEcnRYj+xCO5dZ/LStH9dp02+vRa+3LNFN2BDk6m3vttDOOkc6zcI4jY
	 BgmN3+MzxhaRLNUKiSU2flDvu9LsPHNdteP3pwXZupzlfPppKf2ly/ilUjBDqK3aHosa1
	 F7N9WE5OCV6bPNQZA78FPdy7cxHUANo7OD/lk4aLHkP2GYmdPd8WezfYkoKWkYzVOi6AH
	 hUrQLy0qCvsfSjO+5VXI8b/RppRpJMESR6N/fBpTRuMGgfVga2xQj1YsRve45lrYipS/4
	 5sC/ExOhfxRn3vkeW8HPDkm05Gib/fb6LYRuFOSVBrOe55lskJLrwgSCrYD/big/OWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=SZ69OPJR;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA645606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:05:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA645606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=SZ69OPJR
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so22225825e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793099122; x=1793703922; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2O75Mv2XtxZlV4hudBgTA9FuTJanexSJUKv97fAgems=;
        b=SZ69OPJRddY+H9nnWKotu1i2R4KMUnlqZvVPPYfWcLE64gxp94GQaDPWkrECSH3wMe
         PpLpwDo4aD/bQ0VVwNy5vnTFwuNgc1voeqJGw87sUt/Qq2zdmcUi8fpPLeVges303CFf
         nWtsK9HF/AiBY0hhw14tUSz0Rco/P06Qdb69tPzvmli1lIFRDoPobf8HHpKFor3LGydO
         Bd5W98mJM8PtCcss0frTGzYz2NF7XQvcVAt+ODg/sGUkoag+KbQxvEKmAVQlto2kMn/S
         zjlC+4QbV7cVQuY4WlFisW9NXNH794WmiLNP7LXjt3tesv/EG0FiAD8glO428J1y8uV3
         pA/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793099122; x=1793703922;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2O75Mv2XtxZlV4hudBgTA9FuTJanexSJUKv97fAgems=;
        b=fJXhyQGZykO4KQZ39CMj2oDSkdr2sYCk/uA+uSzJg9f4ONgy5tXrgpsmkp9Dv9FaFU
         5JUNg3NsCvku3GgyW+ngBGdx+VIUe9NfWN5Q8XpzCQwis6CgA5z77Tf/YMCmU/ARVidT
         lFEvmHJr8ER2li7tMD7IpCt1weikpWE5nWagErxg5faM6+DklIfyumvnxm8vCpGSFmc+
         bto0DLrVlkIW6utx1ErCPbaNmxK42s8k57pODSWKNh4AIF9pdO2kyKNX39OG0akZIXea
         T6kmbb2Easc+Dio9cFRuPvCqm3MLSIxjf1Nd6Qgtbm091tHWX+OWtjUrAlPrvevRhJoC
         kKsw==
X-Forwarded-Encrypted: i=1; AKwUvBxj0k/E0t0jdACLS7lysUbmYfvJdSR8K622GqL6P+F8/rLd8GYZl/sX4JlXqUN0/j8o1OdLraA7K+Z1+2I=@vger.kernel.org
X-Gm-Message-State: AFq9FYK9cu8wR6nI2JkF8lE04iULaA/kKRNv8t0C/4mgozLDhjnNBgpN
	X73P0NopQEdL6JYMyj54V/cWR9Lj/IyZfGuwpMpkrX9kix8uJYU7uxxCP1aczgA5NA==
X-Gm-Gg: AYBFou0K3lU6zgnWoakYV2/5DhdgoGMIUSrRffwSmDR7m5biijLjFLZNnuMMQLnIu5s
	fc/2g4ibCgEaDm+3s04d3K6PnuETKR14ttZwQaeZh0ZDXU3wQbG0jXV3PKj00Unm+xhh9MUqYeJ
	wTUFe+aNxX+MSNCruUBYUqhyBrq4LfFWTS5E/RByRrQE5xhnYDh3py42OvFNngoMB/VbBoDlsda
	Z1RjRbUCBvPCaV98Iypw0w++lC3PM3tXpChgvFOU/CeoQWMe5Ul71xbZkNtoNoxSChcMzAUyH6c
	K1h9vGg044lqJASN0TPj+Qo/3BahJbU6ErmRcC9R7E97fclhwmBYEbigtMh0SAvKBDAcdI+jqgO
	ZlsqCv9bgNQmvEdkjrd1GVwc8mXeAePsjYXrf8o4WTUM6HBAbRLLSChHGUTWcEU8m/z4xzLKZox
	K9snDJ/OxJjN2FX0EpeGpFrIl6YryN059PWF1omkdiryF/9MbW8liE89LBA8bjJPH9jaMsk+Xb3
	14vz6DgoYS1oxaGkklPxVlAfSgLNbBqANQ9aZiNmX45QG8U/GvNzIX459MlMp+ZJ3u9hnCgEYCM
	E5sCQhvI7D2TezEaclzTcmHFrPexRFVzYLcP2Q==
X-Received: by 2002:a05:600c:4f0f:b0:4a1:acaa:c355 with SMTP id 5b1f17b1804b1-4a35ac803e2mr215293275e9.10.1793099121225;
        Tue, 27 Oct 2026 04:05:21 -0700 (PDT)
Received: from google.com (0.182.34.34.bc.googleusercontent.com. [34.34.182.0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359f59750sm174413535e9.0.2026.10.27.04.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:05:20 -0700 (PDT)
Date: Tue, 27 Oct 2026 11:05:15 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	kernel-team@android.com, linux-kernel@vger.kernel.org,
	Oculytic <oculytic@gmail.com>, Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH 2/3] KVM: arm64: Pass the PMU events to the hyp vCPU of
 non-protected guests
Message-ID: <auCFa2VPEmxx2ZcC@google.com>
References: <20261027081147.498183-1-fuad.tabba@linux.dev>
 <20261027081147.498183-3-fuad.tabba@linux.dev>
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
In-Reply-To: <20261027081147.498183-3-fuad.tabba@linux.dev>

On Tue, Oct 27, 2026 at 08:11:46AM +0000, Fuad Tabba wrote:
> From: Oliver Upton <oliver.upton@linux.dev>
> 
> Before every run, the host records in vcpu->arch.pmu.events which perf
> counters to disable and enable around guest entry, and
> __pmu_switch_to_guest() applies them at EL2. Since commit be66e67f1750
> ("KVM: arm64: Use the pKVM hyp vCPU structure in handle___kvm_vcpu_run()"),
> protected mode runs the hyp vCPU instead, and flush_hyp_vcpu() never
> copies the events into it. So the counters backing a non-protected
> guest's PMU are never enabled, and every counter the guest reads stays
> at 0, the cycle counter included. The host's counters that exclude
> guests keep counting the guest as well.
> 
> Copy the events into the hyp vCPU of a non-protected guest on every run.
> The events only exist with CONFIG_HW_PERF_EVENTS, so the copy is built
> under it. Like mdcr_el2, they're host-controlled and never reach a
> protected guest.
> 
> Fixes: be66e67f1750 ("KVM: arm64: Use the pKVM hyp vCPU structure in handle___kvm_vcpu_run()")
> Link: https://lore.kernel.org/all/20240305184840.636212-2-oliver.upton@linux.dev/
> Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
> [Fuad: non-protected copy only, tested on the hyp vCPU, under
>  CONFIG_HW_PERF_EVENTS, new message]
> Co-developed-by: Fuad Tabba <fuad.tabba@linux.dev>
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> index d715aa942577e..28a292deecb64 100644
> --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> @@ -690,6 +690,16 @@ static void sync_debug_state(struct pkvm_hyp_vcpu *hyp_vcpu)
>  		host_vcpu->arch.external_debug_state = hyp_vcpu->vcpu.arch.external_debug_state;
>  }
>  
> +#ifdef CONFIG_HW_PERF_EVENTS
> +static void flush_pmu_state(struct pkvm_hyp_vcpu *hyp_vcpu)
> +{
> +	if (!pkvm_hyp_vcpu_is_protected(hyp_vcpu))
> +		hyp_vcpu->vcpu.arch.pmu.events = hyp_vcpu->host_vcpu->arch.pmu.events;
> +}
> +#else
> +static void flush_pmu_state(struct pkvm_hyp_vcpu *hyp_vcpu) {}
> +#endif

nit: Could save a couple of lines by just doing?

#ifdef CONFIG_HW_PERF_EVENTS
   if (!pkvm_hyp_vcpu_is_protected(hyp_vcpu))
        hyp_vcpu->vcpu.arch.pmu.events = hyp_vcpu->host_vcpu->arch.pmu.events;
#endif

> +
>  static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
>  {
>  	struct kvm_vcpu *host_vcpu = hyp_vcpu->host_vcpu;
> @@ -698,6 +708,7 @@ static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
>  
>  	fpsimd_sve_flush();
>  	flush_debug_state(hyp_vcpu);
> +	flush_pmu_state(hyp_vcpu);
>  
>  	/*
>  	 * If we deal with a non-protected guest and the state is potentially
> -- 
> 2.47.3
> 

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
Tested-by: Vincent Donnefort <vdonnefort@google.com>

-- 
Vincent
