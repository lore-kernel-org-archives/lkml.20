Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794219208;
	b=xnecSCm42A76ybqHAAGXUUeDKKVX9G+v3mHg9nOKkSBjSKVfklWXct+emUvAl6XktguA
	 dc3oyvpky1hJwuAFyvEwypmwZi7j5Mpsm+8M34k9dGjD3Jp2yvVZX1dUU4SYTxCb3p1SV
	 v8Rl7Tyj6wRqm6vg+Zf4T5Y1WC+9oWvSAMubien59v6DeKXZ8re3m6N2FDAWtQzXxklho
	 0iuaoobjpzq107h9stgy0CrwBM5HqgSXDmLUtxXkt8YkDEPfwoEgNFWCvmGPjpWkX66+S
	 DuBl/Y2uWkVCZoHXCEZamhsTBurxEbpW9ftvcKeMLQVsz/Lzq+fxYI+bPRVDaeIEF/A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794219208;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=LMxr9ki7f/VVJlU1j8Yy99WFuI+TG0AZMPCiWvQ9I9Q=;
	b=Bk2tCAK/IlTThBgnoVMRk9NPQZ6KB1aHjhMQCP2zLCl95kGsmozfCbW4mVYDKRFs5GwC
	 NqIDFdFR9o3UF4WM49E6NpijSEP6dlDsjFNr4uyQFBYTqIZY6h84ng+Y5P6exIB18MlTD
	 M588d6Sz5PkgK/alTTW3ZLYRSJY5CxrqC6+5Wb0DgYZKQuC/Gq0dEIJZVJ084ADoPid21
	 zTX8hDP3dxKb0/pD4YQIhXmaRVQwsQFUgWhMJs5Xm0QK74xVSqpcP+lNcH+orZUXkINwk
	 e9sBwhd4O3teZcPFcMYxkIz4OEOY/bhaqLgIixf3wDOmM5+7xXpxLePRvwf4LOWSBgg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YBMxlsS+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672CF606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 10:13:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 672CF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=YBMxlsS+
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b547d6c07bso738437a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 02:13:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794219206; cv=none;
        d=google.com; s=arc-20260327;
        b=hFRcOa0c5dHD0H7nC8E0TxACK0812oMobIarW2AK1WeGAE13Ie0GNuu4paUqhc/has
         rC1FlFDJcB4JMw6H4EJITXR0MKBSzcWPYRivZI2c6oIllS4J4mPNioLHGleAYVfOP7l/
         gMpiuTu19ZAWSeem6Qh82YCE1JCU8L4w888yHWZdXkYhmozAMJ7Fep5E1ITHtisjoiqd
         i61bwd0FOHr7SsiLRhsmyMcmEEc1XyiDBdV7cXDkUJKSa/0po8zlSP61EMuEcvXWO2hw
         HtYDwkjW5RCLLoAukpppU+0d4wNYba8j7ZOHPx+CvlNaNekzyoMLSgbTUn3ik9FShNBr
         6Pqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LMxr9ki7f/VVJlU1j8Yy99WFuI+TG0AZMPCiWvQ9I9Q=;
        fh=Dd8tQCYxRFsjNqJHUiQ7EaKtmiak4kEfb7b+hQdg7OE=;
        b=Atk68kRxUMIkKyu71l+lS8t28J90QPqLb5TmQ1SBGtc47ecxke08LcJ5Vfl1NUqv3R
         jEsD4x1OOBJPkd/Iz8MSu1LKDlUw6IjPreBw+qePOtbkZp9IqjZfb7LWk85MXcBmD8+B
         +Qj3C9Wyd7YL2iqSdk1mO5FX9W5M7LtbfKTvCGXchvonoVMCC+fcQZPhwpfMmBsERLQx
         oY2PzQ8VeRm2e7GIeg8qQ/Jx7b6S0qSZwy4HW3SHEAFVkut8RFSCtoSz/H8Ilf/1p8wo
         Yxo+GvbU1G1Ln3+wVYF4RzjONmNroMujX12H4JRFAdrxqP5HlMt17SjNrpT6V/wYxVqX
         E0jQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794219206; x=1794824006; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LMxr9ki7f/VVJlU1j8Yy99WFuI+TG0AZMPCiWvQ9I9Q=;
        b=YBMxlsS+sO5qgAMmkEit/iQlYwvEBZodgmTS7rSd2UR8OFYQH73Zthmy9yQm+Hfcba
         viXh/L3mZAdSD0XR996i0TK5LAjGVX0mlbbsD5c+gw3/Kz57Mn7Dud2LW3Bb3g2WaZRb
         4PAXhtdOsgrAzcD0lGMCzzFV6rtOAjnfUVK7AMKkZwvilwKbtM+gp6y2saZFItAJkZxM
         YB1mnoCIxUUw0zkQDdPOBIoj3aNIpVyHbfMf5tm/a/74BDwvgBqQCMkRN5MLnriehuZ6
         j2BCHUWp0WGkDcy0DaSgLTf/DN2nr26T0Wvd2SayyU6LzOkIPzZY2TQivqmEmbHQq9dy
         Qk2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794219206; x=1794824006;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LMxr9ki7f/VVJlU1j8Yy99WFuI+TG0AZMPCiWvQ9I9Q=;
        b=vLXnpttHi0XTvt39SQNMYvENh8Sc0FzxQChTIEmV0qPtnUvK8wv8eISJ+8FeC9fl2G
         cJUTc6eBTEAGCcxq4YjNc1ys1rDI7CvvlLBAKQ59JLi92ABTG2KpP7A4FQw+h779nD8y
         r+ZZPAw77Ok+sMWh6BBwcPzMLv6LkOh7W4XLc9n0hJ8KDfP/jy0QgtibIb+S0t9MSDJV
         RoaquBH/5/LmG06SG4NX9rvzBdNwQ9Cm7WM2zfiO7RQY4N+5+Tdx8Hm2L8ElA3EL4Ou6
         muAHnea412+q9jY+TWVgS165sFU/D9F9mvJ5FFlSAf1tPUNgrZsb8zLzDUh/dkjx2eX4
         npug==
X-Forwarded-Encrypted: i=1; AL+hErGpBDSQUhJtYFo3eyhsKNB9lN46LxhOVwFlpfnrXjrUpjCmAytUzb6FcdsXlAJs3EInbTgFNJuG19rVmso=@vger.kernel.org
X-Gm-Message-State: APuU4Z+cGNy3Rp6HX4jxexgKpqMrAVJrWIHlVF+1nZJ2LnkWFXD0Qjvu
	qCJz00NypY2DmZzG51q+ztI2EfZ+4t91Pn4vdrKZxsOZNhYxp74iOsRjXWQ7JwYOUXq6NZHcKB9
	Lz01tz5JjRarCGrxMcdHoU4ietX36l0sm1viFVSkm+g==
X-Gm-Gg: AYBFou0AZ8DHNpVnSifqH11juZjFb1f3tSkTOVs8cQQNW76IjmSaE89OaoG+hcn4yBF
	aHtVQxz/xsOcNptoSjM5SkUGkQHIRWYNOmOmfC45mai7WmUsROkZc2Q/t5Iu6TAJO5tGguZhMEq
	TLoZg3TxaHG+13X973PYOedZS3nNbMQMute5jRRNZC3iGUZmmGhppan7QiCGR9AeWUaPH9mau76
	80miTbVtKkzrQ2bjiYCPrgiG0ysr8YCJYuySP3iHN6i9Zu4RIcScx/zuFNa474d8pVrJGjZxwje
	OvLXQZx79p94z+9CltSZOpDjddq9XMZ9fSioujAw9GnuYZiwQ2+kFxncFV7cPvjBVOfOSR3DTce
	3mPj3iJXqXsNKRLe8FZp3dVfp3TSYFYqstV1qAS3/PIlqYn8Mzi+K9/+dPEmVVEjov92M
X-Received: by 2002:a05:6402:2410:b0:6b4:e433:ee16 with SMTP id
 4fb4d7f45d1cf-6b7224cf3d1mr2611926a12.43.1794219205580; Mon, 09 Nov 2026
 02:13:25 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105165525.011876858@infradead.org> <20261105170157.616859418@infradead.org>
 <20261107113639.GK2668200@noisy.programming.kicks-ass.net>
In-Reply-To: <20261107113639.GK2668200@noisy.programming.kicks-ass.net>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Mon, 9 Nov 2026 11:13:13 +0100
X-Gm-Features: AclHuK8t9ssdKTvz30IPPOxmYsf3dAjidja76PJhcKYagTtf-hOZZOSnMaIcZA0
Message-ID: <CAKfTPtADXBuv4TfnVt+woL8Qz-8aX=wgnKTg6oiK=Tegw7cdyA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] sched/fair: Make cfs_rq::idle the sum of ancestor tg::idle
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@kernel.org, linux-kernel@vger.kernel.org, juri.lelli@redhat.com, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, 
	joshdon@google.com, tj@kernel.org, jakub@okonski.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 7 Nov 2026 at 12:36, Peter Zijlstra <peterz@infradead.org> wrote:
>
>
> Rather than keeping cfs_rq::idle as a copy of tg::idle, make it the sum of
> all ancestor tg::idle. This makes it trivial to tell if the current cgroup
> is marked idle somewhere along its ancestral path.
>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>

Reviewed-by: Vincent Guittot <vincent.guittot@linaro.org>


> ---
>  kernel/sched/debug.c |    1
>  kernel/sched/fair.c  |   88 +++++++++++++++++++++++++++++++--------------------
>  kernel/sched/sched.h |    2 -
>  3 files changed, 56 insertions(+), 35 deletions(-)
>
> --- a/kernel/sched/debug.c
> +++ b/kernel/sched/debug.c
> @@ -1090,6 +1090,7 @@ void print_cfs_rq(struct seq_file *m, in
>         SEQ_printf(m, "  .%-30s: %d\n", "h_nr_runnable", cfs_rq->h_nr_runnable);
>         SEQ_printf(m, "  .%-30s: %d\n", "h_nr_queued", cfs_rq->h_nr_queued);
>         SEQ_printf(m, "  .%-30s: %d\n", "h_nr_idle", cfs_rq->h_nr_idle);
> +       SEQ_printf(m, "  .%-30s: %d\n", "idle", cfs_rq->idle);
>         SEQ_printf(m, "  .%-30s: %ld\n", "load", cfs_rq->load.weight);
>         SEQ_printf(m, "  .%-30s: %lu\n", "load_avg",
>                         cfs_rq->avg.load_avg);
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -445,8 +445,10 @@ static int cfs_rq_is_idle(struct cfs_rq
>
>  static int se_is_idle(struct sched_entity *se)
>  {
> -       if (entity_is_task(se))
> -               return task_has_idle_policy(task_of(se));
> +       if (entity_is_task(se)) {
> +               return task_has_idle_policy(task_of(se)) ||
> +                       cfs_rq_is_idle(cfs_rq_of(se));
> +       }
>         return cfs_rq_is_idle(group_cfs_rq(se));
>  }
>
> @@ -15659,19 +15661,20 @@ int alloc_fair_sched_group(struct task_g
>
>  void online_fair_sched_group(struct task_group *tg)
>  {
> -       struct sched_entity *se;
> -       struct rq_flags rf;
> -       struct rq *rq;
>         int i;
>
>         for_each_possible_cpu(i) {
> -               rq = cpu_rq(i);
> -               se = tg_se(tg, i);
> -               rq_lock_irq(rq, &rf);
> +               struct cfs_rq *cfs_rq = tg_cfs_rq(tg, i);
> +               struct sched_entity *se = tg_se(tg, i);
> +               struct rq *rq = cpu_rq(i);
> +
> +               guard(rq_lock_irq)(rq);
> +
>                 update_rq_clock(rq);
>                 attach_entity_cfs_rq(se);
>                 sync_throttle(tg, i);
> -               rq_unlock_irq(rq, &rf);
> +
> +               cfs_rq->idle = tg_cfs_rq(tg->parent, i)->idle;
>         }
>  }
>
> @@ -15780,6 +15783,43 @@ int sched_group_set_shares(struct task_g
>         return ret;
>  }
>
> +struct tg_set_idle_struct {
> +       long idle;
> +       int cpu;
> +};
> +
> +static int tg_set_idle_up(struct task_group *tg, void *data)
> +{
> +       struct tg_set_idle_struct *tsi = data;
> +       struct cfs_rq *grp_cfs_rq = tg_cfs_rq(tg, tsi->cpu);
> +       struct sched_entity *se = tg_se(tg, tsi->cpu);
> +       int old_idle = grp_cfs_rq->idle;
> +       int task_delta;
> +
> +       grp_cfs_rq->idle += tsi->idle;
> +
> +       if (!!old_idle == !!grp_cfs_rq->idle)
> +               return 0;
> +
> +       task_delta = grp_cfs_rq->h_nr_queued - grp_cfs_rq->h_nr_idle;
> +       if (!task_delta)
> +               return 0;
> +
> +       task_delta *= tsi->idle;
> +       for_each_sched_entity(se) {
> +               struct cfs_rq *cfs_rq = cfs_rq_of(se);
> +
> +               if (!se->on_rq)
> +                       break;
> +
> +               cfs_rq->h_nr_idle += task_delta;
> +
> +               if (cfs_rq_is_idle(cfs_rq))
> +                       break;
> +       }
> +       return 0;
> +}
> +
>  int sched_group_set_idle(struct task_group *tg, long idle)
>  {
>         int i;
> @@ -15798,34 +15838,14 @@ int sched_group_set_idle(struct task_gro
>
>         for_each_possible_cpu(i) {
>                 struct rq *rq = cpu_rq(i);
> -               struct sched_entity *se = tg_se(tg, i);
> -               struct cfs_rq *grp_cfs_rq = tg_cfs_rq(tg, i);
> -               bool was_idle = cfs_rq_is_idle(grp_cfs_rq);
> -               long idle_task_delta;
>
>                 guard(rq_lock_irqsave)(rq);
>
> -               grp_cfs_rq->idle = idle;
> -               if (WARN_ON_ONCE(was_idle == cfs_rq_is_idle(grp_cfs_rq)))
> -                       continue;
> -
> -               idle_task_delta = grp_cfs_rq->h_nr_queued -
> -                                 grp_cfs_rq->h_nr_idle;
> -               if (!cfs_rq_is_idle(grp_cfs_rq))
> -                       idle_task_delta *= -1;
> -
> -               for_each_sched_entity(se) {
> -                       struct cfs_rq *cfs_rq = cfs_rq_of(se);
> -
> -                       if (!se->on_rq)
> -                               break;
> -
> -                       cfs_rq->h_nr_idle += idle_task_delta;
> -
> -                       /* Already accounted at parent level and above. */
> -                       if (cfs_rq_is_idle(cfs_rq))
> -                               break;
> -               }
> +               struct tg_set_idle_struct tsi = {
> +                       .idle = idle ? 1 : -1,
> +                       .cpu = i,
> +               };
> +               walk_tg_tree_from(tg, tg_nop, tg_set_idle_up, &tsi);
>         }
>
>         /* Idle groups have minimum weight. */
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -751,7 +751,7 @@ struct cfs_rq {
>         struct list_head        leaf_cfs_rq_list;
>         struct task_group       *tg;    /* Group that "owns" this runqueue */
>
> -       /* Locally cached copy of our task_group's idle value */
> +       /* Sum of all ancestor tg->idle. */
>         int                     idle;
>
>  # ifdef CONFIG_CFS_BANDWIDTH
