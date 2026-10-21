Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792600807;
	b=TeU4C+/jtu74iF/UF9jUrJ5gATXxHKNfYe6VYsyiI2fpx7i4s1i/npkJP7+FiFD/q5G5
	 9UXrKV2tSMN+cS04wuis5WHtQ6ZY/2N1j9j+9zPFn9TH5lPEH4o6gkwJpT9/eim+fyrYI
	 r6KagL7Pvj71k5mKOyX3kxxNlWZ8SCEB0NyGV+WluGDCAo2WYeaEQBEWv/DnKLEdHh8SV
	 ZQnsTuc1WTvvTUE4Dh9fe//EDbpiCgosOCpvA5fnf3Pk/8G8KhoosOQqXPi/1I6Ae16te
	 glvDmtDBij/e9kHukCQzklvm9KC6Jc2WIkTpI94sDl9PhmYW6nxVEQxCGc7B4sWNEDQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792600807;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=9gOUhyLHHkMJbpilfrmh1aBh45/2ZIo3brA+Cp6zFLs=;
	b=z0isHuQqHTSQAzmJjpvH0zyc0VmN/+AiyMECmqrQi+HWvuLEPspww+uH06T9liUPQ9Z3
	 1iSv9Fo9OjQ+lah3vm7PuSPWWLZPNtM3BpnBxue1hEC42tvpOXky7hyq6HpqSg+TBTp45
	 lff3ISm3dvQ/D22KIK7B7S9+95TFEBSxD1hNMsyGggojIs4WhfxvkEo+yHMDqtNwvX3lY
	 7muIsjZoBt6JfAnuEar91r/ZtZq8fIqqivAvb/bex3dgDsLvV2JEWqUiTrA2KFqjDyR3J
	 ioBvBO02uQAVUlP6KtiaK8LtkIe9hvCYx+R67LpysGwZWAK6BBWRxRWWWx7ruPvjI7g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=fjO05O2Q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BEBF606A32E
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 16:40:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BEBF606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=fjO05O2Q
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1d2ec9aadso62635e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:40:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792600805; cv=none;
        d=google.com; s=arc-20260327;
        b=myIoyGXTepfGFOS5mdKaHImZbXHqkxJM0Cw0knuNkrj8wUvpo1xOquOfgf9MOZPoA5
         UB9psfKIbUS/QZcd421KxZ7+OA+N2tgI/EmM80mod2/WMyQ5c/PjBMlWWioFPLKW7oqU
         jd7Y/tPM0WgNhub+oD1SxV08FTtMSWQibloB4ql9wd1p1cKUTdMkNpsO/AZzXvCttw4O
         Om5NnjtiPYUEckqWLMSN7DjTQjjPgUGQwiJLo1ocmL5Q+/T2Nbw58m+B67VAd5q3cSQh
         0Oh4UH5f3quV9qQ0YIsLQQTZqhS4yIyUvQjWFJ832KO/O5ldye+MX/NnHptCxvww9279
         d7qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9gOUhyLHHkMJbpilfrmh1aBh45/2ZIo3brA+Cp6zFLs=;
        fh=Rmy4emcFdtvKdi+DK/RCUYYgZ6q/dmH0TMGXG8zSO8Y=;
        b=mjOZm4kubXHzAGd5Bnd1wr/ZRkNJcpDPr6orKgQHzE2KZa6XVnrBkCaMODZt5GKxsR
         JQ2OePQpPGP97AN2VYaK6mmXGzzmGZ9hX6h3B/7xXjHl+NG7sAgu9ted1cST0j0wY8sK
         aOY/EX4rECdPkDvQjyUjFfQ10T15AedL5gZ0YI3timC5QUzTZycOrJ7CRsGw1iozQ/a4
         L4RdmFJM3QzUyNBBTuDt45WEgKsv6Mrj52RT9RBuPcpVAnreo/sTmjquMzKJ55zA+6aK
         s6HqrEFBWMfoSpnW+uqo1ZbFLNXSTYFHiyY6KofKyR3CLnaXkm+Ri9AFfpHw4KHuIo2r
         ou2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792600805; x=1793205605; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9gOUhyLHHkMJbpilfrmh1aBh45/2ZIo3brA+Cp6zFLs=;
        b=fjO05O2Q0qGAPz81SNh/wciIGLSVT1/aMsj6RZh1P7UKkYUE2JsJlY1gD7dCqE2jP8
         GbD0n5CmgUlv593JGStjdrJJ4k1DC3DRhq4qeK26T+op8QKD4DNA/IEP4BwGmjRnD/vj
         p0UwCNmLmKxr3bMk5UsiQn3yDNx5KXdGGgC0XySv5dgiLy+O70DnLUr2FIw4nEYRk04T
         9xWQEmITDxv6n+2mrPdyxWaWWOg8PKlCcn1C5t/KmpMCP6p2D/laetw9OkCC8vpHr713
         Fg0EBR85vvRdeW12s7uDq240KVnroB/GPTGurUk+skAjqwjOKY9SaumizECQEpuvDLPK
         RCvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792600805; x=1793205605;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9gOUhyLHHkMJbpilfrmh1aBh45/2ZIo3brA+Cp6zFLs=;
        b=BEqoaXQ7jQDVn2AjU9n9NSAebUXDHTgkbuIw+dw33Q5O/vDIbevPy+XOZWBFcSFJIM
         eIKlrAuWGloUxXEqNwKATn/tIe/UVQ2j/217NcCfwuygWJf+Bh205yyl/fUcKboxyLkj
         xKYiCiw8d3mmjTdM0FrwwBWgkzg+qHKpyw4GFd7D8zl5uiY9c2UA28dg5X0JVtMgXXVr
         BOm21TZUinpvbOwBAGnIji9bJvyvYh2iTLxPQV7L/btF4X1aeA6tdHHBhJjTrBbGbyGQ
         QRXCxS2qz2t6gtVdzMhW6Pcoww3ALgprqelkZT67rKrq5gJhiRyX/rydj0fb1PURBMfv
         eWnQ==
X-Forwarded-Encrypted: i=1; AKwUvBx+VoigC4AiQVfyY2a2hm8nLMnj8av4S0o4HSWOukSEEffq3zC6xircu3WzlPlxXKP20/QC52z5WbuOeXk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJiHDRKWg/cjKdh6+l5ZQZbPQVaXQLBxnCDQdvavK6ju2AfRAzt
	mCAkcBJcgGf3f1kLPzm8TnC0Z96ldnfq2NiD8oirNVEZG7cq1WbHyxZlFKrN8AEzdsvIk7EtUuo
	OF/pvaQaHWUvHBLJE2+/vH4EKkwOPtT+1d6lzlqXt
X-Gm-Gg: AYBFou3rH8Bib197fG32IKzeySAg2H02U3kzjG13mBv0Rq5j2LVIEXhZrHC2ruAZEqQ
	gzlEQF/Bpm+RcL7sB1Y537qy5uzgWFe0C0A8irAmvIDU/RrdllnXum9ZE6tQGcYtn0lwdrDWgk6
	/k2zYYSzzWb2FPhzMRWvgk+Unk1S4xSPGDpffg1XAHkPgioqZ/XfoPVaTIDHCLbKPuLG1KBhY7j
	Pb1qg3Xty9JiUylHLVIgjtklwAnIrJQeMWqH5aiRJluBeeiyRJVPqF7Mxg6ZMjVKwvKPdQt1Jog
	1bBRfx9FBe3RvgG0XqgSijzMC0ZiBobbNachrHAseaBtac9Q4ltKGcZew+xooRDcm1ReWScCQGZ
	2GQ2G2ZwGLGcQiJNP2lToPq/1TDBB5nlM8/hKOMKSmKajMgZWNAt3cTiHIzQnw5svX145/rhYjI
	fCF+aqoa6K+nsr
X-Received: by 2002:a05:600c:2d05:b0:4a1:eccc:7807 with SMTP id
 5b1f17b1804b1-4a1f5985a37mr1368455e9.8.1792600804895; Wed, 21 Oct 2026
 09:40:04 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019182622.1584454-1-vincent.guittot@linaro.org>
 <20261021131313.GM2823843@noisy.programming.kicks-ass.net>
 <CAKfTPtDOZ0=nrQe1-WSTamgU0qqdJVvD3KZPtnsqwwnE53BSKA@mail.gmail.com>
 <ati_o5c-SoiOp529@scheduler.schedules> <20261021145042.GQ2823843@noisy.programming.kicks-ass.net>
In-Reply-To: <20261021145042.GQ2823843@noisy.programming.kicks-ass.net>
From: Josh Don <joshdon@google.com>
Date: Wed, 21 Oct 2026 09:39:52 -0700
X-Gm-Features: AclHuK9kE_MPdzQX8tUVw7v8ryQgrlgBpnHtL6HIx0LDZ771blfjDouEHb53TJg
Message-ID: <CABk29Nv2ZzB1KGEuPmx4VmxTJ6pKmikGMr8cvzzDhHZSKpkgvg@mail.gmail.com>
Subject: Re: [PATCH v2] sched/eevdf: Fix sched idle task group preemption
To: Peter Zijlstra <peterz@infradead.org>
Cc: Kayra Cizmeci <kayracizmeci@gmail.com>, Vincent Guittot <vincent.guittot@linaro.org>, mingo@redhat.com, 
	juri.lelli@redhat.com, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	kprateek.nayak@amd.com, linux-kernel@vger.kernel.org, jakub@okonski.org, 
	longman@redhat.com, tj@kernel.org, hannes@cmpxchg.org, mkoutny@suse.com, 
	cgroups@vger.kernel.org, jstultz@google.com, qyousef@layalina.io
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 7:50=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Wed, Oct 21, 2026 at 04:41:52PM +0300, Kayra Cizmeci wrote:
> > On Wed, Oct 21, 2026 at 03:32:59PM +0200, Vincent Guittot wrote:
> > > On Wed, 21 Oct 2026 at 15:13, Peter Zijlstra <peterz@infradead.org> w=
rote:
>
> > > > What is the actual semantics of cpu.idle nonsense? Why do we care a=
bout
> > > > this common ancestor?
> > >
> > > AFAICT, cpu.idle applied to one level and against entities at the sam=
e level
> > >
> >
> > Yeah. Like on here:
> >
> >     ROOT
> >      /\
> >     /  \
> >    /    \
> >   GA*   GB
> >    |    /\
> >    V   /  \
> >   TA  GC*  GD
> >       |    |
> >       V    V
> >       TB   TC
>
> (marked GA and GC with * to denote their 'idleness')
>
> > If GA is idle and GB is not, while GC is idle and were looking to TA an=
d
> > TB we gotta choose TB. But if we just look to GC and GA we would choose
> > neither. .idle just applies to one level as Vincent says.
>
> Yeah, that's what we used to do, but the more I think about this, the
> less sense it makes!
>
> Josh added this (added to Cc now), but we have a number of Google folks
> on Cc already. It would be good to hear how this is actually used.
>
>
> So in your example TA and TB are both inside an idle group, and
> therefore one can argue their behaviour should be like !idle. But their
> common ancestor is root, and so the fact that they're contained in idle
> groups gets lost (which seems crazeh).

TA and TB have a matching se of GA and GB, since those entities are
siblings under the common ancestor. Since GB is not idle but GA is, I
would argue that TB should preempt TA.

Consider GA and GB as groups representing different users, and user GB
has internally decided to create an idle cgroup GC to adjust
competition between its own tasks (TB and TC). This should not affect
GB's overall preemption ability against other users.

However in practice doing the exact computation to determine
preemption for relative idle properties (especially on wakeup) is
expensive and perhaps not strictly required. This is also why e.g. the
whole sched_idle_rq stuff is imprecise. We keep an overall tally of
the number of tasks that have a cpu.idle ancestor cgroup and use that
for wakeup placement, but if we were trying to be perfect we would
need to consider the matching_se stuff for that as well. What I'd say
there though is that imprecise placement is better than imprecise
preemption.

So overall, I would say the find_matching_se() stuff gives the more
ideal preemption decision; my first preference would be to keep it. It
avoids a regression with users who delegate cpu.idle internally within
their own cgroup hierarchy. FWIW wakeup preemption already does a
cgroup ancestor walk via update_curr; find_matching_se is similar in
spirit.

But to be clear I also don't think it would be terrible if we did
something like you suggest, cache whether a cgroup has _any_ cpu.idle
ancestor and then just make a single decision on wakeup comparing this
for the two tasks. The result of which is TC preempts T{AB}, but TA
and TB don't preempt each other. In which case I would suggest we
cache that as a part of updating cpu.idle so that we can avoid a
pointer chasing loop in se_is_idle().

Either of these two will at least also restore some semblance of
respecting cgroup cpu.idle in wakeup, as the flattening made it only
consider task level SCHED_IDLE.

>
> But worse I think is T{AB} vs TC. In that case none of the common
> ancestors (root,GB) resp. is idle. But T{AB} being inside idle should,
> IMO. definitely matter vs TC, which has no idle anywhere.
>
> So I think I would very much like to change the semantics here. The
> current stuff makes no sense.
>
> Anybody, please chime in with how this idle crap is used and expected to
> work.

Hopefully the above makes the use a bit more clear; cpu.idle is both a
weight thing and a preemption thing. The weight part is respected
naturally by the hierarchy, and it would be ideal to try to respect
the preemption part as much as feasible.

Best,
Josh
