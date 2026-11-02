Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793628096;
	b=kx49ZdLfka+zNvVkzUfBN+FfVY44oZROhPEOhOd0X15Uj+wY6A7rU9OlcnwDMdtuWY8/
	 8UI6MA5OjNApPj5EZztkZ8HdxOtFC8vVXvIsu9VeLM/FTQpCNY3jYeU97s9wd+4nHrJ8R
	 TYWjuruWw4op6LkM/8lMwD2YC3RBjxG87VqiBQ+8hJj3HbgX+aHS1XdbXES9sbp2hRjir
	 rVxMaW0mnPhCXEEVTutoLyszK15GdSmmAA9oMGm8D48ylf4mq6+Olh22Dm0uLxrX7a60C
	 g0sby67xoGMY5VKBlSZ7Uo6GwO1cVN6zM5zbJ4omavlBnmoDukEOiTkZlNPGTBrcskQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793628096;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=/4jCg+TTQrWpSE1q7lJqNXq5XMu5l0cl2OjYGJlIyOU=;
	b=0mNGkArqZBUZh+eDrgmttseAER051nXyhLyuqfqnjIB/SfmJvNEm9Rk7GrWAXRVrqZSW
	 Ots+V+D2lumvWkfabKNMZWzlTR8y6cqRH2zabRl4Jo5jeZ0OWLYafSrYZdHc/+gt5Zcbv
	 8QbSvgVaMEWll9coLa3aIq2z4UaJPThVO8vDGbfMK2QOQC05xndCJKjJLi+WyPmokr3yZ
	 yKpCyauUiVlADwKDIwCg3BX8Yd3SFqbhuHRU6zQwQWzicM9XwkegEft/sysOTBckBabOC
	 iNlft5HJg44RlmhLiGQY9kz0+td9EJUrQ/riJFD8LrdHOekKvu6DirRJGkwUh6eWuJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DmLoqufh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB8A606A329
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DmLoqufh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED6C11F00A16;
	Mon,  2 Nov 2026 14:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793628095;
	bh=/4jCg+TTQrWpSE1q7lJqNXq5XMu5l0cl2OjYGJlIyOU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=DmLoqufh5ELvUtwkp16bb3dfV/76wbXROsCb9umDoBk9hrhWX4KYAFT3U90MNfd6j
	 QIZXeVHMciHfCyNLQ60O4srl4nbQTrObsESoVEa5mJkkfRYoNcTexedD8Sd+QbhDcK
	 CW1rTA32yFqdPg2KpZoNLbp2D38A3ve6nLhvNaxa0HADHZ1qf82D5q5mkSVvlZbL4Y
	 9C4fAj2qYzenhrIbR6hfJiMkV7vUtCe/txvO/sz44N35ekAS5DgsUZj/JWbeoUats8
	 zwS3pHOKtyCEjvyyQF3hCPvOOo3a5kBo2XY0BBlR0VZtFqiYBvRvRKuk8v/lDJJuGx
	 2Yli94T3W7h5A==
Message-ID: <9a67e7f6-0ec6-414d-8689-c70eeed6100c@kernel.org>
Date: Mon, 2 Nov 2026 15:01:30 +0100
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
Subject: Re: [PATCH v2 2/4] mm: internal: fix inconsistent in
 folio_pte_batch_flags() for shadow stack
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Lorenzo Stoakes <ljs@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Andrew Morton <akpm@linux-foundation.org>,
 Rik van Riel <riel@surriel.com>, Yuan-Hao Hsu <aa9736195201@gmail.com>
References: <20261102-refactor_gup_fast-v2-0-bc1ac018c834@arm.com>
 <20261102-refactor_gup_fast-v2-2-bc1ac018c834@arm.com>
 <85c4a87b-2c8b-4ef5-bb30-6518080f8be0@kernel.org>
 <auiI8jzumVHmmSV9@e129823.arm.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <auiI8jzumVHmmSV9@e129823.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

>>> +		if (unlikely((flags & (FPB_RESPECT_WRITE | FPB_RESPECT_DIRTY)) == FPB_RESPECT_WRITE &&
>>> +			     writable != !!pte_write(pte)))
>>
>> It might be nicer and more efficient to track if any was readonly/not-writable and
>>
>> 	any_unwritable = !pte_write(pte);
>>
>> And checking once after the loop.
> 
> Sorry. But I couldn't follow. If we accumalate with any_unwritable
> and check it out of loop once only, we couldn't properly nr value or
> Am I missing something?

Ah. The idea was to simply reject the batch entirely if that happens. It would
only matter if some folio PTEs are writable while others are not ... well, ok,
there are some cases where that can happen, but it's not really the common case.

I think we should simply disallow ever getting large folios into shadow stack
VMAs for now. So I'd prefer the fix below.

Thoughts?

>>
>> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
>> index 4b71d010b2aff..9a2dc90ef9690 100644
>> --- a/mm/khugepaged.c
>> +++ b/mm/khugepaged.c
>> @@ -367,6 +367,9 @@ int hugepage_madvise(struct vm_area_struct *vma,
>>  {
>>         switch (advice) {
>>         case MADV_HUGEPAGE:
>> +               /* PTE batching doesn't work reliably. */
>> +               if (vma_test_single_mask(vma, VMA_SHADOW_STACK))
>> +                       break;
>>                 *vm_flags &= ~VM_NOHUGEPAGE;
>>                 *vm_flags |= VM_HUGEPAGE;
>>                 break;
>>
> 
> Yeap. once we do this, we don't need to this fix patch anyway.
> But I don't know whether there is practical case changing the
> VMA_SHADOW_STACK with huge though it is initailised with NOHUGE.



-- 
Cheers,

David
