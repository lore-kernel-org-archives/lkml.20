Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792565098;
	b=Cfkfg1yc5fslvsSYH/sBkLTXJEf1+4+BlOcAmWN3m67VykUWedoX2aR3ehOz3v+c3weA
	 BDaeP5YE6xRgWCk4KmNaanmvwDx/Pqwelly6/JgFk5nyfTl5e+WRQA9Dli4Qj4q74atEI
	 +wMHOB/J22xSdqi8DOtE42WwXyxHzcyBo3M1Q5NWdEuPFU5w52DbnoDUkfkXzIK6hTBkY
	 MhVm0aK5tR4JYdNeiZD6+vew6quV9xCbBqQyAqQeBnGQ8LCHlitXutNC0nQWox+xojTN2
	 U21cMJZubkXIrQDtkZC0aTc8ao0HlQMJJBE5fRY19bzP+FAYIgsXPH6bEO3l6z77ZCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792565098;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=T1e1QM1ZFN6/wik079djmaxdvIuuJbXdO9q9FT90fIA=;
	b=EC15Gwe9fi33juarmT3RSC/Dpf3X9klxcNrvklMkiaVIEwi9YVbACbx8aTV8a6oIhF1u
	 BLQV3lqpNxgs+Oj5k4iLcntzO1KnQIaXCZJnT+RqP6N+SF0VH0+NKXqJqhx5evgf4UuGu
	 p4kKebYULXHR2YtE2U6LPKq7wg5aQBWUsdGCm1RCrxPL+omeFZWParQ/uBLa0kyBkswRh
	 Qqsz9JssMfIwJRiprziHOhDe70EKyltadWZVnH1775U3HD9jFk0hQADzXf45ETZzBXPOq
	 XYNvS46yor2OBnM68dYV25fO5Xri5/Qx32Jlpj7uprenxL5cuGqZ9BKtYI+PuGw3cqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="k7vt/TP8";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1428606A319;
	Wed, 21 Oct 2026 06:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k7vt/TP8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 648901F000C9;
	Wed, 21 Oct 2026 06:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792565097;
	bh=T1e1QM1ZFN6/wik079djmaxdvIuuJbXdO9q9FT90fIA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=k7vt/TP8TGbvt+xlj4sPKksUlfqKnltoq+yYOPRi6gIdiBATK69qpByYeTKkILJgz
	 5sXAdciPS6yA1psxWbJGLjpC/YTv7O3KWoEbeAr5fnH1MtR+EBDtPEVJYLi+c98QjE
	 kRAR7KKvYi4X3323MJGSIQBnSrtKaCGIM3BUO9Okhpw7XqUFefViPSy4aamQR5CD7L
	 GKBcjgTIRzhIJJ7zxFNeXid1ye6YmYGUShdjRLbkrvyAWl6WbdnWqFfe7MD3/R4wcN
	 Qvd6L4/MTs7TxJSek1n74HOANbhjtx3ptidk/o9NcH9tW+YAitYqtEe4rE4JO0gqt0
	 Uup/NLQX6p5fg==
Date: Tue, 20 Oct 2026 23:44:56 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	linux-doc@vger.kernel.org, workflows@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: submitting-patches: Require base tree information
Message-ID: <20261021064456.GB31908@sol>
References: <20261020212235.1143086-1-ebiggers@kernel.org>
 <20261020-brown-potoo-of-relaxation-3e9a72@lemur>
 <f6d6d8d2-03ca-498d-b5d2-578aece560d9@infradead.org>
 <7f3bab90-c32d-484b-b493-974cf33bb30c@kernel.org>
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
In-Reply-To: <7f3bab90-c32d-484b-b493-974cf33bb30c@kernel.org>

On Wed, Oct 21, 2026 at 08:35:04AM +0200, Krzysztof Kozlowski wrote:
> On 21/10/2026 08:07, Randy Dunlap wrote:
> > 
> > 
> > On 10/20/26 3:07 PM, Konstantin Ryabitsev wrote:
> >> On Tue, Oct 20, 2026 at 09:22:35PM +0000, Eric Biggers wrote:
> >>> Many patches still don't include base tree information and can't be
> >>> applied.  Such patches can't be properly reviewed or tested, nor can
> >>> they be accepted.  submitting-patches.rst already describes how to
> >>> include base tree information, but it's characterized as optional,
> >>> appears only towards the end of the document, and is missing details.
> >>
> >> I'm happy with this change, but I'd disambiguate the title a bit. With b4, we
> >> started providing both a base-commit and base-tree footer, specifically
> >> because often times the "base-commit:" line by itself is not sufficient.
> >>
> >> Imagine this scenario: a developer is working on some code in a feature branch
> >> and come across a pre-existing bug. They create a fork off of their feature
> >> branch to fix the bug and send it in. In this situation, the "base-commit"
> >> footer would be meaningless, because it references some transient commit-id in
> >> their feature branch. In an ideal scenario, the developer would rebase that
> >> bugfix branch on a known tag, but that doesn't always happen.
> >>
> >> This observation doesn't really preclude this patch from being accepted, I'm
> >> just recording my own experience that, by itself, base-commit is often
> >> insufficient.
> > 
> > Yeah, I was wondering about specifying tree as well as commit, so thanks
> > answering before I even asked the question.
> > 
> > Most of my patches are made against linux-next.  So: is this going to be
> > acceptable?
> > 
> > (for linux-next-20261020:)
> > base-commit: 053966c344dbd346e71305f530e91ea77916189f
> > base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> 
> According to commit msg which claims that without base information "nor
> can they be accepted. "

I actually wrote:

    Many patches still don't include base tree information and can't be
    applied.  Such patches can't be properly reviewed or tested, nor can
    they be accepted. 

So it's about patches that can't be applied due to lack of base tree
information (due to the obvious guess not working).  Not merely the lack
of such information by itself.

- Eric
