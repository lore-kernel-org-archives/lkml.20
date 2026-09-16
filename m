Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178D249A3CB
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 20:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789589598; cv=none; b=Mz7y8fA6I3YuyPNSJnPk0AYP73z+YxPTwbsjSMy9HeJW1L9aNp5QyWRodGHXr38e0mcmIwbgEnlJGY9isZFa1iNAiiegT1eEhww9OqCXL5ErDaq1T3cfq15IcvC8+Jer5xehzN/AcvbOjuNPh3XJbs+s5USBbIWEG6wPRabWl1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789589598; c=relaxed/simple;
	bh=4sp+4rpREZjO97dkEaj+472M7Yg5BxzTc2yQLhRbmX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HaVhT5JSvPARwun7rW/YL97tvwRr457tvU+Lngwp2o4c49D+65058oEpQHK5eBqOFvB5dNxtoV0BEbeELcIoOBvHRIffbPdOxIykUZODLj5/EtrB7Oj/X7BAeQRJFIh2775SwO7g4B2Jzsmldl/rB556/wv5wMtTC9aSxzXoRRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rmQtSXbi; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rmQtSXbi"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e71cdb22bso957235e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 13:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789589574; x=1790194374; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9VTmvkTw2diGLXl3eOVSu5aHSZduuJ0ZecJgYEVTKhY=;
        b=rmQtSXbi+goQ+HLt5lcVHemPtxTuL3GUCAPge3E7bufZLt9i2db5ESCULB1Y5ry1LD
         PCHucM8BCJtCdn0Vk5yMS1P6d8zx7oCqokgJqhZVR5x9vjJsuhJFrrFvrRVtcEd/nxYg
         HIVZyrWfF4ezxMn3WYkTEl8x6qGP6r6C+SgtV8y6bd/jgJmjC59tbCMnez+GOYOGZjTy
         mb+CRuVQ7oOq9Qc7JbpEhGD2VObauHpWJH/zWiIWIIM8JiiUlYu3xAOPKclbdx2EHsjm
         GYlOaBojCzEky57hp4UyNuOQdV82rwFSoP2HvtVBNyMYDpwwr3f3z4hv7WJnSWrife3G
         +UJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789589574; x=1790194374;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9VTmvkTw2diGLXl3eOVSu5aHSZduuJ0ZecJgYEVTKhY=;
        b=zV5ugmL65nLykl71A8vk5orNdT5GYJ7jYG9J5KfqJ9r3QGe7c3R9QHRsg87NTaSx6d
         FpSTImFWLfSIyW3Lfw+08HqU+hacj7AGVccKBEfRjUy6CE+xotbJxVtkfqUHNpACupmQ
         FWEPEMquqXjCHWZmjP/+v9I7TiuGJKjYs7qWQvytvZSX4Lo7frS0rzaw25vrFUZ3SF4g
         edZi9FVprjxgXa5pL+lTxHAwA+Ko7+egFmhL7Zk32A8NdB/MFiqw+OrHwiLA52dLyQOG
         BhK2ZOazfFobr/NIIxkmW+5oJvO5ep/O3RjOHoEL5CxHGBs7qzmcNv0+NVMtvk4K0mIs
         BA4g==
X-Gm-Message-State: AFuF++lwlKAYtw/diYa6LywE+KNVrQMr9OFKdghAC7UvH+w4ADtRDGAD
	sQ66EJ1uLsSCh7qsioEp13JJzfKpZQCNifHIBVJYiUOZPXGzXgZkQJlC
X-Gm-Gg: AYBFou33loZxbgI1XFvCYEBajyZSPG9u0ixNsiDRr32d6ZRgw2G7Y5ebQ+eP8JYY2tL
	xFTGqFL8eHgGuxLCowwFpwHXLJZH9SSsEa3giPjRAaYHaMVK9ky7CWvciIW2YRxjdJe2R7XKQrl
	XItxpnu0l9qcK2VxnmoLqTL+NgzsX/YfAxD6cH/jtfIelZxUC8ZkUNZkFMgtgjFGLKujGZ3kXU1
	mHLWRgW4LmafOMzOWg0I7yqurG0Q/QM0+qqK4/9l7cYkYkJipi6aLEuqnrcmhwZwQm0PjBNOh3A
	nHr9H8V8qLOhVgUX4lwsACn/hn9Js1lP7NOteH8NorhUsY0XxGExCqEAL7q3vKdjCd/Wg34DixU
	LOqlgsHlIX4qnsT7/JLKUu5+wjP8VMF7hFmJUYkkQ9BaLtGNbsW0RAFXg/ojwNsmu9nXZ7W5P/n
	HW03h4vENsaD0JNQgcJtijJmlj2QFpjZ2JWBPq4u7liQ3J9eO1Dt+kamlsvBImF5lrsq7CTLvvq
	XK/19NbZFtrAFg=
X-Received: by 2002:a05:600c:19c6:b0:49e:645e:2616 with SMTP id 5b1f17b1804b1-49eac463955mr44100895e9.5.1789589573405;
        Wed, 16 Sep 2026 13:12:53 -0700 (PDT)
Received: from andreayoga.localdomain ([31.189.82.102])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd23a815sm16569185e9.14.2026.09.16.13.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 13:12:52 -0700 (PDT)
Date: Wed, 16 Sep 2026 22:12:48 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Hyunwoo Kim <imv4bel@gmail.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	John Stultz <jstultz@google.com>, Ingo Molnar <mingo@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [patch V3 8/8] posix-timers: Handle exit in do_exit() completely
Message-ID: <aqr4QJgA-G_aoYow@andreayoga.localdomain>
References: <20260911090341.949101445@kernel.org>
 <20260911090541.947206186@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911090541.947206186@kernel.org>

> @@ -167,12 +167,6 @@ static void __exit_signal(struct release
>  					lockdep_tasklist_lock_is_held());
>  	spin_lock(&sighand->siglock);
>  
> -#ifdef CONFIG_POSIX_TIMERS
> -	posix_cpu_timers_exit(tsk);
> -	if (group_dead)
> -		posix_cpu_timers_exit_group(tsk);
> -#endif
> -

Now that __exit_signal() no longer touches the CPU timer queues, does
the block comment above timer_lock_sighand() need an update in the same
patch?  It still credits __exit_signal() with invoking
posix_cpu_timers_exit()/posix_cpu_timers_exit_group().

The barrier diagram further down in timer_lock_sighand() describes the
same old callchain, and it is what the WARN_ON_ONCE() right below the
diagram relies on.  Would it help to spell the new chain out so that the
WARN_ON_ONCE() keeps a documented ordering argument?


> @@ -661,18 +661,29 @@ static void cleanup_timers(struct posix_
>  	cleanup_timerqueue(&pct->bases[CPUCLOCK_SCHED].tqhead);
>  }
>  
> +static inline void posix_cpu_timers_exit_work(void);
> +
>  /*
> - * These are both called with the siglock held, when the current thread
> - * is being reaped.  When the final (leader) thread in the group is reaped,
> - * posix_cpu_timers_exit_group will be called after posix_cpu_timers_exit.
> + * Invoked from posixtimer_exit_task() after PF_EXITING was set in tsk::flags or
> + * from posixtimer_exec_cleanup().

Should these be posixtimer_exit() and posixtimer_exec()?  Neither
posixtimer_exit_task() nor posixtimer_exec_cleanup() exists in the tree.
The callers are posixtimer_exit()->posix_cpu_timers_exit_task(),
posixtimer_exec()->posix_cpu_timers_exit_task() and
posix_cpu_timers_exit_group()->posix_cpu_timers_exit_task().


>   */
> -void posix_cpu_timers_exit(struct task_struct *tsk)
> +void posix_cpu_timers_exit_task(void)
>  {
> -	cleanup_timers(&tsk->posix_cputimers);
> +	posix_cpu_timers_exit_work();
> +
> +	guard(spinlock_irq)(&current->sighand->siglock);
> +	cleanup_timers(&current->posix_cputimers);
>  }
> -void posix_cpu_timers_exit_group(struct task_struct *tsk)
> +
> +/*
> + * Invoked from posixtimer_exit_group() after PF_EXITING was set in tsk::flags.

Same question here: the only caller is posixtimer_exit(), and
posixtimer_exit_group() does not exist.


> + */
> +void posix_cpu_timers_exit_group(void)
>  {
> -	cleanup_timers(&tsk->signal->posix_cputimers);
> +	posix_cpu_timers_exit_task();
> +
> +	guard(spinlock_irq)(&current->sighand->siglock);
> +	cleanup_timers(&current->signal->posix_cputimers);
>  }
>  
>  /*

  Andrea
