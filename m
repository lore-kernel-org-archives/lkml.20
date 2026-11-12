Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794494212;
	b=e2K5nN10FYhJmT4dw4Yqx1ZthSCm9353omdhlMinZWmn9EA4yw0MGg164IlhfDxPLEqA
	 u9cODVJOSgUFry+zcsTftrnb718VcQDwaJeqjt+Zg8Ww4BghzshGvx/suYxQmaI2O6xk9
	 qO48a0+XawM7cv+iT9gYYXXDdU3nNBo3rYMWz0FZKBhUYxIXBi2ai2SiyT1gJ1hMiWlTn
	 gSjh5nM6QgfDdzNUhvOnJH/FGoMYU9I6bbU2joz1oGxdFe9KVmbLgDKDwKj1RquyR92ND
	 IndOT3S9GNLycaY5u7srBp1z569v8E7ck6cPDIoVdig2dOdY8UmBLtq2MmcY8Qq9Bfg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794494212;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=DS3zI8poHk6ZVWmUA3v3erJmHnCxBWzxTCMVC3flaJE=;
	b=E1hDzA6p441BU874gm5cTt43q5xm+mnrQpbM0oltr5awQe9RhGfeYikvV+dP+sIuCf17
	 i21Pt+7LNLw2+9G8buMUgCPOBotAztagxicA8g3MerX4slqHOB2kT30DSJRU+1ORJEF7G
	 6oShRI8dBKB4jSFEUQ44hlqHhl7WYIWlJ+k5aSOEtRF9tGbBGb4mdOezt2w/FZDY02f65
	 LhKPi/fqMeUSB3hzRAqhn8/S8DleRXOFfgDQIu4U/6ppoimdOWqPqOrCsD9H9tL2f/+F1
	 R6bbWGzQAChQI3qcKh5ugC2qwUe+vPjKjXctaw2/D/mWY5wCpvQyoEOiPTU/fikL3iQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OhtyRrGg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB7C606B2D2
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:36:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFB7C606B2D2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OhtyRrGg
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b6f42095bcso5859070a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:36:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794494210; cv=none;
        d=google.com; s=arc-20260327;
        b=h6TJ98szDUDwXUoSn+4ucLLpPQZwOJsrPW7LlKvSKz+zwjV3dKCSY8/ivTggxR27dI
         kov4caYOJXsZS+hz5kCtZav1drYclmotmymxU2OCh9tpnQ+Xkf5GxjfPDGCZtdxZ16xU
         qqjqzoSDOSBP+GrmN862gkKHNTkSIyIEVZcAz3hNVSpFoS9Ftjt5dNZxmr40DXJD6Xxi
         /rXSy1+30TsjwuV4uKJGm4HDrUbzbMtJ8H7TV7IR5DK7gFiTOadHU5W70LRzmVpacoFi
         oO0ROiE3K9JRGsD8Lxpgji596Eq1hddcttnOLjhlFEEBpN10xLD4QJ/KYc5lTN86vyDT
         mUhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DS3zI8poHk6ZVWmUA3v3erJmHnCxBWzxTCMVC3flaJE=;
        fh=Q7qn/m3yKqhiKz5XcdM0XD4pt4hDXOOvwaneG2iUvZc=;
        b=NTfJGePiDyuSkzbkF32kTRKNeVv9u5sQaId0PoXctPwWefWN3XnNnUWjJZ+e/53Wpy
         seJLWBvU2FiZNp1tOWjZdh0/dkzkgAGnCjd6WBKDhqaJP/vjVAKpCurK+gTvM+d5umDz
         NGsnjtjJXs8djdEYaVoWBuhgmwxsoW3Wvalv6MXMpJN4puMa5DLaHtOcX1I9P0tjA3Wb
         cRXolBxt/ZpbZxjHL80A0qVdb/rM9CRngSEahWwdY37LjhPSJQDF3LowcJYNKMoQDYrY
         8CoLdIOYh3g12ty4hpOBFU/KIpVWB5IGRHvnbNt6mqMjo9DLYg7IanO+/0Qo4vghF6fz
         2DCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794494210; x=1795099010; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DS3zI8poHk6ZVWmUA3v3erJmHnCxBWzxTCMVC3flaJE=;
        b=OhtyRrGgtwE0BU3tWq29bn8mKP6uTWp/uZ891Z9uXJV1llAiqqlBxqiKgTbCEiRnhK
         b2gVMDOGJhJu1jmlCPIdKZ6s3YGwtY4zywkxVhAtaUMetRpBbbUR6ORVsmhjDGZDQf/G
         M5WBDshsHP7tGg9D1Nxt+RlJtzSOO0VLAG4DJTUOKSEdodDXA4Nlq+Rf89tRyDL6NENp
         uXK50cfT0BHquNH81b/TkhhwSY7qmCT6lr/BW5z0CKx0G++V+Mg+RHMGCCOCDNFzBJhU
         u31C6gancKPtH8iEeQ6EyFIcWnj5ePx08EHY/dNiBJ9LsYy/X+dMx8TXfYdxhnASi/1U
         5H5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794494210; x=1795099010;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DS3zI8poHk6ZVWmUA3v3erJmHnCxBWzxTCMVC3flaJE=;
        b=Oot8vtiSjPs3vAY/5N8h3rWx3UGksXlHYRWKo90qqnAqP9U62eyuTt4wMx1eTII21G
         Ub4h5O+stuXAGYqguO7izcQ3Q3JCz+9X0wfGaIXQBGvaNBuX+5Kj1d7d6N8MwnE2HqBq
         Esvt0yVvARnAGuHXIqGNJXGl5Y/7GP11rcuP2az5J5N8EUKp12DWiRZBH8E77Xxw1C0e
         /SyBjYa/tdKu2cIntekTk5aAuN0qbJjiuPAckaaARC8pjKnKKZqd3S5hfsyipjBUFNOz
         SmumgoXu+aN9N6MbEAX6nRJjv/IPgFNlY6oXnWwzK3RW2a6iSZ3gFi2XKhV3ApEJBXmr
         HadA==
X-Forwarded-Encrypted: i=1; AL+hErECtADYwibM+ov614MNfohNEJfGdDghlMCBqzavtvrmcUJIyhHdhCsVX7Gwy1+qsfdMkfRQtbFMtYLKRpo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zY7Nk9oSl9ADH76q7EtCDWL2FfkIICp6GiBSF8aVefq8YBZaD
	mfF/xo1ut51YmdL4ZDcdz311EyH9PziHxkfvE1eYfU9WcCm2lEFGlWwLLiEt7lZkVKSTYEvMnwH
	zC1Lg8QIB+ceEnPld9/E8X1c9goRl58ryk6Kne5TVMA==
X-Gm-Gg: AYBFou2EH7jI6/Eg72U6AXAE4ntllY1GVaP/0grAJqBIBxptjkYnhtd6Z8LEH+wajyJ
	X1E6JFpYQZCJQCpMo4QXW30GTAATZUVUSd8RFz2IslP+14FFAdbLZJS0hpzNCe38Dr8u+WWqQnm
	G6RhfruvztPlsutr5wHaoR1HO5bUroHa+ImENiQjHvLjiiHzstGtw/6ipctb11mkQEhWzWXebgm
	YvHYovK1Lh2qkM/LWqyTH94hPNCAtkLiZldoTdXeGWj6YiTZyhCSDt/tPMuHIwF7wlHoav8uiX/
	DqI97tyUjUzttbu/+215UI57Y5jaVtccsDuqeD2hb50R/BYaLPF7VZ9Ptwi8YkayWgVYEDLFTSH
	4w536hP8UhzVI6yDIGftiTY/3YA3zHkO12qY84YhdR0YjxD2KuGssPe130XYn4PGXDydfWQ==
X-Received: by 2002:a05:6402:c894:20b0:6b3:f05e:fd5e with SMTP id
 4fb4d7f45d1cf-6b777817455mr3158866a12.33.1794494209957; Thu, 12 Nov 2026
 06:36:49 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112083447.25603-1-kprateek.nayak@amd.com>
In-Reply-To: <20261112083447.25603-1-kprateek.nayak@amd.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 12 Nov 2026 15:36:36 +0100
X-Gm-Features: AclHuK_DaKblhrjeFF7mGRr_aAcm3ineuZ-BXK8eO_hJE94MhPSPxncn_Fn08wk
Message-ID: <CAKfTPtDgksPa3uRESu2dLc55b-Wya5TXxg0b_DiQNKe5Fy=KkQ@mail.gmail.com>
Subject: Re: [PATCH] sched/fair: Avoid transient double accounting for delayed tasks
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, linux-kernel@vger.kernel.org, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 12 Nov 2026 at 09:35, K Prateek Nayak <kprateek.nayak@amd.com> wrote:
>
> When a task is delayed, h_nr_runnable is adjusted via set_delayed().
>
> A dequeue of delayed task with DEQUEUE_DELAYED would decrement
> cfs_rq->h_nr_runnable again in dequeue_hierarchy() and then correct it
> immediately in __dequeue_task() via clear_delayed().
>
> Adding:
>
>    WARN_ON_ONCE(((int)cfs_rq->h_nr_runnable) < 0);
>
> in dequeue_hierarchy() after h_nr_runnable accounting is tripped
> reliably during early boot.
>
> Although the cfs_rq->h_nr_runnable accounting is transient, this
> incorrect value gets cached in se->runnable_weight and can affect PELT
> calculation until the next enqueue / dequeue adjusts the runnable
> weight.
>
> Similarly, a task enqueue should never reach enqueue_hierarchy()
> for just ENQUEUE_WAKEUP && se->sched_delayed. Wakeup of delayed tasks
> must couple ENQUEUE_DELAYED which gets correctly handled in
> enqueue_task_fair().
>
> Avoid incorrect accounting in __dequeue_task() and warn for
> incorrect wakeup flags if delayed tasks reaches enqueue with just
> ENQUEUE_WAKEUP.
>
> Fixes: 85570f10a4c6 ("sched/eevdf: Move to a single runqueue")
> Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>

Reviewed-by: Vincent Guittot <vincent.guittot@linaro.org>

> ---
>  kernel/sched/fair.c | 61 ++++++++++++++++++++-------------------------
>  1 file changed, 27 insertions(+), 34 deletions(-)
>
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index d4cc0caee626..e61b365a7b11 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -6614,19 +6614,8 @@ static void set_delayed(struct sched_entity *se)
>  {
>         struct cfs_rq *cfs_rq;
>
> -       /*
> -        * Delayed se of cfs_rq have no tasks queued on them.
> -        * Do not adjust h_nr_runnable since __dequeue_task()
> -        * will account it for blocked tasks.
> -        *
> -        * This check can be removed because when flat pick
> -        * patches get merged as only task can get delayed,
> -        * same for clear_delayed().
> -        */
> -       if (!entity_is_task(se)) {
> -               se->sched_delayed = 1;
> -               return;
> -       }
> +       /* Only tasks can be delayed. */
> +       WARN_ON_ONCE(!entity_is_task(se));
>
>         /*
>          * Drop a task leaving the runnable set.
> @@ -6640,20 +6629,18 @@ static void set_delayed(struct sched_entity *se)
>                 cfs_rq->h_nr_runnable--;
>  }
>
> +static void __clear_delayed(struct sched_entity *se)
> +{
> +       /* Only tasks can be delayed. */
> +       WARN_ON_ONCE(!entity_is_task(se));
> +       se->sched_delayed = 0;
> +}
> +
>  static void clear_delayed(struct sched_entity *se)
>  {
>         struct cfs_rq *cfs_rq;
>
> -       se->sched_delayed = 0;
> -
> -       /*
> -        * Delayed se of cfs_rq have no tasks queued on them.
> -        * Do not adjust h_nr_runnable since a dequeue has
> -        * already accounted for it or an enqueue of a task
> -        * below it will account for it in enqueue_task_fair().
> -        */
> -       if (!entity_is_task(se))
> -               return;
> +       __clear_delayed(se);
>
>         /*
>          * Re-add on wake, after sched_delayed is cleared. On a final delayed
> @@ -8177,13 +8164,16 @@ requeue_delayed_entity(struct cfs_rq *cfs_rq, struct sched_entity *se)
>  static unsigned long enqueue_hierarchy(struct task_struct *p, int flags)
>  {
>         unsigned long weight = NICE_0_LOAD;
> -       int task_new = !(flags & ENQUEUE_WAKEUP);
>         struct sched_entity *se = &p->se;
>         int h_nr_idle = task_has_idle_policy(p);
>         int h_nr_runnable = 1;
>         struct cfs_rq *cfs_rq;
>
> -       if (task_new && se->sched_delayed)
> +       /*
> +        * Accounted via requeue_delayed_entity() calling
> +        * clear_delayed() when delayed task wakes up.
> +        */
> +       if (se->sched_delayed)
>                 h_nr_runnable = 0;
>
>         for_each_sched_entity(se, cfs_rq) {
> @@ -8258,6 +8248,9 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
>                 return;
>         }
>
> +       /* Wakeup of delayed tasks must be handled above. */
> +       WARN_ON_ONCE(!task_new && se->sched_delayed);
> +
>         /*
>          * If in_iowait is set, the code below may not trigger any cpufreq
>          * utilization updates, so do it here explicitly with the IOWAIT flag
> @@ -8275,9 +8268,6 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
>         if (curr)
>                 place_entity(cfs_rq, se, flags);
>
> -       if (se->on_rq && se->sched_delayed)
> -               requeue_delayed_entity(cfs_rq, se);
> -
>         weight = enqueue_hierarchy(p, flags);
>
>         if (!curr) {
> @@ -8317,16 +8307,15 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
>  static void dequeue_hierarchy(struct task_struct *p, int flags)
>  {
>         struct sched_entity *se = &p->se;
> -       bool task_sleep = flags & DEQUEUE_SLEEP;
> -       bool task_delayed = flags & DEQUEUE_DELAYED;
>         bool task_throttled = flags & DEQUEUE_THROTTLE;
>         int h_nr_idle = task_has_idle_policy(p);
> -       int h_nr_runnable = 0;
> +       int h_nr_runnable = 1;
>         struct cfs_rq *cfs_rq;
>         bool dequeue = true;
>
> -       if (task_sleep || task_delayed || !se->sched_delayed)
> -               h_nr_runnable = 1;
> +       /* Already accounted via set_delayed(). */
> +       if (se->sched_delayed)
> +               h_nr_runnable = 0;
>
>         for_each_sched_entity(se, cfs_rq) {
>                 update_curr(cfs_rq);
> @@ -8417,7 +8406,11 @@ static bool __dequeue_task(struct rq *rq, struct task_struct *p, int flags)
>                 rq->next_balance = jiffies;
>
>         if (task_delayed) {
> -               clear_delayed(se);
> +               /*
> +                * Skip accounting since set_delayed() has already
> +                * adjusted it. Just clear se->sched_delayed.
> +                */
> +               __clear_delayed(se);
>
>                 WARN_ON_ONCE(!task_sleep);
>                 WARN_ON_ONCE(p->on_rq != 1);
>
> base-commit: d7e670601af6c564ccf6d3b2ddf70ee4f41a6d1c
> --
> 2.34.1
>
