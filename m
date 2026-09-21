Received: from mta0.migadu.com (out-192.mta0.migadu.com [91.218.175.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50FE35C698
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.192
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789994792; cv=none; b=opdwZoQV/Sq8qEz6kyxUC9sTyAaiOn8+QMd9LLd6PnzzUidoZaAw/yGDu4BuSuPFXOBFzsujITxDjfOvUu4In13xotF5V6Pkrgf+ZTCr0f0tsj06Uty6QJpjuyzTd2+B1m1pdKYp/uRId3yKLWPNOpQXnWQCITxxlmvKWgnmU+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789994792; c=relaxed/simple;
	bh=LLPYJqhe9zU7AnAPCVJgKLTWemu4LRRS+WljudQLQgk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=krJ6Ffn7C7T4DQ3w2hzrKxcLBpwCeX+IeV+CkD6AHiunbxfV9pufwVZyMrCl5scCFCa34jNj5/8RTiifZNx92YT5TJy85lMt4n7p1Ah3XpoBaQUz8dV2a8dSJjwCr6diYvOuKf168/Wch3fP4AU4zgK6MrTnbjhnTktDqL3J5rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=fzm8hP0H; arc=none smtp.client-ip=91.218.175.192
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="fzm8hP0H"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=LLPYJqhe9zU7AnAPCVJgKLTWemu4LRRS+WljudQLQgk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789994787; v=1; x=1790599587;
 b=fzm8hP0HmWpaKNbMtVUqf9Z+SibovRajebPfJw4AWzdamM1oWHa+y4lsvZS/5I1Hdnze7pJ8
 fRcQnT0uJwJGZQ6NE4jKckOuWRSUtTq/RRJiD7CZkiw4yXNauSRF3gWzhThme/5PWeQ+izuXH4P
 a5o4ZhnHYBDlv4+2JG40pL3A=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 24ca413fc12d1e0d;
	Mon, 21 Sep 2026 12:46:17 +0000
X-Mizu-Trace-ID: 24ca413fc12d1e0d
X-Migadu-Flow: FLOW_OUT
Message-ID: <f27df91d-441b-4b40-abce-ff786b8c89e4@linux.dev>
Date: Mon, 21 Sep 2026 20:46:10 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] mm/gup: honour FOLL_PIN in NOMMU
 __get_user_pages_locked()
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-mm@kvack.org, Jason Gunthorpe <jgg@ziepe.ca>,
 John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org,
 Peter Xu <peterx@redhat.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>
References: <20260921-nommu_gup_pin-v4-1-c410041cc479@kernel.org>
Content-Language: en-US
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <20260921-nommu_gup_pin-v4-1-c410041cc479@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2026/9/21 17:57, David Hildenbrand (Arm) wrote:
> From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> The !CONFIG_MMU implementation of __get_user_pages_locked() takes a bare
> get_page() reference for each page regardless of foll_flags:
> 	if (pages[i])
> 		get_page(pages[i]);
> 
> This is reached from pin_user_pages*() with FOLL_PIN set.
> unpin_user_page() is shared between MMU and NOMMU configurations and
> unconditionally calls gup_put_folio(..., FOLL_PIN), which subtracts
> GUP_PIN_COUNTING_BIAS (1024) from the folio refcount.
> 
> This means that pin adds 1, and then unpin will subtract 1024.
> 
> If a user maps a page (refcount 1), registers it 1023 times as an
> io_uring fixed buffer (1023 pin_user_pages calls -> refcount 1024), then
> unregisters: the first unpin_user_page subtracts 1024, refcount hits 0,
> the page is freed and returned to the buddy allocator.  The remaining
> 1022 unpins write into whatever was reallocated, and the user's VMA
> still maps the freed page (NOMMU has no MMU to invalidate it).
> Reallocating the page for an io_uring pbuf_ring then lets userspace
> corrupt the new owner's data through the stale mapping.
> 
> Use try_grab_folio() which adds GUP_PIN_COUNTING_BIAS for FOLL_PIN and 1
> for FOLL_GET, mirroring the CONFIG_MMU path so pin and unpin are
> symmetric. Keep supporting the traditional behavior where users specify
> a pages array but don't set FOLL_GET.
> 
> While at it, don't return NULL pointers in the page array,
> as this is really not expected for GUP users; instead, just fail and return
> -EFAULT.
> 
> [ david: support traditional behavior with no FOLL_GET, extend
>    description ]
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: David Hildenbrand <david@kernel.org>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: John Hubbard <jhubbard@nvidia.com>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Lance Yang <lance.yang@linux.dev>
> Reported-by: Anthropic
> Fixes: 3faa52c03f44 ("mm/gup: track FOLL_PIN pages")
> Assisted-by: gkh_clanker_t1000
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> ---

Tested-by: Lance Yang <lance.yang@linux.dev>
