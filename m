Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7ABB4BEE52
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 12:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789301302; cv=none; b=qb0Tw1wASfMPMK+pyTqKgqbOnKdXaesRrCzqrWQ9MdUCFrvv9Jpv88s5zXDLDj7RAihgS1aN1Sg2ksMpefYYKPNCOYwhkRqIlVVH8MYg2DmpWlAuW7SyXXly3P2+uD1/Q8HvPGNfGC7pRWSS9sFyTG6i9YyEkW0PwifE6R2muRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789301302; c=relaxed/simple;
	bh=apY0A4WizTCP59J26TYeXZVRIhy+naRUEHiKeRCe060=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BkCBvRktG0c/912kV+FcqSjqcL3p1Wu5eHBt9NmihReUlUYVWLSHAs8tdCrG93YL+FPgGs3Df8rVAcq27oSMwpZtoTZqueQMHamvFwRekjOz/fM2bbX7TXmrKb8DYyCFaCixzsQEEbfZ/S4aN/V9Orgx28oNtzOYkyrpRXMZW5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZXbt0put; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZXbt0put"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843178b1c8so162164f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 05:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789301299; x=1789906099; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8I4hlMRL7jp+sEyBR2jYI/uI6MHf0Koed1W9yy+k+mg=;
        b=ZXbt0putt2RN4ISmxK8cBCFcA/vFp9LGZRD1X1mMvW74F9yxdmV8V/12sp+yHOy4K0
         MjlCs5JfshqaLPtpwSyM3+cHtnzMVA5cYZHeykYF3Ay7Jdk1/jYo4WAx5uEuMsfD7640
         qE3PB8goc9pU/PXOEwD9ggW1qJh4JxK7kWUjPL/PwCnENbIUw+V3jxcEbyVY76kRSWlz
         /MV9MPOtAfgCazgSJwdv5UqmDa0QmtSUI8BxPZqcJoIDlP17etz3uthQ6qidzbNIlYFm
         vjep8dvpmmAdVFDXwWRvFr5+FRhWgj3W/0pqKHLZ5/502E8Y8IZCLIPyCx+7mqa8c+Rm
         dg0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789301299; x=1789906099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8I4hlMRL7jp+sEyBR2jYI/uI6MHf0Koed1W9yy+k+mg=;
        b=EV2SuzIZhnG6GRMQIBFcm2hvxy9nsEIEYxfPUC0Awa0hRThLqsKtzhB3cwmflHyGGZ
         FmoXGSs+nG4DI0gfaDcqj4mbr8u19qyoSeWHsAz+4EWt9n0cBDKa7nGwqQQ8L7qwvCbe
         VQlJgUOC3wX2cXP1evY4f5ES9JlluqZfwr9LS/7YUxhbB14O2svE9ys7JkHNzwxMp1aE
         1GoMWvEjMyr3NZVtC2/xb/W2lgmgLAU4g68m/gHhMIMA9f6D6K5s6ziPDDPOU5G9jfZ6
         D6kmH7GCfMMhbR7loXkv+rL0lolLYfZNVguRd3/l48ViGZxMZCOqNSpfuc2VVqXms+Vh
         V3dA==
X-Forwarded-Encrypted: i=1; AKwUvBw4gRwDmbIG1dnHVH8l7bPc7u2n7Whg690fZ1pi4apHhHw+nwfM45cCdplqcP+B7pOHTpW2N74fLskE6e0=@vger.kernel.org
X-Gm-Message-State: AFuF++lh7nVFOym4W3PLtvYUQfAZew3a9r7smDhvEfnHwpKO4GI0bO6l
	oxNLO17Oi8yNRKmPTa/Q+xuYf8dQbjiM6z0gun0MxNkdFgeFtvmqdzsG
X-Gm-Gg: AYBFou0nxXA0lgE0n7/H6RMzTA/P9U3ZAVSrOvULYTxHdh15QMm6LwZ+xyGt1YKUSSa
	G0+1Rd6KPxDogBn0gaLqoaqVZ5fNP7aKQ8dOuiTJQhIQm9VBMl24qWMheyl0HVuQszxhGAc7Lqp
	ingcjxYJfgxDZlSRluee7xpGc3DtG7Yba5ZAxVW9OZ8/geRoysTkoZI8zg3B/iXOghB2zKlpnGe
	sHKIePPf/y7SZSHVw5HRd276hdZFUwmgUjJ5csRm8WXP63gAeFuBLo3MG2Gx+aumGb2x68Fl1A9
	BG7C0GhyX/nCNGVVJe5F2jLdPzg8CaOAmjYpgB5vo+UgIg+5du3XgQvnlAy5s1pvoOPHwRBapnb
	5EI1w+OK7nFlOdXDNW7Hkinl9MvbDLukqgKrUh5w7BUK8OqXNmDC1mUk8Yf4r+Df4kje3PgkP4n
	OGSv9jNSXxmv5qa9edmNZxgBmuivbCyu5SNyMa3tEak1RUO0+d/C/L0hTV2CuEtQSxwFod/dVGG
	dcheIWAHrJIOG25aJE/
X-Received: by 2002:a05:600c:4693:b0:49c:e363:c66e with SMTP id 5b1f17b1804b1-49e619abd64mr128256425e9.1.1789301298845;
        Sun, 13 Sep 2026 05:08:18 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26be3e35sm304455095e9.2.2026.09.13.05.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 05:08:18 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: sh_def@163.com
Cc: arighi@nvidia.com,
	bsegall@google.com,
	connoro@google.com,
	dietmar.eggemann@arm.com,
	jstultz@google.com,
	juri.lelli@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	mgorman@suse.de,
	mingo@redhat.com,
	peterz@infradead.org,
	rostedt@goodmis.org,
	sched-ext@lists.linux.dev,
	soolaugust@gmail.com,
	vincent.guittot@linaro.org,
	vschneid@redhat.com
Subject: Re: [PATCH v5 1/4] sched: Dispatch task ticks for donor and execution classes
Date: Sun, 13 Sep 2026 15:08:14 +0300
Message-ID: <20260913120814.1273086-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260913064722.1534766-2-sh_def@163.com>
References: <20260913064722.1534766-2-sh_def@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello All, :>

> Proxy execution can run a task from one scheduling class on behalf of a
> donor from another. Scheduler ticks therefore need to reach both the class
> which owns the scheduling context and the class which owns the execution
> context.

So, donor and curr's classes may be different and we should call both of their task_ticks.

> Calling the donor first preserves the existing runtime-accounting order for
> execution-context consumers. Keep the existing class-specific tick behavior
> donor-gated in this patch, so the change only introduces the new interface
> and dispatch mechanism.

Hm..

> +/*
> + * Run the scheduling-context class first so its runtime update precedes
> + * execution-context tick work. A different execution class runs second.
> + * Same-class proxy execution gets one callback; ownership-specific work
> + * can select rq->donor or rq->curr as appropriate.
> + */
> +static inline void task_tick(struct rq *rq, int queued)
> +{
> +	const struct sched_class *curr_class = rq->curr->sched_class;
> +	const struct sched_class *donor_class = rq->donor->sched_class;
> +
> +	donor_class->task_tick(rq, queued);
> +	if (sched_proxy_exec() && curr_class != donor_class)
> +		curr_class->task_tick(rq, queued);
> +}

>  #ifdef CONFIG_SCHED_HRTICK
>  /*
>   * Use HR-timers to deliver accurate preemption points.
> @@ -923,7 +939,7 @@ static enum hrtimer_restart hrtick(struct hrtimer *timer)
>  
>  	rq_lock(rq, &rf);
>  	update_rq_clock(rq);
> -	rq->donor->sched_class->task_tick(rq, rq->donor, 1);
> +	task_tick(rq, 1);
>  	rq_unlock(rq, &rf);

So. Let's assemble a senario.

rq->donor's class method will be DL, and rq->curr's will be fair. And the sched_proxy_exec() will be true.

ON THE OLD:
Only DL runs. That's all :>

ON THE NEW:
task_tick firstly runs donor's method. That's DL. Then we goto curr's class which is fair, and run that.
But because of the newly added checks, because of the donor's sched class not equals to the fair's the code just,
doesn't run. 

Wouldn't it be better to merge this patch and it's use case together?

The commit message is confusing too "Scheduler ticks therefore need to reach both the class
which owns the scheduling context and the class which owns the execution
context." But the patch doesn't do this on it's own. 

Thanks, 
Kayra






