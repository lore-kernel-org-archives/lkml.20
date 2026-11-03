Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793689678;
	b=rgweqCdfcU+V05V5Az9d+I6trpKmGOrsxay3VzI4fZSWeLf1cg8VRkRI1r2brm+A7a5R
	 zrXK2X7NqftgellVq+U12qj55db0xc957aszOV86QMdwl8oAoScKEQzS8ZWI6wHFagMnQ
	 vVjkfAhEpWs+JlbpDZBOh0szp6RRY3b0VKZE5sAfRChrwYmGnCR1vRNIVgb5WVlYIe9Rt
	 ykWoYJc4BQk854GYedsQaQ54yD86oAyZ5ImFyCDwd8KRUXNGi/PQncL4MADRMkmPou9SV
	 1V7DBAvnCiwB3+tR6sCCaRWvs6toBa4sQ9FxaCAiX1/Rn41N+2liWwSCYAD5rUsGEBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793689678;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=fj56z1BKjY0QeIgexJqhobjoHtJNuvhgBU1MRi3qBMg=;
	b=m1JrAOovjpc/cYIO3CNrIm4RAFQXs4rWOWbt6bxcTJYBDB+ji5Gpqr8h8jip307XruaF
	 IbmjDJ9eCEzs0rYp5VzFyQ05dUlWU+TLRORIdiklY7lwUwvyLh74FxwTct9zxC10nKhKv
	 ThcXlsa+k61NLNLtvz35TYNHsZmX/JijNnS6ZYZeqRRGVguLRnAUxPOJr3Bvrpl7aviZo
	 FejPLVsGg8hN3l9EKoGviK/mYarJ8TxQKFnW4kUkJ/qHbpSkI8M8UdomcolBKNtKdW9hI
	 6wYxvRjn90alky5IoPchxdf/SOf5J0z19XNmzxEh1cS1YTKpMAMN09gg0FA8gJtM7Yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YBjTk3Jk;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Pbn3snyM;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8046E606A333
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 07:07:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8046E606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YBjTk3Jk;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Pbn3snyM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793689676;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fj56z1BKjY0QeIgexJqhobjoHtJNuvhgBU1MRi3qBMg=;
	b=YBjTk3JkU8X4ha92Oh0RxHM2dKbL880U8FQglcXXMGxVPRptXXm3cyd5H59SVyG8MRJkje
	4u0ZF1rIIBn/chKuxUq4DWplgY/NhYOi4ibROickwAmiKjPS1Nj2nV0RTzOHY2fPAXLnXP
	OxatgaN42RuJtlisJXgcRfl2av5lkMY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-696-Cc5UymKjNRuXkKQvouuDIg-1; Tue, 03 Nov 2026 02:07:55 -0500
X-MC-Unique: Cc5UymKjNRuXkKQvouuDIg-1
X-Mimecast-MFC-AGG-ID: Cc5UymKjNRuXkKQvouuDIg_1793689674
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a1d1f26a63so35819755e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 23:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793689674; x=1794294474; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fj56z1BKjY0QeIgexJqhobjoHtJNuvhgBU1MRi3qBMg=;
        b=Pbn3snyMpu3+lBk7+YaY1ejhUCY2eFxFc3cRA2tU2JL+G/JfpwO+y2PLPOtZkKM9/T
         wgXm8hEivBlaZz7uPY/7GojWzqsDbLu9PNohBHrdfFPX9S3b5UokKPrLxA3afbjRPsCq
         B5eaBH+hqCz0B3fIZD8vbwCEVpb+gR5QM1OBHxhrhblg4mQ98icUJBWZUYU13ToCzi0a
         ut4fh9Z30vGJHUoxOmW9hhEaa8CDicn1eWXecAWUSmBUKT9w10kmj8nLZcWI1Ky68dZ2
         hmfAZTBJ1hgVVz/T5AK2tiQTq0hxvuRAT2NCPc0WsfVZP6pCAz8yk08fBp8AJ23EZVb+
         PGnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793689674; x=1794294474;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fj56z1BKjY0QeIgexJqhobjoHtJNuvhgBU1MRi3qBMg=;
        b=k6pSRww9GpvcCv5/N5CIuRv0VcHfCat+zCXlc7PxLQfGmrgYBzXkntY7DRIxWc5cZu
         eHUXc9fCUKtF4grG/2eiVKsZCU00mgCaC4w36DUFsiWQ0EDovA1MHUztUL2YsyykRL10
         m+h8W2X8bZQpztQH9Xf90LKHlDE9LJGWqhueWCcqpD3fBc3mqeSeJYeRi+rQvlzukFff
         AXytEBbyvnRHo5kHQcCw113x+dWWNbI5/m3Qlc0JvmEhLiqIGpEEA5N9IItkAokTIY/q
         jnSiUgv0tb0m8UU8ciebXAPqo5aEMN7hW+qKW2ywbtc02MlZEjErTawkoRQziGqCMRDt
         nEjw==
X-Forwarded-Encrypted: i=1; AKwUvBypbVJW3I/A8dTJda/WZrAalZA0eAE3cKGW3DkK1gWm0PnMxt7gAh+egDXvj+/FDASueEfN4Y+lUA2rd9o=@vger.kernel.org
X-Gm-Message-State: APuU4Z9FC3V/mGbuhzEcgKrCUyBJcqVxlVObX6050P2Yh1Fm3IKQQs2J
	NuXIm0IJGVvaFW7AEQwoFyrrZYAN1W4r80l5szyiAU9YOk/xG+8SnM1ZUe6bsNM8rJZ0nGG6e/P
	OHiY1mBMP6fujoxyzG3gJSMaWFIzOgGqrEUegaQgWwZTpaCEh0wuvl6KHNGVP+wE3m4VvzPgVsg
	==
X-Gm-Gg: AYBFou0Vn0FEIYLgzPpX5GUL2scb0hQ5XxHDSVxAqZyCTYPGE4Pz7JziMfvZBl3KSaz
	3wNTnDSgo4ElWzxjmIyiCstK31MBcsk71VzNH9gwrOFDywwfVDWeoe5Z6EVpHO7Gl8pZlj+N3Wi
	kSQ0yyo6inKWmwCmCx8Qxs+8GHCZHAujIttWehm/TyE9EL+aKPfhUcV800Xeo4FEnv2SxmJgDxr
	1iM/32G/ivcxZ1L44SFSn6+MHTJLzXGgTlkccFdnHu17ni0CEH4XzUfZ74U0XSIQ4B8eg01MQKA
	O2PxudWdGHPZplCaPrc6A77kTNDk24fF3Sqyqq53z6VBs/Sjn1x1MSiDbbfuKOcOjOyDUUk88OM
	wGcaNPRNAVdgJ8r4EVO13pgkG5ZxWK8K2AOakxZvJZ2nUAKyzFCIntGYjN6RYO7XR9ju6KhWz8x
	BRaA==
X-Received: by 2002:a05:600c:811a:b0:4a2:1e1:d55 with SMTP id 5b1f17b1804b1-4ac187a6b30mr262967045e9.28.1793689673770;
        Mon, 02 Nov 2026 23:07:53 -0800 (PST)
X-Received: by 2002:a05:600c:811a:b0:4a2:1e1:d55 with SMTP id 5b1f17b1804b1-4ac187a6b30mr262966665e9.28.1793689673372;
        Mon, 02 Nov 2026 23:07:53 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.158.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac0a0a3495sm250673935e9.4.2026.11.02.23.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:07:52 -0800 (PST)
Date: Tue, 3 Nov 2026 08:07:50 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Andrea Parri <parri.andrea@gmail.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Aaron Tomlin <atomlin@atomlin.com>, linux-rt-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched/deadline: Fix spurious -EPERM for
 migration-disabled tasks
Message-ID: <aumIRjQS2M0wWlVq@jlelli-thinkpadt14gen4.remote.csb>
References: <20261102135420.244745-1-parri.andrea@gmail.com>
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
In-Reply-To: <20261102135420.244745-1-parri.andrea@gmail.com>

Hello,

On 02/11/26 14:54, Andrea Parri wrote:
> sched_setattr() can refuse to make a task SCHED_DEADLINE with -EPERM,
> even though the task's affinity covers the whole root domain. A retry
> can succeed, but the error blames an affinity the task does not have.
> 
> __sched_setscheduler() tests p->cpus_ptr, which is not always the task's
> affinity. When a task is scheduled out inside a migrate_disable() section,
> migrate_disable_switch() points p->cpus_ptr at the current CPU until
> migrate_enable(). On PREEMPT_RT every spinlock_t holder is in such a
> section, so ordinary kernel work opens the window. Elsewhere, seccomp
> filters run in one.
> 
> Test p->cpus_mask instead, which keeps the task's affinity and is what
> sched_getaffinity() reports. This should be safe because an admitted
> task's cpus_mask covers the root domain, so set_cpus_allowed_dl() moves
> no bandwidth when migrate_enable() restores p->cpus_ptr.
> 
> The following program, run as root, had 553679, 453720 and 424623 of its
> 1000000 requests refused on three boots of a 4-CPU PREEMPT_RT guest, and
> 236182, 217174 and 237183 without PREEMPT_RT. With this applied the count
> is 0, also with lockdep, and a task pinned to one CPU is still refused:
> 
>   #define _GNU_SOURCE
>   #include <errno.h>
>   #include <linux/filter.h>
>   #include <linux/seccomp.h>
>   #include <pthread.h>
>   #include <stddef.h>
>   #include <stdint.h>
>   #include <stdio.h>
>   #include <sys/syscall.h>
>   #include <unistd.h>
> 
>   #define REQUESTS 1000000
>   #define INSNS 300
> 
>   struct attr {
>       uint32_t size, policy;
>       uint64_t flags;
>       int32_t nice;
>       uint32_t prio;
>       uint64_t runtime, deadline, period;
>   };
> 
>   static volatile int stop;
>   static volatile pid_t target;
> 
>   static long set(struct attr a)
>   {
>       a.size = sizeof(a);
>       return syscall(SYS_sched_setattr, target, &a, 0);
>   }
> 
>   static void *worker(void *arg)
>   {
>       struct sock_filter f[INSNS + 1];
>       struct sock_fprog prog = { .len = INSNS + 1, .filter = f };
>       int i;
> 
>       /* Reading the arguments keeps seccomp from caching the result */
>       for (i = 0; i < INSNS; i++)
>           f[i] = (struct sock_filter)
>               BPF_STMT(BPF_LD | BPF_W | BPF_ABS,
>                        offsetof(struct seccomp_data, args));
>       f[INSNS] = (struct sock_filter)
>           BPF_STMT(BPF_RET | BPF_K, SECCOMP_RET_ALLOW);
>       syscall(SYS_seccomp, SECCOMP_SET_MODE_FILTER, 0, &prog);
> 
>       target = syscall(SYS_gettid);
>       while (!stop)
>           syscall(SYS_getppid);
>       return arg;
>   }
> 
>   static void *hog(void *arg)
>   {
>       while (!stop)
>           ;
>       return arg;
>   }
> 
>   int main(void)
>   {
>       pthread_t t[9];
>       long refused = 0;
>       int i;
> 
>       pthread_create(&t[0], NULL, worker, NULL);
>       while (!target)
>           usleep(100);
>       for (i = 1; i < 9; i++)
>           pthread_create(&t[i], NULL, hog, NULL);
>       for (i = 0; i < REQUESTS; i++) {
>           /* SCHED_DEADLINE, 2us every 1s */
>           if (set((struct attr){ .policy = 6, .runtime = 2000,
>                                  .deadline = 1000000000,
>                                  .period = 1000000000 }) && errno == EPERM)
>               refused++;
>           set((struct attr){ .policy = 0 }); /* SCHED_OTHER */
>       }
>       stop = 1;
>       for (i = 0; i < 9; i++)
>           pthread_join(t[i], NULL);
>       printf("%ld of %d requests refused\n", refused, REQUESTS);
>       return 0;
>   }
> 
> An LLM helped find this bug and write this patch and its test.
> 
> Fixes: af449901b84c ("sched: Add migrate_disable()")
> Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
> Cc: stable@vger.kernel.org

The fix makes sense to me.

Acked-by: Juri Lelli <juri.lelli@redhat.com>

I only wonder if we want the reproducer in the changelog. An alternative
might be to move it to https://github.com/jlelli/sched-deadline-tests
where I keep the rest of SCHED_DEADLINE tests. I can probably do that if
you agree and prefer.

Thanks!
Juri

