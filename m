Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BE54E66A2
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789556227; cv=none; b=S0fzRiwgvnkOSnM3hF4+4ybn66P+mTa0IluGbe8ohog2e2OeVUbNPDkMLembilYGwagWh5ht28vYx2MEWYV/rfdud7oFDRs1igM7E5JFqxzCyihQpq1A1bR33zQKwrXkOAPtp4XjKXMkEuOYSJ4aNxk7pzjSqm41Ebd3WaBv/pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789556227; c=relaxed/simple;
	bh=Q8zZrY0aP+v+7aYH3IG/RoCsysDQ42bacf2/q/2lnuA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ai0pe3X/gArTjxFeocSNf2Jt2q7zXkh7rTfgEoU+NFhwStBgnibugkelRYmQ1CKV21YT61zKgtHmp7J3FhpGR4O0LfISdP1vpKCofVc24xQrHsDIIXEXb0fvZZRHmPLdex6mLIf4T3jRS2/LhnznsXi7l9TYA2jSSm6oMynbRu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=JplzRpec; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="JplzRpec"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=QM5fwvH7doDCF8d9ABGR5QbKsUptd1dhZSJxCYZxXLY=; b=JplzRpeco87igxDN+ZFtEnKKC/
	Oay5qKXIN+4rRFdJFZ4ayFw1kXildh+eXIQWZGdl7hUf+N1GjjeFEchwsr7gBx0DE+pRMkR12m30b
	I5/atZ4rmaIOefbSz0K0fApCyUyODV871ytMO2k8H23eZCrXJic7O13b/8A0KyRHlpOB+AeN70KO3
	aOY+sfK2Aey8vgx5J7qMvQFVHG86LqYRZ1fFLdHPGrUJpmSmG9pavI/aZp42+XLzinvxH+AbahRVD
	64T4l1UN64kjppAt/kl39A2ZUCkgdpmr68XJAzf889Q3ZZU1pd0+qV1Wd5wgnwLoYBtIMhrGVFkLX
	atDbz6cw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6nJZ-00000003xVP-2rfg;
	Wed, 16 Sep 2026 10:56:33 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id AF38E3012C6; Wed, 16 Sep 2026 12:56:32 +0200 (CEST)
Date: Wed, 16 Sep 2026 12:56:32 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: David Laight <david.laight.linux@gmail.com>
Cc: Waiman Long <longman@redhat.com>, Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>,
	linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Yafang Shao <laoar.shao@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v4 next 4/9] locking/osq_lock: Delete 'fast path' code
 from osq_unlock()
Message-ID: <20260916105632.GU788244@noisy.programming.kicks-ass.net>
References: <20260907084133.3696-1-david.laight.linux@gmail.com>
 <20260907084133.3696-5-david.laight.linux@gmail.com>
 <20260915141524.GD4121339@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915141524.GD4121339@noisy.programming.kicks-ass.net>

On Tue, Sep 15, 2026 at 04:15:24PM +0200, Peter Zijlstra wrote:

> See here:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/log/?h=locking/osq

I've updated this, it now includes:

 - your patches 2,3,6
 - my rewrite for your patch 4, in 5 parts

I've re-shuffled things a bit to move all the Fixes to the front.

It builds and boots. I'll let it sit there for a little bit for the
robots to chew on. Lacking robot screams I'll move it into
tip/locking/core.

If you want to optimize that fast path, please do small patches on top
of this.

Don't bother posting stuff like 8 and 9. Esp. 9 is just wrong, CPUs go
in a FIFO queue, so the 'new' CPU is at the tail.
