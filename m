Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794482968;
	b=u2jprrAALlqKu9GZOX0t72iDPCs+ZeUGBHbpiRzjsonyjcnOrzdswm82YhvCcn/MT3uY
	 fGQRuaJuy4aS9JLL9t5nbNXlm8T7BY+ZotavzDxuYcU5UeGJJz6kNtKcksuVJElpe0GGe
	 MQY/XRGKy+eElqzA4fEyZfGGCoLCBN2UBD6Qw6em/GCDkRv8Nq3opz1Cu8uQHO9pz22Uq
	 4Gw6m8rpCXDrDAzq+mU7vymQoWncnjVnHfoo6scQsbcyQ8YrIt1hJd9LO2s5j4D6H/fNP
	 eoTPgEF6U1oqpw/E/jYf7vuIyNB0Yq3Y7hGbhttKPqjgjUvmog10KSKnioa3NA1H0LQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794482968;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=IhR5gAqeEKQ9dwc7R6qIHFTbcxe4WVe/vtyqIhgfFqc=;
	b=sdNYRId1vRRKrnSlwioAAFfdiw6vHoH3AomrRZolJyu/8UAriWAQUnNxbLgWR0122KZK
	 XAMIav7e0G/SAEgx+XT26TVRKsiO+wOps4EYbM2bZ2/jh1glF+dc6udjsw0BcimdEUa3W
	 PvzfLSynoAxR+j4Vx4+N/Ea3IaZH6BeWa4rAAGNeOTfzxR0siZgtKs9r2H85OnBdVwGEO
	 R4b06xCQG9BQKqKzQKaTfmBbr+O8wRg7mDNb5HBiTjJFH4RnEHq25nyXje/ODqs+x9q2m
	 rR8VGO+LgEXU7FUX3WzHErxr+Oc1K2iXUZjKZonlFRYp9Ivjg4E+mt8idFHV6D1UX7g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=WBJlqcez;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66590606A88C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:29:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66590606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=WBJlqcez
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b596afb4c5so4757209a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:29:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794482967; cv=none;
        d=google.com; s=arc-20260327;
        b=N/IB7FNmKb+CLw+yMd2cYZNqc9zmLkW5EQPp3fy+C99eUc/zSmO/KxjTcvYgNrh6rt
         8ZCSROdrNxHg/piMfl57CodG6EchmVyNcigzBebvKMOmuuxbJqlCzR+Q4b3COP5gcLKY
         kxg7t0q5MLYTVsL1W5IzgE1kwl49PgFHiXqMhiNJRMJitpEf5kzwYkDLTKOwBfKSZf6m
         6+XDV57Qg/yYjZoP0ufikr1Y0eRM9rXUnfpXKzlFzdJiih/3VSuGScqkMw0F5mRbWLqd
         JI4Fo/BmwIRoQ+6XBSlijiOU5lxTvD5iXi8SbulsdA29JWEQiKw/8KD2NSl3ssF8nwOi
         UEjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IhR5gAqeEKQ9dwc7R6qIHFTbcxe4WVe/vtyqIhgfFqc=;
        fh=cgr2LVqWJdZqtTP+zddUpUZIO7UU3oeyH4vkJKkD6wg=;
        b=cqM4j0ZLatXynff3pGBuOdp5nQtbu8vCOv0kCBDPv7um437ttmRRe/+/axxseFi7h1
         1aBRrjXg1Vta5u16nTkvyTWAIG7XZ7AOByFSnS6Jm8r0vuTJvRyYl+jF4DG8MwuJa7mX
         Rm+j/UItoWOZHs6VlWX1X+k6Xoihcy7eG7u1t5+kUeB9PttGQItlIAWwKXO2N1X4eCah
         IXeffmn0woDHkfjw70bXvD1hU+niXKiB9Xec3aYq9ElIkN3PITaiBVJ7tRhl+xlar6Ce
         BiJz2BruquRQEHbBaF7p0jYTGQw5cl6UE6Vp3YBiUgUcPQKIQ1UQxCVPhkkvxzCrndbt
         y6vw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794482967; x=1795087767; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IhR5gAqeEKQ9dwc7R6qIHFTbcxe4WVe/vtyqIhgfFqc=;
        b=WBJlqcezkcWmxn7fvS11nhNKAXjApPC2+byoUyVx3RlagWMOV1Cyxhu+NSHqqTZg+S
         GQbGpn5HC/WaAlQALYu+kiqDcgHIbPuFSyjGlg+UnxEHyqXTDWgKwoA0Ht2r9XA34vKd
         2/ZSKRb3gxzGN98tdR5/kJQMY1didACcvYbKgE0P/0QJmFCu+A4rN16UyP9fbNxJOvHt
         9uaVBUGCwpmEJDxTCbHYSPQKMC4eyNTdB6JQUA21wGUfOEvrFLVTlgVVHESdutLx1rnS
         lc3Jo+QKt+I0H3XrhbfKF8OqFxPWOg1fqJCjH6DRF3bn0JqAWFrdaagmL7GYN5YKWFKU
         4cRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794482967; x=1795087767;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IhR5gAqeEKQ9dwc7R6qIHFTbcxe4WVe/vtyqIhgfFqc=;
        b=lJnzKKWmQXwXRZ2Ub+J+b0NPNsGo8CiB6IMAwbzubkiVvZ6BvzIvr5XQqqcMloP4Ow
         2AYn0UvqfmBuMtEAnhnSd+Kpudjvqr6rQTtiiD9xTutVVn6FzhHO6jh3POQidXh5bmAL
         9WaG9QAKBmEDSyqScUDwXYQ6XG/jcWoX1mLn+swDhuy0QTTXkDqmgfca4H0I4DZVaMms
         KlHIzPtUyPqBu0tbJbIBnGv237VQo6Bwz4Y22NJ1Qyp4ow9WctyKfXM3bVG14E7lyjyP
         iiHEAFvBLGK/Rm//BkLQqc4swrNo2FGhvBvHgTdiKZrER7mAb+TfACw/sC+CSZjaCraZ
         6P3w==
X-Forwarded-Encrypted: i=1; AL+hErEP1XmBZj0uj+1LrMH6vUuLmAWvU7Y4CgHXaCJO3dayPcFyuedNXcT6j1+tUpSh6VC+5Jy92+1k7f6mKMA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FSeJYUPUddi71AP3bpf1hKYFyV58KjYsvIes5xgEcw3HmehAj
	e53pwZRjWIX5dn58LtMhCmcTlglpnBZL951JpY3kIqYsaWZCTTlMNZ/Akwzzx3nWXM4NpQZzfyJ
	BuqUL3PkaH6jzP20qy39F9LrBqbhDq7rK42/KEWky2gIMh/1AzPHx
X-Gm-Gg: AYBFou1ddHK2FuELrfSjX9K3H5V2I5MTWfkbyc/mClJJ35W2TO0xweHZq5YSzQxFe0n
	93ZASp1vtmT4ZJYAnL6XMgiLZKk0uNSSpmVOalxkryrrn6b3fM8u6f1z1O1UJ+Yc8EcrbWMgdJI
	kY05VTw83v/QOCt7tNjjecjhzWlTYIYE1qToB11XFQ0SBt/vKQp+8GO/uVENGjWHxpRUnXUgQG+
	ktqZoem308U4uvcmR/rGXdppK1YL7/tr771CS6TMjzT3j9YGLoiAcVGqZNEU00ZmzqeGY8oFpV4
	BJyHZcFC8PNlfM1VaER5eupe4L0DVRwL1j4LUv2p0W6zmGyq7C0YuOKS57oOhBlakklXknu8rPb
	rruwZOTof+1Eh6udv+3Wcdw/vcNHg/qUakwV38ITR/WS719urk+etFil0e3AspXl/cGAihA==
X-Received: by 2002:a05:6402:1d51:b0:6b4:16be:4fa with SMTP id
 4fb4d7f45d1cf-6b7773edeeamr4079109a12.15.1794482966709; Thu, 12 Nov 2026
 03:29:26 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106151947.3991524-1-vincent.guittot@linaro.org>
 <20261106151947.3991524-9-vincent.guittot@linaro.org> <20261109155418.GL1779021@noisy.programming.kicks-ass.net>
 <CAKfTPtA-nrgGQGcBPqNoPk4atOHakyZK9Fk-4AsrHBrnvPXTLQ@mail.gmail.com>
 <20261111090155.GF2668564@noisy.programming.kicks-ass.net>
 <CAKfTPtBfQd5nD9jNdayGbEW_P2bDMvOm=GZ3Q-gu+O6KkQmKbA@mail.gmail.com> <20261112094910.GK2668804@noisy.programming.kicks-ass.net>
In-Reply-To: <20261112094910.GK2668804@noisy.programming.kicks-ass.net>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 12 Nov 2026 12:29:14 +0100
X-Gm-Features: AclHuK8GqM8XGi-ga2efC_FAPlazK7Ox3_1G0kC0seKYatyPLvqoUsk26qpWqiE
Message-ID: <CAKfTPtBNx9Dpe4zBAzJU1iabp6riGAN8v-GP9bc5fh8NZq57hQ@mail.gmail.com>
Subject: Re: [PATCH 08/20 v3] sched/fair: Add push task mechanism for fair
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@redhat.com, juri.lelli@redhat.com, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	kprateek.nayak@amd.com, linux-kernel@vger.kernel.org, lukasz.luba@arm.com, 
	rafael@kernel.org, linux-pm@vger.kernel.org, tj@kernel.org, 
	void@manifault.com, arighi@nvidia.com, changwoo@igalia.com, 
	sched-ext@lists.linux.dev, qyousef@layalina.io, christian.loehle@arm.com, 
	pierre.gondois@arm.com, sshegde@linux.ibm.com, kayracizmeci@gmail.com, 
	tim.c.chen@linux.intel.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 12 Nov 2026 at 10:49, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Thu, Nov 12, 2026 at 08:01:17AM +0100, Vincent Guittot wrote:
>
> > I don't want to take any random task from the rq but only one that is
> > meaningful. Why do you think having a dedicated pushable list like rt
> > and deadline isn't worthwhile?
>
> Well, effectively cfs_tasks *is* the pushable list. The below patch
> makes no effective difference, and can be argued to be an optimization.
> Currently every consumer of cfs_tasks goes through can_migrate_task()
> and every task that has nr_cpus_allowed == 1, will fail that function.
>
> The thing seems to be that you want additional constraints on your list;
> like dropping tasks after one push attempt. The other classes don't do
> that, they do the same thing cfs_tasks does and keep all runnable tasks
> that can migrate on the list.
>
> I'm not against adding another list per-se, I'm just struggling to
> understand your extra semantics, because its not _just_ another pushable
> list, it has some extra flavour.

The main case is to periodically look for another CPU when a task is
put back in the runnable list. I also have other cases like patch 20
where several short tasks end up selecting the same CPU or when the
short task finally can run 1st and should look for another CPU.
Because anything can happen between wakeup preempt and pick_task_fair
I don't know if the 1st item is the one that might to be pushed or how
much requested it

>
> ---
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 0552eaf64e95..8c81d236b24d 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -4693,7 +4693,8 @@ account_entity_enqueue(struct cfs_rq *cfs_rq, struct sched_entity *se)
>
>                 account_numa_enqueue(rq, p);
>                 account_llc_enqueue(rq, p);
> -               list_add(&se->group_node, &rq->cfs_tasks);
> +               if (p->nr_cpus_allowed > 1)
> +                       list_add(&se->group_node, &rq->cfs_tasks);
>         }
>         cfs_rq->nr_queued++;
>  }
> @@ -4709,7 +4710,8 @@ account_entity_dequeue(struct cfs_rq *cfs_rq, struct sched_entity *se)
>
>                 account_numa_dequeue(rq, p);
>                 account_llc_dequeue(rq, p);
> -               list_del_init(&se->group_node);
> +               if (p->nr_cpus_allowed > 1)
> +                       list_del_init(&se->group_node);
>         }
>         cfs_rq->nr_queued--;
>  }
> @@ -15620,7 +15622,7 @@ static void set_next_task_fair(struct rq *rq, struct task_struct *p, enum snt_e
>                         set_protect_slice(cfs_rq, se);
>         }
>
> -       if (task_on_rq_queued(p)) {
> +       if (task_on_rq_queued(p) && p->nr_cpus_allowed > 1) {
>                 /*
>                  * Move the next running task to the front of the list, so our
>                  * cfs_tasks list becomes MRU one.
>
