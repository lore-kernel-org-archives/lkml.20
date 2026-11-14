Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794660369;
	b=lePowQDy4pqGBFRQ5ZgrFLslI1Ekq/+FM44g3u6lqTh0Mgg80NNFSCQqFP6wa9PQCSsd
	 efD+bUsYBoTGsxzKfohFKIzRdBG2658OsHViDYvyrpr8V+2qL79oIuMEm86i6s8cNDL4O
	 eAI6Riq8pPb+m6bEeuA7lfdmV+SskvNFIxHBbNEsmdyrfZrTbIOnf6WPizBzVdzWeKHVA
	 9rYBnJmBNd2hH5wj4s4JHPxbpExANj5HC5hPiQuXdSTw89qf4SIYopS+7B9sSmAH0Yjb6
	 ry3ad8LA+Oodai0SrVOv2YyG2kYr136OYd/Toc8GREV2NvvnGlbcoPd2KzDTVAQPgwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794660369;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=ULKrDX82PMQTKcgYYqf1zY84iCTLqlXPJmOCgLPPGgw=;
	b=PQPP1mldKv5qT5XWsB5XH8ZoWYCzjSmx9DGVMwz44ECv59U1rYVob2lSVVYOUcRHYRWs
	 XcQl6XWLxFwqyRSrZ8U+b5mX2GQlR24r7ruT7klw9V0xU6pr3kmZ/M0x0jURJRkDL8dKf
	 4pPC/LW0qpJAsCAs6VLL9mHbcSU4/J6MPVGpErE7b4O1yE4EaBINRi4Bca1/3wG3vLIpw
	 RiKgRC1gvM2XANVrJcgWhzk+Gbx4XPQQKTfEyjmk8qU8Vf4Mvo27hwNUF0LoBXSJrV5oK
	 taEUkcxHwCQEqvsicn/ku1WoX2A8BHR8kBDlFJMQL2uu4Yotz/X2+K0j9YXnHc0pbMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RTOuY53I;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F46606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 12:46:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07F46606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RTOuY53I
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so19460685e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 04:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794660367; x=1795265167; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ULKrDX82PMQTKcgYYqf1zY84iCTLqlXPJmOCgLPPGgw=;
        b=RTOuY53IgxYT7Vn08OKVOQ7ClZbX6aTIowsL5gspZQY3jjOgazUvh6BQ04o/Ar7Umq
         TPOOjvwXPGtd5xcCFxNRX3fOTsMVcrWd0ZCzkJ9vY0X+QZmlf2xICR+DbrPYHVylQjMw
         hqxIGClnKM7lY8QDSe/zu88vlk/Tr13sIQB6XUoR7YxA2vRu5tsoQw7AajJrOhP7FEUC
         w+yCW2oMRFozckHzi0Slhhfc6+KPXuydchKyj5kxbqFY1CnQI+lvkXRkFfZf2DVHhFRX
         gXV/ZrjZMj0M3HAsPOIwJ2H+mhJJRXVfaTpDQZzwyo07QDPaJJZWwciZv3TttwwMLm3z
         PLtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794660367; x=1795265167;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ULKrDX82PMQTKcgYYqf1zY84iCTLqlXPJmOCgLPPGgw=;
        b=H7dESlP/34y+eMBreDFVJVKYrgLwcvnHxDuGyazi5B0+miPWDUkfwh+5TwI8fWGw6S
         b+Ic9vna9pqhtJ/P8mPfh6gmWduO1RKlmsIObRWA+JLBBO8zj1JhToUnwZjNoZ3q/C7B
         voK/GElgXctz/3osbB7Bsi5T/zt0ZebSJJKrbqzPo3S8IgcYxgv6aFLS5cqgODjc5J1Z
         SYISgrriv7+ShRqn1utk6GwGHO1AS+XEWTs4FWUHI+YRY5ZGPIuv1wrtPcdJc9HmYceg
         ibf/HTNLELqrfMgSKGhtIXX5lbA2q1Cm4XegNVtoG91NqijGqTf5xdb/lpDAA/oumySq
         eNyw==
X-Forwarded-Encrypted: i=1; AL+hErF8PAeHx6SZis9dxJc1OA7Md9sYepBmwfL212QFiM1gkdhePe21OttIPeqTlb/fVA9FCFyvxmZ6LPSsNxE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tYYmDDUCc7qQ/qVmTMO+CJmm9HfhXz85UMGPgYBrO62v/YnId
	Iug7YD2n/fGXyQ0p60/3mnX8Tq7ewq7Cl7M/+GH+u+NMV3axxCdOQFKk
X-Gm-Gg: AYBFou3f4OdHNYWRqnaVq7XLF9hiTKBZ4SOEGcsoi/WG9d4mlTvMo/dU6xIzEpZVRCN
	XcT/q4lCjeX9Pl5c+fr0dbmxjx2FIQox1f+jqvH6/lMUJGBSW31VV90cY/shzl1eV69OdovkYqG
	J9b18fg4IUcbb/EP9HqNY5GRdCvM1i15P2FZyYCYNhKqXtuMIF7DO6UoAGhC33m5rph5GeUQUf5
	i3ozM13hdYCvj4K5lcTyjyoUy6uyZnRbOHy8MD4RmQle8MvjsmK5VGJhpWjl4OzaVgdd2vaIBxq
	irv+K/xvpF8n1K+JE9utzASKC8gtBGRCtbxr7w72kVJBSHSeNI9sHZ+NJYudkjei+gmQxk6deyA
	0wVm8n5ZEpT7sJ4j3e3CWnJn6hvjjXxS5WRKg6/VYagpHsDdfUSksisGapKiR8mw4vFKftxdtdd
	19OiOQLcwCxuQIWnuuA/RHJIct6pYU1i+ol0NmmdD5bgFt+Cj1guVK1h0WYODKb+N5Vq/hCzlNS
	OPOAVAnyhY4OYiRa7qRPf5hEgZoZ7LdPq82X4O3mXhaAXJ2oaj+H8gNp4TK4I26FJwRAQGwbPpv
	LWFU20rI377ijDoDPug1oUQc
X-Received: by 2002:a05:600c:4e44:b0:4a2:180a:3417 with SMTP id 5b1f17b1804b1-4bb55c5f5admr108580805e9.1.1794660367022;
        Sat, 14 Nov 2026 04:46:07 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb56f8d054sm89043665e9.3.2026.11.14.04.46.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 04:46:06 -0800 (PST)
Message-ID: <5ff13e10-d8a6-43ed-a718-8b34ee08d4e4@gmail.com>
Date: Sat, 14 Nov 2026 13:46:05 +0100
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
Subject: Re: [RFC PATCH 0/2] mm/huge_memory: find partially mapped shared
 folios with NO_PAGE_MAPCOUNT
To: "David Hildenbrand (Arm)" <david@kernel.org>, Zi Yan <ziy@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
 Rik van Riel <riel@surriel.com>, Vlastimil Babka <vbabka@kernel.org>,
 Harry Yoo <harry@kernel.org>, Jann Horn <jannh@google.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Joanne Koong <joannelkoong@gmail.com>
References: <20261111113535.330078-1-azpijr@gmail.com>
 <4411389c-2246-4af6-9b34-10d3f259aeb4@kernel.org>
 <e9033159-ffd5-4c84-b355-964687b75226@gmail.com>
 <3744f956-8179-45f3-9d87-c99c82b2f8db@kernel.org>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <3744f956-8179-45f3-9d87-c99c82b2f8db@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/13/26 9:16 PM, David Hildenbrand (Arm) wrote:
>>> (b) What is the overhead from having way too many folios in the deferred split list.
>>>
>>
>> I don't know yet. I only measured the walk in a TCG guest, nothing on
>> how long the list gets
> 
> That would be really interesting. I assume there are some cases where a simple
> fork+exec would already add pages to the deferred split list even thought they
> are briefly after fully mapped by the parent.
> 

I tested and, yes, it does. bash doing 200 fork+exec with 64K always
queued 2 folios in total.

[snip]

>>> Maybe one could track it a bit broader? "any page in this set of 16 pages is
>>> present". Reclaiming a single 4k page from a 2M folios is barely worth it.
>>>
>>
>> yes, that works. maybe with the group size scaled to the folio, so the
>> map is one long on the stack and 64K folio still gets one bit per page?
>>
> 
> As an alternative, could we also just look for the next page incrementally?
> 
> Like, start with offset 0. When we see that, move to offset 1, when we see that,
> move to offset 2 ... and once we saw all pages that way, stop the walk.
> 
> I'd assume that, as long as VMAs don't get remapped, that should likely work in
> most cases, right?
> 

I tried it. if the parent keeps the second half and the child the first,
a fully mapped folio looks partially mapped. maybe the one long map is
better here?

>> however, maybe if I don't have real evidence, better drop it?
> 
> I'd be very interested in an efficient way to test if a folio is partially
> mapped, and where the holes are.
> 
> Knowing about the holes could guide a targeted buddy-like folio split.
> 
> There was also the idea of letting folio_referenced() for that purpose, when we
> area already doing an rmap walk.
> 

okay, I could try that. would you rather have it without the shrinker
walk? with no swap, reclaim wouldn't check those folios.

-- 
cheers,
jose a. p-a
