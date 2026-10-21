Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.113
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792568777;
	b=x1xJfoZNHmHaKvdblNcLgZHcwAnBoOLQDJJd9pySnmh05khvGw6EYhIaUUwzeU/OB2BV
	 J7H0CPn3bTGoQsXsWniHFs6megsT9hA4q9PmO3jcrP8jCQrWK7gIoAqw3GE+REo33gJM3
	 aseTdQg/ZihOBuP+fdFOZ/2mQWlMLzfnuriZWQGrLQ4HLt+UPy4of3WhdIQQnRGADDFoy
	 qTw52e1MDkebH4pnAacHtvvZAcgS3wJtqa7PLb767gZLX3EGSPOWrGdNKNXZyPp7+9BnC
	 MhNxeaeFItDJZMOAbHd6vNdoUZynG0KU7GzJhBNTiPq46G5qmHIDwPYRnppr3zdScOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792568777;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=UsgCJpn8EzeKkLQx/vx3qRMApsmab4c/NyjKdecWpLQ=;
	b=cR6LmpaT6t40kE1AjUwER4Aj/dTqYmpkUp9PsClJWi9gFmTavdF87wSk2U03teWSHl0x
	 fqRiYU42bdVGcdcLnLC9U1qB3Xc3mK3AXF3RSSkRf56BxD/C3Bi0oXqn+rX4OwS1tfAoh
	 YKDmsgKpHBtXe/i999TnW2KNgh2tDAaqBeda+N2f2frIwZVFeyrk2vLSEP5Jkhb3tHvDV
	 vb4MdPA6K7dTO69EwptJE87kYZ9exPlNL6c5aGVl/PaULtD4s8yqJWGT8BKY/9VountuD
	 YAJ+Zw2A2HUSaa6LZhcMBrXhhb5zIGjs8nh8JWBk3YjRF7k90++kEOIdY0KsqzyfzTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=I4S0VgX+;
	arc=none smtp.remote-ip=115.124.30.113
Received: from out30-113.freemail.mail.aliyun.com (out30-113.freemail.mail.aliyun.com [115.124.30.113])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635E3606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:46:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 635E3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=I4S0VgX+
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1792568768; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=UsgCJpn8EzeKkLQx/vx3qRMApsmab4c/NyjKdecWpLQ=;
	b=I4S0VgX+B4S8K2ZQug0xISTgyESpPXjcRfjQjsv+qSl9SQ65ln9rIF+Sd5F3s5r+u1u0I4+VwB5goLNoZ4Q+1bWt+6VfZZuuN8fa+If7EdnNtIekhONwHp3FUus6E0ZjYtnvE1re1GuBqH6jnunllDu6PZpeU3YRORbrjHka/hk=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=14;SR=0;TI=SMTPD_---0XDFhPZN_1792568765;
Received: from 30.74.144.135(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XDFhPZN_1792568765 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 21 Oct 2026 15:46:06 +0800
Message-ID: <6462de1a-b141-4f20-94a8-973708a71ba2@linux.alibaba.com>
Date: Wed, 21 Oct 2026 15:46:05 +0800
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
Subject: Re: [PATCH v2] mm: memory: fix truncation removing mapped folios
To: "David Hildenbrand (Arm)" <david@kernel.org>, akpm@linux-foundation.org
Cc: ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, qi.zheng@linux.dev, jack@suse.cz,
 pfalcato@suse.de, ayushr@modal.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <542c97482eae84f86704bcee56482633d1b32321.1791616645.git.baolin.wang@linux.alibaba.com>
 <8245424a-f068-4be5-9e58-713cbff1f8ae@kernel.org>
 <405811f5-ee36-4b3c-80d0-7dc6827ab5d4@linux.alibaba.com>
 <6660d3bb-3485-4c34-8734-3ea99df920f1@kernel.org>
 <02c9a968-92e2-49e2-bffc-74d264a5c911@linux.alibaba.com>
 <f7735584-e020-4ee1-8afb-2b5d580cfa49@kernel.org>
 <b1a9b500-0ddc-4791-9e1f-00087e367426@linux.alibaba.com>
 <938e215b-a2fd-4f1a-b4c5-e46b8af0f00b@kernel.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <938e215b-a2fd-4f1a-b4c5-e46b8af0f00b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 10/20/26 4:36 PM, David Hildenbrand (Arm) wrote:
>>>>                   if (pmd_none(*pmd)) {
>>>> +                       if (details && details->single_folio)
>>>> +                               sync_with_folio_pmd_zap(tlb->mm, pmd);
>>>>                           addr = next;
>>>>                           continue;
>>>>                   }
>>>
>>> We do have another sync_with_folio_pmd_zap() user in page_vma_mapped_walk(),
>>> does that one need care as well?
>>
>> Good point. But I don't want to add page_vma_mapped_walk() changes into this fix
>> patch. I need to analyze all callers of page_vma_mapped_walk() and the potential
>> races. I'll look into whether it should be changed in a follow-up patch.
> 
> Yes, please have a look. I am 99.9% sure that we face the exact same issue there
> as well.

Sure. Add it to my TODO list.

BTW, could you take a look at my reply to your concern about v3 when you 
feel free? Thanks.

https://lore.kernel.org/all/179c26ed-1764-4e5b-a7ee-047ddabbfea1@linux.alibaba.com/
