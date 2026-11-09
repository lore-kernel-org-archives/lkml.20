Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794238655;
	b=Zu+1SAMY9SDxPAgBbx8MZcS9cX0uhMrftnGT1ZS3hk0iPFsloNypUcMSu5ahkTRaA1jJ
	 x/Ld7RAMwmmW60ISDAZshpzLx6W6NMwvwmU9t294luYZWx6eYMGKxSv8SQlLmhtg6gi3a
	 tSr8odVi5rsFe3RpfAWPrdF5h4SBS4yHDOseNzueXe8UT3Ki1aYj26vgI4jb10d11gJs4
	 C28JHJXmhXIx5XueSzMun+N7LAUbdhZkx7xB0AzE9Q8k1GhZ3bVL/JPlfaR05OM6ScyoK
	 gujBRqWvcdD9197KCnHnYLqsTXFXOjGAQhPzO4MCBWEV35otplxY7xA+PQlSRQxkrEQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794238655;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=67EAGkQ4nFUyxDwDN3EnN/s3MSpyl1/wArd3b/Zl6F8=;
	b=rxggZ8E0Ktg3zyItiAJgcFjrsOvJRTIqmIRpbF7ZKsZnzY/4M+tnc+mYzZBhwnxzrNmC
	 DkbOMNaqEqMmb7edqgfdpwGIhrDPpRjB0hBVt2w26v0LiVUljzJXMVx/6G6nYaOQZlRPi
	 z1Ptn9EzpwMQa+caNR6fpXfxA9dOiBeZnmcs2nN4WW83LUqDPUN1qPqrrEOcVU9QyS1PG
	 zLYgS/IyV1UV394cyVN8B3aS6HZrhKF+QCei7JSR+ajMZvdro0+IuCLZJLVpe+XbAI1EL
	 91FGMjap6FAeVjCGxErB+k+VENKVSSETwwiCYswcDKFsfXhsctopHPAIa/nVn7R6q1w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=GinMFf5q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9BD606A326
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 15:37:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E9BD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=GinMFf5q
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b571979178so1464823a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 07:37:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794238654; cv=none;
        d=google.com; s=arc-20260327;
        b=cUx8HoSVWDWvlelTo9+NhqOkOQ13D8wQEJt/PIWPi/8M6PtLni0Ba2hu1p1imhxhxU
         Bgwx8mnjJu1HBLHDorS5HIsyc/Bn45EJxnZXcOg1cOH/hw2qh61gKo1wlUpUs06AkGFR
         KABkBVzIujnu5MKAN7XGwILq2cDBu//tnjff3PtkgUj9rZs/Zjz8NXsH1297XbfZI01q
         Lmm2bWTXr4jXNLClMFkrnGt1B53yLhNPigSk0uJpIddtUbHzn1mLNfpfGLnqScoApYkR
         Am6dU1QQfMkL8IK3w0L+S9vV0TI03gjce+Dtzcz8iHsPyg404xyMkPZ0TbPXsHhAz6xw
         p/AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=67EAGkQ4nFUyxDwDN3EnN/s3MSpyl1/wArd3b/Zl6F8=;
        fh=13CGER5eNKmt36/ry43ZHcV203gWsrppmKIyTPdmdsg=;
        b=hIOgooB6GO9OGSlcNOy8o/5210vImHKk8Lm0IC1B8H3UInY/yoO9JavW1HbHdwUrLE
         rlXFS6AIBGuJ4SNWqL+HAGsl24xkFwWi2Oxvl5h3GfsTyIu3TxsFj50KiFUEkBVVCFdG
         VCO+Io9gJz3KVhh8DpUG7M/X1gGIa9dYz5R2kK330fdSoh4bBtXyBqSV3yz4lUmMhxvN
         9hcBnCH6yyzkM7t1LIQJm+UY50QknpenU/xx0LUc978FJ9mXpoCWwb5jZ/DHXeK8p/pO
         rxccbY7ZzpB0Y9xKIMC7Jg9BIIqJjz+jBy7IO6qFKT9bj4KqvFZwuD38yk68gAZXsYnk
         c3Kw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794238654; x=1794843454; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=67EAGkQ4nFUyxDwDN3EnN/s3MSpyl1/wArd3b/Zl6F8=;
        b=GinMFf5q4pAFBb/uChQ3hd7/mTHu1bPgEL7RRWQ49jw3v6aXhEJyRyx6Lbu5Y41rip
         hbz4gnwFKnx9TYthFpuFLymcEIWHXZCVrRVs03U4C83sgStItikXtxkvRQDH/NWHjeq4
         HLRuedXwVk+Uou3xAFsB/iso7t+Xkxm75NcIXBeovrCuAZAPyEcYH2nWY3TjYo8ImkHW
         aL3FhVouQsavlcDz+94oVgr04LSspkSjR+vXA7GGDkdP6gCdIYuY6CnbMpGMSaP/4q+E
         rc62h6dek09tahcUx0yHWOxmWkU03b3j4Nia/cZR6yx5D6PQ5WO++ftJ/SlAWodMKkm9
         1aOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794238654; x=1794843454;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=67EAGkQ4nFUyxDwDN3EnN/s3MSpyl1/wArd3b/Zl6F8=;
        b=ZZUv20k8l6ER/2ecza1hdOrGnCYLWthATTMCluZqIDZPsv9M8AaMQD8S7/cGqdRrJv
         s8UpxVTU9UnJwbxBJggIZa/VCWF3Q6ZQUWOmMTyn2HttfPKh0VYjajBxx4ev1/hEblrt
         4yiiehbLPac/H0lIkvoRtOgIfjDz5PenzL0nEmvu7EHK00BwA8ITql5zEfQ90+f9iCI6
         pGQ5hQm3OXIDaIKmxNdoSFGxFqJ6vavUnHkkslzPoBWxLR8L3EtzRcYgDYJTEIVC0jEb
         ulnQNeT7+3M0ZGsW6JtOtSSkSG0IQz36ZVD9vJFKvpBoLx/pxCSvK2AgGg5m36faJha2
         kwGA==
X-Forwarded-Encrypted: i=1; AL+hErHoligb0dU0I2LWjuumwlkDlPtMTTlSLVtk9q6J3aVR9IdtEW7+NS3BfM8n+93nIm8itpJWb4lvb5rRewQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8iXE6LeUHZYFFovPHWNoa8aB8AWNUbaCEvryJfH4wZmLPZ5Lyj
	ywHH48hQf1nletjNxmklSqCXKWZ/+3a5OfTpDl64Qks3xN+8Yeaxjpl5YJ7K5t+eM/vD438mR/c
	jIyG8rzUfQBLhBOYq+TskyjN6EjaF0PFaCP9m4jY+Sw==
X-Gm-Gg: AYBFou3NOHa883CIqOCUl3X0+5MOO1BIiSfoLOJBrn4/QPkOvBFvPMdamAWWv2TbqpC
	6e1z/i/7EHrfcjD4S8ThQMhGiY2c6oH5Cj4kfqHdjMkdcgoGr1JbX3wSs+azdku5CO/qkeKls4U
	TKSVgLrL00onSeFEDNzrhVDvA0b7q+rUZfdGeS/Tc2ki1b9mxc3xn9sPdkiXp08DuR5cmTEipB2
	LhBhtXVYFx1I8UekluIBuxOm2BVboh+vYdoRgs4dqEEUcoEO0YKkxZP+mpwfMH77XSPyktQ8uUv
	8s/kx13xpoPZttt9DCmlYChxrUbd52MXY+Nw2M2zO1jCA0I59qTzND2jowIImtVSaWV2rLdFbRR
	peIeMbD+x+HQ/HWRAn1tQdBpvynFkkJtWAqv2p6ibYIpjmP2Ed69FDtz/sACZxA32MTnL0Q==
X-Received: by 2002:a05:6402:5289:b0:6b4:602d:f1f7 with SMTP id
 4fb4d7f45d1cf-6b7224201a5mr2863676a12.20.1794238653840; Mon, 09 Nov 2026
 07:37:33 -0800 (PST)
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
 <20261106151947.3991524-7-vincent.guittot@linaro.org> <au7SabL5pfbsApyB@scheduler.schedules>
 <20261109135553.GC2668564@noisy.programming.kicks-ass.net> <avHR3lIV2TB9SWSZ@scheduler.schedules>
In-Reply-To: <avHR3lIV2TB9SWSZ@scheduler.schedules>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Mon, 9 Nov 2026 16:37:21 +0100
X-Gm-Features: AclHuK811qKUEGatxNoqg1c1GOx20pgleT3TGIXPs1QZ03pxVoNJcJkfBXVbIS8
Message-ID: <CAKfTPtCQP5uhmFOyJimoOA4zsVT5k3TUCDS28JOLrCcxoO1Oyg@mail.gmail.com>
Subject: Re: [PATCH 06/20 v3] sched/eevdf: Add min slice check when selecting CPU
To: Kayra Cizmeci <kayracizmeci@gmail.com>, Peter Zijlstra <peterz@infradead.org>
Cc: mingo@redhat.com, juri.lelli@redhat.com, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	kprateek.nayak@amd.com, linux-kernel@vger.kernel.org, lukasz.luba@arm.com, 
	rafael@kernel.org, linux-pm@vger.kernel.org, tj@kernel.org, 
	void@manifault.com, arighi@nvidia.com, changwoo@igalia.com, 
	sched-ext@lists.linux.dev, qyousef@layalina.io, christian.loehle@arm.com, 
	pierre.gondois@arm.com, sshegde@linux.ibm.com, tim.c.chen@linux.intel.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Nov 2026 at 15:15, Kayra Cizmeci <kayracizmeci@gmail.com> wrote:
>
> On Mon, Nov 09, 2026 at 02:55:53PM +0100, Peter Zijlstra wrote:
> > On Sat, Nov 07, 2026 at 11:57:12AM +0300, Kayra Cizmeci wrote:
> >
> > > (My editor got crazy, so I had to copy this diff :<)
> > >
> > > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > > index 262626455497..8b0dd858f332 100644
> > > --- a/kernel/sched/fair.c
> > > +++ b/kernel/sched/fair.c
> > > @@ -8876,10 +8876,8 @@ static inline int sched_balance_find_dst_cpu(struct sched_domain *sd, struct tas
> > >
> > >  static inline bool choose_sched_slice_rq(struct rq *rq, struct task_struct *p)
> > >  {
> > > -   if (p->se.slice < get_rq_min_slice(rq))
> > > -           return true;
> > > -
> > > -   return false;
> > > +   return p->se.slice < get_rq_min_slice(rq) &&
> > > +           READ_ONCE(rq->curr)->sched_class == &fair_sched_class;
> > >  }
> >
> > that wants to be rcu_dereference_all() or somesuch, rather than
> > READ_ONCE().
>
> Ah, my bad :-).
>
> >
> > The think I noticed is that it will only select one slice_cpu; it will
> > not consider another once its has found one.
> >
> > This means it picks the oldest option, rather than the most recent one.

Yes, I followed the same logic as when finding an idle CPU to limit overhead.

>
> So you mean by the time CPU loop ends, the CPU that we selected
> might not be a good option anymore.
>
> > And given this is all racy as heck, the most recent one might in fact be
> > the better choice. It will have had less time to go stale.

patch 20 takes care of such situation whereas several task select the same CPU

> >
>
> Makes sense to me. So then we gonna overwrite slice_cpu everytime we
> find a new one?
>
>
> Cheers,
>
> Kayra
