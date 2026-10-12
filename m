Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF10367B86
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791796699; cv=pass; b=dbxzPTbeD+IyAbJ16xVJqITjujN/bIgbO8fq1mSTIjZ21HO/AiuZiVQoA4Ntx4Klcpmp/GnSPYq4VxBmVO3hnVF9bF+QjMJVVWlaut5dZsxzL8C2+rWPzHHqNOrlvqE6WTpK6t6HcADHlc2NXvX9UtA/Nt9jqMjcB4jYrOHJCek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791796699; c=relaxed/simple;
	bh=Qjk7fnAlrbE4/F3NsAOgm3PV1I2II+ar/lUKWdrB090=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KhNUmWuaDa3lhZdQkblQe5VVAGOhYV550i0OB1uq+1g+CH02IYe/xyOrlXb3MaSwdazCjrfZ9we5llCV0XxKaGb/J1qCzJd/EPY3cNjtgKx/dzvZo3NX3q1gmrnL06v3z+NZfpmJwKCX9SvixY5eyVIpqkNdzonFOHI+ZvnNSTA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pMnsCeN/; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pMnsCeN/"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so2390319a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 02:18:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791796696; cv=none;
        d=google.com; s=arc-20260327;
        b=qx8Am/LzDP6lRNvVWGxFM6ti35OCrsnpECH4uiiq2qUTZWgM89IAN1yhguHn60t9Bs
         0QyOh2qltLBojAlNtUwhhtgd/NQCHVYxjsMqYVGpka3WoszYwXbZLmgMa6EsmRPqsxvK
         ZiuFiqOuPN4E6eCv6Xj9uPkkQHzChP3fkrVQ7M2w4Re6ePvNgeOfLqo4a0iBN835DAnB
         65/yLE1Hz8qFVhW3mgajSAa8QBcyVIFiOO52CaW4tVfNPdGMmQrQ8UBxVoH142MAxk//
         Ob5g2DSsT/tecN92WkAXnteC8wk+5tT3JESeHwoVrvfbZZW8f9MVlHepm86o3t1K8X4N
         nS9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1biN2HNTY83zhnJs+D3TwuOQxRRYiRudFmWbhPoQzOg=;
        fh=6llqcQkAWcjw1m6cJT3eadFq//EptpTxDfZyDTIsBvU=;
        b=qJjU4WAA6V5za4PSBTCkoI/iOtcWBwLIBd/VDwq2en/q3lWmd8SKd22Xm1iMOR2pWf
         IEpo85nZUw9PI452hOO9oUZVxTk6vOCR1X3ni0dNGAnDh2WXxJP0yb39BJNRrVhEy1VQ
         IwioQ0dd7+sp7ny2eTrgQfbDZlxfbC1VYPF2ELXnaj5qs4fy+rHdk/WIAcNY9/GGZJkl
         DghiHOrlj8O5kC8r7+QKJJ5FvlyHrhjwJgqwziL0PUytmB9eecWV4fEhJ6a/4HFBqkrR
         L5hcK17XK1CbZAUlSnduNx+xpaIwPqh+i8NUto27hYkZb2+5OlHPNMvCIh9f4z/oUwOA
         Jmpg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791796696; x=1792401496; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1biN2HNTY83zhnJs+D3TwuOQxRRYiRudFmWbhPoQzOg=;
        b=pMnsCeN/KynwljdXrJMzjynLfit6Jn85Nn517Pwz/1Gf2sdNtbjLImH6k7VLnZpwI5
         O+CbuWnWFasQz7Xbnm23C+PnfaJl0oX/8505h+ilCKshlYFh1NUdyHgQBh/+ys6DBJ7J
         TlFxpXCbCJPoDkd+e7hngQXt3lafvlOIacySLmdEODjJNIFSKf+7/o/vu0DgH1T+oRKH
         dfEjU/o5o0dSehOpfaMAE6oJsb0pEOSXOebVIUDB6fOcw83KoaR1tbxqUb87N1bdz8p3
         wXUotbX+kBKpusWbf083XqIaMETyqtuwZ/Vp8T11LKU+giYLezgRF7Fb1RWlZhOj/6Wl
         CC3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791796696; x=1792401496;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1biN2HNTY83zhnJs+D3TwuOQxRRYiRudFmWbhPoQzOg=;
        b=kVej2gKN7z2tpAdZGAxF0LjgIGZ9Oh/Ga82YMHq/wE7jJrP+8I5uD0bLNo+ndTbJ+p
         E2keViZ4unSgaVl1Pt92VcCo/40sQwDTJk7fNxUNmdHKhKrnrF46SAxeQl0qpRgcuGwg
         sa/rzbgcL29zq0WY0Jnn7vmJWJE8s8yGX4sqiuW/RLZV8e+zvv/Ns8Kpj0KvXMz/7oaF
         iyRw2LRu1925o/FrK1ClP1oOOY2+SI3zhEgXilBMI/dVTwfkGS8V3XylsRzveXX0uPxG
         teNAun5TzpeJq1UOryoUzrg7YehcaCjh/vklzevuFOra7o2BWIP31/wnNSJ1sKJneh4y
         aCYQ==
X-Forwarded-Encrypted: i=1; AKwUvBxMYPx6tEr3t4Qx43e5cXFvSvpRP3aWVc0MPewXGZDFOLGy1FQkqfzTk2Ood/d7Odm/jCWribWw7leNFeA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4/qxpDCZaEDgwxwgiDjFRdoL6N+3Hxy8FojIwgN7kDGzP8tbM
	XRSwwNg/AChzJHNPldrRBrEcWC5sAU8lHDCqbY5HJTjQ+CNespcBM0pdTg+UR/aQ/Rz5lix4uPq
	fqZtTgwJmigxFsY8w39Ql9NwOBzv5cCv7zPg1ugSMAA==
X-Gm-Gg: AYBFou0sNyhjIVW/mvoquXPRe3V0bO6vEsYH/DmpVr2QwHMDZ43/N6X/m/HeQEDAoEV
	/JUvMwFG8PzA3qLPalKRtxH6hr/K9Db3zu4mmla0DWQdJ2zTOHzkTh+hhx3hyK22Ywk622LFDnq
	iS5Z1Krb7KRjH+WV+WOtuTkapEu7oXXNLxo9gZU8hYN3X4i1R6iAR1uwYJxctz+K2b4lReiclAH
	40fVVwgPO8Ywcjfg81csQfegKZM/cHqEmBVa9S1IL2UwhLNTS8c3aNqiv7uobtoOiF+HGrm9BJm
	oFMkdSxLcl6ETQ9HRi13kedySUxb/XzV9DUzVaRKuJgCVWJ5ZB7pMUoL1yXiLWQJA8WXsR3OTfg
	qf4vyHxt05G+R
X-Received: by 2002:a17:907:c0b:b0:c29:5215:b2d2 with SMTP id
 a640c23a62f3a-c31aa016eb5mr943230966b.23.1791796696105; Mon, 12 Oct 2026
 02:18:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002154415.2270586-1-vincent.guittot@linaro.org>
 <20261002154415.2270586-8-vincent.guittot@linaro.org> <asWyZtW7zPVo3k-A@chenyu-dev>
 <CAKfTPtCyRiBbxT_bU8egEuXtRsOW6TGw3TczyObBLKsE99dMpQ@mail.gmail.com> <aspc8doovTKdBqPC@chenyu-dev>
In-Reply-To: <aspc8doovTKdBqPC@chenyu-dev>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Mon, 12 Oct 2026 11:18:04 +0200
X-Gm-Features: AclHuK821TZ5FWAZ4M6gg4tQ483l6POneLRhBIaL6kMutdLqFFMPJC-y16mM1as
Message-ID: <CAKfTPtAy-n5_Dj-9x2qxcu=i7eo9DmZ2aaxig_nbyNDbP2m_Mw@mail.gmail.com>
Subject: Re: [PATCH 07/18] sched/fair: Add push task mechanism for fair
To: Chen Yu <yu.c.chen@intel.com>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, 
	linux-kernel@vger.kernel.org, lukasz.luba@arm.com, rafael@kernel.org, 
	linux-pm@vger.kernel.org, tj@kernel.org, void@manifault.com, 
	arighi@nvidia.com, changwoo@igalia.com, sched-ext@lists.linux.dev, 
	qyousef@layalina.io, christian.loehle@arm.com, pierre.gondois@arm.com, 
	sshegde@linux.ibm.com, chen.yu@linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sat, 10 Oct 2026 at 17:55, Chen Yu <yu.c.chen@intel.com> wrote:
>
> On Fri, Oct 09, 2026 at 04:31:40PM +0200, Vincent Guittot wrote:
> > On Wed, 7 Oct 2026 at 04:59, Chen Yu <yu.c.chen@intel.com> wrote:
>
> [ ... ]
>
> > > @@ -10414,6 +10441,15 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int select_flags)
> > >         if (select_flags & WF_TTWU)
> > >                 want_affine = !wake_wide(p) && cpumask_test_cpu(cpu, p->cpus_ptr);
> > >
> > > +       /*
> > > +        * Only a push triggered by cache aware scheduling will push the
> > > +        * task towards its preferred LLC. Pushes for other reasons, like short
> > > +        * slice task, uses the default push strategy.
> > > +        */
> > > +       push_cpu = -1;
> > > +       if (select_flags & WF_RQ_PUSH)
> > > +               push_cpu = check_pushable_cache_task(prev_cpu, p);
> >
> > Is there any reason that you do'nt want to migrate the task at wakeup too ?
> >
>
> The wakeup path seems to be too fast to aggregate the tasks, so that multiple
> CPUs try to migrate the task to the same LLC without synchronization - a task
> bouncing issue was observed when cache-aware migration was enabled in the wakeup
> path. We can double-check in the latest kernel to see if that is still the case,
> and to see if we can mitigate that.

Yeah, the goal is to use the same select function for all events;
wakeup and push events should be seen as the same event

Also you should separate the check for adding the task in the pushable
list in fair_check_pushable_task from the decision to select pref_cpu
in select_task_rq_fair. The check added in fair_check_pushable_task is
mainly used to decide if it worth going deeper in the decision with
select_task_rq_fair

Vincent

>
> thanks,
> Chenyu
