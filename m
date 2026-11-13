Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794584154;
	b=mYuIy1bSIs3cgErVDU/q0Ylw2nqPYov7yAEhU5bhBaz2/dmX4YEzG+58/XHfq6RL4/rL
	 BhCNDG8MRSr8/7WA3DOzTjcFGJ4RxRM/tr5ZyGt0tG88RyI+errFWNFM30u9cldwRjzUb
	 It9QG4eTmOx1IFGqyjuWSTsoK9yEqmyhEZ2yUOT1inX3OjMO8vP9y8HTS6sJqSRb13Izv
	 myffszkaPzVY9CGM/x0KLoO9DmqxUqhxFKA9DabfHwMwAmjBXIO5D0uX33+PEdI9q9KPb
	 /QQ7b9el4se9iBQoiHK/r+6yGl2qq/sgEReZrIdrBDt5oglByQidvdgsag61D0LcrMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794584154;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=eENWBnJtgnxkeCEWDwpBHaEkmEC443mWMB3XziA++b8=;
	b=dkzO8XnJJuq09zqKhEt/yTIM+MZNgkXQ5J0xcEtm0SYBKRHicnT+IFAB2fco0VvgfLMa
	 8kNNoZy4e3y79NvepK6nOmzW9kMnH9w3E2TBbsaqXang0F/jxi3x0cnixF+osg95xGByS
	 WtOxy2XT8MFp1/F98Kzd/AHum0AdO5kV3pNlXhLqaL7BVOFSqg/i80u2XdFEg+G/DsZMA
	 SbKtbM8ZOP4mglV+Cue6i5toBmiyV4F81Q0hYDxc3QeskxO0h/Ple88y5jEGjiEXMkYqR
	 qcOX7JpdrSpv37rbn4zif0aOSXACpw0yy/9DpRvHkaCoBvGWa4moHv/SnzRjr/k40Ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b="xEanFWk/";
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b="wT/g0jrJ";
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CD6606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:35:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20CD6606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=xEanFWk/;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=wT/g0jrJ
Date: Fri, 13 Nov 2026 16:35:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794584151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eENWBnJtgnxkeCEWDwpBHaEkmEC443mWMB3XziA++b8=;
	b=xEanFWk/eX/GNy/8MpQ0p2pI/8fGDs5oclLPxulXJgdFtRYQtGUU8HFBpDXIMU383u6IhE
	bOFHXQVgWt4p8wVFRHUXaeCKdPLlxrESDok/M29JQIPxlgU4iu5G1ssX2q+JEyxTgUpdqq
	FDKi5NQHfC/rWrbC4Ly7mSyk1MGc3HOS38mTb2lNhqRzZ2T5sWJbOPh95wn3lrFthqyj+c
	XA3ncBGy/ZVuH0YBv/bbC3+PSHNssVc5p3SRyCpKXQDjmZEGTD0Nd6JDghHfJfgbXTr45W
	75XkTd0Su/EbOhVUBMMvavQuXt2ZaAvC4zCyMZVBE8m9FWObaXa46J1MVomywQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794584151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eENWBnJtgnxkeCEWDwpBHaEkmEC443mWMB3XziA++b8=;
	b=wT/g0jrJ+6hEAou2+sVORwBr41g0MfEO5f/FbPSPfGCd6O6/0knTW3ZziVl8zgMT3JoDFr
	JqK9jFjBida8cWAA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Andrea Parri <parri.andrea@gmail.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Clark Williams <clrkwllms@kernel.org>,
	Dario Faggioli <raistlin@linux.it>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH] sched/deadline: Check SCHED_DEADLINE affinity under the
 rq lock
Message-ID: <20261113153549.Z8XPohWU@linutronix.de>
References: <20261105164856.29698-1-parri.andrea@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20261105164856.29698-1-parri.andrea@gmail.com>

On 2026-11-05 17:48:43 [+0100], Andrea Parri wrote:
> __sched_setaffinity() calls dl_task_check_affinity() before
> __set_cpus_allowed_ptr() takes task_rq_lock(), whereas
> __sched_setscheduler() runs its admission test and switches the policy
> under a single task_rq_lock(). So both calls can pass their checks:
=E2=80=A6

This looks fine to me. You do the check under the RQ lock so everything
that you checked can not change later on.
If you race with cpuset then you try to revert and drop that check-flag.
I can't comment on that. It looks wrong to set it to CPUs mask which not
part of the domain but you made a comment why it needs to happen. So
stay out here ;)

You could keep the check in __sched_setaffinity() so it bails out early
if it is not possible right away. The check under the RQ ist just due to
the race window that we have. But I don't have a strong opinion on that.

Anyway. The reported problem looks solved to me:
Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Sebastian
