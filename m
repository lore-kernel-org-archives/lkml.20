Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458A648EC67
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791814530; cv=none; b=FIwMZAJeQ0Du6yeELglMx/NTRJ6FaNHPwHFYe26kZwYDfdh6EcOGXlvHP0i0iw+bEziWWXnbsfB5CZeAm2CNTbbVjRX0CrHgTXmBoT7158rMvt8DI+7yS4XUZ+SJawCkijdpJTPSMT2gnp4Vp5gHWSUJ7szzjfus6XD4IbUeR4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791814530; c=relaxed/simple;
	bh=8Hx4LyXnrR+jEIf6HgFsFeMNvYWQp3bkb15nReOq1ig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bktivQ16YvZLekgyUZa4V3T5XPQX/yLFtGEP2HV4Bf7t3T0EdF8i0ZTk5J6SmuSaQs1THxhxTzCvU6jY5kKlDgISS+EsaGBgDu3+S8X/rLPfxc9VU6G6R/xvMPkQ/Q0SIh+/gtxdT/3N5M0E9JRlMIvAhQHdYF2qrWX2FbgWxLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gVnhVAoL; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gVnhVAoL"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48afbd35952so93898f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791814527; x=1792419327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vXq0E091sd0ptd0CzELhGcHr/yz5Nvx+ZadANvOnAdg=;
        b=gVnhVAoLO6G/XOv0XGuYuqrThXBbcBtZ7NBNQptjTWYGAwt5bN6TjQ3QpgMOUYWj+B
         bHROXI2xdxIoqaeuCtX4gePas6TzW0iDYsW56efNDRWnI+DrE++hmnoP1yYRKmkAPhkg
         cX+XfF8npLvVDX+tlDcOl47ULpP1I8VBlYsGxKoDXb7u/7+VdOrFMK7Yr+gxLdupw/KI
         JHs1BjqdPFlSKmaqSM+liQOtyRIorwldTc3No0NDMvFJELpBRz+tIW4oYBMbQ/EBjFXF
         +rXZmfUALAAQCHFVrIE3PviRRKCuryPeXa+c4aQoqCwQRlT4kB22nHqB69RiVFvlRAXT
         mkGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791814527; x=1792419327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vXq0E091sd0ptd0CzELhGcHr/yz5Nvx+ZadANvOnAdg=;
        b=av8j3AnbMBeMxt7Nch2rrjEcxvcWY4CoEysIYx6yn8AkkVuznGe/K5l+Eh/H1ygcOk
         Fyx1Pt+HLMCWTfOlwZZgCAPEox8h9j16lS6HbE2NkHf5R/gw2ahZPHC8axg/ciKlGFFk
         T/TQef0tclubPCiiV69BHATbPIWS76Oc9A5vdlJvkuuKAKXS1xTMu30qIFVGQNogA6SM
         B1+GfkrU7lr7aZuUc1eyyYWs/MpT9Xu/71URL4V3FigC0y++01l+wLo+lbyRDI1zmEHQ
         wyVXOJ48vgde80hemMelXj+zZ68o1Nx6ynZMGBjp3BXWvImUqEoIR9la2glOJG+VZGhP
         F4AA==
X-Forwarded-Encrypted: i=1; AKwUvBzQWFDp4/EtHy4qSog83GyMKV2ve8URB7dx/LCpwJkp8pENgefvU9YV3O/Jm852aIcPPW8TKxCpzcS6b14=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQsnYnYoAY+qLpOtZgincSq7OddCd69oCgS0eKwVw9SxvvjpBB
	BRijOP/s7iVoz2syskP+fwPgQ2EKqLAVPzS/A4s1SN6jVeEXMVBP9Oay
X-Gm-Gg: AYBFou3hu0SlOgppK6B9wlQ9r3R0symBKxG8vvRy2zjgPhKWK8/xCYxNc00iT09vE0I
	26zJ9E5yMAzzQIez1TOfmhIq7vYWhR/hLUhCsGup0gosBy7nGX3ep6OiVYycHXWcaUbdj3awyk7
	X85GTGlKp4h7iLVkooUJXHJxZzJOoBfWBSRPkKmDP/fNHcPmgp29nGA9iZIwLYBOKQcLnbgz4hm
	MuTOnwLGzsk4wdWc3hQ2ZG3v7WNqQSn26ROHe9ORTshljnQsdR9wpF86oYJPbP7m93UEc/Vya7y
	DWfD3lYcsw4R8KZz4U1AoR55feQAQh2MLsm0mN73qzfo8jQzI5mIP6TgIWDYy0f0j4Ct3rb/MtM
	/8EWeUpC5gnevXfaPEvr7PP+0amqnf1tjD2bGlbFSEuiwqgAlcZm5ye3glXNKC4JYEDtLJwiql2
	wM9bl7YTGzuzsG8Xbu6J01NIVPt4vdCYdo1o/TYbvAyPoJiTigKr7fICusoA8Ue1ZMmxVY/jwUv
	KWOo8XSmZ5tv4pnGVtJPftKaA3inZE=
X-Received: by 2002:a05:600c:a086:b0:4a0:1f9e:5f78 with SMTP id 5b1f17b1804b1-4a18e3ea887mr159528235e9.0.1791814527297;
        Mon, 12 Oct 2026 07:15:27 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db98c2800sm19694171f8f.26.2026.10.12.07.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 07:15:26 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: peterz@infradead.org
Cc: bsegall@google.com,
	christian.loehle@arm.com,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	kayracizmeci@gmail.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	mgorman@suse.de,
	mingo@redhat.com,
	rostedt@goodmis.org,
	vincent.guittot@linaro.org,
	vschneid@redhat.com
Subject: Re: [PATCH v3] sched/fair: remove dead code on enqueue_task_fair()
Date: Mon, 12 Oct 2026 17:15:24 +0300
Message-ID: <20261012141524.3529-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261012140225.GU2009045@noisy.programming.kicks-ass.net>
References: <20261012140225.GU2009045@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


> Argh, so this is bandwidth. Task gets throttled, but before it gets back
> to userspace to actually dequeue, it gets hit by a wakeup again while it
> is still current?

> Hmm, no, in that case it can't actually be on throttled_tasks. So it did
> get dequeued, but it never quite scheduled out.

> I hate this bandwidth stuff :-)

Ask me...

> Anyway, this is different from the initial use-case, where a
> sched_entity would get dequeue and re-enqueued while walking the cgroup
> hierarchy, and thus had to appear like nothing happened in between.

> In this case we're fine to advance time.

> Anyway... the normal block/wakeup paths are >< close to also hitting
> this in the case where balancing drops the rq->lock after dequeue. The
> only reason ttwu can't tickle this is because it has that ->on_cpu
> stuff. However, we cannot use that on the unthrottle path :/

> Bah.

> Does this work?

> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 5c98d8dfce5d..0edd8bfb6363 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -8250,7 +8250,14 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
>  	weight = enqueue_hierarchy(p, flags);
>  	reweight_eevdf(cfs_rq, se, weight, false);
>  	place_entity(cfs_rq, se, flags | ENQUEUE_QUEUED);
> -	__enqueue_entity(cfs_rq, se);
> +
> +	/*
> +	 * This can actually happen with CFS_BANDWIDTH, in that case a task
> +	 * can get throttled, dequeued and then unthrottled, woken *before* it
> +	 * schedules out and does put_prev_task().
> +	 */
> +	if (cfs_rq->curr != se)
> +		__enqueue_entity(cfs_rq, se);
>  
>  	if (!rq_h_nr_queued && rq->cfs.h_nr_queued)
>  		dl_server_start(&rq->fair_server);

This burns my brain. I *think* it should work. 
But at this point, I don't think me thinking
alone is enough on this subject. So,
I'll try to test this... I'll post
the results tommorow or today if I even could.

Thanks!

Kayra

