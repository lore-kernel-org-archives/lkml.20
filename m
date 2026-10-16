Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E964D367F23
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792164635; cv=pass; b=may9sOGaqG/0kZc9wg6Z9nRnIba016JttfhC8cNxfJhLe9xZbhYOFfxC35IPkMGDjnj4hJmT67CcphQ2lIW1jkn6/zQCf8zy1uWg8h7uNHH43Aw8UruXT9GWT+GKK1Iy4cPjebGw6oSBFH+ZbKIUBSmET4sD2//Kuv2erYJq9xA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792164635; c=relaxed/simple;
	bh=F1Wv6L2hnOxiXqVJDmRlBU0mcdarwD6ieffQdz6pD9U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lyUfT6P46k7YkquZ9ITFKu8jnjTt7Q5RH/AcjzYY2vdGRhMeVvQjx2iYKZoOWGAfS2lhT044Q1De0Wbw5V8LEd/xY6YY0DXtoy3e97TSnlmbusezOaU40LM2wDFGKo8c+S6ffp7+0tnIQkRNBbkzgEQmKWl9/sFaouEw2ZxBsy8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zv1VKbLX; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zv1VKbLX"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c414e5d282eso3775966b.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:30:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792164632; cv=none;
        d=google.com; s=arc-20260327;
        b=FiORs/YW6JLypApPAs+AmfQu165JZTgfyJdt0339kteUlCzSwicoW0ULX4j4W+vGKk
         s3HH+GmJKwL4Csi3tLMZowMqa7YOLdKTiTEM6Eg1QaB+c2txgoOj5ps3dVBojO+e84VQ
         KtAxpAEIH81Z5VPI7TsnegBKLw5VWlAxQMRLmm45E4GCqxggQOSGP9FT5OlN7q07suBV
         BnPPELgTBsQ7XnFqQaZ6ceOnpGtS95EdV8KHLaBRBGYYnt8nxHUhObQPkM4mao8/ark8
         eBMDgFyaFy18lG9rlTnii4xiSeHMtjLUnA618kWP1pL8QGCIpddxJAq1LogSIw1DFmZq
         MMRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XHOhcUwtA54AersqoC3FCLzikv2TiEzTzaos3TgbYFs=;
        fh=V4iRDsIYcGubl4QViVYrMCGuRpfP4TeuwbUAqysDFbU=;
        b=rWAChIjPu0Yo1eL3W1a5DyNM0W5+OpirdDxlN3FagiVK5jMdolWA3XfmzVZdkovAbk
         DC4p5U40TBwlvQBmI/8ulnY64gwhZG05QhkLBiJKB7eYN+eX0u34lPn+4d/IbWcQxIbI
         nT15O8pVMEoDyNBKaDfu2M7D50TWy/3HWIBGPQigHgm1LYOjM95Hwu6eSaxBr91YXHwl
         WFo93NZAVWGUj2ZWo+6wIezzJ2vYDsxt6pZrxexzwZqxQ7wLCmOBIYMSGdkigAgawr1R
         JQD192zjAZL5qWUnlEPukAgIv2S5gitore+XEUXW8sFdnQs7to+ZQ6KWKl2du0TemxPt
         6QjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792164632; x=1792769432; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XHOhcUwtA54AersqoC3FCLzikv2TiEzTzaos3TgbYFs=;
        b=zv1VKbLX49UFDr9leimyw4nNnkCou/kGKHAUmrvuIeL0GVsWz4QUL/kLqBG82byvQa
         EJHHbhX9EKxJess9Ip+5lTymXycNiMqY/pJOM8DzuVBCnRnvUtgDjESIPhYDsYT/Z4q/
         q4bNRhxG7QtV60+dlT2ZnqH3vrd6ZRJGRlRbpcHqqjkNa06EDsuZTFoYNSfffN3wsKho
         rDbJ7r7KCuG7shrM/Tqg8WHzXoA0wxbJLSlL88/TPxKs5HvzqV5Q/Uvr6uI8fGJsUmK1
         dopTdxR2lo7rgF3qzfdij1z9Jd6w66gdD8e+43DBAO3DdPy6nvZnG01z65v/G7d8sQhI
         skXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792164632; x=1792769432;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XHOhcUwtA54AersqoC3FCLzikv2TiEzTzaos3TgbYFs=;
        b=XLIpYE6lSzK5Y/Ni0AgnHfcsqgiqfKH1qVTtnj9Oq7+SLoXoSZ1kMx5ZBXzbFbivmJ
         DsbVKo81eTKwr/x8fXVRvDtsvxlfXq330ym90SX2suupd9nDjBncfVIEbek+xfFn5DlJ
         Hslmd1PNCu4TOUf0KPh7iGeC9yGP2OseyMLYq66TZJe3e+xvaATxwl9/WhIU87QEdpZ2
         vbTXmzGPwBRcGQQT6zegN3pHuYtCBnbV+XcwZ+VZoti6dOAV7Z26HfA/oPcV2MHlpZH1
         CzGtUeJQzlX6vBOjaSZK8w5TiY7hVN70R3F+rPcC6GhsYt+Sitz3Iux351bIEkXYXnBY
         C4EQ==
X-Forwarded-Encrypted: i=1; AKwUvBy6BFLgeKlBTi5sp8tvh/NRkJAl3VRYqWoVFnCoFUZSoR4mHfFuVw9wQ1Vz9I/QUA8AcrEDGIEir93+IuQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIaKs1thXcfkcRi95UwNmVCKeKyqEW/PR/kFYgdwip4kA0ACHXH
	bNW/aqZ5dfAu0so9Sx9PK6weNG/JYihvQH3rPTYv5hSnAY2iyNHVuRueWVZQn74pe/d7pViMjZt
	+diiIn4dwVKcMwMjbO2tg/9pRPXLbR+HOghoiF+65/Q==
X-Gm-Gg: AYBFou31Q0iEebAHO+bu3sO6jOuPySjpZmg7t6cPLKvxiO0zkgg2AhHyQPJY1z95rrj
	hjcryKm1mYO3+R8qcqT57DlEaoDtr7oBKhy6R5mqAoN4rM5NYvxFpmT1ZauncR5kw5GA1I3mdl/
	MVm0udH4TpDJmezdlY9VLtceHWvblUj8u0KZmEuU83DJANdcz6jZCJZjUwW130XSRB+qns/a/ta
	6u3H+ruXwHJfc/OLT2sv1bjfcB4iALTJILvEUcq4+PbdOvCHb67gFtCHYAw/NGTP3mt3HfStpXi
	HhD2wv7htooZ1zefCSXKxXI9vwFKISAr8Wugt9ZrCTbfxaerl5QpFO97c5ao9zBWSt+eUmCvQ6j
	ifJ7MvwXV7XUT
X-Received: by 2002:a17:907:d1c:b0:c2a:f7f2:b732 with SMTP id
 a640c23a62f3a-c41a06e717cmr10004366b.45.1792164632154; Fri, 16 Oct 2026
 08:30:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261016150402.6952-1-kayracizmeci@gmail.com>
In-Reply-To: <20261016150402.6952-1-kayracizmeci@gmail.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 16 Oct 2026 17:30:20 +0200
X-Gm-Features: AclHuK_o_rksoDm676qPAw6ntXbD6ERg5ZTvw2QeAJcLdXi5YTB-vIP-dgi6LH8
Message-ID: <CAKfTPtB04o_WSw5AXfwtPYizJwBUja3XzMrmQJUk5XXqqpvuhA@mail.gmail.com>
Subject: Re: [PATCH v4] sched/eevdf: Fix vprot across reweighting
To: Kayra Cizmeci <kayracizmeci@gmail.com>
Cc: peterz@infradead.org, Ingo Molnar <mingo@redhat.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, christian.loehle@arm.com, 
	elif.topuz@arm.com, linux-kernel@vger.kernel.org, mingo@kernel.org, 
	sh@gentwo.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 16 Oct 2026 at 17:04, Kayra Cizmeci <kayracizmeci@gmail.com> wrote:
>
> Currently in reweighting, while a tasks vruntime changes dead protection
> could go alive, or alive protection could decrease, increase and go dead.
> Fix it in reweight_eevdf(), and just cancel it in the sched_change_end()
> path.
>
> Fixes: 80390ead2080 ("sched/fair: Separate se->vlag from se->vprot")
> Fixes: bcd74b2ffdd0 ("sched/fair: Only set slice protection at pick time")
> Suggested-by: Vincent Guittot <vincent.guittot@linaro.org>
> Signed-off-by: Kayra Cizmeci <kayracizmeci@gmail.com>

Besides the comment below, this looks good to me.

Reviewed-by: Vincent Guittot <vincent.guittot@linaro.org>

> ---
>
> Changes v3->v4:
>
> * Change enqueue_task_fair() block so that instead of extending the protection
> in sched_change_end() path just cancel the protection if it is active. (Vincent)
>
> v3: https://lore.kernel.org/lkml/20261016084604.17999-1-kayracizmeci@gmail.com/
>
> Compile tested only.
>
>  kernel/sched/fair.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 0feec172fd37..61266c3a7f2f 100644
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
>                 if (!curr)
>                         __enqueue_entity(cfs_rq, se);
>                 cfs_rq->h_nr_queued++;
> @@ -8202,6 +8205,13 @@ enqueue_task_fair(struct rq *rq, struct task_struct *p, int flags)
>         if (!curr) {
>                 reweight_eevdf(cfs_rq, se, weight, false);
>                 place_entity(cfs_rq, se, flags | ENQUEUE_QUEUED);
> +               /*
> +                * This happens in sched_change_end(), while cfs_rq->curr == NULL
> +                * and rq->donor == p. In this case, cancel the protection rather
> +                * than extending it.
> +                */

what about :

/*
* During a sched_change pattern, current is dequeued and
* cfs_rq->curr becomes NULL while rq->donor == p. As all
* properties can change, cancel slice protection which is
* not reliable anymore.
*/

> +               if (task_current_donor(rq, p))
> +                       cancel_protect_slice(se);
>                 __enqueue_entity(cfs_rq, se);
>         }
>
> --
> 2.53.0
>
