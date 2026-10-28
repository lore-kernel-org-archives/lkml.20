Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793199691;
	b=1WltLx28Nqvgs2U2aq+56dG0d/pKkRiomeWIEAZNILJ5cdrJFs+ag/K7JIZoKZSdP8vZ
	 5mTCxA03E9MZ2K2tU5lICtL210Pw+VFbk8u0NTD+QgnNNYEC+Wm6Ur8O7iwx1Pad/Cf3x
	 bwILhAKpIqNn0QmkMl7RUERAWfcArwE9K3LI0NYCtQgsrCx7xD4TpNryRjPGczNhsHawn
	 HraY15o6prK8HN4Lag2CQZzJysDoa5tVH4b0s2qTl/hGAyqU4m0STPAZyfXXqYD6woFeQ
	 5JbZBjeI4B5UQAfrUEDzKZIZ+JA1uCu+bjxOFKw80aOaPOpD5nK8XnieJjPykJlvU7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793199691;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=qrtuy91IpWzzThsCveQ6a7h3MVCj9ehEufJFJ4ndZkw=;
	b=Mxr0koMATDQml1v3Bdo48HsGrmkkiKdx2HXTsYgI03wSbOJQOHXYzY3tYszYG2RIQwC1
	 8TLIr6mPBIzyl7a5nxlDril7MSfPe56koETmwQUs+FlQos0nAJZkOcC/ewWTAcT8S4+W9
	 w15PkDVNMzng6YF7pbqPrK4c8ND87IjDFGO0iHpHf35DW4lj59TZj1W97AdhZQHT764kg
	 tAlqCVE4n3QHupBHAABBNcrrH7O1zBRNsFAgvRMYcfEPEpeLO9FLab/EJw4Ia3O/6NgLM
	 yAWpWw9bnWotgz4uqlzXKbU0aYOsogK0FfMtvtuz+vcFML2SElfNAiV7QFY3iWCsOZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jnz4FDKF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8C5606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jnz4FDKF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FC7D1F01825;
	Wed, 28 Oct 2026 15:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793199690;
	bh=qrtuy91IpWzzThsCveQ6a7h3MVCj9ehEufJFJ4ndZkw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Jnz4FDKF10wh2Ob59odgXGD9RU612x00cjLp88yMU+M3mx/KDDnBifu/MtreJUHWj
	 6cls1EYwPWacfXzv4KomI7jh3tj4enFISnNJtH446deXMQLqL1uUx5WAp6Xs7Yxafm
	 ESGQpYU8KgpcgNYN/YHLrziMiFPBeZVeRZ3VsTnRDw22CsEmRKApPC3sbqb//zEyuY
	 GrlJdSeKuXv6PkltlW8pFEH/7lr1H8athK/QWBeJK2SXnEm93NbWRw5Ic5x2HpoR64
	 cFA/3OTj2KnyUyVJL9WV4+/WtDh5URjIbZBMRjKhojjE62Tlm9kM/MIx6+o3TlN+n7
	 bXtVzqgu0T3VQ==
Date: Wed, 28 Oct 2026 16:01:24 +0100
From: "Oscar Salvador (SUSE)" <osalvador@kernel.org>
To: Kaitao Cheng <kaitao.cheng@linux.dev>
Cc: Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>,
	David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	Frank van der Linden <fvdl@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Chris Down <chris@chrisdown.name>,
	Roman Gushchin <roman.gushchin@linux.dev>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Kaitao Cheng <chengkaitao@kylinos.cn>
Subject: Re: [PATCH 3/3] mm/hugetlb: fix NR_HUGETLB accounting for unused
 surplus folios
Message-ID: <auIORHr432BlmbrD@localhost.localdomain>
References: <20261028113319.38544-1-kaitao.cheng@linux.dev>
 <20261028113319.38544-4-kaitao.cheng@linux.dev>
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
In-Reply-To: <20261028113319.38544-4-kaitao.cheng@linux.dev>

On Wed, Oct 28, 2026 at 07:33:19PM +0800, Kaitao Cheng wrote:
> From: Kaitao Cheng <chengkaitao@kylinos.cn>
> 
> free_huge_folio() unconditionally decrements NR_HUGETLB, but freshly
> allocated surplus folios can be freed before the counter has been
> incremented.
> 
> This happens when alloc_surplus_hugetlb_folio() rejects a fresh folio
> after its second surplus limit check. It also happens when
> gather_surplus_pages() frees folios because a reservation cannot be
> satisfied, or because concurrent pool changes leave excess folios
> after the reservation succeeds.
> 
> These paths leave unmatched decrements, causing HugeTLB usage to be
> underreported and potentially underflowing the counter.
> 
> Increment NR_HUGETLB before calling free_huge_folio() in both paths
> to balance its unconditional decrement.
> 
> Fixes: 05d4532b60e3 ("memcg/hugetlb: add hugeTLB counters to memcg")
> Closes: https://sashiko.dev/#/bug/linux-860a3b8f-0b07-4cd5-a122-aa2288463bee
> Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>

I feel like the whole hugetlb accounting is a bit of a nightmare.
I wish we could teach free_huge_folio to ignore accounting-wise these pages
but not sure if that would be any prettier/easier.

I will have another look later on.

 

-- 
Oscar Salvador
SUSE Labs
