Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794831350;
	b=BPI0OEUR42CZ74SWVIn9mHyujO6WRMCadW8ulCAAV/SRr9JeNXyugKOm7xHZQo8tWIsm
	 tsGzd4rLnfxFlnDF91RHiftN2/ywlSskRb/LTmvmEI0q5D6YTg/Opw8lM5aevexSxiOk4
	 SjroF8AMwsMmzAXVPPq8rTGGnZnB9Lu0pEmwYNePAC5fy1Hi4XyqXSqp6uwyzdBWDEo7g
	 PLZ0IhptZbUTiLs6+Q656fJcn4nE7PYQe5AOfvvB9sWIo1daXS9KYYNAEKOS9djjHBksI
	 rEX14U4y1n1mYI8ThAAbwkQYcnz2cPS8u8QUuyQLFWrUOObAw3SNdW39IBBJFYw5AZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794831350;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:In-Reply-To:
	 Mime-Version:References:Message-ID:Date:Subject:From:To:Cc:
	 Content-Type;
	bh=ROkfmFkCEa5OIFKf/9b0vPQnDi/FW8gyFD4jyAwtTT0=;
	b=BMV+yoF2PxxWWja598eBEFHlvpJSRS0GQMBRfG52qiCtp6K98gvu1LWVva8uq0qsasz9
	 dwAHdHfN+4Jlvz8h/UhzQCyDP13oawCa3Yds46nTeAqkKxLBy22J6Rv99DaYyrn12OFlB
	 lPMkU1b1JS8AwfIyZ6e1LoK7+0Tatjk4kgow33n7nRjovfRBNS+QKQscY+AOIuJxHwsDg
	 I3RX5/DkOOu0+ZoLG9pHRxxta4GPj9CVYqAhznrU1HC4Ig06xTGE2QTft2cu5arzq9+GQ
	 iOIYNXApTqRZ8ZBqZZwmEBIAK5e3R2O28SdC14/u4glAZP3eWknnOxbY1HClSwranEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--chriswiseman.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TfhfYBJf;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0C8606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:15:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D0C8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--chriswiseman.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TfhfYBJf
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36efb506f29so2826476eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794831349; x=1795436149; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:date:message-id:references
         :mime-version:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ROkfmFkCEa5OIFKf/9b0vPQnDi/FW8gyFD4jyAwtTT0=;
        b=TfhfYBJf+c8MqEUYZY6Uqrfq2OVq+8KwkUbzDkPffS2By2QN/V33A9ZOF1TIzK50Qi
         cmrdy0DAtEAzbDuUJgd6Qe4uOgXZNvYjseIrWLec4RY+uEQdDN7elxj16g4J3xE4z7GR
         1XYfxMDHwv4+0wz6ZwFs87I3qbb4ufJcJ9gIY0fUkKSYnbKOHqYq0z0t+V1qlj8qrvFj
         5U+t/MQ14JhFnQ57suPaEgGpVgwrzS+HbzAiO0aaTDwN4cKb6Me31znXyKCc0IRLNxxl
         Ego+Gz3rcjT5ouex0kB2qqm8uvgMWZF+xZmlmt1ckizkTy1bbDJHRdfQonf2OSJ3xuqP
         ePhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794831349; x=1795436149;
        h=content-type:cc:to:from:subject:date:message-id:references
         :mime-version:in-reply-to:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ROkfmFkCEa5OIFKf/9b0vPQnDi/FW8gyFD4jyAwtTT0=;
        b=w7oThWWtLvVvC2rmw4FAI1Sju8sEW83JdeM6r1n7IT+oJjs5dYubyGLb/GHeJcG5cp
         yPISmexrvI+SpHdNs3uBTQxs2YmsAFsk/8eJcjgSHTeN5jAkanexxSAF9vCU8U64sSah
         Z2Qr7UC9hpeLzQAix2iA1xMbluIsJlDpihTur/qjvD8p61DzPu3/zbraMLEmRjeB8aiu
         uxi1g0uqtnJwwP25AW6jQz9rKWZVgv9irZGwvUTEfL3Y5tIXR7b7FRxEEnFEn68uE7RV
         3HL2+LywbakP8wqNkeaOAhNFh2rqavsFkDfm8zRr9JnUf1VEefhqWf1fRo3rpP6jPN4a
         KEog==
X-Forwarded-Encrypted: i=1; AL+hErHBnhPA9baNsb50kZP9BARM0w1k1v/xJGtI/kbg6XBLVpq0sOEpRXLrs1+i8aAveUdAKYK5GnNLFVSgh2Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z93StwwY2UHD1hf5T+OuUB+ZCzh7vOywSBUlGiVEiGcdAaJ9wrF
	c/n/t1Af22SX4khQoThBkhsvCeqJ6C38LwVw6usoFF+DB3KdJSwbNTKKKdeVptr+9r545cqaolO
	i6X39++Z1C/TlUkdRP4T4gfQgGAexlw==
X-Received: from dycuc24.prod.google.com ([2002:a05:693c:3f18:b0:369:dd6b:ac5c])
 (user=chriswiseman job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:8b:b0:377:5cb:a534 with SMTP id 5a478bee46e88-37965da9681mr11085279eec.17.1794831348075;
 Mon, 16 Nov 2026 04:15:48 -0800 (PST)
In-Reply-To: <CAKfTPtDooueKfU_OORqM-1NNt3KFR1MmeGENnfFbn=NF+_hgPg@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <18e837a02ddbadb6.3137322e32332e3235332e313736.1b3220.0000sendgmr@google.com>
 <CAKfTPtDooueKfU_OORqM-1NNt3KFR1MmeGENnfFbn=NF+_hgPg@mail.gmail.com>
Message-ID: <18e8859a05695ccf.3137322e32332e3235332e313736.3ba773.0000sendgmr@google.com>
Date: Mon, 16 Nov 2026 12:15:48 +0000
Subject: Re: [PATCH] sched/pelt: Skip redundant decay and divisions when
 sched_avg is zero
From: Chris Wiseman <chriswiseman@google.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Qais Yousef <qyousef@google.com>, John Stultz <jstultz@google.com>, linux-kernel@vger.kernel.org, 
	Chris Wiseman <chriswiseman@google.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Nov 2026 at 12:29, Vincent Guittot <vincent.guittot@linaro.org> wrote:
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index f77e722..83d3928 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -11538,6 +11538,8 @@ static bool __update_blocked_fair(struct rq *rq, bool *done)
> >
> >                         if (cfs_rq == &rq->cfs)
> >                                 decayed = true;
> > +               } else if (cfs_rq->tg_load_avg_contrib) {
> > +                       update_tg_load_avg(cfs_rq);
>
> Normally the cfs_rq is removed  once it has been decayed which
> includes tg_load_avg_contrib so they should not be updated
>
> This is because of your change which prevents updating update_tg_load_avg

Good point.  We only needed that fair.c check because returning 0 from
___update_load_sum() stopped the next pass from clearing
tg_load_avg_contrib.  Still returning periods from accumulate_sum() lets
us drop the fair.c change completely.

> > +               if (unlikely(!(sa->load_sum | sa->runnable_sum | sa->util_sum |
> > +                              sa->load_avg))) {
>
> why load_avg ? when load_sum == 0, load_avg must be 0
>
> > +                       sa->period_contrib = (delta + sa->period_contrib) % 1024;
> > +                       return 0;
>
> I would prefer that this to be included in accumulate_sum before step 1
>
> Wouldn't it be enough to skip the decay_load and
> __accumulate_pelt_segments in accumulate_sum but still return the
> decay. And in ___update_load_avg() set the *_avg to 0 instead of doing
> the div when the *_sum is 0

Makes sense - if accumulate_sum() still returns periods and
___update_load_avg() sets *_avg to 0 when *_sum is 0, we don't need
load_avg in the check either.  I'll send v2 with this.
