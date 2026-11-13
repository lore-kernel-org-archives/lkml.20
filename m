Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794579053;
	b=jth7AMw6I7D4q+tVt6yquRqdzwKAuWZGGuL3XRPl4HjjFmywl5xZoZLnCyabYCfMO35D
	 oObch8udSRHs8QcN+8FWmBLKVpGo5ZY4K4foERUcmH9i59hPDCCJL2QKDduOxYHIz7wOs
	 FTs5AtxS3/8ri0Hwny+eP4iKLgV7n5nqWhPBlpsBd9VqDJo3z8KSIaALrA/3JhWjG/G1p
	 TDnMGQf2lMSVegH68enkzmh/HRNvR6ouOWg32Ruu1sLlHXG3Rxd+1/m59vhuqVgzjztNl
	 Vj+9b0zfXWpsgYPtzbS/Y74Me9XEL2faPtm+zdyKLM5caHXxWWdBNnFb0xPjvTZP+WQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794579053;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=f1XJaseqR9d0Qe5ryZSOvAPpdINKrM8PHHZTrTCpzcg=;
	b=BSUFPzBmE35T+anCTs1fSV3/hAe87kkgNd1Fc0JJzGeglH4PBLavKyiLJOCS+ONbI58/
	 mGHs8KNcAFZj/FtWbbw0tuYSEHNslUB3nNoXvbTqjgv3B1XUFGi1zV2KR5u7CFD8A37Af
	 dm0O2ZlguWScPGknxiwR4wNLIngbDcAAV7FO9YRoLlxLYqFLtdTo1kHrVDsYecbPthMy8
	 MGSeeJ45e8udXweQscrWOS3LGUm9nmiGq1tV/ca9CPlONMpxEyrSQMDfqpY5s3WRk++IT
	 EO0J+gow8yPSfiwBAMXzsLck/5O2G6kAS4BZ6avfFcU6AhAbi1ReUsf/6YHcrfii6tw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=AbC+Tdz5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE58B606A32E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:10:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE58B606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=AbC+Tdz5
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c5067a2411bso192538366b.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 06:10:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794579051; cv=none;
        d=google.com; s=arc-20260327;
        b=S4WoYK2juooRDH8fjzz8gF1nnj9vXa707DaLdgo/Yoo2uRHq8Kj1o7iy0isRXASu5j
         jDao/9WK1ubn3ilPQg69DhpuRr3KrG72nTw01NJtmR93OgtoNsh8o3jAAzpI1jbr5zPA
         5CzpaFVBVBGQjanSmn96kOHW8pwy0lPCmsdYD69c9PuwnoBJNNghXCgdu7Uhza780dwp
         K9qH1MXAEZzsm9WkXWQLOpJMqOh3H/pXCbyANUhy+BgY9EqUJTY3Tv6Slmdr7nS5MrUI
         BR8sM0/Q+oQpl7eOB94LMSElPzxAli/tvrcGmkBcAKE7uKb42cqkUbhhexaXgDHswjg9
         RJeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f1XJaseqR9d0Qe5ryZSOvAPpdINKrM8PHHZTrTCpzcg=;
        fh=wqpym5wdywHKX1k4LfSuYEIgziUVveNNjJlYs87qQ4Q=;
        b=CS3VKIxV+1iJKaExU+xUdx8uWuxy4wJMf2HbheLRNhuBDg/GovP4gZCmj89L6Il6j3
         ndYJ2VPe/UEFmrVnEHw6vIluvy6GkQwGZC3aY8MH5pGILtMEUMRAW4YZfyG882Y2qYSY
         L9tgtOTbL02YuxLDUv1wLnimd9V9o2aiti6pkUiEV7LPbNkOmA/u5QPEPK0NFHvuQQEm
         oikmR6ssEf/cr9Fm+tOgQwM6GslTv9H5Sxk8y52jApp4fIeCukU3Z7SIlGFhv4tOl/Au
         XAxdklKH0GobulKLZRPWh+CS0H9Jf8N63TNvO4NVQ3phqUep/015Awss5RMJsPJOazfL
         CMvQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794579051; x=1795183851; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f1XJaseqR9d0Qe5ryZSOvAPpdINKrM8PHHZTrTCpzcg=;
        b=AbC+Tdz5BNM/+pDvOWj8vZa2eqWVd07qJkU3cywFS2NfdCMvt7ROLqtXORyEkwE0Si
         bljcEnvRruroFDWfBKAA+Ht4+ArTiwR1VbyztyC58/EWUsR2vQH/uTpEr8nrpDQpZ69+
         sxM5TROjBrchPmK+gD2KlE4Tn0YMaQoZLU8HKkJ40AxSd9VMjOzoGwaTRoYrcafeZ8Tt
         9/rkiyGAAdwsjHhZW4Wgah0FBLYvblPphpFllZb3d0C7OGpgRlU3/TB8AjSvVopq1lbi
         NsPTJ3lsbx1E3MXqo9xIVF5o0U05cGwQV6nGCQtSDbiY8iKkIELH9SibccRs3R2JK5dy
         YJFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794579051; x=1795183851;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f1XJaseqR9d0Qe5ryZSOvAPpdINKrM8PHHZTrTCpzcg=;
        b=nly7OGDKqX72m2u1oHspvBxnb2CJTpQBl0OrvdUnwd0IZJOqkOFIOrinoaWM31VrOb
         9TL0I3BoRdsrcXWb/0sn/CTYsCT8PGNF8M+UWck2LkhJR2nrhj2UayK03aS5fs+I7/TB
         8sc1NsuvkB0qD/Lvh8QxhIIrN/eZFqmJnaHRWiOwkg5h2TDftWB72niqmdB8q4zMLQ/M
         EUjTzXJzlOeM1pHoBLS3sU2CK2cgJtI7r9oxzN3mBtYg5fB0fCpZuDeGzugM9wzZkk/P
         lCEZyQdiLIHO6ErwugSr5P/Z9opNY1RP5oDlFJkdJNN/bjbe1Bbu1umJ0iwT9zqxRqbv
         GJEQ==
X-Gm-Message-State: APuU4Z9fMnh5ui5HxVYtqD33zEu18weekTC3gktebxiZeypZCnHblAPQ
	/46NY17jeIs0NeTipxYqpvv+q2L1PqC99/Rxju2+V0P94iUAQ8L94jeHD7fUs3gmEWgN1lp7uNl
	yqAOgOuK4wb65GOBEEiE1OQdT3HQfvQTNzjV5d4EeN+ESK1ME3uzVB5k=
X-Gm-Gg: AYBFou2tTeaTkUW6vHE2wrfqY9WN1NNqYygl4Bs4aMtznBOAUG4swETuJ8mQdF2R3+I
	zYb96ECnOqJsmnTrlvUVAt9BijyT1VSP/WLUrwLwkaXwM2ViX8JXvlJ2Wf2LKudD+HrWQJiJGAy
	nT6rbtmrYr32PUoQLzGgIVg0j7WOb5BYAbmuGN4WpDm91JotcuQEdxGtY3ZNA6oZY1LeYY2msyd
	QvrvgNZ/mys0UEgx89+YwJSq3yaRO6pBR+lRAfbCJmwQFM2eCQJmS1v3jh1si9dPVWYJ2EtqliJ
	gGUuD3WOGXulM66ifqFnxUqAFdrTqGuJvazxxPbXOAxwOq4TzTt/ukjphpyXOG/FyoSxismORN1
	0i78+GR3cuew2gPp+9/5DiR7JazKXgfOK3iQTHTrCWqb4E6yQQoRUc6nhBce6eAHKfFEefg==
X-Received: by 2002:a17:906:ee85:b0:c46:d837:b358 with SMTP id
 a640c23a62f3a-c50961d1c6cmr227734366b.3.1794579051104; Fri, 13 Nov 2026
 06:10:51 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102110047.115375-1-marco.crivellari@suse.com> <3e2d11bf898399decdbbb4c96d10ccbd@kernel.org>
In-Reply-To: <3e2d11bf898399decdbbb4c96d10ccbd@kernel.org>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Fri, 13 Nov 2026 15:10:39 +0100
X-Gm-Features: AclHuK_RhJCVT2UoCSloMfRkPcMI3h1a6PcWy8miJKY5xia_9lpUGlYgZYcNPkg
Message-ID: <CAAofZF6zQ-kAJw=hK_CQouzbF1wY5RP9QubW32eJ+m1xXu5NHA@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] workqueue: Make WQ_UNBOUND the default behavior
To: Tejun Heo <tj@kernel.org>
Cc: linux-kernel@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Breno Leitao <leitao@debian.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 5:13=E2=80=AFPM Tejun Heo <tj@kernel.org> wrote:
>
> Hello, Marco.
>
> On Mon, Nov 02, 2026 at 12:00:45PM +0100, Marco Crivellari wrote:
> > This default is suboptimal: most workloads benefit from unbound queues,
> > allowing the scheduler to place worker threads where they're needed and
> > reducing noise when CPUs are isolated.
>
> I think this is an overstatement. Maybe just say that we're transitioning
> to unbound as the default because, while some users benefit from the
> strict affinity and concurrency management that per-CPU workqueues
> provide, for a lot of users they don't matter and they put significant
> restrictions on what the scheduler can do with the work items. Unbound
> workqueues now have non-strict (soft) affinity scopes, so they don't lose
> all the locality benefits while giving the scheduler more flexibility,
> which helps system-level concerns such as power management and isolation.
>
> Can you rebase the series onto wq/for-7.5? 1/2 doesn't apply there.
> a23c7afbc587 ("workqueue: Add support for real-time workers") added a
> WQ_RT check to __alloc_workqueue() right after the WQ_BH block. The new
> defaulting block has to come before that check, or alloc_workqueue() with
> WQ_RT and no WQ_UNBOUND warns and fails instead of becoming unbound. The
> WQ_RT comment in include/linux/workqueue.h says "valid only with
> WQ_UNBOUND", which may want updating too, maybe to something like
> "invalid with WQ_PERCPU".
>
> - 1/2: Can you update the description the same way?
>
>   The WQ_POWER_EFFICIENT comment in include/linux/workqueue.h still opens
>   with "Per-cpu workqueues are generally preferred because they tend to
>   show better performance thanks to cache locality", which now contradict=
s
>   the change. A similar sentence is in the workqueue.power_efficient entr=
y
>   in Documentation/admin-guide/kernel-parameters.txt and in the
>   WQ_POWER_EFFICIENT_DEFAULT help in kernel/power/Kconfig. Can you update
>   them too? While at it, the paragraph the patch edits is left with short
>   lines and can be reflowed.
>
>   In the new comment above the defaulting block, "Do this before
>   computing wq_size and before WQ_POWER_EFFICIENT can drop WQ_PERCPU",
>   "this" doesn't refer to anything and the comment doesn't say why the
>   order matters. Maybe note that the WQ_POWER_EFFICIENT override would
>   otherwise drop WQ_PERCPU and hide a caller passing both WQ_PERCPU and
>   WQ_UNBOUND from the warning?
>
> - 2/2: Saying that WQ_PERCPU is implied is enough. There's no need to
>   list it as an allowed flag, so "WQ_HIGHPRI is the only allowed
>   additional flag" can stay with "WQ_PERCPU is implied" added.

Hello Tejun,

I will make the changes and rebase as you suggested.

Thanks for the review!

--=20

Marco Crivellari

SUSE Labs
