Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794466948;
	b=cOeZtDXLZsuGruLjKRdKxI6qvfcIOUT0ev2vB+e629wuId568OTs8VhkMazI5AZL2dIh
	 UlK9HM5bnvLxfQtIsmCfK8sj2QcHIvJIMcnso56Y2EP25M8y4PQ1//eazW+Ea64D1luUg
	 vWx78n4CkeulOx2dgqKYTPvAL7R0hsqrzrqolSX4Z0AuggHTXnirqmpS3V97xlHbNeRaa
	 ZsvM/xobSKzV1Caxb2Sfphzq0cErlALXtvRxV+GEqCNlcGk8J9hspRuc5IdkeNQk8w0PV
	 vuqJh5Bpt4ET5XH0Zu0JwqWrRC3lAFHobzqvSgkWqe/urnbvhdUdXS+Jj1mR70gZ6fw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794466948;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=zj4daZqcOfrk9MLreCDoKv45VzLcW0kMVsw4yuRmjFc=;
	b=dwwTIPrTZui66UE9LB75iMkl32yFRIhrwSBe6AUCfEXTcT6VjlaLiypELvnWke0HiEA3
	 IaS58HhS4BQ8noQ1inKka01qO4saR370P17E1ir+MioQUu/kqaYu/D7YaBKZwFWt7WJ5e
	 V3TSCAeJ6ZlAAawrMbFFCESfOro13MJ5Br14n602NixiRRZ+n3QlrtgX/deB6Ks3LIXeU
	 oz2WBvTCONIohv3kxtp3qIysv5Y0buHHZPwNVQlSCkfnKf50LQH3+3JilnlVLrzfYMniQ
	 5w7vM1iaQAlhOZ1ZUYXFaosSqrjqeI9ivcsOmLuja0qpNmoArR6W8RlIes/2NpkNiFw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PXWOUoJA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87EA1606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:02:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87EA1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PXWOUoJA
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6ae305e3bd9so6171351a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:02:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794466946; cv=none;
        d=google.com; s=arc-20260327;
        b=Qu8lJl44XEeDy3jvE9S/BAyQgZ/zOCwJz2dmClV/WfagKNpQu29FBRZWWQH3+ccI8U
         rFSyuHq6vtxYQdZ5Y3x+Buc0ItGpVBPmQwyHkh/BnQrJwvcnUX0myLvCogcIfS3wLsK0
         blbgLqvP8rbgJCUo+ylkg1R9o3Ah0uAk37YQLfB7J3iyk8WovqZPzDT9o5R+P0kPXSgo
         2soh/KNdvdRUVU9ZvbbjNMvLZcxxRiPGeQt7rLcEYjzWl2wgqsgAfa7PD9jXTOyCjYKe
         Wvz5Wf9Cu7GGYJvmrg6n76OVpRB5o5vwQZ7aKNQJ/u676lVLP0rU8+9chIACNyQXqSPK
         jaRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zj4daZqcOfrk9MLreCDoKv45VzLcW0kMVsw4yuRmjFc=;
        fh=aRew4yTtYfapKsvxJj7iJdtYOMy1a0GTZyVYW/fac98=;
        b=ew/YshkA/Y0Zs7TRpE+6jVVvmjr3xiHlwOCJa80OlGefIS3o6s6A0buBGALDvDtAQM
         3+rRfnPJRL/xAN2qd9HYOIkrqdBqlnKNxqxrVb1pvdz/K8VxxF0JQupOqu30ud8NMajO
         eOetX8hxzyrjRH8fx1nnNf/Blb3wxBVaP6kXrT+RjnFroIZ5MCn3q3cNjYqHXx3mzgP8
         yZ3KMQsrLRq5Ah46SMtI9WYBEKC1vkKZHzzOshfYukPnqpIHXE0f8wWqcX0IB9lFdCwB
         tyAIF2FkbtIP4Ti5lCiA4azvJgzxeyPQSn6k5Ctl+k3IC3WTZJyUQKYZi1AVksjDy/Nk
         xT0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794466946; x=1795071746; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zj4daZqcOfrk9MLreCDoKv45VzLcW0kMVsw4yuRmjFc=;
        b=PXWOUoJAKZe4F84y9dSv19nTvPgCLE7t3wF/6OK2ig1rLWBe5ND5kYjIbJVvKGGp0q
         3ZSPR2Rs/JDxKAPgG6q2nLooeqGi5oap0ZDMf5HCaL4dV8JjodKNl3ACgCKeNj/dm3bJ
         4845Q0ZgOcvEms9ueC9IhkEZMRRTZMy8yf2MN4zLR8l+o220MoW5YqaF2w1ym0hzm+V9
         Typlt88pojHaKYcDnXIDukueDzqIYuhWX923qSm/IuM746jbl2MWtxkP/WKwPTJXvbcU
         vAg7BaHx9f5TITUGVYdeM1RiLuZTJskUL8VtnEw0pM376PeA7Qw/dbkFu/FLO+KTuve5
         AUPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794466946; x=1795071746;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zj4daZqcOfrk9MLreCDoKv45VzLcW0kMVsw4yuRmjFc=;
        b=jF86iirDVvIJ2mYzWAg7YeRAbFEih+fTDgyMkDuWQi2VQtQXN65owK0tl58wWkT27/
         lkkkXF88BFT8YxvCAAPZVobxt9x0nEgI3lD4CRU9zMU+vgxaRic0LaNNSjtSK/4A3/Yo
         oHX9IQCCywJt16DvgWduBaCMStWrrzF6TP4VDGY8RIxtQGs4IKSM7D8uZVkpkrOwIRDd
         nvWCqeXqiJO50Qsw+NsSzxCGNRiZIrDtKb+m9cJdMCl5tlBb1Neu5EvBheFgoPONIZmu
         Jj2nwHPd/e8zD5vKjsTSvCtEQmxlEvwqbA9P+ByK7ghANUiSKXdkVow7Scx4MeRi3lXi
         Nagg==
X-Forwarded-Encrypted: i=1; AL+hErHdmWBeT1qNz9zPwklPymTEu2YVaQ5mDlXZmsIrRtZdVIcyt3vcd1jJMlhkgiDQ0cjKmR039IWmQTWB7CU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uV6jzAoKSZpE66d9spD/q81YkufEQ3JPUwq4faqMYLsyM4B+h
	vjvgfJaMnqHIaByPiX1snfbCdvkBgBWVpZYCsvMjv7YrvMWo7d4a/zMze35fxnoOSWP/3++9x/G
	9CEBH4KhJckfsJwsHLBWPnAWXzQ8RRqBPk+G7eGnHpw==
X-Gm-Gg: AYBFou1PC35SDW9yWMsk3SxZQvprZvBa2yEtDMFxP2+XF2WtlgGayR1CbyZlHkxZ0zv
	gwrUhs0sGV5FsyOLUIyAmVk/gB94ZnKAfaUXcjo27snuKqK2niFnpg3W9XhgK72twpNeM5eNr0l
	lUdUDMox+kQIeS8I2vyyGvQPev4qLx3qtkP0SGMHwsztecLSKer0OS2L8nwixCwsQ3VWKRBQcu6
	9Zd7BSg4WUPMDdA6pvGMiZqm5cqJS0KcxtXQvMDSxlRtxy681N5oqvc+xFb9pFWJq1SGPImIkVD
	ZGfkaIX9yrXWGmNU1UK4l7/S6H4fIyT6AGj/r22PyFYrmkU+VLATlps+bIWY73JEKfSCvaITBMj
	XzzGQpXwZtmn3xsOaO1DO6sqcBkTFWK7j3f/6SW7VQ+NMRxQB7lmK6b+8cgYjIw+4FnZC1g==
X-Received: by 2002:a05:6402:28c4:b0:6b4:602d:f1f7 with SMTP id
 4fb4d7f45d1cf-6b7773f4731mr3380483a12.20.1794466945804; Wed, 11 Nov 2026
 23:02:25 -0800 (PST)
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
 <20261106151947.3991524-3-vincent.guittot@linaro.org> <au38gSTzmvPKmqWT@scheduler.schedules>
 <CAKfTPtDXo8_3tfXt=UH+BKyO1rJCWjRAVXjO5nFVHO1NBd8LyA@mail.gmail.com>
 <20261109154536.GK1779021@noisy.programming.kicks-ass.net>
 <CAKfTPtAL9T0bGZdhkodC49DtNUFKJgEn9f5wLNBe_rGxzJEN0w@mail.gmail.com> <20261111090354.GG2668564@noisy.programming.kicks-ass.net>
In-Reply-To: <20261111090354.GG2668564@noisy.programming.kicks-ass.net>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 12 Nov 2026 08:02:13 +0100
X-Gm-Features: AclHuK9sTnZDoWNK1z60y7C5PPNcVNuqCH5Q2WF5qMfYgWqlwEG8DadJrWu2JO4
Message-ID: <CAKfTPtBeEQU-7R0wPZeQXF6RdC_kDkbmbCcRBj_WZUCksU5gqg@mail.gmail.com>
Subject: Re: [PATCH 02/20 v3] sched/eevdf: Reset lag at wakeup when prev CPU
 has been idle
To: Peter Zijlstra <peterz@infradead.org>
Cc: Kayra Cizmeci <kayracizmeci@gmail.com>, mingo@redhat.com, juri.lelli@redhat.com, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, 
	linux-kernel@vger.kernel.org, lukasz.luba@arm.com, rafael@kernel.org, 
	linux-pm@vger.kernel.org, tj@kernel.org, void@manifault.com, 
	arighi@nvidia.com, changwoo@igalia.com, sched-ext@lists.linux.dev, 
	qyousef@layalina.io, christian.loehle@arm.com, pierre.gondois@arm.com, 
	sshegde@linux.ibm.com, tim.c.chen@linux.intel.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Nov 2026 at 10:03, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Mon, Nov 09, 2026 at 05:27:57PM +0100, Vincent Guittot wrote:
> > On Mon, 9 Nov 2026 at 16:45, Peter Zijlstra <peterz@infradead.org> wrote:
> > >
> > > On Mon, Nov 09, 2026 at 04:27:14PM +0100, Vincent Guittot wrote:
> > > > On Fri, 6 Nov 2026 at 17:22, Kayra Cizmeci <kayracizmeci@gmail.com> wrote:
> > > > >
> > > > > On Fri, Nov 06, 2026 at 04:19:29PM +0100, Vincent Guittot wrote:
> > > > > > @@ -8376,6 +8383,9 @@ static bool __dequeue_task(struct rq *rq, struct task_struct *p, int flags)
> > > > > >
> > > > > >       dequeue_hierarchy(p, flags);
> > > > > >
> > > > > > +     if (!(flags & DEQUEUE_SAVE) && !cfs_rq->h_nr_queued)
> > > > > > +             cfs_rq->idle_seq++;
> > > > >
> > > > > This needs WRITE_ONCE, no?  3/20 uses READ_ONCE().
> > > >
> > > > I hesistated to make it WRITE_ONCE but i concluded that it was not
> > > > strictly necessary because the READ_ONCE is only used to compare the
> > > > value but not use it for any computation or sync so if the compiler
> > > > wants to do any kind of optimization what we really care is : is it
> > > > equal or not ? so any intermediate value that we would read would be
> > > > ok
> > >
> > > Right, so without WRITE_ONCE() the compiler is allowed to write the word
> > > in random order byte writes. When comparing only cares about equality,
> > > any intermediate messed up state is not equal. And since we were
> > > incrementing, we're not supposed to be equal to any previous snapshot.
> > >
> > > Therefore all is well.
> > >
> > > That said; we should either document the above reasoning, or just do
> > > WRITE_ONCE() and get all the sanitizers off our back, because I'm
> > > certain that KCSAN is going to complain about this.
> >
> > I agree that it needs at least a comment. I can use WRITE_ONCE but I
> > remember seeing somethign about its cost. But does it worth having
> > sanitizers complaining ... I will run some tests and use WRITE_ONCE if
> > I don't see difference
>
> Mostly it doesn't actually cost anything. The thing with WRITE_ONCE() is
> that the compiler cannot elide or merge the stores, it is forced to
> actually emit the store. But here we need a store anyway.
>
> So the worst WRITE_ONCE() does it get in the way of compiler
> optimizations, but I don't think any of them are relevant here.

Ack
