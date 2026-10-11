Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D5E353A81
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 17:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791740446; cv=none; b=bvJcKWI1ADFmBmsQHGcUkZ+vBwUKmROSc+wNQe9H4J0/c/og0ZFmdt9X/BuZQbIoJk+WwmqvG0b1+gGY/HaGURWhlpUoicf/pTCbRTo5Oy8hM2Q6KFzZF/e1jHCsp59eo+i4AVL0VtVJaIvpiWThIqK6DmPretRf26GsD8gc3Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791740446; c=relaxed/simple;
	bh=w3rpF15i6oAhEioYAhAAF+3ymkyfHG5hhIacF+l8vRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cu9DAqjN0+ROP7J/rUxq5NrbbS0thbPQi2VBC3Sc+sO16IJPrTygREHQmgpL/sNiCUWnZZypYuIspEkRJiIRWaCRAQWD6yN2+USXTL5b+xEm+2LbulaapsTUISjG9f/0I7iq7rYDtbGIGic5iI9O9nuLsmAVPJvot8HKAS2Xv0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pNzK/Mbv; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pNzK/Mbv"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a172da1049so543285e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 10:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791740443; x=1792345243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zvh6uQ9bGzCwbdbYbC1n1+7RZUsbZpcs8nWAcUfwSlg=;
        b=pNzK/MbvaGVD96sGgqNDpwDXdrmVs8spLgt000yM3PEEO12zAuWICes0SOSP6Sj86J
         vLp2OiI1RD16t14XvmrmsQkLzcy/rVTv3Ok2Dp337ZeG2yFyC5cTImFHCqSdXWRbDLRd
         Ldm6klsv5EKbiqJSxuiiRlt+GkX1YOtOX4sa2wy3UOdzoyqClxpUzg5fJdcBTQXmCY4u
         QaogKvQ7ZoeljCfJ0kih4CXp4t1n85pMcLzBvgcCfuVeXOoe7OwALHylyLP9iPRhXGUx
         kUWFI6kyf9QGxP84MegV8T9smXLb+9rqkeop+ZtAi7uzReYQiZzkEqX/S65HXToSUOoY
         Jztw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791740443; x=1792345243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zvh6uQ9bGzCwbdbYbC1n1+7RZUsbZpcs8nWAcUfwSlg=;
        b=kE64aPsrXV4DQL0z8Vj47BAylDtWE52euI8PjHGEG+EFaouE0U4hBbjxXykEcBMxFg
         oIKjt2HxQAyFVcaevu/q2hBkmcd8ZqoDpNf6J1RFbcS2R5g7T6Ba9nKqGws1NWRSZTWB
         jDcNznPlUCNKewmh66S+44i5m30Z2BV34Ahr+KX4jk5BrolNWtRBE36aEXnBK3JLvukk
         Zs4ZFpXw6sfLI4XneYLVT2cD/GrbfHVfRej5F9vIyz99I2Bap/lHvaODIYh1bpvOaciJ
         1z5kBtZ6WrSfwz0ofQ63c7h3f+CrNEc78TSg/XB7av5JrlelC5ldTFEObJI8VhnIRQzO
         fp6g==
X-Forwarded-Encrypted: i=1; AKwUvByG+aXrJU83BGPTiPlpYzsWcJTXnS1fCqika1HUsAPapU1o53knOYMRKR7eItjOWzlETpvM2l8KSFtxOOg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLlmAktjH6il+0KiFv2/IqsBxXBTl7WnZeBY1VDC7920o0R5LGb
	ZDKrGrdfHCzvFk+Uot2nhoZHGLXP01BbZggfE1wqnAYjtS+dGtG5I3PF
X-Gm-Gg: AYBFou0RcfurZLcpXXrQetchKcXUU4nuoOQOuCM8uSVEncR5d3NMiEG4QoEhx5cYXm6
	BtKgX4Jixg2bDLgpemONbAOCxZVaiSOSg74rbE6FIL6cmhC1lKGccXSmW4slQf6EiKpMqpDbck8
	wtCX5JjS8R++BgtbORCO6GQ4bjjBZp9YJxx4fvTDt8BDCiLlGYLURMhVOyAa63WgR5L/s05Wj+b
	DJ1reBeLUyMm2Ww5aQ+7n/O1vlG/XtoOLjGqJ7icmgK4B5SqMAL3nMa1D61q7gy+HUS0RRZHcS/
	RWrb70PSQByQuIz0MSRteSYSBRdOwd5rUp4LyIotai/UzhVIeJE/x70sidJ8tms+USwzRTn5PBn
	+6EIJrcCFUBkWX3trrcqgwlp0As1RRVpdj197LiwJ68o74sAVz4wjJfPrag/4BdkCUP88P+I7Aj
	gBonJhwQZu6ZLzYXnefR2GNPYZ0CFy1OEZ1XO9BprsTieGnVWRQhSV/V+GRIvyYgr81U5rETkVc
	cNPbQdXdLMhulCDkbD5
X-Received: by 2002:a05:6000:46cd:b0:487:10cb:ac16 with SMTP id ffacd0b85a97d-48dbaade0e8mr7581774f8f.4.1791740443065;
        Sun, 11 Oct 2026 10:40:43 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9463049sm15688482f8f.4.2026.10.11.10.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 10:40:41 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: vincent.guittot@linaro.org
Cc: arighi@nvidia.com,
	bsegall@google.com,
	changwoo@igalia.com,
	christian.loehle@arm.com,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	kayracizmeci@gmail.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	lukasz.luba@arm.com,
	mgorman@suse.de,
	mingo@redhat.com,
	peterz@infradead.org,
	pierre.gondois@arm.com,
	qyousef@layalina.io,
	rafael@kernel.org,
	rostedt@goodmis.org,
	sched-ext@lists.linux.dev,
	sshegde@linux.ibm.com,
	tj@kernel.org,
	void@manifault.com,
	vschneid@redhat.com
Subject: Re: [PATCH 10/18 v2] sched/fair: Add force push task mechanism for fair
Date: Sun, 11 Oct 2026 20:40:38 +0300
Message-ID: <20261011174038.5334-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAKfTPtCAbreGDhesDmFNvXEzjj+anmOH1=jqT-1B6Lfj0FfPqw@mail.gmail.com>
References: <CAKfTPtCAbreGDhesDmFNvXEzjj+anmOH1=jqT-1B6Lfj0FfPqw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> >
> > On Fri, 9 Oct 2026 at 07:53, Kayra Cizmeci <kayracizmeci@gmail.com> wrote:
> > >
> > > >       task_tick_cache(rq, curr);
> > > >
> > > > -     update_misfit_status(curr, rq);
> > > > -     check_update_overutilized_status(task_rq(curr));
> > > > +     if (!tick_pushable_task(curr, rq, rf)) {
> > > > +             update_misfit_status(curr, rq);
> > > > +             check_update_overutilized_status(task_rq(curr));
> > > > +     }
> > > >
> > > >       task_tick_core(rq, curr);
> > > >  }
> > >
> > > Hm.
> > >
> > > I think this mechanism added on here does not works.
> >
> > Ah yes, while factorizing the code, I removed this main diff between
> > tick and put events

> In fact this is on purpose.
> fair_check_pushable_task() is the function that is called to decide
> wether we try to push or not a task. In the case of short task, we
> will not push a task that is already alone on the rq

I'm confused. So, is the added tick push mechanism not working at all
on purpose? For future use or something IDK.

Before the fair_check_pushable_task call on tick_pushable_task():

if (rq->nr_running > 1)
	return false;

So now at the rest of the function, nr_running have to be equal or smaller than 1.

We call fair_check_pushable_task() with next = NULL.

There are only 2 paths that can return true, one of them requires next to be true,
so it never works. The other one:

if (check_pushable_short_task(rq, p))
	return true;

And check_pushable_short_task() does this:

if (cfs_rq->h_nr_runnable <= 1)
	return false;

As I know, h_nr_runnable should be smaller than (or equal maybe) to nr_running.

nr_running can be 1 max, so if h_nr_runnable can't pass nr_running it will
always be smaller or equal to 1.

Maybe I'm missing something from the start :-)

Thanks,

Kayra

