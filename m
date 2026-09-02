Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4529E37BE70
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 18:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788373301; cv=none; b=ZK7TcLHbdTEBAp5SPIkCw2n+JoYi9fVCJN48QbBq0S+CpVIPU0zl2cFb5GEgcc78IokrX6Wja3NIgIhJSZD2TPBFYWmFDWpnecCj2069YnL7FhVQRPrVaMcxehqF4Ruc+cXLs6pMHlKm/sKhwizdb2U1FLsSCaBzaUPpLXtykfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788373301; c=relaxed/simple;
	bh=So6p/YWck/iPNGODow+9n5+xQqKMXQhOcgeW1Iwz0tE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YMU/fn8lgFilZHGwBKNisjPh9HIzRHNKfU/n6wHCJpexbW1qLgE5xy4OVPhVnajXi1nMUrPojT19iTjLUof4rBh6ikaw4bSD0qzSIdkDvCIVF0Q8CbIMs03YRHgTvJs1truSKortirYpNhNR58JeRbH5sDgCvHmTJH7LLoyWe/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ur9Gqk13; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ur9Gqk13"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A110D1F00A3A;
	Wed,  2 Sep 2026 18:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788373299;
	bh=qmfU9LIllQ2cAOo0WoG8lza+5YKzQfqCEL8c75mFKMk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ur9Gqk13sRj1WpwLCEwzsJCoj9/TALMC348f0NtDpF794QDnDzE0X4hwRpc7KKKZX
	 npaW9t1L0+E1UvthlHwrjU8KIN9w2ifJhe31K0dycOhQc6i7ILhEQs4z749eUFEJqC
	 EpExAWsLtYUcnoA7jngCQrAneO27D+uV0lqi7uK4LyFHSl3DobWX/EZhEyah6vFqKT
	 UodZ86jmL9eTPtT9huoM7vgzsbl54lz8g8yaNMoknJnxvUq7tRwSKnRWduvUh3oM7x
	 J9FLPyI+AWEjF5p99RVd7XkLdZDJB1ExAc1c0PWEp4ewIFOJq9HdgAgD8G2VV4C/Cl
	 qBn35XdRuYpsg==
Date: Wed, 2 Sep 2026 08:21:38 -1000
From: Tejun Heo <tj@kernel.org>
To: Hui Su <sh_def@163.com>
Cc: linux-kernel@vger.kernel.org, mingo@redhat.com, peterz@infradead.org,
	juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
	jstultz@google.com
Subject: Re: [PATCH] sched/core: Call wq_worker_tick() for the execution
 context
Message-ID: <aphpMkGmuOrUByf3@slm.duckdns.org>
References: <20260902150208.1209922-2-sh_def@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902150208.1209922-2-sh_def@163.com>

On Wed, Sep 02, 2026 at 11:02:09PM +0800, Hui Su wrote:
> wq_worker_tick() accounts CPU time and detects CPU-intensive work for
> the kworker that is actually running. With proxy execution, rq->donor
> is the scheduling context while rq->curr is the execution context.
> 
> Calling the hook with rq->donor can skip workqueue accounting when a
> kworker is executing on behalf of a donor task. It can also account a
> blocked kworker when the donor is a worker but rq->curr is the task
> actually executing. The former can delay WORKER_CPU_INTENSIVE handling
> and pool concurrency management, which can delay pending kernel work
> and userspace operations depending on it.
> 
> Use rq->curr for the workqueue tick hook while retaining rq->donor for
> scheduler accounting.
> 
> Fixes: af0c8b2bf67b ("sched: Split scheduler and execution contexts")
> Signed-off-by: Hui Su <sh_def@163.com>

Acked-by: Tejun Heo <tj@kernel.org>

Peter, how do you want to route this patch? It can go through either sched
or wq.

Thanks.

-- 
tejun
