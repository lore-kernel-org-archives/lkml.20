Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794320450;
	b=fknPsWMjmj8htPtbydq5Tfz0h/6Dz4vunq0n0sv4nCh4/ijYKSgeA+xPAimGZbdQUtNh
	 OCK+qzk0K8BJ+T8+bMu6sWV5+4+uI+KHetBpPLvW2nEp3boboiCGUTYhQ6m9ZSsSGJtbP
	 QavoMGTiXZ8hcT1n67cLmaZOQBaz8UaErDsj9zaglTWb0R3aqSJWMgsRdh5BW1ND6FRhJ
	 mwutMqwlUckbEshptKA0wrNlJ65n8iuJ7/iYPYQphGfOrf1zwiEXaz/82jW4QgVsJoWYx
	 O2S+0URYRKCYn6lZraz59iXYftP86glpcJdO1Kahw3g9XvjNtt6qySeW1DPexEH7CVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794320450;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=KuCHHusPsDV6v2uzN39tFS1wbxXh1kRYSDHLVWEKoRU=;
	b=MIqompF96Kn+Bc/9Su+Buyfu0FZyM1FrXq/zaAybLy+RVgzCIq2zWn0oS83+cCYR4iAq
	 6jECE8mBq4cM+E99foWthu/K1O+1WeX8uoFoUyVNwL78ZD6ITViG9vftQCHE5AgiwOOaU
	 r+c0tsp6nDsxdHXg4UPAuVDB+mFC7DsYFCMdtEDxUmS6Ryc7fQOd6EVzpWZZiRabnLe60
	 iTxp89XDMLeekXIi2v0+pCHSiUIrxLb6G7QFUEJsG7ihAQFB2FCGXtVGXhU179nOfX36Y
	 gs6h/fFLOp3iALQlIeGM8vLKo75mk+i2obg1eyfY2GdRigrDvWuyHffq7v7z0yy15lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EgcZyy2P;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96AA560A5BD0
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:20:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96AA560A5BD0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EgcZyy2P
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48df160bb9cso64294f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794320448; x=1794925248; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KuCHHusPsDV6v2uzN39tFS1wbxXh1kRYSDHLVWEKoRU=;
        b=EgcZyy2PndrUzh1Zh8Lc+VqGbvXDyjCRMvRtdSKb08wIRTSbjyDgP0WSrVV7n9JQEi
         OquCmyk7zhfT6pyx9cod/rDeDLNLXUx4ECJNEAk8Nut0EBoST1RIGZGhpJzdWjFOzLQX
         tDyGrE408tTcYNifXsIfiGTCEQfMrKJJSmb9yBI1WJG7e2oNkB361vYub25vs9WwtHxh
         gDeELEfaCp1emnwkgApjAuzYytSXY8T1Wj4rQlqMgX187e2r0px5i0gOoWbWIyzxkyFc
         R7iGFn9s0PRkKOUeHvKgOGx7CCHMz9gfqv+JH6x18MEvWf2O2p3lte8NhXHHwgToLKf/
         zQ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794320448; x=1794925248;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KuCHHusPsDV6v2uzN39tFS1wbxXh1kRYSDHLVWEKoRU=;
        b=q3XfUVqMppTmFEWSeTRUbag34PL/zmqwve3FtQxrBbhzcG4gP0sPjaPL1L4ohqAQfN
         Y0h8/1Qh4OX8O26cN7uv8uQpPIdyiU/kr4ohMx0zq4AnEFJNESZJC85dV9fD7H0l8++i
         biU6E7LADBgHvziZ6eXpY+uYX4UX/DyK9MhWvyLS0zh1nB+5hWo5pB6qboW7V4hUPTuC
         +kSFjjwnJpesF1rEDEEEYAsE83B7LKPxu15iVEyxgn1MoHngqlmQcXAZIWGQRwHVsQHY
         qGnNz6/zmzz8VabVsdzJTwnJnnB/cD/sKiYDLsnVVEcrOpPL/xU/DCSlEzI9bQ6pskd2
         1ZuQ==
X-Forwarded-Encrypted: i=1; AL+hErFAiMOtRW8dnZ3TqnyIOLHp9k1Iil5B8Q/VzPQmJiY8ZOMeZZqmr2bPEaQBJLCY/ZvJ/Bdquu1IC7KAJgA=@vger.kernel.org
X-Gm-Message-State: APuU4Z87L0d7rAXRoFR5/b47bOpTHKJdDIJ46lW+SRkfa9pFQeqOsmKp
	20rDGnHvS8NIiclJ7f++umlBeur03GfM2wkMDQ7prnUlA1EFnd58r3Pt
X-Gm-Gg: AYBFou0exPpeV0evtl4hK90A1mGFhQgDLfPc3TXNIEK0sLcQopzXJzYixeK4ymeGv0k
	ogVWvVf69mYvSe0K754TRHN6fww3xWWyHFtSbpcG+ONwpcAUX15IuGmWyo+9uStvRpV7mTyNY8t
	5D8RlT3/b5DKVzqloZH7b6CgZzGO+/6/PBR3XYja4uE4kicATXW1w3GQcfy8pGF1ghbXTt7yg3z
	xrpYkqnUgyfbQ4yev2q6EMGqqAN0gEqfLnAPS2eJmWm5Dz2pbUyzzMjDszcM9JIQMefb68b8/TI
	/urJoqu/LA4SHrt9oV7y0CAZKq0rRrSuwPCT27ti21zwokLIiID6Xs+4tXRyQIvvndKmMGCdtY/
	gAe3iw64f+678bPvZLA6xQeiV8qBUWPqJiacT0Q+NSTi5FzREt6/EJ6CiKRZ46wglPcM5RJIIi6
	/tWL084SYS88iB2AiJLkd9eEwea7v82eR7lnTQh2vow4vFciPRR7N4GRhC/fxL8n/tpJZayfkrU
	eKHPrYLdslZIHrOx4vGdBXmaSPqcPpKibgqLU41mUuz4pLu5fq/I9oysVHKwY+8DNQMzf1gEbx9
	/1NvdVavweQLmNSdZZz0mSVZbRSUj3Nop4AXrsuYjfGO0RfSMIr5zYnD
X-Received: by 2002:a05:6000:4a13:b0:492:b1c5:6dc3 with SMTP id ffacd0b85a97d-49830f6b390mr5471185f8f.6.1794320447580;
        Tue, 10 Nov 2026 06:20:47 -0800 (PST)
Received: from scheduler.schedules ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4989a2a505asm3800566f8f.13.2026.11.10.06.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 06:20:46 -0800 (PST)
Date: Tue, 10 Nov 2026 17:20:43 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: Josh Don <joshdon@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, mingo@kernel.org, 
	linux-kernel@vger.kernel.org, juri.lelli@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, 
	vschneid@redhat.com, kprateek.nayak@amd.com, tj@kernel.org, jakub@okonski.org
Subject: Re: [RFC][PATCH 3/3] sched/eevdf: Fix sched idle task group
 preemption
Message-ID: <avMeP-80bZz-zdtO@scheduler.schedules>
References: <20261105165525.011876858@infradead.org>
 <20261105170157.765325702@infradead.org>
 <CABk29Nujsg7FNY4yJ3Yd0maT0GEtvxacUWvTDiT5HD=-YVqTvg@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CABk29Nujsg7FNY4yJ3Yd0maT0GEtvxacUWvTDiT5HD=-YVqTvg@mail.gmail.com>

Hi Josh!

On Mon, Nov 09, 2026 at 04:10:30PM -0800, Josh Don wrote:

> >  /*
> > - * Preempt the current task with a newly woken task if needed:
> > + * Preempt an idle entity in favor of a non-idle entity (and don't preempt
> > + * in the inverse case).
> > + */
> > +static inline enum preempt_wakeup_action
> > +wakeup_preempt_sched_idle(struct sched_entity *cse, struct sched_entity *pse)
> > +{
> > +       int cse_is_idle, pse_is_idle;
> > +
> > +       cse_is_idle = se_is_idle(cse);
> > +       pse_is_idle = se_is_idle(pse);
> > +
> > +       if (cse_is_idle || pse_is_idle) {
> > +               find_matching_se(&cse, &pse);
> > +               WARN_ON_ONCE(!pse);
> > +
> > +               cse_is_idle = se_is_idle(cse);
> > +               pse_is_idle = se_is_idle(pse);
> 
> now that se_is_idle() is checking for any ancestors with idle, this
> doesn't appear to be correct. Some motivaing examples:

So we want to keep the idle difference between groups with idle
ancestors? FWIW, I asked about this but then thought it was knowingly
and that was what we wanted. I'm still not sure what we want...



> 
> Ex 1:
> regular task and SCHED_IDLE task both inside an idle cgroup.
> se_is_idle() will be true for both se's, and so the regular task will
> not end up preempting the SCHED_IDLE task, which would be the
> desirable behavior (the task is not idle relative to the SCHED_IDLE
> task)
> 
>     cgrp A (idle)
>      /                 \
> regular_task     SCHED_IDLE task
> 
> Ex2:
> more complex example with a hierarchy of cgroups
> 
>           root
>             |
>           cgrp A (idle)
>          /            \
>      cgrp B           cgrp C (idle)
>         |                   |
>       task_1            task_2
> 
> task_1 should preempt task_2, and the inverse should also never
> happen. However, the matching_se here are cgroups B and C, and both
> show se_is_idle() as true
> 
> I can think of two simple ways to fix that, either seems fine
> 1) use the existing se_is_idle() check for knowing when we can
> fast-path skip the whole find_matching_se() business, but when we do
> find the matching se, rather than use se_is_idle, use a more targeted
> helper that directly compares just those two entities without any of
> their ancestors (ie. for the task case just check if it has an idle
> policy, and for the group case, just check tg_is_idle())
> 2) once you find the matching se, just compare the ->idle values,
> since if one of them is bigger (by at most 1?), then that one must be
> the "idle" one relatively speaking. Handling the task vs group case
> here seems a bit messier compared to the first option, so my
> suggestion would be to go with the above
> 
> 
> Best,
> Josh

Cheers,

Kayra :-).
