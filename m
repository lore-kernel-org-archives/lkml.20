Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FD1471408
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 17:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791135040; cv=none; b=rwEjxUGGXI6Ev5IRLKO0qYgkvHOH9Cd73xLGhNecXrgs4e2TFof0cCyiyPZJjsaYN8Z+HCRxZEv0fSPrWVP1Cg3dbEr1imilCjlgDlpm8TssHq3/m1ncMddtZD41CTRXwrg6VyiS5YxR+zhs4vggUUkLo0ewIgb2UgIAgABEB8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791135040; c=relaxed/simple;
	bh=WXL5LZkJrtzk9YPJU9X6JrPpHjTvu4EMRFegf6wNEUM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XxHDfu0oxfwtu8EnK13b9Ww3B5C5+8lo5zDDeXW9opar7qpMsax+RFou/MFCUd/i9KxH5lCFxsCwRQpOxwGl5r4zdGpXxkMm5TXtNgBMefF+S4AIgrGadyLILnzA1BfIWubmH575aaznc+dJ5Y4uxaXx6NzI5XUopQzeKIGcJQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GZlhxpcP; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GZlhxpcP"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482e1b55da8so97689f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 10:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791135037; x=1791739837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K9BNRj1cE9nvNKn/WOlSUCpAG1T6oqBgGlxlrkhv5sI=;
        b=GZlhxpcPYBjSozAyWHbMWJlJts7e0Xi/f6rNEHP1OecszGrF8bS7Qc8AC3Hzt+w6ql
         yTUwxTd/G7ovu8Cs5RzmWcsGM0jnUAVc4Xz8VeIEvAM3zd7kZphqg9oF0jycGN+sCnQe
         UbDS+LsEllLf2+0BQH0+PFE/uCxK7INUPCtdiZ9IBkvUm8TsTjer8FJevLlBROHM9LDE
         sP94p+LYUpje2FyX8QnYpF0HqyD0AALNYqTtBlIM+XuoHk3KwpYjZBF5vb4znY3KatIi
         afAF0d8ElNPywuZ25iTjddvJ+DPVBz/4YQz1soSCER0D2AxjXgjOokX5P5HJWApzxb67
         +oHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791135037; x=1791739837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K9BNRj1cE9nvNKn/WOlSUCpAG1T6oqBgGlxlrkhv5sI=;
        b=nly73rrrr9awRhI1j/WvPSB0St624EKIHugg2qfeB7oCPVQIx88QIbz/1JWeyOsq1g
         uyOlOjm5/ejiRajrQGJaKrPw8W+17FWayA8qSoEQcol9sEwgtFV3EhRcmm/M/CMfAMwx
         jyHgfljowinYQQqgbMFUCh5/CoNBcskPgewAFIKdEgOonu3VGR9k7wXIpft39zEj6p8+
         XJr7JKevxvS8H2fg7v2xLzv9jywFIMQh1Y/0qXnogCoE9lHAauFcSz6YqWlzAwChi5vW
         7yZQpN2E2QfVzxDuz11HVlV1bIqb3H8lbPIB8s+raldfWsT4R+7l5GcdhmTPGlEeQAuk
         Z/tw==
X-Forwarded-Encrypted: i=1; AKwUvBw7+yk3vbHXXPXYBhhmMbhKrCSL0tBls8xJe6Q4OaGAhLLYAC3/SU1QTwFjgWyGDAID8Moz6+lyo7Gt4nI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKu+8zm5ECFEQnlAG6gFV3KB7k2LrkVz1CVbw+0sZsKHo6aXnX/
	pabYFjSXdUxg+mj9ygjj9psIZgrC1I5dTGQmgoqWUuKqI6Em2N/dXl1J
X-Gm-Gg: AYBFou2tAsZOoXJmVo86WWGELX11WWnFIxJH4XEDAkzUsQuedST+KdsgQg4fDybBTk/
	mS65Ip7pgGiGztDlGFLvjZ62TVtPC47I6l1kGWBzmdhytip/Niu1o8dzOrOrnFya28nCzn/4ksh
	mh7/5FZbPjhh/0EH6N77L7U0+YwCH3GthepTd5iXkONKJiqRNMTJcP94+txf+ES0dyD1xTsaIfK
	DlLyFx00SYexJ83sd9itvzRIcBNcIGDAWL9zZKhwdWbVH+mGafqhFxVPa2aNP5T6cMsT9kkJCnl
	gYu58aNOhbMX4Sj8F7nN4UacgAjzwN8FlOjECKIVYKWtArzI7hdxAnLWEeupUqxHsJ7xU6bnFvG
	NU2XEbawsU5Ivc7MEnclM7GS9+bhktNhUge2X6awJzzi4vPGHyXuoxx4vMgdi1UVG9osUPAivME
	wiVRyZaaQTpkHJeNQ+lMc7BcqrNkviK+JEjpKnlewBp53oJuKAtJNoYO56zjKzRDIVVDfELABOw
	2sRA6zoPHXvaoM1nR9y/bLd32aKYzo=
X-Received: by 2002:a05:6000:2f8a:b0:48c:4802:e253 with SMTP id ffacd0b85a97d-48c4802e368mr8983746f8f.6.1791135036570;
        Sun, 04 Oct 2026 10:30:36 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b382f8ab4sm18299306f8f.35.2026.10.04.10.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 10:30:36 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: vincent.guittot@linaro.org
Cc: arighi@nvidia.com,
	bsegall@google.com,
	changwoo@igalia.com,
	christian.loehle@arm.com,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	lukasz.luba@arm.com,
	mgorman@suse.de,
	mingo@redhat.com,
	peterz@infradead.org,
	pierre.gondois@arm.com,
	qyousef@layalina.io,
	rafael@kernel.org,
	rostedt@goodmis.org,
	sched-ext@lists.linux.dev,
	sshegde@linux.ibm.com,
	tj@kernel.org,
	void@manifault.com,
	vschneid@redhat.com
Subject: Re: [PATCH 02/18] sched/eevdf: Reset lag when waking up on idle cpu
Date: Sun,  4 Oct 2026 20:30:32 +0300
Message-ID: <20261004173032.18867-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002154415.2270586-3-vincent.guittot@linaro.org>
References: <20261002154415.2270586-3-vincent.guittot@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> When several tasks wake up simultaneously on an idle CPU, their final vlag
> will depend of the ordering as the first one will lose its lag but not
> the next ones.
> Reset the lag when the enqueue happens while no fair task has already been
> picked et set as the running task.

There is a typo. ('et', also 'depend' and 'loose' Not sure that's all :>) 

> As a typical example:
> CPU0 is idle
> TA with vlag 0ms and TB with vlag 5ms wake up on CPU0 simultaneously.
> Depending which grab the lock 1st the behavior will be different:
> If TA is enqueued 1st, TB will be enqueued with a positive lag and will
> be picked 1st.
> But if TB is enqueued 1st, it will loose its positive vlag and both TA and
> TB will have 0 vlag when fair will pick a task.

> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index d7cc77181ef9..32d7077ef148 100644
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
> index 8cda1d39b037..4c8f12fc8869 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -893,6 +893,7 @@ bool update_entity_lag(struct cfs_rq *cfs_rq, struct sched_entity *se)
>  			vlag = min(vlag, 0);
>  	}
>  	se->vlag = vlag;
> +	se->vlag_seq = cfs_rq->idle_seq;
>  
>  	return avruntime - vlag != se->vruntime;
>  }
> @@ -914,9 +915,22 @@ void decay_entity_lag(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
>  
>  	rq = rq_of(cfs_rq);
>  
> +	/* You can't claim any lag when waking on idle CPU */
> +	if (rq->curr == rq->idle) {
> +		se->vlag = 0;
> +		return;
> +	}
> +
> +	/* Accessing remote rq task clock is a cost */
>   	if (flags & ENQUEUE_MIGRATED)
>  		return;
>  
> +	/* CPU has been idle in between so the lag has been removed */
> +	if (se->vlag_seq != cfs_rq->idle_seq) {
> +		se->vlag = 0;
> +		return;
> +	}
> +
>  	/* Compute sleep time */
>  	delta_exec = rq_clock_task(rq) - se->exec_start;
>  	if (unlikely(delta_exec <= 0))
> @@ -8190,6 +8204,9 @@ static bool __dequeue_task(struct rq *rq, struct task_struct *p, int flags)
>  
>  	dequeue_hierarchy(p, flags);
>  
> +	if (!cfs_rq->h_nr_queued)
> +		cfs_rq->idle_seq++;

Shouldn't this skip DEQUEUE_SAVE?

> +
>  	if (sched_feat(PLACE_REL_DEADLINE) && !task_sleep) {
>  		se->deadline -= se->vruntime;
>  		se->rel_deadline = 1;
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index b98084e1f5b0..69a2a749e188 100644
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

Yeah, well AFAICT other things seems OK.

Also, while trying to get this patch series on my tip
branch I had a hard time. I was at the caves
of git and b4 figthing with... Everything.
Like there were no v2 tags on some of the patches
so b4 didn't tracked them. I had to do some
things by hand and finally it worked. (Not too greatly tho.)

But who cares? :>.


Thanks,
Kayra
