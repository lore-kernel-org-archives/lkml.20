Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098525;
	b=4ocfH/rdpmfQZ4sMNHNIV7run4H4guLxBlJlo2avx69bisLcdFbF+4BfaqteBuGaUpDw
	 HJm8c2DRpoFp0hh40uJGbuPenU+GBkL3YXDT8R5g3mLjwrwcbJwojTw/hNsXFgzLZ3ifw
	 /CqMgBauqygIoQhNNaIVZQ4ow2V8oIEUYwc0JpNN6newYigjRPl+Os24l5z3r0fIx8Y54
	 z5vhNZjzK0g/ijolB3V36gWrJx9INOHGA9QfARHi+u2Z/hM3xYKca5KYm0o7bTGSVd8KG
	 QDbkpFwJ0HARP/ZOSrxP7dh/YsI5uHHhQ8d0j6o+ML+THXJagfyhtKLICY2QfXRO+HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098525;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=KSYNlk1vrIqYfXvBLmpXdMfI/hXk2JFXizFsWkelTU0=;
	b=f4fRYWP3gsB/E6ay77uKrSTpT2rwC9Yzamkws4Y5koK22kYnVc5IzX/LpPBEsEENwCVQ
	 KYjfi4eFg3OmF4qpYRhyMAdD2TpdmmM6K0MxwwCHU86DEOoq5gqhNLrS7Gbx6mVnly8/H
	 cDx2/VpBqcdP0iEiM7Q5T//FmojHQ0vzNQwphjtmQLCZNU7oHqTHamyLIZQbf8ri1OO4z
	 4Qi994thDV4Who1AgKCP54P6m3vAPRnfCshzNSr2W3TTk/0tH2WCnuxAqeZzg1dBErN/2
	 /UbBgi1cj+FWjNC+CTBnrQLCndL6/g8VNX6UYhGW+tBLJflxO3Kap2y8p4aejTvlxhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A71Wv5AZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C8D606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A71Wv5AZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 964C01F01200;
	Tue, 27 Oct 2026 10:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793098524;
	bh=KSYNlk1vrIqYfXvBLmpXdMfI/hXk2JFXizFsWkelTU0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=A71Wv5AZazOmIoVQtueJ4DQLL5CTqsTdM+j+SrXsZ1clVEyJr5xbQQ66YCyOSVYDH
	 JtuBTZwaNQ33zYRXHal0SB7Zc83ReSFDTZXAAjPieluhBzi/79/oGCj514CT1zZYTU
	 9Nt6kq92oub7HlVwzmjQ6Kjx7xjX1s+uk++Tyv1yBKvewLWSUeOYWvCVUQZP/8QBV3
	 q4VuhbzVNvdegyvMNhtTPDy8klbF0PJfo9KJLV4oTGSGqrat2VD2QMBKcn7YT95Yog
	 bTovG/3t01iGADpEG7618RJWul2KjoimFfpYFDswE8IPSclnqek7WjVmzGkAlABBlr
	 uwR6Ie1oelzVA==
Message-ID: <4880d4ff-8486-4e22-9923-bd4f2407b1cb@kernel.org>
Date: Tue, 27 Oct 2026 11:55:18 +0100
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
Subject: Re: [PATCH v5] mm: memory: fix truncation removing mapped folios
To: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org
Cc: ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, qi.zheng@linux.dev, jack@suse.cz,
 pfalcato@suse.de, ayushr@modal.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <d7f009c90b11ded86654885b5ebcb8c9308fa31a.1793067441.git.baolin.wang@linux.alibaba.com>
 <2ba579e8-06fb-41f5-9eb2-f02b2aabe29b@kernel.org>
 <87e32afd-75de-4407-8f0c-fb70b40d5eca@linux.alibaba.com>
 <81ee2c92-f342-4f7f-aacd-d9558e67a980@kernel.org>
 <de0b41fb-4ae2-46a5-afe0-c021134ebba0@linux.alibaba.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <de0b41fb-4ae2-46a5-afe0-c021134ebba0@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/27/26 11:35, Baolin Wang wrote:
> 
> 
> On 10/27/26 5:33 PM, David Hildenbrand (Arm) wrote:
>> On 10/27/26 10:03, Baolin Wang wrote:
>>>
>>>
>>>
>>> No, keeping two pmd_none() checks cannot fix the race, as I replied before. [1]
>>>
>>
>> Best to wait to submit new versions if there are open discussions? Because now
>> we have the same discussion in two places.
> 
> Sure.
> 
>>
>> I think you're right about the race, the issue is that we check for
>> pmd_is_huge(), not pmd_present() which confused me.
>>
>> Clearest to me would be to not drop the second pmd_none() check but move it
>> where it belongs: if splitting zapped the PMD.
>>
>> @@ -2101,13 +2104,15 @@ static inline unsigned long zap_pmd_range(struct
>> mmu_gather *tlb,
>>                                  addr = next;
>>                                  continue;
>>                          }
>> +                       /* We already synchronized with concurrent zapping. */
>> +                       if (pmd_none(*pmd)) {
>> +                               addr = next;
>> +                               continue;
>> +                       }
>>                          /* fall through */
>> -               } else if (details && details->single_folio &&
>> -                          folio_test_pmd_mappable(details->single_folio) &&
>> -                          next - addr == HPAGE_PMD_SIZE && pmd_none(*pmd)) {
>> -                       sync_with_folio_pmd_zap(tlb->mm, pmd);
>> -               }
>> -               if (pmd_none(*pmd)) {
>> +               } else if (pmd_none(*pmd)) {
>> +                       if (details && details->single_folio)
>> +                               sync_with_folio_pmd_zap(tlb->mm, pmd);
>>                          addr = next;
>>                          continue;
>>                  }
> 
> IMHO, I'm not a big fan of adding two pmd_none() checks just to avoid an
> uncommon concurrent sync. 

It's what we already had. We had to: one for handling pmd_none() directly and
one for handling zapping while splitting (file THPs).

We just managed to let the second also handle the final piece of the former.

Anyhow, let's get this fixed.

If you think the code is clearer your way (where I disagree), then keep it as is.

Acked-by: David Hildenbrand (Arm) <david@kernel.org>

-- 
Cheers,

David
