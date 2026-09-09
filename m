Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974B9559CB5
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 13:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788960055; cv=pass; b=iy++yWZdTuGYle8ONYnrNHhbJZ73+Zl4rcxMG1djtAD/OLKQjh94NhQsHUGeZ0fPl/kfVUwmF/FlGEERK8vJI/VVYVDno8+q9RXxwMjnF5yjIvi/u2LQ6VQorEKEyiQfNqcQKWeearJRbBPlLo6h1hlddHU2LruI922j3xz8b48=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788960055; c=relaxed/simple;
	bh=IuaXecnQ3cMOT9cTWpL/TTz+0M8D5F0ArBb6vcVdNEw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WlXiWFU5QaJg+5LfmTUMmZ3Mu+69WArtx8Hq0X/Pae6eJDi9wB1rTwiRCNrqm/yoP5cBnb9ayLSEqFgcYTPypjdHCS6C2UOSy6PtWKG2+Bbx+jwx+UqB7VEL4aBFvofMB7UeTZK391OmRPb/5MZ5IxZXq0Of73HpmXFf4ZCpzAE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FpKdAlLy; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FpKdAlLy"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f0b1fso155110266b.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 06:20:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788960051; cv=none;
        d=google.com; s=arc-20260327;
        b=aXIDbLp0FcMGauQUXpPxlq1o1jGNSrJj4PtiZzpfHeWm7cdWnPkQs5LuXFFSthfvYi
         TPu5wQFwVbM4NtYn4sElbF+M7cpJS361Im38AUyF/YILXWBmo5KUSl1mP4YeTn9JRcfG
         uzHgektkc0cE3b0qOOBXROg6qI69LRvEECOZbDTz64fc7ZdAIgNnEWXqjjWtyHB5O0qh
         ukoROTrqo3eVOkGWR51WZwr0Dk2O0cW6boIM9vJ+Iv0MI9RwQ6Qr1JB6FGBmoTWfLk0x
         /C9NT78jjACE4K7f4OQ3hnhcOtnLq2H3WBN/TPfxdo1mZl61JaBs0DB567cyE+hyPIkO
         xoZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hyPaw6gFnW0hk/700LtE7ZkUFWjnYRIQnB5rH/QQoHI=;
        fh=L0WPDVElZTs5GJ6sM4Yw8J57CH/cE1yMthT8ZHc3gLs=;
        b=k7fjv7FaQ223XEqKoQI2IMo/yshKyI1UwjjhsScCTLjgkN8r4m1Ms9AuAXYypqIObS
         rSsNncVC0nE2rVxQQiChKy3V7zX/0hb7ALIaN/k2qJ88uq/BHnq9H97ABXgJ9OAU668l
         DPKI9u6pHaTqzZLv6H2F7hl28ulBSmDCKD/5acV78idFuboFY+aNCapTo9hbbCxHhFsY
         ew5S4DOxslJjCO9CMcuDWxTtZb2XqZFgJ1+JTQOPH1QW1fnahvIeLUSbXY7Sn3xXtr45
         ysf/n2lhhWc3J//uJs3leEv9OC2f7uEF6969K/EHoEdE59ZnEF5efM0pRUx0hPldbDyj
         kpRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788960051; x=1789564851; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hyPaw6gFnW0hk/700LtE7ZkUFWjnYRIQnB5rH/QQoHI=;
        b=FpKdAlLy5jMUisPGfpd4cPmFhvUuqrtg7w4mYHl/sA3tjyMLOeU3NyDjsUdwYL5X/X
         1Vjk33fsNq9w8IAPSqxiUGpnWY88LURbu+Ge2P0cmot9HuNo23Z4/e1G13K0hImdVQyV
         94DOgNQZfj1HKOl/jLZTmFTdDSs0PosbLQgnHPOcPaWEjzmwO3I3vTOqPRLgQ01Cx/xl
         fJE7DNvy0ulgaOCZjZW0ht89h0iT2WwXLy19xehdvl2I3nnOba1z1xr1Fu8BF6qzeIZO
         SmZwBUWrZKH4M2iF0zeLFj3Vhh1j8Ua3Z2w/Sud6gsrN2sRdDzBQjNNmVJON+hiakg2u
         mx+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788960051; x=1789564851;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hyPaw6gFnW0hk/700LtE7ZkUFWjnYRIQnB5rH/QQoHI=;
        b=BB4DmUvPbMyc4ARiFmOFz69RFbxOKV1J1phSTMmHdrSA9A/R7ILl1/nSu+VKx/6mPS
         J4MeBssAmwo4TFAvin5BCXY7Q4g94YQgdY6xfe0aqoWnKG+z8lc3MzRNtzf4OyurYoQ8
         aDHDg+0b5x0qxR2j0K8xwV0UXmeM1S9awLY5c6EPUa4Zs6owUtZ6V4nFGJAbJpbvlQ5Z
         HImD4RZPcw47wUbZlS8bN0vkw5aelxkBxijVMFso6grflLkdUxvTLt7cj/01ZvwQp+HZ
         nIl2hwA0Fj+znqn4kXsImB5ttwxxxoYAcvr3kHElz2zWQ9u5kZOPjXwI+XrWw5VBeazE
         Q3gA==
X-Forwarded-Encrypted: i=1; AKwUvBwnbzoFGcKnxzjvptBd3q5SJc2QFtZ1O8QzHZE6SL+iz2feyNCndXVbUQkApYh75Cqr4r5d0p9gvbHOR8I=@vger.kernel.org
X-Gm-Message-State: AFuF++nAwbjaBK4aKOrkduAF2EbeQ0xX/AIZWOKWm2nV7YvY1LxxdsaX
	wRbSpZQxCdkifoFekzpFLKMfCo8MaztLldngwqFdmRkTZ1NySMK06XTbYSLjLh+7pEgzNvSqoTl
	F0piyh+o2xsT8uVmbItmTjIuKiIwk2/RiLgRHlOm2nA==
X-Gm-Gg: AYBFou150k5Lr0Zel7hcKOEG3HgKX3v6OtTzegFyKmn2n81clVgD6bDToh1P1JFOM0D
	KUguLkhVsvPW4oI/S6tmFk8eaBin7mNfwqv9RXA7yFvTz+V4TQqzXTWbpbdVm/Si187hMufMmpS
	c6FMjtVYbPM4qO3InLPN1vd94a3LInrXBVXf9jCOWfFi+QE4vJGAX3X0BeFMoGG9/uJyI3LCia+
	Y4yJRVZ0FNWpHZ/qaMb11rJDBo6hZoAEvNoKlGMct9F4oVVQVUG8UNdbVaPmION/BsRdjYaZDTe
	Ie60p98qno0ylUW0kqio+Yo3KrCV0ESiu8rtXJvmgsbz7zecdkDFLvL791n+4bvN5Deo6cxe0DR
	BnG7i/Lfpbjpb
X-Received: by 2002:a17:906:9f8c:b0:c25:58e:83ff with SMTP id
 a640c23a62f3a-c292af1f9c8mr425299866b.10.1788960051213; Wed, 09 Sep 2026
 06:20:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908135526.2783039-1-vincent.guittot@linaro.org> <88404fc2-22e5-4792-9de3-ffce55e98055@amd.com>
In-Reply-To: <88404fc2-22e5-4792-9de3-ffce55e98055@amd.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Wed, 9 Sep 2026 15:20:39 +0200
X-Gm-Features: AcwNN1W2uPsy8kSaNOIJZWjgQjYSiTUGokIoeICkW0fAHuoXAjBwCr3avcoaaa8
Message-ID: <CAKfTPtBqrSwD9Ccp9jYEmcT4+y83Zd-qhw-yRDd2Eoi32J4_BQ@mail.gmail.com>
Subject: Re: [PATCH] sched/eevdf: fix rb augmented with multi fields
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 8 Sept 2026 at 22:37, K Prateek Nayak <kprateek.nayak@amd.com> wrote:
>
> Hello Vincent,
>
> On 9/8/2026 7:25 PM, Vincent Guittot wrote:
> > The eevdf rb tree maintains 3 augmented fields but only one is currently
> > copied when balancing the tree.
> >
> > Add a more generic define that can be used when there are several augmented
> > fields. In this case, we provide a function that takes care of copying all
> > fields.
> >
> > Fixes: aef6987d8954 ("sched/eevdf: Propagate min_slice up the cgroup hierarchy")
> > Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
>
> I remember stumbling on this in
> https://lore.kernel.org/lkml/20250220093257.9380-22-kprateek.nayak@amd.com/
> but working around the problem in the scheduler layer instead.
>
> Generic rb-tree layer extension makes more sense. Feel free to include:
>
> Reviewed-by: K Prateek Nayak <kprateek.nayak@amd.com>
> Tested-by: K Prateek Nayak <kprateek.nayak@amd.com>

Thanks

>
> [..snip.]
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index db5937d7e46e..019812c4fe32 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -1037,6 +1037,16 @@ static inline void __max_slice_update(struct sched_entity *se, struct rb_node *n
> >       }
> >  }
> >
> > +/*
> > + * se->min_vruntime = min(se->vruntime, {left,right}->min_vruntime)
> > + */
>
> nit. Do we need this comment? It doesn't really describe the copy
> callback.

No, it was just the result of a copy/paste

>
> > +static inline void min_vruntime_copy(struct sched_entity *new, struct sched_entity *old)
> > +{
> > +     new->min_vruntime = old->min_vruntime;
> > +     new->min_slice = old->min_slice;
> > +     new->max_slice = old->max_slice;
> > +}
> > +
> >  /*
> >   * se->min_vruntime = min(se->vruntime, {left,right}->min_vruntime)
> >   */
>
> The one over here above min_vruntime_update() makes sense and should
> suffice IMO.
>
> > @@ -1064,8 +1074,9 @@ static inline bool min_vruntime_update(struct sched_entity *se, bool exit)
> >              se->max_slice == old_max_slice;
> >  }
> >
> > -RB_DECLARE_CALLBACKS(static, min_vruntime_cb, struct sched_entity,
> > -                  run_node, min_vruntime, min_vruntime_update);
> > +
> > +RB_DECLARE_CALLBACKS_MULTI(static, min_vruntime_cb, struct sched_entity,
> > +                  run_node, min_vruntime_copy, min_vruntime_update);
> >
> >  /*
> >   * Enqueue an entity into the rb-tree:
>
> --
> Thanks and Regards,
> Prateek
>
