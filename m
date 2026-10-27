Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793106271;
	b=3jkTfsXnEH07USqlWhYXW0pwGDKEVvw70u0WIJozZr/4FXxGMjCKTUDoNaG2iZ1Eeis7
	 j49c56nWF1dm/gn8aOYvFOOjzlJnK4ojKVEa1/mIPnE8Pt0HP5mURF28hfSqLkhJzsmOS
	 OjUXQJ/f8H20Ggw2jE/nsw9b461Bi0yikSoFQO0eRIe9YhqhNdG0HQ0VO3SQpiOuvWfJf
	 jJg1lJoBLwvadVRATL6+aZlm95GK9K+9aiW8XOO0vB8lyd9UxpvTLMV1xjlPhxqMBY/os
	 PF04TEJAfvx080MAUHOl0Jaq3NE8mXhLArlg9lcUecibFrF4BA7tXCTKxSalMZNDShw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793106271;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=gC/pRsYim10huITDmGzR2CXBohnwZSkq49YKoF5hze4=;
	b=HJjFYU+zHgqJ1z3T5T1DEyAuSTFktr5etVLwdzbaghNTZUb8UOBQBBnpYNPi2FWG9mpj
	 n3ePOqRjPnfQ+6bpsRD+K71gNLHhcDwNkB0F2xXmjPDhFHBQU/229GOTkeMuCinswLlUC
	 ZkRRgTmK4PAU4xstemGNZbtjl5vByX9B2hS7sqjzZdwHJt4RNZWGyXwTAac4NXBlHzKZq
	 EULAT0+wO80KrSjQrFFRVkpTsMUfVb56zbGjwn/o9O2l13Xz9k4/A/RsnlIvjaDV/DQD0
	 Zt7cdnDujB7Wrhx1+7r5wI7mW2g3po+rL8xZRx6wE9ToVD+iKifEUG4FBpmlXDHQ8zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=S0As18FZ;
	arc=none smtp.remote-ip=115.124.30.101
Received: from out30-101.freemail.mail.aliyun.com (out30-101.freemail.mail.aliyun.com [115.124.30.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4BC606A329
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:04:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B4BC606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=S0As18FZ
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793106261; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=gC/pRsYim10huITDmGzR2CXBohnwZSkq49YKoF5hze4=;
	b=S0As18FZ/hCrwCz6Nf0dMAPNwprg+Y16WkKFBHkpkumUDtRAOgfqQXmUQoTAognKIFplYW9Ll//nrsdApBd+cpW9p2OzA2Ao3/mrE4A6vjOnCWTAyZrX0V8oDSodrITirf6g6r3kwo8/Vt4TYVaQANfjzapEYCkAucXYt5lpldo=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R761e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=14;SR=0;TI=SMTPD_---0XDdo7mv_1793106258;
Received: from 30.74.144.191(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XDdo7mv_1793106258 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 27 Oct 2026 21:04:19 +0800
Message-ID: <2890601a-e842-4321-94e9-673df94c97a3@linux.alibaba.com>
Date: Tue, 27 Oct 2026 21:04:17 +0800
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
To: "David Hildenbrand (Arm)" <david@kernel.org>, akpm@linux-foundation.org
Cc: ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, qi.zheng@linux.dev, jack@suse.cz,
 pfalcato@suse.de, ayushr@modal.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <d7f009c90b11ded86654885b5ebcb8c9308fa31a.1793067441.git.baolin.wang@linux.alibaba.com>
 <2ba579e8-06fb-41f5-9eb2-f02b2aabe29b@kernel.org>
 <87e32afd-75de-4407-8f0c-fb70b40d5eca@linux.alibaba.com>
 <81ee2c92-f342-4f7f-aacd-d9558e67a980@kernel.org>
 <de0b41fb-4ae2-46a5-afe0-c021134ebba0@linux.alibaba.com>
 <4880d4ff-8486-4e22-9923-bd4f2407b1cb@kernel.org>
 <f41d0720-ca14-4aa3-a2e4-3ba2de3280d0@linux.alibaba.com>
 <3c73fe54-68d8-41f3-8f9f-06c4a1891e01@kernel.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <3c73fe54-68d8-41f3-8f9f-06c4a1891e01@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/27/26 8:53 PM, David Hildenbrand (Arm) wrote:
> On 10/27/26 13:50, Baolin Wang wrote:
>>
>>
>> On 10/27/26 6:55 PM, David Hildenbrand (Arm) wrote:
>>> On 10/27/26 11:35, Baolin Wang wrote:
>>>>
>>>>
>>>>
>>>> Sure.
>>>>
>>>>
>>>> IMHO, I'm not a big fan of adding two pmd_none() checks just to avoid an
>>>> uncommon concurrent sync.
>>>
>>> It's what we already had. We had to: one for handling pmd_none() directly and
>>> one for handling zapping while splitting (file THPs).
>>>
>>> We just managed to let the second also handle the final piece of the former.
>>>
>>> Anyhow, let's get this fixed.
>>>
>>> If you think the code is clearer your way (where I disagree)
>>
>> Fair enough. Though I have a different taste, I'd still like to make the
>> maintainer happy.
> 
> Don't worry, it's hard to make me unhappy :)
> 
> (just a bit overloaded right now)
> 
>> I'll send out v6 tomorrow following your suggestion.
>>
> 
> That looks good. 

Thanks.

> Are you planning on following up with the memory barrier
> optimization for smaller folios?

If I can find some time, though I have quite a few pending TODOs now :). 
I don't think this is urgent, so if no one else picks it up, I'll add it 
to my TODO list.

> I hope below doesn't end up in some performance degradation.

This is not a common case, so I think it's fine.
