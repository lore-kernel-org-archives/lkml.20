Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DEE49DB9B
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 15:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790782259; cv=pass; b=U61RlW9kkiL3fD1uInth6beowIbIs6FAGBDgrRjKyy3ue8RclebVQ7658FxZ3Hmmy+BYS2fMMkauYXcs56B/bXr+eAL2ToiOrZo7y2uLqKLbCfMCyupMiI3LCzYwVyZ7xV5a0c4eWPM8o9G6E+4J4BHNOuC4zE9j+fb5+ishTyA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790782259; c=relaxed/simple;
	bh=00CT11zds5LLvEUih7SkHxE2iwVGb/CEnwh2GAbFAFg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CUOghlcMi/yqHHeENNdwhbfuXqOim5O/YaOGLryQS2lmtsynAYt16ataL83TibNdNpAJ1ePqR7knRbUKQcRDPIhyJ3jlhRp5N0FRegdCG9UqUvg3CMvs2psdOeV6Goju2889G83U8j2LWNEDRX47fUvKUFMhRCFQ7KvUsvbVgTM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BH1dIPdw; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BH1dIPdw"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a0061bf0d3so14605e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:30:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790782246; cv=none;
        d=google.com; s=arc-20260327;
        b=GvR3q4sih0s/e/wwnFU9Yc2lorfGKB/hHhk3ZQbulTAaWTbmDL6jEhVfHt/ruJ1Bvj
         RG4qvRJwjTZjKx7ygYbSE9V7QMQk32cTVhYsGrQdnDJrXU4rzrBY0A8RTbwi3xn1GxzH
         IWeUAKcHCHJoGDHNZ1zTNrQ6rlQirt9AN1aWRdYTcsMNnh/4bKD0o16WCWoVtBjpHw/s
         RlP3IX1+FPPmAfXv8Ns50jz1pHf/ze3FlUMAQXhqSj0bvcn7/ZeCPyT9wrjq/e3pzOad
         G/S69MFcMmHylttUMO9CHwr7PwYu4L9jCaRDptG9h3IfNqzsCK4xFTAV34HDLyYBjqvj
         BaVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=00CT11zds5LLvEUih7SkHxE2iwVGb/CEnwh2GAbFAFg=;
        fh=wpzEc+Z/WfIGr2i/siewUstysVb1hmF+PPxL0qsIq+c=;
        b=UsF9+s3Bxwoz4/acBUa4w18U4QUZ++AQ1SsiJNrytuYxqUDhkD1IHAiK3ahWcyk58U
         o4KxN7KwLZg2k/PTUEqyohGJ7veVQ0xaBhSZ5mYo6zg3j3NzJRRQrmI9kydKogwuRlx4
         r8EhJz9iQuyWOP/V+atSAwx2LRR3tHIcb98JlJu0yRoMk0d8dguZykw7OHXEv+z5Hynb
         msz/V+5gfoE9k2TSxL6G7hTUx9tN5/a7kyJ9LXOaNN3c+MjX1P/MSLDESjeqiGcg7Spa
         FXHVd5n8/grYMeK9nAbhyRmWByC89ZYNRL9c+dPk0gO+qkozZuM2PGrGmtRqSmcbNmpb
         xp1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790782246; x=1791387046; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=00CT11zds5LLvEUih7SkHxE2iwVGb/CEnwh2GAbFAFg=;
        b=BH1dIPdwLOQI5jiwdl/+Y440AwkV/P9oDNq8vMeQG6+MDtNayf+QFybKW/MouG+Lvr
         +LpQ8MwTUSug85rMbjVIa2++rcVhI2sC89+TKeiQK0AwvrDsqlcc7t93zRD+pFrEEvcw
         BfSo3QrU28xenu9t29td6/OoD/ki/vdL5xqJvOsgIqdbVqV8LF3DG3eX2GAAzeRgBvdH
         SEPItpKwT0Zyx05VrrfyiLgZsuXw1cq69Ua/Z10N+Ic/J15Xa8OIXiXAA4Pls91sB916
         CLv3kXoIdbnX+/5YXfS/JPUWnyOIrP+/CYUhFQ4PZemW2kZlmU//wjoeWUwLLmQPkcnY
         0w6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790782246; x=1791387046;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=00CT11zds5LLvEUih7SkHxE2iwVGb/CEnwh2GAbFAFg=;
        b=EZK0S+nHMNuaB+4ZG5DW5eMymdzP84pSlIICZuuiGxOdNOBSy4/LOxnmlkZEnpWczA
         xOJgh87KoGXp2nGxBKX1EWVRbYcg3gQAXER3/Tcc5H8kYRk9MbYH1SITz9G3HxxIO7aR
         s54BzrfvssQ8vwgTryKatSfDYfA0Us84QspcmIwQv5H+0qNjCUG0qdFKAiNmHbKlkhvY
         0dgjW3Mp8jtIHzwp4yyVhk+Alsb6wsuNf6HiEd0oHPY5Flt5EGd/Z4sYfSFyvCVpr1g0
         W8BXEdMd98jObLtzhpsmhIOeNZ3vKZWITE+GiEiVdrawN+y7kcUVJfv/NAqBjX6kB/dt
         tELw==
X-Forwarded-Encrypted: i=1; AKwUvBwcjHsg6b6K2PumJX5IzU5ejFQrEcCRdYBNp6WG0XaCmHM4CFCDzg2CfOOK8mtfSvy6mQr/+HjqEvzbIoM=@vger.kernel.org
X-Gm-Message-State: AFuF++k6IynM5dbpkIhgUXsXJhP74AGUNFHrXspKKu5p1IKhCN7doj4z
	ilh/CoV+8BRXk4yZUsrMOGvDvLbH8BHyvDJFIz4zhGMucN4QaGe44lGRpqFARl2dR95hrxvjuhx
	9zYzmmPyRV6jqxtmgPwFY5syKijXUZf7do/uAazvIdusNe3Xq+G4ht46M
X-Gm-Gg: AYBFou0WzwxZnE27GLMkUPe1sfHy0twDM4pIovIuMt8XDV4PSOYqZqPsfnl5G1y7Vta
	2s4WqDllCOy9CqEO9Jv1m/l1kOTbwn50LfjscTMgQEwMdEOv1D7ZFjRlpH+DOzlsbgbFFRoffi8
	H26lqmzNwrx3r7gvoYFCcU3SKaOi+GWCrIvBgzag79GCCM9SwOkLWIsF4oA5THlAlV6z8RFeJzn
	ks/b6lw+Z7ILujq5X5yclePgLBtb1WGcwzVc8fVbCMErqJ8jrbXcGnGAz6xhgjQVhNaatwVk0zO
	WIiRr+TETruCV2c4LEEe5HFeW+RPRXLtGjbm1DP3sBE3SA3IE467SA0sXqHbgI9qDagg7Yzwvng
	DsgCpg77tow==
X-Received: by 2002:a7b:ce89:0:b0:4a0:1004:c2d4 with SMTP id
 5b1f17b1804b1-4a014a8ac71mr876185e9.5.1790782245240; Wed, 30 Sep 2026
 08:30:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928233743.3777102-1-stevensd@google.com> <20260929081004.GS4120091@noisy.programming.kicks-ass.net>
 <20260929081740.GH4121620@noisy.programming.kicks-ass.net>
 <ar0bPEyD5CBK331p@cmpxchg.org> <20260930151902.GO88198@noisy.programming.kicks-ass.net>
In-Reply-To: <20260930151902.GO88198@noisy.programming.kicks-ass.net>
From: David Stevens <stevensd@google.com>
Date: Wed, 30 Sep 2026 08:30:33 -0700
X-Gm-Features: AclHuK9iAsAIpzefYDTrYfo6uYpC5DrbFBPO-pYQ944j_YWb1VpgmqVfpwJuq_g
Message-ID: <CAOiLmNF7m96HVP0Wv+6+r5bYdXuyJ=mzOwg8iJd+aMdsdWmVbg@mail.gmail.com>
Subject: Re: [PATCH] sched/psi: clamp negative cpu_clock() skew
To: Peter Zijlstra <peterz@infradead.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Suren Baghdasaryan <surenb@google.com>, 
	Ingo Molnar <mingo@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 8:19=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Wed, Sep 30, 2026 at 10:22:52AM -0400, Johannes Weiner wrote:
> > On Tue, Sep 29, 2026 at 10:17:40AM +0200, Peter Zijlstra wrote:
> > > On Tue, Sep 29, 2026 at 10:10:04AM +0200, Peter Zijlstra wrote:
> > >
> > > > > When running browser workloads on an Intel N100 with a sustained
> > > > > psi.mem.some of 2-3%, this underflow is observed once every coupl=
e of
> > > > > hours.
> > >
> > > Reading is hard. This is sad, that's a relatively modern chip :-(
> >
> > I'm still struggling, but I'm under the weather so bear with me.
> >
> > That's a cpu_clock() implementation issue, right? "The value for
> > cpu_clock(i) is monotonic for constant i". Presumably violating that
> > would be a problem beyond psi?
>
> Yeah, although most everybody has a filter on top for some reason or
> another.
>
> Mostly it could happen that when the watchdog would detect the TSC
> wasn't stable after all, you'd be up a creek if you didn't also have
> this filter.
>
> But I'm very sad to see modern chips have shit TSC, that wasn't supposed
> to happen.

I ran artificial memory pressure tests on the other two devices I have
at hand - one with an Intel i5-1245U and one with an Intel Ultra 5
325. Both devices also observed negative elapsed durations. The
artificial workloads were much heavier and actually produced negative
elapsed durations every couple of minutes. So this doesn't look like a
platform-specific issue.

For reference, the negative elapsed durations I saw averaged a little
under 100ns. The largest duration I saw was 371ns.

If I'm following the code correctly, cpu_clock() on x86 ends up
calling rdtsc() via sched_clock(). The rdtsc() function is documented
to produce non-monotonic results when compared across CPUs, since the
rdtsc instruction can read the tsc out of order relative to other
instructions. If that results in get_recent_times() reading the tsc
before it reads the psi state, then I think that would explain the
negative skew. I added a rbm() immediately before the call to
cpu_clock() in get_recent_times() to match the behavior of
rdtsc_ordered(), and with that I didn't see any negative elapsed
durations during overnight testing. This does suggest that calling
through to sched_clock() might not provide strong enough guarantees on
x86 to satisfy the cpu_clock() contract.

-David
