Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 176C63126D6;
	Fri, 18 Sep 2026 09:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789723276; cv=none; b=l/V5B9UoXAZbpn8PkLlhZ9aVeSbsHS+KUjybL9mi1dm/rOvBFWxuB7vgrC59/6X+wmGBxBMkfmpUZBWafWsjAmfR1cE3yMBrV5UhdMIUoYvsSP8dMEdGyR35AOigefzkSh9o/KO/xrTd4fm87ug8eBmXI9fI6evFKKcB7xj3faQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789723276; c=relaxed/simple;
	bh=5CMhIz7TNdTgW0ja0EqDPikDbWaTqP2A9I/h5UkqOQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rTXbkEx1q3EeTam7gtloT4AwOgT+szTFc4ohLQE/rCdf2Uv7dCJHiqTp2I5njRLxD/GPe8P/x0IryFb49ltoj0gfFwN6bmMe0rJfkd6Yl4lvEGF92KdYGIyIYviUqOLfxaQz2ynhu4ZKrlvDp230fbK08af3wiVZBnlKNLddNro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=LAW1+F6i; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="LAW1+F6i"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AAA2A168F;
	Fri, 18 Sep 2026 02:21:10 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AEE6D3F882;
	Fri, 18 Sep 2026 02:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789723274; bh=5CMhIz7TNdTgW0ja0EqDPikDbWaTqP2A9I/h5UkqOQA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LAW1+F6iqLNU7zwhRuci9q8L+w0i/ZhyEK1hvEUAlDRh/Bg+1GlOgMqVikHiT+frd
	 ZoJWyPH0UkjTV1r/5xX6Xvj3o6oadb+H8oHXKjauUeRHLxc7TZuAwSSqvbgIy/6OXY
	 G1LjX/i4OAcjXApwTQ0K1XuyZYh52FOWfoUpIbgw=
Date: Fri, 18 Sep 2026 10:21:09 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Breno Leitao <leitao@debian.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, kernel-team@meta.com
Subject: Re: [PATCH 3/3] mm: kmemleak: raise min_unref_scans to 3 for verbose
 auto-scan
Message-ID: <aq0ChSUFw2n6lXIQ@arm.com>
References: <20260917-b4-kmemleak-doc-v1-0-84fde6d1f749@debian.org>
 <20260917-b4-kmemleak-doc-v1-3-84fde6d1f749@debian.org>
 <20260917150443.a872ea0fd692503c53b2b773@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917150443.a872ea0fd692503c53b2b773@linux-foundation.org>

On Thu, Sep 17, 2026 at 03:04:43PM -0700, Andrew Morton wrote:
> On Thu, 17 Sep 2026 06:47:37 -0700 Breno Leitao <leitao@debian.org> wrote:
> 
> > CONFIG_DEBUG_KMEMLEAK_VERBOSE sends every report to the console, so a
> > transient false positive there is broadcast to whatever collects the
> > kernel log rather than sitting in the debugfs file until someone looks.
> > That asymmetry justifies being more conservative than the general case.
> > 
> > Require one more consecutive unreferenced scan before reporting. The
> > only cost is that a genuine leak is reported one scan interval later
> > (600s by default); the value stays writable at run time through the
> > module parameter.
> > 
> > Kernels without CONFIG_DEBUG_KMEMLEAK_VERBOSE keep reporting on the
> > first unreferenced scan.
> > 
> > I've been running constant upstream kernel with
> > CONFIG_DEBUG_KMEMLEAK_VERBOSE set, and I am still seeing some rare false
> > positive, that goes away with min_unref_scans=3, so, making it the
> > default based on my heuristic.
> 
> I'm guessing going from 2 to 3 reduces the false-positive reporting
> rate, but they're still possible.
> 
> It all sounds rather rubbery.  Why do these false positives occur,
> anyway?  Are we papering over a fundamental problem by filtering out
> its user-visible effects?

The fundamental problem is that we can't do a stop-machine for the
kmemleak scanning. When scanning takes tens of seconds, pointers may
move around memory or registers on other CPUs, so kmemleak could miss
them. It's all probabilistic, hoping that we won't hit the same object
two or three times in a row, 10min apart (for lack of better ideas). We
have other heuristics like checksumming but they don't seem to be
sufficient when testing on a large scale.

-- 
Catalin
