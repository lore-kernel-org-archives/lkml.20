Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4440E22538F;
	Fri, 18 Sep 2026 10:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726861; cv=none; b=YYby3KJi91v+wRadkS4TWIUmuv88F3jA1qVBMwh/EVlgc9pq2qY6iPdPmBWRMEfPnA+CO6nhVL7LHPfCnzW3sX2GrjAniTSfkQZ0E5GLtyUfqKG3caEfR6JcbWoe+hMrdrCKk5pb31GDi6cgH15tQxQ+/GYSSibvyVkHoczN3Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726861; c=relaxed/simple;
	bh=BAVjxI/sPlbNfC2L8bo/HavZU0mb4/zUP+cUEWUy5LM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d1iYnfVLz7mXkMUApQFBiXizE8KyC7sPTVQ4szLPjwcoNRtzS+ED/o6+Czy2IDkXLOu5Y5k0C1LNQodxBwE33d+nM2Ww0fOGc+1odH9z5nTABmzb0AhL0UmsQMOag6hsg9K44sy3JFAAFTHb1MXru1hQLHuTWQrlFec9l/Qoqko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=oOO60XwY; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="oOO60XwY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/ZQNv34Ek5Ax6QYdQ7WcoxvzXPWjuzfsPGdEUkXflEs=; b=oOO60XwY8ERyAwZK1S5h0ToTPQ
	OWwppHptar6tur502/2Wg9/RCn2+pTXEtbIxFfHSEZlVoELlME73jhYQbNgjqZXZLZlskIwr4BRLo
	4KhTvT+ONt5E5DYomWH9sCloKyIcNdSH+jcmjU8hT4oxN+3cPP3FToHvfwgCedBhWkNh93FuDuebg
	LSCa4XpTARiqYS5ebFHkY+qrfq04Jev8uQkMm22bxOdXL6rKAblbLD/pGi5gzHlrNVhf8kjDvSZ2a
	DiR2HyXULTC0Etm/1SxcycLYuX1tHXwQnnjP8oldLyI2EF+MMok6nX92fsb8cD8KxXPWvDBGHbwPS
	JquZVzOw==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1x7Vi1-006eOU-1G;
	Fri, 18 Sep 2026 10:20:45 +0000
Date: Fri, 18 Sep 2026 03:20:39 -0700
From: Breno Leitao <leitao@debian.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, kernel-team@meta.com
Subject: Re: [PATCH 3/3] mm: kmemleak: raise min_unref_scans to 3 for verbose
 auto-scan
Message-ID: <aq0PcQ-S5i8CWqr1@gmail.com>
References: <20260917-b4-kmemleak-doc-v1-0-84fde6d1f749@debian.org>
 <20260917-b4-kmemleak-doc-v1-3-84fde6d1f749@debian.org>
 <20260917150443.a872ea0fd692503c53b2b773@linux-foundation.org>
 <aq0ChSUFw2n6lXIQ@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aq0ChSUFw2n6lXIQ@arm.com>
X-Debian-User: leitao

On Fri, Sep 18, 2026 at 10:21:09AM +0100, Catalin Marinas wrote:
> On Thu, Sep 17, 2026 at 03:04:43PM -0700, Andrew Morton wrote:
> > On Thu, 17 Sep 2026 06:47:37 -0700 Breno Leitao <leitao@debian.org> wrote:
> >
> > > CONFIG_DEBUG_KMEMLEAK_VERBOSE sends every report to the console, so a
> > > transient false positive there is broadcast to whatever collects the
> > > kernel log rather than sitting in the debugfs file until someone looks.
> > > That asymmetry justifies being more conservative than the general case.
> > >
> > > Require one more consecutive unreferenced scan before reporting. The
> > > only cost is that a genuine leak is reported one scan interval later
> > > (600s by default); the value stays writable at run time through the
> > > module parameter.
> > >
> > > Kernels without CONFIG_DEBUG_KMEMLEAK_VERBOSE keep reporting on the
> > > first unreferenced scan.
> > >
> > > I've been running constant upstream kernel with
> > > CONFIG_DEBUG_KMEMLEAK_VERBOSE set, and I am still seeing some rare false
> > > positive, that goes away with min_unref_scans=3, so, making it the
> > > default based on my heuristic.
> >
> > I'm guessing going from 2 to 3 reduces the false-positive reporting
> > rate, but they're still possible.
> >
> > It all sounds rather rubbery.  Why do these false positives occur,
> > anyway?  Are we papering over a fundamental problem by filtering out
> > its user-visible effects?
>
> The fundamental problem is that we can't do a stop-machine for the
> kmemleak scanning. When scanning takes tens of seconds, pointers may
> move around memory or registers on other CPUs, so kmemleak could miss
> them. It's all probabilistic, hoping that we won't hit the same object
> two or three times in a row, 10min apart (for lack of better ideas). We
> have other heuristics like checksumming but they don't seem to be
> sufficient when testing on a large scale.

In fact, in my investigation there's only a single use case where I
actually see this false positive, which go away with this new approch.

And I have a very solidy test setup where linux-next is deployed daily
and run for 24 hours, until the next kernel replaces it. This is on real
hardware with some basic workloads, so, in fact the false positive
(given the design above) is quite low.
