Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com [74.125.228.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1244A092A
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790056609; cv=pass; b=Of+hLGDBkwuA2TyyTb9j19kezSoHXDMjZbqYaNxFzO2l/tsOO6NxOHiOIT85VDwtAhAidDfhekOCJwqw9bWIXA7gC20hDV3Oin2LVGkk83lCfiYgdeIhBz6HY+Xz3ATDRu1jP9Rm3zJ2nKQnuHl7pHABBZb0+Mmh8ky3xr9U1G4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790056609; c=relaxed/simple;
	bh=d1drO2+NdEIIrNX/sl99P7Ke1u/gWR0GTaJkJTV0hL0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hUWLTBd/TVPbF7BwyYPj/NAocxSBLhZgxEsWiaLegOy6kg0iP07xDtAVmC/k+rhMI62zFnQ4UiE9cBTxcdGr7EIL29i5Ay4A4fwnJ/itPEAu4w6pLmQUx5iWZnWbscnirsLuqiQI7X+coMJnPR+F3WXPjy+RpQMysHQD2fzX7Vw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H0lna6WF; arc=pass smtp.client-ip=74.125.228.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H0lna6WF"
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c254fa663bfso566525566b.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:56:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790056605; cv=none;
        d=google.com; s=arc-20260327;
        b=FaOGQ4ID4N60uy3iXKTzBsEScPgk68/ZusvLQxS+XoHUR3YNsJzdeH9qajkXEgaf1w
         ypwKt/Z0TRksw7FM38lTBqgh1EgGd8EU5J9dZmtDbHJj4wZVI9uP7OPxOQw7JuSBDjKT
         gr6qff0/gMNs6d8BL5X6elzheqQgbF5wOo61oa+aOLV186VRU+GRBBax+EIAFGRaLp69
         EYPnGqnT2FhhLWIOt+wm4kqvnKcnfA4FRhdgOH9IFF411btS4WIcxXiGCjd6ZJeMcMpO
         xHO9jQ1E8VOzQ/QePyVwcQ9sQ7E/TOOpEyPQoY+if+pOqVOBaBhYYq32pDCEA0NCshgs
         yTXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fgDSjYBkKIqmCo86GGEHf9xuLVU4KxLyJ0+RC/3vTOU=;
        fh=aCGaSORxlqdL8rHN2LXD2/goceYVz19U9uVeupyc9P4=;
        b=imfqxVY3jU5GCuYu6QouGmLN4ri2mrxf+rqO1QHdNwDTcvqsXtGJ4/NVpJxDrigSPG
         sSzgsY+gOy6BDbZMYJvzZK9lR1xBzC6Gegv59Eifn3ABftYpt31o3nTkBFWgYmNucmly
         FaB7lWmlcind++1+x3NhejEynxfc7TXR1Eox0DBk0Rox8o85UNhGgldbc262PrGi5txm
         9sTbRgRMrVhUsLYzNcs2w78bXh17xqgFzxzcmQq5aaG2tsOz8flY30mwRxEyy1pY2uZA
         i6du4B6IGJRrdLLbdrQSCA+dFFbla52TgH33fsUivxDVYQVks17+EpH/wGXlrqzfyxAU
         geHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790056605; x=1790661405; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fgDSjYBkKIqmCo86GGEHf9xuLVU4KxLyJ0+RC/3vTOU=;
        b=H0lna6WF5YRJnzN5oBp3iMZxC7iLmMAjUXWU9tUSVue4ECeZ7BeKTPem8RU0RYIlyM
         PlPa73PId72dAoZEFTwKjSLFmIVLCtcEXG/BXYUX1BNjiyCqIy6t0CA1CBcl5CpvJtDs
         pHoxncaCN6BESqBcbKBzM7fSgRDZMAQa5SWNxFHFcI0qRif7oMVOMyzt8zM4anbOLEVS
         BFB7nr0sW+zvxz6u1EHPkoeEtodNDY1YR3Jw6akUemCB1y+I6v3R8phDwwQlLyPF85yf
         VE7d0iHvm78N/YesueEImY9w118pkciy9VZCakqRvOIpu4+iRqRTAqPkEkISjpQBYIa6
         a1VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790056605; x=1790661405;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fgDSjYBkKIqmCo86GGEHf9xuLVU4KxLyJ0+RC/3vTOU=;
        b=gTTI7A9u6KQXV5S8fqukkIvW/5Jr86NOOhxu11FEk7BfiXLT6eMnw+fKN+PCAjfW92
         rSiL0+VznXPEyQ5ecoNUSd6JZXB+pkzlw+gkEhwQR8YJhGtmTGtOJb4/gekoZA656ySh
         V35mOyUrtx8vGMD8mhk6pwk4nbDyhQYfQQ5Y5ISo7AFpddkG0JpIBK9xqwklpXlHaRza
         M4SSCqhm618uuqpKeYqAcRtCJW5bmkqG5sHa79fSR6AhVb724A0m5E4/oN47crb1fzby
         p4B1nG7CDDJI1HElVznnI9cvDD9D14GT5KCN5ZiaLen0VyPqZRSn5ig+cwEXiaOG5p95
         fNDQ==
X-Forwarded-Encrypted: i=1; AKwUvBxWmJPKf7kxrBOPQorXXazn8rfRidz55XpXFozVRq7lPjqZuC7fElDZNRE1B6S1Yrn+I5Itq2MGMPnNcwQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nv3n1/fiNgcOItOIzHO08vRRhDDGyjL+8zdAI5MgriFZ038upW
	wJuzZYoxBnckqBbxI5HXUf4q2nUeww+vpfjxPu5jF4kIS5Naw46OY3frqUU0qp/90WT/do2oaSW
	Uc0E/zUAskkjymdI0G86CGaI/XskPKzvWTs/NACH1Ug==
X-Gm-Gg: AYBFou3VLXfkdcWhvVdbnATzfoPasR4wHcTyos2jRt8WXwCBiYnvyQEbxQQPRB043c6
	WHrJ+nKT5PKwDzJ5qNO7YDJbsjcIiJEaUCUKr0rVzFqNTZonArwcQpw0fzybndYQMWMNkJhwzTY
	wflt2iN3SdpAcGxnx3x78BJfe8cXdlsLKSiu4iL8OJqeAk7qWSwr9MEnJes37QiP1tTTto38/29
	BViru3NT8VA65sq5XLX9q3LJpD+afT+iKX5hXOxbDzGE8o2IAlWasUgpfcUdqpH8yYsnmRXkb1S
	hbnVZA9zoNlp8KEtuYMk+NPuqg2IJS+l9UtfF2flUOCJJREnS2x8XBbaOgmKl29UHpbBI+owFBp
	ESC2xS18aDeM=
X-Received: by 2002:a17:907:3f0f:b0:c25:cbec:22cc with SMTP id
 a640c23a62f3a-c2a15699894mr1063051866b.5.1790056605440; Mon, 21 Sep 2026
 22:56:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921152238.3804392-6-vincent.guittot@linaro.org> <20260921160619.3418-1-kayracizmeci@gmail.com>
In-Reply-To: <20260921160619.3418-1-kayracizmeci@gmail.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 22 Sep 2026 07:56:33 +0200
X-Gm-Features: AcwNN1VwPneWCua05QJpyt2oxqQ3VUZliB_2INgPDcmHvhBgBQT7f_gfAuqnYpI
Message-ID: <CAKfTPtDQxuME7geidfYtcMZwjdVr8OQw5WrNPWDhLrTa2_HZEQ@mail.gmail.com>
Subject: Re: [PATCH 5/8] sched/eevdf: Reset lag when waking up on idle cpu
To: Kayra Cizmeci <kayracizmeci@gmail.com>
Cc: bsegall@google.com, dietmar.eggemann@arm.com, juri.lelli@redhat.com, 
	kprateek.nayak@amd.com, linux-kernel@vger.kernel.org, mgorman@suse.de, 
	mingo@redhat.com, peterz@infradead.org, qyousef@layalina.io, 
	rostedt@goodmis.org, vschneid@redhat.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 21 Sept 2026 at 18:06, Kayra Cizmeci <kayracizmeci@gmail.com> wrote:
>
> Hi Vincent,
>
> > @@ -908,18 +908,25 @@ void decay_entity_lag(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
> >       if (vlag <= 0)
> >               return;
> >
> > -     if (flags & ENQUEUE_MIGRATED)
> > -             return;
> > +     rq = rq_of(cfs_rq);
> >
> > -     /* Compute the sleep time */
> > -     delta_exec = rq_clock_task(rq_of(cfs_rq)) - se->exec_start;
> > -     if (unlikely(delta_exec <= 0))
> > -             return;
> > +     if (rq->curr == rq->idle) {
> > +             /* You can't claim any lag when waking on idle CPU */
> > +             vlag = 0;
> > +     } else if (!(flags & ENQUEUE_MIGRATED)) {
> > +             u64 now = rq_clock_task(rq);
> > +             s64 delta_exec;
> >
> > -     vlag -= calc_delta_fair(delta_exec, se);
> > +             /* Compute the sleep time */
> > +             delta_exec = now - se->exec_start;
> > +             if (unlikely(delta_exec <= 0))
> > +                     return;
> >
> > -     /* vlag can't become negative while sleeping */
> > -     se->vlag = max(0, vlag);
> > +             vlag -= calc_delta_fair(delta_exec, se);
> > +
> > +             /* vlag can't become neg while sleeping */
> > +             se->vlag = max(0, vlag);
> > +     }
> >  }
>
> When if (rq->curr == rq->idle) runs the else if does not. So on that branch
> we just set local vlag to 0. I think you wanted to set se->vlag to 0?

Argh, I messed up when cleaning the patch

yes it should be se->vlag = 0 for idle case

I re-ran tests, and the latency with hackbench decreased a bit

scheduling latency (us) for cyclictest and hackbench
                   tip/sched/core| this patchset
slice                 8ms / 16ms |  8ms  / 16 ms
99th Percentile               75 |    70 (  7 %)
99.9th Percentile            730 |   532 (+27 %)
Maximum                    15996 |  5290 (+67 %)

Thanks

>
>
> Thanks,
> Kayra :>
