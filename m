Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792491076;
	b=0sU/orHGYk++dF+9m3ptYxNKClFf7uQwnK1Y/FxE15slTX1d2yxSVqrgkmZxaT9MoYoq
	 RHSNfo+YsASbQeK4pIvvO6Pi//foDQMPTgXi65qL/z0ZNnIpisFDg9y4y+Jce/bQ8Vlk5
	 S+Zf2EIB4x/si8fjfquvvigEPvy974X33ZQ8suS/E7QIVIyDgJGVK9Ics2jM5M7RCRqxq
	 1R6FxL5kzx5ruhS7QEJrTnA/DNqmvtKcVuCUPSlfI6yCfzYCjk6iAQGRCgPJp7qoYWjRT
	 NDzXEz6xFmtEgvynUoa8uclaH424BU0Q1iSzas1KxtlyHKSMhqI2N3XYj+CgJDWoSNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792491076;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=UXWZ7sEhNUwUZK56UTebBPaHPaOPjNo4jUMgFuCuhHM=;
	b=gGxq2VshTm1xFiq7nrYZ3aRI9mB8lhooHZ4QY3khZoZtKmeQbklh+rEnsUx2MpIatv8b
	 BsLb+ltd8y1jvURlFTX3fDiQAq3yXvEOPUvGeXxLjfg7EFcF5N6ESeXr8XUp5MuPAqcAv
	 iACfJ/a3nzt59SSp0lB2DBaARWvIwc3oRXD2CKmJ01p0Ibiq/5yXVZDaQUWhXI+D0geOb
	 dz2lvS1KsLn/KbBahGslJ24/70WoOcTqIQmrVeQUZraxhy76M7PQyc6ckamaHc2CvRhr3
	 RyItGp2P5Z66x9zuJ1rcJwGgAqbhxqxdkZXN4Dtuuq7Po5+uOc0dRo8nQQK7/a92p7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=atEks0sw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFB160A2604
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=atEks0sw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0D131F000C5;
	Tue, 20 Oct 2026 10:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792491075;
	bh=UXWZ7sEhNUwUZK56UTebBPaHPaOPjNo4jUMgFuCuhHM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=atEks0sw233tV9WrSZ1An/64slEa4IYaTtsXzU0njX5GdPsbEsdRj/BTYZT8yEPpf
	 5woYJdrsvZYVgJKYQkIY3Occ46yi1VBTXQJmIv13UYexi1B/3XFi3XrBRaCftte7Kb
	 krCcz0amLp1lA+z6CaI8/4DmLsUK73JkZ9H16/BhmXWjOQ5Wtz5ynTDAOrxFriMw1J
	 yHgYWUFgczmB8aPYNmhevH53Vaj9HZjk5IJmFNhcBLNRfTwO0PRDXiGxUk3TmvoclV
	 4bqCYkvis8Y/EF/zNMGBh1Gd0U4F/cP5f/xiBNMXEoHDrocKaE6xcDLG4xeYQ01tGD
	 kmJXQhBvI+WVA==
Date: Tue, 20 Oct 2026 13:11:09 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Li Zhe <lizhe.67@bytedance.com>
Cc: muchun.song@linux.dev, osalvador@suse.de, david@kernel.org,
	akpm@linux-foundation.org, peterx@redhat.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 2/3] mm/hugetlb: disable PMD sharing for UFFD missing
 mode
Message-ID: <atc-PW2PirXZzNZh@kernel.org>
References: <20261019113034.97690-1-lizhe.67@bytedance.com>
 <20261019113034.97690-3-lizhe.67@bytedance.com>
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
In-Reply-To: <20261019113034.97690-3-lizhe.67@bytedance.com>

On Mon, Oct 19, 2026 at 07:30:33PM +0800, Li Zhe wrote:
> From: "David Hildenbrand (Arm)" <david@kernel.org>
> 
> For UFFDIO_POISON to install a poison marker in a hugetlb mapping, it is
> sufficient to have the VMA registered for missing mode.
> 
> However, UFFD missing mode does currently not block PMD table sharing, so
> installing the marker will be visible to everyone using the shared PMD
> table, which is wrong as UFFDIO_POISON must stay local to the process.
> 
> To fix it, include VM_UFFD_MISSING in uffd_disable_huge_pmd_share(). Add
> a debug check on the marker installation path.
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
> This effectively disables PMD sharing for missing-mode registrations
> that never use UFFDIO_POISON.
> 
> Suggested-by: Li Zhe <lizhe.67@bytedance.com>
> Fixes: 8a13897fb0da ("mm: userfaultfd: support UFFDIO_POISON for hugetlbfs")
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
> ---
>  include/linux/userfaultfd_k.h | 13 +++++++++----
>  mm/hugetlb.c                  |  1 +
>  2 files changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/include/linux/userfaultfd_k.h b/include/linux/userfaultfd_k.h
> index a4351cffc60c..fe78ba14dc68 100644
> --- a/include/linux/userfaultfd_k.h
> +++ b/include/linux/userfaultfd_k.h
> @@ -169,7 +169,10 @@ static inline bool is_mergeable_vm_userfaultfd_ctx(struct vm_area_struct *vma,
>  }
>  
>  /*
> - * Never enable huge pmd sharing on some uffd registered vmas:
> + * Never enable huge pmd sharing on the following VMAs:
> + *
> + * - VM_UFFD_MISSING VMAs, because UFFDIO_POISON may install markers and we
> + *   want PMD tables to be unshared when installing these markers already.
>   *
>   * - VM_UFFD_WP and VM_UFFD_RWP VMAs, because the write protect / access
>   *   tracking information is per pgtable entry.
> @@ -182,9 +185,11 @@ static inline bool is_mergeable_vm_userfaultfd_ctx(struct vm_area_struct *vma,
>   */
>  static inline bool uffd_disable_huge_pmd_share(struct vm_area_struct *vma)
>  {
> -	return vma_test_any_mask(vma,
> -		mk_vma_flags_from_masks(VMA_UFFD_WP, VMA_UFFD_RWP,
> -					VMA_UFFD_MINOR));
> +	const vma_flags_t uffd_flags =
> +		mk_vma_flags_from_masks(VMA_UFFD_MISSING, VMA_UFFD_WP,
> +					VMA_UFFD_RWP, VMA_UFFD_MINOR);

Since this essentially disable pmd sharing for any uffd mode, maybe replace
the flags check with the check for non-NULL userfaultfd_ctx?

> +
> +	return vma_test_any_mask(vma, uffd_flags);
>  }
>  
>  /*
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 2c64ca985dfa..fdd65e019a55 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -6304,6 +6304,7 @@ int hugetlb_mfill_atomic_pte(pte_t *dst_pte,
>  			return -EEXIST;
>  		}
>  
> +		VM_WARN_ON_ONCE(size == PMD_SIZE && hugetlb_pmd_shared(dst_pte));
>  		_dst_pte = make_pte_marker(PTE_MARKER_POISONED);
>  		set_huge_pte_at(dst_mm, dst_addr, dst_pte, _dst_pte, size);
>  
> -- 
> 2.20.1

-- 
Sincerely yours,
Mike.
