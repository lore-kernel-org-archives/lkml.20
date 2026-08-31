Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43622349B0D
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 04:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788152300; cv=none; b=UtApVlufir9fuBZj73l51T9cn9vxA7QD1A2oi3HObTsXlZ74Aw5mNIZtYo6SbuPWEMOPhsDgohT8AzBfdDTMoBPnEsU7Ol3cIYi5UAdLPi0QBPd4hRsC459zNlLmYwDMEdG7wKw/Xtrnq6ieS9HlBZG2OGSravVIr7OuOf6b6Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788152300; c=relaxed/simple;
	bh=C5e/TkXFiieLUlHtf0Rh7Lv20QTCszBHR/KFzsu98Rc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q6y3YZ/yvZkbWuQWMuTNbJlJtnNvlf00oQHGfVTLeACoLuKRfs9wIKpG0XTnY046JSFfS4MDD2W52UVj4LGAu9TAQ0haDlici+be/vu3ROAfsh17sp1XrR3XkL3kucPSaOyaLj1yixSHxNfpxWBOE3kXDrPyh79DnpjY6HO3fY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OKKHN99w; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OKKHN99w"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d9004f39d3so11733285ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 21:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788152299; x=1788757099; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=en4AmD5hCeuCuRbL6FUrsGO5StL0i22HAbZmjfcxvuw=;
        b=OKKHN99wwB05q6EViC1WRK70ZdFmQL0hahe0titUWWoKqNvpTIvivZvUHFFu+0wFnK
         4O7YKAcnbpFQ6gBr5bURnFghacUZd8iGUYAbAfdXJiUmgX6IEGqr+tNM0Np/QEWYGgo+
         6Ne7wr6yeqZ4csK1v/Rx+ZiA92Sr7L6eHHh4icULF6r1gxHRktHFr2x9q67eQ0CiqeYV
         NLfgw5NnG/9KCZtRIsNAfu++aOU/pMM60+kuc1jNe/iZPJ9WZg04z9OxJB07CAh0ZrSk
         hLpclFVe64+zxVHoHTus1e8QP8TZ+w389mx5jj3+OrBKoCyXiBFxrai/toisai8o7TZf
         tvhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788152299; x=1788757099;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=en4AmD5hCeuCuRbL6FUrsGO5StL0i22HAbZmjfcxvuw=;
        b=DTYjhVm5tdskipSsOUHRBhx0dWg3K9cUYQRVVFm8NQJlU7r0qJvf8qmuBZJb2orUMY
         C6ykWa4stUWHfqToO+4Y5O8l2hYhbej8u0sCx+5MO557VF2jszyx4qQ4X9hPaXVLcZQA
         0UVHu13EhKHfTzwBKIV3kS8Qe/fDhprITocVqlnterwjHhfCqAXwZb/hJ5V9nXWFXWhc
         nEETfWL89njk0i2KbVySLlkzCZOLJxtiF0zXJ7S7hEXNRqttKlAW3peLKQLN3MkX4nPO
         tCFYEbuHsGkCKwOZWnrZ8QPkYjdsNmDFcRNW0jq0H4q+P7pMmTeEQQOanvGai51bYdvm
         ju0w==
X-Forwarded-Encrypted: i=1; AKwUvBx5qH+xyesSxPBqWkf6aX/tD1Hh9tIGFKu+spcCd+ANaRa3NYsDagbhHm6DvN/G8RU/x+blT+Qa/fvg9gc=@vger.kernel.org
X-Gm-Message-State: AFuF++nl77s8RygjxYbXKoFMRNcyOcTzp2Q7FFV9q//u0kdrGXnb9J5z
	4ih1iXwQGMzuoV9tBYGLPYM5yWvHvQR984riaFp+6R/fcUDGeE4x8u/c
X-Gm-Gg: AYBFou3/5BI+4ZeclEAhWwv+8Eh+rOT89Emvvvjnb6nh0LcLB/144CnWBur/EzelpQ3
	qrhJuNDpa9VXBGUwaWbwlK1laxuRpCc1pezq/CqRdjYz0nlWJzrY1p6XtoPufocMsmHSNdgR8z9
	zJ8wmmccMiwkq3cOnPFT6sucQuBzf2nlmL6HJDt75tM5OOBKQb9mxs49saNu0aVd6IVQob4/91d
	emXQeS7PKMh4kJb46OIL+LTfKSUWjL+ieVKzF9zOBvaxkK5JbaOZn6Eas0VZFRNTkWp8z4eibn5
	ecgyVcHBoxWytDNvsPm6xVChL9v1mMI1G4gZXsPdZcoRdkCdEnhocKQFZtDeWrb9V2AZ42qnlnP
	L360ordgyi+lD3Pw8xye4/zKuG9xKdBzpSTjcprujn2cYKvcwm7sduLNznwXgRLA6lnA4bcJ+hM
	0W4RGWl5wEusfKrLDB4zwewKJH26kYkTeT7CeySndLowIArljiYzqPo5oCpoXLognE13kPnARRa
	Tb1bDyS6oMfR8Vrjfot+RlNqEb2Mwgc7w==
X-Received: by 2002:a17:90b:2e4b:b0:393:19a3:4f1 with SMTP id 98e67ed59e1d1-396d0d7b9bdmr35544502a91.6.1788152298604;
        Sun, 30 Aug 2026 21:58:18 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([49.43.112.37])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f8094dasm27903206eec.13.2026.08.30.21.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 21:58:18 -0700 (PDT)
Date: Mon, 31 Aug 2026 10:28:12 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Gautam Menghani <gautam@linux.ibm.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, ritesh.list@gmail.com, sshegde@linux.ibm.com, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] powerpc/configs: Add debug configs for debugging
Message-ID: <apUJnx1jpdfHLaVa@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260827121309.94434-1-gautam@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827121309.94434-1-gautam@linux.ibm.com>

On Thu, Aug 27, 2026 at 05:43:08PM +0530, Gautam Menghani wrote:
> Kernel has multiple config options to run extra validation checks that
> can help catch bugs. Define new configs for major subsystems to
> make it easy to enable the debug config options for a given area.
> 
> Signed-off-by: Gautam Menghani <gautam@linux.ibm.com>
> ---
> v1 -> v2:
> 1. Split the enablement of configs into pseries and powernv configs.
> 
>  arch/powerpc/Makefile                    | 32 ++++++++++++++++++++++++
>  arch/powerpc/configs/common_debug.config | 11 ++++++++
>  arch/powerpc/configs/locks_debug.config  | 13 ++++++++++
>  arch/powerpc/configs/lockup_debug.config |  4 +++
>  arch/powerpc/configs/mm_debug.config     | 24 ++++++++++++++++++
>  5 files changed, 84 insertions(+)
>  create mode 100644 arch/powerpc/configs/common_debug.config
>  create mode 100644 arch/powerpc/configs/locks_debug.config
>  create mode 100644 arch/powerpc/configs/lockup_debug.config
>  create mode 100644 arch/powerpc/configs/mm_debug.config
> 
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index 9385db478c59..818aacace875 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -352,6 +352,38 @@ ppc64_randconfig:
>  	$(Q)$(MAKE) KCONFIG_ALLCONFIG=$(srctree)/arch/powerpc/configs/64-bit.config \
>  		-f $(srctree)/Makefile randconfig
> 
> +generated_configs += pseries_debug_defconfig
> +pseries_debug_defconfig:
> +	$(call merge_into_defconfig,ppc64_defconfig,le guest kvm_guest common_debug)
> +
> +generated_configs += pseries_locks_debug_defconfig
> +pseries_locks_debug_defconfig:
> +	$(call merge_into_defconfig,ppc64_defconfig,le guest kvm_guest locks_debug)
> +
> +generated_configs += pseries_mm_debug_defconfig
> +pseries_mm_debug_defconfig:
> +	$(call merge_into_defconfig,ppc64_defconfig,le guest kvm_guest mm_debug)
> +
> +generated_configs += pseries_lockup_debug_defconfig
> +pseries_lockup_debug_defconfig:
> +	$(call merge_into_defconfig,ppc64_defconfig,le guest kvm_guest lockup_debug)
> +
> +generated_configs += powernv_debug_defconfig
> +powernv_debug_defconfig:
> +	$(call merge_into_defconfig,powernv_defconfig,le guest kvm_guest common_debug)
> +
> +generated_configs += powernv_locks_debug_defconfig
> +powernv_locks_debug_defconfig:
> +	$(call merge_into_defconfig,powernv_defconfig,le guest kvm_guest locks_debug)
> +
> +generated_configs += powernv_mm_debug_defconfig
> +powernv_mm_debug_defconfig:
> +	$(call merge_into_defconfig,powernv_defconfig,le guest kvm_guest mm_debug)
> +
> +generated_configs += powernv_lockup_debug_defconfig
> +powernv_lockup_debug_defconfig:
> +	$(call merge_into_defconfig,powernv_defconfig,le guest kvm_guest lockup_debug)
> +
>  PHONY += $(generated_configs)
> 
>  define archhelp
> diff --git a/arch/powerpc/configs/common_debug.config b/arch/powerpc/configs/common_debug.config
> new file mode 100644
> index 000000000000..a341c8b41468
> --- /dev/null
> +++ b/arch/powerpc/configs/common_debug.config
> @@ -0,0 +1,11 @@
> +# For use in CI testing
> +CONFIG_EXPERT=y
> +CONFIG_PROVE_LOCKING=y
> +CONFIG_PROVE_RCU=y
> +CONFIG_KASAN=y
> +CONFIG_UBSAN=y
> +CONFIG_DEBUG_PAGEALLOC=y
> +CONFIG_DEBUG_VM=y
> +CONFIG_DEBUG_OBJECTS=y
> +CONFIG_DEBUG_KMEMLEAK=y
> +CONFIG_DEBUG_STACKOVERFLOW=y
> diff --git a/arch/powerpc/configs/locks_debug.config b/arch/powerpc/configs/locks_debug.config
> new file mode 100644
> index 000000000000..b2cb23de75db
> --- /dev/null
> +++ b/arch/powerpc/configs/locks_debug.config
> @@ -0,0 +1,13 @@
> +CONFIG_EXPERT=y
> +CONFIG_PROVE_LOCKING=y
> +CONFIG_DEBUG_LOCK_ALLOC=y
> +CONFIG_DEBUG_ATOMIC_SLEEP=y
> +CONFIG_DEBUG_LOCKING_API_SELFTESTS=y
> +CONFIG_DEBUG_MUTEXES=y
> +CONFIG_DEBUG_SPINLOCK=y
> +CONFIG_DEBUG_RT_MUTEXES=y
> +CONFIG_DEBUG_RWSEMS=y
> +CONFIG_PROVE_RAW_LOCK_NESTING=y
> +CONFIG_RCU_EXPERT=y
> +CONFIG_PROVE_RCU=y
> +CONFIG_RCU_TRACE=y
> diff --git a/arch/powerpc/configs/lockup_debug.config b/arch/powerpc/configs/lockup_debug.config
> new file mode 100644
> index 000000000000..ad0a79abf60f
> --- /dev/null
> +++ b/arch/powerpc/configs/lockup_debug.config
> @@ -0,0 +1,4 @@
> +CONFIG_EXPERT=y
> +CONFIG_WQ_WATCHDOG=y
> +CONFIG_DETECT_HUNG_TASK=y
> +CONFIG_PANIC_ON_OOPS=y
> diff --git a/arch/powerpc/configs/mm_debug.config b/arch/powerpc/configs/mm_debug.config
> new file mode 100644
> index 000000000000..0e88eb983536
> --- /dev/null
> +++ b/arch/powerpc/configs/mm_debug.config
> @@ -0,0 +1,24 @@
> +CONFIG_EXPERT=y
> +CONFIG_DEBUG_PAGEALLOC=y
> +CONFIG_DEBUG_SLAB=y
> +CONFIG_KASAN=y
> +CONFIG_KFENCE=y
> +CONFIG_KMSAN=y
> +CONFIG_DEBUG_KMEMLEAK=y
> +CONFIG_DEBUG_VM=y
> +CONFIG_DEBUG_VIRTUAL=y
> +CONFIG_DEBUG_OBJECTS=y
> +CONFIG_DEBUG_OBJECTS_FREE=y
> +CONFIG_DEBUG_OBJECTS_TIMERS=y
> +CONFIG_DEBUG_OBJECTS_WORK=y
> +CONFIG_DEBUG_OBJECTS_RCU_HEAD=y
> +CONFIG_DEBUG_OBJECTS_PERCPU_COUNTER=y
> +CONFIG_SCHED_STACK_END_CHECK=y
> +CONFIG_DEBUG_VM_MAPLE_TREE=y
> +CONFIG_DEBUG_VM_RB=y
> +CONFIG_DEBUG_VM_PGFLAGS=y
> +CONFIG_DEBUG_MEMORY_INIT=y
> +CONFIG_DEBUG_PER_CPU_MAPS=y
> +CONFIG_DEBUG_KMAP_LOCAL=y
> +CONFIG_DEBUG_HIGHMEM=y
> +CONFIG_DEBUG_STACKOVERFLOW=y
> --
> 2.54.0
> 

Thanks Gautam for this. we'll be able to catch a lot of issues earlier
with this.

Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
