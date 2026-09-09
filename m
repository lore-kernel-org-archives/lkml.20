Received: from mta1.migadu.com (out-55.mta1.migadu.com [95.215.58.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBB334AB00
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 03:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788923502; cv=none; b=PkRh/0xduCLqJa6HioxntSw9a/LbOONGQRMkyWD5SSVnJNwsBHKKDmGgkZrsMNILaHW/s9Df1Sq7yQoBOArLhKax6StLJI2nGvTd4gPo4UcAtONJfjEJUiLEpbzhFkRD1U21P9gt7KUYBuRDkbupYqWbYI66SbJn7Or+vFN0gjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788923502; c=relaxed/simple;
	bh=f2j1DxoU0lmQ/fI0keOTiQxFdQCddTWeKdh1RnG9jVs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q3OsemG4vsK7xOxQ8fD9PCNWzRDF89wSj9MCEKUQs4CScCjSYkTNS+7wwqMpeB0NFgStTY03VVSdNgxVgqWtJKewiX/RXha8TcAOhOXwW7yp0pkmZt4yee/nB/MLpzDkL0yjYzzW2f9bgy15RP/WXR6aTzxx9xNJu6KrCIlNKV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=DsBF3/YL; arc=none smtp.client-ip=95.215.58.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="DsBF3/YL"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=f2j1DxoU0lmQ/fI0keOTiQxFdQCddTWeKdh1RnG9jVs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788923496; v=1; x=1789528296;
 b=DsBF3/YLqCSlUXnHTz3KHa8Laa7Xz1N/pgRB7PE8d4SKKlLthWbLI3FWJUHsHD+oAOG5hoy6
 BBqR+yqXUOaxjP5O94XNcUcfXDZL1TpY/Fs3gJBucU0Fl7HjDZLL9rdpRiL3JZHBGPrg0nnvTA1
 LoSF1rYQxo8K1hP1VSXY+Gw0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id aba1175d2e6d8a11;
	Wed, 09 Sep 2026 03:11:36 +0000
X-Mizu-Trace-ID: aba1175d2e6d8a11
X-Migadu-Flow: FLOW_OUT
Date: Wed, 9 Sep 2026 11:11:33 +0800
From: Baoquan He <baoquan.he@linux.dev>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, kasong@tencent.com, qi.zheng@linux.dev,
	shakeel.butt@linux.dev, baohua@kernel.org, axelrasmussen@google.com,
	yuanchu@google.com, weixugc@google.com, hannes@cmpxchg.org,
	david@kernel.org, mhocko@kernel.org, ljs@kernel.org,
	ridong.chen@linux.dev, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH mm-new v2] mm: mglru: clear the reference counter for
 rejected folios
Message-ID: <aqDOZe7oM5_3p0lK@fedora>
References: <9214e36bf738fcfba86acc8cea85dff4010f66b0.1788918714.git.baolin.wang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9214e36bf738fcfba86acc8cea85dff4010f66b0.1788918714.git.baolin.wang@linux.alibaba.com>

On 09/09/26 at 09:57am, Baolin Wang wrote:
> As per the comment on LRU_REFS_FLAGS, when accessed folios are promoted to
> a new generation, LRU_REFS_FLAGS should be cleared so that the reference
> counter can start over.
> 
> For folios rejected by shrink_folio_list(), we clear LRU_REFS_FLAGS and
> set the PG_active flag when lru_gen_folio_seq() would place them in the
> oldest generation. That's fine.
> 
> But for rejected folios where lru_gen_folio_seq() returns a generation
> other than the oldest one (which can be treated as a promotion), we do
> not clear LRU_REFS_FLAGS. This can violate the promotion mechanism. And
> this means the rejected folio enters the new generation with stale, inflated
> tier bits, which can inflate reference counts and distort eviction
> statistics for these rejected folios.
> 
> Fix this by clearing LRU_REFS_FLAGS for rejected folios. Of course, I need
> to evaluate the impact of the changes, which mainly falls into 3 cases:
> 1. When lru_gen_folio_seq() returns the oldest generation for rejected folios,
> there are no logic changes, and they will be put back into the 2nd youngest
> generation.
> 2. For rejected folios with PG_active set by shrink_folio_list(), we only
> clear the LRU_REFS_FLAGS and do not change the generation.
> 3. For rejected folios with PG_referenced set, the original code would put
> them back into the 2nd oldest generation. After this patch, we will put them
> back into the 2nd youngest generation.
> 
> I think case 3 is also reasonable, before commmit 6cbdd9726fb5 ("mm/mglru:
> use folio_mark_accessed to replace folio_set_active"), a rejected referenced
> folio was also put back to the 2nd youngest gen. Meanwhile, I didn't see
> any noticeable performance impact on my 32-core Arm machine when running
> 'make -j32' to build the kernel inside a 3G-limited memcg with either zram
> or NVMe swap.

According to our discussion in v1 thread, the patch log clearly states
the justification, and the code change looks good to me. Thanks for the
effort.

Reviewed-by: Baoquan He <baoquan.he@linux.dev>

> 
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---
> Changes from v1:
>  - Update the commit message.
>  - Clear LRU_REFS_FLAGS earlier.
> ---
>  mm/vmscan.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 40d3f1b48a74..1557679aadb1 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -5020,11 +5020,12 @@ static int evict_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
>  			continue;
>  		}
>  
> +		/* See the comments on LRU_REFS_FLAGS */
> +		folio_set_lru_refs(folio, 0);
> +
>  		/* don't add rejected folios to the oldest generation */
> -		if (lru_gen_folio_seq(lruvec, folio, false) == min_seq[type]) {
> -			folio_set_lru_refs(folio, 0);
> +		if (lru_gen_folio_seq(lruvec, folio, false) == min_seq[type])
>  			folio_set_active(folio);
> -		}
>  	}
>  
>  	move_folios_to_lru(&list);
> -- 
> 2.47.3
> 
