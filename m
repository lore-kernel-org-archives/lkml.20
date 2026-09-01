Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3682594BD
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 00:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788222742; cv=none; b=CnZvFauD3nhYYiI9w+blcF4SWUWOusMsaqD6gCX5OjKqRilUmABYRRT7aREbSVMnxSVCXW9QglvJ5ocqSmOnqQcR+40VJkfjW4mbJeiLR4729v1lhD22ze+nMZ6M9zW3OByxhguzZJsc3U8lBoAnyN53ErDCE7ioCiCr0F+5mK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788222742; c=relaxed/simple;
	bh=ESAnQtsLO7GvqAwfxJMZrL9MW+o9ekICsY0q1IL7cxY=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=EMbD3Gdan2LApMIGC4rNVQZkjjSIp7kOA6ulpXybP6QC7uSzj3HRXbBbyR/wx8s5U2eAbH6e2jtPAo4gXTqnvAW1HzfqbuzFNjo2J81XcDve8J2yUQ5gBHrS2tMv7SkuIO0AXVL06SxMk1bIwkTd5AVMN2iwCE6S5RN1Z3WG08Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=2qXrlVs2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="2qXrlVs2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A224F1F000E9;
	Tue,  1 Sep 2026 00:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1788222740;
	bh=ej1c6AoFPjQMIw+5zOfshNKpOua/gygGA7jm7nCkot8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=2qXrlVs2fhXNgTqd2sR9uZkQ5O2Yslv+EERU+0QsDYkAkoy7UNb0+3ytgseHd6ILX
	 44/UC9k6O+U3nqBRr6VZhckZ8RHhPe4TCj42a/qgTFp/FKx5JrkNRA2SzydOoXaiI5
	 /ItHu84ouETd4nzWh/GoQHdYJEgkAMXUqrMIo/es=
Date: Mon, 31 Aug 2026 17:32:20 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Li Zhe" <lizhe.67@bytedance.com>
Cc: <muchun.song@linux.dev>, <osalvador@suse.de>, <david@kernel.org>,
 <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
 <aiqi.i7@bytedance.com>
Subject: Re: [PATCH] mm/hugetlb: fix overbroad MMU notifiers for unshared
 PMDs
Message-Id: <20260831173220.72ab28190a44a305dacf4d04@linux-foundation.org>
In-Reply-To: <20260831091023.66581-1-lizhe.67@bytedance.com>
References: <20260831091023.66581-1-lizhe.67@bytedance.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 31 Aug 2026 17:10:23 +0800 "Li Zhe" <lizhe.67@bytedance.com> wrote:

> Hugetlb currently expands MMU notifier ranges to PUD boundaries whenever
> PMD sharing is possible. That is only needed when huge_pmd_unshare()
> actually detaches a shared PMD page table, because clearing the PUD
> invalidates the whole PUD-sized virtual address range.
> 
> For hugetlbfs hole punch and MADV_DONTNEED, a shared mapping can pass
> the "PMD sharing is possible" range test in function
> adjust_range_if_pmd_sharing_possible() even when the PMD table covering
> the target 2M page is not shared. KVM then receives a 1G invalidation for
> a 2M operation and zaps unrelated secondary mappings, so the guest has to
> fault them back in.
> 
> Fix this by using the existing cheap "sharing possible" test only as a
> gate, then inspect the candidate PMD tables under the locks held by the
> hugetlb unmap paths. The notifier is expanded only for PUDs whose PMD
> table is actually shared, while the other callers keep the existing
> conservative expansion.

Thanks.

> On a Redis-in-VM workload that punches cold 2M hugetlb pages, this
> patch improves P99 QPS stability while punching pages, reducing the QPS
> degradation ratio from 7.09% to 1.45%.

So a modest performance improvement?

This led Sashiko to perhaps discover what it considers a "critical"
pre-existing bug.

	https://sashiko.dev/#/patchset/20260831091023.66581-1-lizhe.67@bytedance.com

