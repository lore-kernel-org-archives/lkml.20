Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B5C353A63
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 06:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787813186; cv=none; b=hd/3A5/IwjuVr47P9a3CDX7eb/QYTc2GqfhCicDAcXeJsp6S0ZxXu91tMdmf7rjAoIbEsRcIxEk3q91y46WLkzVqDHN9WSdyzP/QvZlRRpy+wdpz4XYB739gkL3LUvS5mFmKLgfObzXVJRZF8JUDT4VBymN0LXlzp125aEZgNXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787813186; c=relaxed/simple;
	bh=6gY4hiMrfKzYYgGg715W3I/dYOyPV80Fa+Vwl0XyRlc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PmuiW45YL2wnPNvnMnRRprwqzIGvuKC8nSAEI9qMuFy1aftqMUjAZqo7ydM5fCvwNtieUyPx639vhVjgPrlgcL8poF0krGLjG/GcmlvAtwjWIMR5yB46iHLbSPVvB2fIS0Cn2BY1oo2yhrwa1EsFXVTQRUIgxNqJFLyEmWLSqzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Y+NW4vTm; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Y+NW4vTm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=d4ibuSiHrZ6k/CJNp5+ZAjb37FyIgI6QqdSVZOqE2tI=; b=Y+NW4vTml5JrEEBlMTCpfBlZTo
	THbW+NSkqFR5QZ8BuWXHm5TEvrQm477E7Cqc+qRz1aoS2QWQdZWGX5l26LBmw8KrZJ1vs4WGoJcNy
	1jXZ6QoKkNWcvx5zJw+gJxMFJjX5uuOIjGtELtGcwrWUhmEo8K8hESd74u0y8Rgmvewq5lFu+T01b
	iWLn4/0ytnKgzTOAaeyrMY8GQoNnAxbjQbGpWygfeIYjY6rNPMQzRUwFqCW4omRaRjLlqlqEcdF2P
	qOpTYMj5paR9tfpGpGi0Pxil1f5eITTBYr9Q/J4yYwsIMxjqxJ2zs4qlZncSdmoXtgwrqXbEp1nvA
	IfmHuuJA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzTsS-0000000CEZj-2ucg;
	Thu, 27 Aug 2026 06:46:20 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 87CE930057C; Thu, 27 Aug 2026 08:46:19 +0200 (CEST)
Date: Thu, 27 Aug 2026 08:46:19 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Waiman Long <longman@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/8] lockdep: change 5 graph-db arrays to AofAs, fill
 from memblock pool
Message-ID: <20260827064619.GB4121339@noisy.programming.kicks-ass.net>
References: <20260826-lockdep-memblock-v1-v1-0-e2db855391ec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826-lockdep-memblock-v1-v1-0-e2db855391ec@gmail.com>

On Wed, Aug 26, 2026 at 09:58:32PM -0600, Jim Cromie wrote:
> Lockdep cannot rely upon any other subsystem that uses locks, so since
> inception, its graph-db has been stored in static arrays, pinning ~10
> MB in .bss. This is a hardcoded compromise between embedded and
> enterprise hardware.
> 
> However, if it acts early, lockdep can pre-allocate a pool of slabs
> from memblock_alloc(), enough for its lifetime of anticipated workloads.
> Then it can allocate them as needed to provide new segments/slabs to
> the graph-db.
> 

Why? I really don't understand why. Who cares about this bss stuff.
