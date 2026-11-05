Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793890729;
	b=v96bhJvkiid967OMLXnyqL15LRJxdPDFQfWncDmw/M91H7YnN4Z4PY1Ga90IbY2qsslB
	 bXaE8AJnoSA+w1IQXX9midUg2hI3Gh456AGQAxe0Q5YXCRfrhRAh1Fc99EpwfDdAEAHSL
	 wFwODX8OkfrrQ0mzpYlDlan93BYfEnHjY3a8uOPBjkKeD9JmZEo4YgFyuUdMSbV0SlvV0
	 jtKPxMl/dxFZcrh8S8Ae8YF8YFRq5yieSS6tNO6PWh27U036wuXDAR4d89YQiYFf0LfZA
	 ykb7GWku0CumOUXp9JGRwWhqj5AU3C6oB69/RaCx6k1DY6KXaHvRNlOTNRO68BK+KhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890729;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=wUGc+KdbCgid8Ys19RjdSHyEDFT5mLI3WQY1DG1vEVY=;
	b=3B0NZfzxi6oV2C+6o7K5jjp6e5jvT1oZIdIs0zBYhV2i/LMwkgYMhQMC5Nhv6S/Lh06p
	 gADIxu/7jvgMIxm2FLKIDzawtVzTCCvW22SHyRteEfmQ7p1YAc7bKltzER9ItLT7yUk29
	 6sDNzYD7PV60I0I+O0L55G8mfd9p0tzO0EdgrGRt0E7siRzguvJAAupqtvtNG7v81t702
	 DlCfI8lz28MwlLC7BEHLpI4XTgjz73E5lFnFPOepmSsuV/AMUUMnoIb4h4xOV60h9DdCW
	 u0Dxy3yB3O+cskREVhY6MUawL3XqGeTMH70dftUqIavtgiVFOUC3ZV7P17dcJVk/rCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=cILGGSKY;
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DA66082BD4
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 14:58:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7DA66082BD4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=cILGGSKY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=wUGc+KdbCgid8Ys19RjdSHyEDFT5mLI3WQY1DG1vEVY=; b=cILGGSKYDJ7dqy+YASo/GTEkyW
	unMYVoPVZ1GyGC6lR1cub+2Ar2kCkw2zqFKsJqRVBnLNGP20nAD/oYIUzHx1SQBp3IXGzFCBOXdey
	xdw6UDm5lbMVDmUitC74KAY/kWQVT47VRVfI9fxz9cQf5Mhvg8qeSGpGdrqVqdVQ5Jpn5l7wJcP02
	NNU/lfUj7lpri74Wuw3D+78EzxcspKpVT3ahCG5lnJtQNdx1IkWmRb2DNWr10w6jJKRswgf+8MWlR
	Xh21OeomN1gouegy97XtPgO3dPkBzKVMo8oFbEb5hDrgYzVHJ6GuT/NQBucIQ9ph6fM7ZlfUv1xb1
	iLu6XKhQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOyvN-000000037A3-1fL9;
	Thu, 05 Nov 2026 14:58:45 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 7AF013002F0; Thu, 05 Nov 2026 15:58:44 +0100 (CET)
Date: Thu, 5 Nov 2026 15:58:44 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>, Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>, linux-kernel@vger.kernel.org,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH 08/14] lockdep: Introduce lockdep_assume_ctx_held()
Message-ID: <20261105145844.GQ1813469@noisy.programming.kicks-ass.net>
References: <cover.1793654853.git.bvanassche@acm.org>
 <71bc2361d8676f1eea3c945cbf21a0c2542d5b92.1793654853.git.bvanassche@acm.org>
 <20261105083746.GP2668804@noisy.programming.kicks-ass.net>
 <CANpmjNMaDwcm+tQ-cOUjnE3n+5x8WgB5CZ037uurbwVa4Jn0BA@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANpmjNMaDwcm+tQ-cOUjnE3n+5x8WgB5CZ037uurbwVa4Jn0BA@mail.gmail.com>

On Thu, Nov 05, 2026 at 03:39:33PM +0100, Marco Elver wrote:
> On Thu, 5 Nov 2026 at 09:37, Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > On Mon, Nov 02, 2026 at 01:34:38PM -0800, Bart Van Assche wrote:
> > > Introduce lockdep_assume_ctx_held() and lockdep_assume_shared_ctx_held()
> > > for code that needs to inform Clang's context analysis that a lock is
> > > held in code paths where lock ownership cannot be proven at compile
> > > time, e.g. because the lock is accessed through a pointer alias that
> > > the analysis cannot resolve. These macros call respectively
> > > __assume_ctx_lock() and __assume_shared_ctx_lock() and also verify at
> > > runtime with lockdep that the lock is held. Store the macro argument in
> > > a local variable with a unique name such that it is evaluated only once
> > > and such that nested use of these macros does not cause shadowing. Rely
> > > on Clang's context analysis resolving that local variable to the
> > > expression it has been initialized with. Document both macros with
> > > kernel-doc comments, including that __assume_ctx_lock() and
> > > __assume_shared_ctx_lock() must be used for context locks without
> > > lockdep support, e.g. bit spinlocks and the RCU context tokens.
> > >
> > > Convert the lockdep_assert_held() tests in lib/test_context-analysis.c
> > > into lockdep_assume_ctx_held() tests and add tests for
> > > lockdep_assume_shared_ctx_held().
> > >
> > > This patch prepares for removing the context assumptions from
> > > lockdep_assert_held*().
> >
> > So the only convincing rationale from 0/n for doing this was that the
> > current annotation can hide the need, and thus cause a lacking of
> > __must_hold() on the function.
> >
> > I'm not sure I understand how this alternative form of the same avoids
> > that same problem, and the above doesn't seem to mention the whole
> > problem -- either that, or I just can't read this morning.
> 
> There's no problem if you're dealing with new code. But we have a lot
> of lockdep_assert_held*() sprinkled all over existing code, which when
> compiling the kernel with WARN_CONTEXT_ANALYSIS_ALL will not warn
> where we would be better off with a __must_hold(). I believe Bart had
> been working on enabling this more broadly and doesn't want
> lockdep_assert_held*() hide warnings.
> 
> This latest iteration is a compromise for that problem, rather than
> the previous proposals of removing __assume_ctx_lock() from lockdep
> primitives entirely. The programming model is unchanged: we delegate
> to dynamic checks where the static analysis fails, and that's the main
> purpose of __assume_ctx_lock(). The only difference is that we'd have
> to be more explicit about it, just because of legacy use of
> lockdep_assert_held*().
> 
> I'm somewhat on the fence still, although would be willing to accept
> this compromise if it does help catch more bugs, and is neutral to
> only mildly more mentally taxing in writing new code.

Aaah, so the 'solution' is to rename lockdep_assert_held(), such that
the pre-existing annotation doesn't pre-pollute things? But if you start
by converting existing lockdep_assert_held() to the new
lockdep_assume_*_ctx_held() you'll run into the exact same problems?

That is a very minor and very subtle 'fix'.
