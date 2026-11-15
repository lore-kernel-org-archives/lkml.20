Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794707101;
	b=dikwOD6cBso+RA1F2avd8PGdWeKSQLYfYQdEuDPrlxiV3J7dfmgtIy4ImFiBID9IH16S
	 0j0RcBjES+H+aLs3wC3G4qpHVBEaIVHj9QIn8TZ4+mMISmVGBxkoPmf3QoqrU8Aib25DC
	 cqkps52INEmpjd9XGIcyuzm31vEWAPNGzR4Kf9+Wq4Lg+iWWRp7Wk0pUCk84qfVsyjEfx
	 q5TzctuD9t/jx+7145Sidw0M2Z6oqaJ4JAuppcR3dqWrOwdsDryfODNLmWRTrC+p0/OGv
	 B3Y9rRuHwD1hlicFHQcRQy+GJG/zZCyboyb2ItynjSEh/Hhb7R+HEKzcozBnkPhp34A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794707101;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=oXyE81aMtvAODdGtM889si7WiRKm2rXqSMqbsdjK51k=;
	b=ovtsH9WcppGsqSgRD81XXDswHTWeO1dpIHAPmg18a6Ebvub4okLKqs8uY2pQjIp71UlG
	 FhPSBlN+Oz34YZ0oQZQzjU7H0JmPHYQME9kvndPKwjChUCsZNQdgxVoCQv9buM8zEnHTq
	 pxYa7sHWwv9wlksB/JZFm35zCdBdrai0XMF8FLcm+xpRv2PK0BKcBI5r6fA8JLlQtPxOi
	 gyiyZ4mxO8L21fREJcBSaKrHLNyb4rOQSiQPv5lAbrdpZnDK/Xdsc9UcGFSZpiu99WlNf
	 1wDnI8d4y6dHeGYwivzuY0dE2fzEjmGpgTMwJYinGUz1pIvWe8+7TGrzgEdLwzp2sMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oab0YX8z;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E55B606A32D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 01:45:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E55B606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oab0YX8z
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso12215135e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 17:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794707099; x=1795311899; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oXyE81aMtvAODdGtM889si7WiRKm2rXqSMqbsdjK51k=;
        b=oab0YX8zzFTEP+7yIJ3sgVsItH73vcp1hkotA8hqmoyJOvowDvT3qDekDNDTZ9gL2b
         nMmxjJ48JpAHqgKJPHNQfKR3zemxbwRMk5M6Bf0PW+70mOg4ihjMtRc7mPdxOvVM1nml
         ww+wIgB0oKLiqYG7E7lheyA+EPR5STtqgRF0aupGToOtHIwyDvyr5qLmLDXEtQdQBm3k
         C0BGE7w8CheUqtZ3yu+/+/Lq8Zkd/226O6JHUjy+bcEJ0DEFXCDxpXAvLvH8JPzzZlTd
         AQyrYaUA/hYCejTpzZgbqR9OE7+ZtmvMRSH7TYfvhBbFJM05DD+BmD7TWdLNaA7C9Zps
         jeBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794707099; x=1795311899;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oXyE81aMtvAODdGtM889si7WiRKm2rXqSMqbsdjK51k=;
        b=N6I4VntRep5CpIIXa8aX7trc69MSVyFl+ChD/tckorDFEg2Gcv8gdjeAKQY93aa9wA
         YdPv/9YaiNPHxu9H4KXHx6dhP4fI8MA/q1NgWxnScKg+p0G2Q6wMHRju3CZra8kaFDgS
         skR2UiX2MJ6kksj9AJ5F/6rRJaBgNVoRWiCkdtHKIN8nOQePoupoxArg3oe3jAmFx2bX
         K5eUlEXNA9Nsc9tpmEE5XTOTT4lk2Ib1JA0zBz0IQIQtGgB0jxEkn5MX7UMtiT5l80sk
         fn6o1XP3WFcJsFuVL7yFd5S32Uq9XXwZv/+22HzGqkFORN3jGGtNjw5YL+I00wWcKN6V
         6nAg==
X-Forwarded-Encrypted: i=1; AL+hErEj8Sskv93crFfMWBgH1P58Mh111fTwLstQfxZEtbKQLpU2PTnoa+EC/rfXmvsjfJPZrD8dr7OXSgPLOco=@vger.kernel.org
X-Gm-Message-State: APuU4Z81JBAoBWouqnOGPvF90MHjXK4YxDyJaioIzTRJUXWCCW+4ucVH
	sU2o+rcR944gKNtIXdAS15RYeI51kyyAdMl/WvwPx8OOEw2evAD5+gqQzOHtd/Uzthg=
X-Gm-Gg: AYBFou1sUO/UBSUy8n3QXUkzYYsBCs8IPcbUMYrJ9nzEvu7SOOUTlI4uUCW4GcpwK+Y
	LAIgj8TEgDVyBzzUIr4u1HwoyehyuX9moT3bbDnkdhw7d+kGh/xnp3S/D7t2kC+Xz74UjAL6t0z
	/5zFbxw1HK+141ihYq8xgMnSF5MWFH4bVypHJLOVe10qdZNcBK6XoLCRoPWPA6ewCoGGu+S3JuG
	Lv3KDZh1GeV4kMJfR/rit1bPZHbi6T87GYq3kSZr89C+rSbtH+BVrZZZ+5UmoKHhKVkNIyqixW4
	S7B38fB6zXA353MMh0cXfGlQBnm8QsdFssonwrDr+z+OroYWqfJdcVqc68U91qT94XbCrWjS7I6
	2cXF4y++HyDNlMvFSj2TxYJFcu9T+MbH++XJQWtVx2pR7aaAyGzfbw7yFgb8qDz3//selA5e8yi
	O2z3eUPmbRX3RhwQgr1d5jLoDP685u7g7fSX1C9yzG3Yw09bYrUljb+D6wfj5A/LEA0IkTAzUZS
	ZaYDNZlK/noXmVlJpuY9n/c9O7koZ2DyX4uvfnXl0B9Jlwez20q3Os1CRqD9voHFDYQdn5A4K+P
	s3v44gCzSb67T6rQUqBG1Lvafuvznb16r06WDywYbgdQLsoxXXPkmtxUIwG6Ecsd+4Rvkj4GVEo
	xgSiuP9I=
X-Received: by 2002:a05:600c:6092:b0:4a2:397:73f6 with SMTP id 5b1f17b1804b1-4bb55a44be7mr133682985e9.8.1794707098570;
        Sat, 14 Nov 2026 17:44:58 -0800 (PST)
Received: from localhost (brnt-04-b2-v4wan-170138-cust2432.vm7.cable.virginm.net. [94.175.9.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae5299sm192037195e9.11.2026.11.14.17.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 17:44:57 -0800 (PST)
Date: Sun, 15 Nov 2026 01:44:57 +0000
From: Stafford Horne <shorne@gmail.com>
To: Sahil <sahilcdq0@gmail.com>
Cc: jonas@southpole.se, stefan.kristiansson@saunalahti.fi,
	naveen@kernel.org, davem@davemloft.net, mhiramat@kernel.org,
	pjw@kernel.org, wangruikang@iscas.ac.cn, namcao@linutronix.de,
	kees@kernel.org, linux-openrisc@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] openrisc: Add KProbes
Message-ID: <avkOmdojYYJkeer4@antec>
References: <20260930202744.50489-1-sahilcdq0@gmail.com>
 <20261026201240.107462-3-sahilcdq0@gmail.com>
 <avAo140Wc1CerVwf@antec>
 <33becbe3-867a-4e54-8471-7f0101af8623@gmail.com>
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
In-Reply-To: <33becbe3-867a-4e54-8471-7f0101af8623@gmail.com>

On Fri, Nov 13, 2026 at 10:43:55PM +0530, Sahil wrote:
> On 11/8/26 1:16 PM, Stafford Horne wrote:
> > On Tue, Oct 27, 2026 at 01:42:38AM +0530, Sahil Siddiq wrote:
> > > Add KProbes support for OpenRISC. This work is primarily based
> > > on similar work done for LoongArch, MIPS and RISC-V.

[snip]

> > > +++ b/arch/openrisc/include/asm/kprobes.h

[snip]

> > > +#define flush_insn_slot(p)		do { } while (0)
> > 
> > On openrisc I think we need to implement flush_insn_slot.  As our
> > copy's only affect data caches instruction caches may end up being
> > stale.  This is really hard to detect as context switches invalidate
> > a lot of the instruction cache lines, but not all.
> > 
> > I fixed this for text patching recently with commit aca063c90245
> > ("openrisc: Fix jump_label smp syncing")
> 
> Understood. In the same commit [1], you have also mentioned that
> invalidating all the cache lines is less expensive than keeping
> track of which line needs to be invalidated.
> 
> In case of KProbes, where a KProbe at a specific instruction is
> armed or disarmed:
> 
> void arch_arm_kprobe(struct kprobe *p) {
>     patch_insn_write(p->addr, KPROBE_BP_INSN);
>     flush_insn_slot(p);
> }
> 
> void arch_disarm_kprobe(struct kprobe *p) {
>     patch_insn_write(p->addr, p->opcode);
>     flush_insn_slot(p);
> }
> 
> Should only that page be invalidated? Or is it ok to invalidate all
> lines?

I think you only need to flush the part of the kprobe data structure that has
code that is updated, for example p->addr.  Since you have all of that
information tracked for you in the kprobe structures it should be pretty simple.
That was not the case for text patching.

Note, I had a look this is needed for init_aggr_kprobe() which copies code from
one prope to another.

Note 2, for arch_arm_kprobe/arch_disarm_kprobe we use patch_insn_write which
internally does a icache invalidation alredy.  So I think the call to
flush_insn_slot() in arch_disarm_kprobe()/arch_arm_kprobe() is not needed.

> > > +#define kretprobe_blacklist_size	0
> > > +
> > > +void arch_remove_kprobe(struct kprobe *p);
> > > +int kprobe_fault_handler(struct pt_regs *regs, int trapnr);
> > > +bool kprobe_breakpoint_handler(struct pt_regs *regs);
> > > +bool kprobe_singlestep_handler(struct pt_regs *regs);
> > > +#else /* !CONFIG_KPROBES */
> > > +static inline bool kprobe_breakpoint_handler(struct pt_regs *regs)
> > > +{
> > > +	return false;
> > > +}
> > > +
> > > +static inline bool kprobe_singlestep_handler(struct pt_regs *regs)
> > > +{
> > > +	return false;
> > > +}
> > > +#endif /* CONFIG_KPROBES */
> > > +#endif /* __ASM_OPENRISC_KPROBES_H */
> > > diff --git a/arch/openrisc/kernel/Makefile b/arch/openrisc/kernel/Makefile
> > > index 150779fbf010..2ac824867963 100644
> > > --- a/arch/openrisc/kernel/Makefile
> > > +++ b/arch/openrisc/kernel/Makefile
> > > @@ -14,6 +14,7 @@ obj-$(CONFIG_SMP)		+= smp.o sync-timer.o
> > >   obj-$(CONFIG_STACKTRACE)	+= stacktrace.o
> > >   obj-$(CONFIG_MODULES)		+= module.o
> > >   obj-$(CONFIG_OF)		+= prom.o
> > > +obj-$(CONFIG_KPROBES)		+= kprobes.o
> > >   obj-y	+= patching.o
> > >   clean:
> > > diff --git a/arch/openrisc/kernel/entry.S b/arch/openrisc/kernel/entry.S
> > > index c7e90b09645e..cd28bf1f7a3b 100644
> > > --- a/arch/openrisc/kernel/entry.S
> > > +++ b/arch/openrisc/kernel/entry.S
> > > @@ -15,6 +15,7 @@
> > >   #include <linux/linkage.h>
> > >   #include <linux/pgtable.h>
> > > +#include <asm/asm.h>
> > >   #include <asm/processor.h>
> > >   #include <asm/unistd.h>
> > >   #include <asm/thread_info.h>
> > > @@ -640,6 +641,7 @@ ENTRY(_sys_call_handler)
> > >   	/* r30 is the only register we clobber in the fast path */
> > >   	/* r30 already saved */
> > >   /*	l.sw    PT_GPR30(r1),r30 */
> > > +_ASM_NOKPROBE(_sys_call_handler)
> > 
> > How is this working for these not function symbols?  _ASM_NOKPROBE registers a
> > sybmol (in this case just a macro address) into the _kprobe_blacklist.  I think
> > withing kprobe.c it uses these _kprobe_blacklist entries to detect ranges that
> > cannot be probed.  However, in this case I think you are not able to get range
> > information.
> 
> _ASM_NOKPROBE and NOKPROBE_SYMBOL (for functions in C) expand to the
> same thing functionally. The kernel treats these labels as symbols as
> well. I verified this using "nm".
> 
> When a KProbe is registered using an address instead of the symbol_name,
> "register_kprobe()" [2] at kernel/kprobes.c indirectly calls
> "within_kprobe_blacklist()" [3] which performs "kprobe_lookup_name()".
> It then checks if that name is in the blacklist. This blacklist
> includes the names of the asm functions as well.
> 
> I wrote this test module [4] to verify that an address in memcpy's range,
> for example, is also blacklisted.

Right, I think for C functions this is fine.  But for OpenRISC assembly I think
we do not provide enough info for this to work correctly.

For example above _sys_call_handler, is just a label.

In other architectures they do something like this:

    SYM_CODE_START(handle_syscall)
	    UNWIND_HINT_UNDEFINED
	    csrrd           t0, PERCPU_BASE_KS
...
	    bl              do_syscall

	    STACKLEAK_ERASE
	    RESTORE_ALL_AND_RET
    SYM_CODE_END(handle_syscall)
    _ASM_NOKPROBE(handle_syscall)

The SYM_CODE_START/SYM_CODE_END macros or similar are not used in OpenRISC, I
think we need something to define the beginning and end of our asm macros
in order for this to work.

-Stafford

[snip]
 
> Thanks,
> Sahil
> 
> [1] https://github.com/torvalds/linux/commit/1be031de802ba486a7605b52eda825f128b026e2
> [2] https://github.com/torvalds/linux/blob/master/kernel/kprobes.c#L2002
> [3] https://github.com/torvalds/linux/blob/master/kernel/kprobes.c#L1730
> [4] https://github.com/valdaarhun/or-dev/blob/main/home/kprobes_blacklist.c
> 
