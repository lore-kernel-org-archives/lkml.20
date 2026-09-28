Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648F54B7A46
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 12:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790597043; cv=none; b=XUhgBCxndJp6Ew7x2sC1TgY0bH4Jf10Djao4m+z59k7jjsrI3H81icGJ9c7lJmxN+vhBFnjgVdEhOn25CswLftu0i4gQtREXJirklUW7JS+/c0C4XyBl8bg+KUqaBRhH4V0upcwzXZGD8CjCSCDx8QcFtdlc9XRxwJSckhaxGz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790597043; c=relaxed/simple;
	bh=jy72iasHnfKddlcOYxf+IcRC+lcD4eJn3QGeZClcQb4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hm1O1Mek+XKzs3+EhBqsZB39vbuW9svXopsLULd1bNBKVAg/Qs4Tfgi4ATVAQUSFk7vOFfYPosWN6Y00v72+T5u8lJyTfH2+t30U8TpqNEJittSjJBPc91ZOtc7GhDwTgXUbE6BE1vy2LI6lXMCN0Fo7HKKfDfASBIe/Sz0V1A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fqrf3Z9A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fqrf3Z9A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 277F61F000FF;
	Mon, 28 Sep 2026 12:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790597042;
	bh=l8P10dL4hMXu7vX0PWvRPQhhCrae/q3zz2jG9lav8OI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Fqrf3Z9AmsyYalf4WIQtZIPDGFskCtQzDdeFUQFvnbt0e21AGt/iyUow0pjpj0Bcq
	 ZS3nJaMPUOuGKS2S/SNBSiIP0OEcCr3gNEees9i23odqtTKLLKZxPnhq/XLrfsh74h
	 QuLdyCZgL3fmgASjt4IGH6RtBeetD9G5Is5QdBdLipE0Rs06j6I6z8K/Fd3B2epO7R
	 Ins8DCY161m4xyPwJd97FrtiJXQNyFKZEe3/wlqssvSOPcu3EoqgsLYguzOuMAbbcX
	 6GiJtbJrIZZhZxq8k3OPkYqeU2QgpuGifd5IGeYAKhxUobamdknzGW2rDzjaqWPRCF
	 +3E3AhbIvYiSg==
Message-ID: <abd32250-6ba1-443b-b8e4-7772bcdd325a@kernel.org>
Date: Mon, 28 Sep 2026 14:03:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/12] mm/collapse: declare the collapse interface in
 collapse.h
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, kernel-team@meta.com,
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Usama Arif <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>,
 Jann Horn <jannh@google.com>
References: <20260916093145.4022188-1-kirill@shutemov.name>
 <20260916093145.4022188-12-kirill@shutemov.name>
 <63f49a8b-cabf-4b93-a7e2-76b62c463a90@kernel.org>
 <arU8w9qDCvKod7PO@thinkstation>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <arU8w9qDCvKod7PO@thinkstation>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/24/26 17:22, Kiryl Shutsemau wrote:
> On Wed, Sep 23, 2026 at 03:34:11PM +0200, David Hildenbrand (Arm) wrote:
>> On 9/16/26 11:31, Kiryl Shutsemau wrote:
>>> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
>>>
>>> A collapse takes four calls:
>>>
>>>   - collapse_control_init() - set up the control a caller carries;
>>>   - collapse_scan_pmd() - scan one PTE table, under mmap_lock;
>>>   - collapse_run_pmd() - collapse what the scan found, no mmap_lock;
>>
>> As discussed, having a single collapse_pmd() function might be cleaner if that's
>> easily possible.
> 
> Answered on patch 9: the two calls are the point.
> 
>>>   - collapse_control_release() - done with the control.
>>
>> And as discussed, I hope we can just get rid of a release function that's not
>> actually supposed to release anything right now (unless I was missing an update
>> in one of the patches).
> 
> Will remove in v4.
> 
>>> All four are static in khugepaged.c, as are collapse_possible_orders(),
>>> which says what a VMA allows, and the revalidate a caller needs once a
>>> collapse has given the mmap_lock up.  No other file can ask for a collapse
>>> without them.
>>>
>>> Declare them in collapse.h, with a comment stating the order they are
>>> called in and who holds the lock over each step.  Each function says
>>> what it needs and what it does where it is defined.
>>>
>>> hugepage_vma_revalidate() becomes collapse_vma_revalidate(): it is part of
>>> what a collapse offers now, not a helper of the daemon.
>>
>> Is it just me or is collapse_vma_revalidate() an odd part of this interface?
>>
>> You'd expect a matching function that performs the initial validation on a given
>> vma.
>>
>> Maybe we should have a
>>
>> 	orders = collapse_vma_validate(vma)
>>
>> that really just wraps collapse_possible_orders(), an expose that instead to the
>> collapse users?
>>
>> So they'd use collapse_vma_validate() to then call collapse_vma_revalidate()
>> after temporarily dropping the mmap lock?
> 
> collapse_vma_revalidate() re-checks what the scan ran under: a VMA at
> the address, anonymous if the scan went that way, covering the PMD
> range, allowing this order.
> 
> A collapse_vma_validate() could bundle what the callers check before a
> scan, for the sake of symmetry. Feels like overkill to me.


I much rather have a consistent collapse_* interface than mixing in other weird
functions.

I saw that you already sent a v4 (too fast ...) so I might complain about the
same thing there once more and we'd end up with the same discussion there once
more. Which is expected when people don't wait for replies.

-- 
Cheers,

David
