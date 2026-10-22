Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792651830;
	b=sOhXNyX622muXMHSsTzFVbljN8mjV0KYn6+WyQJPd0PDC+0cv9dpoXj3IbX+/i0I8ep7
	 5J1MHpdOIbsZ8xmeOXrrzYj50NY3+Wo1cLI7ABu4KIAFEQvDgt4sPAz/LQIyt7RCm25q6
	 LqUa5i39Vxmlg6PedzhUjfL37bL+HDTcdkPigpEB0UfiekLzKnrHLXj/0cg1ph6raHVhR
	 M5tZVMf/0LJFFZz/1glkVUAFb3eS+KBlR3cLNwocDmarvvXA1+6s711FpM9/4qOjglN0L
	 ISyYk/5xraEMtuaaYt8tO3LRZMcFmqE965tPQFOKFduHU8siWTE7DklwHoufBbp7+3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792651830;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=BHhajxLyQjIggPfERX4J5IymxXdQBLrR5tOcaGMBjj8=;
	b=ga9ctNAGUexgm8Vdn6pOT3ui73F38GBK/8AoJXP2Ppzf3PXX5O5jhenGtL2dKOme3k7X
	 nmUHfUM5FGNhbBHnUNEg3Sd/nGdG7LWLhHDUNiUcYkx1ZXZ4WNpM7g/zCOVMtO6mT3R1L
	 dr9aA8apDtQ/9zq20gnBBoDlkjQoS+FH7wrD3w22jOiEV6b3yxQN1ilq5adtyqCCX+J4C
	 oWfvMHNqiQ3N+3O7Z3VmYQRMKAMq0ddk3JS1jT0lnqKYHL9sSVOxpJVPo4jaZuqOYyRFV
	 ZgGwvq5TZ08G1f4KYTfgH+SRl0zt6Ot31pQ35e6gL9I2fdUl475JRG0tqtDwtVAMvTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lXDFI2vo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F532606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 06:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lXDFI2vo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54F431F000C1;
	Thu, 22 Oct 2026 06:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792651830;
	bh=BHhajxLyQjIggPfERX4J5IymxXdQBLrR5tOcaGMBjj8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lXDFI2voqvPVnhrcv3mCBj9iw7gFtv8c2eYodVCu3sABZGnH/1x6vsSoA86M2qZZt
	 SGxInoXRTs4Hb1UUpdTu9mWdoPxjQRMySUj36JXLs+3LqxQ8XzeGq0CRhTBdF2NPrQ
	 vufeC0i1wv+2P0tRBVHE33hq5mgtciSc3PVFIj8AS4TcbkfR9xe8abE8oPeVxuphos
	 dxnjlDcOtCnsDIQEX+7fH2qeuDQs8UDhzwsKoVp3S+V+4Ki7rlYccsvp3YoYse+Sni
	 120oQxaV8rDais8KVHaLvyC130iHgvQv+mpFG+Ogc5iYJckLsK0DGrKE01RHsE/cYS
	 9N6u7nNLn4OKw==
Date: Thu, 22 Oct 2026 09:50:23 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Li Zhe <lizhe.67@bytedance.com>
Cc: akpm@linux-foundation.org, david@kernel.org, muchun.song@linux.dev,
	osalvador@suse.de, peterx@redhat.com, azpijr@gmail.com,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v3 2/3] mm/hugetlb: disable PMD sharing for UFFD missing
 mode
Message-ID: <atmyL8tmB9ZCdSin@kernel.org>
References: <20261022034543.51226-1-lizhe.67@bytedance.com>
 <20261022034543.51226-3-lizhe.67@bytedance.com>
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
In-Reply-To: <20261022034543.51226-3-lizhe.67@bytedance.com>

On Thu, Oct 22, 2026 at 11:45:42AM +0800, Li Zhe wrote:
> From: "David Hildenbrand (Arm)" <david@kernel.org>
> 
> For UFFDIO_POISON to install a poison marker in a hugetlb mapping, it is
> sufficient to have the VMA registered for missing mode.
> 
> However, UFFD missing mode does currently not block PMD table sharing, so
> installing the marker will be visible to everyone using the shared PMD
> table, which is wrong as UFFDIO_POISON must stay local to the process.
> 
> To fix it, make uffd_disable_huge_pmd_share() cover VM_UFFD_MISSING as
> well. With missing mode covered, hugetlb PMD sharing is disabled for all
> userfaultfd registered VMAs, so the helper can simply return whether the
> VMA has a userfaultfd context instead of testing individual UFFD mode
> flags. Add a debug check on the marker installation path.
> 
> The existing registration path will then unshare PMD tables, and
> subsequent faults will not share them while the mapping remains
> registered.
> 
> The alternative would be to unshare PMD tables selectively when
> installing poison markers, which results in way more complexity. Or
> alternatively, simply failing the marker installation, which might break
> some use cases.
> 
> This also disables PMD sharing for userfaultfd registrations that never
> use UFFDIO_POISON.
> 
> Suggested-by: Li Zhe <lizhe.67@bytedance.com>
> Suggested-by: Mike Rapoport <rppt@kernel.org>
> Fixes: 8a13897fb0da ("mm: userfaultfd: support UFFDIO_POISON for hugetlbfs")
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> Signed-off-by: Li Zhe <lizhe.67@bytedance.com>

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  include/linux/userfaultfd_k.h | 16 +++-------------
>  mm/hugetlb.c                  |  1 +
>  2 files changed, 4 insertions(+), 13 deletions(-)

-- 
Sincerely yours,
Mike.
