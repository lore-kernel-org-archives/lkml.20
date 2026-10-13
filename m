Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD33751B194
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 16:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791910494; cv=pass; b=MHEzyJAUxrXs1LVNcMhxElF972u3zReH4HiuPwm+eN6qpN8Ic114MbHv9m4krMZlQweXNqiB9nb82iObkrGn5yXrmCdRXwWlje0u/h9/Dsw2C1Lk4q+K+piG9zP5G68LBuj8XtKWHG4Db44vDsmwejPtqrMGJGqc4WzZNIL71to=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791910494; c=relaxed/simple;
	bh=WY/Dke7ZxpouE89s4BFg92k0QWRrSw4TTN0Jgf1P36s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cTbZ13my7B99nS8OtAzwoOX+uEMw+8T73+BzJBt7lP8xUNRqYv9PJ97Vhv02h7pNXRbzshc43vW1TsKXR/hdvhIj11r8EGmFEB74dCzpH/63/ifIP1f3Xt81PUeSYLleKCMqP3ZESaN8wv+roBxKDqKGdqh8ZAkI5hbQMaR2DL8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hMEzaleu; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hMEzaleu"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6afbc363efeso81763a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:54:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791910491; cv=none;
        d=google.com; s=arc-20260327;
        b=NGectw68lU3YGH3498rFGhTbmgqM6oN4hidLD+uKCsMOeHRvJuqIAQKlkk2lAEVVVm
         0BdYT4jvGQHl3G23N7vYuTvzanCV0JwRIhRJ3X9ks5gbhsrzXzdVS+/Q3KebNgR8IlNh
         mm4HW9+e5Cs5mK5DxEfpOlRqZ05+02KrwYkyC2uw1gppk5Q4YwtApmHK/GwyNcnWdKNY
         w++Xgf3WD5lru1lNkBHmyBdjqGnHoPx3/WqNI4AvLczjfe0wENWG6SINSBJsBc8ZaCJo
         P371BM3wh9NtBAhxu6o97y+efgKNFCN49VdyAnzlY1sEQ+ex8GTg4IW1TrwjcNZmCY1F
         Kohg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=imII95RFlGonBlIhZiPO6xM6vX13EnIjffKPzKmAPVg=;
        fh=9nLVMHPkMGl5AXwEkRve0saI48+1GUClVTmJwiIXzWE=;
        b=KOyCNFG36i1bhig5ZRUpB+EAHVZCDqzawOIm/IPaYrpg797idclkM6DTs2XhvVkHYo
         WA49S+qgFlk5jBW5XvbwTWNMg5LgEyWd8VXycMvEjAuIANo4hPO+cF4HUI0Wjjfg3dZM
         Wnbw4c2cKyttAp8uH2+fD96VBgsue4oTvU2hJ44NMvaBz8wklJ/XwOkTAIrvxrb8sgxb
         dkEk8mnPo1Om2XIm6dGsIE0EKK/Qi2Vq9YzqCuWB7tVirnnpQ4Tdq5qHA+jYEm7KZCqB
         5IWxlogwLxpIdvn4N+ax6mjkiqwxPSMFKPxb5G2X6KBjLTRIErrr+TSW2fdmrhPg/D3m
         ADtg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791910491; x=1792515291; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=imII95RFlGonBlIhZiPO6xM6vX13EnIjffKPzKmAPVg=;
        b=hMEzaleul2JQ1cnRexssGvQuMcur4HByTHlyG9Jioq9bQitFSGeS9rnMse/wAYovHj
         FXMEqgN3RJ7HAVd8E+qqDErTIEhYxuOAermwRsvRoJiWZgL2hgovDESG0lraKCxU6C22
         dYDG83SBqrDkUfObMg96F4Z7Ldf/oFl7vJ1w2CWzJchmTzuChkxvhoGiSDa0kPm4ipWx
         /yM6MgxFaNZxodX0IFSf0EY3w9wDtnesbJTkbbBV9XWFkG+ARk5GRyGOx4BqWE62OMCr
         ik/1QYy1umsz+DnkzTqbDkKkp7q5qogINeUtAOSuT2ZWEOYKH0sonYtYRZyp8IVlLrY3
         OzVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791910491; x=1792515291;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=imII95RFlGonBlIhZiPO6xM6vX13EnIjffKPzKmAPVg=;
        b=RxIPqon0yfxLEqtHCtFSj3vfUgd7kpGXknvD1M6g7q3XMaaXqmPxhwZbelzNOQILO9
         b67TXf8hoFRkuw+f46qQ6gfG+Aor+h1wOyykPs2AlTq+yd1fWYGKwTkqq1Tmv0LU7/Ja
         OcHSjZfM5eQyfcw8sgbbE+pkinLdFsZG8jqL5tNpLhdcUT3MunCjpupOel60oAV7swN1
         2+a8adHyAF4Ji1qvwtzh3lnrr6RMJeDTqQZ8SvJQN4Xt0RaQEkTr1mQ/bUya/pg8Vhdi
         dZf31RzAMnGV5fOIPDroXfv1Rm7plvwqp+V5YOXxs1ANAqXg6gQMWZ2vRmQp742p+DWt
         rIvA==
X-Forwarded-Encrypted: i=1; AKwUvBwk+uVf/DUpU6pIgz06tJThxCED/G3pKcJqxsKUyVOD23avgdp9yNRSDQ57U+m4khHjoqWP4LsXWsFz3jg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKfVtuHPYpH23FYVuzG1nmeHV4U/NENP2bF4YIinmzi8gjho2ZS
	6J8fvroLPGPRWYLzi3uaq47qaYN8cixsgTBmNqj/MbBJJi9V6DqCTZv0IhyTmqhwp3tcT9BhFVZ
	x35dKQ4itEbQNTC8eJSqa/1Tn4/j6EBd/zfTrTwfUYg==
X-Gm-Gg: AYBFou1MY5puX9EYGpgn3b8pscTWzyONOcfa75RKD4rBWg9fTB6KfaWqz9ZMISYMfsM
	sXJXEuN/qZQbetiYAvO+FZ/106vA5sJ/GSrOJkUXbOKh4kHyvS2iTcJDNVZION/yUvFgNyrXxx0
	kmg/aRviCWJnSHdDuQL33uotXgB9f0xYNHz2vzByCxBol/czLgNKzjRyi87FIVYybLUI8+pCbDV
	yUQ2wcIf4AjvP29efS6qpEdVpuSzEI1IvopDdtUVvGzLcqmuSR3WT7BZ8uOFwTVrUzXgHs74++T
	2fK6qn0b3FdzB43/GWDEfF9x6mH1ij/1r7WrYdKMYyq0MHXQwElMcIgJsSPp1lP1+xt07XH6s7O
	Lcu2jt6spFc0=
X-Received: by 2002:a05:6402:2b9a:b0:6ac:b3e7:2357 with SMTP id
 4fb4d7f45d1cf-6b17c2b5fdcmr11891951a12.21.1791910490843; Tue, 13 Oct 2026
 09:54:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929084923.092062266@infradead.org> <20260929085320.209298048@infradead.org>
In-Reply-To: <20260929085320.209298048@infradead.org>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 13 Oct 2026 18:54:39 +0200
X-Gm-Features: AclHuK-vduoXw56BnrcIS5cBkBuAYJ75-6i_9ahzCLMm65KipmoQw7mGJ7mGEc8
Message-ID: <CAKfTPtCgAjDXgRVBPUSKi4gq1pPN6b7dcP2myMhoOQ9Tyj7_nw@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] sched/fair: Extend for_each_sched_entity() with a back-link
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@kernel.org, juri.lelli@redhat.com, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	kprateek.nayak@amd.com, tj@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Sept 2026 at 10:55, Peter Zijlstra <peterz@infradead.org> wrote:
>
> Leave a trail of bread crumbs, such that we can find our way back down the
> hierarchy. No actual users yet, but split out because its a bit tricky.
>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>

Reviewed-by: Vincent Guittot <vincent.guittot@linaro.org>

> ---
>  kernel/sched/fair.c  |   14 +++++++++++---
>  kernel/sched/sched.h |    1 +
>  2 files changed, 12 insertions(+), 3 deletions(-)
>
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -318,8 +318,13 @@ const struct sched_class fair_sched_clas
>  #ifdef CONFIG_FAIR_GROUP_SCHED
>
>  /* Walk up scheduling entities hierarchy */
> -#define for_each_sched_entity(se, cfs_rq)                              \
> -       for (; (se) && ((cfs_rq) = cfs_rq_of(se)); (se) = (se)->parent)
> +#define for_each_sched_entity(se, cfs_rq)                                      \
> +       for (struct sched_entity *_BL = NULL;                                   \
> +            (se) && ((cfs_rq) = cfs_rq_of(se), (cfs_rq)->backlink = _BL, true);\
> +            (se) = (se)->parent, _BL = (se))
> +
> +#define for_each_sched_entity_bl(se, cfs_rq) \
> +       for (; ((se) = (cfs_rq)->backlink); (cfs_rq) = group_cfs_rq(se))
>
>  static inline bool list_add_leaf_cfs_rq(struct cfs_rq *cfs_rq)
>  {
> @@ -456,6 +461,9 @@ static int se_is_idle(struct sched_entit
>  #define for_each_sched_entity(se, cfs_rq) \
>         for (; (se) && ((cfs_rq) = cfs_rq_of(se)); (se) = NULL)
>
> +#define for_each_sched_entity_bl(se, cfs_rq) \
> +       for (; ((se) = NULL);)
> +
>  static inline bool list_add_leaf_cfs_rq(struct cfs_rq *cfs_rq)
>  {
>         return true;
> @@ -15233,7 +15241,7 @@ static inline void task_tick_core(struct
>  /*
>   * se_fi_update - Update the cfs_rq->zero_vruntime_fi in a CFS hierarchy if needed.
>   */
> -static void se_fi_update(const struct sched_entity *se, unsigned int fi_seq,
> +static void se_fi_update(struct sched_entity *se, unsigned int fi_seq,

Not sure this should be part of this patch

>                          bool forceidle)
>  {
>         struct cfs_rq *cfs_rq;
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -726,6 +726,7 @@ struct cfs_rq {
>         unsigned long           tg_runnable_avg_contrib;
>         long                    propagate;
>         long                    prop_runnable_sum;
> +       struct sched_entity     *backlink;
>
>         /*
>          *   h_load = weight * f(tg)
>
>
