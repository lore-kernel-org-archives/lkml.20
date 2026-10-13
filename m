Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46CA251EDE7
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 16:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791910653; cv=none; b=D1NuNgtOhMbsoYRwoWJCBqAH7fbllDFFy378kQNLBswCKdBrpRCM1jn+gaT2IMZu3h+UFCYRNFGX4NaSAohml9zDlvU/b08GkARgOgM+vbyaSf0Zv9RKXjDhc4Tp9SmfXHrZutcemIytemUo5qfbGjtNh6XV+2X9E0bzVc6+NPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791910653; c=relaxed/simple;
	bh=qYQWDTibvD2MkpejwirfPbddi6j2h68uQWyAL8beWRM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M/GoVX85iRqzkTC/5dQwLnqT8oDsqPnT+BKGf+sjxCKdOad0CZUwjR16PqMhZhrby8bjm/5k2br3yLt5zafWJR4Xhw8Uzt7cOBpVUaSVpmJSbbTIMZpQgDWm9l7K2uyDyaRPOP036CWpjXYqQd+X3XrVLrNRGcy0OPiSxnxYGik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=JUiXyT3j; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="JUiXyT3j"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b09e07e149so1450767b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1791910650; x=1792515450; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xs8kx4XmYGQ3LYVznuwYx1llCxD9uoGbHIj5ZitGfaE=;
        b=JUiXyT3jQhncfJqytMm1K64OnZ2UI5zTsbZEtfZFzc39V//7ZoorASJT3Yn7W59S6Y
         LATFgI5UFISSArlwGlyX6qYcEfRo2NWnSZZUd4Zunk1L0je7iJgfqUFgbs070w0qcyEU
         frjfm6xq8t1WPVmL8ArGDK5cPq3KAl8ZzgbRoSQPXTOdt3Mj5SHtUEpMpverodQUoVRX
         87hYNxRPAHc66Nna9EnZAem5KO0DglVIK6BFlWfDE9lYSaEHIz2psK8m7a7Xry38Znqb
         SnSaGrpE/YMz+VmmjR2t6KB1yEXjkG3y12eNed68vvH79MdsN0x4d7KpLR+COofab5Ad
         nE4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791910650; x=1792515450;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xs8kx4XmYGQ3LYVznuwYx1llCxD9uoGbHIj5ZitGfaE=;
        b=W63961Ur3eLtpOH6GByAcuAIQVE18c4KJzcAMrbggkMHEwonouTBne7lEi+EAeX+Rw
         LRmz4YKjzf73zcwjTO2MIiE0RmmzCJ/N6uI0rv21uHc8JiabLOIxuAMNHW6SHv2yJC9k
         juIhlERocKYqrPg4xtgEQAkwbvgiZWH3yU5gDbt9lIaK/tVtJQ4btaCGoZLYwjDf3svG
         rM3rDKwew5pK+dEpQJKourL5LCMM3DiCjR6FsTP5UdqHF++5Y3TBf/eVZoh5+qgMWtUo
         Qad3t6W68KShKH0mNnmeh2Q5uFXu/OD57TtoF2ixNHoPnjD06jPLkSH4PxJL32IrtcSB
         mY4w==
X-Forwarded-Encrypted: i=1; AKwUvBzSxA8o7tDyvqoqm2M4rW8FNwrzjwhhi5xaDYsOPvfxsgxiCWjifVcSbum7XONDQvbroNqg/yufdeDFKPM=@vger.kernel.org
X-Gm-Message-State: AFq9FYI8DJtdGlEx7LzEeC9ZkoM4sbS1TNsb1TyAi/Bxha+NXeA5K2hE
	8a/Zf4qjeo0DXU+bnQo8xiHEGKhbIhoTgULHq8vRwLEc6JysdCDTxdxbcxL2XHNzQ9hh9BtcSXT
	yCQvB7Bfiiw==
X-Gm-Gg: AYBFou2AWMbIYFaOBKEQvUlhy/PBakEDZas5cXb7/pJJBLQ61rq9mlKKJ8x34D+IvEk
	IOgYDaJ9gV7d83C/qz4UAjHq9Qh9HhAmrjBfQuEs59DkJ/GdXCpOBJZ4kTcM5Inpp3ORTVFL5Pj
	TK8zRMJdtu+7m0awRrs+SUKtszH/jKiJ1TRJIM94DtTDF4sLYezE8dtpLrnotXOHidb4GNZaOCA
	iF5+GKP/iIv35iw4Zw/vSiWhorYV/gC5GNshj8qs/JdZJR4EuG1AHZY57AFTz8TzQB2KU6zWos5
	qqohmnSHqgkb3VUuceMxuoscmsSSlXuEFgwXJHd7Sh5+bEKsFdo5bg9DEdZD92uiwbCHEawFe8J
	sLroYZs3WZwrMNQyAupqs99YcdLUn6KLPZZAa9hVcqt5zEVFkBOQcrfq8Fv7oO/ZwqMWywTRqna
	2ybrBIUpMjaB5vJ7T4BPoxoHM24RA84CXohTVT0FwoMONyOfQSM/xOXSWCG766kwfTA85UznxSJ
	z6fG01pm5vAD/nj/rAt
X-Received: by 2002:a05:690c:e3ef:b0:8b0:ad16:71f8 with SMTP id 00721157ae682-8b0ad167c9dmr17620697b3.11.1791910650173;
        Tue, 13 Oct 2026 09:57:30 -0700 (PDT)
Received: from localhost ([2600:1700:220:5c80:d01e:ebe9:3ad:261f])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b07f21eccdsm47207617b3.30.2026.10.13.09.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 09:57:29 -0700 (PDT)
Date: Tue, 13 Oct 2026 11:57:28 -0500
From: Andy Chiu <tchiu@tenstorrent.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Paul Walmsley <pjw@kernel.org>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Palmer Dabbelt <palmer@dabbelt.com>, linux-kernel@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/3] riscv: Deprecate vector state prctl/sysctl
Message-ID: <as5i-FZoL79anjkV@Tao-Chiu's-Mac>
References: <20261007085126.222688-1-samuel.holland@sifive.com>
 <20261007085126.222688-3-samuel.holland@sifive.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007085126.222688-3-samuel.holland@sifive.com>

On Wed, Oct 07, 2026 at 01:51:17AM -0700, Samuel Holland wrote:
> The ability to prevent userspace from executing vector instructions was
> provided as a escape hatch for software that was broken by adding vector
> state to the signal context. This appears to be unused in practice, and
> creates confusion in the extension support returned by hwprobe(), as in
> this one special case an extension reported as present by hwprobe() is
> unusable.
> 
> Since we believe it is safe to always allow vector usage, hide the prctl
> and sysctl behind a Kconfig option and mark them as deprecated, so they
> can be removed in the future. Note that significant userspace software
> like glibc already considers these controls explicitly unsupported.
> 
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

Reviewed-by: Andy Chiu <tchiu@tenstorrent.com>

> ---
> 
>  arch/riscv/Kconfig                 | 10 ++++++++++
>  arch/riscv/include/asm/processor.h |  4 +++-
>  arch/riscv/include/asm/vector.h    | 16 ++++++++++++----
>  arch/riscv/kernel/vector.c         | 10 ++++++++++
>  4 files changed, 35 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index e26450f0d38fb..83e52a0a85ba7 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -650,6 +650,16 @@ config RISCV_ISA_V
>  
>  	  If you don't know what to do here, say Y.
>  
> +config RISCV_ISA_V_VSTATE_CTRL
> +	bool "Deprecated prctl/sysctl for disallowing userspace vector access"
> +	depends on RISCV_ISA_V
> +	help
> +	  Add prctl and sysctl interfaces to disallow userspace to execute
> +	  vector instructions. These controls are deprecated because they create
> +	  ambiguity in the ISA extension availability reported by hwprobe.
> +
> +	  If you don't know what to do here, say N.
> +
>  config RISCV_ISA_V_UCOPY_THRESHOLD
>  	int "Threshold size for vectorized user copies"
>  	depends on RISCV_ISA_V
> diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
> index 815715c67f940..ad64df01417a2 100644
> --- a/arch/riscv/include/asm/processor.h
> +++ b/arch/riscv/include/asm/processor.h
> @@ -121,7 +121,9 @@ struct thread_struct {
>  	unsigned long envcfg;
>  	unsigned long sum;
>  	u32 riscv_v_flags;
> +#ifdef CONFIG_RISCV_ISA_V_VSTATE_CTRL
>  	u32 vstate_ctrl;
> +#endif
>  	struct __riscv_v_ext_state vstate;
>  	unsigned long align_ctl;
>  	struct __riscv_v_ext_state kernel_vstate;
> @@ -202,7 +204,7 @@ extern int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src
>  
>  extern unsigned long signal_minsigstksz __ro_after_init;
>  
> -#ifdef CONFIG_RISCV_ISA_V
> +#ifdef CONFIG_RISCV_ISA_V_VSTATE_CTRL
>  /* Userspace interface for PR_RISCV_V_{SET,GET}_VS prctl()s: */
>  #define RISCV_V_SET_CONTROL(arg)	riscv_v_vstate_ctrl_set_current(arg)
>  #define RISCV_V_GET_CONTROL()		riscv_v_vstate_ctrl_get_current()

nit: consider changing the enclosing CONFIG_RISCV_ISA_V at the comment to
CONFIG_RISCV_ISA_V_VSTATE_CTRL if this needs respin.

> diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
> index fffe72a772080..5425a25f8a196 100644
> --- a/arch/riscv/include/asm/vector.h
> +++ b/arch/riscv/include/asm/vector.h
> @@ -404,9 +404,6 @@ static inline void __switch_to_vector(struct task_struct *prev,
>  	}
>  }
>  
> -void riscv_v_vstate_ctrl_init(struct task_struct *tsk);
> -bool riscv_v_vstate_ctrl_user_allowed(void);
> -
>  #else /* ! CONFIG_RISCV_ISA_V  */
>  
>  struct pt_regs;
> @@ -418,7 +415,6 @@ static __always_inline bool has_xtheadvector_no_alternatives(void) { return fals
>  static __always_inline bool has_xtheadvector(void) { return false; }
>  static inline bool riscv_v_first_use_handler(struct pt_regs *regs) { return false; }
>  static inline bool riscv_v_vstate_query(struct pt_regs *regs) { return false; }
> -static inline bool riscv_v_vstate_ctrl_user_allowed(void) { return false; }
>  #define riscv_v_vsize (0)
>  #define riscv_v_vstate_discard(regs)		do {} while (0)
>  #define riscv_v_vstate_save(vstate, regs)	do {} while (0)
> @@ -435,6 +431,18 @@ static inline bool riscv_v_vstate_ctrl_user_allowed(void) { return false; }
>  
>  #endif /* CONFIG_RISCV_ISA_V */
>  
> +#ifdef CONFIG_RISCV_ISA_V_VSTATE_CTRL
> +
> +void riscv_v_vstate_ctrl_init(struct task_struct *tsk);
> +bool riscv_v_vstate_ctrl_user_allowed(void);
> +
> +#else
> +
> +static inline void riscv_v_vstate_ctrl_init(struct task_struct *tsk) {}
> +static inline bool riscv_v_vstate_ctrl_user_allowed(void) { return true; }
> +
> +#endif /* CONFIG_RISCV_ISA_V_VSTATE_CTRL */
> +
>  /*
>   * Return the implementation's vlen value.
>   *
> diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
> index 9641343732782..b35d11ff3cc89 100644
> --- a/arch/riscv/kernel/vector.c
> +++ b/arch/riscv/kernel/vector.c
> @@ -20,7 +20,9 @@
>  #include <asm/ptrace.h>
>  #include <asm/bug.h>
>  
> +#ifdef CONFIG_RISCV_ISA_V_VSTATE_CTRL
>  static bool riscv_v_implicit_uacc = true;
> +#endif
>  static struct kmem_cache *riscv_v_user_cachep;
>  #ifdef CONFIG_RISCV_ISA_V_PREEMPTIVE
>  static struct kmem_cache *riscv_v_kernel_cachep;
> @@ -144,6 +146,8 @@ void riscv_v_thread_free(struct task_struct *tsk)
>  #endif
>  }
>  
> +#ifdef CONFIG_RISCV_ISA_V_VSTATE_CTRL
> +
>  #define VSTATE_CTRL_GET_CUR(x) ((x) & PR_RISCV_V_VSTATE_CTRL_CUR_MASK)
>  #define VSTATE_CTRL_GET_NEXT(x) (((x) & PR_RISCV_V_VSTATE_CTRL_NEXT_MASK) >> 2)
>  #define VSTATE_CTRL_MAKE_NEXT(x) (((x) << 2) & PR_RISCV_V_VSTATE_CTRL_NEXT_MASK)
> @@ -182,6 +186,8 @@ bool riscv_v_vstate_ctrl_user_allowed(void)
>  }
>  EXPORT_SYMBOL_GPL(riscv_v_vstate_ctrl_user_allowed);
>  
> +#endif
> +
>  bool riscv_v_first_use_handler(struct pt_regs *regs)
>  {
>  	u32 __user *epc = (u32 __user *)regs->epc;
> @@ -227,6 +233,8 @@ bool riscv_v_first_use_handler(struct pt_regs *regs)
>  	return true;
>  }
>  
> +#ifdef CONFIG_RISCV_ISA_V_VSTATE_CTRL
> +
>  void riscv_v_vstate_ctrl_init(struct task_struct *tsk)
>  {
>  	bool inherit;
> @@ -330,3 +338,5 @@ static int __init riscv_v_init(void)
>  	return riscv_v_sysctl_init();
>  }
>  core_initcall(riscv_v_init);
> +
> +#endif
> -- 
> 2.52.0
> 
