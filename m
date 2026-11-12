Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794466916;
	b=DCv4racaaqz9fNSMKo2tjBN2OdRSFiUCii6WhO7c8RlIWFLBHOTKMG3eaJXjYQPLycuN
	 U63vt46Hebcib8uoFUYMFEkd5Mj5vBObhc5i/FGa7EezO0T2DC/uGkKxch6PfN+v1Rgz8
	 yIXiho+5SOEWDsl2OQtN8xPdUjyhShUoRj1weXrzQgw6Wm1h8VKJ5SQBdHx587nQ5VzYA
	 9eqhf6EwXpeF7gyFjYoFPjir7fCwmhlIeMpL9pBlqNcXAiOTLh/CvoNBO4+Sawj1MfD/O
	 hrMt5AxBQB+m7P4Gafpr2GOc840f1lS9mTXTk2jYGZnEZp38ZmrfhXoNUzPzRU02nrQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794466916;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=UE2S/v9lUpY69MJ7L+FzJG1ltivTSX3+KzjoTbLuPuc=;
	b=Objpgrt/L5UWKKJAARDQbb62jfiRdZfaK5wp75tORW2jFAPWKxiTRh3QoC6ZNuzC9V2n
	 Qxs61LkjRYR14Ek4VSvrmiCQDoSijXQduBC0oEJV6cS6242ihsQ6SVUZWmyJlRC5NVtNi
	 c9+0cQStDT74MfzX/2rP4GIFMH29jMP/9oa/EMbKrwAuO6FJOr6rBLQFoPtgZXtk17YcS
	 9XaFWIvD78yLEMQXswDcH7MzYJVH19C8cdoD8/+IGe+Lkq/YUxZqeP4GSUwSXIzqEDgbD
	 wh7kIfC8TDw4oaqBVW9Bf4dxfOlS02Px/TUPDeghmRKiqdMibroDn17rMm0ENp4SN3g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UiAixHN1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C66606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:01:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46C66606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UiAixHN1
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b408f2d936so6033314a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:01:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794466915; cv=none;
        d=google.com; s=arc-20260327;
        b=hPIRoLONBtUK0uTceWyTVlRZCC659WAanWIY1eBtY0q3pKmuwTwwbi1d2kx6RrdJ08
         reNbvUlqa7RG0cnwvX9v4XVG/7GTWsxPEZa45ACtgP0o36GL2qP52zdxiBzmYZwwcnpW
         yR3hGS/ri78n2anxgn3vg/DRtCo/w0sQ+NIdBwGXk83lhf4aPlvrYV6Q/xjrGQnP/BKF
         ZObyFDH8DoeT58QiSky9d5z8gBRHAkbid3g66DjMZgeN72Vf9ZcUD6SYaaVrqcLQqIJ1
         o0BQ2ujmUS+/DwciNiHXjI8tpZU60rYHrNqOMmkyoVJYHo7brphLbdgl7TxAvMLJ9e1c
         Xirw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UE2S/v9lUpY69MJ7L+FzJG1ltivTSX3+KzjoTbLuPuc=;
        fh=XUf/EZk/XhHCzxWZ9Zok7wf+xx7ido9R8uMqFWs2xqY=;
        b=eAAieczra6UJWQjx1ITthkgiQ/xvH0zisaMvzilHpilmXHI2l9tEb5p1OrDJsXzYuR
         d/aY6J4GQjsRWSN5gsEQbdMVzJ5V9SNDeo8O2H194v19xRM4wHENz3jd4SEe9U7C9oQY
         j78MTLaCUiiYeZ9h8S72xNFE71d82g1uf+7eGBBi1LEUml8WLBEYgSwS+hqrmx5jEZTd
         JtEATm8doQLCXOywlE0XM+VQz87ritbUUVp75Zd04ddS38+MvOjUKV/WDTUnhcq043vm
         eIjJxXwjTdsXTDvqgqgkIfw7aTwwFJwpeLn04Vm80tgG7+D/o0KlzGBIwNrLkxx7YAxu
         BUxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794466915; x=1795071715; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UE2S/v9lUpY69MJ7L+FzJG1ltivTSX3+KzjoTbLuPuc=;
        b=UiAixHN1FUbfDe7klDgIiMH62rnQAf9KRkO3u1AfWrm5CI0uh82tN0eXc3T9wbA1Vk
         Z8e2YZ2ub0b4ecefSp1MlLEP9YoKN9hs3yBnqsQ79R6LmoTehDvWMcwTehXLsJ0k85ZT
         aPlsOaL6jxHi8jiee/UUZhJlaJ3V25Tw2gI4OROVD5eqcmSqr79oxLXkhIMmwqd3Qoo8
         aRpxd5FzCw1PnCPlkVLYqjlR1eqckLU6ezpDBr1aIrEQNs3/CuzwLXhXWvW3ZzGUKW4N
         /Wne4+lV9YUhnr8P2O4p4+yZRSNJ2yOF6S5fMPm1PGN79bYpHqjnD7jZCNaySrLT6Beg
         A8xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794466915; x=1795071715;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UE2S/v9lUpY69MJ7L+FzJG1ltivTSX3+KzjoTbLuPuc=;
        b=dE5SaK52yl6vLhqpJTws+7QOb2w811ubPtPuT2UmPHTmr+gdAYTZ++6gwp+uguoxn/
         4SBLJFPaO/QgsISy12nLg/NG7AHYVGml0kN2tyT8zLgIDOfsUlmtxaSUcm0nleEy2m2Z
         WTb7TJs1Th2939whb/2DQPJMSWMA8D97l7rYOAMwxW6+UkwmAC5w376dKfmum9XL24tu
         fM0F8UpqG7APLO7Llp5/jTfridLsW7DhJWAwpkj1YD9QtLvh1M5rwk/Z1oJhgpBJwRdL
         BgaGA7DpHK+EK7Rb7UeUFomu8p7HX7Y1ZYVH5qJJO50TQ83yLZ7Jkxf1L1P5ENMsTbPb
         Fg1A==
X-Forwarded-Encrypted: i=1; AL+hErFLoCa8kUfSYt6h+Srrpwc8Fms88BQ6WA/Lp6eXKQH8C0UPVIrCVZlN3LOjxDlfrbHXeWS+tNlMNpDevBw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+L5Nm83Gq9FkqFO7LzoT7D+OMPHzbbZ9W96JolkOScEbEPVuzQ
	Mvq9NoJl5GLLRZS8D/mtWWeNUT9tSH5HBEhDivzYFRjNJuUvt++3mYTJGsdHB7a8Z/Xn5gACWpo
	T5T+205eVYs0mhTBje4SxwNUSNOCPOmLiMYaVReiTNQ==
X-Gm-Gg: AYBFou2XVYNumAQm3fVEuLd4zE+J3fIMAN5s9+X/FPjSo3CIr3ZpzDBXJHKhA5/HQEE
	lrfAWoxLkmEvat0NZKiIM4/gNisDHPceZhUFxbcewAgI/cFyQj44D/0TMm7w2SqYCYJPzMln7GG
	bQHSt4ECC+oivijf6M9IL4eysapiJ7gYf447vTeXvxNZFT9JQOD9fZHARINbfTCi+r8ONlhAUmU
	H0igvlsZShzjw4EsDU6SGHndKB+ayw8SPyy69jF+w8a94bwKkMB8NzwGdn06jMWX9x6Fos21dYK
	fIZAt5REhZ4O7gFDM8x/mh2VjTEstKSSSdgFRrOgaBIZO0cfW1asMR0/ryPhkZ4H38pYQA14571
	7jxFBAaebHAn6mQZkZcfr9a2NpKa/mMcIyZ1OyYp8bR/bZ6mvhmjT2rRElv72SzzjDNR9HQ==
X-Received: by 2002:a05:6402:1f03:b0:6b5:767e:f030 with SMTP id
 4fb4d7f45d1cf-6b77733a4b5mr3291059a12.2.1794466914501; Wed, 11 Nov 2026
 23:01:54 -0800 (PST)
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
 <20261106151947.3991524-9-vincent.guittot@linaro.org> <20261109144350.GD2668564@noisy.programming.kicks-ass.net>
 <CAKfTPtDcu6HS-G75bG7xp10t-n-XceneFtqxa_cAd+B96zCJiw@mail.gmail.com> <20261111085928.GE2668564@noisy.programming.kicks-ass.net>
In-Reply-To: <20261111085928.GE2668564@noisy.programming.kicks-ass.net>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 12 Nov 2026 08:01:42 +0100
X-Gm-Features: AclHuK-gkc4M-jSyE1nXnvG2bMRR6frusiPuC8UsfPnuglBYeu9svvaRxrdoStY
Message-ID: <CAKfTPtD054JHb38LdY-Dgdo4LTOVU1f80tL9hf9i629kEc6wkA@mail.gmail.com>
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

On Wed, 11 Nov 2026 at 09:59, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Mon, Nov 09, 2026 at 05:07:31PM +0100, Vincent Guittot wrote:
> > On Mon, 9 Nov 2026 at 15:43, Peter Zijlstra <peterz@infradead.org> wrote:
> > >
> > > On Fri, Nov 06, 2026 at 04:19:35PM +0100, Vincent Guittot wrote:
> > > > +static struct task_struct *pick_next_pushable_fair_task(struct rq *rq)
> > > > +{
> > > > +     struct task_struct *p;
> > > > +
> > > > +     if (!has_pushable_tasks(rq))
> > > > +             return NULL;
> > > > +
> > > > +     p = plist_first_entry(&rq->cfs.pushable_tasks,
> > > > +                           struct task_struct, pushable_tasks);
> > > > +
> > > > +     WARN_ON_ONCE(rq->cpu != task_cpu(p));
> > > > +     WARN_ON_ONCE(task_current(rq, p));
> > > > +     WARN_ON_ONCE(p->nr_cpus_allowed <= 1);
> > > > +     WARN_ON_ONCE(!task_on_rq_queued(p));
> > > > +
> > > > +     /*
> > > > +      * Remove task from the pushable list as we try only once after that
> > > > +      * the task has been put back in enqueued list.
> > > > +      */
> > > > +     plist_del(&p->pushable_tasks, &rq->cfs.pushable_tasks);
> > > > +
> > > > +     return p;
> > > > +}
> > >
> > > This means a task will only be pushed once? After which it needs to be
> > > re-enqueued on the runqueue?
> >
> > Yes, my goal is to keep the list small to avoid ending up with many
> > tasks to push. So I only check if prev could be pushed somewhere else
> >
> > >
> > > So if it was found during migrate_disable(), its thereafter stuck? --
> > > this seems a little weird.
> >
> > If a task is migrate disabled while we are about to look for a
> > possibly better CPU, it will have to wait until after the next time it
> > becomes current. This is a simple way to pace the number of tasks to
> > push in one callback
>
> There is still a worst case where a lot of tasks get woken, they all get
> enqueued and then they all get on this list and you need to iterate them
> all.

Yes but this case still limits the number of tasks added to the list
because of the case which involves short slice preemption and
simultaneous enqueue on an idle CPU

>
> If you want to bound this thing, you might as well do like
> detach_one_task(). Only ever consider the first task from the end that
> is suitable.
>
