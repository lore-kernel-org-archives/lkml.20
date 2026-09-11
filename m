Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F7547143C
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789129189; cv=pass; b=vFK0Ug5tCxbTa1Lgq5UQaHMoUa3UaGiQWQ4TqAYWLnmRAeCut7yUdla0HsSMGsr69xJlVH+gY6Meot7Hf/EEKlH2d4T8Qh31sgKNlaW4fC93hu3enE/lcwmhyGnkp6LdaRXL52gBkmmRXep1f32/pi6LSXrmeZkrXPJ1Rq6dZ5A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789129189; c=relaxed/simple;
	bh=WIkF9GOS5IXor5mMuz69f+EA06G77Q1B1ks2C7FKsFs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m/M3JMan6sO8HRHY29eNkCvrIEOkoRfOuAKT1feaSWH6R3gKjYWw6nyakOeceCKe+Xuu/gijpRhB6lVaRz+TsMOuuYcjuPrGFyGt6eD0cQDqv6UU3LvIOkIvBL9wavA56a1oqu9+b8oBOB8YWm+GXGncj+vH8mBBGoJ3cWr24zg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PWkzxkMz; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PWkzxkMz"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c294183384fso140598966b.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 05:19:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789129177; cv=none;
        d=google.com; s=arc-20260327;
        b=IcaenC1MW4ua1AG8LSXZynhtdUnK1ynoPSrJVMrtu3/DtZQyknk+jQoQw8ukDOf+IX
         qEj7SdcVZvzAUSjBMyVwoz5A6lnHAEfM6u2s5G3yuRxx5nVaRHfkK9r2RaTNQTjtcxVw
         4k47Gmq8NlE8DrKjlyW8qUxLK9/AU/LNPZ2LhrdSGbKoFQibhaVrJGyVxjC+7hrW2d7C
         jTltS+H28jbA8yUtUayRQ6iVVquSPbIjbQ4W5SXRe6GT/0Gsni4+0PbLiA3npHfFzozD
         Rp6D5bCcILn2p98lnnM4H9LyXyjs3qr5yqgTfhJw3bl1XP0G4GjemwLmwikt/2FeIcs3
         71WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZsrlVKCa+dBQOIx2PhPwIv0Tn10VHNBteLwWGFEl8r4=;
        fh=v9AZRapPg5A2eTUJcUy81kPORy6E2DpxX99pCiCDikU=;
        b=gg85PgWql0GHuDtIHvpDI8x2sOoYMvr6SWR8CZt3ykqCbrd5OtIkfKF3eq2ZQii9Z+
         7LWZXpZETLCoMTMNZYMAYIaihRf9QHE1TvAagarrfY1pngsGDE/wfggTXUDVPkRkl88z
         Xza5XTX/02DFxJtbRn6ILB0RL/BjV4nCEq4KmJlWaxuFCOyaYGNKTGZLCWWTUHNJzKSU
         6AR64hJQfHqCUmxOHed9IRmvQg2eZu4Y8DlCFNAVDSYO/2kFkNsMa8AJJpMEzaIhlOx0
         NzfuFVVoz6JpTqalZowXyL9Y6w9yenTnS9bDp7l22hgkpw/Q0wLkZPCvMzja87kbCfXR
         aylw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789129177; x=1789733977; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZsrlVKCa+dBQOIx2PhPwIv0Tn10VHNBteLwWGFEl8r4=;
        b=PWkzxkMzoTcjS3aJwTsHogo/YdAabY/fzP2OWdhT7tEuwviQ6/aNFSvaB5h+r7ks9I
         3TA4D15LB9eOt7FEWfBhTIlXQCM0FYtKKFOpZaco88htYjTh5YvSoMGzgLnuzP+U0Gh+
         TVX4Q51xxD5zyLm5olFHBKgj45f9efCloeAfPp3M5y2gPA61sYMfVBN8ZhkuV0Dg67wm
         SlPRB0D0kpaK4kkZFidCg5Aj4ylyUlJfv5bTDrccUmLNfZN5VsjzHy+NIUi0kQW2p1sH
         dhdL8fjTt7MmrSRbsSJNknfSFccUlnYGdhoVCkA3EESOpB67KlHPH/Yo3tRF7SHhTtfP
         VLgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789129177; x=1789733977;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZsrlVKCa+dBQOIx2PhPwIv0Tn10VHNBteLwWGFEl8r4=;
        b=fJ2w9RGgnho5FPacs4TIEuCoF8fy00FcGfiw40n/dBuOFRJFWsv9iqZVyP0eZAg8r5
         jprOJm82Eknrj+W9xV3Z+JClfBP2+VmuHsGQ7XNuKa2ufbfwERu221K8WGjSUl5OyYub
         fIirw34wkctZFjooKS09JjPbM7qG5AxUWsGN9A+HlwECbr68RkaRQlFC04ABAOvtQMyd
         HozSNxAikqU6Ot6SrEgIxc6tq0MWesGQYkwYokM1UhodQ9trQQyZiczj9kCPD5RG8Dku
         xCwtLLCs77W6TGhTki7BMsLCAKJT7xQxTVhiWZ4T/UpofZ8FAztesKloBfKhqBQm1MU/
         YcKg==
X-Forwarded-Encrypted: i=1; AKwUvBzfvYkfjC8eT+npoL+pAj7wgOsofvuZkEo1580xSMMf7S3gCo1DDo7FZiE/rP/9lTeWsYLRg9PDLoSpa6g=@vger.kernel.org
X-Gm-Message-State: AFuF++lk+8e2Tk1r3THM/5GF3GyWOGAt8r5Y/S3euf2rywFczOj3i6AE
	MY+/N+BdI/FX48eIJ765dul0veGc1llVWxJtpdHYugNWffi8be1K9giAWYUzI1fTLHnVmhxsOyS
	ZyVyBMbJ5ZNZtR7RW0mXAWRV4Jiqgvva07OLrIAt6Mg==
X-Gm-Gg: AYBFou0YUS76dP2sOZnJ5hz80cZNPnkEPrO5Q3qH8wvxdQjv3zaAf/j98MKcv3Fll4p
	nl1EnUEF0njsJmcoe+c+U8XRgVg4OEQlXMtYH4CoUIDIypoMKWb5HBEIPCFUGof6b7tzq63InC4
	H8VzPbXYg60Fo/PH3K4s1LPNlvxqsh3E2e9H/1WARfMurTlTrRVFcfUEQyICF2V8fEGCNKioGd2
	8zME2xw5aozzjfHiyTeWLE7dsCv0mPJcVoQQO8JJ/+Rn6FnP+jYIaBRIDbi1puXS/Fq2Nppiwb4
	+33IY56tiL917sNhfSyGRt2SdMQREKtHAMcXoiUFVgFZLv7/K/cSUE7aJTLHcrZT7Ey7toW+N31
	FX8hpPnRKI1awZ2IorRtbzonG
X-Received: by 2002:a17:907:6e8e:b0:c26:19e3:e98e with SMTP id
 a640c23a62f3a-c29667bb29emr166688566b.46.1789129176980; Fri, 11 Sep 2026
 05:19:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824125223.508178-1-kayracizmeci@gmail.com>
 <cover.1787737648.git.kayracizmeci@gmail.com> <60fd4fc5d17b706766a428b63760d1f69e6d11bb.1787737648.git.kayracizmeci@gmail.com>
In-Reply-To: <60fd4fc5d17b706766a428b63760d1f69e6d11bb.1787737648.git.kayracizmeci@gmail.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 11 Sep 2026 14:19:25 +0200
X-Gm-Features: AcwNN1VxAV9AYlbAjbx0qFLp_Z26eMqDaBjQ-gVft718GBtehDSqPPIe8JW0m4I
Message-ID: <CAKfTPtBEKaYoEmkWRvsDWXsQxtnHnOFQiA6U_4PzQTJw0xtEEw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] sched/fair: avoid recalculating curr status in
 place_entity() and requeue_delayed_entity()
To: Kayra Cizmeci <kayracizmeci@gmail.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Aug 2026 at 12:18, Kayra Cizmeci <kayracizmeci@gmail.com> wrote:
>
> In enqueue_task_fair() a bool is calculated by cfs_rq->curr == se.
> But this information gets recalculated on requeue_delayed_entity() and
> requeue_delayed_entity() only gets called in enqueue_task_fair().
> And on place_entity() if se == curr we call the avg_vruntime_weight()
> twice with the same input. place_entity() only gets called in
> enqueue_task_fair() and requeue_delayed_entity().
>
> Use the information on enqueue_task_fair() in requeue_delayed_entity().
> And place_entity() to avoid calling avg_vruntime_weight() twice.
>
> Signed-off-by: Kayra Cizmeci <kayracizmeci@gmail.com>
> ---
> The patch needs curr to be invariant so I added the same
> (cfs_rq->curr == se) to places in requeue_delayed_entity() and
> and enqueue_task_fair(). Like after the place_entity() call in
> requeue_delayed_entity(), or like before if (curr) the old place
> of the calculation. And added WARN_ON_ONCE(curr != new_calc_curr)
> or something like that I don't know how to say it normally.
>
> Then I booted these changes on x86 (Zen 3)
> called perf bench sched messaging with 200 groups and 5000 loops.
> And then I make sure if the requeue_delayed_entity() was really working
> with ftrace. The results were good but I left the computer on 2 more
> hours and then checked the results again. It was still good, but
> considering that I booted the kernel with busybox I don't think
> much happened on that 2 hour window.
>
>  kernel/sched/fair.c | 36 ++++++++++++++++++++++--------------
>  1 file changed, 22 insertions(+), 14 deletions(-)
>
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index b411384125ec..f1b46fe26d12 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -6175,7 +6175,7 @@ void __setparam_fair(struct task_struct *p, const struct sched_attr *attr)
>  }
>
>  static void
> -place_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
> +place_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags, bool is_curr)
>  {
>         u64 vslice, vruntime = avg_vruntime(cfs_rq);
>         unsigned int nr_queued = cfs_rq->h_nr_queued;
> @@ -6199,7 +6199,7 @@ place_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
>          */
>         if (sched_feat(PLACE_LAG) && nr_queued && se->vlag) {
>                 struct sched_entity *curr = cfs_rq->curr;
> -               long load, weight;
> +               long load, weight, curr_weight;
>
>                 lag = se->vlag;
>
> @@ -6256,10 +6256,17 @@ place_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
>                  *   vl_i = (W + w_i)*vl'_i / W
>                  */
>                 load = cfs_rq->sum_weight;
> -               if (curr && curr->on_rq)
> -                       load += avg_vruntime_weight(cfs_rq, curr->h_load.weight);
> +               if (curr && (curr->on_rq || is_curr)) {
> +                       curr_weight = avg_vruntime_weight(cfs_rq, curr->h_load.weight);
> +                       if (curr->on_rq)
> +                               load += curr_weight;
> +               }
> +
> +               if (is_curr)
> +                       weight = curr_weight;
> +               else
> +                       weight = avg_vruntime_weight(cfs_rq, se->h_load.weight);

This makes the code less readable and I don't think it gives any
measurable benefit.

>
> -               weight = avg_vruntime_weight(cfs_rq, se->h_load.weight);
>                 lag *= load + weight;
>                 if (WARN_ON_ONCE(!load))
>                         load = 1;
> @@ -7900,7 +7907,7 @@ static int choose_idle_cpu(int cpu, struct task_struct *p)
>  }
>
>  static void
> -requeue_delayed_entity(struct cfs_rq *cfs_rq, struct sched_entity *se)
> +requeue_delayed_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, bool curr)
>  {
>         /*
>          * se->sched_delayed should imply: se->on_rq == 1.
> @@ -7912,10 +7919,10 @@ requeue_delayed_entity(struct cfs_rq *cfs_rq, struct sched_entity *se)
>
>         if (update_entity_lag(cfs_rq, se)) {
>                 cfs_rq->h_nr_queued--;
> -               if (se != cfs_rq->curr)
> +               if (!curr)
>                         __dequeue_entity(cfs_rq, se);
> -               place_entity(cfs_rq, se, 0);
> -               if (se != cfs_rq->curr)
> +               place_entity(cfs_rq, se, 0, curr);
> +               if (!curr)
>                         __enqueue_entity(cfs_rq, se);
>                 cfs_rq->h_nr_queued++;
>         }
> @@ -8000,9 +8007,10 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
>                 util_est_enqueue(cfs_rq, p);
>
>         update_curr_eevdf(cfs_rq);
> +       curr = (cfs_rq->curr == se);
>
>         if (delayed) {
> -               requeue_delayed_entity(cfs_rq, se);
> +               requeue_delayed_entity(cfs_rq, se, curr);
>                 return;
>         }
>
> @@ -8017,18 +8025,18 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
>         /*
>          * XXX comment on the curr thing
>          */
> -       curr = (cfs_rq->curr == se);
> +
>         if (curr)
> -               place_entity(cfs_rq, se, flags);
> +               place_entity(cfs_rq, se, flags, curr);
>
>         if (se->on_rq && se->sched_delayed)
> -               requeue_delayed_entity(cfs_rq, se);
> +               requeue_delayed_entity(cfs_rq, se, curr);
>
>         weight = enqueue_hierarchy(p, flags);
>
>         if (!curr) {
>                 reweight_eevdf(cfs_rq, se, weight, false);
> -               place_entity(cfs_rq, se, flags | ENQUEUE_QUEUED);
> +               place_entity(cfs_rq, se, flags | ENQUEUE_QUEUED, curr);
>                 __enqueue_entity(cfs_rq, se);
>         }
>
> --
> 2.53.0
>
