Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12EC4E73D5
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 14:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791557258; cv=pass; b=RDzc4SvZpvhzdMohky9u6Sqnj5uVcg5q8+WJTjVlhW+If15xs4aIXa16BCF08wcjgi70ie/aba1TbY1oTqXrORidPk4k8JdOkL2F+vVC78Nj1Ie4wYLZlqN1oiUBBSDpuwwM/1iSHY8OXSPnwBq6jPLps2sXBdPpR0O0OidgN9E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791557258; c=relaxed/simple;
	bh=Blo9bZJVD6llKnlgZ8v9dI0/4WMj577+qqF42yQZww8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gZ/tx7ux/OeJrHQ4f2N1oXwtt7vZW12GtCCixR/RKMSRyF1Hub2xNF8O2vMmuZra5NmocEdD/kpRLuifhGeEQbq7PXb8S+dXBRq0YEr4pLaSLaqk6mj7HmQfsfe+Vq50YVpcorrq5CEOAk7ihgSRxU77WJiIHI3dGbgNlQpHaMc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gUERJ0kg; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gUERJ0kg"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6ae27f06c2fso10415181a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 07:47:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791557255; cv=none;
        d=google.com; s=arc-20260327;
        b=cP5e5zsy99w/mGVopfPzgcgjDTnxNniYWBSqLbQKniPn9e2ShMZXHHj9WpHBX9d6xK
         TT2Gm2sZsfvDard9fNT0Rjw0TrZZYc6lyIuW4BzGm0l+VDnLi5vWxK8RVnjw7tMs2f6B
         UqeLrye26J7+KH0XxleZ01+VrMnEvSvmjYC3MTO7qneMtTy1YuOZEPcxFQg5Vg/xEQaW
         vykMgBrvBNoOFzqy/rIO9rEETh81euSMs808D6zb4ifrH+rHX5aMl3HLAwFJxiDROqYi
         5Igr/9CmbPFszdz9adOh5/1GX/IyxebLD/ajRiShVUbBIAF3jznPaBEcE0ZPR62myozY
         Ahvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fYrhqlvlDqZyhpHYosM1z+TE4xAbOSyFmrTsse4+jk4=;
        fh=Fpnr5VkD6xLW7STy/MnTxrIqbJHCXo5biXg1n9Uhp7A=;
        b=B8mfTMZaArxpYP74mSEsSXEA9AT5vOXC6XIEIW5n822UfBpIj/tPF4q/4pyN+3mleA
         3W5IloHN0X5cDhWp16MH43hiq/yiKl96uOgXU2jfD8nPkzOLIz1OxYFbR/zWHv4qQVzk
         +BiIrNSPTVGlbC9lNJAmXhC5s0z7yXQ8hjeTzGVBNMRFcM8z7kM2F5QnFdjh6yIlqY5f
         Zwdpx57fsUW1VAuEs66KJBihfdnKmjPHGEx37kaKWPwVcNOzYcJiXhoAS8TYzgtqXEYj
         74PwiyRAL8uEyHjlOIqS2mvhE+CZwRxKgDutifSQFYvVLM1oUQnjkv3+2sRSneE/5Wj6
         q02g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791557255; x=1792162055; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fYrhqlvlDqZyhpHYosM1z+TE4xAbOSyFmrTsse4+jk4=;
        b=gUERJ0kgym684iLhcbTDTPx/5podNuSRG4d27JEmB1T7OKDPO7oj2MmzfX9gDQBTMm
         ui8JzOM9Tg681FB8uNUtNm7k9ZKHaHlnfwML3F1Tke7JfRXFWm1nKrI1EwHWLT+FBHwy
         vPAXRZwPRpU+bn1UF5lEfdypNcHkl4BySGrxr9jjT1ni6yCGQ4dJY6+inpUX4uQxP968
         fTrR5j9K2v2sOr44LZ0xxUFKFI3y2sBpwKeTfEQIAq0BVmJHCRxZx8KYGmZyUGMx1/d3
         wmzwW4R6HO1ptknETnvxg5CEocB2LQY0ofMwb8o1deca69nGSefNK7DUDBqdycWcW5Q1
         /CTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791557255; x=1792162055;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fYrhqlvlDqZyhpHYosM1z+TE4xAbOSyFmrTsse4+jk4=;
        b=f6HrqgeVUULGoWQbyoHMsnQCIur5y7ys3o1vQG1ajwt+PfA7i16k12XmLDi+8+EJUg
         4aZT/ZWVhj1SdW3Ek9U285t+sUq6MplAsQdnlVL1uVyDGVdXiqDvENaJKOM8pgmMl9Lg
         5wqJIqYHLFCtpZTEJJ2nHUygiIGRHcfkhWW5Z5JJ+PE2R70djvkVleN7rMNtI8v5mSQL
         DOoyGOF+MFL6RFIztH5rbpB/uGaU2i/ubunuoNk97uLOSf52wRwQu7Czq8Wuh8g6Z+5C
         L/Gb/AtLocVENG1u1d6k+qRaLsbtJpI7GP8en9JZSoWuRvh/2waynl/riUrVf2gk6Y9j
         SgkQ==
X-Forwarded-Encrypted: i=1; AKwUvByfgXMuAKhD7hedG308giCBesiTaniRqoL5hsxARPIikotWlxjcWzZoQygeMXyakp92GxxZABqg+AEI+ao=@vger.kernel.org
X-Gm-Message-State: AFq9FYJt0FKzcTqSQwZsJy5OU/W0ZnzcTbc3hFxofTRpnGBgx2X+YqpZ
	2JSC5ofFYuR7rBlTLYdTRqk1JpWdB5v/qwLRTArpH4HsQGfXiWXaN4fmCqkxbOCgMamB7RwBgil
	zLG5ECh3U6moD9iEZWwj8aLcmYoArGZPvWWsEthzFXw==
X-Gm-Gg: AYBFou3A2E9CdD9cnPJSMyBSI8FIuNWxDwlKY2e9fQqHBrRTq2QIn2CUmTcJZ/T4E5v
	KHwrCfx9AEyVAsG78ZCPS/5EBCOqC+TBCuI6m3sz2pHEQ3oFcM/cxngjU0WS7soxiBPtyIp/LG/
	iBzkwwEQNA6ejE/ULazKLpJ0vjZLigny40UsPAB7KHi/m1r+zKaQAxZ/KyahekgtPa4444BW/01
	FxPL2S1YsBIfXTnfhSSvJF1/HftX61nuKdRXBVpGX+hHUz+LPEiSrd2CwwZ8Z/aCIi2jxcnM4a4
	zSr0ZmDZFzLvW0+e8y1vpBwqXZrVTqu9LYVgrRk58mYbRBaaPCppBb9IHuE3+NZhWyilobdOEj/
	Na59w8xFPf5U=
X-Received: by 2002:a05:6402:2489:b0:6ac:8dce:5a8a with SMTP id
 4fb4d7f45d1cf-6b17c25d1dbmr1911978a12.9.1791557255037; Fri, 09 Oct 2026
 07:47:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002154415.2270586-11-vincent.guittot@linaro.org>
 <20261009055318.29609-1-kayracizmeci@gmail.com> <CAKfTPtBvGYp2S4P-k_SsFAXMVSSQ6j4F4LO44uUoDo5ZaUe1Bg@mail.gmail.com>
In-Reply-To: <CAKfTPtBvGYp2S4P-k_SsFAXMVSSQ6j4F4LO44uUoDo5ZaUe1Bg@mail.gmail.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 9 Oct 2026 16:47:23 +0200
X-Gm-Features: AclHuK9iGeFj7ZuSh47IJz473HQO92ge7LwBJsa7yRJFssp2W5pUDwwA41CDc9g
Message-ID: <CAKfTPtCAbreGDhesDmFNvXEzjj+anmOH1=jqT-1B6Lfj0FfPqw@mail.gmail.com>
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

On Fri, 9 Oct 2026 at 16:04, Vincent Guittot <vincent.guittot@linaro.org> wrote:
>
> On Fri, 9 Oct 2026 at 07:53, Kayra Cizmeci <kayracizmeci@gmail.com> wrote:
> >
> > >       task_tick_cache(rq, curr);
> > >
> > > -     update_misfit_status(curr, rq);
> > > -     check_update_overutilized_status(task_rq(curr));
> > > +     if (!tick_pushable_task(curr, rq, rf)) {
> > > +             update_misfit_status(curr, rq);
> > > +             check_update_overutilized_status(task_rq(curr));
> > > +     }
> > >
> > >       task_tick_core(rq, curr);
> > >  }
> >
> > Hm.
> >
> > I think this mechanism added on here does not works.
>
> Ah yes, while factorizing the code, I removed this main diff between
> tick and put events

In fact this is on purpose.
fair_check_pushable_task() is the function that is called to decide
wether we try to push or not a task. In the case of short task, we
will not push a task that is already alone on the rq

>
> >
> > Before fair_check_pushable_task() is called, we check
> > if nr_running is bigger than 1. If it is we return false.
> > So when we enter fair_check_pushable_task(), nr_running is
> > equal or smaller than 1. We first run __check_pushable_fair_task()
> > but it doesn't really matters, since it's output
> > can only return false. Next block is skipped to since
> > next == NULL. When we're at the check_pushable_short_task(),
> > the h_nr_runnable check is always true on this path,
> > so we return false.
> >
> > It this intentional? Or am I missing something?
> >
> > Thanks,
> > Kayra
> >
