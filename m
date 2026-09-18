Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6623B3E0241
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.234
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789711697; cv=pass; b=HvgXhhknzyRZdukvODZ2p4YPjE+xU3xp9s6IQ+SDARKcCMD7qXA9VvYOmbaVcZeEf3brnyUiyfGAozYLvsn1PtKXS9/mr004/Tk3We4PiX3LWCe3506YSRJqE1VsRMQgyLv+rDgR14XntjK/EZ2c2jwjMel4l4GdylvwrjjdQmg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789711697; c=relaxed/simple;
	bh=MKMZZwrpQTlafoNdQxxIP3g1WVFVcoQLyH/0LebZWs4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GDjmBLzcmhWaNbrR28j5v5g4trWdlo0OFZiFRmfM1m3ZqgiCvPSphMKEJ1uvyqEpzonp1jkpmAfRcoY+vRpTV+VWi51f5+gtYXkazjhZUhM4rQt6nHkedrB90OMEOllvuVQ4hQ2ZHcFE8C5ghcvR5B8inI6koH8cA5kz+j10/bg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FVSxkPVC; arc=pass smtp.client-ip=74.125.230.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FVSxkPVC"
Received: by mail-qk2-f42.google.com with SMTP id d75a77b69052e-5310b91044aso3389321cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 23:08:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789711688; cv=none;
        d=google.com; s=arc-20260327;
        b=ja10J7GmWnHDIO+BOZt2fhMVxxAFqnWH0cF7Qid5rsBHvBVKX4qkDlGPmtKKaVFfof
         uR80JUTGQoP7O1gdbfQJScG1qAqFnHP566rlJN5SpP4gixs9WdzZHeXA0za+yItI+hVE
         K3sMj76MFeboI03lI7HIK9XiUVAGiKkGDPcgrlK5bIQtVMH9fd0ReJi8pokbXyEQ8ALM
         hjZzGlDf5UejuflVW6DqMS1A7ne1vr+PYY2XAn2P9MuR6oEkYChoH/bIXX6JZQb1qfTR
         l5TosmJnrIeu6Pw+WbbLP4FGbZHVC24AVsFfX3aYgACMCwhCdLevHLHfRwyuhBy2FM1A
         KLCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MKMZZwrpQTlafoNdQxxIP3g1WVFVcoQLyH/0LebZWs4=;
        fh=zIXcscI+HBE9p9Pfe5ELQVF/Cw/9RvkeNVtQ/yFFMPk=;
        b=PfZHOWqAsU++enCbNnRJjE5p36yLH5Z3Iy8jLOaVoLP2naxxakqjo9VrzPPNnBaeK7
         2/oLWYCTL8gDbo0XOhCWyYGJnoXanOs+PmSPN60aQzpEDyn4+k2F/jYxAo9+eQPgQTds
         mt/DMsOXB4KWHJFl1PwSME7hsUiEbnUv8TTSToyynskfpRwJ/GQQbNlGCDPv10Bo7KBO
         CnD2vxJSVjSUL8Klhg9Mct/i2xiwE6IimGSws6K0WEqhjgTuoiKPL4k/hhSladsVjFlN
         jrrvJxQ4gzn414yNwW31EP0pTJ86BSg+MdR0FPMfA50ySybo+fXIFGOdAC1B6T3HXfrL
         VbfA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789711688; x=1790316488; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MKMZZwrpQTlafoNdQxxIP3g1WVFVcoQLyH/0LebZWs4=;
        b=FVSxkPVCmhsJf5Mmy0PsJ00JtAP3yEX857v0erbsl40nKnw929sZ2PWlMFQ2Kt5V0M
         qircgo1VGvoVbTYCWwb04lGJbNV7t15hDmnM6zRlpouyimPzsR0LDjkpJy/w7KhX6jCM
         ovdtRYxPwFweNWDuWSHCwYqFSyeiI+FPF787+kovhDmfU1bnEUMrVE6pU9IP3SaawpYV
         YYUilK8rZh6lA4B/i8IUXpV6HkTcW1lYGwgz1Xyvcm1yaxvFqh87EKhm3Idh2p+ZUHGf
         vfKUlLwgeihhU1H16qhTIIwDp4wrVH4Whh9lDrBup4Yy0wpM1QwPXDAgETyhkLgtb8mn
         WLhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789711688; x=1790316488;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MKMZZwrpQTlafoNdQxxIP3g1WVFVcoQLyH/0LebZWs4=;
        b=FyxzFTDVQEYryIRk/OLEU8HLoU/4IEmS1t/kVYCa08OQ1HB18qP6QBLJnhEN/az1iu
         gyEkgJlZTydRzA/5x68ZJOSAKfMxSSmuvdiXtwT5Z17lwI1dY3S8bFJhHanJCHEwm492
         BUlhci81wfgiOU/ovpZu5zO4Wbk8dfWvyqvrZ1p4IwuXb1Mx5Xf71kwuI2NHNXItTz/s
         EvjKVuTHL0D2D+cZotxec/Jlhm5nY81o0zKfvxBv9REfh+dhHVo5XCmGYDqZUf0NaNUx
         0r0/VK+OlHSl+1OVU68I7orOyiP+8cNNjOJGNgdj/Oifp50BuKRpQKMSxQsDKW98TaaN
         hUBA==
X-Gm-Message-State: AFuF++l/RaTJoEhA78WGq08VgmKD+8Myzjd/vEnUTMZlG3PZF0Hf07a7
	XaF0sy4GB/O1BgmR22OkQskJRXW8yKDjDFtK5Ye971VmOTa3QkTZsmIQPifiz2IozzLZjHykNjX
	O/bDCAtyVzcQl2gnLeIU1T61gxlU68WXaU5H7/GIg
X-Gm-Gg: AYBFou0R4WapRsMfn6SMPAUZ/dvLRizl2dbPzZzYn8Ftg8EuGIXQFVN6SHRT7V10VKe
	qiMkjkb1ggVoGOByMWw9Smkbz3KEoU99vZhJmvMAVAOjHYM2CSOIP9O/ImKWFII5FBvc342SD8V
	AHA0NPVpsookayNIkqlXGnttGeHY38PSwzMBtAkbygAKiG+cH5cz93nb1WmZzAYn/w2Oe6TzR2b
	6Hc1MUFKjWlhAqAHmT9A4VopoRgnXoyIikUWnD/hdBaNl4w92OFTXg8ahk1r+J8uaQ4v6jNZc8W
	UofmjLT7pKaWJT5mww67z1gQ/nU7qrWnXpdJNq54DukKT2h8CjYcb5FJU9kGluxAzSmSKNRqUpN
	iHLT3JKtY1g==
X-Received: by 2002:a05:622a:550c:b0:532:9ade:b6f1 with SMTP id
 d75a77b69052e-5329e54b280mr21737911cf.71.1789711688018; Thu, 17 Sep 2026
 23:08:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917043339.2093426-1-suleiman@google.com> <20260917085805.GD2009045@noisy.programming.kicks-ass.net>
In-Reply-To: <20260917085805.GD2009045@noisy.programming.kicks-ass.net>
From: Suleiman Souhlal <suleiman@google.com>
Date: Fri, 18 Sep 2026 15:07:56 +0900
X-Gm-Features: AcwNN1Urrq_w9qP6LEdn6MqaKun4FrsNgNdEczr9Wfvw_yJ3oxOOq25tphZGbPY
Message-ID: <CABCjUKBmmh4sn0A3H6RJgASgqBg-E7LEFNQGmL=xJCmtP03qUQ@mail.gmail.com>
Subject: Re: [RFC PATCH 00/12] FUTEX_PING: A stealable futex using Proxy Execution.
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	zhidao su <soolaugust@gmail.com>, John Stultz <jstultz@google.com>, 
	Qais Yousef <qyousef@google.com>, ssouhlal@freebsd.org, Waiman Long <longman@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 5:58=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Thu, Sep 17, 2026 at 04:33:24AM +0000, Suleiman Souhlal wrote:
> > Hello,
> >
> > This patch series adds a new type of PI futexes, PI Next Generation,
> > or PING (name coined by Steven Rostedt) (but other name suggestions
> > are welcome!), that differs from classic PI futexes in that they can
> > be stolen from the top waiter, and use Proxy Execution instead of
> > rtmutexes internally.
> >
> > The reason to allow the futexes to be stolen is that with classic PI
> > futex's strict handoff to the top waiter, new contending lockers are
> > now forced to wait in queue, which means that any locking operation
> > now becomes a scheduling event. With stealing, a contending locker has
> > the chance of taking the lock without blocking. The longer wait time
> > of blocked tasks can be mitigated by forcing the lock to be handed
> > off to them in a way that can't be stolen, when they've been stolen
> > from too much, to ensure they don't get starved.
> >
> > The use of Proxy Execution lets us also get Priority Inheritance for
> > for fair tasks, which PI futexes don't really allow.
>
> https://patch.msgid.link/1490204338-1856-1-git-send-email-longman%40redha=
t.com

I was not aware of this, thanks!
It actually seems very similar to this patchset (but much better written).
The main functional differences that I can see from a cursory look are
that on unlock it doesn't preserve the waiters bit, while PING does,
and that TP futex also supports userspace rwlocks, unlike PING.
And of course the fact that PING also uses Proxy Execution.
So now I know that I'm not completely crazy for wanting this. :-)

>
> Also, the goal is to eventually delete rt_mutex and have it be the
> normal mutex, in which case the existing FUTEX_*_PI things will
> automagically work.

I considered using a mutex but I was under the impression that some RT
workloads really want strict RT handling such that the highest
priority RT task always has to take the lock before any other
contender, which mutex doesn't currently allow. For these workloads,
the existing rtmutex behavior of handing off the lock to the top
waiter is desirable.

Other workloads still have RT tasks, but are ok with slightly less
strict handling, as long as RT tasks still get serviced reasonably
fast (so they still want priority inheritance, but are ok with the
occasional case where a fair task steals the lock from the RT top
waiter).
I suspect Android is in this later bucket, so for them using a mutex
as it's currently implemented would be ok. But others might not be.
On the other hand, the current rtmutex behavior would not be desirable
for users like Android, due to the performance with fair tasks that
Steven brings up in his reply.

These different needs are why I wanted to add a new futex type.
But maybe the different needs could be selected through a CONFIG
option, but with the same user API (FUTEX_*_PI)?

I also had some other probably not insurmountable minor issues, like
the fact that we probably wouldn't want to get kernel lockdep warnings
for userspace deadlocks.

-- Suleiman
