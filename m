Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4662376BC1
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790087557; cv=none; b=pueUsy4rUaoR0KUhw5cgFMR/rRBcvJUKRGP4iSw0dNxQE9mTfrADHCDWWIrAp7susB7KZaDHx/VyJp17VddyCXSZInvl0T9qnCC8HIFaH1zji2YZazzk254IxC6uLxuCLyIbjwP1vfQfnXmv9AKVojtcvA9lG/w/xummVWnd5w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790087557; c=relaxed/simple;
	bh=avmq1P8MhVNgZJO8+7o6mdhl1aZSVeDRUZvGhCt3FMU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UIO8I+VTESRV0yL1+/NhNcg/kdlv0gtzb5yCtvwf+1Y11b6dglarbfRynQx61iN7/97CQ9AYhJssdeicLpc3ybiL3pUWQSfm6aiZwjZwcUyAearrKb4ShSwi6OqJBoIPL85e3Zbm/RlANrzxOmYNkisZTlTFCmpJC3onRgDsPhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yi+3KA4w; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yi+3KA4w"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d0726cdbcso2365925e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790087554; x=1790692354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0t8O23ACosD6aCr8ruVXRk+Oa97fdVedh+o6LFpHI6o=;
        b=Yi+3KA4w/Z9Xd4V8BGPTBpQbFHLit5BwuPq8+AAcoKL9jMjpu1hCZNdD+vW9pq4XRL
         ZDjOIPpgI3sb/aHbh3qCuboJlCkJmCsF0YiRzy5taWvfuUHm6w2GfsKIL58opfcNalAb
         2KRCK8Gtwj5Au//wJ5DhQzK67gVNzp+8GS2eYOzjala0GtJLRKXC2/XjGipdQXAeypNW
         AdPVO6zYQ1WdPfxvkx6OUDpkl6PZv+SZ1eCr22jmPFxNwvbl8N58zfu7mqAe/MGDmipw
         rJYPCOArWhHkAMqETq8P2tgXhWveKVSK8rOR9MO1XE4CYqQTnJM2P/NdD4CZCbzjrE0r
         eBww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790087554; x=1790692354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0t8O23ACosD6aCr8ruVXRk+Oa97fdVedh+o6LFpHI6o=;
        b=pIFL2jY5/x1mX1IpowK86Ar9l9Qe5MHCjhDRO2wqjx4zfzyv1YNnBDflYHQn9/DRGW
         Z/+91VnOVI2eknYCt2UolVlTgwMQUImkqgogLuBbC0OoBHzQSoEJduHIiH/aMyo3ZKPu
         zvnRrPib02g8jdoow62RDs09PpTooZchmbC0VpDe2/uCm+wur80DP7FFhHX7l8iWEriX
         bT1Wl1W/hMSvw3B/Cd95RWGDVw2YGPGaI4ojrcXdxD2jUgFEwBYS2jFhjfq28pETaP/A
         EQfvF8aIBHygdqzaFoy4u7wgRp6AA5f6hScWuxhgCr0cK3Ks0Lbx/vHFqneCJLh3MzPw
         xnbQ==
X-Forwarded-Encrypted: i=1; AKwUvBwb+nglQU9JqxDMqtKLJgCpBctH5px2vAfhUopN0EBYGwZiFTHFcVGp9nEDW/h3bgAnhpuWPtxh++FpOZY=@vger.kernel.org
X-Gm-Message-State: AFuF++mpSedKzPhiiscT1JXKNbh21bstRfELdQ4DhIdNeHchviNiBVmZ
	miug8hg4iCFQl5Ty/OxSOVnbaw9cpjENa/mRYBWBBs/Oou/98bu0Ni9l
X-Gm-Gg: AYBFou04/efr7zkhyiw4T4b/y3gccPexybHl9zxj0CU3/FyESubKNGuH/nFQI2nWzES
	AovqQAJl4cMpyk8G8SSK/oW/Z5PHqP7zCJ+XrWPVCM/7Sxf7k1GG90ektBLClIlpPfdz7V0GTk5
	gnZM7w6EDFAQbvQPfepqFZOCWTt7BxC7C9c+6eQSPQ8VLZSNLoyxmC7GJ2RspEMZUsUgyjBAsvm
	e5Lpue60yAZKbWmETIghnuAoAugWN1E4cfcihA4m1CApfy7Hs0Vaix89l2pLAC9SQAcy+MKJ2uO
	/5iq59xQ3Dhh22LVCd0c1DUDuAMM8Zcp094Gfi7EF6PxD75pGG6MiqKBMDqAq4B/yVfQdC0pa6G
	u82dNxX6WtwwwIUIEoo5/hBgt4zWd6yycv/2/61L7j5LzkPVlGzqNMfhQ2GCQE2VMSUulD1vzxy
	/9XdihhGHOyh8ZlyQn4q4+GUkijpx1d2DaIiWR1wkyk+2Wmzmk4mwDAZmv+dfZsSJdY/f3feXSv
	MBohUOWKzDJv0zlxpiV
X-Received: by 2002:a05:600c:1c13:b0:49e:7186:f36e with SMTP id 5b1f17b1804b1-49fc7dc1e75mr228853665e9.1.1790087553780;
        Tue, 22 Sep 2026 07:32:33 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdaada7b6sm36712275e9.2.2026.09.22.07.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 07:32:33 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: peterz@infradead.org
Cc: bsegall@google.com,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	mgorman@suse.de,
	mingo@redhat.com,
	qyousef@layalina.io,
	rostedt@goodmis.org,
	vincent.guittot@linaro.org,
	vschneid@redhat.com
Subject: Re: [PATCH 5/8] sched/eevdf: Reset lag when waking up on idle cpu
Date: Tue, 22 Sep 2026 17:32:29 +0300
Message-ID: <20260922143230.5383-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922101304.GQ776954@noisy.programming.kicks-ass.net>
References: <20260922101304.GQ776954@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello Peter,

> Right. As I mentioned during OSPM, one of the crazy ideas I had was to
> do something like the below. All of the lag stuff only makes sense while
> there is contention.

> Now, I've not actually tried this -- and at the very least the migation
> case is broken. But it should very much capture the rq->curr == rq->idle
> case and then some.


> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index dac15ec36d1e..70fe8fadafac 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -592,6 +592,7 @@ struct sched_entity {
>  	u64				vruntime;
>  	/* Approximated virtual lag: */
>  	s64				vlag;
> +	u32				vlag_seq;
>  	/* 'Protected' deadline, to give out minimum quantums: */
>  	u64				vprot;
>  	u64				slice;
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 2ad46fb2eafe..3e3dde5f2117 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -898,6 +898,7 @@ bool update_entity_lag(struct cfs_rq *cfs_rq, struct sched_entity *se)
>  			vlag = min(vlag, 0);
>  	}
>  	se->vlag = vlag;
> +	se->vlag_seq = cfs_rq->idle_seq;
>  
>  	return avruntime - vlag != se->vruntime;
>  }
> @@ -6397,6 +6398,9 @@ place_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
>  	if (flags & ENQUEUE_QUEUED)
>  		nr_queued -= 1;
>  
> +	if (se->vlag_seq != cfs_rq->idle_seq)
> +		se->vlag = 0;
> +
>  	/*
>  	 * Due to how V is constructed as the weighted average of entities,
>  	 * adding tasks with positive lag, or removing tasks with negative lag
> @@ -8374,6 +8378,9 @@ static bool __dequeue_task(struct rq *rq, struct task_struct *p, int flags)
>  
>  	dequeue_hierarchy(p, flags);
>  
> +	if (!cfs_rq->h_nr_queued)
> +		cfs_rq->idle_seq++;
> +
>  	if (sched_feat(PLACE_REL_DEADLINE) && !task_sleep) {
>  		se->deadline -= se->vruntime;
>  		se->rel_deadline = 1;
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index 6c3ad70e58b8..0f0edb77e235 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -689,6 +689,7 @@ struct cfs_rq {
>  	u64			sum_weight;
>  	u64			zero_vruntime;
>  	unsigned int		sum_shift;
> +	u32			idle_seq;
>  
>  #ifdef CONFIG_SCHED_CORE
>  	unsigned int		forceidle_seq;

I think we could both of these approaches.
On migration, we'll check (rq->curr == rq->idle),
On normal yours.

Or, if possible on migration before se's rq changes,
we could do this idle_seq on there too.
Tho, not really tested or proven. And IDK 
if there's a place that is before se's rq changes.

Thanks,
Kayra :)




