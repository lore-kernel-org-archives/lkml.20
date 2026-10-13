Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5216337A83D
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791880634; cv=pass; b=SvA9RniLkrOHb/2xlaLRAwOixOHyIPLHJKjZ2DPTe3tYqBe9altBecFqk3edVY9qYLrcfB4kCjMzXQ92l9ZbNkf2c885LBSXzZNJMy9wkByiy7VnkeDfps1BLz1UAMwNr+lXT5YiVTu6FnW+e1Re0qCF85K9WJ42njXcqq/LjJc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791880634; c=relaxed/simple;
	bh=p/FzChmi4upnJrdMVwLZpWpxlcBieJP5WKAtCkBTRTk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W3zJMbI9Uf9nQjhR5Eklillitji7rbSy6ftH+9WUdxRQjJS6bx2s33rr1X7Yo5+XICXCLLqrepQ6AIW/MoVk3tS7tH20OcDv6msj46wYIcQHLWyw8zDyEEcGw0SZqZC/ddZIZMPvWnn0QlalTeyZUBHl/ZOqPeWREfU4L7lsAVI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gk/No+j3; arc=pass smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gk/No+j3"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c2e8c710847so326207466b.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 01:37:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791880631; cv=none;
        d=google.com; s=arc-20260327;
        b=Q4LU++4Cv19aBfWcWM5AacVvx2VLxY4hVREOaPrX78y6flOhx2IXQqwqtN8aCBBt2r
         3xsO0nMXthV07OpUa5rcEnrvMu3zQZXeedydR0mLOK6bu0Ai5BoA0hPyItTCN1o/yucF
         5RQlrPbjUbGvtXS4NgvxW9b24tq7LPC+4N87hESghv73i9BtPwH3YSDlVNGl7oOjdF7h
         j3kvw4lpt/ARRMuVTopZsYbAF9RwAVhLlRKlmAuMlLYdcRywrzT5plV1RmoMJc2zUGYC
         tCT4+52JvT211itsT9A28BXSgaj/fFs4pvBJb6zZkX0JU9dXsQTd1rF8GyVDo0n2rYzK
         sbVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=eb78s18KrLxqoSvMPWF0ioQcnzWT1guQsNFzi33wXa8=;
        fh=YgoMG/8dCPgeE6BtA/t5ddMnVDZAlbEcnLRJYXvWqMY=;
        b=p4nmrs9VS3K6wWb9HRkVU+CxsqH5c6MA7AOwCNunou7qRC6t4ZEdccOY0mFcf6jCKy
         mGbdeQegMQ99S+fdXmuFTdBCeAI9supEHkwr18/MQKiLIw+A67dKM19jhffKpFF8vFJD
         VHfRmtYAkM/yfgbFHWnB9W3Vih9bNcMc+Jmah25MRsgniHuvvw5z3QB82zy7K9BYaKNH
         ZxyIs0Bc1Ow0RA5dAzpRrQXuXz6jY8dwX2HxrZSJqHuxXRfkbJJjyC20LzbBnJQ+igc+
         Bal5SnPRo4GBQvlQTvi1M1ThSVGHzyipnhRIdTfhWxo1ooU9/dB2bEY2J/JlzuIQ0hcZ
         mOJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791880631; x=1792485431; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eb78s18KrLxqoSvMPWF0ioQcnzWT1guQsNFzi33wXa8=;
        b=Gk/No+j3KrMyO4tDJ98wcybAsHMekBFvlGZpEmriX+A+rGJD9+8J7dZP1iCEca93+y
         eCSq1HpHRp6ktGLj8ieddozj81RKYb17WtRMoK8Lvim7/PZns6T8QXtU4HzR/AV0vRJQ
         ZqyE97IcOGHm5cyE474i16J7JOl9mFCbBvEAakafvb1WJE20SOnXnSpOSOkiY+pAQdXa
         kFvsRg7r64TJtmKqQInjhSd4JCMvQt3zJKRj2zXg2AJBXaQLtwk/+YelpebjxTyMfJZO
         0tr2bUBgDGtDohEMnogZEs1/nHAKBk95g8N7g0vu+CMF8dqS38mThAtc3bEaTOzIFCPn
         +JLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791880631; x=1792485431;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eb78s18KrLxqoSvMPWF0ioQcnzWT1guQsNFzi33wXa8=;
        b=ZHHBst9KOIyGWkaQqpAfDQitc0+Aivqjy1qGrQ4wFWGp/A5pa9BZt8FWFPd8kXKB50
         2hGiouPplrDGyjxZTlF8VjQs+ULSTkOOELu4fgg3xBuo1enFLLGOrt09V3gD4F3rcTfX
         UuJYNmjFWmBnlIR0mh6BxEDjOyqkotEwMu7UXOabaYfrgIKpOPPs4Tr/UJ2T7XKrr+Gl
         KE3bH3zXGCp0h85gBA9cqx6BFvDz08ltD5GuhRNpex7Zulv0UxLl+C50yOjUUU+6IzG2
         2ytK+lSgujrSMdw1mZRMlzHUTZ0HTw7+6LIHY8+zcbVXyn82xVftrWjBaip5vO2ozs3j
         gmZA==
X-Forwarded-Encrypted: i=1; AKwUvByoiqCRsKO5uZY/5WV5nkSJH67FADKVuEAJ9SH2dsjSk6qUGVxufqab01QTmShMst+OchI6SEIkbGgG1x4=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6wtYk+InJcBgp3nlBpOLEXr1nrmBb2WPSk0ALbHbZh59++LK9
	/TKIvljYztWeNDfI91XG6lCpfaFBB6eb7XJ3oVHOxbn7lAacUW3VwK6juuOUoJ0oUjMY/nxlffh
	mKZEAyK4xWq+M8QvoL0spAlLwCRiKH+i8Jd3ZuEAeMw==
X-Gm-Gg: AYBFou3yXeIL8fU4j6Kk/Dks+yfmznLFNT0Sj2uNzz9jq/lGMPWsVRx/zium6wWUanF
	fnsXl5M93pzkRE06bx/XHZpXi/EPgg27NMQcn1V8HK/XVcpvXsRgDhengm1TE+etf4IsrUzepEk
	HbI5/21gD2j2hij7R5uO2SEvGD+uVmJsCmB7Yq1ixe4Bj7zR58/iTNaFRU1wsMY30rBr3E24alH
	PTLMlgRu3rXpZ8NFDNn60XMz7MJwviqX15lXYGXciMKbmuWpYq6GU19h13NaxSN+hmiRwfbumqv
	hEMn/p8AkQ0couPfngiyc4Wra2Cuj2nQrxK3ZE7mEqyunlb3SNNFGXGEluFQ1jPJSonAWg8/a1A
	Jvd+156XXA8RZ
X-Received: by 2002:a17:907:968f:b0:c31:8c48:e18b with SMTP id
 a640c23a62f3a-c31a9afb3b6mr1199868666b.14.1791880631361; Tue, 13 Oct 2026
 01:37:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <8fa7f795-518c-4507-b684-60b0c1cac2c5@paulmck-laptop>
 <b2dd8374-63d4-4b04-9e2c-f6a84728f092@amd.com> <69622916-cc8a-44d5-b776-6e25f79aceda@amd.com>
 <CAKfTPtDz35egMZEVz+wb5kytgVrv7APcVOYBkCByvzPSCH7Meg@mail.gmail.com> <49bb195f-a193-48fc-b818-41e2178b8537@amd.com>
In-Reply-To: <49bb195f-a193-48fc-b818-41e2178b8537@amd.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 13 Oct 2026 10:36:59 +0200
X-Gm-Features: AclHuK90JzApac-HezP5krnOLz2c9UI9-BqfmhIxvoIuljBgmo0-n9-rT26Jgtw
Message-ID: <CAKfTPtC+ta9=QA9C8oiYeSZAq9PbcbwPTH5bcGhPAsaTnDUpVw@mail.gmail.com>
Subject: Re: [BUG] Apparent lost wakeups
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: paulmck@kernel.org, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 Oct 2026 at 10:31, K Prateek Nayak <kprateek.nayak@amd.com> wrote:
>
> Hello Vincent,
>
> On 10/13/2026 1:28 PM, Vincent Guittot wrote:
> >> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> >> index 0f63c30b4324..b37c771c41ad 100644
> >> --- a/kernel/sched/core.c
> >> +++ b/kernel/sched/core.c
> >> @@ -11256,6 +11262,9 @@ void sched_change_end(struct sched_change_ctx *ctx)
> >                  if (ctx->running) {
> >                          /*
> >                          * If this was a class promotion; let the old class
> >                          * know it got preempted. Note that none of the
> >                          * switch*_from() methods know the new class and none
> >                          * of the switch*_to() methods know the old class.
> >                          */
> >                          if (sched_class_above(p->sched_class, ctx->class)) {
> >                                  rq->next_class->wakeup_preempt(rq, p, 0);
> >                                  rq->next_class = p->sched_class;
> >                          }
> >                          /*
> >                          * If this was a degradation in class; make sure to
> >                          * reschedule.
> >>                          */
> >>                         if (sched_class_above(ctx->class, p->sched_class))
> >>                                 resched_curr(rq);
> >> +               } else if (ctx->queued) {
> >> +                       /* Check if we need can preempt the current task. */
> >> +                       wakeup_preempt(rq, p, 0);
> >
> > Isn't what we have for ctx->running above what we also want in this case ?
>
> Ack but with a couple of exceptions:
>
> We may not need a resched_curr() on demotion since the queued task
> isn't running.

I wanted to point the if (sched_class_above(p->sched_class,
ctx->class)) case. I agree that the demotion case is useless if not
running

>
> For a queued but !running task, if the promotion lands at the same
> class as rq->next_class, we'll need to do a
> rq->next_class->wakeup_preempt() to check if we can run it now
> which is also covered by wakeup_preempt().
>
> The ctx->running case seems to have been optimized to avoid doing
> an unnecessary resched / wakeup_preempt() calls when the current
> task is still the best choice.
>
> > Then sched_balance_newidle() will detect it with
> >
> >                  /* If a higher prio class was modified, restart the pick */
> >                 if (rq_modified_above(this_rq, &fair_sched_class))
> >                          pulled_task = -1;
>
> Ack. I'm depending on wakeup_preempt() to set the rq->next_class
> correctly on an upgrade and as you pointed, the newidle will then
> force a RETRY_TASK.
>
> I hope I'm not missing anything.
>
> >
> >>                 }
> >>         } else {
> >>                 p->sched_class->prio_changed(rq, p, ctx->prio);
>
> --
> Thanks and Regards,
> Prateek
>
