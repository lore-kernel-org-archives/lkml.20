Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794554502;
	b=N9bS1cL8n5iX637t+r4YTZ61Spzwmcu2qefqAng5v0Inpr68DYHmlJFgldU2cvyumk1q
	 Ik0dYwvqIY1zSaZQ40RH2lS4XRnGDfUjEbnLdGHTgeJaIUgXlmwSkbiivZKyGud7e7d2F
	 WWsTWHe149GytASWs/X6c/8eNxalGuEIevCTtX0FAoFsLneR7MIMFPVLpgqh5H9U71cMv
	 tkjb/wmqMV6B2OrwQcXRaDJsZfY4tqx/uCUWQ2yHDiwB23U4vOgC8L+IK7IGAqBjWif2L
	 GHNV95OPOu/rVvtoI7kQOXN1ULDKWCB5SVJYvpLig0INzDtlmMZzR2VhsjGZMeBp53w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794554502;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=QqC622svUeLAP/0RJH25dyUCGXVIEdxaZvMvEl/YnGE=;
	b=ZOXs55+dd0Nz2EsQvCACD5zqhwORCzWt5hDbiCo2qgjdBWEs6X5fXrZlnwEjzZDQvdM9
	 EAE/DtCkg8zc7//fexLnD6Pgtewa4SHyvA2z1R2AOwd9Vr0AJ5LLlnZjMn32wG7gG6ayM
	 aIfkmLXnxWOE37mswkYIA6q7Ozxp9S3acyg1TWadndGJgsoksBq0e6d5FnRmSF2a60LlE
	 PlA+suAKfl8JdFf9V2ZUnic7evs8vXblUZVDCXNFp6GMpBGP2lCynGyOdP9IvbeUCGZOL
	 O1JsSgNqpF9om6YwP1RTjyT/hvEIwzUc7iElmwdZnW4XKSoy1sGoch6rAzAOkMMfqCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WPKf025q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8F5606A321;
	Fri, 13 Nov 2026 07:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WPKf025q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA4831F000C4;
	Fri, 13 Nov 2026 07:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794554502;
	bh=QqC622svUeLAP/0RJH25dyUCGXVIEdxaZvMvEl/YnGE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WPKf025qvwKOIDe/bJlF/qSaV/f/OFhDVg4mHzx3ns4mK/wZhSVGhbY5xZBM2CrKt
	 g2Zm6jinwKHXLb49tIkMh1Y992rc6DfUhv5OuLqTC8/hNRMvJyrEmD/4i8+6xNV+S3
	 oG+zBkjmLq62FB9ZsrMC+zUZ3lBDdLLmNRGA8L0/aN6E8LfiEi5h/t+gs8hmgkjNFY
	 Y8ZKLA8Yw6sk/X2BUQJK8+GBHA7AXznXXGRj8yHHz7+G3l5GQF0ogQd0eZDpI0EDY3
	 maixtnG99HUrGYbgZXTNQIPe8AVTRBiAo+hSOo0XBhLdVaeEsal+U/R3T5Zs3ywe8T
	 NNU63bG9yOBeg==
Date: Thu, 12 Nov 2026 23:21:40 -0800
From: Namhyung Kim <namhyung@kernel.org>
To: TAKANO Mitsuhiro <takano32@gmail.com>
Cc: Mark Brown <broonie@kernel.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the perf tree with the perf-current
 tree
Message-ID: <ava6hCDZ2kOjS5oR@google.com>
References: <avW648YFgbci03ra@sirena.org.uk>
 <179449737932.73597.12778815944082557280@gmail.com>
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
In-Reply-To: <179449737932.73597.12778815944082557280@gmail.com>

Hello,

On Thu, Nov 12, 2026 at 03:29:39PM +0000, TAKANO Mitsuhiro wrote:
> Hi Mark,
> 
> Thanks for the notice. One thing worth knowing: the full stop is
> intentional, so keeping it in the resolution is the right outcome.
> 
> It came out of review. James asked for it on v2:
> 
>   https://lore.kernel.org/all/a188c604-46c0-48fb-9cbd-9eacad88b5c9@linaro.org/
> 
> and v3 added it:
> 
>   https://lore.kernel.org/all/20261107022145.1713159-1-takano32@gmail.com/
> 
> The copy in the perf tree is that v3. The copy in perf-current is the v2
> that predates the review, so perf-current is the stale one - nothing more
> than the period is missing from it.

Thanks for the clarification.  Sorry I missed Arnaldo already took this
patch into the current tree.  I'll merge it once it land on the mainline
and will resolve it correctly.

I think it's trivial so it'd be fine to leave v7.4 without the period.

Thanks,
Namhyung

