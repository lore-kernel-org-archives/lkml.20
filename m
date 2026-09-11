Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201CE331EA8
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789135714; cv=none; b=OKEvXgiMnOm6TYrIgRQ9GL8reaZcNC11pXChbJApSuozDgN+iUEXOJFA7V8+MGmiOs1nilo6uzKmEQXZUnresCFplvw+UhofSf2mH4cElqt+24d+oo2TBaunlRxlEGzNKG2zMitx/07UZEFKfrWm1El6qB7UhbwFj8gPEVu0odI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789135714; c=relaxed/simple;
	bh=mGLCukJSVNvUD9eljxCsdAnBiSIsJi3fktSed7wG1/0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wti9LsVjVB9PW4VS1uZZuTzlTm6g4DLnDN1+wEJUmcOM2WztwoBBAzyUr1pz/zcwJS3oIOQ0kkFZ/D7fY1m66TMxgESTqs2JdAxvcuLW82EXgh0JtZdWURr3n1DhB78qIRVA8C9P+Zmg+scRH5Esi9IpurEQFraYz14HaZ2tp4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sL5bulmQ; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sL5bulmQ"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d1ddd5d0aso619435e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789135708; x=1789740508; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6ZvyygIeeZLZFk3ADFQSi9cbrdflCHEYVxtulz9omaM=;
        b=sL5bulmQUF2tZKMuS0AK/0c1aHlMAG2EL1oi6ECs1plEUOYv8Ov4RzMu+NBTwoKlRp
         Yrb8FanqmDZDh8HsxhzWMcD0Wfp2BIH2kJol+xCWLbrEY4q9qe8FpiW9vGpkbX9dcEb2
         94EVNzJqjZTQt+YlHjvx7qsbWP3BAmK7Pp0VNwtjnz6ntZQX+rfQ9Ru8YWjsWEaUxHmi
         KXsuChwmHSFASKe5bpOH20Lngzuz1ILBb9v2DLb2m2+x2SM7H4bsoh2ZZmsDbIIHkBGa
         dZAPfSiXpfn1WCBsZbETyqjiCVCnZ9FhQm1gnTLZu3kkWbH6LJm4atmplcUzF6E3LArE
         3lKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789135708; x=1789740508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6ZvyygIeeZLZFk3ADFQSi9cbrdflCHEYVxtulz9omaM=;
        b=sBbd4e/av6zQ8IXeJ7KizJvETnvULSOzC1ouPAOi6dyoR46ZEoIayq8mKKkzh4/kC7
         8sSS/JAmuX3YAe/R1r6HjAjttQsdaAa28mazsh+Ie1rrBpATPI594ti9Ab8ZaQiwO/3x
         vd97RqKvXaU5kDHFsqmFsy+KD9M03x2iNkvyCoIM0ldsbmVrByyARpuBsFSlG+9Ui8f7
         SF2+9LiedvYfTJ6B2LhjJFidmnnebtfLFHNH+PGzrqDKp2ES3z4kOXxdh3feUphDPeZf
         hGKGXRtfXu6x29c+0sTeOjnykLw27ij80FwSB/TuD8DfNA1OF97Wrju5aP8tbcpoyHBc
         EZhg==
X-Forwarded-Encrypted: i=1; AKwUvBzL60iP8rRMyzuNaM/iRWyXRWqrfbTFV7TlKCiNojgIKt4ZtZwz1vjmHoRyJDl4I340C5REWpbfWzA5Nmw=@vger.kernel.org
X-Gm-Message-State: AFuF++kQ9NgKEN8gpyl2gJaxMhokhFg/o84u64CwrzaHIygBlR4p40Mc
	tlxJwOoIMdk4oiMWU+iNRYF1+smo8h6qht6BnHKc0m1AdkcUYSvl7KUK
X-Gm-Gg: AYBFou06RJLTwfe4n0stgjUJFfOficTg1/FvXMMB80ucKQ+uPfyPLgxx+2ljnu9kMkQ
	K8TY8UHwl74YZQnsYHGuI/7CTVGyKCyvHaLBE1yUYEdrkKSP/iaDefsbZgqFC/ADsluD5Pb4skC
	ZiuPqgt5wyS9Ra6cRaOvwy0+S/tCOmHRywgYwFqRZkSpkN+n5MWGZ/jSuv1H6imTAIlp1jplAzI
	X71RzMo7d9QrEevHya4W4QqCBkb/m8oTGQVOG+DDDcbeGvHwRSv5LdLLwlyEyhEc6q3kG1Cxhfx
	RDXFdYSiQfUnJKrBdJ54vxHGJLUB6QKWSebbD6zCuRzevxN/2IFrf8zcsFwql3hd7bdAFUhb/yW
	x+ole1dWi3hILg41opjzks78jgauRM4KAGc5elkbOhjQGtQUll/aE/nFc+zAUInAQLB6hlaANl+
	atma3W8J+f6YtPiovoGYn9PNHXL1q9HDmVpo5BC9+ukLqO9VHOMAnmLu44w9BuQWwrFRjVxolIo
	/eZSKT7IUI6lPdya/c8EZTgLt7pwBdP
X-Received: by 2002:a05:600c:c112:b0:49e:6806:5712 with SMTP id 5b1f17b1804b1-49e68067354mr13284075e9.2.1789135708100;
        Fri, 11 Sep 2026 07:08:28 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c2a419sm171231735e9.7.2026.09.11.07.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 07:08:27 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: peterz@infradead.org
Cc: bsegall@google.com,
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
Subject: Re: [PATCH v2 2/2] sched/fair: avoid recalculating curr status in place_entity() and requeue_delayed_entity()
Date: Fri, 11 Sep 2026 17:08:24 +0300
Message-ID: <20260911140824.1248362-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260911124256.GZ776954@noisy.programming.kicks-ass.net>
References: <20260911124256.GZ776954@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello Peter :>,

>> In enqueue_task_fair() a bool is calculated by cfs_rq->curr == se.
>> But this information gets recalculated on requeue_delayed_entity() and
>> requeue_delayed_entity() only gets called in enqueue_task_fair().
>> And on place_entity() if se == curr we call the avg_vruntime_weight()
>> twice with the same input. place_entity() only gets called in
>> enqueue_task_fair() and requeue_delayed_entity().

> I found it very hard to follow your Changelog. Could be my Friday brain.
> Sorry if I misunderstood.

It's not your Friday brain, it's my talking skills ;>.

> As I argued here:

>  https://patch.msgid.link/20260813103155.GC1246887%40noisy.programming.kicks-ass.net

Oh, I remembered that patch. 1 month ago. But I didn't look into it in detail at the time.

> I suspect that case is impossible. Which AFAICT renders your whole patch
> one big no-op, no?

Well, I run some tests with WARN_ON_ONCE and that case never worked. Atleast on my tests and on my machine. I didn't done so many tests tho.

I remember doing some WARN_ON_ONCE tests on v1 too. But I don't think I did
a test about curr == se, since I thought there was no way that it does not work. Well... :P.



> That is, I think we want to do the below.

> ---
>  kernel/sched/fair.c | 16 +++-------------
>  1 file changed, 3 insertions(+), 13 deletions(-)
>
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 4d0b94465d19..3c7fb0684a76 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -7996,7 +7996,6 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
>         struct sched_entity *se = &p->se;
>         struct cfs_rq *cfs_rq = &rq->cfs;
>         unsigned long weight;
> -       bool curr;
> 
>         if (task_is_throttled(p) && enqueue_throttled_task(p))
>                 return;
> @@ -8025,23 +8024,14 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
>         if (p->in_iowait)
>                 cpufreq_update_util(rq, SCHED_CPUFREQ_IOWAIT);
> 
> -       /*
> -        * XXX comment on the curr thing
> -        */
> -       curr = (cfs_rq->curr == se);
> -       if (curr)
> -               place_entity(cfs_rq, se, flags);
>
>         if (se->on_rq && se->sched_delayed)
>                 requeue_delayed_entity(cfs_rq, se);
> 
>         weight = enqueue_hierarchy(p, flags);
> -
> -       if (!curr) {
> -               reweight_eevdf(cfs_rq, se, weight, false);
> -               place_entity(cfs_rq, se, flags | ENQUEUE_QUEUED);
> -               __enqueue_entity(cfs_rq, se);
> -       }
> +       reweight_eevdf(cfs_rq, se, weight, false);
> +       place_entity(cfs_rq, se, flags | ENQUEUE_QUEUED);
> +       __enqueue_entity(cfs_rq, se);

        if (!rq_h_nr_queued && rq->cfs.h_nr_queued)
                dl_server_start(&rq->fair_server);

So, you say remove all of this curr crap and get everything in one place since the
curr = (cfs_rq->curr == se) returns false all the time? That way we wouldn't need to
worry about the place_entity() parts neither. I'm OK. I'll send the v3 today or tommorow
latest.



