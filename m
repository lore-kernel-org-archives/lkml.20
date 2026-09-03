Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2511DCB24
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 17:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788456653; cv=none; b=UIlMeR0D8C7r7Imo8bK9QWwIuNuYC1vWdkglPlf3V63cV0ZW+voW9tN9XX9FM15Vd7wgAnGVenk5y+8LWGsrmu5+qmhIWw5i7Sqmci6N7cnq5yF9g42JHpFcyVfbFK10CxFHPeSO9AqKVol/Ovx0Yh5F17Ep2VQdA44YPkE01yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788456653; c=relaxed/simple;
	bh=Dzc9SmRCYrSygjOqnWfwfupjNMmopTee8uOKZ6yp6Qc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tBpGb2klW1zXyG1xc0IK+ldOmN3Ro/8tC7qknmMtoaZgG2EZfObP/3JouE+00rpmbfCSP1WgvI+mtOdh4549q/9mmqpYSrQoP+CiRN3dXK+UmDl20XZHMWAdT1VFD6MmsQKDEWQlMfwYNhoslCe5PFA6NFtVL9tNpEXIfiOCufo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eWNG0ak2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eWNG0ak2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59ADF1F00A3D;
	Thu,  3 Sep 2026 17:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788456652;
	bh=8qcSue7NW9lsO+Qcr747wyeFK6VBjumXUztD7ofp5DQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eWNG0ak2XLf2D4ua9SXJI/whF9UG+rwhXJNwDLeMnWrkUWjM5rfzxjJ2/ahX1MoS1
	 7YvaLmVwN1e4Q+Wp1p5kZW8R+bQkR4k6IZAgIYwwJ6JmQFdcl/m81EL1FWOqvDxhdq
	 KDaxbtLC7k0D/ZExVCRWrOqSPj3plvTDL1wLe+yt+ATlxjpsGi4LZyXhlRtVdm2Tsm
	 68/rr+mAokcw+X5AnN3crAW+/z3ioeUIeXw9uiMafnNvFkBSAbwGkqRwsUHE1Ia/SV
	 jn6xVr5f9PJb/B0uuU8Nx1s4fbbeR6WdLpGGsD4422yWcMroOR41V1DCtCAyTdLNeV
	 n1/KuZvVK8/kg==
Date: Thu, 3 Sep 2026 07:30:51 -1000
From: Tejun Heo <tj@kernel.org>
To: Hui Su <sh_def@163.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	John Stultz <jstultz@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched/cputime: Account cgroup fields to the scheduling
 context
Message-ID: <apmuywWz3c0keI2i@slm.duckdns.org>
References: <5733b51108eda90c1bda98a68d58b5e6ccbc24ec.1788433334.git.sh_def@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5733b51108eda90c1bda98a68d58b5e6ccbc24ec.1788433334.git.sh_def@163.com>

Hello, Hui.

On Thu, Sep 03, 2026 at 07:07:12PM +0800, Hui Su wrote:
> Proxy execution separates the scheduling context from the execution
> context. Scheduler runtime accounting charges cgroup time to the donor,
> while tick and vtime accounting use the execution task when updating
> cgroup fields.
> 
> When the donor and execution task belong to different cgroups, this can
> charge cpu.stat usage to the donor cgroup while charging cpu.stat user
> and system fields to the execution task's cgroup.
> 
> Before this fix, a reproducer with donor and execution tasks in separate
> cgroups showed the donor cgroup gaining usage time while the execution
> cgroup gained system time.

When these numbers are presented to the userspace, the user/sys split is
calculated out of usage_usec, so at least the presented numbers should be
coherent no matter what.

> Account cgroup fields to the scheduling context as well. Separate
> per-CPU cpustat accounting from cgroup field accounting so the former
> continues to follow the execution context while the latter follows the
> scheduling context.

I don't think it makes sense for cgroup's usage times to deviate from how
thread's get reported. Threads follow execution context. All cgroup numbers
should too. If you're worried about usage_usec not agreeing with e.g.
bandwidth control results, we can show donation time separately, but let's
worry about that later.

Thanks.

-- 
tejun
