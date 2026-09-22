Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503E255820D
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790091789; cv=none; b=dB55UAWVqEc/IUwapm83YAfudsgCJYU7569KLnvPmT/QNqBeRz987fppCRhjxXPk+3VfLIke/mjh8H2G949rITAhJ/OzBoy3rw6sbCiFezz969Dm7JPUCNwjw8/fHTgDdiLrNRXLmfJD+63RwRgcGRgCcO6AqYdYiYt5eNME40k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790091789; c=relaxed/simple;
	bh=l07At5e/FtwvFEhvmUdFRuvOuYiPaFWdFCcvR7eYvUQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iiUMsh7Jb6OaKBPZWgLZdx8knAeIFKsJK+S8BzqApUA0sFzpua6QKaksZ9PGudOjJGSSqYgy3GCCcP9OMaIaoohCC6hwtfPhFIUX1RBO7uOUecep9yTh9UUo8StyFSTLPs5wX4eUFVlMVlqh3RGZMcXEllGyb7htnDgrlH+c5Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=HmGRtZ1u; arc=none smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="HmGRtZ1u"
Received: by mail-qk2-f43.google.com with SMTP id af79cd13be357-939109f067cso3416985a.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1790091783; x=1790696583; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NGKku8nyry7LJ3cQ2W+BxzqUbPO2qtN0RpKOVM2oOc8=;
        b=HmGRtZ1uXSJy5W2bLzIdB1jBwSa2qtnPXke0stGNe+fv+pNP9rnPPL4WDaTnfqr3bt
         /7mN16YmsLXQjygdMHRJMwD2buCTN0SwoJvV9Xt71/2SJDmRyKHX7Yxant0YMAAeTh+n
         zMMYMgD9RkdDN6WmPHeeAVOpKlJgusqLOlJYPXWrg6OPzNRnLOF1cumRsSfzMYfMedQo
         SasVdnkynUDXsyn2hBqYSpiJfXtJLmzc6JYBrZc3FciPxHOnxvkykWzZTP51OwaxXsYW
         3y9TznhMdcQCZSOBat6hh6sqcQaexAnF22qR4Uwcg6gLuk5bp/ze94gRCCbIZz7PJxHx
         fp+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790091783; x=1790696583;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NGKku8nyry7LJ3cQ2W+BxzqUbPO2qtN0RpKOVM2oOc8=;
        b=KC9HM/gES+3k4zlTXXvaTQFqX4btHcgtchSzCghFy2UAoCOJPiH3FFWrgjiQd2h787
         SQ1czR8oEHkdkT8NXJHPLZgpdTFqYw+6htQ31WpTtVOM473LbYrzvK1GnkjJpfrVVK8e
         3In6cQm8baSiF2lvImliZD7hMSP+7Tcjw9Us8Ba23Ho25VixAAbcPCYIB4ni1sBSHg4t
         5V+OJSr9BSe7DgLmx0GV89Fz0mt40pV+lzy5jTKVVzQviRkpWpH6hYlsmUgym5f2T7C4
         7ivgZK8y2RNu44w8WhaQrdaaSxQf9l1hBiJtMez90mfTYzceyKoBvHGjtSDiiZqkEwX2
         JCdg==
X-Forwarded-Encrypted: i=1; AKwUvBy7/ryPBzGGujOwxHGaiziW+zsP8GhegzEbUYYInBRslhDUVCEp2mQMi9hXHSX1hBbtqx4fWrougaUP+nQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lqQUjgo7gIcev5tTxYlPLnMP9sMTww/IxZwj3/XqXexpqjgvlU
	syB6CO4vg59ih7bFRKdHxne7QwAHSX1+lQxfiqcLr0c87rC8yd8JtTtfxezLOOfS9VU=
X-Gm-Gg: AYBFou0NpDZVs0KnWz/Cymcbozsic/SQxrFrlQRAmjGdFCA9ydgqxO+ur1aZSGYz8hp
	1oXMcfDzbLw1OIchXwMYwaYvBcBlgSVWSvafyfTV2m9NrldkAQnRQdDszEKFsqq0Bf1qb2UVEY3
	xufKf8NNYJYMBCtPWK7+j3fI5G33zvVXk6t+errJM7ygWKMut28nQWOhOWiviXoYLPx+fHz03DE
	4eAdiizuV8rVMHZSfFKJJ9QsdprbMv+UrMrXoUnq+CTSVSwFMjeGjXNZlWaeGAtQQCF6L4Oitgd
	Fqo8nySTn6ZrDGouDsgoZKrLUdQVl1WBydWrVAQ8W1yDinNWLf2XJxvRAW1yCGbX6/wBwKhOdUh
	k1U42xwvqiCX1VMJxE3pvtfI0bhocRCyHkSy4Pua75yp0DTRfjd70u1PNt/N2J5pPNvc+/U0JOf
	Ymn0TBVWXVgsw+IY9HQNxC8Jk55G6Z3UbYf6esbcfzjqIFeXp+++g567Ige5dEqhQiJXVd0Ek+u
	+TE3l+kGDwJtWI=
X-Received: by 2002:a05:620a:6006:b0:93b:d79f:d955 with SMTP id af79cd13be357-93c15f2e6e5mr588176085a.74.1790091783184;
        Tue, 22 Sep 2026 08:43:03 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c2485dce4sm1063585a.23.2026.09.22.08.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 08:43:01 -0700 (PDT)
Date: Tue, 22 Sep 2026 15:42:15 +0000
Message-ID: <d36fdaad78296f3c43f84bc9c5b15a36.josef@toxicpanda.com>
From: Josef Bacik <josef@toxicpanda.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Boqun Feng <boqun@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, linux-kernel@vger.kernel.org, rcu@vger.kernel.org, linux-trace-kernel@vger.kernel.org, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v3 03/13] rcu-tasks: Add a Tasks RCU implementation for reader-marked trampolines
In-Reply-To: <aqxLgT41UyA-bV5J@pavilion.home>
References: <20260915-b4-rcu-tasks-preempt-qs-v3-0-0ad30c4c5ee7@toxicpanda.com> <20260915-b4-rcu-tasks-preempt-qs-v3-3-0ad30c4c5ee7@toxicpanda.com> <aqxLgT41UyA-bV5J@pavilion.home>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, 17 Sep 2026 22:20:17 +0200, Frederic Weisbecker wrote:
> > +	lockdep_assert_irqs_disabled();
> > +	WRITE_ONCE(t->rcu_tasks_irq_ip, ip);
> > +	t->rcu_tasks_exit_cpu = smp_processor_id();
> > +	raw_spin_lock_rcu_node(rtpcp);
> > +	list_add(&t->rcu_tasks_exit_list, &rtpcp->rtp_exit_list);
> > +	raw_spin_unlock_rcu_node(rtpcp);
>
> I don't think we can do that. This is too much unconditional overhead
> on the hot preemption path. rcu_tasks_trampoline_text() should be
> a condition here.

Sorry, I missed this one before sending v4/v5. Agreed, and it is gone
for v6: the hook is now just the WRITE_ONCE() of the IP plus the
rcu_tasks_trampoline_text() check, and the exit side a single store.

The IP store itself has to stay unconditional because of the kprobe
jump optimizer: its window is ordinary text, so a task parked there
before the optimizer decided to patch was not "trampoline text" when it
was preempted, and the optimizer needs to find it afterwards.

> And do we really need to maintain both lists? I understand that they
> have different purposes.
[...]
> Can the latter replace the former?

With the above there is only the holdout list left. The optimizer's
rcu_tasks_wait_irq_preempted() now does what classic does for its scan:
walk the task list plus the per-CPU exit lists (exit_tasks_rcu_start()
and friends stay shared between the two flavors for that), checking each
task's recorded IP. That is a slow path that only kprobe optimization
hits.

And thanks for picking up the core-RCU follow-on.

Josef
