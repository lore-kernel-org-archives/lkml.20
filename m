Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98833E51EF
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 21:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789768208; cv=none; b=mhjfttBqjf1io7DqYIQYoLd2ZIR0bGP2ket/PMs0bc76HtpHjPtxuiDOsQEJrTPYDnq1kjh8Cm+iwAMY/lsDG/N/9JfnA8bHNEZEt5kmCnnDbplCk3mZk2vzD83d6glDEVtvrt9PUxBI9u+wWbOu5gFRyKfmHs247iT8XNkefaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789768208; c=relaxed/simple;
	bh=vW1/R4TpOV+JSCYjG37OIst7xxSHdvoVHEK8OLJZvv8=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=SIrKBmJhfP5/aR9YzLDshtDXe0ujvqVBXFVIbUkyYQHjyfOivFmnGQfoOSwZdBQMI/bzt8t1eeeDbLKVEs0ru6kk8RVsphPMHwPTptaAMOlftkEm0wC50+6o1WA3xavY6blSTu+DNkEHbYZvj9QHDKg09fp28ZanKiS4NMoQBhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=i91R2tZq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="i91R2tZq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D3DB1F000FF;
	Fri, 18 Sep 2026 21:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1789768206;
	bh=Y7ccuuw5WPtG4HrizN7+nr+XZ3f4qN8Ifd/iDDA2sCA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=i91R2tZq1oqgXyNTYm47di7DloFGCS9Gs1JFSlQKGWdWTZ153GHc4qwhSAE+yq2rY
	 DVa0IoIjxaClfQuBvT/Ywmudd7ISQlwjmqnyOg5dzx0nsNNK7om8dx2t6hzyAO3FAN
	 lMkKoaH06YfRnSDgk/Z8/sY+kCZDbqVjs5ccAuKU=
Date: Fri, 18 Sep 2026 14:50:05 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Gregory Price <gourry@gourry.net>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com,
 david@kernel.org, ziy@nvidia.com, matthew.brost@intel.com,
 joshua.hahnjy@gmail.com, rakie.kim@sk.com, byungchul@sk.com,
 ying.huang@linux.alibaba.com, apopple@nvidia.com
Subject: Re: [PATCH v2 0/2] mm/mempolicy: stop copying state in the
 interleave paths
Message-Id: <20260918145005.236264772edf83e1b6f728b0@linux-foundation.org>
In-Reply-To: <20260918001203.3389165-1-gourry@gourry.net>
References: <20260918001203.3389165-1-gourry@gourry.net>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 17 Sep 2026 20:12:01 -0400 Gregory Price <gourry@gourry.net> wrote:

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

Thanks, I updated mm-unstable to this version.

> v2: Comments and commit message [David]

Here's how v2 altered mm.git:


 mm/mempolicy.c |   11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

--- a/mm/mempolicy.c~b
+++ a/mm/mempolicy.c
@@ -2231,8 +2231,13 @@ static unsigned int weighted_interleave_
 
 	/*
 	 * The target was calculated in a separate loop, and a concurrent
-	 * rebind can change the total number of nodes.  Clamp this loop to
-	 * a single pass (nnodes) to keep the walk bounded by node count.
+	 * rebind can change the contents of pol->nodes as we calculate.
+	 * Access is safe, in the worst case we suddenly perceive an empty
+	 * nodemask and return numa_node_id() below - otherwise we may
+	 * simply cause a skew in allocations.
+	 *
+	 * Clamp this loop to a single pass (nnodes) to keep the walk
+	 * bounded by node count.
 	 */
 	while (target && nnodes-- && nid < MAX_NUMNODES) {
 		/* detect system default usage */
@@ -2266,6 +2271,8 @@ static unsigned int interleave_nid(struc
 		return numa_node_id();
 	target = ilx % nnodes;
 	nid = first_node(pol->nodes);
+
+	/* A concurrent cpuset rebind may cause us to see an empty nodemask */
 	for (i = 0; i < target && nid < MAX_NUMNODES; i++)
 		nid = next_node_in(nid, pol->nodes);
 
_

