Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D01453D1AA6
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 08:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.125.252.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788508919; cv=none; b=JRZ91TuHCdjWFe9xKq1FPFAW1eOZ+ze9suUBjIsXfGQCAaKfhjAPNwuqbx+Qj4OKWeJocz36HyVyc2XV4Wj2RJRCOesKc8Tfh0ohM+oqFCUc8MAyXTQLRn7yjmH/fJDgroTQsxJbb/I8ZNwe63MpKtscTh/pmZwLdoSEvKHoAXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788508919; c=relaxed/simple;
	bh=LTiDfbkFvFm8pZmMJyGoWsRMFcanmZVVdZA7EMQpAKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k/kRMhPmB/uN5Na5sefVId5OpOGy7T4BFgxE0POLOMEenPWGBTjtYsUqdQj/rBZcts2nkvUeiIaOLMp39w//+2MUVI0ebFu/tVhjXaoMJfUYIYuUWS09wbxwq2NpWnNpzAczXe2yVTg7GtekNPFNi910eTq7NR9Fke1cPo8IscY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sk.com; spf=pass smtp.mailfrom=sk.com; arc=none smtp.client-ip=166.125.252.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sk.com
X-AuditID: a67dfc5b-c2dff70000001609-5a-6a9a7ae7aa81
From: Rakie Kim <rakie.kim@sk.com>
To: Gregory Price <gourry@gourry.net>
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ziy@nvidia.com,
	matthew.brost@intel.com,
	joshua.hahnjy@gmail.com,
	byungchul@sk.com,
	ying.huang@linux.alibaba.com,
	apopple@nvidia.com,
	urezki@gmail.com,
	chenwandun@huawei.com,
	linux-mm@kvack.org,
	kernel_team@skhynix.com,
	Rakie Kim <rakie.kim@sk.com>
Subject: Re: [PATCH 2/2] mm/mempolicy: stop copying the nodemask in the interleave paths
Date: Fri,  4 Sep 2026 17:01:37 +0900
Message-ID: <20260904080140.1992-1-rakie.kim@sk.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <apgzMZQPTxS9QtDy@gourry-fedora-PF4VCD3F>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrMLMWRmVeSWpSXmKPExsXC9ZZnke6LqllZBjOLLeasX8NmsetGiMWX
	d6uYLJ5v/cVo8fPucXaL41vnsVvsuwiUvLxrDpvFvTX/WS2+9UlbrL7IYrF6TYbF7KP32B14
	PXbOusvu0d12md2j5chbVo/Fe14yeWxa1cnmsenTJHaPEzN+s3jsfGjpce5ihUdv8zs2j8+b
	5AK4o7hsUlJzMstSi/TtErgyJkzcy1jQI1Gx/Ox2xgbGdUJdjJwcEgImEgv/PWOBsWeufcXU
	xcjBwSagJHFsbwyIKSKgKtF2xR2kglngJ5PEqhl6ILawQITEr+19YJ0sQCUvPrUygti8QFPe
	PpjPBDFRU2LdxltgNZwCZhIfny9jB7GFBHgkXm3YD1UvKHFy5hMWiPnyEs1bZzN3MXIB9X5n
	k/h98hvUIEmJgytusExg5J+FpGcWkp4FjEyrGIUy88pyEzNzTPQyKvMyK/SS83M3MQKjYlnt
	n+gdjJ8uBB9iFOBgVOLhvSA7I0uINbGsuDL3EKMEB7OSCK/1wulZQrwpiZVVqUX58UWlOanF
	hxilOViUxHmNvpWnCAmkJ5akZqemFqQWwWSZODilGhiTlRM77kb97aifw53+z+B51ZTXOwO0
	zR37ppbOmfL7ltHTjRHrhH70ROzO3VLZN7vTPOLWBLPWsDTxK3c3WMVM8Vk1o3PzZ7W/Ev0f
	uFmMQ3KVVOvPVzc3Bom0FUZ6ulgylMTOEdmxYK3ztz8fdHa5cu6f5yx3X2H7bIm4p407ZhTy
	qdmbvFZiKc5INNRiLipOBAD97pcYhgIAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrJLMWRmVeSWpSXmKPExsXCNUM9Rvd51awsg9U/9C3mrF/DZrHrRojF
	uSmz2Sy+vFvFZPF86y9Gi593j7NbHN86j91i30WgisNzT7JaXN41h83i3pr/rBbf+qQtDl17
	zmqx+iKLxeo1GRazj95jdxDw2DnrLrtHd9tldo+WI29ZPRbvecnksWlVJ5vHpk+T2D1OzPjN
	4rHzoaXHuYsVHr3N79g8vt328Fj84gOTx+dNcgG8UVw2Kak5mWWpRfp2CVwZEybuZSzokahY
	fnY7YwPjOqEuRk4OCQETiZlrXzF1MXJwsAkoSRzbGwNiigioSrRdcQepYBb4ySSxaoYeiC0s
	ECHxa3sfC4jNAlTy4lMrI4jNCzTl7YP5TBATNSXWbbwFVsMpYCbx8fkydhBbSIBH4tWG/VD1
	ghInZz5hgZgvL9G8dTbzBEaeWUhSs5CkFjAyrWIUycwry03MzDHVK87OqMzLrNBLzs/dxAiM
	gGW1fybuYPxy2f0QowAHoxIP7wXZGVlCrIllxZW5hxglOJiVRHitF07PEuJNSaysSi3Kjy8q
	zUktPsQozcGiJM7rFZ6aICSQnliSmp2aWpBaBJNl4uCUamCcdP57uuqcIDNOU7Ubd7++2fMk
	+fyCuY9Wtt2+v9ixN3iju/aTkxw3dR9c/bp3mv8ilpaI0KblMocWbWQT8dWe6RO4+FCxSvXG
	UIZU3oAT/0UL/L6ejujveeg917dfZm7Mz2beSz/PrfUV+p/XvVD6q7HEVq+TYtd/7Hq9ykVt
	UrUJU1nvtWc6SizFGYmGWsxFxYkAWumk2XwCAAA=
X-CFilter-Loop: Reflected

On Wed, 2 Sep 2026 10:52:45 -0400 Gregory Price <gourry@gourry.net> wrote:

> I don't think this actually fixes anything?
>
> But basically the proposal is to widen the SRCU() window further to
> include the cpuset cookie entirely.
>
> e.g.
>
> SRCU() {
> 	cpuset_cookie() {
> 		for_each_node_mask(node, pol->nodes)
> 			weight_total += ...
> 			nnodes++;
> 	}
>
> 	/* ... snip - single node quick-exit ... */
>
>         /* ... actual multi-node bulk allocation ... */
> 	for_each_node_mask(node, pol->nodes) {
> 		nr_allocated = __alloc_pages_bulk(gfp, node, ...);
>
> 		/*
>                  * At this point, due to a torn read from pol->nodes
> 		 * we can visit a node that wasn't present previously
> 		 * or we can skip a node that was present previously.
> 		 *
> 		 * In either case, weight_total is the wrong value for
> 		 * the set of nodes being walked anyway - we are going
> 		 * to skew in the distribution no matter what.
> 		 */
> 	}
> }
>
> I'm not sure widening the SRCU window is worth it here, it doesn't
> actually buy us anything.
>
> Also we'd be calculating the weight total every time even when there's a
> scenario where we quick-exit because the entire allocation fits in the
> first node in the mask.

Sorry, I did not explain that well. I was not suggesting moving the
sum into the cookie loop or widening the SRCU section - only adding
the counter to the sum loop where it already is:

	/* calculate total, detect system default usage */
	nnodes = 0;
	for_each_node_mask(node, pol->nodes) {
		weight_total += table ? table[node] : 1;
		nnodes++;
	}

The order of the function does not change, so the quick-exit path
still returns before this loop runs - the sum is not computed in
that case either way.

What I had in mind is the gap between the two reads. Say the policy
starts with two nodes, every weight is 10, and 100 pages are
requested:

	/* the mask is {0,1} here */
	do {
		cpuset_mems_cookie = read_mems_allowed_begin();
		nnodes = nodes_weight(pol->nodes);	/* nnodes = 2 */
	} while (read_mems_allowed_retry(cpuset_mems_cookie));

	/* a rebind grows the mask to {0,1,2,3} at this point */

	/* calculate total, detect system default usage */
	for_each_node_mask(node, pol->nodes)
		weight_total += ...;			/* 10 * 4 = 40 */

	rounds = rem_pages / weight_total;		/* 100 / 40 = 2 */

	for (i = 0; i < nnodes; i++)			/* bounded by 2 */
		...

The distribution is planned from a total of 40, which spreads the
100 pages over four nodes, but the walk is still bounded by the two
nodes counted earlier. It places 60 pages and returns, and the
caller allocates the remaining 40 one page at a time. The mask does
not have to change again during the walk for this to happen.

You are right that a torn read during the walk still skews the
distribution, and this does not change that. It only removes the
case where the bound and the total start out inconsistent. If that
is not worth the extra line, I am fine either way.

Thanks for looking at it.

Rakie Kim
