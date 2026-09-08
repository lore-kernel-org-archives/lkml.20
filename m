Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2CC3FC5AE
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 08:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788856718; cv=none; b=EXkfQesot9YSSyuhAG/h9f55zuQdCIaVESTE2bBxEvTP+lIp9rxsNV6sIcJxc97ZfgXrHoVkxMs8Z1oJuyVH4EDCR4So56bTRKjd5L7EBDZ9YPWfcLRC0MQ/8/7swsWfvrnVgeSX8pcg5JrgH3JForZpJQh11kMYcSmnLntI+Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788856718; c=relaxed/simple;
	bh=RrOm3gBH/nkz0GFO1DYxWm33iDajlpQQwKbeiEePG2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mbb1UF0uu9ewalnfZnhovVQeV1eCp1FU12rvwMlN2K+qkgua7uvW0PZ7M4K3MDSSBaVxnFOi0KnYbd1k4RhThXXYhWL0I92R2rbj7k09/iv1yn0UzOGh4DNGwcINmc0y1/7zlEOtxpiE47ZzXgqZ7gv1UH0UlmLFfSB884CV+Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=VThZIg2G; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="VThZIg2G"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=LrPFbouso6scqRLBWDVFky6MT8LmCpW/Jc4E8YZJU1E=; b=VThZIg2Gx0fXfVrLTgai7+wAIS
	c/eobnyb7OkZ49ZUqRedK2eItG837+N+r7itluSRHp2Qady3wZs3KZmWNcLOnq+eE/+cHIGhaFatb
	nM3nryYjtwqicTkJLMzMjXy6+230qQx1vxhoCV6Sg3RLy43xq+cgfR62BtfSWuwdWX8+q1rgYe/Qn
	cUKM6TKdh58H7IAm9E27Yzq4j2jSSk99k4Zqo60xh9ckzGaeq9QlvsNplXj1pmgWZv7XehxCVSfQK
	SaudSBgPkWN1ZibyAYlUKqc9/fLN/LZd34qh63gHJQOkK6W9GooWWaufLXsFIjl7jLnOW7Re7suE6
	K3eS51dA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3rLO-0000000H8cM-2r9i;
	Tue, 08 Sep 2026 08:38:18 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id BA8AD3005AF; Tue, 08 Sep 2026 10:38:17 +0200 (CEST)
Date: Tue, 8 Sep 2026 10:38:17 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Ye Liu <ye.liu@linux.dev>,
	Marco Elver <elver@google.com>, Ye Liu <liuye@kylinos.cn>,
	Yi Tao <escape@linux.alibaba.com>, Tejun Heo <tj@kernel.org>,
	Bart Van Assche <bvanassche@acm.org>,
	Christian Brauner <brauner@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/8] mm: introduce for_each_process_rcu and
 for_each_thread_rcu
Message-ID: <20260908083817.GN4121339@noisy.programming.kicks-ass.net>
References: <20260904083001.553587-1-ye.liu@linux.dev>
 <20260904083001.553587-2-ye.liu@linux.dev>
 <20260904122536.1079b279@gandalf.local.home>
 <87ecf87m31.ffs@fw13>
 <20260904190742.7231d56e@gandalf.local.home>
 <8733vo6tui.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8733vo6tui.ffs@fw13>

On Sat, Sep 05, 2026 at 09:27:33AM +0200, Thomas Gleixner wrote:
> On Fri, Sep 04 2026 at 19:07, Steven Rostedt wrote:
> > On Fri, 04 Sep 2026 23:17:38 +0200
> > Thomas Gleixner <tglx@kernel.org> wrote:
> >
> >> No. Scopes can be left by any valid termination mechanism. 
> >> 
> >> The only problematic case of leaving a scoped_guard() with goto is when
> >> the goto is actually implemented as an ASM goto. See the comment above
> >> arch_unsafe_get_user() in linux/uaccess.h.
> >
> > Oh OK. I was under the impression that goto's could cause undefined
> > behavior with guards. Or is that just when a goto jumps over one? Or is
> > that OK too?
> 
> Jump where ever you want. The keyword is 'scope'.
> 
> The normal visibility rules of variables in C scopes apply. So if the
> scope for which a variable is defined is left and the variable is
> defined with __attribute__((__cleanup__(cleanup_func))) then the compiler
> inserts a call to 'cleanup_func()'.
> 
> The problem with ASM GOTO is that the 'goto' is not visible to the C
> compiler because it is burried in the asm inline. Clang detects it at
> some later point and fails the build. GCC simply emits buggy code or at
> least used to. Haven't checked whether that's still the case.
> 
> So we worked around that by letting the ASM goto jump to a local label
> within the scope and use goto 'outofscope' from there. That makes it
> observe that the scope is left and the cleanup call is inserted at the
> right place. See 3eb6660f26d1 ("uaccess: Provide ASM GOTO safe wrappers
> for unsafe_*_user()")

Right, so GCC will accept and miscompile jumps into a scope. Clang will
warn/error about this, so this should never happen.

Aside from the ASM GOTO issue, there is also an issue with computed
goto, those don't work either.
