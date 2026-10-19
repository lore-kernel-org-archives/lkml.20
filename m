Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792433890;
	b=h6w1tzHxmZKZfMms3gZyWdWyWZEV2yl66HiAx8Kg5b8xU1WsowpGyKDmvaKMOMK9xGSq
	 0VFazy/kvj01x6V55jFdHoGBTN2Mg9Ne5orKO2QWw+gVOXp+QuQfQxnUN3vv3ABXaxGMt
	 AcJv3Rpz874IcLRXE+qsvDiMo26SAmTXovmCCBQ7woQ0GMGnOLFHIltD1QVaMploWn8do
	 WjuODM7bDj/qbrbXCmH4CpJY5CKxkSJZEYoXDBPiCCV1mb51OMOAUYMDlrBBHiVnzNqzK
	 V0A1tmWnQ/Iu9X51kPElKJvGnog/9FC6ZDnievqtXBntPffERzEBEBx9wcsmLVaGjfg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792433890;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=AMpq8scepCZJFIF7vkB29sciSmmD4/TgW9qbpDyJo60=;
	b=W/n65LKcKRlsm3BHU2p26mZlEmGfE5zda1K2QSTnpdJHhF6c3iFpBk1bTgDiWG7E/7GN
	 q3uEAu2K7x+hTaaO936PYMLL3lo+2r6Z7o8CWbOp2xezTt21wWkP2jWwQ/c9ui5XmnsJr
	 qz1K/8hM5OsNwsSqt/8/QPS1+oqwlmuPVEKLK3AVxe7415OjoKMU/gxiczsA9xJUlY0jv
	 qyRNrq0OROa8lC0kESRTeqZ5ArBIq1Gp/n9fwYwCILAccJCEhHye9gZeaKbTaMC8bpNBU
	 PIO32yRKdsTv/TzWZsCjG4u/kn9++7BkCwG/Ca3J3TlvrLvXO+XnqmFOG9f1KaPP/eg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=O66TplZs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB67C606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:18:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB67C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=O66TplZs
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b1aa4d71e7so2322856a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:18:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792433888; cv=none;
        d=google.com; s=arc-20260327;
        b=k3Y6FlAm4ftreKOmJKQF2cyjSy+OctOZQ2z0252vnit8r1jDgweno58T67YivcTb9I
         92cIQYkGJ8tjRaXeBlEDbxfF+X5cdQ/CquWLISadzg73AAdkZkgVyx+S7IR2lBKxIy3u
         TbHd86D2GcPvqIFk3Lj4AqSeAIb0eHJ4lb6FV/HYL7UuoztM2C/pA6MP1p9Nn4sHvs5N
         19CQBkSiukcI85G9SXgvDwrKigsKnwbz7I2kMpKhkOll5qOzPrCl4k6J8A/FUhVy9CUD
         1BJhw4Nrg3UaqUT3/ormnEZoCyyr9O4LQdbS+5sWUTdZRhqaB4mR5R5H69h/6Cy+nhq2
         PCbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AMpq8scepCZJFIF7vkB29sciSmmD4/TgW9qbpDyJo60=;
        fh=wWGzjo9j63P5X06xo36nnZykv3olQsyNQ1T58SfbZaU=;
        b=fpCqTp2Ymue+1TRWOQ8eiOQS/ENWO7e/c46RQQ1WzFIwR5XnX7MGTc2vFUf2BvFkZx
         ynhVbZJB2je/IiYWhs693hbXRFys0zhCr6uVG4hO/h2thvzVlEQTjHKzvrFeS5wVqsvj
         TXjFaAwZuACj/36kFzc1CUENBVMLxxI1Hwzia0oVgRVBw1NcqtMAFksSmAR4gxkMfS7e
         6UKv74iKGeeJkMrSwZ1WZNIJrHVQ+eCVydYXUtep3D5Ci1vDIdu/wvm5ut33eVEP0pBM
         +OeJR9+MJwkAFiuGBgIujVSwu1wuOtLhSn3zRsvA9tmdC5Ex0IC+IsO0MngwiU8Tq9Py
         aR3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792433888; x=1793038688; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AMpq8scepCZJFIF7vkB29sciSmmD4/TgW9qbpDyJo60=;
        b=O66TplZsYtUPecwtKiyMIErhS4EgMFQZiYjmEPuZc7rWIdfnaadprimP7Wj0JvKYHd
         7LT7JSMek8dUpZhqpoS3eLcLVyICzbxGA33S6p83RQDRSWCWyAJB2uwyDe0aaJrkQPrJ
         21cpp/YbLJdRdlMVYyfM84IgnlfLvbyuQ088GuqteVqR8a5YVjxs2vIEAcNcRIPnh0+Q
         Fu8AaLUpraNPpjroNxfeC85Iao5TMoI31gLArNG3YAnpmcEPJn5XKVKjSiCtvfBtvU5B
         lQ7yz6bgQn+h+U/LImJhWjca9fDh4tUX7UYCDfTlw+xChgLJxrFDVi3fdV2ukypiqAht
         rSwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792433888; x=1793038688;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AMpq8scepCZJFIF7vkB29sciSmmD4/TgW9qbpDyJo60=;
        b=ojIhJD6deP6EI5pfXbHHK0u6iu6JB7B9EblNrk+q8I+JD7RPL8LpWSCHHiGDwJ5JhW
         obxxduwj/pIwb57Bmd2+pgDexv7JtMLqg8oPm7KG8NQuwemL5VtjMIYueIhRZ2p8fipM
         B2E53SP5udImWMyCkd7pHXuXHQb2K8C/7Vas1zHMhxKAsnrqombWSvhFoaIuQcyUEcge
         PWq0Ts89ZXV8sHhWbO1NYLEb77AmKHTsGo2NOPjUqD+hGq1bWzVcR97bmjUZ2KJ6P24w
         VXGXK1Yxp0qQenby+Pa68PF7D8PL5BbFdKIoJT1Wz2Cj6o1B55zJPOZwg8mhu1yufV87
         AOGQ==
X-Forwarded-Encrypted: i=1; AKwUvBzSjlMwcDGSSPeS2+jEGSpWQeGfunZGDsYi/of2IdLP4Jh9e6iQmEulAioTtCqptstcWT1UwxxPmicyrEo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKr+wYerG9nhy2TN6Zr+rUg0uV/42+MA4GzU9xiQ8dSMi+yMoIS
	Mpu6XDVlGewg3JGGUjqAtHWjsOqOE7+31KXrA9y8KSVXXu1LaW4k+zn72xP4ZWBs2A/3uPTSWcY
	96SIg2kzo9bf65u5b/C2VGxCXLA5RpQ4auLaINsbxFA==
X-Gm-Gg: AYBFou3gCHR+23cWuaECpxnq6zuNm0+iN6dZ98p9q7RQyGhtl3AhuFo+cIpSB4WmZdc
	T7teJP0VrDlzdjzX98He6m0EFc8yLaXRtbOTzzS8jOz/ttgWsrywpfNe1sr+e/ljOf2pAnCFbqm
	iY1vX294f/4+vDULOdE1HLonl83qr0GPCkuQX0o5VFFHRKMlwgR07zH58T297VT7gezKbkipTh+
	+qyI3HCc8hkHqkNgZv4RYCoNCK0GiPAVtA8zpcRpU2ayUXn38Pm/SjQV2eDCX40wGXIyLIgvxIE
	reEud9DZoJYywCjOHu97jv248DKu+/TAct0C6lhUV9MgblV826sebFq7k+oK2PfmbjIXEc8s9oa
	UuMd0DaKOGmQ=
X-Received: by 2002:a05:6402:1d4a:b0:6b1:ef6b:f3e4 with SMTP id
 4fb4d7f45d1cf-6b3a8176404mr5105193a12.14.1792433887978; Mon, 19 Oct 2026
 11:18:07 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019181611.1461433-1-vincent.guittot@linaro.org>
In-Reply-To: <20261019181611.1461433-1-vincent.guittot@linaro.org>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Mon, 19 Oct 2026 20:17:55 +0200
X-Gm-Features: AclHuK8pcb1z55IYBFb9qBSmAibg0ZQJjuqDdIoxrmx7AMiXVR6pWAereysgFdg
Message-ID: <CAKfTPtCL-eV2WGv+KeK1xAwgmNFiqK2dd8BqVxd=JOaMFvw7Gw@mail.gmail.com>
Subject: Re: [PATCH] sched/eevdf: Fix sched idle task group preemption
To: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, 
	linux-kernel@vger.kernel.org, jakub@okonski.org
Cc: longman@redhat.com, tj@kernel.org, hannes@cmpxchg.org, mkoutny@suse.com, 
	cgroups@vger.kernel.org, jstultz@google.com, qyousef@layalina.io
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 19 Oct 2026 at 20:16, Vincent Guittot
<vincent.guittot@linaro.org> wrote:
>
> Even with flat hierarchy which puts all runnable tasks in the same cfs rq=
,
> we need to parse the hierarchy to check for sched_idle task group.
>
> Reported-by: Jakub Oko=C5=84ski <jakub@okonski.org>
> Link: https://lore.kernel.org/all/58dc8e8a-7260-43ce-aebb-8d9c29a6afc9@ok=
onski.org/
> Fixes: 85570f10a4c6 ("sched/eevdf: Move to a single runqueue")
> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>

This was sent too quickly. v2 coming soon

> ---
>  kernel/sched/fair.c | 81 ++++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 69 insertions(+), 12 deletions(-)
>
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 0f2364479f9d..20c33d13a5e7 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -433,6 +433,38 @@ static inline struct sched_entity *parent_entity(con=
st struct sched_entity *se)
>         return se->parent;
>  }
>
> +static void
> +find_matching_se(struct sched_entity **se, struct sched_entity **pse)
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
> @@ -476,6 +508,11 @@ static inline struct sched_entity *parent_entity(str=
uct sched_entity *se)
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
> @@ -10129,7 +10166,35 @@ preempt_sync(struct rq *rq, int wake_flags,
>  }
>
>  /*
> - * Preempt the current task with a newly woken task if needed:
> + * Preempt an idle entity in favor of a non-idle entity (and don't preem=
pt
> + * in the inverse case).
> + */
> +static inline preempt_wakeup_action
> +wakeup_preempt_sched_idle(struct sched_entity *cse, struct sched_entity =
*pse)
> +{
> +       int cse_is_idle, pse_is_idle;
> +
> +       find_matching_se(&cse, &pse);
> +       WARN_ON_ONCE(!pse);
> +
> +       cse_is_idle =3D se_is_idle(cse);
> +       pse_is_idle =3D se_is_idle(pse);
> +
> +       /*
> +        * Preempt an idle entity in favor of a non-idle entity (and don'=
t preempt
> +        * in the inverse case).
> +        */
> +       if (cse_is_idle && !pse_is_idle)
> +               return PREEMPT_WAKEUP_RESCHED;
> +
> +       if (cse_is_idle !=3D pse_is_idle)
> +               return PREEMPT_WAKEUP_NONE;
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
> @@ -10174,22 +10239,14 @@ static void wakeup_preempt_fair(struct rq *rq, =
struct task_struct *p, int wake_f
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
> --
> 2.53.0
>
