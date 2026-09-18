Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6CF3126DF
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 00:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789691889; cv=none; b=iluXmqVCJkUAmQimcludOxF27XPCyNBNTKYNEsdGT632/LBdXEbBKZzIdxD6g3ZzUI3K3ZifHdrf2enUxFHO3vuYCoDJdPFMHB+lwsIWefBRi4xhhYjy2YgM19f0EjRPcD0TvP0MYbhjSJmAi/AMIPBpBHVnAnNUiQ6Eq7hHNJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789691889; c=relaxed/simple;
	bh=WsE2Pe4vXp9onoewbg9I6Eq4BwVOI/CfeJKJljhpX0M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=nPqmd/+8T23cwW6h2FpoPRI8cg3qMHmytBH6dmOXqRhkbut6hO5t4XR9XrRrk7WLEg2OLLi/uIotepdLhfHFyVL7iPkCz9zDHGpJ7UEsqenFNlC2BV2oYqDE1y3UjwmrCIMyFdJgW6bhUwlLhSDYYJHxh6u7Ut97S8tgsj0F05o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d+bSl1Gv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d+bSl1Gv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67A161F000FF;
	Fri, 18 Sep 2026 00:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789691888;
	bh=Ze9UETo+1hNVH97tpJEWQvJ1yZNxYlSuzO4Oj6uf588=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=d+bSl1GvJPGpKJYMJztB6DW2nOd5gK/0XiKZ5AIB6VuavdGfd3Prp+D3XBcOpYA2R
	 iIwVPvgYhgv6yfq2RUHTq4tnZGKxFiz/sxeJePe2MHqQYzaJoFt/VExnajbgcNtN30
	 sa5IxWpBsDig62Xv2bnappORxL1PDe2qQS/Q7poO1/9geVH64dcJjyP+wYLajXtPGW
	 BpqwM8jasLiVs4z8X42oTLB+m9XNHKPXhw0LX6S3Rtspl31EcKrWRP7ZRwE6r3GQ1F
	 JgCdXruZNKoLXeJgzsha6AEnjUkqjx6HxogeUiC1370bKypIA0nJRIYT5WQ0KL2FIB
	 p85YVOSKrGvqQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Tarun Sahu <tarunsahu@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,  Pasha Tatashin
 <pasha.tatashin@soleen.com>,  dmatlack@google.com,  Mike Rapoport
 <rppt@kernel.org>,  kexec@lists.infradead.org,
  linux-kernel@vger.kernel.org,  dev.jain@arm.com,  Pratyush Yadav
 <pratyush@kernel.org>,  linux-mm@kvack.org
Subject: Re: [PATCH v2 1/2] memblock: drop for_each_memblock_type() and open
 code its users
In-Reply-To: <20260918002239.4024231-1-tarunsahu@google.com> (Tarun Sahu's
	message of "Fri, 18 Sep 2026 00:22:38 +0000")
References: <20260918002239.4024231-1-tarunsahu@google.com>
Date: Fri, 18 Sep 2026 02:38:04 +0200
Message-ID: <2vxzwlsj5r83.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Sep 18 2026, Tarun Sahu wrote:

> for_each_memblock_type() always starts the iteration at index 0 and its
> body is a trivial 'for' loop, so it hides very little. It also gets in
> the way of iterating from an arbitrary index, which the next patch
> needs.
>
> Remove the macro and open code its three users: memblock_add_range(),
> memblock_isolate_range() and memblock_dump(). While at it, move the
> region pointer into the loop body scope.
>
> No functional change.
>
> Signed-off-by: Tarun Sahu <tarunsahu@google.com>
> ---
>  mm/memblock.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
>
> diff --git a/mm/memblock.c b/mm/memblock.c
> index 9ce86349a29f..5aae75d34dec 100644
> --- a/mm/memblock.c
> +++ b/mm/memblock.c
> @@ -155,11 +155,6 @@ struct memblock_type physmem = {
>   */
>  static __refdata struct memblock_type *memblock_memory = &memblock.memory;
>  
> -#define for_each_memblock_type(i, memblock_type, rgn)			\
> -	for (i = 0, rgn = &memblock_type->regions[0];			\
> -	     i < memblock_type->cnt;					\
> -	     i++, rgn = &memblock_type->regions[i])
> -
>  #define memblock_dbg(fmt, ...)						\
>  	do {								\
>  		if (memblock_debug)					\
> @@ -651,7 +646,8 @@ static int __init_memblock memblock_add_range(struct memblock_type *type,
>  	base = obase;
>  	nr_new = 0;
>  
> -	for_each_memblock_type(idx, type, rgn) {
> +	for (idx = 0; idx < type->cnt; idx++) {
> +		rgn = &type->regions[idx];

Nit: this is really odd to read. You assign rgn and then declare rbase
and rend. Doesn't checkpatch complain?

Regardless, I reckon it would be a lot nicer to read of you move the
declaration of rgn into the loop. Same for the others below.

LGTM otherwise, so after fixing this up, feel free to add:

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

>  		phys_addr_t rbase = rgn->base;
>  		phys_addr_t rend = rbase + rgn->size;
>  
> @@ -827,7 +823,8 @@ static int __init_memblock memblock_isolate_range(struct memblock_type *type,
>  		if (memblock_double_array(type, base, size) < 0)
>  			return -ENOMEM;
>  
> -	for_each_memblock_type(idx, type, rgn) {
> +	for (idx = 0; idx < type->cnt; idx++) {
> +		rgn = &type->regions[idx];
>  		phys_addr_t rbase = rgn->base;
>  		phys_addr_t rend = rbase + rgn->size;
>  
> @@ -2198,7 +2195,8 @@ static void __init_memblock memblock_dump(struct memblock_type *type)
>  
>  	pr_info(" %s.cnt  = 0x%lx\n", type->name, type->cnt);
>  
> -	for_each_memblock_type(idx, type, rgn) {
> +	for (idx = 0; idx < type->cnt; idx++) {
> +		rgn = &type->regions[idx];
>  		char nid_buf[32] = "";
>  
>  		base = rgn->base;

-- 
Regards,
Pratyush Yadav
