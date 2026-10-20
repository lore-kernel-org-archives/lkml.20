Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792502410;
	b=e05sr/TDe7aX/pK+W3TFeN0vMDYhWsvsKv+kKE5Qii5dXMnbi1iwV79oL7cWa1QfIRIt
	 KwOJONhwBqPPSg7Rz4Kv/Owm2ycN2z0LoGqQPkbJk3mJ1hvcae52BVFvlqSPILggN6LpP
	 34ybqPrzJmHSBwh5kDH99S5txH2v0jeCwHd5xN75BMj3J40psCtffcaC9qBCtIjZtDPB5
	 E+bUoJj9xIt3E6ebIxzq58PLsFEMCOuVhzxA9tKg7x6FXJwuu9D6hbilgVDUbrbCMlRpn
	 WwHspcJcnKC3QE9nSlGG/1OTq1m6rx6FRg4Fst8w3nsE2PZYlo0qP4x9fOk9sVRLB1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792502410;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=t4p1f+D4ihXNqpiH1QSa2hiu1MulUajBwYpao7q44aQ=;
	b=nlNOr2AuuO37wxijA0jcw9LOY2+U0ClucgqSxZdmY4paaLm6RzVn+pjLGarxV6M+rn6A
	 uF9g5Fj87KkE2Gq3GARCmd3tqiE8J1rWgusGVsT73K1tjWy2Pr0NHrC0h6vhOX9Z1s8ty
	 C4RRACauSPLKqrHhTJNteI6x3uRQoqNwhriHqQ5rYpXeEjvhqLcb3a45f/lXEnkAMdKKz
	 tylSmfmvIbbatVYsT18AT5OcX0nqQV4iZ/m1act+RXJVppRgLVhe8mUnL7koA5ZFHuUfR
	 ppI+N+RbCjFj4xfZH6qqt5snMjpBGvWh6i1wrujg8iia+/O0ST7vojzv4Hqr02VbyGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=fgN9Y+Xl;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DA7606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:20:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1DA7606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=fgN9Y+Xl
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e0d885929so2489317f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792502408; x=1793107208; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t4p1f+D4ihXNqpiH1QSa2hiu1MulUajBwYpao7q44aQ=;
        b=fgN9Y+Xlbn5x7PAq5kaFOHl35jNjfUkH+VETBklYgYYCJiuTWDxG85CDyX/rkCTRa/
         qf07NjWobExfHDg1TnaxIRRvelXgvttmfc53Fcq2sP/FfiMagd813Fw7ndebmGcl9bGp
         DqJatwlXU5wiSgDcDHo8ESCKOsBPQ6LzHmwX05nIpDH3M24kptpvofy8wu0jWRQ63Kr8
         5lzqYe74DQCl4wYpiG5Po+kWl2MF8TLATgtZn99N5DTIjWFzyf3Hjl0B7Figz/eW+MPF
         IO+7+FCw2eA+siAzEooWiAvb9WFsFtAzNbKBpxpJ+9uyIbbF7E7qsc78JG5mjFmfNjti
         IzwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792502408; x=1793107208;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t4p1f+D4ihXNqpiH1QSa2hiu1MulUajBwYpao7q44aQ=;
        b=ZfSOx/G/GHHLIiVuUTSJV8+HxmsrrQm8sJgoXzRZlPNUKqMpaZZ9pQU3Fy1rCEd4UE
         EsQ+7udDKkWSGqjrX4GuZyvh9hMztcYoSunBc2+aeYXKe4YhPlCKFvRoISOEXkINnYNG
         vWdXRvyTfCAfWlKH5zjMwVDOk7Sh6iiaCWDv1+hBJ3bYtwv17pq/NTI8M034sxi+98mO
         b6sp0nR9zaBN35YT/Yaa4NKWUBYim4ak7kzQPI94m9+1tO4PCKuo85dPrBqbck1AKPcz
         qsFr4QGdb/IEmgQCZ4djczFihEujbW7hyEU3jaMOevagqYj/HO38j5b5sKivndBk4CK0
         /tOQ==
X-Forwarded-Encrypted: i=1; AKwUvBzMW4lXRrmERFlm3Sk2yI8hu3gwrQu9UyyMCInsURbI2QMNabv3ocpERLH+dJr7gGdJyHrNkKalWcuT7FY=@vger.kernel.org
X-Gm-Message-State: AFq9FYK3s/y7+ZYGhpTUDNo4Zwume0s21oijmrcI/JxHVD6vmdCA4vLd
	9p7yLx6Xm+KMw92LyJjsIQf7Hzuyr8EvwPmxTGMU5vwHdo0YQbHvIbiLH/+p3dvpNU8=
X-Gm-Gg: AYBFou0O3o2i8xh2x0LKT9NlFdD376assmob0upEH4aZjNmFp9amw/0WU2cz0MG+11l
	vRZ7mISEIdvkymVqNdaZZzVjFqDDxHGcWK3XgfTuo6M9BQaQqLhhfE+Vf4yt4FtIjMZSNIXSeqG
	ZLD+q9a0OeY8DWry5DCkghO6IrEFVWYgAh/2nRQV1I9oZBWnwiZFPWOeixdT3jvPTssQYbWbsuf
	xLCZP/sTEAzWzDwcHMxyyE22tlHcP5AzoxmnPJ+EjjndjJZmgAqwlvvKNoYSYclb0SmpO20gJzq
	wRdwSLKQWkX91dJFcR7S5QgpHHegKmZ+CR9fO2Pebkp5oEU7izGF0E/WUH2Xy8hKRShWhQ3T6rK
	3ktAIcwjbOD93PW++uBV+XckHGhs4WJgs/oemYo817tWojbShIxouND2v4ILnaa938dNEetxR2v
	jlkRhpMiyPseDcqasYMxzCZccQ7P3SbxEFDpV4goNkxR2FZqgaeMqO3YasRsFq8s95JWIlhYYzP
	XX5DgVakGNt
X-Received: by 2002:adf:fcca:0:b0:48d:fbf4:8961 with SMTP id ffacd0b85a97d-48e07bc6c5fmr16247962f8f.23.1792502405199;
        Tue, 20 Oct 2026 06:20:05 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d8208b1sm6409645f8f.33.2026.10.20.06.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:20:04 -0700 (PDT)
Date: Tue, 20 Oct 2026 15:20:01 +0200
From: Petr Mladek <pmladek@suse.com>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Zack Rusin <zack.rusin@broadcom.com>, Borislav Petkov <bp@alien8.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <baoquan.he@linux.dev>, Mike Rapoport <rppt@kernel.org>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, x86@kernel.org,
	Joel Granados <joel.granados@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, virtualization@lists.linux.dev,
	Dave Young <ruirui.yang@linux.dev>,
	bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
	John Ogness <john.ogness@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Pratyush Yadav <pratyush@kernel.org>, Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Bo Gan <bo.gan@broadcom.com>,
	Brennan Lamoreaux <brennan.lamoreaux@broadcom.com>,
	kexec@lists.infradead.org, linux-doc@vger.kernel.org,
	Maaz Mombasawala <maaz.mombasawala@broadcom.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Stephen Brennan <stephen.s.brennan@oracle.com>,
	Michael Kelley <mhklinux@outlook.com>,
	Ian Forbes <ian.forbes@broadcom.com>
Subject: Re: [PATCH v2 1/6] panic: Add a notifier chain for pre-kdump
 callbacks
Message-ID: <atdqgZQrGbp36_O_@pathway.suse.cz>
References: <cover.1790014793.git.zack.rusin@broadcom.com>
 <81cb85568b36273a8e66215b3e6d671b8488d402.1790014793.git.zack.rusin@broadcom.com>
 <bc783856-9480-3944-67fb-675e4c11d8c2@igalia.com>
 <atdYIxwz8ksYNty6@pathway.suse.cz>
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
In-Reply-To: <atdYIxwz8ksYNty6@pathway.suse.cz>

On Tue 2026-10-20 14:01:43, Petr Mladek wrote:
> On Mon 2026-10-19 19:05:21, Guilherme G. Piccoli wrote:
> > On 28/09/2026 14:55, Zack Rusin wrote:
> > > Selected crash callbacks should not require running every panic notifier
> > > before kdump. Add a separate atomic chain with an at-most-once dispatch
> > > helper, and invoke it before panic reaches the kmsg dumpers.
> > > 
> > > The helper permits another call from the crash path without repeating
> > > callbacks or recursing into them. Document that callbacks may run in NMI
> > > context, with other CPUs running and the kexec lock held.
> > > 
> > > Link: https://lore.kernel.org/r/aquttpMVKX8e6zGB@pathway.suse.cz
> > > Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
> > > ---
> > > New in v2: separate pre-kdump chain, with a set-once dispatch guard.
> > > 
> > >  include/linux/panic_notifier.h |  3 +++
> > >  kernel/panic.c                 | 26 ++++++++++++++++++++++++++
> > >  2 files changed, 29 insertions(+)
> > > 
> > > diff --git a/include/linux/panic_notifier.h b/include/linux/panic_notifier.h
> > > index 41e32483d7a7..3ad390764a41 100644
> > > --- a/include/linux/panic_notifier.h
> > > +++ b/include/linux/panic_notifier.h
> > > @@ -6,6 +6,9 @@
> > >  #include <linux/types.h>
> > >  
> > >  extern struct atomic_notifier_head panic_notifier_list;
> > > +extern struct atomic_notifier_head panic_pre_kdump_list;
> > > +
> > > +void panic_notify_pre_kdump(char *msg);
> > >  
> > >  extern bool crash_kexec_post_notifiers;
> > >  
> > > diff --git a/kernel/panic.c b/kernel/panic.c
> > > index 213725b612aa..d78e90abb192 100644
> > > --- a/kernel/panic.c
> > > +++ b/kernel/panic.c
> > > @@ -82,6 +82,10 @@ ATOMIC_NOTIFIER_HEAD(panic_notifier_list);
> > >  
> > >  EXPORT_SYMBOL(panic_notifier_list);
> > >  
> > > +struct atomic_notifier_head panic_pre_kdump_list =
> > > +	ATOMIC_NOTIFIER_INIT(panic_pre_kdump_list);
> > > +EXPORT_SYMBOL_GPL(panic_pre_kdump_list);
> > > +
> > >  static void panic_print_deprecated(void)
> > >  {
> > >  	pr_info_once("Kernel: The 'panic_print' parameter is now deprecated. Please use 'panic_sys_info' and 'panic_console_replay' instead.\n");
> > > @@ -567,6 +571,27 @@ static void panic_other_cpus_shutdown(bool crash_kexec)
> > >  		crash_smp_send_stop();
> > >  }
> > >  
> > > +/**
> > > + * panic_notify_pre_kdump - invoke selected callbacks before kdump
> > > + * @msg: Panic message, or NULL for direct crash-kexec entry
> > > + *
> > > + * Dispatch at most once per boot, including recursive entry. Callbacks run
> > > + * with interrupts disabled, possibly in NMI context, before other CPUs have
> > > + * necessarily stopped. The kexec lock may be held. They must not sleep,
> > > + * allocate, wait for other CPUs, or call into kexec management operations.
> > > + * The message is read-only and may only be used during the callback.
> > > + */
> > > +void panic_notify_pre_kdump(char *msg)
> > > +{
> > > +	static atomic_t started = ATOMIC_INIT(0);
> > > +	unsigned long flags;
> > > +
> > > +	local_irq_save(flags);
> > > +	if (!atomic_xchg(&started, 1))
> 
> It is far from clear why this is needed. It would deserve a comment in
> the code and explanation in the commit message.
> 
> Well, I am not even sure whether this synchronization is enough.
> If __crash_exec() and vpanic() are running in parallel on two CPUS
> then one path will skip the notifiers but it will not wait until
> they are finished.
> 
> But I think that the problem is the explicitly called __crash_exec()
> is not synchronized against vpanic() in the first place. IMHO,
> it is an existing problem which probably should get fixed.

It seems that __crash_exec() should be called only when panic_cpu
is set. This is why crash_exec() does:

__bpf_kfunc void crash_kexec(struct pt_regs *regs)
{
	if (panic_try_start()) {
		/* This is the 1st CPU which comes here, so go ahead. */
		__crash_kexec(regs);

The only exception seems to be (found by gemini) in Hyper-V code:

static void __noreturn hv_crash_handle(void)
{
	hv_crash_restore_tss();
	hv_crash_clear_kernpt();

	/* we are now fully in devirtualized normal kernel mode */
	__crash_kexec(NULL);

	hv_panic_timeout_reboot();
}

I belive that it is a bug and it should do:

	/* Only one CPU is allowed to process with kdump and panic. */
	if (!panic_try_start())
		return;

But it is possible that it is serialized another way. Anyway, even
Hyper-V must make sure that __crash_kexec() is called only on
one CPU.

Result: We should not need any extra synchronization for
	the panic_notify_pre_kdump().

	We might just need to prevent calling them twice if we
	decide to call this function in __crash_exec() as well.
	A simple bool variable should be enough. But I am still
	not sure if it is a good design.

Continue thinking...

Best Regards,
Petr
