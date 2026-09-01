Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4678436B91E
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 01:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788225003; cv=none; b=GnQ+RNaY/RAlG8I6CQCdIm/i7jdEoHSdXYL1GbowAAfrhcdjzGfSchiOZeLXAcrFyJ62uIIQlLMqmJ7v7hpr4x4AZ5b9/jhqt2b8WpZXUdM1/ZCcnvrzIpOXEZQ6E51Sy8ep1GT6QThkdMBuOIK1IKKUEVXhbnnVyZCiFFK8MtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788225003; c=relaxed/simple;
	bh=NCDEEuD/8FZ+vKZsi2cUKW+UkePK0cB9gz1+URmemhY=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Oc1ne8rrNBQNK63AfqO2awOlYh+JDjUY3zaEdAo4wx0z7kbNAxMWCSRX09HiMM772h+f+/If/fcvX7c6OOWIw0fkoqetA+4atWXHbdd+Qo1LAEBJ6BQrJlSZVZT49tc4J9k5KLZ6IgWfEXqtY5tGvTtPyKjO1ZOMWx6BeK7BVcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ZjTiFKQd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ZjTiFKQd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7663D1F00A3D;
	Tue,  1 Sep 2026 01:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1788225001;
	bh=y1oZm4WwnJE9a1bcKC6zS9Kgispny6D5jmDZJ5LFvVA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=ZjTiFKQdhaHeMVQoULPC2+n+Dvmm5yJu4/GHjF0ED/K1JLF8CAZMyilycoof7LN2U
	 eCr8ig6VMzyDOTfNzSPXbgAP35xuSn1CWFazWZem3JOoonIU3N7IkSYuxJhvsyqGZK
	 SIwot2H3myVPu2spB2z1x+GV0MmS9sr0V+GGCAfc=
Date: Mon, 31 Aug 2026 18:10:01 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Longlong Xia <xialonglong2025@163.com>
Cc: muchun.song@linux.dev, osalvador@suse.de, david@kernel.org,
 mike.kravetz@oracle.com, yuzhao@google.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Longlong Xia <xialonglong@kylinos.cn>
Subject: Re: [PATCH v2 0/2] mm/hugetlb: fix surplus accounting and
 availability checks during demotion
Message-Id: <20260831181001.ad2df1afb44789cfeb79fd81@linux-foundation.org>
In-Reply-To: <20260831133519.2505020-1-xialonglong2025@163.com>
References: <20260831133519.2505020-1-xialonglong2025@163.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 31 Aug 2026 21:35:17 +0800 Longlong Xia <xialonglong2025@163.com> wrote:

> From: Longlong Xia <xialonglong@kylinos.cn>
> 
> This is v2 of the two-patch series fixing surplus accounting and
> availability checks in the hugetlb demote path.
> 
> Patch 1 fixes source hstate accounting when the free folio selected for
> demotion accounts for a surplus page. Patch 2 prevents demotion from
> removing free huge pages that back reservations.
> 
> Both fixes were tested with x86_64 QEMU guests. The commands below use:
> 
>   hstate=/sys/kernel/mm/hugepages/hugepages-1048576kB
> 
> Patch 1: surplus accounting
> 
> A vmemmap restoration failure is difficult to trigger deterministically.
> For this test only, add a one-shot fault injection that makes the first
> attempt to restore the vmemmap of an optimized 1 GiB folio fail:

OK, so hard to hit from userspace but not impossible.

> Patch 2: cap demotion
> 
> This reproducer requires no kernel instrumentation.
> 
> ...
> 
>    Before this fix, the access fails with SIGBUS and leaves:
> 
>      nr=0 surplus=0 free=0 resv=0
> 
>    After this fix, the access succeeds and leaves:
> 
>      nr=1 surplus=0 free=1 resv=0

OK, that's bad behavior.

I asked my friendly neighborhood LLM and was told

: I'd phrase it like this, keeping the stable justification concrete
: without overstating the exact failure mode:
: 
: On architectures where gigantic HugeTLB pages cannot be allocated or
: freed at runtime, memory hot-remove or hwpoison can attempt to dissolve
: a boot-allocated gigantic page.  The lower-level removal helpers
: silently reject such pages, but dissolve_free_hugetlb_folio() continues
: and can free the folio while it is still on the HugeTLB free list.  If
: vmemmap restoration fails, the rollback can additionally add the
: already-listed folio to the free list again.
: 
: This corrupts the HugeTLB free-page state.  The corruption can persist
: beyond the operation which triggered it and be encountered by a later
: HugeTLB allocation, potentially resulting in kernel warnings, crashes
: or memory corruption.  Avoid the corruption by rejecting gigantic pages
: without runtime support before modifying the HugeTLB pool.

So, with a statement like that, I'm thinking that we should backport
these fixes (or something else that fixes these issues!)

Anyway, these are matters for maintainers to consider, please.  For now
I'll get these patches under test.
