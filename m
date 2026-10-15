Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5F34AA41D
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792051361; cv=pass; b=rwCyliNHNZv2/GMykwrw4fcuovsee9Ozr/bpbfD9BP/NTE0MfK+f9SgKlQ0SLrXvQadCsTDzovPhCiFcxrhfDdxYjrZ17Rh1wRzVpdmgD0D+dC2ntQP92MBA5aV4QdN6WQuhJbuQTDWdh4wPHrD0ADaTbCppSDp79pd+dlkhK/8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792051361; c=relaxed/simple;
	bh=eRRqK9tqBDZb1946J9prALf3IBZg0i+rP/Tm+Nfy9u8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FvE72+JfLZK/gVteS40IIIxu03KzvVX9fmS9key4ZUjO5To2kKwuOqnwAxRBTQXD2Le3gLYFd5rz6MZ9klym4rF1FDGpjdwBXsEK96kYmgsRPC5eJSkaUQ9UXas2wXusU69ZtaDimzDXMq/mIi/wwO51N1BmdahM8fn5abOmFII=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QV1I9r6R; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QV1I9r6R"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c38ac26cc5dso328725866b.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:02:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792051358; cv=none;
        d=google.com; s=arc-20260327;
        b=UBJ4J2iwNC5P6KIJaWF1M09OIbaqHRufyzWj2W6JZr/XKFASUQKYQa53K5PvZDWLah
         9LDDNLKXQFjoDXcjdWnl8vYBk8j6FkfnUTaYtO/FxXofZPToWNofPfNj9zHyCdMlW1Ep
         6Hy3vQSgMzYhxA2GoaIip3TIieFG6Nwg2uvi4g+u9euRf9G6WcOGQFBsXOSHGL5yXELE
         eM3POocW2nbheb8LOaD4YZEBw72ESPFlJ1aLs5+0XYfVFYJCQBn+t/+q4vAxFE5dQ5Js
         57UkAJEVfYEQhpY6N/nQhjrr0fP8H9bV+UR4M0KnjM7jDNZE2BJDZ3fzDEbOUJSn+w46
         p/gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=20IfJrL4vQgVppdX0l7DtOYLpzRZDDrYGwERMl5G+kA=;
        fh=rgmAZ/LU0ue7NelMve+WjmtcWfrwtkPCmPqHOtBw/0Q=;
        b=r50aP8m7YS7dieSq4iedu/Rvfi9yd6H0jBZ+kT91kupbkw5EbmKbsKues6s7LDhM9w
         U72i0aEOY1PnMak6jMqUutlIi8o6G5jPZ/DdqJIsSeQbhiFjtzIPdatYAp7xTnh5U5Fr
         GYhtJvXmiU0UqOfbwrisOPRMosA4mZZaBVi/C/uTupIpaGx23SQnQDEguAO0omy5NG4n
         3ascJA6Q1gSKQ7JQtbTj+9Ht+uI1taGI/fWaqIthdErQslDiEhvVPpH7wZCXcSgdG0Rq
         SUMGp1634acIADvoz7NjCFIEYUVuCFjOx4hipo4esKyivFWcKzD3zj31mn8qaGd1XckF
         /irQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792051358; x=1792656158; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=20IfJrL4vQgVppdX0l7DtOYLpzRZDDrYGwERMl5G+kA=;
        b=QV1I9r6RZZGbnHdSErUnYrtKr40d7VOjNOrNtBGKoDsNKX52b+C014W+jEGp37YSoG
         qyT1zzMYnqH09u080WlBO7fmQ9ib3jdoJRSh/2SMTDqfYLjAdpTioWzE5aa5O1gNxxqA
         p4vpX3GShSBjNh+u5RK3A0nR/IShLfh5x0V09NHSkzdXUeotggvXeaJS/4dcq2pJbDq5
         l91ES1vEXSsBy8zpJKwzFRpNL16sXfi5rW3pNtQ9A543TQyp2U8n5Om8p1ORbvDpZ7iq
         BiqtRFaJg4U+yz+S7P84ScdiWFCgKxWSKehPJdW/+L5gMhL1CPpacfgS3hdl+cTuvcaG
         vPGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792051358; x=1792656158;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=20IfJrL4vQgVppdX0l7DtOYLpzRZDDrYGwERMl5G+kA=;
        b=AetlMQgkSRiZNztRmWM4OEogmAJbr94+kMTqY7D/0wDCxh9s+AOR9VNW6ClawbKNOb
         oBAeXXdi96kz8REfT2geBTiyBC4WSTOlEDD/qBr2JrUQehYAGLZK0O2lrIgvBtRqgjiK
         DNSzHmiALxu+yrakEvo8X6+YZpxlLR111qAm7t2wONCXT84iv2rBwzsiPNO6KW4+jCFT
         IAh2HDpZPZ0Zf4ngWKMYlxxDtjAHDkbVm8A4A14m8pRXv0TQQfuZUm8S1Q3FEbRZcIi7
         JPzpO1HdYM/DFi0VOkINDyZCB6oNrobAIa9vQ1M2qI2lz8qJeFZNdXLCGBroQ6XNDkGh
         SXQg==
X-Forwarded-Encrypted: i=1; AKwUvBxslnmYqc4bVxQ0MDN+Cl3I4xT0JHd78AkMfGkjtBCt48PNzsZSPT69cxZVsarKGGunixv1yxWUkF//PgY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIxzPvYan+VOiIqIzEwLATDDPj9f1x9fA0WdNxa6Y8f9q3VHAAx
	BFjVTq48bRbH9jVB3QNv2S7Q8fuIw/b3QcoBx1pak5qO6cPPfMrEgDvgtFkvy4VAjn9e/9wvnhd
	O2OJdoQSkkc7dy8exG8GrbbHtToqfiXjnkk7DdgEg8A==
X-Gm-Gg: AYBFou0nnB+wRgiSUnAxTXqwpRPidVwky0lxD+B/hHuSBoklaN8B9mqnWqBATGFXWNQ
	2Z8fHqoqpJA8Lz1gkVO+ZSd1I7IGrfhBkEX6fZe8Bzhm9Bkik8J+ArBvMlolExAKYXsMb1r3gFO
	rLsPBSx3rxmTlwMD+chUsySJ5AX23v0kL6+rvc6H0OH6WHUAH/27LVGAFRxpqXwdi+mJqZ2p71T
	+Ni9AXQmQ2Kwfc43pIr4VOvX/rfEkylgSO3zIKKcCYRp5IsqGXOOd+HD/J4ixyH0f9H2T1v8qp6
	FfxI32lDG10uICrffbyJ2nRUD4AdCPgvgOOfPpgjmUihgNw0EVn6tm5nZE3yCN4ilFHCbMCCSN8
	Eh6ZrCT1sg0v9
X-Received: by 2002:a17:907:d90:b0:c2d:bc76:8342 with SMTP id
 a640c23a62f3a-c31a9a2db07mr1677128166b.5.1792051355396; Thu, 15 Oct 2026
 01:02:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002154415.2270586-1-vincent.guittot@linaro.org>
 <20261002154415.2270586-8-vincent.guittot@linaro.org> <a18e6fe1-e14e-46be-9779-3704ab8625a0@linux.ibm.com>
 <CAKfTPtDkSs8KOUYAdSOz_h93khGbT6TaVc9gCa1Cpa0JbmKEGw@mail.gmail.com> <4976fcef-29ec-43fd-8655-32874720ee73@linux.ibm.com>
In-Reply-To: <4976fcef-29ec-43fd-8655-32874720ee73@linux.ibm.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 15 Oct 2026 10:02:23 +0200
X-Gm-Features: AclHuK8YXmCN4MxRL0pXtxsV0nS_mHofnDRL2bLTzz6zddGioaxby2TUQxLM0Zg
Message-ID: <CAKfTPtAXCmf9oqy-BKYRR-cLHFQGcgOCVPwN6s=3x7hD5Xz=hg@mail.gmail.com>
Subject: Re: [PATCH 07/18] sched/fair: Add push task mechanism for fair
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: qyousef@layalina.io, christian.loehle@arm.com, pierre.gondois@arm.com, 
	mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, 
	linux-kernel@vger.kernel.org, lukasz.luba@arm.com, rafael@kernel.org, 
	linux-pm@vger.kernel.org, tj@kernel.org, void@manifault.com, 
	arighi@nvidia.com, changwoo@igalia.com, sched-ext@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Oct 2026 at 18:28, Shrikanth Hegde <sshegde@linux.ibm.com> wrote:
>
>
> >>> +static int
> >>> +select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags);
> >>> +
> >>> +/*
> >>> + * See if the non running fair tasks on this rq can be sent on other CPUs
> >>> + * that fits better with their profile.
> >>> + */
> >>> +static bool fair_push_task(struct rq *rq)
> >>> +{
> >>> +     struct task_struct *next_task;
> >>> +     int prev_cpu, new_cpu;
> >>> +     struct rq_flags rf;
> >>> +     struct rq *cur_rq;
> >>
> >> You likely need below to keep clang's context tracking to be happy.
> >>
> >>          context_unsafe_alias(rq);
> >
> > I just noticed that I didn't answer to this one
> >
> > Why should I need this ?
> >
> > rq remains the same in fair_push_task(). I'm using rq and new_rq to
> > differentiate both current and new rq
> >
> >>
> I tried to use clang-23 and get below with the series applied.
> It may not be exactly here. But somewhere.

ok, the two functions probably need the below
__releases(__rq_lockp(rq))
__acquires(__rq_lockp(rq))


>
> make LLVM=/opt/llvm-23/bin/ \
>          KCFLAGS="-Werror=thread-safety-analysis" \
>          V=1 kernel/sched/fair.o
>
> kernel/sched/fair.c:9971:2: error: releasing raw_spinlock 'rq_lockp(rq)' that was not held [-Werror,-Wthread-safety-analysis]
>   9971 |         raw_spin_rq_unlock(rq);
>        |         ^
> kernel/sched/fair.c:9983:2: error: raw_spinlock 'rq_lockp(rq)' is not held on every path through here [-Werror,-Wthread-safety-analysis]
>   9983 |         raw_spin_unlock(&next_task->pi_lock);
>        |         ^
> ./include/linux/spinlock.h:279:32: note: expanded from macro 'raw_spin_unlock'
>    279 | #define raw_spin_unlock(lock)           _raw_spin_unlock(lock)
>        |                                         ^
> kernel/sched/fair.c:9980:2: note: raw_spinlock acquired here
>   9980 |         raw_spin_rq_lock(rq);
>        |         ^
> kernel/sched/fair.c:10085:2: error: releasing raw_spinlock 'rq_lockp(rq)' that was not held [-Werror,-Wthread-safety-analysis]
>   10085 |         rq_unlock(rq, rf);
>         |         ^
> kernel/sched/fair.c:10093:1: error: raw_spinlock 'rq_lockp(rq)' is not held on every path through here
>        [-Werror,-Wthread-safety-analysis]
>   10093 | }
>         | ^
> kernel/sched/fair.c:10090:2: note: raw_spinlock acquired here
>   10090 |         rq_lock(rq, rf);
>         |         ^
