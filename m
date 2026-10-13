Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7876A48F022
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 06:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791871497; cv=none; b=rk+kcO0yALQpbUnSVUAJCRtorFFWehaYeu3Cjtiw3meAxn+DI/FpT20PZNhBvAaagFrVTQdUU+rGSYdiDuOhheJ7qlv5HgUX+lMtEiLMQZEayUprR7VasZMGKajT/UZ8497N3i5CXBM7fedzHNy1mcQGIvkaPp3stVrTd+rr1u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791871497; c=relaxed/simple;
	bh=ic/HnWI2uVjT7xZGS6/vTXvIfeGBCgY8SkuyZlDJjxo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ao5n+hLPc83NqAzCLEiTMswEysrBmjNgxVA8khDLs2KrN2J66m68dQIvpzPtsanQopESomqZXi/0m5W8dz9egIKwWcVaZA+5hoNz8U9C5RXvqn5dsf4hEyOLkbVIoYU/uijZxGo0MlkqnWzhqS092J3Fzzd+2QT3sI2N4qydD+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TtYX5obU; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TtYX5obU"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48c4207ac26so2435035f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 23:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791871494; x=1792476294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NWCISX+AIl6irThIkjqUzshDOHoJAyWfFCmE1q6BCDU=;
        b=TtYX5obUcd2ZzMmPnZEjnFLzT9fI9Svb/8Vu7xu3vttny1FUmFGxp1lko4gKVXuXJ0
         9NITuHN4ZTib5YSAsj74nM0PLhW5smrP4gJ653p/Bf6JPx3KX2d6oZBI0A6WSk/CexTr
         pX/3KlGNm6G7pzRj/jDixDE9ToHz7xuIFhvhTf4YOeXT+EhM7NzPqEKOmF2v/w/uA0lg
         QYwlE90CyrV80gpjBWSjRHMJO6ZO7uO8reb73rphAAhKjW4+Ng+QjiVrhq1ecP4xJ/at
         hGO+zw99ObOmb2iibUfvXLGIhO1399eQw2JKyWRe8g/+H5W1mgH0wH1rVSGMEbG7sPbL
         o/WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791871494; x=1792476294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NWCISX+AIl6irThIkjqUzshDOHoJAyWfFCmE1q6BCDU=;
        b=H6izadocscSrVLAX/3KGw8WPAEa1dcG6C1YDosURkoTnVYHsm6NjnYz1MEMvBH+UsX
         Luh6wl11pO4rOR+C+jeszyr1hewYFEzG9RwcuJoFCwteTiw1JBWnX3aIa8G0NCNSrEfb
         IcKQSr8m2atEiApSDAXaCsKFBcjTh+JcHWoSSjiDMpSbaDRoC/Xk+bp4+HA6KE5JTtzS
         SHEui/XNzRuNeejKHGwwMGl6Gqx7bGE+vnO5NquOdJGWXxZOTMGOyjdPAuqHY7KhNmPS
         pQRZWps1PvyZEMFZi9JPOsv3s856RuY6TnfJc/YEqZyGBozKmhYHAasM7VFrSZqqvcav
         c9Ew==
X-Forwarded-Encrypted: i=1; AKwUvByVRWCAF9KOEcvlqCDPr80UnRYg6ER/iUtmvkKThitN/aLKBh2xluNkvGG6x/AF4lRsvJththcjNoTegrA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJx80O7iegAG3zHYaG8skFnrXAHQ65ap0UHF6TRxCL7gT4x3Hjk
	KcuFtVjWMV5i5esrgjsLO/fa5E0RExgooRbngqazK3dX0LVGJxgo3pr9
X-Gm-Gg: AYBFou3i8+TyugqHNFdOJobTulaGknWLtN2kIfge1wr70jKcASieK4vVwizq5IWM1E6
	TvkUhR14qk49kHgcO0dhRT23nHRdAigkS3sU+H5edAmW/H7kyqfEZjz+39UYxEu0cbnYDIEeShT
	vYZe/o2lQtcPHDCjmzRUJw0duINOdPUnxSR/+f1l3dKLdHCYAfdFryvXGDsftAZzQ1MN8n/owdx
	AIqGhu7gxWU9K/31miPfU6b59DqIUN1Rtbwm4gcUi67q6+C5PrVve+KxSruxzjec+Jso6+bJIlG
	C2kYLozXdiUP4nH84p6iHIiUCkIazt4nBGNH2csMQv3NMluxL84QhIQUimpMEmq4bPW10H+lLjj
	eW0tBBe/ldiEkR0tSQClZ8/EmAmJOFdBYN2w/7Sjd/fmOF46d8flWj/jiQLkPEJhZQOWNQEW0lk
	2BUGT7IHcFYdOM5Gl51ILNz608xmVDNQ9zy8KZkHjS/EJNAyNFpGvg5mZVvyV8s7tC2WYbGVZTw
	47trJYDctf+LqLf8kgFC1ETB/ythNJxzeE6KqnMmejYUJRVWf/xWGQtjjdHDlQc0OjlAQ4=
X-Received: by 2002:adf:e7c5:0:b0:48c:7ee3:e07d with SMTP id ffacd0b85a97d-48dbaceedd2mr16125022f8f.52.1791871494440;
        Mon, 12 Oct 2026 23:04:54 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de096922dsm2684630f8f.8.2026.10.12.23.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 23:04:52 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Andy Lutomirski <luto@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [RFC PATCH] entry: Account the deferred hrtimer rearm as hardirq context for lockdep
Date: Tue, 13 Oct 2026 11:04:48 +0500
Message-ID: <20261013060448.751816-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261012152120.GT4121339@noisy.programming.kicks-ass.net>
References: <20261012152120.GT4121339@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Oct 12, 2026 at 05:21:20PM +0200, Peter Zijlstra wrote:
> On Fri, Oct 09, 2026 at 01:46:49AM +0500, Mikhail Gavrilov wrote:
> > Not touched, and a question for you: the rearm in hrtick_schedule_exit()
> > also stacks chains on the preempted task's locks, under the runqueue lock.
> > Chains with hrtimer_bases.lock under the runqueue lock, this rearm among
> > them, were 4.9% of the pool in the boot above. Should it get the same
> > treatment?
>
> I'm thinking those would be there before the patch too. We've always
> done hrtimer_start() from there. You might not have seen it because
> hrtick was default disabled for most.

Right, hrtick_start() has always put hrtimer_bases.lock under the
runqueue lock, and 9213aa4784cf ("sched: Default enable HRTICK when
deferred rearming is enabled") is what made it common. I'll leave that
one alone.

> The first question I had was about __exit_to_usermode_prepare(), that
> also does hrtimer_rearm, but doesn't get wrapped. I'm thinking that's
> not a problem because at that point the lock stack is empty and all
> that. But perhaps a comment?

Yes, no locks can be held there. And since the chain key only covers
the locks taken since the last change of irq context, a rearm on an
empty lock stack lands in the same chains as the rearm in hardirq
context. In the 46.6 hour boot, the 16 chains starting with
hrtimer_bases.lock were all created in hardirq context, and no process
or softirq context chain starts with it.

For v2 I'd add to the comment above the helper:

 * The rearm on return to user mode needs no such annotation: no locks
 * are held there, so it uses the same lock chains as the rearm in
 * hardirq context.

> That said; I wonder if we want more of irqentry_exit_to_kernel_mode()
> wrapped like this. The schedule_preempt_irq() thing will now also stack
> rq->lock and the like on top of 'random' kernel stacks, rather than
> keeping it in 'empty' hardirq contexts.
>
> Or am I making a mess of things?

Apart from the rearm, the preemption is the only thing in there that
takes locks, and I don't see a way to run it in lockdep's hardirq
context: preempt_schedule_irq() enables interrupts before calling
__schedule(), which trips the lockdep_hardirq_context() check in
lockdep_hardirqs_on_prepare(), and hardirq_context is per CPU, so it
would stay set for whatever task __schedule() switches to.

Nor is the shape specific to the interrupt return: schedule() under a
held sleeping lock stacks rq->lock on that lock the same way. In the
46.6 hour boot, chains with rq->__lock on top of other held locks were
18.1% of the pool, and lockdep_chains does not tell which of them came
from preemption.

-- 
Thanks,
Mikhail
