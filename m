Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21EC547C106
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790057229; cv=pass; b=ryj/x5l2DLIK2LDnLnKyPwwvnLFPT6ZxRjmTrse8TBpijNlsqrYpQ0W4limzryV0N30+hvOM8/xMc4uKpDugkcxIontrwH6XMG2YxefJiZQtho1N3r+bFm/2JhBtO+gc4Zj1QdqowbFh8s0SudhLZCrM8CiZE6qLTMxOLmWyRxw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790057229; c=relaxed/simple;
	bh=5fWqbJe3JR9DmH8/z7FP/hZG9dO5LN6gLcpbeHnCM9Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QeIosPw36VpDD08RWpWeeGSpCVWINRVb5RCOCcuW47e7T3NRCs6bypMc3UjOXqhwwMs3z76Ikics5lZjwIScP38KkCOIVbHoJs0yQgGDAux/H7BsXDssA12wCUH0rxRgpDyPUojrEWLwBApHlNzUWyS2frKAJfjhdmuKw0hndwI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OJNxMaq0; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OJNxMaq0"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843c3ea1f6so1505603f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 23:07:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790057226; cv=none;
        d=google.com; s=arc-20260327;
        b=p+g/89c2mPoT36GqfL3WIAUypSGSJuShOmGqftvIBQCt+2V4YJFNAUWTZ0W9eb1tHW
         HXjavaDZIbbfGOdtLvnxHtKPQmqDbaLGuOLaH+NDRMThl0doId0jqp+HbeexIn8qfmjx
         07e45UjufFcC/5m7pipjef5BGQ3ijezkBraGao4eOL39EFXZhwE90UoB3pYLhjaAkN1T
         Y5XrdD4G7hLbkw/znrdX/bMatT6i4v7qBGobNtkSJ6AgLtSIXhgSLU+6Bqa8VrVHjbpb
         3m2VTcB48W73EGAbX/IkfaKZicSZo7wYPx/xSU687jbnJbBOzoH92cxCYRk/Bhi5K7OI
         4MKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5fWqbJe3JR9DmH8/z7FP/hZG9dO5LN6gLcpbeHnCM9Y=;
        fh=1UE2vdMLyp44WrVcpGXGCG5bkylmEKwO3QzJ3UiHomk=;
        b=JbWwwtSEljv6T4gJiaw0AzlyvE+MUNMVSgBRWEbGD6qTQRHRymEFvYQdl0gPVGpYwl
         O/PiaKaYJ0mZOBdztdPseye5H7hC784YbrCUet7tmQw5j9WkqoXApHhZX5BPCU1bsdLR
         GgVMInBV2wKjzM5f/St3IPkoMb5mOeWjCt1KXfN+2G2HdN7gM8JcbuDXfo4CpWQdUXZY
         XCbutDhNijrzjCSjOshGXDhzfXA4+ynD3aeC7XSwlyoYEjc3RC9nhGE5hmRmBuCa9oAn
         1a2RwPcwuoDnMOPSOeFfgNEQ8DopVHQ54aUO+Ve3N7atePAFSkYA5NEEFD286DeuRdHo
         MApg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790057226; x=1790662026; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5fWqbJe3JR9DmH8/z7FP/hZG9dO5LN6gLcpbeHnCM9Y=;
        b=OJNxMaq0jPcpBmNjO8KGa0VMtmdvLdEhbjSs8iLHAs1fvTd+IkCnj4k1qXLg8+QMac
         eUK9zPIw9GXYKihRUUh5cIXYEzW8K5+BwmPaPhbJ+YbO/OCDEzZZs6SCjzzZCkuR8/Q3
         +mu6kLog7MwC9BDGBqLMHYBgix60MVXLvqnkjme48GoT/dS8bPfbhypsZosUSGr3SF8D
         9Xh5bt1K42HQTiCG5su+06C1NFmIAiZ0oTU8DK7gSoWIEYze5lB2KP1Df7X0SsG8zFiH
         yrBdRtU+U8iid5/V26zfC3b5rjyJqkS1SV3OgUODwDp2BP1dp9cxVJgLH+O8gvPrZoY5
         CmmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790057226; x=1790662026;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5fWqbJe3JR9DmH8/z7FP/hZG9dO5LN6gLcpbeHnCM9Y=;
        b=dFBRuo91PEcE/DAnnNidNTzxFaeRJ/BPHW+jasrueobaMt/McpJxFKy34IjFm9LJzr
         SwOWCvCXOQo7w3+WdsNHjBq7Lmx0o+K3YR9OSL5lVAkxp2C9odqSBQe5MMIsUGrACnPX
         10QOLZEenV6lUy7qBcDP2e0UXXtB/ZFkN8RfIyON80Q42hb35/7AI0w9yTN0ipoCyVuo
         YFArRjZ+ulux3/oM2UfRRQcmeQKaiiybePzf2bvgY0M6LEQd6rvWDYuakvx+4T2FJlEG
         BQB2Y8LqNQ5GchLd2FEHlNG7p2L0NRw1Tay7fIMgtIbrZeTRp6Oze/fcUGgZ4R5k7A2g
         mISg==
X-Forwarded-Encrypted: i=1; AKwUvBysvPZMKr1iRF1hMVi9qGfM/0ZfW15iIkmerCQqqrL2jYh2uXflwFP9z1tzkwekibFHOLfj4moCw9rEOHU=@vger.kernel.org
X-Gm-Message-State: AFuF++kj/ArU3JK+GS0EvRWKQ1G1/gXzlpl3lKf7+vubAKqAnVPhjajI
	HLEW9XK8P3Et4j828qY4HLSbWikyMjeEjPJHabX2jglDU9ZADlsMrP3Ys71hvHD4q69wCiuD3Ks
	TYkSpvZBYpbwQ9IjzxNEOMKBTkYJmmsBX4bnDCHA=
X-Gm-Gg: AYBFou3tBGk+f/ix7/H7jvPz8+byyesqlKpQ73tjAqIpPJ7W7QfHdoN5On1kG/puGEL
	X01wP5fTSP+rcnCGc897kURlOKexBWeOBxQf+nFD9HjKCujuYqJOl5ADvhpDH5uHNwV/11tYSJ8
	7HEeroTfn/ciUFBIyL1B1KoX2fhgckdNxEfNKqSV4eHTFuY0e0wxRh584ASOKnBk6hdZnWeOWoP
	kk9W5kz+kLcoAKjmoSSKH/G+9i8JPZY5HRATaXkYqq1B9hvKy+VodLNCiFnmEGm04DQzuzG8YBZ
	v7wiN4uAnHSlo7w8tjzySlQiPEghaG6HzeAcqwe1lP/JPTtzfVOJrzWqhhdWDGY/2oYLV4rxlha
	/haJ7XoTlHi98hAVyMVmF/z2nZBByCE7D32hBZEboKAJTqAUCQ6l5GnEWUD1ASqy/MWPh7WCKik
	E12i/PnwTehYBCh/nR0A==
X-Received: by 2002:a5d:5f49:0:b0:486:f78c:172d with SMTP id
 ffacd0b85a97d-4871e21635bmr19900106f8f.4.1790057225630; Mon, 21 Sep 2026
 23:07:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914165455.2126134-1-sh_def@163.com> <20260914165455.2126134-2-sh_def@163.com>
 <CANDhNCqZwGk+wqhB4N8Emq0rPmzsrVWzHmayiSj9ptg-vLzo3Q@mail.gmail.com> <8669890e-c8a5-448e-b059-d959e3a1d73c@amd.com>
In-Reply-To: <8669890e-c8a5-448e-b059-d959e3a1d73c@amd.com>
From: John Stultz <jstultz@google.com>
Date: Mon, 21 Sep 2026 23:06:52 -0700
X-Gm-Features: AcwNN1WQMMXIMLKgyQs-R9s9cDu2MORQQz9iibQkbB5XHcmzRn710NQXhfGHayo
Message-ID: <CANDhNCqKYjO=0mFM1aidHyAWaRirD2zO4_HqH=qB+0x-Uhk9PQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] sched/proxy_exec: detect cycles in proxy walks
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Hui Su <sh_def@163.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Zhidao Su <soolaugust@gmail.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 10:48=E2=80=AFPM K Prateek Nayak <kprateek.nayak@am=
d.com> wrote:
>
> On 9/22/2026 10:56 AM, John Stultz wrote:
> > On Mon, Sep 14, 2026 at 9:55=E2=80=AFAM Hui Su <sh_def@163.com> wrote:
> >>
> >> Proxy execution follows blocked_on relationships to find a runnable lo=
ck
> >> owner. A cycle in that chain can make find_proxy_task() loop indefinit=
ely
> >> while holding rq->lock.
> >>
> >> Use Brent checkpoint state directly in the real owner walk. Cycle dete=
ction
> >> reuses the owner resolution already performed by that walk and require=
s no
> >> separate preflight traversal. The checkpoint, power, and span state ar=
e all
> >> invocation-local.
> >>
> >> Keep the existing owner =3D=3D p wakeup-race handling ahead of cycle d=
etection.
> >> Unlike a sequence-marker approach, this adds no task_struct or runqueu=
e
> >> state and requires no activation-time reset.
> >>
> >> The online walk can temporarily install a blocked_donor cycle before t=
he
> >> delayed Brent detection point. In the tested recovery path, the select=
ed
> >> task's blocked_donor was cleared before it resumed. A forced-stale con=
trol
> >> also confirmed that mutex handoff revalidates the donor's blocked_on
> >> relationship before consuming a backlink. Validation of this trade-off=
 and
> >> comparative measurements against the sequence-marker approach are incl=
uded
> >> in the cover letter.
> >>
> >> Signed-off-by: Hui Su <sh_def@163.com>
> >
> > Hey! Thanks for sending this out and apologies for my slow response to
> > your patches.
> >
> > This looks interesting, and with Suleiman's futex work, it becomes
> > more critical to include.
> >
> > I think similar to what Peter already mentioned, having a max depth
> > counter is probably still a good idea, but it does seem like this
> > would catch smaller cycles earlier without much overhead.
> >
> > I've included an simplified version of Zhidao Su's earlier work (using
> > a fixed MAX_PROXY_CHAIN_DEPTH) in my tree, but will include this as
> > well as an potential optimization.
>
> So if we are eventually planning on returning -EDEADLK to userspace
> (context: https://lore.kernel.org/lkml/20260917153649.GK4121339@noisy.pro=
gramming.kicks-ass.net/)
> do we care where the chain starts or can we return -EDEADLK anywhere
> in the chain?

So returning EDEADLK to userland seems like a new feature to me, as I
don't believe existing futexes (which can still have dependency cycles
or just ABA style usage) currently do this.

So I'm mostly focused on ensuring we have the same behavior first.
Where we deactivate the tasks in the cycle so we don't burn cputime on
the loop and the userland application will see the same behavior as
they do with normal futexes (get descheduled and just never come
back).

From there, my initial thinking is: we could change the logic so that
when we detect a cycle (or the max chain depth), we re-walk the chain
marking tasks with a deadlocked bit, and then wake the tasks. Then in
the futex lock loop, when we wake, we can check the deadlock bit and
return EDADLK to userland. While in-kernel locks are always deeper in
the lock order, and aren't allowed to have cycles, we shouldn't have
to worry about them in a cycle chain. However, if we did trip it due
to a driver with bad locking, we could still use the deactivation
approach based on the type.

That way we don't have to add overhead of walking the chain at block
time. But admittedly this is fairly handwavy right now.

thanks
-john
