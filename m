Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2FA380FEA
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792142146; cv=pass; b=mKVnb0I4WtSNOZKoae6sO95gsXxnPMCXrOo1b+Uj4b1X72VfzlewrslpoFft6LoVg09zajWacML9MLx2Geq+6lU3tqviXkxPn4DKfd4T0Gci2Q7G9fm5sAqZhhLnu8nXeY7yZPwvpooYSuXPAEWW0Kp9LZgTYMQQS0SaRRTIhMs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792142146; c=relaxed/simple;
	bh=McCANjMXuLyuKAXhf69kzJ08Kyp5GVlk0CAKvUJSIQU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pBkvA7fDYI6DZ035A/ykhIVWGk+fO4Oy1wp0YQ5X3oUdkruhELeTBHC8sB3dmDHPJERIEwmpI5Rzk/zNQQ4Ksbuifdk74Xk/FFfHCFHK9iYSWme8KItxc2IvPrXudf0gRumVmRGfS48j5VhokgCzSLi2sZm+8ENWaArzcHGLT4c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PyPYZads; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PyPYZads"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b1afcd2d23so7239818a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:15:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792142143; cv=none;
        d=google.com; s=arc-20260327;
        b=mUi1QUvHJutm3H9S7Y5+YJQRDysxZDLbbFbhTjwIARKVP1Glss7zJaaKyqxciihqdy
         1nuy0pN0Ldlwrde7pGw5oDKGZ0ZPHAvQcAxcy/dD90h0I1LbwP2PZKE5wCmbVSyrS5Hr
         OH0hgQxeVxz6EvlFD5eRalKkLPbThmb2XxyIDMOMOmrKChmGetuPjES5VdNotLW2VPnW
         1/MbTFj3TEKqxaHOOs7Pc235m2FpmDLjvUsH/p4OxFyquVKyNSv/4pM3/jv/FGpd4aPe
         X5eCv8T+UaHuaMs9q8mhiX4qc+cTr1bZkmeV1fBJ7ql8D43m3LSR6et0s8Tn5HneI6XV
         eq4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=juagPAAVwRc2TRgKj3pEIn0YvQUcJJWjzQqKzCV4PR8=;
        fh=KpjyNBR1bC6nBAMKl6CTqFaYZt5Ap7pm13HeoSwUFOw=;
        b=PDGZXlWQE/+ZPDoks5d+dqeDrgcw9IQeL5poSHM6iDtNb4uNtFUnYd1F/oJz6ZoLE3
         E6qAdsSp85oXpo0t5OopR9fgrViwliPU71YFvIyTl4s0tg/wxf7aCAS1vhckfxhIMJ+c
         enC3wuVissgt6RMseDrtZGkGdQYa8T2QvnDm9K39jklLE8wukLkB3QGdOS9h6BOe0Hrd
         dj7R2ss7bg5RUrnxHz8wSGwySSw1x+YFauzgtcl7I6sGqYVxWpb0LaN1QcoUDpKX3Prd
         lc38KYn1Y04FmWB7QErylHxBeUtkbDi65gFGxD5xCG//SFyg1ujhv7TnOyrqn1sHHnzo
         PCvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792142143; x=1792746943; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=juagPAAVwRc2TRgKj3pEIn0YvQUcJJWjzQqKzCV4PR8=;
        b=PyPYZadsccDa4sFjKBDIg1Ll8QjJlxBFkG0bvmCOufEmN7NBtCjbC3zuRwDCDn5UNM
         wgPiXlIKPPpuvYGGyJdJcA0sV/ZJzCGSlaEpANRgBS1rRd0pztF3OfGiUaRLPzaoT+6Z
         PbnWcZgWbS7HKbPUxgMtxb5M6vCDVBwyCIkioe89VUgddkkwyOPOzBdBQzBtUuXINEyR
         avdSyVo9m3HP9pptAGWlgRSq6Y28zBR0BUbzekVKzqVfp3HermhyvkLSxPOk9OQmmm/1
         t33kBv1GCo4rtKkdEuSnh0s++kGGM5CW1CQ5KMVguWxY8oMVGJUnmktdZfFFNktq+eBX
         HEdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792142143; x=1792746943;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=juagPAAVwRc2TRgKj3pEIn0YvQUcJJWjzQqKzCV4PR8=;
        b=hUd05HufnOd+N7RLojLnfmNG1FBOay7HMjMLFnWjl8SlPECh8YL1pgoUvnP4tdsw8N
         sqS4e5h9FC9yGbxR6HXM75CdH53CXX2CkaC8mgzoggQliY5r2IAGLg0OtsYmUYjRxesJ
         Rp/yrTw3fe3K3zPBLoidcJfkco20saugKzH14L/pOD2eoMduIbQY9nxYexgNWrfH0oal
         4xaOSQ9C0HYVo9fi0TCFhDmlOab8OcMIZmpf9Ofo43Z0NmENaeai0XXG6D5vRnhJpvR9
         8DOztTQ5Gt1riDt7UPQ1PRWUD3vnqXwn1nnMvAHWLPOJ0YbEIRnIY++pi3WKlY7SeC70
         UBzQ==
X-Forwarded-Encrypted: i=1; AKwUvBzEmP+okve2phrkh8Eg4kBE2sLrGzKbljlspfWpwuEMTJs+t9QZGUkFSK+muKNmDSmaAUh4HdJR0F++Q5c=@vger.kernel.org
X-Gm-Message-State: AFq9FYIyzTwF+980a3OE0IhkpkcP/HFEe3wfjZGlBJOyyNhWaxORqD+r
	07u/oav16Q2Gj6tNLYcvJmdgAdhHJYwtVNVRpmCmKwExJst8LIjxcnwaO1Itf4rnw890gQI7VtU
	VoEWjDA2YkSdjjMFORF+u3qP+41vRVVSI05oJRWOM/Q==
X-Gm-Gg: AYBFou0sb+sJXZefmQGIZrsfZcpMdi/9LPcgyCUKumkkKUvm/VIyobk8NudJDIyBn4+
	V+PWljv3L+7EHUCOhB+J1jsA+5o9V+KDWXTMXabZj8Mbt3+LkRtgoQctdHkMBPg2F+plJO/ncx9
	0K2zqhH8GOhNmsNr3OfRr3iba2Ok1WhCsJwBRG81wYND4EZc4Acp9RHhkv4Lv6GWj+to8m2i5p9
	AvLaChGNkIiqLTO07Pp/Xh0sd8FemAWzdfg2+VZcqZ5onOF6I5Efj/ShM/IM1/BsTWDi/PsZ0ZD
	Mmo4XukXiFBcUMwgwzRjqBEkKuTPedArmyHra/2B04QwjBryMPCmHZ2V1Amb2Kk7W6h67jt3h6U
	GGGnYSbqhpmeXng0rVQNg754=
X-Received: by 2002:a05:6402:a585:10b0:6b1:82e4:b2df with SMTP id
 4fb4d7f45d1cf-6b182e4bcd7mr13227779a12.29.1792142142978; Fri, 16 Oct 2026
 02:15:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261016084604.17999-1-kayracizmeci@gmail.com>
In-Reply-To: <20261016084604.17999-1-kayracizmeci@gmail.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 16 Oct 2026 11:15:31 +0200
X-Gm-Features: AclHuK_2tPzgnoCwRzN1fPX6R7OC24OdLswc-KOLCxOOfsZEtgrgvu1RUGhh7xs
Message-ID: <CAKfTPtBYSdrLe09hp3R0V1AgV_FY65mGaLxHUdLVhpZqU6KpKw@mail.gmail.com>
Subject: Re: [PATCH v3] sched/eevdf: Fix vprot across reweighting
To: Kayra Cizmeci <kayracizmeci@gmail.com>
Cc: peterz@infradead.org, Ingo Molnar <mingo@redhat.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, christian.loehle@arm.com, 
	elif.topuz@arm.com, linux-kernel@vger.kernel.org, mingo@kernel.org, 
	sh@gentwo.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 16 Oct 2026 at 10:46, Kayra Cizmeci <kayracizmeci@gmail.com> wrote:
>
> Currently in reweighting, while a tasks vruntime changes dead protection
> could go alive, or alive protection could decrease, increase and go dead.
> Fix it.
>
> Fixes: 80390ead2080 ("sched/fair: Separate se->vlag from se->vprot")
> Fixes: bcd74b2ffdd0 ("sched/fair: Only set slice protection at pick time")
> Suggested-by: Vincent Guittot <vincent.guittot@linaro.org>
> Signed-off-by: Kayra Cizmeci <kayracizmeci@gmail.com>
> ---
>
> Changes v2->v3:
> * Rebase and move the enqueue_task_fair() block to if (!curr) block.
>
>
> Not tested at all :-(. But I think
> This should'a cover the shced_change_begin() path same,
> since curr == NULL, so we always enter if (!curr) block.
>
>  kernel/sched/fair.c | 28 ++++++++++++++++++++++++----
>  1 file changed, 24 insertions(+), 4 deletions(-)
>
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 0feec172fd37..4593d0122d66 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -4892,12 +4892,15 @@ static void reweight_eevdf(struct cfs_rq *cfs_rq, struct sched_entity *se,
>         update_load_set(&se->h_load, weight);
>
>         if (on_rq) {
> -               if (rel_vprot)
> -                       se->vprot += avruntime;
>                 se->deadline += avruntime;
>                 se->rel_deadline = 0;
>                 se->vruntime = avruntime - se->vlag;
>
> +               if (rel_vprot)
> +                       se->vprot += avruntime;
> +               else if (curr)
> +                       se->vprot = se->vruntime;
> +

This part looks good

>                 if (!curr)
>                         __enqueue_entity(cfs_rq, se);
>                 cfs_rq->h_nr_queued++;
> @@ -8155,8 +8158,9 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
>         int task_new = !(flags & ENQUEUE_WAKEUP);
>         struct sched_entity *se = &p->se;
>         struct cfs_rq *cfs_rq = &rq->cfs;
> -       unsigned long weight;
> -       bool curr;
> +       unsigned long weight, old_weight;
> +       bool curr, live, running;
> +       s64 dist;
>
>         if (task_is_throttled(p) && enqueue_throttled_task(p))
>                 return;
> @@ -8200,8 +8204,24 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
>         weight = enqueue_hierarchy(p, flags);
>
>         if (!curr) {
> +               running = task_current_donor(rq, p);
> +               live = running && protect_slice(se);

IMO, "protected" is a better name than "live".

 se != curr so why is this needed?

> +
> +               if (live) {
> +                       old_weight = se->h_load.weight;
> +                       dist = se->vprot - se->vruntime;
> +               }
>                 reweight_eevdf(cfs_rq, se, weight, false);
>                 place_entity(cfs_rq, se, flags | ENQUEUE_QUEUED);
> +
> +               if (live) {
> +                       if (weight != old_weight)
> +                               dist = div64_long(dist * old_weight, weight);
> +                       se->vprot = se->vruntime + dist;
> +               } else if (running) {
> +                       cancel_protect_slice(se);
> +               }
> +
>                 __enqueue_entity(cfs_rq, se);
>         }
>
> --
> 2.53.0
>
