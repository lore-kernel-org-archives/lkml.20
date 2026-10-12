Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E97448D18
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791809503; cv=none; b=Tqo/CN+DIxuYrSxvVTWn+foPEQbHEje45IYBAYku3Um1p0jxsDWNzD+MbeUm57SdPP1ACwwQ/BW8DuLm60z3pKOheiNotSzHknJUhKgLbwg6ZC8N8+9xzKQGSQ0bul5jzaoTecfOlfOkbfStC3FxcGUuJjvrzRTO3/klZKZp4t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791809503; c=relaxed/simple;
	bh=itWi7ZYvgSwVgvgCK0mLq3B5wSyyWMCBOvYfkACuTE4=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=hAmJiyvVNikui0wdw6fSb37LJMmqNyONzw3YSDCDWivNggdm/BqQZZ3ZYNriRGlrDqDBY74lIDW5BXLyR2RqQicgze8VwqJ3Ot6SoXO7z+WYfpkgiOGZ0TLXf548BUG+Q1mEvHS/fSZ6vzUxsand4NQjfHouPL2BJPXfZYdqk+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=gbDLho1O; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="gbDLho1O"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4j3HQx1g7gzKmBG;
	Mon, 12 Oct 2026 14:51:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1791809497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ryQaTo3gnu7+iU8fZIemzfLMbvnoZhxtVlWdey7NN18=;
	b=gbDLho1OnO3bQS7Zqfj3UggPToqMhyQD1ejCXE87bKzRfm/iM0R82CwwnxvXnLbYA5aj/G
	19i9R2EP57u0sUTqtn/wN/Gx+o+YMiTrJZp8TpUf6GKH1Nxn//CXRj+L/QvvVFx+WJpUug
	deOUShGn6KXRCCyMmdtG/UMGcvmqmc1pNxClU7IUgUMSirmMk+rTrNOf5jutA+FIdaVMo7
	FIN7QLGc/p0lNDUP1EVjPTIcyExuIWGN1cRWWg5k2p5c5vVOslfgkYQZp/q8kcVepc2ZGy
	Legr2hKPv2TcQ7N0L0bvyZPyRwTl75XieL0Nl+J/uHc+dEueeWiufXw+WtiVGA==
Date: Mon, 12 Oct 2026 14:51:34 +0200 (CEST)
From: torvic9@mailbox.org
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: peterz@infradead.org, mingo@redhat.com, juri.lelli@redhat.com,
	dietmar.eggemann@arm.com, kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org
Message-ID: <57528692.1442403.1791809495018@app.mailbox.org>
In-Reply-To: <CAKfTPtDVXVzsRCUavub+6cXrC8Ke9=Vrv7A4cMcEG2WwDtJKKg@mail.gmail.com>
References: <20261002124538.79658-1-torvic9@mailbox.org>
 <CAKfTPtDVXVzsRCUavub+6cXrC8Ke9=Vrv7A4cMcEG2WwDtJKKg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] sched/fair: Remove tunable scaling
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v8.52.252
X-Originating-Client: open-xchange-appsuite
X-MBO-RS-META: wpc3ziwui9xqxf6ibxoa18nxrt61kjnw
X-MBO-RS-ID: cb8a3794fe3ca35bef6


> Vincent Guittot <vincent.guittot@linaro.org> hat am 12.10.2026 14:37 MESZ geschrieben:
> 
>  
> On Fri, 2 Oct 2026 at 14:45, Tor Vic <torvic9@mailbox.org> wrote:
> >
> > This series removes the scaling of tunables, which was introduced around
> > Linux 2.6.33.
> >
> > I split this into two separate patches:
> >
> > The first removes the "none" and "linear" scaling which are likely not used much
> > and have limited usefulness, as one can always set sched_base_slice through
> > debugfs.
> 
> How did you reach this conclusion? and why it's worth removing it
> 

I thought that companies would choose a specific base_slice through sysctl,
based upon their needs, but then, I'm not active in the IT segment so I might be wrong.

It's possible that there are distributions that use "none" or "linear" by default,
but I'm not aware of any.

> > It keeps the logarithmic scaling which is already the default.
> >
> > The second removes the entire scaling mecanism and sets a fixed sched_base_slice
> > of 2 milliseconds, a value which has been chosen somewhat arbitrarily.
> 
> No, the sysctl_sched_base_slice value has not been chosen arbitrarily
> and the commit you mentioned below gives you the reason

That's a misunderstanding.

I wanted to say that *I* chose the arbitrary 2 ms in this patchset, not that the
kernel's default of 0.7 ms was chosen arbitrarily.

> 
> >
> > Currently, the base_slice multiplied by the log2 factor can take the values of
> > 0.7 (1 CPU), 1.4 (2-3 CPUs), 2.1 (4-7 CPUs) and 2.8 msecs (8+ CPUs), so it seems
> > that the new value of 2 msecs is a sane default, which I also use on my consumer
> > x86_64 machines.
> > However I'll leave that open for discussion. Note that the base_slice value has
> > changed quite often over the years, lastly in 2025 [1].
> >
> > The series applies to 7.3-rc5, and is build- and boot tested on a measly 2C/4T
> > Skylake machine. I marked it as RFC because I don't know whether these changes
> > are actually wanted by the sched people - and because I'm not a developer.
> > It does however remove quite a lot of code.
> >
> > [1] commit 2ae891b826958b60919ea21c727f77bcd6ffcc2c
> >
> > Tor Vic (2):
> >   sched/fair: Remove the 'none' and 'linear' scaling of tunables
> >   sched/fair: Remove sched_base_slice scaling altogether
> >
> >  include/linux/sched/sysctl.h |  7 ----
> >  kernel/sched/core.c          |  1 -
> >  kernel/sched/debug.c         | 52 ------------------------
> >  kernel/sched/fair.c          | 79 ++----------------------------------
> >  kernel/sched/sched.h         |  5 ---
> >  5 files changed, 3 insertions(+), 141 deletions(-)
> >
> > --
> > 2.55.0
> >
