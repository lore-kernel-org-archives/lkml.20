Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA67635C680
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 16:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788883303; cv=pass; b=Hgw7eZpZ/F0hmFZxq3durs9ir9+JkcFgBkpgL06PUAxlHhEQUo0BpNmtn8t2WqJod7g8GZjtnY34WkpODwJvBd3i6po1yO/1rJ+e5aotUX71WBeedXZnl1n0FYG0Q7eQCIQfT2IUy69PIY196f29MNEiWcHPwmq6Q0RrJBE5D/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788883303; c=relaxed/simple;
	bh=Y9L88tcgQfKwbbTnUrdzR7/ZJ7EDLcTeOmLn7TIrix4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lwRe+Uma8Kr2ReekfOJP3QF0RNREYQTlY0fg9cD32VQfcL1zaPfKGHBIVLJBjIPyNEX13z0A8jQrXeBSS37Y0jOqpMMoQHZPMgFWUY5pmdNvb2O/GyoUSalFh00TP+JfsIBug348pyRbwAYv70MdC/MpPx0uFpPBRz53TDlsNho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DWv6Vq7h; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=RTr25iuY; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DWv6Vq7h";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="RTr25iuY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788883298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0TF3l7b3D5e24e0H9z8RJn24H1xca1tA2sAjz8GB+pE=;
	b=DWv6Vq7haOefHAjSJVGVMaAsxUmoD6mAksoUdZg1bNh0YSOYyDgGjaJVF7cUM7vmZz7JDW
	2kwOM6byWN+KdH5QJoiBoL6sJXBtN8pgdwqtgebt6p1cY8CCXcj8P6DfF+TUpdoYZ0/36A
	mCCNTuSWKpl35VhWXQteHN1N3Y0LoGw=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-695-ttI6kFrXOtmn19wpjdmF-A-1; Tue, 08 Sep 2026 12:01:36 -0400
X-MC-Unique: ttI6kFrXOtmn19wpjdmF-A-1
X-Mimecast-MFC-AGG-ID: ttI6kFrXOtmn19wpjdmF-A_1788883296
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5bfd3313dadso4762637e0c.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 09:01:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788883296; cv=none;
        d=google.com; s=arc-20260327;
        b=OIu4cfo/LNCPDeHUXhaCuvF71ULuG+geMFq1N1yUI+OFd3gDWVNZKFWWPGRlN5pgH7
         f0+0AyScXSip6xxCr6zeedcWdJMpUelcxjfrL4XvqvnntlGhFpjoGlBYU6G1PzyFTRHZ
         mTZJQj5Ufagx2bc8fnQr0Z3CjYDINQbPa+PLsxciQ+HvmvYhbwSSHhSHNmvWytmQTLfA
         WgiSrPg1fSJqpTRYv0kYHzs7dcfwHycz/2R0nZIm727UD+2OrxsAU3HstUVgDoODpi1C
         syXPFQ2hNmL6YcFxG2zvW33i3ymdrYfDSLQwE/RxoZbNYCewbg31M4VYqS788+kidK4V
         VJbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0TF3l7b3D5e24e0H9z8RJn24H1xca1tA2sAjz8GB+pE=;
        fh=AWtTQTg6nubWVxpPxgaKvulVul/EAQaPd6c/PcXZAPw=;
        b=dX5NVwmfOXcCc5KbNos/5NK7zlj/Zn+b4nYTx+rqWwYraSoBBxDXRHYpqJ6OIUhs9M
         3NpunNVMoNlD5qns1JXs4Fe8N8m4ZgQf4KqXjESrrEoafWkBxFpqEbC1z8cfnO0NGY5J
         cQ27S/T8J8XJmftdGt61lPZDiE7e6aljP6acCoPwoLRjxMiTwNVjY7kiDf0Pq62ZclUy
         CUnykhqf5sY9wNPxlnOXfWP/5a+1Cew9BE6Rf75YkhfMeTpLg/C5zfjxdclgiZEO/rqb
         Sv9lEsLLr/8ZZKTyqpW4p849PSmSCc9Mku+3lUfDTJZQ5NsOIygjAKIGFPViS2sOwhQ+
         yrGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788883296; x=1789488096; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0TF3l7b3D5e24e0H9z8RJn24H1xca1tA2sAjz8GB+pE=;
        b=RTr25iuYGgrXo3Wm50iwJD8pydEQv/hEoMatHm2DDEqpr8VqFkU1R2oJ2AvdbimABo
         0kF/j0S5dVsm7QK2QAjOSUqlaT3NeWqpdyZkeqvAJseoffGVFVHFy8+u3w4PyUY1MI0g
         12T7w0zPd7N1rd5uU/S6U99BSV9rJIrs5BsJcoiPS5Nf04FVQk42lT05zbWbvWove5Im
         QY5yUTLbJDLnOBmN5j9UYqp5FrIeJqYZvQWmzdCWRfFpxwnHQR5d4rOwK7UCBt7aFLMQ
         S5cDMgMkQecSEfCRr3i8wVqHnn3/B8q6geJVcAlVLf6SFFqjpt/9kdx8Bp9aAPyN5bG5
         APmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788883296; x=1789488096;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0TF3l7b3D5e24e0H9z8RJn24H1xca1tA2sAjz8GB+pE=;
        b=QDKNWyCAw/ZZe3eebB1JGnk2E9js0H6ao1IFKziERy2d7QgQFJLT++5p/t38orwlEU
         o3KPsm4lFlyU81I7VARhZsJ1k+r+GBXhxRLrJoC6RGH7gZifI2rwHj0prS8RYeqTxsax
         hi/vbawxjQd7+0wx5w6T75otqfVsWdtdth4Fv7ja+5A5AGS3AVoodZFKesVQO8B2MhVH
         gtkvUle20fx27eXe+wZDTMovv92D8oUEACxiF64E4cRr2uHsr/TtclErkp20bgf3MpfD
         Qmise/EXXGB+2scdkh9Do7bF5eZ9nME3Us0PlyPvEbxUasFa5VbZT8vdzUvnuDEUbljd
         4LrA==
X-Forwarded-Encrypted: i=1; AKwUvByO9TNO6Ii2MH5x8CNylZEYgyxXixJ0+v/w20PpzhoxOTUNfRkNVgCwq22KuSGUPbtiyqZDg6J+/K49d2Q=@vger.kernel.org
X-Gm-Message-State: AFuF++lqygB2e0SatogDkKf/YGLBD8ZorogcjBb51sAbojg4aK8cOAUH
	VnB32TU46lcOL89QS/DCDPR45BUvqth62QCPtg20gUOzL0F9PBYoZ/uxa0U4eJiojG6ODSFh91p
	b9Z9aF9p9BwjNm6hFZftj7K5j1UPQRfbUHOChJaZmcreSxDO8Vnq/igH78Zx2DDLUNRbI6eZWTu
	sVmytpC2l7LT/+tx9sVmDZ7Lwrk/qLEO9WoJ+5Caez
X-Gm-Gg: AYBFou1GLfLHFslghOL8bgwVqW87bC+y6QTKCXzh58yMKAV/u3mm09H2EmdSmZDn5q9
	wR5EXlekDVXHrIBsP9DQ+3um3gwiIVhMGLN6jdX4S+t+l/4by7+ZSsvu2RVoEozlAWNad83vj6G
	zj/G/2FSihTirgZWphmTf1DRq5gXnlMD76Gtzo08g+4mWMNUqDoKVEWGk6
X-Received: by 2002:a05:6122:3a0a:b0:5c7:9947:5ceb with SMTP id 71dfb90a1353d-5c7ed3796d6mr16503270e0c.0.1788883295947;
        Tue, 08 Sep 2026 09:01:35 -0700 (PDT)
X-Received: by 2002:a05:6122:3a0a:b0:5c7:9947:5ceb with SMTP id
 71dfb90a1353d-5c7ed3796d6mr16503120e0c.0.1788883295458; Tue, 08 Sep 2026
 09:01:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427122742.210074-1-mkchauras@gmail.com> <CAE4VaGACd2es4NPQyhbR9pMEoGiTVBSE7Lw7x9VOb1Qbpvc6nw@mail.gmail.com>
 <amsapeQ2Kp6rwPpF@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <CAE4VaGB_EhbWq8_X6FLtOx2MqoP7JEkOKkKSjKB7N--tt-sCeA@mail.gmail.com> <aqAMpawvpB7g1XdK@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
In-Reply-To: <aqAMpawvpB7g1XdK@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
From: Jirka Hladky <jhladky@redhat.com>
Date: Tue, 8 Sep 2026 18:01:23 +0200
X-Gm-Features: AcwNN1Uyikg-_AF06PUl91SbhxvAExLeC150JD6l8k8fnW1PrHI7wcoROdrum8E
Message-ID: <CAE4VaGBCmA0+28G=V_Qs37cR2GKYDUTGQWW_uRe0qvEp5io3qQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/8] Generic IRQ entry/exit support for powerpc
To: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, ryabinin.a.a@gmail.com, glider@google.com, 
	andreyknvl@gmail.com, dvyukov@google.com, vincenzo.frascino@arm.com, 
	oleg@redhat.com, kees@kernel.org, luto@amacapital.net, wad@chromium.org, 
	mchauras@linux.ibm.com, sshegde@linux.ibm.com, thuth@redhat.com, 
	ruanjinjie@huawei.com, akpm@linux-foundation.org, macro@orcam.me.uk, 
	ldv@strace.io, charlie@rivosinc.com, deller@gmx.de, kevin.brodsky@arm.com, 
	ritesh.list@gmail.com, yeoreum.yun@arm.com, agordeev@linux.ibm.com, 
	segher@kernel.crashing.org, mark.rutland@arm.com, ryan.roberts@arm.com, 
	pmladek@suse.com, feng.tang@linux.alibaba.com, peterz@infradead.org, 
	kan.liang@linux.intel.com, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mukesh,

Re: policy details -  I'm running an ELN kernel on RHEL-10.2, with SELinux
in enforcing mode using the default (targeted) policy, nothing custom
or hardened on top of it. Let me know if you need anything more specific
(policy version, booleans, etc.) and I'll pull it.

Re: the rcu_ct_kernel_exit_qs() diff =E2=80=94 thanks, that guard against t=
he
unconditional rcu_preempt_deferred_qs() call lines up well with what I
was seeing on the RCU-barrier side. I'll apply it on top of 7.2 on
POWER10 box and re-run the stress-ng --kill numbers
(enforcing/permissive/disabled) to see how much of the SELinux tax it
recovers. No need to prepare anything separately.

I'm OOO tomorrow, but I'll get to this by the end of the week and report
back with results.

Thanks
Jirka


On Tue, Sep 8, 2026 at 3:26=E2=80=AFPM Mukesh Kumar Chaurasiya
<mkchauras@gmail.com> wrote:
>
> On Thu, Jul 30, 2026 at 01:24:46PM +0200, Jirka Hladky wrote:
> > On Thu, Jul 30, 2026 at 11:36=E2=80=AFAM Mukesh Kumar Chaurasiya
> > <mkchauras@gmail.com> wrote:
> > >
> > > On Mon, Jul 27, 2026 at 11:41:07AM +0200, Jirka Hladky wrote:
> > > > Hi Mukesh, Shrikanth, Madhavan,
> > > >
> > > > I'm seeing a ~19% throughput regression on ppc64le (POWER10) in
> > > > syscall-heavy workloads between kernel 7.1 and 7.2-rc4, which I've
> > > > narrowed down to the GENERIC_ENTRY enablement for powerpc (commit
> > > > bee25f97ad24 "powerpc: Enable GENERIC_ENTRY feature").
> > > >
> > > > The regression manifests specifically when SELinux is enabled. Regr=
ession
> > > > disappears with selinux=3D0. With SELinux disabled, 7.2 is actually
> > > > slightly *faster* than 7.1.
> > > >
> > > > Test: stress-ng --kill 1 -t 23 (single-thread kill() syscall loop)
> > > > Machine: IBM,9080-HEX POWER10, 8 vCPUs (1 core SMT-8), 64 GiB
> > > >
> > > > Results (bogo-ops/sec, higher is better):
> > > >
> > > > Kernel   Enforcing   Permissive   Disabled    SELinux tax
> > > > ------   ---------   ----------   --------    -----------
> > > > 7.1      69,107      70,248       93,566      -26.1%
> > > > 7.2-rc4  56,247      59,075       99,240      -43.3%
> > > > Delta    -18.6%      -15.9%       +6.1%
> > > >
> > > > Key observations:
> > > > - SELinux permissive ~ enforcing on both kernels (overhead is in th=
e
> > > >   code path, not policy evaluation)
> > > > - SELinux disabled: 7.2 is 6% faster than 7.1 -- the generic entry
> > > >   path itself is not slower for the base syscall
> > > > - The SELinux "tax" nearly doubles from 26% to 43% between 7.1->7.2
> > > > - No changes to security/selinux/avc.c between v7.1 and v7.2-rc4
> > > >
> > > > The kill() hot path (sys_kill -> check_kill_permission -> security_=
task_kill
> > > > -> selinux_task_kill -> avc_has_perm -> avc_lookup) wraps every AVC=
 lookup
> > > > in rcu_read_lock()/rcu_read_unlock(). On ppc64le with PREEMPT_RCU, =
each
> > > > pair requires lwsync/isync barriers. I suspect the generic entry pa=
th
> > > > changes something in how context tracking, tracing, or RCU interact=
s
> > > > with the syscall fast path that amplifies the per-call RCU cost.
> > > >
> > > > Note: this is on top of a separate ~36% regression from 6.12->7.1 c=
aused
> > > > by HAVE_PREEMPT_DYNAMIC_KEY enabling CONFIG_PREEMPT_RCU on ppc64le
> > > > (commit 6ad7751537e8), which I reported separately on the v4 thread=
.
> > > >
> > > > Thank you
> > > > Jirka
> > > [...]
> > > Hey Jirka,
> > >
> > > Thanks for reporting this.
> > > I'll take a look.
> > >
> > > Thanks,
> > > Mukesh
> > >
> >
> > Thank you, Mukesh! I'm happy to run additional tests on the POWER10 mac=
hine
> > if you have patches to try or specific experiments you'd like me to do.
> >
> > Jirka
> >
>
> can you try this with the below diff?
>
> diff --git a/include/linux/rcutiny.h b/include/linux/rcutiny.h
> index e56ded733b1b..dcad641eb2c2 100644
> --- a/include/linux/rcutiny.h
> +++ b/include/linux/rcutiny.h
> @@ -120,6 +120,7 @@ static inline bool rcu_preempt_need_deferred_qs(struc=
t task_struct *t)
>         return false;
>  }
>  static inline void rcu_preempt_deferred_qs(struct task_struct *t) { }
> +static inline void rcu_ct_kernel_exit_qs(void) { }
>  void rcu_scheduler_starting(void);
>  static inline void rcu_end_inkernel_boot(void) { }
>  static inline bool rcu_inkernel_boot_has_ended(void) { return true; }
> diff --git a/include/linux/rcutree.h b/include/linux/rcutree.h
> index 16a04202888b..d623f2a7d3fc 100644
> --- a/include/linux/rcutree.h
> +++ b/include/linux/rcutree.h
> @@ -87,6 +87,7 @@ static inline void rcu_irq_exit_check_preempt(void) { }
>
>  struct task_struct;
>  void rcu_preempt_deferred_qs(struct task_struct *t);
> +void rcu_ct_kernel_exit_qs(void);
>
>  void exit_rcu(void);
>
> diff --git a/kernel/context_tracking.c b/kernel/context_tracking.c
> index a743e7ffa6c0..011018214c6d 100644
> --- a/kernel/context_tracking.c
> +++ b/kernel/context_tracking.c
> @@ -118,7 +118,7 @@ static void noinstr ct_kernel_exit(bool user, int off=
set)
>         lockdep_assert_irqs_disabled();
>         trace_rcu_watching(TPS("End"), ct_nesting(), 0, ct_rcu_watching()=
);
>         WARN_ON_ONCE(IS_ENABLED(CONFIG_RCU_EQS_DEBUG) && !user && !is_idl=
e_task(current));
> -       rcu_preempt_deferred_qs(current);
> +       rcu_ct_kernel_exit_qs();
>
>         // instrumentation for the noinstr ct_kernel_exit_state()
>         instrument_atomic_write(&ct->state, sizeof(ct->state));
> diff --git a/kernel/rcu/tree.c b/kernel/rcu/tree.c
> index 96848fc1f02b..c23478f70c17 100644
> --- a/kernel/rcu/tree.c
> +++ b/kernel/rcu/tree.c
> @@ -368,6 +368,25 @@ notrace void rcu_momentary_eqs(void)
>  }
>  EXPORT_SYMBOL_GPL(rcu_momentary_eqs);
>
> +/**
> + * rcu_ct_kernel_exit_qs - report deferred QS on syscall/exception exit =
if needed
> + *
> + * Called from ct_kernel_exit() on every return to userspace.  Guards th=
e
> + * rcu_preempt_deferred_qs() call with rcu_preempt_need_deferred_qs() so=
 that
> + * on the common fast path -- where nothing is deferred -- we avoid the
> + * cache-line traffic on current->rcu_read_unlock_special that the uncon=
ditional
> + * call causes.  This is particularly significant on weakly-ordered arch=
itectures
> + * (e.g. ppc64le) where rcu_read_lock/unlock issue lwsync/isync barriers=
 and
> + * already touch that cache line in the syscall body.
> + *
> + * Follows the same pattern used by rcu_flavor_sched_clock_irq().
> + */
> +notrace void rcu_ct_kernel_exit_qs(void)
> +{
> +       if (rcu_preempt_need_deferred_qs(current))
> +               rcu_preempt_deferred_qs(current);
> +}
> +
>  /**
>   * rcu_is_cpu_rrupt_from_idle - see if 'interrupted' from idle
>   *
>
>


--=20
-Jirka

