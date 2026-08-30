Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7022690EC
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 15:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788102689; cv=none; b=de0KEkmd9BDHoAvaYkFApmVTgmtiKcDE6hcFy4lzfCzi82PdXDx2nfOIlJSCuM1PvjlvFJp+TOqLNHeZebSmzguQHpSNjt2oYb8pSGIM09alnPRn+ilqzgt4/ww2EHNDu+MuVPWRNoVua3pV415+hOO/50aUOshZZtQ5nCm+jjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788102689; c=relaxed/simple;
	bh=n3t76cHUiNxUyDMVedQBm9Cnx33m80tDziYZahqaGjw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RBIeOpO5seDW0ILz5UyY0MI/FnXflXU0OstpAZdvzrg8LLbw1MTh9qWHvmY+8pYvSji+Xa1MirCEAF+0P6EcdrUq/I1jJjiFV0Iz75B0EaLOBM7u45A2T89i0UCllE69tTRvxxwyNwaW/fkzhpDxRNrCufPrQZjX95H5qiDgcVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GNNoPCnY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GNNoPCnY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAB121F000E9;
	Sun, 30 Aug 2026 15:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788102688;
	bh=HyG9tz+TSnj/rxvvPnlHrADvCYJXm+MsawAjXsGmswM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GNNoPCnYfdqBton8YNLsVJxe0Vx6acTMuSP3LmHDTWzmprfUEf4d8l39/ANjOMBmI
	 6Xxd+ytmKvCuQPLFKt8s3JEkL9fDULs+kWLp52HgqZI5BCimG2ca+whU7pLZdjlG17
	 IwA91N00zqgrhCajC4A9PHIrzNd/dV0kfrF7mQRUt/+VO6HRQZ67D69Ls0eFaOnBX2
	 0pLzQa9J6WnCoPKUgpU0cKWtP+EWSKqovVNIOTwHwtEDcdhDsUbxIp37cxpE+4zEuO
	 Q1NFP57GQdDnRiJGbUVatKjNeGrNzR+4eg8PaVb3f6g+BIXpjKj/ipCQbx9XycRQc+
	 MR00djAuV0QNg==
Date: Sun, 30 Aug 2026 15:11:23 +0000
From: Harry Yoo <harry@kernel.org>
To: Longlong Xia <xialonglong2025@163.com>
Cc: vbabka@kernel.org, akpm@linux-foundation.org, hao.li@linux.dev, 
	cl@gentwo.org, rientjes@google.com, roman.gushchin@linux.dev, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Longlong Xia <xialonglong@kylinos.cn>
Subject: Re: [PATCH v2 1/1] mm/slab_common: reject zero object_size before
 calculate_alignment
Message-ID: <apQ9SGYssBn7LYy8@dev>
References: <20260826015506.3178758-1-xialonglong2025@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826015506.3178758-1-xialonglong2025@163.com>

On Wed, Aug 26, 2026 at 09:55:06AM +0800, Longlong Xia wrote:
> From: Longlong Xia <xialonglong@kylinos.cn>
> 
> calculate_alignment() with SLAB_HWCACHE_ALIGN halves ralign in a
> while (size <= ralign / 2) loop. When size is 0, ralign eventually
> reaches 0 and the condition stays true indefinitely, hanging the
> kernel.
> 
> kmem_cache_sanity_check() rejected size > KMALLOC_MAX_SIZE but not
> size == 0. Add !size to the check so a 0-size kmem_cache_create() is
> caught on CONFIG_DEBUG_VM builds, where it can be diagnosed when it
> surfaces.
> 
> Suggested-by: Hao Li <hao.li@linux.dev>
> Assisted-by: Codex:gpt-5.6-sol
> Signed-off-by: Longlong Xia <xialonglong@kylinos.cn>
> ---
> Changes in v2:
> - Drop the !object_size check in __kmem_cache_create_args() that v1
>   added to the always-compiled path, and keep the guard only in the
>   debug-only kmem_cache_sanity_check(), as suggested by Hao Li.
> 
> Link: https://lore.kernel.org/all/20260824092454.1693745-1-xialonglong2025@163.com/
> ---

The patch is small and benign enough, so:
Reviewed-by: Harry Yoo (Meta) <harry@kernel.org>

However, to be honest I don't understand why anyone would ever try to
create a kmem_cache with size == 0. It doesn't make any sense.

I'd strongly encourage not addressing every theoretical issue raised
by an LLM that doesn't bother you or somebody else.

-- 
Cheers,
Harry / Hyeonggon
