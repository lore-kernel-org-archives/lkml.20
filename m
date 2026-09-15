Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9613BB9F7
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 13:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789478005; cv=none; b=s49lREqCX8F8MzVrqKFl46Cj4hPHeblUDJUm2EdbPck6TyqwHIU7bLIWL7549iIuUpEWe//Wf5+Beg65sG/tehYH89IVcLsqMr4HTKkpBEwSgxOH8p5juY5DgHyxhRxvejrQSLxGtccKoOvcBua2C6Uz3iWfnpHdROnopbbGHyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789478005; c=relaxed/simple;
	bh=WK1m4iUpBi4TgQB3LFuoDYXYcCzFmj+S5FH1IYywWQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pAkZ4bx2/9DBZrB/Qi2HJfbPOiJzRzEgIO4Ggrc9faaPQp9/Uux+/FhptVb0NGTtyXRPFF0mWyFWw4E0cLBwsE4eagAyZSq7kWc1uHgQuHyA/h6MgOP3Uyf2pvpZzvYo/YppG5GU+WeZzgtgrZaMNs21lLhC3MgS4narA2tjG7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=iy0Z7NLq; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="iy0Z7NLq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=r/at6QZ3Yb69xOIrWqNlstKOMB33EJOfW7za0wXrTFw=; b=iy0Z7NLq1R37O9xL1QoHROM6Dy
	D15Z2geNen9RlC+BQ1dy3xm0iVZjf+xZZ3MnZMArhjowuvl+d1oDaSdZ/2zc33zmu1gkIioU7tRqq
	XnI50YiBNcZ9vFu7otf8UnBVJhnw2peUfUsxlvUljEM8VJCg20GWT7HVgYMa2jgmjVhTUr0AP5eKS
	bbUlE1yNHzBPRxrl18v/zMeHJk+ciVkollxTbL9v8xFDoZgZjoKIBLSywWnCuUGPEtdAKuTRMPXsG
	dH1kk25ywsI6sHzlc8INEz/R+8l6S+zJBPey1QVHkkb0Pn8k9Oz8DqGD4YpTn0f4h4t2fjfqGocjv
	tMLnWPTQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6SyK-0000000G9qo-0dWC;
	Tue, 15 Sep 2026 13:13:16 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 0EFC2300969; Tue, 15 Sep 2026 15:13:15 +0200 (CEST)
Date: Tue, 15 Sep 2026 15:13:14 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: David Laight <david.laight.linux@gmail.com>
Cc: Waiman Long <longman@redhat.com>, Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>,
	linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Yafang Shao <laoar.shao@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v4 next 3/9] locking/osq_lock: Set prev_cpu=0 instead of
 locked=1
Message-ID: <20260915131314.GB2009045@noisy.programming.kicks-ass.net>
References: <20260907084133.3696-1-david.laight.linux@gmail.com>
 <20260907084133.3696-4-david.laight.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907084133.3696-4-david.laight.linux@gmail.com>

On Mon, Sep 07, 2026 at 09:41:27AM +0100, David Laight wrote:

> +	/*
> +	 * If 'prev' tries to remove itself from the list before we write
> +	 * a new value to prev->next it will spin in osq_wait_next().
> +	 */

This comment pertains to what? 

> +	/* Invalidate prev_cpu matching osq_unlock() */
> +	node->prev = 0;

I'm confused, osq_unlock() does no such thing.
