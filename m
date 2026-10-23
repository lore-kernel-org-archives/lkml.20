Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792797661;
	b=Cwlp/l+Zg9jTE5I5T5iwhaL/MCGYT6cN6C29wL345izqKKbu6IZ7QFuwbuORP1qVaAzA
	 oACAVntv+wrKdl0nRMQGO0cELvagYMk+nucsqr6RDl1h6FyHl4362usqL7XvLxYsntYHO
	 V8N7wdpSf/uFLxXdTLBfxycUU4QwCxcUsk6TuPsFhTFMBzy33zkY41y//3mrlw16Thmrn
	 nmyf9HkFtGpEGTn8hIFo8k+Z1xiq3tRSrdst0U3wLUsil1XR6sFm/SIyaTFbIsn/hUPNI
	 JubF8lRkHcJV8QQE98Bv/BxTV2G7Efz+lJz5GwoQO+bG6IYFz465n664aKyen2cKLnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792797661;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=B2ArrvzltjwP38/8ht61a73Lmjbrh2f6HfaOLEeK7o4=;
	b=sIKuHgn9LHAu82WCrACUx7fmFa7IknXEchfQjjLueEdUKae+3Yabxyjf4eZlULTajacI
	 VVW2XJyz2rB5l7J3DE9XolGHV7d0Ol6G1KqxbAZ58MtQdY4tVKbL3aSHuZOJTq0NKPutm
	 yYtbPEmRQ1Pkk7xVam7vFwqsBPN/Lm0yb6b5SRLmhmxNFev7ncYcUik3w9yONoucKFsQZ
	 RT/UWd91lb6Ce+1nFvL89NKgRHUZ4MxjhuF3vABqY2BZoiavSi54rfJe4G3U6zyMZJl/l
	 ZElICn5iNcsYl0ng3YC8c3ITVp/yy6UMTe7+MRq2RXquDNe4OcGJ748tLUszMptpiiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=O6W+KYNl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502C2606A337
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=O6W+KYNl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ADF21F01825;
	Fri, 23 Oct 2026 23:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1792797660;
	bh=B2ArrvzltjwP38/8ht61a73Lmjbrh2f6HfaOLEeK7o4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=O6W+KYNlnWbK8/PA1L/ILQbtBHsWsiLy+pduQw+HkWI/aD6RKzFwhp4yU9YbPQ+Z/
	 irV1cvUhE7/LH8LkI3cUK7DmbDx8nyeUE7MYlLpO6owMuvdeYAbMzlKzv7hLKrUMXX
	 RgPscQNRHFVX5F5n6GL3m/R2e4+/mPegf2jszDMI=
Date: Fri, 23 Oct 2026 16:21:00 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Suseendran Bhaskaran <suseendranb@google.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Yosry Ahmed <yosry@kernel.org>,
 Nhat Pham <nphamcs@gmail.com>, Chengming Zhou <chengming.zhou@linux.dev>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/zswap: validate dlen and normalize comp_ret on
 compression success
Message-Id: <20261023162100.41145a57fb91ed1073c24c41@linux-foundation.org>
In-Reply-To: <20261023200426.3865221-1-suseendranb@google.com>
References: <20261022232734.496064-1-suseendranb@google.com>
	<20261023102607.7635885be12b0b6e7a5971aa@linux-foundation.org>
	<20261023200426.3865221-1-suseendranb@google.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 23 Oct 2026 20:04:26 +0000 Suseendran Bhaskaran <suseendranb@google.com> wrote:

> > Wht you forgot to tell us (please never forget this) is the
> > userspace-visible runtime effects of the bug.  Autobot says:
> >
> > : The userspace-visible effects are limited to corrected zswap
> > : statistics and a new warning for invalid compressor results.
> > :
> > : When compression succeeds but produces exactly PAGE_SIZE bytes, and
> > : zswap writeback is disabled, the page is rejected as before. However,
> > : reject_compress_poor now increments instead of reject_compress_fail.
> > : This makes the debugfs statistics distinguish incompressible pages
> > : from actual compressor failures more accurately.
> > :
> > : A compressor which reports success with a zero or oversized output
> > : length will now trigger WARN_ON_ONCE(). Previously, zswap handled
> > : these results without a warning. On systems with panic_on_warn
> > : enabled, this could cause a kernel panic.
> > :
> > : There is no intended change to which pages zswap accepts, rejects
> > : or stores uncompressed, nor to normal application behavior.
> > :
> > : I think these runtime effects should be described more prominently
> > : in the changelog, particularly the new warning.
> 
> Apologies for missing the userspace-visible runtime impact in the commit
> description. I will make sure to always include this going forward.
> Autobot is spot-on here. I would be happy to send a v2 with an updated
> commit message that clearly documents these runtime effects and
> behavioral changes.

I'm mainly interested in answering "should we backport this into
-stable kernels?".  A small debugfs accounting error is probably a
"no", but a WARN is "yes".  Is that real?  Can current kernels truly
emit WARNs due to this issue?

If so then yup, please send along a new changelog.  Or a v2 with a new
changelog.
