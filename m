Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF9D43E9D2
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791793126; cv=pass; b=d9QjEsS2Ls5mlSTZ+FbZ/xxbrrC/LvQCDH+hFUDHeDHBf94XGg9NgjPGY20HMLxM75lLGCig7Sqzrs+aPlVgf5rgOww6CKPTjipgJznAJDcUvikBfjCh50cBMM68Ts1BJpXthyThnh5TslwEoYVQXQiE63pkDh/V4atnBsQmtak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791793126; c=relaxed/simple;
	bh=+cgBnKpA956E9oC3dPcEvrFaJuDQAJAIwVEJgcDrCgU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mIe9H0VXRPDB4uG42LyKy27dhHHnEywPDAEl++18DEGUw10r2uEz94l5AoUoij9EuZnAYtx/VXFdAU4mcX620kE3V7yY67jS+YFb0rZhQ+jTk8Qt75ZM9Jl3Tdxu4x8YrI+NMPAnNU+8qtLv7LTq9eIIx1MkxjjKm8t6IB1Rv0U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eyn6+JVN; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eyn6+JVN"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6acb57c2b88so2119362a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 01:18:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791793123; cv=none;
        d=google.com; s=arc-20260327;
        b=qoL6JmIPAK+u7wuVSyAq/MyW4dn9XfA5igbkhUzgCOfVy6It+3sMSvVW57+ZR2Mq4z
         pTszP4p3CxSLbJZjlfFoNjyfK2m2hrzixJhEpZQvFkIRmho0jrZjOYrYAXDRpfSpTIMO
         UrsW+m9dZ+/Q/oLymqMqwOxrPPhjklUxRYrrqLjMATnOVJg0apcahvizVpBW+F2WPYH5
         crzgzsEL55UbUwIcBNEROjWz8ho9hAUEiBvDrKt5B2b2KlFJ6OH5x1E8wIv2X3eoZs5L
         UoXlsbZc2xNycyyzL1848vKW8CLxHDN/YhFII5P6XL7JS8CIFQJC8Fev6n/Q0NAOC0cW
         1AoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zSGc2gSvInI+9O2ij46iITf1yj50GR8jSWXc3T4EcG4=;
        fh=nLrOq1S2R4dCSfqBf7AV9hd5++l6Tlmc/PJXDo8SnEU=;
        b=h43qQfIkJ6FFNiiXdHqdk7fDPL+olTgVov7WRk9zzjCftsZM+6KFgisfCRV8Ef/jpg
         r27Ru+3k16iSEP+0yZf5m56LIZ9usX+mjKWWOgLjKCKcxsrQ641ebFtlHD2qWwSez6ao
         9116bg8OU/Kn4MK+QbifMPTglfBVcuGTjefmMXEKznUXdp6Vhv+nDqgMh0vMycChZ5vR
         lPAlCgUEQEKR2AQTKi9JfnghAxShAKcE750sYi8JZBMDWRcQvVDChScYLwaWm0CUb7vK
         hdSJullxFQTlL3oqp/h1Awl8ROzcM9YDuyzZ9cGIZbUMMYfMkc/G85AJSrATvGVQjrGx
         zxSQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791793123; x=1792397923; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zSGc2gSvInI+9O2ij46iITf1yj50GR8jSWXc3T4EcG4=;
        b=eyn6+JVNq6toaTEpom54udG10HGMfVRoqi5ipDvof/sRly/8NHLD3n6Kt/9oTjRJ4t
         BYUK18Iod//l3EDN9mTJIl3KuguTqXrR4pBtp17FUdEIXG9tDIAiJCSz8swISpMOYJDN
         UZ3Fb6SIxgzm3R2M7YY0E22ITiNzpj3PGSgwrid9NDPKi4XKyJXu6WkAXME4uS5hW1MC
         K4D/+unTFruqKsXLUY/LfSnXLFaZA5InYInlIhlSMJPDvuswDwjZJ5OvMXmTB9996lxm
         b3WNaCsufIP2GxHGzV/58VUTi6/mCzKZRK/7Y+Jr/cKy8E5TEDBvTO9OGTRmkW0/nrG/
         OpQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791793123; x=1792397923;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zSGc2gSvInI+9O2ij46iITf1yj50GR8jSWXc3T4EcG4=;
        b=CPjLkY1rh9Pe1hGb/M3uw6ZYXuJ7gfJgiai7aCccPvbF52ybM74a3sZ1qHJzia99i2
         gBSHOldGQ/QL/EkDjkXdC/Xydy/Kst2OHekZVeiUu4b7xI6yTFnFzARmH5aehpqyhgl2
         gzd9YPw1ZMdzUqzBY4I1yVbARzXEDOhL0b8dbDxus6l5UraFKr9iINi2DiQH5DTJeDvK
         tf7n4dYvN6BCPTGJBfQX/1QUHbzZV57PmvW5tsOt1jMmhv6L8vEDmbgDotQ2H7xXHd9W
         KvL2q0nliCV0Y+rdGpsWPWyD26CwVqDvFiLbTPxfypvBzPPCzaFOZylDpjDpV1JReuM2
         nmjA==
X-Forwarded-Encrypted: i=1; AKwUvByNkrhbQ2JkJuFAPVDX7WFm6pnc6j9BOOVPbm8cBFhujE0ceURhmg9MySsPjmuQWy1HqawmXq21+tHz0jc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJqpZnEmvLPB1ROYy9WKijK5Yq+CMpZ3f7p623HL6oiZNrUKpV7
	4XtEY+5Nupt2pF8zNS+YSooJ0NFCuK7o3wleAwtipaoK9a4db28bn5kDT5uhO7eUct0J+5K7C5p
	mBH17tmBYi5SqoCXRM0sLvQ0PXmK5xmJRgQDoQr63vw==
X-Gm-Gg: AYBFou0EfFyIFa1EOMWpE51Jx+P+OviQui6zKgSarezEG6bLkUTK5+hq2Dm7SaPCGTc
	1zH8T+UaCPrxKgE2SVswLG1LW95RgMvcwX5cUuWosdY4MQwXbjX62h34qPJQJztfydsIE6IgMYy
	9du7QbO27Y4e4hQXu0VzdQXMuGN0eUSPfDq7Ay6t18CWUnrXMa5PMGzHAZk5AeTk8NEeAo4yb7w
	ivbao7oOIQ4B5NPTY7+p9BuIIMOVc2MYVeyXDKO5tOAbx0CzXEartZPBEwanfOw1pJQQtCx/37p
	nXFGjGaNFZSv2XgoycqiyVtkOkLJXkJCel2CC4qnAxE8nhQFMBn4katNrhL3IhopPHcM/B161xh
	fClAQmMi2yckC
X-Received: by 2002:a17:907:d1a:b0:c2a:704c:8c8e with SMTP id
 a640c23a62f3a-c31a9fced4fmr940287766b.11.1791793122980; Mon, 12 Oct 2026
 01:18:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKfTPtCAbreGDhesDmFNvXEzjj+anmOH1=jqT-1B6Lfj0FfPqw@mail.gmail.com>
 <20261011174038.5334-1-kayracizmeci@gmail.com>
In-Reply-To: <20261011174038.5334-1-kayracizmeci@gmail.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Mon, 12 Oct 2026 10:18:30 +0200
X-Gm-Features: AclHuK-DP5qVnsuYOeIrtkpyOkecXNVv-1nV6z-W92W9g6i97Pk7RW1tEN3H67A
Message-ID: <CAKfTPtBDcfk+TEEjD07RBLpCAusKqa0K4AWuFrcCtdw9uGsXCQ@mail.gmail.com>
Subject: Re: [PATCH 10/18 v2] sched/fair: Add force push task mechanism for fair
To: Kayra Cizmeci <kayracizmeci@gmail.com>
Cc: arighi@nvidia.com, bsegall@google.com, changwoo@igalia.com, 
	christian.loehle@arm.com, dietmar.eggemann@arm.com, juri.lelli@redhat.com, 
	kprateek.nayak@amd.com, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, lukasz.luba@arm.com, mgorman@suse.de, 
	mingo@redhat.com, peterz@infradead.org, pierre.gondois@arm.com, 
	qyousef@layalina.io, rafael@kernel.org, rostedt@goodmis.org, 
	sched-ext@lists.linux.dev, sshegde@linux.ibm.com, tj@kernel.org, 
	void@manifault.com, vschneid@redhat.com
Content-Type: text/plain; charset="UTF-8"

On Sun, 11 Oct 2026 at 19:40, Kayra Cizmeci <kayracizmeci@gmail.com> wrote:
>
> > >
> > > On Fri, 9 Oct 2026 at 07:53, Kayra Cizmeci <kayracizmeci@gmail.com> wrote:
> > > >
> > > > >       task_tick_cache(rq, curr);
> > > > >
> > > > > -     update_misfit_status(curr, rq);
> > > > > -     check_update_overutilized_status(task_rq(curr));
> > > > > +     if (!tick_pushable_task(curr, rq, rf)) {
> > > > > +             update_misfit_status(curr, rq);
> > > > > +             check_update_overutilized_status(task_rq(curr));
> > > > > +     }
> > > > >
> > > > >       task_tick_core(rq, curr);
> > > > >  }
> > > >
> > > > Hm.
> > > >
> > > > I think this mechanism added on here does not works.
> > >
> > > Ah yes, while factorizing the code, I removed this main diff between
> > > tick and put events
>
> > In fact this is on purpose.
> > fair_check_pushable_task() is the function that is called to decide
> > wether we try to push or not a task. In the case of short task, we
> > will not push a task that is already alone on the rq
>
> I'm confused. So, is the added tick push mechanism not working at all
> on purpose? For future use or something IDK.

The push mecanism part is generic and includes a push on put prev and
a push on tick when the task is alone and never put back in the
runnable list. For short slice tasks, we don't use the push on tick as
there is no reason to push a short slice task that is alone on the
cpu. The push on tick will be useful for other cases like misfit task,
EAS and cache aware. The latters are not part of this patch

>
> Before the fair_check_pushable_task call on tick_pushable_task():
>
> if (rq->nr_running > 1)
>         return false;
>
> So now at the rest of the function, nr_running have to be equal or smaller than 1.
>
> We call fair_check_pushable_task() with next = NULL.
>
> There are only 2 paths that can return true, one of them requires next to be true,
> so it never works. The other one:
>
> if (check_pushable_short_task(rq, p))
>         return true;
>
> And check_pushable_short_task() does this:
>
> if (cfs_rq->h_nr_runnable <= 1)
>         return false;
>
> As I know, h_nr_runnable should be smaller than (or equal maybe) to nr_running.
>
> nr_running can be 1 max, so if h_nr_runnable can't pass nr_running it will
> always be smaller or equal to 1.
>
> Maybe I'm missing something from the start :-)
>
> Thanks,
>
> Kayra
>
