Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78EAC42376B
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 23:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788045532; cv=none; b=S5WR+ZOpJKWIZ0K0Frp3JyMpboT9tBNLhQ4iBSbtOvOj+9pub1KPyFIwDJcmFWg7fbzPhBzoG9PlZF+ArUQ7oTiGCalpgZdSu53Wwo/BPoah3+wPX4TmcCm/V2Re1ZJBOqcSRLwmFBp7xHKstOckXQ/DmDcFDck0xMM3aLKSQ28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788045532; c=relaxed/simple;
	bh=gqxXw/n0E/WChgI8eGSYUFW55EGPYFtI9sWWHCL0SJo=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=uGPUTXU0HO5n4jXPSWYShbJ7a3nWE6U5UEE0uc+j0jrtmMchzS4re6kOYaYlcCG+ZXRhuR2L45Xjj9JU9SE7cG+wF8NCcH9gXjs/STsedMo3Gv0XgXYAxamCJ4zd25ZZz4GBZN3o9wAnID9591RXCANi1sjmnQXTV3Uj1iDW/FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=JAgz+RxN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="JAgz+RxN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F0521F000E9;
	Sat, 29 Aug 2026 23:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1788045531;
	bh=SeUcL4nq46vAOTRNrJyFE6ffe6TtzURWgRlqZ+Mahn0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=JAgz+RxNvvwe4PCQRC4qC5IYds3alR+iPeLhCZqByUhsSi5jP+5ZkUOam5IVVf3HV
	 LP+8pndUSXapSJLVFClg24h6NWgeXkL+BsvgXvT3Gv6Js2U/yo3ob4U7OoYqlidLZ6
	 IfdgX8xbCZVYP6k9iF5QVCbsz2LFjFdHHPr30nIM=
Date: Sat, 29 Aug 2026 16:18:50 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Gregory Price <gourry@gourry.net>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com,
 david@kernel.org, ziy@nvidia.com, matthew.brost@intel.com,
 joshua.hahnjy@gmail.com, rakie.kim@sk.com, byungchul@sk.com,
 ying.huang@linux.alibaba.com, apopple@nvidia.com, urezki@gmail.com,
 chenwandun@huawei.com
Subject: Re: [PATCH 0/2] mm/mempolicy: stop copying state in the interleave
 paths
Message-Id: <20260829161850.db162f9f99deb419f4700c11@linux-foundation.org>
In-Reply-To: <20260829015943.1258774-1-gourry@gourry.net>
References: <20260829015943.1258774-1-gourry@gourry.net>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 28 Aug 2026 21:59:41 -0400 Gregory Price <gourry@gourry.net> wrote:

> The interleave node selectors and bulk allocators take copies of
> nodemasks and node weights (for weighted interleave) in the fault path.
> Both of these copies can be entirely eliminated.
> 
> For node weights, use SRCU to pin the weights in place.  This eliminates
> a copy and a kmalloc from the bulk allocator path.
> 
> For nodemasks, we can operate directly on pol->nodes as long as we bounds
> check the walk.  A concurrent rebind can shrink the mask, or tear the read
> of it so the mask appears empty.
> 
>  - The interleave node selectors fall back to numa_node_id() when that
>    happens, which is what they already did when a copy came back empty.
> 
>  - The bulk allocator simply returns what it managed to allocate.
> 
> The node count and weight totals are read separately from the nodemask
> walk that consumes them - creating a time-of-check / time-of-use race.
> Just clamp the walk to a single pass (number of nodes), and clamp each
> bulk allocation chunk to the space left in the request.
> 
> The cost is distribution accuracy during a rebind.  The copies never
> corrected for that either - they only kept the code from dividing by
> zero and overrunning the allocation request.

Not very well, it seems.  Sashiko thinks there's a div-by-zero in
alloc_pages_bulk_interleave().

	https://sashiko.dev/#/patchset/20260829015943.1258774-1-gourry@gourry.net

> Gregory Price (2):
>   mm/mempolicy: use SRCU for the weighted interleave state
>   mm/mempolicy: stop copying the nodemask in the interleave paths

Looks nice, thanks - I'll queue it for testing.

