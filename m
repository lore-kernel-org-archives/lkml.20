Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794240475;
	b=pfLUMtP6fwAjd9OL5whECJb3IRtrhlAHB4p2TRH7hYyr1OUL4Kvt0FSbhKkEzfSs0UaF
	 3uMv2Aihd7VBAb3E9+9VCOcJHXaFMIT+lLnkdLUKIgjO9jMFFwcJ5YYYnXPysdF943AqH
	 zQqdu8hYmHDKrmPXZCNSabu2Y4bNuy4fdFomqLOlQGdVuCr+mhJj5t3PPSlD6LpADmT4Z
	 Uzt39kF47G/EA8NlkGCamCvpC957rKJQYrpJLveXCEOpcVRsWhn4kdfMRxrQTRszMKDzp
	 nSTtwWhBZ3sx0Sa3ohkM9q2G1Mebntgc0vH5zdZHK7Z6a7FyLskBN7R6QRCM0TzNU/A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794240475;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=MbwONemvQTwiYEvnpJlP+l9rrcIEBnFd/b+PD1QFDBQ=;
	b=1ievvVToMFOd5OJTCjdVwGcoW8s3WDvFntQ9q99ipyrorFIuaA1qM5zPRo9eK7L0IVe2
	 AHvbsiDh9jbSuG02F+x4Rsy57rjtYqYLGSbmzNDEhJ6DV3mbw7aNCd5VFT/GUXaZ4CBEJ
	 kjwijNrCUodJ0Rq+IiKzp8jKYSWZ5sgQ4zKH74KnV6IkzgNJsO3Hw75COfg79Y9QCwc3P
	 S4ZkSVdlOC0ogMc0tfCyN7NHwrTqpFbfVvf9oDUlp15+tw5jk3yQnbTnkseuWJF5R7wdq
	 79LX9AnwhUnNSMbVN9OHWxikGhWPUm4KjRwVQ+PEHlgrY74HfX2Vd3i9hkJp//UFq6w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=bqGE6uj9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DBC606EE84
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:07:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1DBC606EE84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=bqGE6uj9
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1931ff67a29so2785528c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:07:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794240474; cv=none;
        d=google.com; s=arc-20260327;
        b=W7q0yHtEwXxyseBmk2Ht+Qh9pK1sGhlejtBCYwA33tBNFaP4G31sGcoBo0Gqy4ZYpp
         71kPuIsCLtpSNe/vtdtSIZ0sooAi5nTBa1jghm4TUz5N+xeguXBc4ZsRfUXw87a7Z5Na
         z6W6nFXY+6KCxTOUExBbx3VfML/zyIUi2bd4ZXo9NeooNVKmwk1goFYfRaHIkR3xXFao
         xV4nYh0sJGkPo1p9jwyhD7LOoIQcxCf2NI10gsQORP+X/rGM65MDMRcUsfD7yDK0zGWA
         43Vn7mXBWsu+Lyff8bAu1vxofKuQcbYL3Y2DvK93t4C9DdPI5E+WDioVEeEmogezhw7P
         ivMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MbwONemvQTwiYEvnpJlP+l9rrcIEBnFd/b+PD1QFDBQ=;
        fh=8crguad2bb7hziGmSdo2T6icWAP1+BU5UlK88/wDzI4=;
        b=gNXxKMqMLAmknhyVoC1iZG+7ZijHWdd0t9xZ2Aqpq4u5z9jvRVFYTzpQp/heXSWQ6M
         JCzPFyqHwK13cTWvABXJjkZCLx65gfyDvM/WfkmY0n2G8Ad9DUoCxp0hTQTnpcVAcJcV
         flmddkakeJ2zWCFxxAL7mE1yCByabQJBd9fzc0fMnHPsC99zMVoG3R5gvtfut75Pf+TW
         oMFRa4r8D8Ao3Q6m/pUqtGPveupHcn6I+AO3nkQq7gJn/9la/tZGbaSzRQyYXdIU7nwC
         j3yvJ7NelsRt8F6guQMe1CxN9DH2OHPG3vr9EU0+KQBqPukao7emFLHG98n1rXrsVmtD
         CIeA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794240474; x=1794845274; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MbwONemvQTwiYEvnpJlP+l9rrcIEBnFd/b+PD1QFDBQ=;
        b=bqGE6uj9fKNrG3w60stdKMh4HkVt8FhOYmdsnCe4TVSocwnXywOb+5yHbPTKcgBfcB
         24sIIhOCRIpBIAHL8ykVKY6f1y9oj6FVgZNKihX+p7xXKXhf2hd9n18VlVZRd5UEK2TC
         360/o11TUVm8T2JwYmSC9DN7xhrMXgjAf3UzdZ5LwFHaNXt/ewz9OrucTI1Kq47o6hpj
         zb83MyoEqsO0ZR05PKUu5U10cJr2zvZO5ICX+FlyUxmtUdMikqYc5HxQ0hSaqc8rFk2z
         /oVTW00zFJcwb3FEQQiz06zNvurrx5ypDVuEpVFB0joXKVBkl9pD8dr5TxhzRVPGQlmg
         ne2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794240474; x=1794845274;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MbwONemvQTwiYEvnpJlP+l9rrcIEBnFd/b+PD1QFDBQ=;
        b=ffGylF0TlW3Mpx5J3zcmmeTxsWoaBAtPmKWa1JqxIDpPcOZ9F9imxknYIPPN9AogGC
         jmU59BF4RteaKo1+LCRtTFkov7EeoHUOaAlZzMxjE4Q5XDQv6BgqRzBCQv4UuO7WTWKh
         H7xMhzGj+hlzxDWyP3LUDRjWNUFS0lzyWMs2QTycVs0kbl9xPYk5eF7GIjOFqRAV9Pqd
         iO9TJ4gqoF+qDef51a7AFDrHpsBeXY5BYqD/8G/QRvA864vdmx6MG0z+5GZKPV8wgrSq
         U1SdBqZSwO9Z0X9oREv/DVYMTevP46GRK20nXP1kgmWFJALEyBa7pXkJRjFMM3dPugng
         w46w==
X-Forwarded-Encrypted: i=1; AL+hErE6RHrsVeV4KefyGIauGLvtR0xqweB9IA7aLkjjEHwZZUoG4Y2mnrmPApPokJuxqbVxc9exYI57lmoqgvk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/iATeztGAnpfEJk/f6yXoprvJYt2ucj8/tAXP68pEzyx3p4vJe
	xdjVp+kbzvDTgGoWVp6x4OGhb5XjgkY7DERsyZX59WvnWOsddbRuVj0SMyDFn8t/TcRA1WHXRcS
	CtpKfKD4UQMrf9e11DmmY9knO8m8Zy8JxfpJHXGIKjg==
X-Gm-Gg: AYBFou0jHuUgUtwJpLGnr3jI9occUnvFZvkfJep7RqwlNTBCkcVfubCP3lp3DDeMJMs
	e79Ui1U+CGtcieijxsk/fe8m1nLI6K/uw3qxEUh8i/hy/444HF/Zq6XvG2ramRtKHpN/bcZloOj
	gc8nI3f6lwMZj4WJLhI+/1FvnTHBWr4DRcpCBA+P0R4DYqDAZXOPgln9FyVGuhu5HkvDLzWsDXT
	XXmM26GgqvaD8vXkIDt71EaQ2HdUw5559OldrTnk5lfywKpvFlRMPzwGE5wuHwbIhfVTpOdrznF
	9lEJKaU5EuoohB2kFvs3HebU4ptxvsluhP2X7t5kWfnwFlaJJrry+MqLCPKn4ejddQ/WM3IjH4s
	uR4bFcYfKXG8+idoKb40/yQr5dEAbwesYapb8f715yXcmyCVKXUoBLQ4sqe8EdqS58zaO6xc=
X-Received: by 2002:a05:701b:4284:10b0:194:3a84:e67a with SMTP id
 a92af1059eb24-1b39ff06096mr7491026c88.41.1794240473701; Mon, 09 Nov 2026
 08:07:53 -0800 (PST)
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
 <20261106151947.3991524-9-vincent.guittot@linaro.org> <20261109144350.GD2668564@noisy.programming.kicks-ass.net>
In-Reply-To: <20261109144350.GD2668564@noisy.programming.kicks-ass.net>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Mon, 9 Nov 2026 17:07:31 +0100
X-Gm-Features: AclHuK8HkNgfirok1D7dYwfSows5oKF3C-rSYYm8dDteUYYcSG8yjSHtd3IxClM
Message-ID: <CAKfTPtDcu6HS-G75bG7xp10t-n-XceneFtqxa_cAd+B96zCJiw@mail.gmail.com>
Subject: Re: [PATCH 08/20 v3] sched/fair: Add push task mechanism for fair
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@redhat.com, juri.lelli@redhat.com, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	kprateek.nayak@amd.com, linux-kernel@vger.kernel.org, lukasz.luba@arm.com, 
	rafael@kernel.org, linux-pm@vger.kernel.org, tj@kernel.org, 
	void@manifault.com, arighi@nvidia.com, changwoo@igalia.com, 
	sched-ext@lists.linux.dev, qyousef@layalina.io, christian.loehle@arm.com, 
	pierre.gondois@arm.com, sshegde@linux.ibm.com, kayracizmeci@gmail.com, 
	tim.c.chen@linux.intel.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Nov 2026 at 15:43, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Fri, Nov 06, 2026 at 04:19:35PM +0100, Vincent Guittot wrote:
> > +static struct task_struct *pick_next_pushable_fair_task(struct rq *rq)
> > +{
> > +     struct task_struct *p;
> > +
> > +     if (!has_pushable_tasks(rq))
> > +             return NULL;
> > +
> > +     p = plist_first_entry(&rq->cfs.pushable_tasks,
> > +                           struct task_struct, pushable_tasks);
> > +
> > +     WARN_ON_ONCE(rq->cpu != task_cpu(p));
> > +     WARN_ON_ONCE(task_current(rq, p));
> > +     WARN_ON_ONCE(p->nr_cpus_allowed <= 1);
> > +     WARN_ON_ONCE(!task_on_rq_queued(p));
> > +
> > +     /*
> > +      * Remove task from the pushable list as we try only once after that
> > +      * the task has been put back in enqueued list.
> > +      */
> > +     plist_del(&p->pushable_tasks, &rq->cfs.pushable_tasks);
> > +
> > +     return p;
> > +}
>
> This means a task will only be pushed once? After which it needs to be
> re-enqueued on the runqueue?

Yes, my goal is to keep the list small to avoid ending up with many
tasks to push. So I only check if prev could be pushed somewhere else

>
> So if it was found during migrate_disable(), its thereafter stuck? --
> this seems a little weird.

If a task is migrate disabled while we are about to look for a
possibly better CPU, it will have to wait until after the next time it
becomes current. This is a simple way to pace the number of tasks to
push in one callback
