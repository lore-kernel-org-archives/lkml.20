Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2AD5411FAA
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 09:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.125.252.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788340567; cv=none; b=Hgt2UoM4U4P8XznrkO0i+4FmswNBKAIJqKe5UeSFu6rOSvHNRSMP7dNTxucO5KSHi7zZ3ewCIiu+yskhNg7EqixObY4kKejktiXcl283BOTkSoAWBcSNiwENLYyl1WWvl5OWHLz8IR3mDQR8e20iXOaNzc4z6PZVatRjszqvXiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788340567; c=relaxed/simple;
	bh=8IXJhTDjMSkMFSkHIN+c6JLVjvvdcPuLWnYmgnYK5sE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZhZM1l8M0772V/vENO0STQZERDOx6UKwRgXObnSd/v+ty1ITEWFkb5jlifNKJskEEqvM5XZf1xBufOUJDt73bcHjWulI9yx//AU0mpmBk1NU6j/5mF2pprfCAwTqk3FA9T78ru0a7Npce9ws/PGovwoGoGxmqrNAj4lOhmS8PFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sk.com; spf=pass smtp.mailfrom=sk.com; arc=none smtp.client-ip=166.125.252.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sk.com
X-AuditID: a67dfc5b-c2dff70000001609-ca-6a97e5c3b9b8
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
Date: Wed,  2 Sep 2026 18:00:44 +0900
Message-ID: <20260902090047.1944-1-rakie.kim@sk.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260829015943.1258774-3-gourry@gourry.net>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrMLMWRmVeSWpSXmKPExsXC9ZZnke7hp9OzDP5vNraYs34Nm8WuGyEW
	X96tYrJ4vvUXo8XPu8fZLY5vncduse8iUPLyrjlsFvfW/Ge1+NYnbbH6IovF6jUZFrOP3mN3
	4PXYOesuu0d322V2j5Yjb1k9Fu95yeSxaVUnm8emT5PYPU7M+M3isfOhpce5ixUevc3v2Dw+
	b5IL4I7isklJzcksSy3St0vgyrix9iN7wS65iguXF7I2MK6R6GLk5JAQMJHY8/ouexcjB5j9
	9nkBiMkmoCRxbG8MiCkioCrRdsUdpJhZ4CeTxKoZeiC2sECExK/tfSwgNgtQSdO1L+wgNi/Q
	kNtT57JADNeUWLfxFpjNKWApsbDhApgtJMAj8WrDfkaIekGJkzOfsEDMl5do3jqbuYuRC6j3
	O5vE5Hs32SEGSUocXHGDZQIj/ywkPbOQ9CxgZFrFKJSZV5abmJljopdRmZdZoZecn7uJERgV
	y2r/RO9g/HQh+BCjAAejEg+vwYZpWUKsiWXFlbmHGCU4mJVEeK0XTs8S4k1JrKxKLcqPLyrN
	SS0+xCjNwaIkzmv0rTxFSCA9sSQ1OzW1ILUIJsvEwSnVwJh9s9j4p9nbm7u02hIMGFyezLRv
	vBwWsi9Qa2nS06kh67m2mL9u2KxfEnO7d2HJ05jZ2h/9kjmnll2eNb156Y3XhXnMH3OuP+5b
	/FdFMebf2tPtq2VvRjy3v+e9pOCtQUjN7p5Tu4SOvYtZ4Nm+62BDRHsdQ8K3nuhp/kpX83ec
	9mFNcVj6r0eJpTgj0VCLuag4EQC+qdfZhgIAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrBLMWRmVeSWpSXmKPExsXCNUM9Rvfw0+lZBp+faVjMWb+GzWLXjRCL
	c1Nms1l8ebeKyeL51l+MFj/vHme3OL51HrvFvotAFYfnnmS1uLxrDpvFvTX/WS2+9UlbHLr2
	nNVi9UUWi9VrMixmH73H7iDgsXPWXXaP7rbL7B4tR96yeize85LJY9OqTjaPTZ8msXucmPGb
	xWPnQ0uPcxcrPHqb37F5fLvt4bH4xQcmj8+b5AJ4o7hsUlJzMstSi/TtErgybqz9yF6wS67i
	wuWFrA2MayS6GDk4JARMJN4+LwAx2QSUJI7tjQExRQRUJdquuHcxcnIwC/xkklg1Qw/EFhaI
	kPi1vY8FxGYBKmm69oUdxOYFGnJ76lywuISApsS6jbfAbE4BS4mFDRfAbCEBHolXG/YzQtQL
	Spyc+YQFYr68RPPW2cwTGHlmIUnNQpJawMi0ilEkM68sNzEzx1SvODujMi+zQi85P3cTIzD8
	l9X+mbiD8ctl90OMAhyMSjy8BhumZQmxJpYVV+YeYpTgYFYS4bVeOD1LiDclsbIqtSg/vqg0
	J7X4EKM0B4uSOK9XeGqCkEB6YklqdmpqQWoRTJaJg1OqgbGScY1FREF5yh3ZJj8ejimrlnwJ
	Wdb+amPJ/LOZ9h5vvkQfT6yNN6+/q+mWteCyyUvlFfICzyf+nzttxyU5M5azrWXdH6/qpr17
	7ptVY1m/tu74a924K9lLvVwaz6S//LTd50jM+WWVzXXNSfcZTV4VbGkqFXx9avEM89nLn25X
	y41t8BJeXKbEUpyRaKjFXFScCADYa0hKewIAAA==
X-CFilter-Loop: Reflected

Hello Gregory,

Thanks for the series.

On Fri, 28 Aug 2026 21:59:43 -0400 Gregory Price <gourry@gourry.net> wrote:

> The interleave node selectors copy pol->nodes onto the stack so the mask
> cannot change while they walk it.  nodemask_t is 128 bytes at
> MAX_NUMNODES=1024, and two of the three run per folio fault.
>
> The copy only buys consistency between the node count and the walk.
> Drop the consistency and just bounds check the walk instead.

I went through both patches. Resolving the sleeping-allocation
problem with SRCU rather than patching the allocation site, and
removing the copies from the fault path along the way, looks like
the right direction to me.

>
> If an empty nodelist or weight is perceived, fall back to numa_node_id(),
> which is what the functions already did when the copy came back empty.
>
> weighted_interleave_nid() counts the nodes as we sum the weights. We use
> that node count to limit the maximum skew a single node can host.
>
> interleave_nid() walks with next_node_in() rather than next_node(), so a
> mask that shrank mid-walk wraps to a node still in the policy.
>
> alloc_pages_bulk_weighted_interleave() derives per-node counts from a
> weight total summed over the mask, so a changing mask can make them exceed
> the request.  Clamp each chunk to the space left in page_array.
>
> A cpuset cookie will not work here: two of these take VMA policies, which
> mpol_rebind_mm() rebinds under mmap_write_lock(), not mems_allowed_seq.
>
> Cost is distribution accuracy during a rebind - but the copy never
> corrected this anyway, it was just a safety mechanism to prevent div/0
> and overrunning the alloc request buffer.
>
> Remove read_once_policy_nodemask(), now unused.
>
> -fstack-usage at MAX_NUMNODES=1024:
>
>   weighted_interleave_nid            184 -> 56
>   interleave_nid                     168 -> 32
>   alloc_pages_bulk_mempolicy_noprof  360 -> 136
>
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
> ---
>  mm/mempolicy.c | 86 ++++++++++++++++++++++++++++----------------------
>  1 file changed, 49 insertions(+), 37 deletions(-)
>
> diff --git a/mm/mempolicy.c b/mm/mempolicy.c

[...snip...]

> @@ -2675,10 +2676,10 @@ static unsigned long alloc_pages_bulk_weighted_interleave(gfp_t gfp,
>  	if (!nr_pages)
>  		return 0;
>
> -	/* read the nodes onto the stack, retry if done during rebind */
> +	/* count the nodes, retry if a rebind happened during the read */
>  	do {
>  		cpuset_mems_cookie = read_mems_allowed_begin();
> -		nnodes = read_once_policy_nodemask(pol, &nodes);
> +		nnodes = nodes_weight(pol->nodes);
>  	} while (read_mems_allowed_retry(cpuset_mems_cookie));
>
>  	/* if the nodemask has become invalid, we cannot do anything */

[...snip...]

> @@ -2712,9 +2713,13 @@ static unsigned long alloc_pages_bulk_weighted_interleave(gfp_t gfp,
>  	table = state ? state->iw_table : NULL;
>
>  	/* calculate total, detect system default usage */
> -	for_each_node_mask(node, nodes)
> +	for_each_node_mask(node, pol->nodes)
>  		weight_total += table ? table[node] : 1;

I have a minor comment on this part. After this change, everything
else reads pol->nodes fresh at the point of use - the weight sum
and the walk both look at the current mask. Only nnodes is still
the count from this earlier read. If the mask changes in between,
the loop bound no longer matches the mask the loop is actually
walking, so the walk can stop short of the pages the weight total
planned for. Would it be better to count the nodes in the loop
that sums the weights, the way weighted_interleave_nid() does it
in this patch?

	nnodes = 0;
	for_each_node_mask(node, pol->nodes) {
		weight_total += table ? table[node] : 1;
		nnodes++;
	}

[...snip...]

Thanks again for your time.

Rakie Kim
