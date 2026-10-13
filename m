Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DC0522F0F
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 21:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791927522; cv=none; b=o5fcetmlbTpz1YkyM5QG75I8/ohK90+YukrjtXEhisjmLjrWPRXKNxWD2zsWSOmdDGfdbNS12bqqTmBDZNkANZ0L86pUAdP6l8vR2eUbT1cozK/ocj4XY+G+mEiXQ3FICWnNkEPcnuy5KXKBFIOLPxWa62X5p+oazw7t5q8cxpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791927522; c=relaxed/simple;
	bh=oKL+6A3U++B+yT64yvt21vFPTJ2gMsAguf76KFkERYU=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=s72wKpEAWUfeU0g8mVprXLl6Ky5VAKJe5gW7Kkk0HEk0IUAyMNgEv61r399HTiM8U+U8YF6rX5ReA/zI41n0VWtWGpY5fbXqhpeFly9V32WFHIjVAc2wVm3cBh9CdpjZKev8kGxxYDZ4Icd/TVAP1c1ZxotL+HWw3clQwgvra4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=f6D1x867; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="f6D1x867"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B0E41F000FF;
	Tue, 13 Oct 2026 21:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1791927520;
	bh=/XoMYPDJ3CILTtAwqkClhAHy0hWo2jdLCjloKhts5w4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=f6D1x867qgT3m1y0qF8auL0MjUypPMyLq+fTqRiwRqS5CaqKXmjUxitdwDMx/sUjc
	 YXDFW2Rxffk0b62u0SEGMfAEb6+qdH5Sp45t6hVaW7bok/b70qHYTm4SPMEEnJIT7i
	 DGv8oeWwd8bVHId+bgAtk+tgTCOLMcaL0QA+gPcI=
Date: Tue, 13 Oct 2026 14:38:39 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Kiryl Shutsemau <kirill@shutemov.name>, Lorenzo Stoakes
 <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, kernel-team@meta.com, "Liam R. Howlett"
 <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>, Ryan Roberts
 <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song
 <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif
 <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn
 <jannh@google.com>
Subject: Re: [PATCH v4 10/13] mm/collapse: open-code collapse_single_pmd()
 in its two callers
Message-Id: <20261013143839.832f1a4db51f801a2b95f850@linux-foundation.org>
In-Reply-To: <dfbb4bac-0def-4e1b-87a7-91c9cd91349e@kernel.org>
References: <20260928100630.21870-1-kirill@shutemov.name>
	<20260928100630.21870-11-kirill@shutemov.name>
	<b2133cff-ce69-4a45-bf33-c44b774dee7b@kernel.org>
	<ar-nKHZ5hlbsXeFP@thinkstation>
	<dfbb4bac-0def-4e1b-87a7-91c9cd91349e@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 13 Oct 2026 22:25:21 +0200 "David Hildenbrand (Arm)" <david@kernel.org> wrote:

> >> Based on that, I'd rather want to see collapse_single_pmd() to just inline the file
> >> and anon paths, and see how we can further optimize the locking internally (e.g., perform
> >> the pagecache scanning without the mmap lock).
> > 
> > I see the appeal of the single entry point for the collapse engine. I do.
> > 
> > But it costs us on both the locking picture and the scan rate. That
> > does not work for me.
> 
> So this is in mm-unstable and I want at least the first 9 patches to go to
> mm-stable rather sooner than later.
> 
> As raised in person, I don't like the open-coding here; it just results in weird
> API. I wonder whether we can come up with a better interface, while keeping the
> locking as per your requirement cheap (scan performance).
> 
> While we figure that out, does it make sense to send out revised patch 1..9 to
> move them to mm-stable while we figure out the remainder of the new API?

I've suggested to Kyril that we park this series until the next -rc
cycle.

But I can bring it back - we have a couple of weeks, three if we get a
3-week merge window.
