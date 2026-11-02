Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793622197;
	b=4plPDudy+5TI0kwYbmHGPJ9+LAlfwX7keHQHDc2SgSdUa0SZRqp6pPfFhqOncKkYQR9o
	 mbYS8Ooj4J1YEEOvgzeAHfWWoUXgk+TfvHlZd2fdloaiAFQpU8Oo6sQL3HrjoLLNd3Hgm
	 zCiM44O40zR9vHRxHkpcOjZjrk0g0OtkQ6L93KuNpbf+jk6Zy2c5VRJFeMETo+uWAbait
	 YygtnaYXzrh1HE9Qqq1PaK5JrHxwbIgyuTEaEPtNzRRLpZoJ9g9M3fj2rrMuu86KjydZ0
	 F0v+bAnAGacgiN7jlyF6eUKMg7FLZ9qMrG2DM4DIsv7S/hQ/6rvd5CHVTZ8ecQkLc3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793622197;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=li9rdtwFeFEI907CKymYxoxqt6E52soBIe74zDvChPY=;
	b=SdkwFoU6wXs1qHeJ0eg0nDexpFfEQV3EbLpeDD8JYYSOkbeauPjjWCqLPTOyK9CqovKS
	 hQxgl3j3W67ExnBeju7VWDrq5H1yvAhJUgi5Y4VGoM98qqzcEbXuVneoegv4TzqMBjW57
	 5I/lyJ7aK6bDAvCCgxuntt6tBpi2NGLtu1vhLZjTJKDqAqdm9i/nAw5HVLRE4rBwmeQNS
	 R+mN3ePMpkriLEYHwH+VXcNUNOdDcy+8R+lTWBPFocQYvz2J2Zw/fPWV4P0wF22NpjlTL
	 JlDLxQ1qu5C2EB7E1tuQURO1/r2J8v45YhrPBIofSnKxzwwcM8Rz7bwZ6zrE/nVQfZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sn38Pua9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D582760A383E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sn38Pua9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 935861F00A17;
	Mon,  2 Nov 2026 12:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793622196;
	bh=li9rdtwFeFEI907CKymYxoxqt6E52soBIe74zDvChPY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Sn38Pua9rV7W527YONSvg8EOeoe21NRVadTNMAE+Z3XemtkQsub6vqQfGdkX01x5M
	 MOIhConomswlo1fkXRSOUOFOfSJtqXMvUJqkkGONdlJYve5aowRZzUSPIOzrbYEsTu
	 4rcTL7z2MlBCiHcTLQZFKzKfgB7ISwjtD2TU4IIuUFoLKp6g/B4EeCB2nVJe45jaqB
	 NwcHMAJa2uhvTM2lExWSoiiPkCXLGYNOtsblsQk4zNxZGJiJ9MKwWeiCjRq+aa4MQQ
	 HLywUOptpCxfwl+Sdaba7b2X9BZoWMDpB9gi67UarljvvraX2804Hg/Jsozuojt8BO
	 7xuWawvf1CuoQ==
Message-ID: <bcf69c05-279f-4a2b-a762-3dfb4ce2bb7e@kernel.org>
Date: Mon, 2 Nov 2026 13:23:11 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] mm: internal: introduce FPB_LOCKLESS for
 folio_pte_batch_flags()
To: Yeoreum Yun <yeoreum.yun@arm.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Cc: Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 Peter Xu <peterx@redhat.com>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Andrew Morton <akpm@linux-foundation.org>,
 Rik van Riel <riel@surriel.com>, Yuan-Hao Hsu <aa9736195201@gmail.com>
References: <20261102-refactor_gup_fast-v2-0-bc1ac018c834@arm.com>
 <20261102-refactor_gup_fast-v2-3-bc1ac018c834@arm.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20261102-refactor_gup_fast-v2-3-bc1ac018c834@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/2/26 12:30, Yeoreum Yun wrote:
> From: Yuan-Hao Hsu <aa9736195201@gmail.com>
> 
> Add support for calling folio_pte_batch_flags() in GUP-fast context when we are
> not holding the PT lock. Instead of reading PTEs through ptep_get(), we have to
> use ptep_get_lockless().
> 
> Specify the new behavior through a new flag FPB_LOCKLESS. We'll make use of this
> functionality for batching PTEs in gup_fast_pte_range() next.
> 
> Signed-off-by: Yuan-Hao Hsu <aa9736195201@gmail.com>
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>  mm/internal.h | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/internal.h b/mm/internal.h
> index b4d0df4c35adf..c1824b0193f4d 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -373,6 +373,12 @@ typedef int __bitwise fpb_t;
>   */
>  #define FPB_MERGE_YOUNG_DIRTY		((__force fpb_t)BIT(4))
>  
> +/*
> + * Read the page table entries with ptep_get_lockless(): the caller does not
> + * hold the page table lock (e.g, GUP-fast).
> + */
> +#define FPB_LOCKLESS			((__force fpb_t)BIT(5))
> +
>  static inline pte_t __pte_batch_clear_ignored(pte_t pte, fpb_t flags)
>  {
>  	if (!(flags & FPB_RESPECT_DIRTY))
> @@ -442,7 +448,7 @@ static inline unsigned int folio_pte_batch_flags(struct folio *folio,
>  	ptep = ptep + nr;
>  
>  	while (nr < max_nr) {
> -		pte = ptep_get(ptep);
> +		pte = (flags & FPB_LOCKLESS) ? ptep_get_lockless(ptep) : ptep_get(ptep);
>  
>  		if (!pte_same(__pte_batch_clear_ignored(pte, flags), expected_pte))
>  			break;
> 

Acked-by: David Hildenbrand (Arm) <david@kernel.org>

-- 
Cheers,

David
