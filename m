Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794269444;
	b=zFYh21amszgJAFHpc/hzz7QmDSaK+yg/0XzNjK7cZ3llYLz7z6miWIOD/6EXEIhbMilR
	 3frGKFNgJ63E8vD0fNbA5coeljMnduKvTgcZxDrWLrvlv3RtJkZSlVt1/NcQlnAKMKFnW
	 v0tATRDfoebmIu9MVR+WQ/PWwA6R7dlNI0W8ACOY3q6bf1dtOnDmReCoDeiCmLdlJX2IJ
	 bD2GDorq/3Or9EYBoT4E/8HKLTb0t+negVFYBmIHrMtCipTsAm7bh3eDrx1HCVLnpkVjQ
	 hsbI2eod8S+rTmdcPPuzc5dlOtfHKjQlzVPvdIiVT6U6Qr8tPGSBodYaO7ed5cKuaVQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794269444;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YoTBgLKY1RO3EB4wiKJQUW7GRv2s+45Ma8rjPtw0clE=;
	b=KYecSH4jSlN1BwW8P2ghxhTZ4lywjD0TcpDqSvA/eSkTv1ydSIiNY4qnkHIPMybQNEkr
	 uUurzrCPxim9RFYEYTNNTCC93OFjusH+ZlvLcH2iP8OonKmFLeJhxiyOeQqfTLZLn4yRX
	 sfvWPpcD7Qja4zbaOoU1OROOd/AFNAVlFK6uOoeSuUTUYG3Kbzp25p0xGpJwzwfukPtxy
	 CYrg3dlstczqGST70Vn66KxaIzyYSAExtgqEiF3A56/R7uzvweBKXQl+YdmbLPgvEmyIZ
	 fjVjGM+iky8mrVU/BcpfndrP4chLVojcb0DlZQR0hfQwWMaBrcCZIhOiVAK37yVXO5g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Z4zcH1zm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.48
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E67606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:10:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6E67606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Z4zcH1zm
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5be58ad9600so1674e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 16:10:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794269442; cv=none;
        d=google.com; s=arc-20260327;
        b=jb2dy1as4Jvv8/uW3ykklJkklXmH90bEAJeELOJ3/2S5MD4dX3EmnQhlPQhnobX1hX
         dwquukgsIQvr5I4eze9/rUm7x7uuh2f35qGy2woOY8ZkOWNljl9qYpUvLC9hfurJuvDf
         Oh1BCpKd5226wvWk1QV/ZhrrvK708IH/v4BbU1mXePFexEOD+2a7jtw5YoBUAy0GYHhJ
         eBtK9Vb2d2RSyUxvL6r9fkxCz/jOISyjMZlQzo/SnT9SE75wet7/lYxKaM7gChl1/HQ1
         N5CsXp8WYVFsNe0DMBomgFT7tPgSwNBCEEv97OP/n3yl0K+yv6ybtsu+trzd3nVG5wCI
         irhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YoTBgLKY1RO3EB4wiKJQUW7GRv2s+45Ma8rjPtw0clE=;
        fh=TTfLwT0/4FIz357aUm+vUUxxJb+fBctc7j4Od7AmdaQ=;
        b=YWou0eehOOUD1e5JljuxCK6uLrwMYvhpXTvUElfiD6kSuf2AxohJ72/PMtm3NJcPW+
         Z25xqZ1sO7RhwtEUW8P0MWHuU1Q7L+4wPDx5SmIU998/ziWO4N1PoinsIhNWJrlQWtIj
         wLSPp/LojjyjA8it1+959w6Jy99EdBHYYgPPNftRHNbeYxFrtMQep/ZuWIDTx2c+PxnN
         C1fOrCCL6f8n031HwAG0Qwfm+jdrZWxbWX39zDnqdpcsa+hRHYmDitCbYKj+cMDwHfrm
         1y9budNzgftIRhbqkJYqbVdRCs3bFGsLy1IegZx4u3u0MQnOZhyzySaxo53dNHWsjG56
         x8Ng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794269442; x=1794874242; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YoTBgLKY1RO3EB4wiKJQUW7GRv2s+45Ma8rjPtw0clE=;
        b=Z4zcH1zmX3bh8mwAU4R2ewZUpkeSSts6M0n+w7bU6fAVzeHoCd07tj/JyBwjxruu3M
         TBAssm7ntfP9A/F1NfMm4/pW7IzHS539CyHSUkLLWKUDHfeWaW10EBhmGK0J7HPQGnGC
         deWa6r/2DBxuF3a1A0X4N0xsDV6ETwmnS8+d2dG8SgIFS8bRsxvoGiVFJxGXdAgGYsxi
         YQ5WgGBMjFlvnDFkhA6otnPKZJwxdRvw+UR6VkZEIx77oayEMCgvBMdY92AhNBVvmjZX
         pguvWnjdmuTBTMu+zP6rt91hotZQ+1fwvu+KHUz6UBb1V0Rk3bay4LpVjhqJb7+SSU8q
         /pHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794269442; x=1794874242;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YoTBgLKY1RO3EB4wiKJQUW7GRv2s+45Ma8rjPtw0clE=;
        b=f+UYrcu2PWilsg5aLZE5eK+8iAoDcRUxiJ8rQODEMmxzdgBM/B6t24GbSykfiBKXr5
         eRdG1wh11mnUROH11+okKQ3t6AC7Y/1L7Cr+xulqZ+aSXnNv0rAfql4FlOixtBMtM4Lk
         WCOHUHG6l0VNVCxWKWk7B+BqtHwp7MiGGYAxvbOonY24Yig16+l4ECZz0dqRmquV9LQ6
         CnXG+19daxRRYWsR0aBUAajL7m5lBZh5UU+/0v+lhxwuWDfkQ093QzXqo0O6lcsxmH3v
         LDdmd8jPudZ+wJo15Wq0B8cGNEaRB012xtZ4/HEErLC6xdULDKwcMvl8NzTeyi7jJc3f
         9D2w==
X-Forwarded-Encrypted: i=1; AL+hErF1IFhNndM2WPAvv+6q+XMle22mm/WaYr+m3f5z7LaPZwvpK2uYfGSKs/vSVu90isn0cunP7iDlsc0VSfs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4estEQhWP/cNe2TsAsX4y3JCymIhckfTaB4NOVqTTWpRbNTD9
	rO9L401SsSZNwsYEA37QpE2aMKlsl+zEKX2om68+on7hQouxNZtyXftwJsu8MHk6Y3S8y1X1kWt
	lh5XHb5c1bWVRwhR+EViBy3zpI9+iCs/1H3KkkLgr
X-Gm-Gg: AYBFou3SAhH5OZZiVmJgMqtMrpvF4Z8Vy8bA3rp9VGs+TmJVrqYBGyTtB9cHt0Jv9af
	+QxFp27CfP1Ji9qtaP3UmBO65RRgD+qIS+/qcdUeAU3wK1EgwyNdjBvlZp6C7dwPisaxhtWm3Bm
	kI7YZlhAKaHOjQfwwRTu/rbhrSHcNWjhr+C9LBKTIxvONsbXmxvBU7gkdZFKLkNgNM5XLDh7Erl
	d05MvaRSYn4yijq2gVkTm/GKbkxyzEaDsfQZwhYSdk48s5NcP4WsNmE8PATAG3O/fByNUgM9hfl
	TNjRZ7wLpyrPqyLjPH6yYX77mXAB56Q0WNn/b4UevmqC6ECnTMU+k5Vq0bHI27IBKdzvQM6EIlM
	SYXTS1o95HJ4oUyEuQOBZl+jIeLHSrVU3y3SXoAf9K9mwvAv4SYK6jznsIpVJ3mpfuvlkvL/Cxv
	pe9me2XqqtkUw8O93JFIVWsO8=
X-Received: by 2002:a05:6512:31c3:b0:5bf:ec8f:c361 with SMTP id
 2adb3069b0e04-5c157dd8fbbmr43272e87.14.1794269441611; Mon, 09 Nov 2026
 16:10:41 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105165525.011876858@infradead.org> <20261105170157.765325702@infradead.org>
In-Reply-To: <20261105170157.765325702@infradead.org>
From: Josh Don <joshdon@google.com>
Date: Mon, 9 Nov 2026 16:10:30 -0800
X-Gm-Features: AclHuK9dWR8s0cm3bwcvnYaAUlC4b8YNpM-Aum_tTu0YEpIXpt35k6zvoqtGQyA
Message-ID: <CABk29Nujsg7FNY4yJ3Yd0maT0GEtvxacUWvTDiT5HD=-YVqTvg@mail.gmail.com>
Subject: Re: [RFC][PATCH 3/3] sched/eevdf: Fix sched idle task group preemption
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@kernel.org, linux-kernel@vger.kernel.org, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	kprateek.nayak@amd.com, tj@kernel.org, jakub@okonski.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peter,

On Thu, Nov 5, 2026 at 9:12=E2=80=AFAM Peter Zijlstra <peterz@infradead.org=
> wrote:
>
> From: Vincent Guittot <vincent.guittot@linaro.org>
>
> Even with flat hierarchy which puts all runnable tasks in the same cfs rq=
,
> we need to parse the hierarchy to check for sched_idle task group.
>
> Fixes: 85570f10a4c6 ("sched/eevdf: Move to a single runqueue")
> Reported-by: Jakub Oko=C5=84ski <jakub@okonski.org>
> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Link: https://lore.kernel.org/all/58dc8e8a-7260-43ce-aebb-8d9c29a6afc9@ok=
onski.org/
> Link: https://patch.msgid.link/20261019182622.1584454-1-vincent.guittot@l=
inaro.org
> ---
>
> Changes since v1:
> - fix prototype and cleanup unsued variable
>
>  kernel/sched/fair.c |   87 ++++++++++++++++++++++++++++++++++++++++++++-=
-------
>  1 file changed, 74 insertions(+), 13 deletions(-)
>
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -433,6 +433,38 @@ static inline struct sched_entity *paren
>         return se->parent;
>  }
>
> +static void
> +find_matching_se(struct sched_entity **se, struct sched_entity **pse)

Thank you for restoring this :)

> +{
> +       int se_depth, pse_depth;
> +
> +       /*
> +        * preemption test can be made between sibling entities who are i=
n the
> +        * same cfs_rq i.e who have a common parent. Walk up the hierarch=
y of
> +        * both tasks until we find their ancestors who are siblings of c=
ommon
> +        * parent.
> +        */
> +
> +       /* First walk up until both entities are at same depth */
> +       se_depth =3D (*se)->depth;
> +       pse_depth =3D (*pse)->depth;
> +
> +       while (se_depth > pse_depth) {
> +               se_depth--;
> +               *se =3D parent_entity(*se);
> +       }
> +
> +       while (pse_depth > se_depth) {
> +               pse_depth--;
> +               *pse =3D parent_entity(*pse);
> +       }
> +
> +       while (!is_same_group(*se, *pse)) {
> +               *se =3D parent_entity(*se);
> +               *pse =3D parent_entity(*pse);
> +       }
> +}
> +
>  static int tg_is_idle(struct task_group *tg)
>  {
>         return tg->idle > 0;
> @@ -476,6 +508,11 @@ static inline struct sched_entity *paren
>         return NULL;
>  }
>
> +static inline void
> +find_matching_se(struct sched_entity **se, struct sched_entity **pse)
> +{
> +}
> +
>  static inline int tg_is_idle(struct task_group *tg)
>  {
>         return 0;
> @@ -10130,7 +10167,40 @@ preempt_sync(struct rq *rq, int wake_fla
>  }
>
>  /*
> - * Preempt the current task with a newly woken task if needed:
> + * Preempt an idle entity in favor of a non-idle entity (and don't preem=
pt
> + * in the inverse case).
> + */
> +static inline enum preempt_wakeup_action
> +wakeup_preempt_sched_idle(struct sched_entity *cse, struct sched_entity =
*pse)
> +{
> +       int cse_is_idle, pse_is_idle;
> +
> +       cse_is_idle =3D se_is_idle(cse);
> +       pse_is_idle =3D se_is_idle(pse);
> +
> +       if (cse_is_idle || pse_is_idle) {
> +               find_matching_se(&cse, &pse);
> +               WARN_ON_ONCE(!pse);
> +
> +               cse_is_idle =3D se_is_idle(cse);
> +               pse_is_idle =3D se_is_idle(pse);

now that se_is_idle() is checking for any ancestors with idle, this
doesn't appear to be correct. Some motivaing examples:

Ex 1:
regular task and SCHED_IDLE task both inside an idle cgroup.
se_is_idle() will be true for both se's, and so the regular task will
not end up preempting the SCHED_IDLE task, which would be the
desirable behavior (the task is not idle relative to the SCHED_IDLE
task)

    cgrp A (idle)
     /                 \
regular_task     SCHED_IDLE task

Ex2:
more complex example with a hierarchy of cgroups

          root
            |
          cgrp A (idle)
         /            \
     cgrp B           cgrp C (idle)
        |                   |
      task_1            task_2

task_1 should preempt task_2, and the inverse should also never
happen. However, the matching_se here are cgroups B and C, and both
show se_is_idle() as true

I can think of two simple ways to fix that, either seems fine
1) use the existing se_is_idle() check for knowing when we can
fast-path skip the whole find_matching_se() business, but when we do
find the matching se, rather than use se_is_idle, use a more targeted
helper that directly compares just those two entities without any of
their ancestors (ie. for the task case just check if it has an idle
policy, and for the group case, just check tg_is_idle())
2) once you find the matching se, just compare the ->idle values,
since if one of them is bigger (by at most 1?), then that one must be
the "idle" one relatively speaking. Handling the task vs group case
here seems a bit messier compared to the first option, so my
suggestion would be to go with the above

> +
> +               /*
> +                * Preempt an idle entity in favor of a non-idle entity (=
and
> +                * don't preempt in the inverse case).
> +                */
> +               if (cse_is_idle && !pse_is_idle)
> +                       return PREEMPT_WAKEUP_RESCHED;
> +
> +               if (cse_is_idle !=3D pse_is_idle)
> +                       return PREEMPT_WAKEUP_NONE;
> +       }
> +
> +       return PREEMPT_WAKEUP_PICK;
> +}
> +
> +/*
> + * Preempt the current task with a newly woken task if needed.
>   */
>  static void wakeup_preempt_fair(struct rq *rq, struct task_struct *p, in=
t wake_flags)
>  {
> @@ -10138,7 +10208,6 @@ static void wakeup_preempt_fair(struct r
>         struct task_struct *donor =3D rq->donor;
>         struct sched_entity *nse, *se =3D &donor->se, *pse =3D &p->se;
>         struct cfs_rq *cfs_rq =3D &rq->cfs;
> -       int cse_is_idle, pse_is_idle;
>
>         /*
>          * XXX Getting preempted by higher class, try and find idle CPU?
> @@ -10175,22 +10244,14 @@ static void wakeup_preempt_fair(struct r
>         if (!sched_feat(WAKEUP_PREEMPTION))
>                 return;
>
> -       WARN_ON_ONCE(!pse);
> -
> -       cse_is_idle =3D se_is_idle(se);
> -       pse_is_idle =3D se_is_idle(pse);
> +       preempt_action =3D wakeup_preempt_sched_idle(se, pse);
>
> -       nse =3D se;
> -       /*
> -        * Preempt an idle entity in favor of a non-idle entity (and don'=
t preempt
> -        * in the inverse case).
> -        */
> -       if (cse_is_idle && !pse_is_idle)
> +       if (preempt_action =3D=3D PREEMPT_WAKEUP_RESCHED)
>                 goto preempt;
>
>         update_curr_fair(rq);
>
> -       if (cse_is_idle !=3D pse_is_idle)
> +       if (preempt_action =3D=3D PREEMPT_WAKEUP_NONE)
>                 goto update;
>
>         /*
>
>

Best,
Josh
