Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794843049;
	b=rDtev73Nxn+XInHVng/s8OeA3DEXJbKKmPozf8NKUrTFCpCAx7F10ke70RP09LV1NOnR
	 SnZQbpEuCMDaOdaIOSsJHC/YVQW1pjE2LbVVaKZXX6zXZzELlMNqjitcDtKffmBh6dMRY
	 f+K8yZ2BO8F32BezAcVf2N/iHlYxGqws1mvCjotUHBWTdKyQBCS3UPjW9KrsIgO++mXnT
	 zirAGDP4MDon9BIPZ2leZs5fMPpJu6DGY94WVk/bbA0L45LoTd6CaHIBKFDuogi5bBeuw
	 pTUY1Ea73i7la69kjTg0j6TfcKH03jvX6i4MqE9BXEztQuspNsi37qIFJqoL39WyTcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794843049;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=hPr9IOYFjtJaYI4q2QerjW2bLfRzLv1kPuZUspzu/XY=;
	b=GGU5Z543ZYN9tbnD2VKgTW6eG0GFpPxt0rJCNMFXUzvXJvBls6Xv1UkA/9sPZvRz+36s
	 MzoBI2cg1E5fXaEKGoNQwQ+V9AJMJrzIVbnorLIr9mAgD+to9fj0SKgcWt7NjZjMQnegb
	 jX0a95QDhwC5znRjfZ4LE2ixAMjQ6VjTrRcQoHyoYd5QvdLDix/LVwtbyLc4cCACyOY17
	 3oXt6XMq+yzqSAmDlwPV6sauBfMYsj0teWSzKQ5daQnisZALvONIJV9GjF8vHCqh5opTd
	 r06A2bHchtqwjx1ZGACUEFbtE65LZK/Hn5sAMyCkXflBlwKGVOA+1vO+qXtpSaCmT7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=eAhCdfIK;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64791606A33A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:30:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64791606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=eAhCdfIK
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so11585285e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794843047; x=1795447847; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hPr9IOYFjtJaYI4q2QerjW2bLfRzLv1kPuZUspzu/XY=;
        b=eAhCdfIKl5mPrwQuKFbVoFA3q4oXWguQqagInhzpW4knYPgHyd/+RDBzfKdfDUhYrc
         B8YxxDd7tF5OawO5pQ1prRvBlKt6Ff1uJfp5058atdcuoGSs8UxE9WDjFpYaFKaSJaOU
         VhuLX80MPey6FZEe+WGZznQWSeo/HiVC2wkglBkhRAkVJC4dGCb3ptqvBTefe27K5wY7
         ft8VUxABnRKDLwjs5Sa8oLWEnVx7u8nujPT52t3wTTpydkZ7cW21QxFZuhEPe65xPJwa
         AN1TnrBi2DLTrq6KzGGB229v5ORJq+adCRoXoIoNt7NSTeTNyR3kAGJ3YHa8+5Yu2Lb+
         7qDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794843047; x=1795447847;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hPr9IOYFjtJaYI4q2QerjW2bLfRzLv1kPuZUspzu/XY=;
        b=rHHzBN6etvhxpiEzeS7mLG6KF/jhWLMVXLhHqBZaN9oxDiD2qbMNaK88Upaga+1yWN
         QKDe4hCqBER/0TnyTi9OotBVwvNsRxC3xl6nOtmnOTOEuu92kuXXFiWSDCxBMWsLOIgH
         3y5i5iavWf4HK31WGB066Mifr9SPQYZd9I5VB67LU5u9I394kP5+Viqw98yjARmwD1B0
         izQlZ+DzLaFAr2BorJcxf5p8VTFneXkGaEQZExOCTWx1Zl1Yzv28OPC126yqU/++TcLH
         GV+pxUbBxYOBeExBQsgpvfJqypQoxikitN+xqtaUshF78UZf/eqQCG6243UTxVTuSC9M
         jtAw==
X-Forwarded-Encrypted: i=1; AL+hErFZX1ahlZPDZ8Ym9eliGpHBwzEUdynbU2VK+W1jfqz/y6+4tZTii6XsrskWSIy08xRzznit7o0QWx4fLEA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+cxmN/uSp2zwkULr1V8n26vHmwvZdYrcPsY7ouRBEr+bipXYOG
	R7/SvKRp6PDmxEoKks8EPFvs5gxzG7sVn2/6WzxfMeVILINk3U9FsU8UhHaIyVZGhLY=
X-Gm-Gg: AYBFou1MPcNzLZ03Ky086bAUo82OiSWEQkAap/siuiSMvP8R7slJqemqEPMe+wt96Dp
	GC4zBJYgued8Gy7qvPPCQ7AglJt7QyWZSJGXWxO6tZU1cuoFTCEnnNK2KLIatipRpHAsazucdhu
	2+HRqCcELwFjy1/qE9A6S9Na9EItTgeI/z62TfHqb9DneM9SLUPWZDBg0E38H1fdnRp5peKgp1y
	6D1J7sVMCvfZuTozRgm06VgDrpK4y5dFXmAD88DvIYkzK8D/6CxYmmGqosFyCbi7GUCJy6BFe74
	okd6dmXZ32eUlOPkQjvP5agZVminyJDnYZVl0zkLdzovdfAmOIfO1PA7ok/a9PuoP+AaqBxv78j
	h6W2vH/Dsd2IOJGqgVPjKKwxQAK4LHDsbRSxsXNSD+9CpoRkBiJ4PR6WAXHbr7d+7CBdLiznUST
	Q2gdyrzRWBJLdKUl6yH7rsA7U1ZUwHA5BjrSs4ADKv6jDEtQqmrD7j8mya+tyKyW+JlQ3n5OoYs
	+lLFysuUeaK3DBxdxpv+onBXiQJDIP+g3PVEm+63Zh91WIWX/sExj3k5n4t44ASASmqGClUsl8I
	imF5EG+JcqvbrU1u9IOnI2i12zwv8vg=
X-Received: by 2002:a05:600d:8449:b0:4bb:5f07:10d7 with SMTP id 5b1f17b1804b1-4bb5f07134dmr146384475e9.26.1794843046610;
        Mon, 16 Nov 2026 07:30:46 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae5299sm315252695e9.11.2026.11.16.07.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:30:45 -0800 (PST)
Date: Mon, 16 Nov 2026 16:30:42 +0100
From: Petr Mladek <pmladek@suse.com>
To: Aaron Tomlin <atomlin@atomlin.com>
Cc: john.ogness@linutronix.de, rostedt@goodmis.org,
	senozhatsky@chromium.org, mingo@redhat.com, peterz@infradead.org,
	juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, kprateek.nayak@amd.com,
	akpm@linux-foundation.org, baoquan.he@linux.dev, rppt@kernel.org,
	pasha.tatashin@soleen.com, pratyush@kernel.org,
	ruirui.yang@linux.dev, david@kernel.org, ljs@kernel.org,
	liam@infradead.org, vbabka@kernel.org, surenb@google.com,
	mhocko@suse.com, kees@kernel.org, anna-maria@linutronix.de,
	frederic@kernel.org, tglx@kernel.org, mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com, brendan.jackman@linux.dev,
	hannes@cmpxchg.org, ziy@nvidia.com, bigeasy@linutronix.de,
	clrkwllms@kernel.org, linux-kernel@vger.kernel.org,
	kexec@lists.infradead.org, linux-mm@kvack.org,
	linux-trace-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [RFC PATCH v2 1/5] panic, sys_info: Fix duplicate and dropped
 all-CPU backtraces in panic
Message-ID: <avshouTNBIeM5qtP@pathway.suse.cz>
References: <20261103024453.922373-1-atomlin@atomlin.com>
 <20261103024453.922373-2-atomlin@atomlin.com>
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
In-Reply-To: <20261103024453.922373-2-atomlin@atomlin.com>

On Mon 2026-11-02 21:44:49, Aaron Tomlin wrote:
> When sys_info() was factored out of kernel/panic.c by
> commit b76e89e50fc3 ("panic: generalize panic_print's function to show
> sys info"), __sys_info() gained an unconditional call to
> trigger_all_cpu_backtrace() when SYS_INFO_ALL_BT is set, while
> panic_other_cpus_shutdown() retained its own call to
> panic_trigger_all_cpu_backtrace().
> 
> This causes two problems during a kernel panic:
> 
>     1.  vpanic() invokes panic_trigger_all_cpu_backtrace() inside
>         panic_other_cpus_shutdown() before stopping secondary CPUs, and
>         then invokes trigger_all_cpu_backtrace() a second time inside
>         sys_info(panic_print) after secondary CPUs have already been
>         shut down, stalling for up to 10 seconds waiting for offline
>         CPUs to respond to NMIs. Furthermore, if SYS_INFO_ALL_BT is
>         configured via the kernel.kernel_sys_info sysctl rather than
>         panic_print, panic_other_cpus_shutdown() misses it prior to CPU
>         shutdown.
> 
>     2.  If sys_info(SYS_INFO_ALL_BT) is invoked on the panicking CPU
>         prior to panic_other_cpus_shutdown(), calling
>         trigger_all_cpu_backtrace() directly bypasses
>         panic_trigger_all_cpu_backtrace() and leaves
>         panic_triggering_all_cpu_backtrace unset. Because panic_cpu is
>         already active, vprintk_emit() silently drops all NMI backtrace
>         messages originating from non-panic CPUs.
> 
> Export panic_trigger_all_cpu_backtrace() with a panic_on_this_cpu() and
> one-shot guard so all-CPU backtraces are only emitted once before
> secondary CPUs are stopped, consult sys_info_get_mask(panic_print) in
> panic_other_cpus_shutdown(), record prior Oops stack dumps in
> panic_try_start(), and route SYS_INFO_ALL_BT in __sys_info()
> through panic_trigger_all_cpu_backtrace() on the panicking CPU.
> 
> --- a/kernel/panic.c
> +++ b/kernel/panic.c
> @@ -451,13 +452,21 @@ bool panic_try_start(void)
>  	old_cpu = PANIC_CPU_INVALID;
>  	this_cpu = raw_smp_processor_id();
>  
> -	return atomic_try_cmpxchg(&panic_cpu, &old_cpu, this_cpu);
> +	if (!atomic_try_cmpxchg(&panic_cpu, &old_cpu, this_cpu))
> +		return false;
> +
> +	if (atomic_read(&panic_redirect_cpu) == PANIC_CPU_INVALID &&
> +	    (test_taint(TAINT_DIE) || oops_in_progress))
> +		panic_this_cpu_backtrace_printed = true;

This would be pretty hard to maintain. The complexity of the check
shows how many code paths affect the decision. I can't imagine how
to synchonize all the pieces this way.

We need another approach. I remember that I have already proposed
something some time ago.

The idea was to enhance sys_info() API to remember what has already
been printed. trigger_all_cpu_backtrace() and frieds should
not longer be called directly. They should be called only via
sys_info() API.

See https://lore.kernel.org/all/aj5tFiwhRqPkAkqU@pathway.suse.cz/
for more details.

I think that this would be a better way to go.
What do you think, please?

Best Regards,
Petr
