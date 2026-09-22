Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926F04FC34D
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790070607; cv=none; b=d6h8CqTKAXqhFw2ctgsFm9n4fOAgvLcyS3304M3DfOvmD+tX6YjwEcK506BAtLUffklvQvI1BWy8ukH6sIvvn3o0jh2Rxg5oFAWjC+cbMrwzfYYNc3aMeCcqa/zRrJas0bWCr/rXvixzXfPGRrWhN7K7grldVbwF/neuwaV3+9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790070607; c=relaxed/simple;
	bh=gBgerfVw6ckfrONGAN2vFaCgdcoSxtbk/JPWMdLvs6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YRmDXGl4FujucFZ1P38pTMAcsudls+Wj5Yr40ZN/zHy1CPPsLHrms0rkyZkweCL+deoXOGp6Tj+9pNVeTDZRdZwaeV3srxnQ84XY5KVXnASXrZLWmEI6gMIgxnuQMsy77cpOkXG/fhfQCJXNYFkIcmFxVQgwrad2chGpExCRG0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=BHsW9CR0; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="BHsW9CR0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=XahRNe5Djo08kK2gKr6LTL2XuraLZFipCKu5TvV29eM=; b=BHsW9CR0Gr1Ty1qXnWDjd+kBoV
	+zIOeYHw3rK11SarJE+eJr8pjRV1EXszz1roYZ6rLh4MO1WqkbObcN3qd0qqme7OPmRaLKYJls0If
	xLKc1Q/iNKXFh0D5Tm2kojhaqtKvl2QXZn1SssEatojTNjC+n8LmDec7SzsZtdoy/9kx5LTlZjnk6
	xIwQZmhVMg1/6iuexk5Bj9zBSNrsjaIAlT4jPJPYWe8k+EZfG1cCOp+mVF6ZXVj2bpsERniUcbHtV
	/7Hl/RB8lkMocAyRK5l8dRW+cGy9yfgIZveYDoTCddZypeBa9Gdfh+rhM3xvPukdVfaJ4eslkxCXA
	TWXbJZQw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8x8D-00000008367-3Fad;
	Tue, 22 Sep 2026 09:49:45 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id BF861300708; Tue, 22 Sep 2026 11:49:44 +0200 (CEST)
Date: Tue, 22 Sep 2026 11:49:44 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
Cc: Zhan Xusheng <zhanxusheng@xiaomi.com>, mingo@redhat.com,
	hannes@cmpxchg.org, surenb@google.com, jstultz@google.com,
	connoro@google.com, metin.kaya@arm.com, sh_def@163.com,
	juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched/core: Account PSI IRQ time to the execution context
Message-ID: <20260922094944.GN1837346@noisy.programming.kicks-ass.net>
References: <20260918132915.1236312-1-zhanxusheng@xiaomi.com>
 <20260922081706.GE2009045@noisy.programming.kicks-ass.net>
 <20260922091532.2504886-1-zhanxusheng@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922091532.2504886-1-zhanxusheng@xiaomi.com>

On Tue, Sep 22, 2026 at 05:15:31PM +0800, Zhan Xusheng wrote:
> On Tue, Sep 22, 2026 at 10:17:06AM +0200, Peter Zijlstra wrote:
> > Does not in fact apply. There is no curr in sched_tick anymore.
> 
> It needs commit f5741d2b3451 ("sched/core: Call wq_worker_tick() for the
> execution context"), which added that local.  That is in sched/urgent and
> master, not in sched/core, and the patch applies cleanly to the first two.
> 
> If you want it on sched/core instead, I will resend using rq->curr at the
> call site.

Hmm, I thought I was on tip/master which should have /urgent on, but let
me try again. Perhaps I fat-fingered something.
