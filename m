Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C562931D3
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 07:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789804274; cv=none; b=hxWrYNKSs0pxgoMELMfUHXL3zPN2jSnhNjf+ePeN/Huld1wFWuNIHtSCdVJdxnurZiSfHvmRrS5RQMrNOIN81IZEfkndGvLzC57h+u14KJmk7Q6c3AiFpppSZcSsr1qQAfiI3vFr4uCaLrkFzGwyPkqFDr9hS8O7EZrq81sA3h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789804274; c=relaxed/simple;
	bh=SdGg69Lf2f/c7zlOy+yoaONpEyD18VUSaXFrrrqP2pU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QPlvwWjwPRvG+hfROwA5RnGj2AwoC4yphc32o/ZS9/hbqCK1v67v28Uqy+I/wyU8eUSckXfckBHxWrlC5U1D7kZZqCzG+iUiIpmyrTR32bGqcQ+ZzMCAG+pFJlmKxPl8g8gZfnnzoaEQNiUS+dFQDzWR7s/4p3JzMxyFhy2fRJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NW1pj2G1; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NW1pj2G1"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso10745215e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 00:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789804271; x=1790409071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nRlk/WUzRZ0e9+e8R5qbLxPWlUEapE9AWMafOSpJ4n8=;
        b=NW1pj2G1QiNTfwp3sVQFtmRUblU/WJPrZxZalOYavQIZ9H5FGYOeKGRe+9tf38V7Wv
         Bj7fgD4kFo7UvWJ573p8rfAR2xxUfjAhzQHNfQlsfT+YXFVNpn/qrVQymxs8qsx3gY/K
         edLGi2JodSsbJ1xsuJ/JTrng+P0LNgQOg7axbwI/3kbt3WmHD1R1UaRjGe2C1Ev5nrTw
         kuz/FZxtOF1VDXkdNHSCef/ujKxmHw8RoKAYVywufAJWCVXwMolc7FP1s1pmwRFuOQ+n
         +aJugXyx4ODqtfhWrtPfVTOCbhXP4TAv/ObyMtPVSnkcNXgT8CQJQJncVSwq8qLnC23B
         iruA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789804271; x=1790409071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nRlk/WUzRZ0e9+e8R5qbLxPWlUEapE9AWMafOSpJ4n8=;
        b=T7Pdns/T2EzpHUwOwwIU1UIvOKGBSPAzHdq/cJzGwOcewheRRM3amh7Q5OUJfuJkyK
         6FOGYZfE4yNE0XWG+GfK9g7pvYr0ZTNek5Pk2K3xeipU01wrnXXZqxnoCVM+YoDuVqFX
         +Ydwb9Uo+Sx7/wXSf4UlNqSrlhMKCywU6mgUyzmHrTOYs5tKuOP9cxBvzc04x+8HRsiq
         b8sF144KnA9mlI/MOXmSrfU45aj4M8BpP6ooIYZEw13Nsk+iySBhkKLwU/b5VdrHHTUy
         XmPESKRBDYFMMZXheRZ6hECRi6M9cr6cWAULt/hH+7Wim+dIgrbrZwA3qmDxCgGnJz9X
         lBcw==
X-Forwarded-Encrypted: i=1; AKwUvBw2E4qkYo22nbRkBxaRJ9t//kYjVf/kblmxZOF4CWi4si0boL69wXPSl9EHIrex16ZLbUI/+TKTXahezIk=@vger.kernel.org
X-Gm-Message-State: AFuF++kQ6X9C3zlimvtnym+nP8GF5FYO9IXa52kZWrueBLBL6ggue8l3
	gOSuHWf83g0K03Cy1mCBQe63n35cI5tGGK6xW7+ccocw5dHkHvvKMMaJ
X-Gm-Gg: AYBFou3G7QueURTnBIFD/iQxeWOojnxvJQaBD0mE9nQfB9Ov51xupwwad0715MIP7V7
	nTsmKUSZ/LZ0OeW8h4S2vQw/rZDvoCKHkROp8k8UFt3SSh9MSfJFLCLjZbC0wZO1a0qddqROWGG
	dw2R6GG5nP/q86oCUpT6V2FwqoV/srvvyjJU9fcxY9y3NbN+AwmPp5nq0IyoEEw5bEX5r1Lcwyx
	4Kd/o/LfagHWFuCQgqvirJIGg1A29ECA7tWKGE1LjSBE1VxGtYDqc31YuNnNdkuOmcbuRSafSjs
	qIcmRoS5a/UWqJJ5ha+2XFYWr16oE73yZz/oboJwlvvUYVI1DONvwDfqVWFJp/qPcuxWVRKeDdb
	Ze8JiMpsD6vQzErO8m7WsTvIygf/yt1IHL0DrTQwmW5TuOP/vl8GtXBP07EWl5YIZEO1V/7goOF
	tbipAzettEHjO9f6Sp/QwCeWckb6fKWUvAzv/+/KwB4Rm1NhbBZGaLf81jbNgBWFDO5bSRLa6B8
	5ik5kGAXxTuta8fhEYher8MUzyYowHfWm1TtjD8dPNwdF7SgrxatU6XKPvSt4N2CMNWZ5j1MHCe
	coVXdlv+4gurIyyBfgXJtiEskH7W4Wj0O5JzYnUii6g40kniy/sNtPDsqCeCtfYXrorcH6wIVVZ
	wIwoNVLQ=
X-Received: by 2002:a05:600c:4e86:b0:49c:d52e:d0ea with SMTP id 5b1f17b1804b1-49fc566e6efmr63350715e9.4.1789804271212;
        Sat, 19 Sep 2026 00:51:11 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a017-2b01-05fe-203b-7cd2-a640.310.pool.telefonica.de. [2a02:3100:a017:2b01:5fe:203b:7cd2:a640])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-487245636f2sm4701823f8f.17.2026.09.19.00.51.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 19 Sep 2026 00:51:10 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Boqun Feng <boqun@kernel.org>,
	Lyude Paul <lyude@redhat.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v2] softirq: Preserve interrupt context during IRQ exit
Date: Sat, 19 Sep 2026 09:51:05 +0200
Message-Id: <20260919075105.34023-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260917152150.dvEKJ8B3@linutronix.de>
References: <20260905023210.82853-1-kmehltretter@gmail.com> <20260917152150.dvEKJ8B3@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 2026-09-17 17:21:50 [+0200], Sebastian Andrzej Siewior wrote:
> The breakage is limited to KCSAN & friends within the window during
> transition to softirq and out. There is nothing else? Well, the timer
> wake looks wrong in trace, noted.

I know of nothing that is broken today. It is more than instrumentation
though. Code that reads the context from preempt_count sees the
interrupted task in that window. Besides ftrace, KCSAN, KMSAN, KCOV and
the printk caller id I found:

 - can_spin_trylock() and local_trylock() on RT refuse hard interrupt
   context. A trylock on top of a task that is blocked on a lock
   confuses the PI code. In that window they do not refuse. BPF attached
   to sched_waking or sched_wakeup reaches them through kmalloc_nolock().

 - oops_end() and make_task_dead() test in_interrupt(). Today an oops in
   that window is treated like an oops in task context and kills the
   interrupted task. With HARDIRQ_OFFSET set it panics with "Fatal
   exception in interrupt", like an oops in the handler itself.

 - rcu_read_unlock_special() and raise_softirq_irqoff(). See the end of
   this mail.

I'll list these in the changelog. I will also say what the patch does
not cover. tick_irq_exit() and the other deferred rearm sites still run
after HARDIRQ_OFFSET is removed.

> /*
>  * This is only entered on return from interrupt. Preemption disabled
>  * locations remains unchanged, the context (-HARDIRQ +SOFTIRQ) is
>  * updated and lockdep is let known.
>  */

I'll use it, reworded, and add two points. in_hardirq() is sampled
because __do_softirq() is reached through do_softirq_own_stack() on
several architectures and cannot take an argument. The raw operation is
used because the preemption disabled section from irq_enter_rcu()
continues.

> The casts look odd. We need this? It is defined as long, yes, but
> preempt_count accepts an int only so it will throw the upper bits away.

The value is the same. Without the casts gcc warns:

  warning: overflow in conversion from 'long unsigned int' to 'int'
  changes value from '18446744073692774656' to '-16776960' [-Woverflow]

-Woverflow is on by default. I'll swap the operands:

	__preempt_count_sub(HARDIRQ_OFFSET - SOFTIRQ_OFFSET);

and use __preempt_count_add() at the end. The difference is positive
and fits an int. No cast and no warning.

> I think we want to ensure that irq_count() == SOFTIRQ_OFFSET

Will do. This path is !PREEMPT_RT only, so irq_count() is the plain
preempt_count() one.

> that is quite some WARN_ON_ONCE. We would like to see just
> HARDIRQ_OFFSET at the end. Or SOFTIRQ_OFFSET before the end. One should
> be enough or the math is wrong.

softirq_handle_end() will have one. It checks irq_count() ==
HARDIRQ_OFFSET after the addition. In softirq_handle_begin() I will move
lockdep_softirqs_off() before the assertion. Then the lockdep softirq
state is consistent if the assertion fires and printk runs.

> irq_enter_rcu() did preempt_count_add(HARDIRQ_OFFSET), did record
> task_struct::preempt_disable_ip. [...] This looks like an improvement.

Yes. The preemptoff tracer changes too. It reports the hard interrupt
and the softirq processing after it as one section. I'll add both to
the changelog.

> Why is this preempt_count() instead irq_count. Why is there
> IRQ_EXIT_TIMERS? It is almost as the first check except now we would
> like to ignore the additional softirq_count().

Yes, that is the intent. irq_count() would skip the wakeup when the
interrupt hit a BH disabled or softirq serving section. The old test
did not skip it, and nothing else handles pending_timer_softirq.

I'll drop the macro and the raw preempt_count() and use

	!in_nmi() && hardirq_count() == HARDIRQ_OFFSET

This is the old test, evaluated before HARDIRQ_OFFSET is removed. It
reads like the first check without softirq_count(). I'll add a comment
that says why softirq_count() is left out.

I also want to change the order in your code. With HARDIRQ_OFFSET set,
raise_softirq_irqoff() does not wake ksoftirqd. rcu_read_unlock_special()
raises RCU_SOFTIRQ instead of setting NEED_RESCHED. Both assume that
interrupt exit handles pending softirqs. In v2 that is not true for a
softirq raised inside wake_timersd(), because the wakeup comes after the
pending check. The timer thread would handle it, because run_ktimerd()
handles all vectors. I do not want to rely on that, but wake the timer
thread first:

	if (IS_ENABLED(CONFIG_IRQ_FORCED_THREADING) && force_irqthreads() &&
	    local_timers_pending_force_th() &&
	    !in_nmi() && hardirq_count() == HARDIRQ_OFFSET)
		wake_timersd();

	if (irq_count() == HARDIRQ_OFFSET && local_softirq_pending()) {
		hrtimer_rearm_deferred();
		invoke_softirq();
	}

	preempt_count_sub(HARDIRQ_OFFSET);
	tick_irq_exit();

Today the wakeup already runs before the rearm when no softirq is
pending. Does the old order have a reason that I do not see? Then I
keep it and document that the timer thread handles such a softirq.

Karl
