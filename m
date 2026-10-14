Received: from mta0.migadu.com (out-51.mta0.migadu.com [91.218.175.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806153DB651
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791993969; cv=none; b=SErWCnw/1oWdZKGgSJlT8O3rOO5uWBazrxDIe+snxJGUVM7p9q74FHu6LCIlc0jl6ij1a0oVBfLPjJB7QaZ2UDz5yD4sLS8p4O7CLATik0/3b6y8Td/6uoKxAmfTvCjGKwWGS60dVU3ndqbrY83cjypv1Ctbk41YGPcrZE9invY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791993969; c=relaxed/simple;
	bh=Ke8/Rh7e75umDrgNFQd+uBhuuNnz5z+dEUkUPgAImPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=djWjRjDdAvc628WuKuHC0PZ0+jyO8L9n1vFcBfcJkd4SFFur7eKq2gWemTdeWov48haCfqK9JAZI0qZyGLgE2pZPE5FfwcxINmRZuR20yIIDsIe8i6URZ8wS1VWdjBXAFGc42iOSZVyVZt0D0tEVoc9YlPvQLV7A8NM7K1wEDsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=FwaBZg2e; arc=none smtp.client-ip=91.218.175.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="FwaBZg2e"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Ke8/Rh7e75umDrgNFQd+uBhuuNnz5z+dEUkUPgAImPk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791993963; v=1; x=1792598763;
 b=FwaBZg2eq3VhmsBTg9fp+TgUc+hVxRwtrbL08KUSyDZQz+t272ehLbGesowe40gOETm1o+Lp
 0KjUZ3KdC1ZZGEksiLNdmsd51PUT0KA/FHqHhC76L5Lwukg1swCXHX8ihGcLHhFyQbm7Gs9/5bq
 uCCFfF27YeICVpirSAdsS8Xw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id cba1a5ea51b66b58;
	Wed, 14 Oct 2026 16:06:03 +0000
X-Mizu-Trace-ID: cba1a5ea51b66b58
X-Migadu-Flow: FLOW_OUT
Date: Wed, 14 Oct 2026 09:06:00 -0700
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Michal Hocko <mhocko@suse.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Tejun Heo <tj@kernel.org>, 
	Meta kernel team <kernel-team@meta.com>, cgroups@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH for-7.5 4/5] memcg: avoid queuing high_work from reclaim
Message-ID: <as97Nzob4XuzO9Ss@linux.dev>
References: <20261010210957.1350874-1-shakeel.butt@linux.dev>
 <20261010210957.1350874-5-shakeel.butt@linux.dev>
 <as9p2uFqCQprwdnI@tiehlicka>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <as9p2uFqCQprwdnI@tiehlicka>

On Wed, Oct 14, 2026 at 01:39:06PM +0200, Michal Hocko wrote:
> On Sat 10-10-26 14:09:56, Shakeel Butt wrote:
> > Kernel threads and remote chargers use high_work when memory.high is
> > exceeded. Their allocations during reclaim can also charge memory,
> > for example when zswap stores a page.
> > 
> > Without a check, the high_work worker can queue itself from its own
> > reclaim. The pending bit is cleared before high_work runs, so each run
> > can queue another run.
> 
> What does that mean really? Does this delays the actual run?

It will not delay the actual charge request. This mainly means that we keep
enqueing the high reclaim work even from high reclaim context and can
potentially keep wasting CPU if high reclaim is not very successful.

>  
> > Skip memory.high enforcement for charges from task context with
> > PF_MEMALLOC set when they would use high_work. This covers kernel
> > threads and remote charges. The memory is still charged. Interrupt
> > charges keep their current path.
> > 
> > In a VM with incompressible zswap data, the worker queued itself 163 times
> > without this check.
> > 
> > Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
> 
> The patch itself looks OK. I am wondering whether we can unify the check
> with the existing one which forces the allocation through in main
> charging path.

The force charge (and ENOMEM) paths bypass the memory.high enforcement
altogether. Only successful charges (done_restock label) goes through
memory.high enforcement. So, even if we move this check in try_charge_memcg, it
will still be a separate check before calling high enforcement function. I think
this check is very high_work specific and better to be in the high enforcement
function.


