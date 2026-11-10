Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794337799;
	b=tbXDEVga1j8SxJeU2MKFhPxQuDhZitc5tMqOoqYJNc6dIZNxHHFOq26WnDrpnAlZ8qjd
	 kqmbsR9taewhZSrz2bY8FLuSWkILCmrLHYOg2HopmtzAdq45au3krcF1Hefej4NN5F/0K
	 qW7TOVRGodWwXXjJSIkH6NmdDvk7BgnAcLnLjLJCG0pr9irF+Cw1xciguDMVeDsFNqbzG
	 wbPMGIQwq6HvlH2l5H9yhVK+fDf4+tQdou8W/XJD/6MyQSF+Nx71JIC+lHHg9IFDl9357
	 hYMxww+hJ8wh0aa89Ghv7PtgVXWzkv1NLXHkwUgQu6SyCU2Yy5nYtgYpw7tQsLmE2QA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794337799;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ooMQgbr/cid9Np9AOt8EZOiHcozOHCgOuAlmJBwsLqU=;
	b=IxiEiMgFJaHxQU3IvFZlJtO4w2tk/OPmsbSKLk7OtZ4YzCSLtVOwWwBQAk344H8jVMGd
	 N2ytEIC+nXPl3AqP6qQ1dcBNKHjzw4TEkgwO9KuonfThXhhLVCxbCCo0IgNvq40+dkYjP
	 C9cGn9RFRxYzMRO2fg97HlRiA9qxfHWoux4G5LcAlUILWD3KInEWxe6cSMsqZroRWKGGq
	 jazhhG8wyswQ3VcxJ6pPEpXSSrpkKET8+bZLrVhXtHsUuJWBk62vpZhrfcGdhZY418/P1
	 iDfrmkeC1RjdcBAanAie8dHJntA9WG+urhzcy/FBr2YizJHnQFXK8ym9Wt4BTEjBytg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="I/0Wr5Mk";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EFF5606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 19:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I/0Wr5Mk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE9081F0089F;
	Tue, 10 Nov 2026 19:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794337799;
	bh=ooMQgbr/cid9Np9AOt8EZOiHcozOHCgOuAlmJBwsLqU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=I/0Wr5MksLL9W7rJemxkrGsIAq81CuFPulq6SqedrfIz9l47Cc9XOwBlQIhg3Kb0A
	 PanfpKM+qUA0tY7wda92a3K9gBLMN8frc2Yj9KwAXZ3mV007x22UXPytU6cvAjgB2s
	 QdzrVXWzl1a7Y/FxKS7k2oWad1x7yS4uT0q7k7lj5H/m2ThxoSsaPfh3qctJEmz1MB
	 NozXDZLc5qMGXbsBvOl9RY9yPheiTt7uZY7GKBODVvXnnC5AdLQtmcSdIxNqUFLtLa
	 RAC+nhZrayuc/h+zHwYZnbYSirnKDmTFonJ7CU7fkjMqiylGxDvquL5MTSdje9Bkn3
	 7tDT+hVGL8BYg==
Date: Tue, 10 Nov 2026 19:09:53 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] mm/khugepaged: release contended mmap read lock
 after scanning enough VMAs
Message-ID: <avNrPKIoZ3JHiAjh@gremlin>
References: <20261110-khugepaged-latency-fix-v3-0-6eea743cf9a3@kernel.org>
 <20261110-khugepaged-latency-fix-v3-3-6eea743cf9a3@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110-khugepaged-latency-fix-v3-3-6eea743cf9a3@kernel.org>

On Tue, Nov 10, 2026 at 05:19:13PM +0000, Lorenzo Stoakes (ARM) wrote:
> khugepaged walks an mm's VMAs under the mmap read lock in
> collapse_scan_mm_slot(), checking for ineligible VMAs first, and skipping
> them if encountered.
>
> It charges cc->progress 1 page against the /sys/.../pages_to_scan budget
> when these are encountered, however only checking this budget once an
> eligible PMD-spanning VMA is encountered.
>
> It can therefore hold the mmap read lock for a long time if there are a
> large number of ineligible VMAs present in an mm, over which time no mmap
> write locks (and thus no VMA write locks) can be acquired.
>
> Address this by checking whether the mmap lock is contended after 1-10
> ms (depending on CONFIG_HZ), i.e. the granularity of jiffies. This is a
> long time for a lock to be held, so is a reasonable compromise for
> determining when best to do this.

Oops I left this in from the previous approach :)

Replace with:

	Address this by checking whether the mmap lock is contended after 1024
	VMAs scanned. This was measured to take around ~100 us on a fast
	machine, and given VMA eligibility checking is a light operation, it is
	likely this will remain at the same order of magnitude for slower
	machines.

	This therefore establishes a reasonable upper bound on how long a
	contended mmap lock is held.

Thanks! :)

--
Cheers, Lorenzo
