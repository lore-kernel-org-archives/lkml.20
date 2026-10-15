Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B600C48A8DB
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792047993; cv=none; b=dcRF1CmSRNsXQUnF7ID/hiXWemc6r9GVfcM3vwg8J8xlC/OEMyox9HVIKr2u5mM8SxYPBOHu9MhJ21b2/QI9kr8NGQLdr00lvInWtjKUqTR1FUHfu/+/EC02qPZ1KTeiGAsLfLwTK7EcHtE3nVMqcCFN+BidvOPLp6x4Krh4Bmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792047993; c=relaxed/simple;
	bh=OQ5UIfSNNRc2baQCbFuBRtLhbgr6U4ILey7lpvZ5ZwE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DWksBt/Yy4FqVv3QoTEFSPCM7olDgdvvoqzf9Xm0Z5dAfmgEaktMSnhFaUhzYk6uD9dzOjvr+tOAd1PcOdb/vyL6yVPoPejf4hwnWzvTnGw5hv5C0pe3Bhjd/HwbQZ4hOku83xFvDbr9LrcfTAyKLHUQGudZAhPQ3slp9iOJP6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=FKmUedKc; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="FKmUedKc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=r1h+NP0QrslIVtRqTV7iEfiDar/+q8DUAPe7VKFkRbQ=; b=FKmUedKcPtdaiOTD/hn6TYDlz+
	5+naiXUXn+qp1gKt1iT4UHgzV+eWErx2ZeEHWrm4Tr8XcD3DAp7C2KApwK1UzrxV618/EHZnQzGAY
	I18S8o/dfGV80sTYG/C8rmGPpkb2OHdz9PIKZ4D8VPbsjyFJAySpPdbJoO00iA2VwjX6tt728ypoh
	E9ChAYtRcubJyhWnWavReh4UqrlBBrKhJ7FiIYK7zp8f6E0n2hCwqtFSfJGmhSw1rwFjGT4DAPIlm
	QgXHKcSfRFxpr06fDmAdEH7IL/MVV4I1a5bLg6pqFn9+GAP5UnhG6fmyP9TPfwfJCPDHulmuA1nYI
	7ZlCtXGQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHFU6-0000000HYeF-0jc4;
	Thu, 15 Oct 2026 07:05:48 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 311DF3006DD; Thu, 15 Oct 2026 09:02:33 +0200 (CEST)
Date: Thu, 15 Oct 2026 09:02:33 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Hui Su <sh_def@163.com>
Cc: mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>
Subject: Re: [PATCH] sched/idle: Destroy on-stack hrtimer in
 play_idle_precise()
Message-ID: <20261015070233.GG4121339@noisy.programming.kicks-ass.net>
References: <20261015025029.3356060-1-sh_def@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015025029.3356060-1-sh_def@163.com>

On Thu, Oct 15, 2026 at 11:50:28AM +0900, Hui Su wrote:
> play_idle_precise() initializes it.timer with hrtimer_setup_on_stack(),
> but does not call destroy_hrtimer_on_stack() before the stack object
> goes out of scope.
> 
> With CONFIG_DEBUG_OBJECTS_TIMERS, hrtimer_setup_on_stack() registers the
> timer as an on-stack debug object. Such objects must be removed before
> leaving the function which allocated them.
> 
> Call destroy_hrtimer_on_stack() after the expiry loop to balance the
> on-stack timer lifetime.

Maybe, but I'm hating on this.

For one, the hrtimer_setup_on_stack() comment doesn't mention
destroy_hrtimer_on_stack(), so how are we to know.

Secondly, we have __cleanup(), which gives us the opportunity to
actually do the right thing and create a better interface.

