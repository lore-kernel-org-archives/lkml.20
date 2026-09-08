Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142245592ED
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 13:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788873985; cv=none; b=IS59rTq2n5i3TljRiYJ3vkdIi5uZ4ikJlJJz0yWm54em9Z4kUA/6u1aa2QGbHB7VT77y1tAgH/fah/qaINVnSvld4hviI+vXFd1aKW8nej2RrW//AhTY5c+gF/OXjJoCaLDlOLvUUuz71LPlzmk9CRVvewTqiYzhh8IDadl5oFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788873985; c=relaxed/simple;
	bh=bxeb9MFMBTfE1egtQ3ssqDsTH0E43H3zZUUXMSzGAzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=meJ3pFDWiXx166J/RCnBVAUeWQzJTKvijsWkMOXdOeoAmjxDTelHC5sm2Q4aeE1R7rrif4gUXbHS4e6sFTPZ9OUO2W6tltGDeOtQZdy1ajg/o+nBMxwTyeq7BcRSClqBlvZtN/2jjYfBzIMdPqb2rjQUQeOMsS6Zu7v/2khb5U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WeuCBU9+; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WeuCBU9+"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-852c481415fso5548861b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 06:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788873970; x=1789478770; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9ZOHA9tdlo1qTDpR1eEKANEz1uLz5blHgwM68Z+xZ28=;
        b=WeuCBU9++C3SAdBaoouhgNGKzFpg+TeHTrjOLr7AQUbKHYtU0KBUqzw0v/5ASOwgCz
         TFKa5NxURn7RFqx8cXrTqZAGnrzkTAUM3JlzsWf9Pg9OErRpT4+KKJ82Nta+DWiXyMJP
         YiXJ/bE616fpFDladqLnFVt7uln0AhY2+y3HhCuaR9UFiuzVw5YVd9+Px4yRjh3pT2qj
         knrCq8czPgHLMkPyY1sk6DgZw6nRL1GrbZ03296jSvR3nFmWI/0QXDFKF3Mb9VePjD0n
         zf12/yX9M3ieJP73j5mLACIwW8KkIWzAfHpTPT+0Rbkxl/YPl7mo7/pPBjnAkAXq7Tz4
         t3NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788873970; x=1789478770;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9ZOHA9tdlo1qTDpR1eEKANEz1uLz5blHgwM68Z+xZ28=;
        b=skxXIvesrWXpNF3B7tJYFf3cYwmen/009qlfTaCOSKoQ/5hQ530lGlLrSXvk+fJ0T7
         hrny4KhM5hptS1qcle57lNnj/q8n/9nuLiosQX4GTlmFM6UlSGLBv2A/gVeiLQ2BrL9W
         TGR9ZdwoRshwXozmV1Y8nMRLP94UYw89gpaCQY9kELzHzZ6ffwI/m8AIIRaD4RGXA/4f
         BU+x3Kk13e6YSQ4hMXrTDfewVJnNf1gktLSgZwNpkAFtVgIlKTp0XK86pehZTJNSxsbC
         JV82XfjQGOdDUkmF6sdl5sAIHBvKv3A1czef2zQ/2pCNASUUYp+t/RmBuSwgx1imtwO7
         YoiQ==
X-Forwarded-Encrypted: i=1; AKwUvByNmX5tX4zBbESAxe0zVV8H5Zmt59Pbqz7SIoONb563JnxLgpDr5qTQIEKp7XL9HR35yOfh8v3+E1fRMg0=@vger.kernel.org
X-Gm-Message-State: AFuF++l9LOEvDR5uLOmi45q4O2+MblpAqQukQr+9MS8JcHCCXBoikDDN
	qm5trGZWevgNSkiS7Aj3zfOLxVlofw0aer+Nl4h5yi/WzZCOq2PobfKw
X-Gm-Gg: AYBFou2rqcfLR4LcK84jEd+xgH1H/GjndMiMdU/0Cb8gULh1E+UYOgAn2XwWnoNJkbx
	2JfKtUEisT6DgLNPz6qkIvh4QVRJc8YKjIAAsqkVPtLIxokYvIdxqa7aWc6Ta9K7douAzKEUbzr
	Hp1X5ZgW1pjX41ANP/mfTEFzCLcclvVhf2IStBPu9Hzu6c0A6L7dKd0kVT8hv0DAkoOQrfYPAhA
	xoQ1dCBXLn7ojl18uR3hk9gaGf4eQ44daLAgPaSlVxMLCr8X1xr/rGN4txUlQVLBtw8puCZJclK
	g5KH6mkvWMTb9tcJwjVLp6DmFrk10PnMX2E+WkJld2RL/TGY2LXLUiauNNEOvi6e/UrqoXfpWKI
	bsF9o27xv18jTnu5CJwlPU8Y3BbhbVEswplXK6cJ99p4CtznxVXG8jA4sTeiOnR+WD+Clplf5VD
	dJeme9A7KVoLdDYnohfZVytDOnw92EXEMbI3z5b2Y8y9G6QjfREAsi/vKkUzGcDQBGm2JG7Uunw
	8p+VzlKc0q1YF+BviNdgMiGdF05RdTOIfVT
X-Received: by 2002:a05:6a00:44c7:b0:857:7337:5dbb with SMTP id d2e1a72fcca58-8616b56e83cmr44216894b3a.25.1788873969342;
        Tue, 08 Sep 2026 06:26:09 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([122.161.53.214])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8615292a8f5sm5695364b3a.27.2026.09.08.06.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:26:08 -0700 (PDT)
Date: Tue, 8 Sep 2026 18:55:55 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Jirka Hladky <jhladky@redhat.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com, 
	dvyukov@google.com, vincenzo.frascino@arm.com, oleg@redhat.com, kees@kernel.org, 
	luto@amacapital.net, wad@chromium.org, mchauras@linux.ibm.com, sshegde@linux.ibm.com, 
	thuth@redhat.com, ruanjinjie@huawei.com, akpm@linux-foundation.org, 
	macro@orcam.me.uk, ldv@strace.io, charlie@rivosinc.com, deller@gmx.de, 
	kevin.brodsky@arm.com, ritesh.list@gmail.com, yeoreum.yun@arm.com, 
	agordeev@linux.ibm.com, segher@kernel.crashing.org, mark.rutland@arm.com, 
	ryan.roberts@arm.com, pmladek@suse.com, feng.tang@linux.alibaba.com, 
	peterz@infradead.org, kan.liang@linux.intel.com, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com
Subject: Re: [PATCH v5 0/8] Generic IRQ entry/exit support for powerpc
Message-ID: <aqAMpawvpB7g1XdK@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260427122742.210074-1-mkchauras@gmail.com>
 <CAE4VaGACd2es4NPQyhbR9pMEoGiTVBSE7Lw7x9VOb1Qbpvc6nw@mail.gmail.com>
 <amsapeQ2Kp6rwPpF@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <CAE4VaGB_EhbWq8_X6FLtOx2MqoP7JEkOKkKSjKB7N--tt-sCeA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAE4VaGB_EhbWq8_X6FLtOx2MqoP7JEkOKkKSjKB7N--tt-sCeA@mail.gmail.com>

On Thu, Jul 30, 2026 at 01:24:46PM +0200, Jirka Hladky wrote:
> On Thu, Jul 30, 2026 at 11:36 AM Mukesh Kumar Chaurasiya
> <mkchauras@gmail.com> wrote:
> >
> > On Mon, Jul 27, 2026 at 11:41:07AM +0200, Jirka Hladky wrote:
> > > Hi Mukesh, Shrikanth, Madhavan,
> > >
> > > I'm seeing a ~19% throughput regression on ppc64le (POWER10) in
> > > syscall-heavy workloads between kernel 7.1 and 7.2-rc4, which I've
> > > narrowed down to the GENERIC_ENTRY enablement for powerpc (commit
> > > bee25f97ad24 "powerpc: Enable GENERIC_ENTRY feature").
> > >
> > > The regression manifests specifically when SELinux is enabled. Regression
> > > disappears with selinux=0. With SELinux disabled, 7.2 is actually
> > > slightly *faster* than 7.1.
> > >
> > > Test: stress-ng --kill 1 -t 23 (single-thread kill() syscall loop)
> > > Machine: IBM,9080-HEX POWER10, 8 vCPUs (1 core SMT-8), 64 GiB
> > >
> > > Results (bogo-ops/sec, higher is better):
> > >
> > > Kernel   Enforcing   Permissive   Disabled    SELinux tax
> > > ------   ---------   ----------   --------    -----------
> > > 7.1      69,107      70,248       93,566      -26.1%
> > > 7.2-rc4  56,247      59,075       99,240      -43.3%
> > > Delta    -18.6%      -15.9%       +6.1%
> > >
> > > Key observations:
> > > - SELinux permissive ~ enforcing on both kernels (overhead is in the
> > >   code path, not policy evaluation)
> > > - SELinux disabled: 7.2 is 6% faster than 7.1 -- the generic entry
> > >   path itself is not slower for the base syscall
> > > - The SELinux "tax" nearly doubles from 26% to 43% between 7.1->7.2
> > > - No changes to security/selinux/avc.c between v7.1 and v7.2-rc4
> > >
> > > The kill() hot path (sys_kill -> check_kill_permission -> security_task_kill
> > > -> selinux_task_kill -> avc_has_perm -> avc_lookup) wraps every AVC lookup
> > > in rcu_read_lock()/rcu_read_unlock(). On ppc64le with PREEMPT_RCU, each
> > > pair requires lwsync/isync barriers. I suspect the generic entry path
> > > changes something in how context tracking, tracing, or RCU interacts
> > > with the syscall fast path that amplifies the per-call RCU cost.
> > >
> > > Note: this is on top of a separate ~36% regression from 6.12->7.1 caused
> > > by HAVE_PREEMPT_DYNAMIC_KEY enabling CONFIG_PREEMPT_RCU on ppc64le
> > > (commit 6ad7751537e8), which I reported separately on the v4 thread.
> > >
> > > Thank you
> > > Jirka
> > [...]
> > Hey Jirka,
> >
> > Thanks for reporting this.
> > I'll take a look.
> >
> > Thanks,
> > Mukesh
> >
> 
> Thank you, Mukesh! I'm happy to run additional tests on the POWER10 machine
> if you have patches to try or specific experiments you'd like me to do.
> 
> Jirka
> 

can you try this with the below diff?

diff --git a/include/linux/rcutiny.h b/include/linux/rcutiny.h
index e56ded733b1b..dcad641eb2c2 100644
--- a/include/linux/rcutiny.h
+++ b/include/linux/rcutiny.h
@@ -120,6 +120,7 @@ static inline bool rcu_preempt_need_deferred_qs(struct task_struct *t)
 	return false;
 }
 static inline void rcu_preempt_deferred_qs(struct task_struct *t) { }
+static inline void rcu_ct_kernel_exit_qs(void) { }
 void rcu_scheduler_starting(void);
 static inline void rcu_end_inkernel_boot(void) { }
 static inline bool rcu_inkernel_boot_has_ended(void) { return true; }
diff --git a/include/linux/rcutree.h b/include/linux/rcutree.h
index 16a04202888b..d623f2a7d3fc 100644
--- a/include/linux/rcutree.h
+++ b/include/linux/rcutree.h
@@ -87,6 +87,7 @@ static inline void rcu_irq_exit_check_preempt(void) { }
 
 struct task_struct;
 void rcu_preempt_deferred_qs(struct task_struct *t);
+void rcu_ct_kernel_exit_qs(void);
 
 void exit_rcu(void);
 
diff --git a/kernel/context_tracking.c b/kernel/context_tracking.c
index a743e7ffa6c0..011018214c6d 100644
--- a/kernel/context_tracking.c
+++ b/kernel/context_tracking.c
@@ -118,7 +118,7 @@ static void noinstr ct_kernel_exit(bool user, int offset)
 	lockdep_assert_irqs_disabled();
 	trace_rcu_watching(TPS("End"), ct_nesting(), 0, ct_rcu_watching());
 	WARN_ON_ONCE(IS_ENABLED(CONFIG_RCU_EQS_DEBUG) && !user && !is_idle_task(current));
-	rcu_preempt_deferred_qs(current);
+	rcu_ct_kernel_exit_qs();
 
 	// instrumentation for the noinstr ct_kernel_exit_state()
 	instrument_atomic_write(&ct->state, sizeof(ct->state));
diff --git a/kernel/rcu/tree.c b/kernel/rcu/tree.c
index 96848fc1f02b..c23478f70c17 100644
--- a/kernel/rcu/tree.c
+++ b/kernel/rcu/tree.c
@@ -368,6 +368,25 @@ notrace void rcu_momentary_eqs(void)
 }
 EXPORT_SYMBOL_GPL(rcu_momentary_eqs);
 
+/**
+ * rcu_ct_kernel_exit_qs - report deferred QS on syscall/exception exit if needed
+ *
+ * Called from ct_kernel_exit() on every return to userspace.  Guards the
+ * rcu_preempt_deferred_qs() call with rcu_preempt_need_deferred_qs() so that
+ * on the common fast path -- where nothing is deferred -- we avoid the
+ * cache-line traffic on current->rcu_read_unlock_special that the unconditional
+ * call causes.  This is particularly significant on weakly-ordered architectures
+ * (e.g. ppc64le) where rcu_read_lock/unlock issue lwsync/isync barriers and
+ * already touch that cache line in the syscall body.
+ *
+ * Follows the same pattern used by rcu_flavor_sched_clock_irq().
+ */
+notrace void rcu_ct_kernel_exit_qs(void)
+{
+	if (rcu_preempt_need_deferred_qs(current))
+		rcu_preempt_deferred_qs(current);
+}
+
 /**
  * rcu_is_cpu_rrupt_from_idle - see if 'interrupted' from idle
  *


