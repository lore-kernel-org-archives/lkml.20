Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794560812;
	b=TG7wSnacZPE7DAcCDFJQlBNnNdA+9aK1mnKDeXdIgRGtgrK/1vP/KygBm/M5mRQ0tqsu
	 pGOXqO9in9O+7WwOQuYW8sdR7PEb5NnZqidP7MUqD+aMqGmLdQo4zy+Gap+cxZl3X4gsW
	 BxhjbplVR6vvaWwUB06HRYKsFHZADAHxOxWCBgyqDHKVrOhv+0uzrkhGNMLeYT7Y8Bn5A
	 nzcMuZatQqz/WpYPpn3tBLKvh19ZkitZA4my/zWt/rCQqVLRlb4muI3kCTfCyJGO4OTE8
	 B94gClgh98820dDEQmqVpoVfPFTraYcesCQ/C2F7nt1zLDG+vG3taWUBH4KeFZPNEfA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794560812;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=vtfYfPkpsM3aevCNl4mNbvXtj6ZUPVZ9KyzCjRAl4TM=;
	b=hyAO6edFDdVb32jDy5KAAs1Ul2g6ca1RMCVIdFLffMTSGfIoiwc81fdZkzPVrU5V9/PK
	 mKTxDLq9LvGOc4MTSaOES5RB/GnwyDWWl+Me/ok7QXYXwa9h0N/TRJO9w4qSNr5M0M2vl
	 /TqfGfzOYy3yuXPTIGDrFHe5tsGpPPEAeHXGcUVHp0ZtRPrRGSBmcK6l9UAe9wkImpfOW
	 aFF7w7Ak6CCyy3rxe0I93JS1Ar/Fnh34Gg5wFW54gJaKT7FnNsWoh95sBfcFob9+LzwdB
	 xklbsXYa1d7YEsLOYA9Zsy38pq4lm1g03PHcHCZxOUFXy2QiiPG15IiPa1NfrKmrjVQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qZMvMuN6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8AD9606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:06:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8AD9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qZMvMuN6
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4d427836e9so111270766b.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:06:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794560810; cv=none;
        d=google.com; s=arc-20260327;
        b=rFBOhsZuROrIhMbIG2kk+Sp7HNYhK+GUOsShWKydj82bcGCkldSXwiBMTqSxvSfczw
         ZhFvVfBuSAWtcfJooRh7346/OGBIWGffieB6pSJGmTpjRz2fbJirwb0ylFrvZKmTgwxY
         E4zSJz2HMZcIz5cP1rJF7AoXsQlKkPh5VGLatEwEcq7N8WkfB8b8yxLbFYv1eRaEoplm
         vR36J3e4DncROiruUM6jJOlTWAsee0WWwhjtnyTt+gk+TCBH/Ny+YFx8dgfkna5pcTzV
         2WJYwfBaToW0JjsZP/Klfqfjp3qNGmrAN945JAuHckGrEsMvHx0H2M4qqWnwx0bWW+sO
         ZPKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vtfYfPkpsM3aevCNl4mNbvXtj6ZUPVZ9KyzCjRAl4TM=;
        fh=G9MuJoG5/7GppHELvPCA1b9dUQsRadcsMs9B1YZv/bY=;
        b=o1ZZANltZHLJemhfQ53OhCAINBy/MAepYUjV8Dp0Uc/uYF8edxmCVUWOdzB6LHfVdM
         q54PpkpuFK/HZ6S1DpXtVSN4VSAcC30FKIlQeow38fFVXEr8Rema7SlMQMRKpsppoe0N
         Smujuanf2itdvm4t4d4KN62DiM7jmt4x1hz4gKcyuLiwrA7ifs9DAJrYNQWvi2zQLr0L
         cvxa1CuuYjF2cOkCvWi+D6zeDADthqIjAnAcTFUs9Fy4roow0r5kJDC7j7ct+wjoR9Li
         46qCOMXDQ1xQgWeCQxO2JbGLCvzOh4EhY5rzjSsJ5jKW5knpjvmm7VDYOe7zQzJbto78
         3cyA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794560810; x=1795165610; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vtfYfPkpsM3aevCNl4mNbvXtj6ZUPVZ9KyzCjRAl4TM=;
        b=qZMvMuN6mF9hs+FYGXmLcF4W7l8B9TZOEm23Bx6Dx9QSxdpB91QNO2XOT4Dj2GvCBE
         lE12t2JBRd2XMRu0ECziNZNvKYOEDPd7AHI676/89O+qJXIahxDHCAD6oNVBONFjsWC3
         Onu6zaQ5Mh3+v6nJZFCXfFHDU3sFLrvA8QxoKQsfZHstZoiWm+x0iTD0NcUf8AgO+Hoa
         vWGrDP/MLf8pA89B8fkUQzKmiCHcH6lHJHCXtFrKUr8iDTgETpaD5iHE9vyR9lCQxLis
         TpU/mKCM8hu+GdZHxjT6+1GlgJxobUrAG0thSyXWAKClkxpllZnTsv459Z3cqx7tk2u+
         5kRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794560810; x=1795165610;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vtfYfPkpsM3aevCNl4mNbvXtj6ZUPVZ9KyzCjRAl4TM=;
        b=NJhSqrGCa671W1n+pSCcNOg1idTMYUUdQjsGBLHoGZT0F3Od8I8tSEf0HGS/EeNFJr
         lakjZ8NeXL4oNMDSENoKDWmixZtcZVwZObH8N9mEBzLHwXDlPJtiYTBvL5pTycb/QD4p
         rOavlOO29Ivm0hL+hYS85/8d9JtGUZTRda3W9FT+jwbFOSRAcbvtRCk0+C7WCZ/4/ZR/
         Nsq52pBO6WaTXs25i1lYsoVkIeThMUHG9uqhEv1V45bldDGWnxAV54L92hlwbwNtq9Ai
         cr0cf4hw/VaXDFfdHkTpOJXaC3tNUeFJHatVxMAFuKV8GGvl82sziAsXgBEkjqzf59VR
         YwjQ==
X-Forwarded-Encrypted: i=1; AL+hErG8Wbd44mMU3k/6V6I4Ood0xE/fsQQE1OKMcaCC+rNDz8VJLtLHZNx+aMowG1t96AlxX4j7Cr6QV8rFp2s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vUYUNJiPIecB9LYa0rfwOh7aWgQe+Tczn84nFYFbzqug2wMmv
	FbL5eHfALWWH6CAKfml9u++VxmHWWbAfCMKFpcpGH0R2BYhVfPNP43nLkqL7YqXN5m8z8n+Bh7/
	t0G3GFsBKih+JYzfPEI2jNESG1BUc4L+ddvmpGC/jKg==
X-Gm-Gg: AYBFou2KPYqkXRG+H51SN3PyzOz8BWslkQji/4cPpysi/z2r48KlXw+qql5PgPizIxo
	8lLt9oOxHc3eqIYcm0ruipIm7CAGzZRQiINJNLIhdHC2rp/h3inug0DQzqa+vxiai3ih9zuHI0m
	0IEGmj0E4W3wTIvpVUJoOI91sb9lXobZNU/iTqqpPLhE96Qk1tdB6PBGbNFm6zrnyATgP3eMQWa
	9xtt21jQlIj4cU+w82yL3Ok64BV8oMzhr1FyWNJfPkAeWMmOUQm0N++08TAc6zjLfJodugewfTk
	baQuuUCjnhHa/sJ20HDKWlG6xdWzlXVsaHM3MRxkbir84zSuUwF3Jgm0oXDbP7hDdKz9A7ovB2z
	yGvwYtxGxV3I4WBBzsZHW0peZ0u5qv+H8JFew5ydvTb1ZrSisTSvv8vJ61fonOLv/2wRAo90=
X-Received: by 2002:a17:907:930a:b0:c40:19dc:a24d with SMTP id
 a640c23a62f3a-c5096344fa5mr156377366b.9.1794560809980; Fri, 13 Nov 2026
 01:06:49 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106151947.3991524-1-vincent.guittot@linaro.org>
 <20261106151947.3991524-9-vincent.guittot@linaro.org> <6033be91-bdb6-ce15-5b65-eef73256d175@open-hieco.net>
In-Reply-To: <6033be91-bdb6-ce15-5b65-eef73256d175@open-hieco.net>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 13 Nov 2026 10:06:37 +0100
X-Gm-Features: AclHuK-1b2VQHyP72RlSkoAcwpr-03tXyP2Sbt0wcavFo0b3c-Gjf1clcwW5VHA
Message-ID: <CAKfTPtCYEgz0cVWLWt+S6+2uwjwsM3xZmjg1oQG7u5CYD9muPA@mail.gmail.com>
Subject: Re: [PATCH 08/20 v3] sched/fair: Add push task mechanism for fair
To: Li kunyu <likunyu@open-hieco.net>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, 
	linux-kernel@vger.kernel.org, lukasz.luba@arm.com, rafael@kernel.org, 
	linux-pm@vger.kernel.org, tj@kernel.org, void@manifault.com, 
	arighi@nvidia.com, changwoo@igalia.com, sched-ext@lists.linux.dev, 
	qyousef@layalina.io, christian.loehle@arm.com, pierre.gondois@arm.com, 
	sshegde@linux.ibm.com, kayracizmeci@gmail.com, tim.c.chen@linux.intel.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Nov 2026 at 09:47, Li kunyu <likunyu@open-hieco.net> wrote:
>
> Hi,
>
> On 2026/11/6 23:19, Vincent Guittot wrote:
> > /*
> >   * select_task_rq_fair: Select a target runqueue for the task.
> >   * There are 2 ways to select the target runqueue:
> > @@ -10552,6 +10712,18 @@ static void put_prev_task_fair(struct rq *rq, struct task_struct *prev, struct t
> >       cfs_rq->curr = NULL;
> >       if (se->on_rq)
> >               __enqueue_entity(cfs_rq, se);
> > +
> > +     if (next) {
> > +             /*
> > +              * The previous task might be eligible for being pushed on another cpu
> > +              * if it is still active.
> > +              */
> > +             if (next != prev)
> > +                     fair_add_pushable_prev(rq, prev, next);
> > +
> > +             if (next->sched_class != &fair_sched_class)
> > +                     fair_queue_push_tasks(rq);
> > +     }
>
> Regarding if (next->sched_class != &fair_sched_class) - would it be more
> semantically correct to change it to if (sched_class_above(next->sched_class,
> &fair_sched_class))? The current code migrates all CFS tasks on the current rq
> whenever the next task is not of the fair class; I think it would be more
> appropriate to do this only when the next task has a higher scheduling priority.

I'm not sure to get your point.

We want to look for a possibly better CPU for prev when it's put back
in the runnable list. If next is a fair task we queue the call back in
set_next_task_fair()  after having set next task but if next is not a
fair task, we queue the callback right now so it will be called after
swicthing to the not fair task.
That being said we can probably unconditionnaly queue it there

>
> I'm not sure whether my understanding is correct.
>
> --
> thanks,
> kunyu
