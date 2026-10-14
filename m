Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF214EE867
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791983060; cv=none; b=AZxetWyPN/tuKpTf6TpIpJd29X82KZZYCHvGHzsZSO6vlEGcT79Rz332UFVsATnVRPrZlv4etqM14tqrg+T96I1Dg0gqCCvLPZDYMIXazOxYMK+D5ZaDq8LgC6EigI0qhArF8lFVadhNnnM1gIZf9emgEUadxcFr607OLKgI7Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791983060; c=relaxed/simple;
	bh=EgFi49r7gxfzkxMoWf7LhQFYjxHc9Hj0j2eSgaDANdo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ux09cOqY74tUo1KAQZxxA1Ea2nHUB7nDGaSs3NC+yWDZhYxBgbayMP3AWJJO5diK3V9wNIJ8t3P/2zacRbOM8KVR5bbf3g/KLqGS8qBYNzfJUDE04exKjQZmQFeGSamkdhlidvA67eXvJNhPWwbYjWr2heLmvHQn9z7unV/Zo0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=e4u4K/nk; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="e4u4K/nk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=h7KCGIIJyHUTbAqy6ZeCQb4TTOrAvtIZ+c2NzCIyooA=; b=e4u4K/nkfSdta/ZcCzlPmkRoSh
	lamC+2RvWUieK5VxJiyHpRLEDnfsdXoOwxu4Se8pv5KyW7BAmX9T2FsASfqDWkCZYwTZGqvHEDp6M
	OT9Jd+zUqL/34GhyyId7IxNCCS/yKdciG3LGIETpVwe1k4YVVqhlPfNu3FpD0TIkCxtbe/ahDGtyB
	JKwnbsB3Wfvw/Wc+a+KFxsL8KG3JWjPfoMn8A+IvjAihZ6aelWSyoBymoGR73RueDtheyMwgUSUf8
	XifPejiutrjoo3iq8ggxrFOAO+Jx+ZDVb0jniTec+CO2GaGI3tP03FF8fV0Bwg9iRunXH10FgrP3W
	RAKaFoxA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGyeF-0000000Gmxr-15d8;
	Wed, 14 Oct 2026 13:03:59 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 19B53300890; Wed, 14 Oct 2026 15:03:58 +0200 (CEST)
Date: Wed, 14 Oct 2026 15:03:58 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>,
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH] sched/core: Call wakeup_preempt() for queued tasks
 during class change
Message-ID: <20261014130358.GL2009045@noisy.programming.kicks-ass.net>
References: <8fa7f795-518c-4507-b684-60b0c1cac2c5@paulmck-laptop>
 <20261013152455.9039-1-kprateek.nayak@amd.com>
 <786f52b9-adef-4246-b83c-fc0081bbabba@paulmck-laptop>
 <44e3b645-b8d3-4812-930b-0112c05a9132@paulmck-laptop>
 <af6eb571-791d-475a-8413-18d2125328f4@paulmck-laptop>
 <c334b382-a13c-4222-99bb-798340ff0d68@paulmck-laptop>
 <4abd0c29-efde-4e8b-a498-aea5a0fb788f@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4abd0c29-efde-4e8b-a498-aea5a0fb788f@paulmck-laptop>

On Wed, Oct 14, 2026 at 05:59:12AM -0700, Paul E. McKenney wrote:
> On Tue, Oct 13, 2026 at 05:13:00PM -0700, Paul E. McKenney wrote:

> > And the five hours of 200*TREE03 on x86 passed!  Started a 12-hour run.
> > 
> > So thus far, this patch has passed bit more than 1,000 hours on x86 and
> > 18 hours on arm64.  (Something about having access to quite a few more
> > x86 boxes than arm64 boxes.)
> > 
> > If it is still alive in the morning, Pacific Time, it will have more
> > than earned itself a Tested-by.  ;-)
> 
> Tested-by: Paul E. McKenney <paulmck@kernel.org>
> 
> Thank you all very much!!!
> 
> For those into statistics, these test results give 99.9% confidence that
> this patch reduced the bug rate by more than two orders of magnitude.  ;-)

W00t, ok, let me go queue this stuff!
