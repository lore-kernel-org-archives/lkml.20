Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794863578;
	b=fC0pyqdJEN6NMA3uh7kqwSXIZ02bdjpCbxndmYyTKmp66OyG9CyQ3WVJnQxZKcc4skNt
	 YneqHYEEnMfNm0DT+U1hVJh/Z6P9YkPNxPwC9OPkOXz+KPGRtBJAe15TOmQF2fYe67ZOt
	 eDpJ969Ag7qO1nwZVsahGBt6H7GE8Y3ao0H7/ZyEaEwA6dRkDLl0fm++HmT4WWOCPyp5M
	 OHEmBCsuOq4N3BHyMIlVdxibyWo9JLYSvb1NnbxjKkC+9KK3z1jPgLQicjtrPk2yUWOIR
	 v/4o7ri5OyXlHqZLoPcajsV/zzunw1O9S+eVs9VetJEdVZJB2azEzFgz5wPXVDrnmzw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794863578;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vUMcYZu8lnBV4gY0KqIbv+nHEJCCLnO086QAfkL8hgo=;
	b=N/+u13ZMbgq+S//ketE2hKZ+po9uiHdHwbyGVz6qQBFvwQP5d4DOC44e0GRFRxIl3aC7
	 CQxTb6FAOxmZFfcMs3mtvH4RlITUuoRvPvN9yWokjEk7aGwoG3szaO8WYS75Wwr6dFDoT
	 fZBy9u9ZdPBSnDq/jbUCQYqRBsK1u+SXBONArZpG7babCJjDS4pRnDDqPBX7dUdM2Hc3X
	 SQ1rp4YIaY6cjg20q7BgQfDk1GAiGVsnmFqgZj5IOyp4Fmghl/yRMRi92GysOm52QmjtQ
	 U3TvzMDV1HfN7yN/ynVLKNsTd7FeRtkvd7cQ+h0N/IGayS8/Mt7dI/g7GKfK1WSpxTw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fMBYHCzd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0276606A881
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:12:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0276606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fMBYHCzd
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so14640735e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:12:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794863569; cv=none;
        d=google.com; s=arc-20260327;
        b=nG/c0SABDKuY8RycIp9rEO2/GJoHHHmNvFgW6CY9yzRfYzdKvDpKeigddPoLOE1mP+
         8EdJi/o2tgymodsP+6dx/3l1SMyY+ip8326K/QxyxWAsicjReGFakmCBYDibi6y4l8L2
         tXh+1LJZiv71PgMPsOaUnzKQuuRsi88NhwlmbpP+ObBAaO2EeTXUmBSAiuIhw1G2utGX
         Qbot061Dhb6w5mJKMO/piGuLGD76mfidP9E5HpV9cS+gDU7KTha0/fUth1gitRLcokvK
         41bdc8TfKDVrp7znt5umf9Otq1Q54/gnF5fHIsE4NxF6GTvrQTk73g0tBtDbHRbYrAiB
         Ue7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vUMcYZu8lnBV4gY0KqIbv+nHEJCCLnO086QAfkL8hgo=;
        fh=CmANLPuudkqIFqfsusnzRiOqziFK/E8GHOTr7mNSGKM=;
        b=dVPDxmN7U3xcEEubkhGMOUWaYkCx8MoEqxjjRuXhhn0hgxc9zVG+8BXr8fe7KADfLs
         Pa+MKyEIn8qPOlUCYK8A3cBi9mQWAEfR9/6GpYlW5Fv4Ju+se+vF1fWXoedzn3JUoDZT
         LCLrynuNKXkrnMcN6vi5ki/j4ZjBTicauh4PPDE4GhKbXPdGONMsEv4BKR9J1meFMbGL
         jH+rLWhfcOpIFVJUxW/R45M9TXojWT2Lm6RPYmG9q+ikIHXr581jn1UmzciHqs5Mz2z+
         r/Kib+r/kwpK4TGVy/7S3uiTvpd0pzDSSqzOyi2Y9LQxWrynkbSei70S9m01RgrI0JNj
         PNeA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794863569; x=1795468369; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vUMcYZu8lnBV4gY0KqIbv+nHEJCCLnO086QAfkL8hgo=;
        b=fMBYHCzd06LovLLME8aQkedzRHJ0gmu5w/QBtnPIt1dTWaNPaVtltJl8CUKAcz9FZt
         71/dY3X1H/P2TJaKxoUUFJ69cAEK4+oO5A9Y0b2HuFWEwDzgj6f9PERh8G5TAPVDlqoP
         O/nWM/NmlE57cMxf2ac9/GZ1wSqwL5FueF/KlWiUOK9EIt0OtSbaPX2g1Fl27HuvUZjB
         ld1jpajZRLGfz1oiX301P87gDF+Ik7RnkYHw4hG8PiNsgl02KAn6c4mwLLpruTR9i/N3
         Az5680TsGBWRdoqZoBns26Z7ySbt3WxwN9KLrzMrfVW6zCpmtjU1UiR5rZ0P8Sm9M3pJ
         kQAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794863569; x=1795468369;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vUMcYZu8lnBV4gY0KqIbv+nHEJCCLnO086QAfkL8hgo=;
        b=XM9T79YOkDM1QZkGCJLcdgNGqGg2IG8cpIFZhy69FbsE7yDr3HRUywYLFk3rKFGreo
         cP6dHFulWHaM6Ym57iLCS3TkkS5r6i0KC/vL2G2aXtJ6I9qxEnp803Ae8xfkEBoiJ0bg
         CuoTjESakYPyLAzFugeSh6DKYaeCO5e3Mea9Qd+tBeaCdPLEffvDOYIw4YnXTvmRNcxJ
         rcb5EZwLBwQFdCmelpwmAMRuSx7ocmIKYfit7fsYROtl2IKCMrnX3qsL6auV09+J5Ck3
         HWyTKk/M2SPG2WG1/QFS/dilHXZ5t5UZq91iBlnKxNQIUpdZ/fmOsYWGGHqcKdIURE7d
         vh6w==
X-Forwarded-Encrypted: i=1; AL+hErG63j4qUe/4ZBidtOJIPRzElUokpiKLcTiEJHDz5CqL8CYzS7DBhbV9yIXJHGfMhVfEmFkeLBU+47+abdo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9lC+V8eraFrDUPttJeTUiR1OEFBycgM8l81Mym1YhDp235wS55
	NXnNV2JpHOUq/1T5+TkyntHe6ORWr1gutapmI+p/vFHPaw854XVw6UMI2Sh4nZvQPuhCQ29ZQuu
	wq6vMrAGIqJmg4NA4mrLOWS30VqcjAH9G2tzEM4U=
X-Gm-Gg: AYBFou0RS/uS0oqjzk5KyxE+a5i99WpWHxSI7sUT1kVE18QUTbitzpRsAUXZC3RJPxN
	PDUOCMfovGDl1VZWoOZO9fipVWEMs0YpfJ06SxRV1LujD6ZJTkcuD7zrrTDg20Bv3XcZoGZ4WSN
	6REli4t/OJ+gX7YLq2qJpTmzyN1ApFVMX2rMhcUmU50AgPxPtCuK9GyYF4p+VCLMyj34gE+YNUl
	gMYcXjL33f1VGlq1l5W8LtkhvEDBGx9rIC7Wf3HE4F3NU4kFpfkfb9ZscyNQWTbjeSKwaxOEKBF
	MFBjenbHF5IoR5VrjhCCDEBBIt4hUWU7bxP64mjXCs/UXlsaD7ol0+JxN61502ZYzE2w0wj/yPt
	B17ubtCzGr2eFBdXPMbdRMoAoGchH5OWDAIR5qKgp8IFUleabY86Y6EEi1hF832zb++ETICBcO/
	xBJhWoFKSybUc/3p01cEvDho8yTHSpFPHIQaORLzrrF9nZh/9JiUEZ9n9YoLEvJKkU0rGIbYI1l
	FVYBNWN9Ws548wOYM03aPn8Lvbpg+eC4mdMzz2hVQdspc/EibaP3w==
X-Received: by 2002:a05:600c:8b82:b0:4bb:6814:7391 with SMTP id
 5b1f17b1804b1-4bb681476a8mr151902015e9.25.1794863568642; Mon, 16 Nov 2026
 13:12:48 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116192638.233125-1-mathieu.desnoyers@efficios.com> <20261116192638.233125-2-mathieu.desnoyers@efficios.com>
In-Reply-To: <20261116192638.233125-2-mathieu.desnoyers@efficios.com>
From: John Stultz <jstultz@google.com>
Date: Mon, 16 Nov 2026 13:12:35 -0800
X-Gm-Features: Aa3M54pKctKGXB1zsDszLWVjgZbbqKABzvcHoB3xDMhImH51M6VYE6PyFT3QX8I
Message-ID: <CANDhNCqmsDUC1hx6GnB_2ROQ2rYm3wKYfnbkVAuAjecducsSsQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1 1/8] sched/proxy: Reschedule when a blocked task is
 woken under a proxy
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: peterz@infradead.org, mingo@redhat.com, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, linux-kernel@vger.kernel.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, 
	connoro@google.com, arighi@nvidia.com, akpm@linux-foundation.org, 
	shuah@kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 11:26=E2=80=AFAM Mathieu Desnoyers
<mathieu.desnoyers@efficios.com> wrote:
>
> With proxy execution, a task blocked on a mutex stays on its runqueue.
> The scheduler can pick it as the donor and run the mutex owner in its
> place. When the donor is woken, the CPU must stop running the owner on
> the donor's context.
>
> Commit 7918cf369361 ("sched/proxy: Only return migrate when needed")
> wakes a blocked task in place when it is still on its original CPU.
> ttwu_runnable() then relies on wakeup_preempt() to preempt the running
> task. But every class compares the woken task with rq->donor. When the
> woken task is the donor, it compares the task with itself, and no
> reschedule is requested. Only sched_ext handles this, with WF_TTWU_RQ.
>
> So the old owner keeps the donor's context after the mutex hand-off or
> after a signal. With a SCHED_FIFO donor nothing bounds this: the owner
> runs at the donor's priority until it blocks. With a SCHED_DEADLINE
> donor the owner consumes the donor's runtime.
>
> In a test on one CPU, a SCHED_OTHER owner kept spinning in user space
> after it released the mutex. A SCHED_FIFO waiter then ran 800ms late. A
> SCHED_DEADLINE waiter ran one period late.
>
> The same would happen when a task in the middle of a chain is woken.
> proxy_needs_return() resets the donor only when the woken task is the
> donor.
>
> Fix this in ttwu_runnable(). When a blocked task is woken on a runqueue
> that runs a proxy, reschedule. The next pick walks the chain again. A
> blocked task outside the donor's chain causes a harmless reschedule
> too.
>
> Fixes: 7918cf369361 ("sched/proxy: Only return migrate when needed")
> Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> ---
>  kernel/sched/core.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index dc270a23179d..326026ba0b2b 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -4057,9 +4057,20 @@ static int ttwu_runnable(struct task_struct *p, in=
t wake_flags)
>
>         update_rq_clock(rq);
>         if (p->is_blocked) {
> +               bool returned;
> +
>                 if (p->se.sched_delayed)
>                         enqueue_task(rq, p, ENQUEUE_NOCLOCK | ENQUEUE_DEL=
AYED);
> -               if (proxy_needs_return(rq, p))
> +               returned =3D proxy_needs_return(rq, p);
> +               /*
> +                * @p was blocked and this CPU runs a proxy. If @p is the=
 donor
> +                * or a task of its chain, the donor no longer waits for =
the
> +                * task that runs. wakeup_preempt() compares @p with the =
donor,
> +                * so it does not see this. Pick again.
> +                */
> +               if (rq->donor !=3D rq->curr)
> +                       resched_curr(rq);
> +               if (returned)
>                         return 0;

I need to think on this some more, but my gut reaction is this feels a
bit too subtle or possibly too broad. Particularly the check being
done after proxy_needs_return, but before the exit, it feels like it's
leaning too much on a non-obvious side-effect of proxy_needs_return().

Both the comment and the commit message are also confusing, as if at
the start of ttwu_runnable() if p is the donor, proxy_needs_return()
will have called proxy_reset_donor(), setting rq->donor =3D rq->curr
(and already calling resched_curr()).

So it seems this patch is mainly trying to handle the case of a
mid-chain wakeup, where p isn't the current donor, but is in the
current chain? I agree that looks to be a problem, but the donor !=3D
curr check just is testing that we are proxying, not that p is in the
active chain. It could be previously blocked on a different unselected
chain. That said, this may be a good enough approximation (especially
as doing the donor->curr chain walk feels expensive).

Though it feels like maybe the check should be pushed into
proxy_needs_return() instead so it can be more clearly aligned with
the similar proxy_reset_donor() call?

Or am I missing something more?

thanks
-john
