Received: from mta1.migadu.com (out-91.mta1.migadu.com [95.215.58.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731E0481FD1
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791962924; cv=none; b=YIZAJuxpqu3wmCOivWQ5cPQcaYOgpc1ubQsbHSk13CXoofqmPS0DOrS0eqEPay1FqgZCK2RbxOuR1HWr5tP0ORD9uxbSU0wLuZjoc3llJNXQMnZR+fgSwcmg4jvHjVStDMOuzaBJRW8CyE2yH0XUki8zNl0NlBlJESn7p8X1s4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791962924; c=relaxed/simple;
	bh=HzoLGn/NBj6P08TgEbWS0zGGjXPm8raRSAmF5JjEaBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sHrR214EQlYs6mxKY0t0aFrgTGsxCphs4S/1oDz76ZuqSjwRqlKbaMBGzMdA0Zj3jvomIfDhlyKH5f5W9VbeSz/hpkaPVc7/y/7plGMrjAzNGsUQXhESqvmWTco/zZkw+9mVGFw9ACFQiQdfJucniOPORXF13Wqw6SWYhbEOzeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Ad/jrMpR; arc=none smtp.client-ip=95.215.58.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Ad/jrMpR"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=HzoLGn/NBj6P08TgEbWS0zGGjXPm8raRSAmF5JjEaBo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791962919; v=1; x=1792567719;
 b=Ad/jrMpRjKf2WeQ2dpoXSBFj/Zau33YvpnZT987xq4x3KVLkAi/FJJBoJcyG9jSaa8jrVQ/r
 gbNp7xkDmNXuu9JP43flf3rDmxOVco66OchFyYVD/uooW2ugBTrbbBbuFV1nITJKzK0eiXbXArF
 Z1egrm/XsLWJ9g/WTkVOskM0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 853cf23eb73e70bf;
	Wed, 14 Oct 2026 07:28:38 +0000
X-Mizu-Trace-ID: 853cf23eb73e70bf
X-Migadu-Flow: FLOW_OUT
Date: Wed, 14 Oct 2026 15:28:35 +0800
From: Baoquan He <baoquan.he@linux.dev>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Klara Modin <klarasmodin@gmail.com>, Baoquan He <hebaoquan@kylinos.cn>,
	linux-mm@kvack.org, akpm@linux-foundation.org, chrisl@kernel.org,
	kasong@tencent.com, hannes@cmpxchg.org, nphamcs@gmail.com,
	baohua@kernel.org, youngjun.park@lge.com, yosry@kernel.org,
	shikemeng@huaweicloud.com, chengming.zhou@linux.dev,
	linux-kernel@vger.kernel.org, kunwu.chan@gmail.com
Subject: Re: [PATCH v4 00/14] mm, swap: extendable swap devices (xswap phase
 I)
Message-ID: <as8vI5DzXAZgelws@MiWiFi-R3L-srv>
References: <20261003003136.750633-1-hebaoquan@kylinos.cn>
 <asZt7-8mcxqc1a02@soda.int.kasm.eu>
 <asylV5YyyaHs8rP3@fedora>
 <565e1744-54ff-4daf-ac14-7b6c49fd3fa2@kernel.org>
 <as33VMjNRIZOG5Ua@MiWiFi-R3L-srv>
 <d6209813-d53e-428c-90a9-6404618d0804@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d6209813-d53e-428c-90a9-6404618d0804@kernel.org>

On 10/13/26 at 05:08pm, David Hildenbrand (Arm) wrote:
> On 10/13/26 11:18, Baoquan He wrote:
> > On 10/12/26 at 03:44pm, David Hildenbrand (Arm) wrote:
> >> On 10/12/26 11:16, Baoquan He wrote:
> >>> Hi Klara,
> >>>
> >>> ...snip...
> >>>
> >>> Thanks a lot for careful reviewing, and sorry for late reply.
> >>>
> >>> ...snip...
> >>>
> >>> Thanks for the comment.
> >>>
> >>> Here xswap.max= is a global boot parameter, while not a per-device or
> >>> runtie knob. It sets the space space (si->max) of the xswap device
> >>> at boot and can't change at runtime. So on the two places: the size is
> >>> a global setting, fixed at boot; the priority is per device, it is in
> >>> the create interface. They are different things.
> >>>
> >>> The default is 2xRAM. From our earlier discussion, this is the largest
> >>> size we think is sensible, and in practice I don't think it is not
> >>> reachable in reality. If a system has swapped out 70% of its memory, and
> >>> even more at 100%, it is already doubtful that it can still function
> >>> normally. So 2xRAM is an upper bound, not a target.
> >>
> >> I remember some overcommitted hypervisor setups where people swapped out
> >> significantly more -- without any issues.
> >>
> >> For example, Windows VMs initialize all VM memory when booting up. Afterwards,
> >> you might just have plenty of memory that was touched once but will not really
> >> be used in any near future.
> >>
> >> So I would consider some crazy hypervisor scenarios as well where people
> >> commonly have significant cold memory that is currently not hot (not in the
> >> working set) but might possibly used in some distant future.
> > 
> > Hi David,
> > 
> > Thanks a lot for the valuable input. This is probably the first first-hand
> > information I have heard about a production environment. And Klara
> > measured about 160% of RAM in zswap on her RISC-V box, so the 2xRAM default
> > is reachable in practice, not just in theory.
> > 
> > So I see 2xRAM as a default, not as a cap. xswap.max= already overrides it.
> > After your comment and Klara's numbers, I am open to a larger default, or to
> > a "max" value for the address space. The real limit is still the backing:
> > the zswap pool plus the block devices. The address space should no longer
> > be the limiting factor.
> > 
> > By the way, in Windows-VM case you mentioned, is there a block swap backend,
> > or is it zswap alone? If it is zswap alone, the knob that matters is
> > zswap.max_pool_percent, because it sets how much cold memory the pool can
> > hold.
> 
> Excellent question: I don't remember all the details. There were talks about
> over-committing up to 400%, and people played with both zswap and zram to
> avoid/reduce IO.
> 
> I assume as a safety net people would always look for an additional swap backend
> (that's what I remember, but I don't recall all the details).

I see, thanks. I will take this as a real use case and think how to
handle it.
