Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B61A46D55A
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 10:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791196196; cv=none; b=If4847XRZeXQ0xvoNUg9TvR5uOwAglssUszn8lve/tOW4bTh4PLZJUncevENaP31Gc8dEUhFvem2YWfNbfJ7M/OC64HnMXIvtqdWhZuL3FHCzEsI47Md0Rly78r3QUja9HHfPDSHPkJhxdwxUXoIo/4pC8olJ/ID5Xd+SZcN2UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791196196; c=relaxed/simple;
	bh=gonOtgwHxhyrgcsNLHiH+1JD8Uk7YI+9+146Ie/Eno8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nwDAyuR/5Z18099ehHXTV+URGaUtuj1askb414bp484M/jGV8Y2aSz7vqUzm5LwkPfukuWuyYNs5JUBI9KsBTVEdQzV2Uw3in13FRrce0kVn+quvICTzBu1X4QSP/erNBoUWzXa8WtCoTS2SeuS9KcUaQYwWMhfFxsgiauZxgEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DNQAufO1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DNQAufO1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA3FB1F000FF;
	Mon,  5 Oct 2026 10:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791196194;
	bh=+4EBiRglyhJAEZs7meWIg1gAIPLsVdJjKbMSKscHBro=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=DNQAufO12IvokR0ikNWlVFIiZQ28kRtWZnnTYray9D//Sg70spgwiNcT/8OgxX+dF
	 hJbSK1gWIg1tq+qOrXfkbLbviPy/U6giQVGc4tqkWTz7o/KwXXZUJpbVFIg0/f10Uj
	 AEEgmnNpbk85mKs2SPIR5VPUB02PPXmewo4KgyAOPh+ijS4uD19AdFWandppC32WmC
	 4xjvYCQA/31WeRq8PychtqmYoZ2NnbNSOA1U+D1tJjaoFccTai6ctoJwQoUFS7IgDN
	 uAsmTEPqD4bAoYP4mod71PJ4H5AhWkhtfRsvDcDXYxngn9ODrHmGfXhmGw2as+gcGk
	 oIz/AdhUh+Ecg==
Message-ID: <645204ff-6c50-4ef3-9070-78ac602560b1@kernel.org>
Date: Mon, 5 Oct 2026 12:29:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mm/gup: document unlocked invariant in
 fixup_user_fault
To: Nguyen Duy Nhat Anh <neganhat@gmail.com>, akpm@linux-foundation.org
Cc: jgg@ziepe.ca, jhubbard@nvidia.com, peterx@redhat.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20261004125601.c06953a6f0660df9859b0c2a@linux-foundation.org>
 <20261005093756.22709-1-neganhat@gmail.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20261005093756.22709-1-neganhat@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/5/26 11:37, Nguyen Duy Nhat Anh wrote:
> Static analysis tools flag potential NULL pointer
> dereferences of 'unlocked' in fixup_user_fault() when handling
> VM_FAULT_COMPLETED or VM_FAULT_RETRY.
> 
> These warnings are false positives. 'unlocked' is only dereferenced when
> handle_mm_fault() returns VM_FAULT_COMPLETED or VM_FAULT_RETRY. Both of
> these return codes require FAULT_FLAG_ALLOW_RETRY to be set in
> fault_flags, which fixup_user_fault() only sets if 'unlocked' is non-NULL
> upon entry. Therefore, if 'unlocked' is NULL, the control flow branches
> that dereference 'unlocked' are unreachable.
> 
> However, this part of the code is subtle and can trip up
> contributors or automated tools. Document this invariant with a comment
> above 'if (unlocked)' where fault_flags is constructed, explaining why
> omitting FAULT_FLAG_ALLOW_RETRY guarantees 'unlocked' will not be
> dereferenced later in the fault recovery loop.
> 
> Suggested-by: Andrew Morton <akpm@linux-foundation.org>
> Signed-off-by: Nguyen Duy Nhat Anh <neganhat@gmail.com>
> ---
> v1: https://lore.kernel.org/linux-mm/20261003194846.205918-1-neganhat@gmail.com/
> 
> v2 changes:
> - Instead of adding runtime NULL checks at dereference sites,
>   document the FAULT_FLAG_ALLOW_RETRY invariant above if (unlocked).
> ---
>  mm/gup.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/mm/gup.c b/mm/gup.c
> index eb898ea1ee22..58fa75441da1 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -1570,6 +1570,12 @@ int fixup_user_fault(struct mm_struct *mm,
>  
>  	address = untagged_addr_remote(mm, address);
>  
> +	/*
> +	 * If the caller passes 'unlocked' as NULL, FAULT_FLAG_ALLOW_RETRY is omitted.
> +	 * This guarantees handle_mm_fault() will never drop the lock or
> +	 * return VM_FAULT_COMPLETED / VM_FAULT_RETRY, making subsequent
> +	 * dereferences of 'unlocked' unreachable when NULL.
> +	 */
>  	if (unlocked)
>  		fault_flags |= FAULT_FLAG_ALLOW_RETRY | FAULT_FLAG_KILLABLE;
>  

For which audience is the comment targeted? For people that know what they are
doing? No.

For tools that report such problems? No.

So I don't think this (4 lines of comment) is the right way to improve this.

-- 
Cheers,

David
