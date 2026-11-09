Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794245045;
	b=c/NsvdRe2Fu/her/ja/aHUOy+5rlTRh+iXkupW1ilGlY967eMpuyVVOHMnrgQVWPJ+KW
	 +QS6ypt68bEHuoYoE+A5/y3/8xfCu0uUPDnXcllez0rp4UblxEC7AwXEjPJE1iwaQcub5
	 /bTOBp+cv+gAmSzf13xPcW4YzebnRLiMbzp8mBSCxxwwsKizTbnK6devU70zVOBV2GV6s
	 5l0NVQtgTQXAEV+jvfwKchoLZzh1tWEXHQ2zLfvZXj2AUl3YeTWIWSnR6Ok2LY03fd05X
	 EJgW6DSgtWebx9LyUjuB1RVXqsuzAMqQSjU0pVzIVBsnpvsklTUIe/8+t8Oyqkctcmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794245045;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=eun4fonrA8YxuiXzX4G4XMpkIlQF/XMM49UglMMMiXw=;
	b=JAdwPFRMQCqwAel5toa4eszZBBjUrxTLXxfvC2ruIgsO9WSzg5d0dfOzFG68+Sv7+GXM
	 ousMwtg4RwSaNr5rwxjtsZfqcdAyvKP6U1NDxne4r2ygLKB/Aqg+eTian1LIYyFTlXcbN
	 Rz2tJRlVPuXVGlWXRsx35LU7RA3KeGY3sLy4W6/2Bs466Wsl450VN/1Z/54D/eX0KpizG
	 xEZPGmCt7iLEf9Pn/ZS2EUj/mbSdJRa/AfBOYQ4/gyKCVtfq2FAG3N+U5lCae3TluKgeG
	 CkGj9Hkci5IlTA8Flooqt68WY+ICpWKPBDnQujtIc0IkiQD8Uq/C9DWAq0xcix5LuZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=U7k7USFh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F40606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 17:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=U7k7USFh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 924481F008A1;
	Mon,  9 Nov 2026 17:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1794245045;
	bh=eun4fonrA8YxuiXzX4G4XMpkIlQF/XMM49UglMMMiXw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=U7k7USFh8CiH8yapE7FTZPIc3n7a1VfVrrw/hRpz7ZfmAvrqap3KqDfRs+5dgXjUg
	 7b5GVFc0envv1FiTeaCTmMTZ66R7rrrr0X/aHT3OQaPAdaAd9AdSGv+gj/dkjcPbkm
	 IviqjTERNDo2xLRDzAyJciW777BbRh6rtjEPsZg0=
Date: Mon, 9 Nov 2026 09:24:04 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Leo Yan <leo.yan@arm.com>
Cc: Wen Jiang <jiangwenxiaomi@gmail.com>, catalin.marinas@arm.com,
 will@kernel.org, urezki@gmail.com, linux-mm@kvack.org, baohua@kernel.org,
 dev.jain@arm.com, ryan.roberts@arm.com, anshuman.khandual@arm.com,
 david@kernel.org, rppt@kernel.org, xueyuan.chen21@gmail.com,
 chleroy@kernel.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
 npiggin@gmail.com, ajd@linux.ibm.com, jiangwen6@xiaomi.com,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 00/10] mm/vmalloc: Speed up ioremap, vmalloc and
 vmap with contiguous memory
Message-Id: <20261109092404.5441d8bf9c4494ed008162fa@linux-foundation.org>
In-Reply-To: <20261109140206.GY9176@e132581.arm.com>
References: <20261107134953.748622-1-jiangwenxiaomi@gmail.com>
	<20261108230842.3a77b9fe2d4bfc2a04b355a5@linux-foundation.org>
	<CAHKocdGWE9OVA5pJh33U-FYnNkUqRS0pzFt=rCwXWzY9w-QXyw@mail.gmail.com>
	<20261109140206.GY9176@e132581.arm.com>
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

On Mon, 9 Nov 2026 14:02:06 +0000 Leo Yan <leo.yan@arm.com> wrote:

> On Mon, Nov 09, 2026 at 07:07:23PM +0800, Wen Jiang wrote:
> 
> [...]
> 
> > > Do we have sufficient ARM review?
> > >
> > 
> > Thanks for picking this up.
> > 
> > On ARM review: Dev reviewed the earlier revision in detail and
> > his suggestions are folded in. Leo Yan tested the large vmap() path
> > on TRBE/SPE. We'd welcome more ARM review from Ryan, Catalin
> > and others.
> 
> I confirmed that my Tested-by tag remains valid on the latest version.
> The improvement is consistent with L2D TLB refill reduced from
> ~16000+ to ~500+ across multiple runs.

Thanks.  I added your t-b to every patch in the mm.git copy of this
series.


AI review found a couple of little things:

: In [07/10], vmap_pages_range_noflush_walk() uses an int nr
: index, now shared by the high-order mapping path. The previous
: high-order path used unsigned int i, nr. Beyond INT_MAX base
: pages the new index overflows and pages[*nr] can go out of
: bounds. On x86-64/4K that means an allocation above 8 TiB,
: within the vmalloc VA window but requiring a very large machine.
: Please carry unsigned long or size_t through the direct walker.

The vmap(8TB) limit is already well known, not sure that we plan to do
anything about it(?).  But the patchset seems to drop that limit to 4TB
for higher-order pages, which can't be a good thing.

: In [09/10], nr_contig < 2 can be dropped: the loop guarantees
: at least one page, and vm_shift(..., PAGE_SIZE) returns zero
: for a single page. I withdraw my earlier NULL-page objection;
: I could not establish a legitimate producer of that input.


