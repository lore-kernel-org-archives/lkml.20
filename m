Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794488617;
	b=S7yAyzjg9pbXMEENGZc+Ed+6eoWNzLTOsOSq+/jiVo4XSvtF3RqeMvKu734BNxqOt2jE
	 fdS0jnxLS6jIHmxnh61s0H8c7/trHTyL24EkrjsuixlBdFxTsZsznQMW+EmOnDoz0ncg+
	 xEnBGQuqLfbnb1ssGJUQyjm8Mv1Id2VdbkUFN8j7ca2ws+3kvsfDDEEy0poHgbB96wMB4
	 I6XyUurJfRG6Wg2gEMwkkvMvomxHQVpo5VDcXPGm+yiKBZlp+loS8aR9uxSlrt4Jf/dGh
	 pj9X02kS8BQHu8puA3NznvxuUs9DsMoe85DbIRFJIjg0aV6ypdwTMLPTlz3al2WAzGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794488617;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=xxLvafh8oElSW/f5s1DQzYPUCi1n+N6BxV/jYvId0hQ=;
	b=UX0pHiMa/HQnZM2bQ5oCjXgZzEpg2F+Tm6LwjWp0QtOqz1JCa9iifQOJpbKjujaztkgo
	 FTzSwrn1lPXT5/NjTqh2H7vo1x9MvGWBxWOdlnojsV2L7WAUhDnUR3pKKP52Lgwi9SCwn
	 4ALg1+P9VLeyuxC+9gEBz2N4PHzmG+fuTwze/LhlDWHbiBgJ4pChJHQ5Rz9eTb5USnCBr
	 ls47RYxTBKUrHFxf7aCFfr+1ZMAJlWcACa+A0Gy4ETzvsyDR9qBB0saD7V6TfS7KUX21S
	 i/5agqJtQ6y1M8ZCaFoiFiE2MxmPScRUqLYqxqJ0u/axwNDlY3pXLBlZWQslvRT+zuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FbFpC5Ft;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A90606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:03:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99A90606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FbFpC5Ft
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4b4571ff080so46855625e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794488615; x=1795093415; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xxLvafh8oElSW/f5s1DQzYPUCi1n+N6BxV/jYvId0hQ=;
        b=FbFpC5FtmYFLbosvpB2Z24RHv80qu5IzgGbbxLrSQDljBdZPwF+00JWXdf+r47D/Er
         aCZv2UJBRmLOjpt49nqx1a/Eb147hUABDpXj35FxgZH4X9JFhN8OtDMaiwgqADnFDrB5
         EtxqJHBSFY0gxJquzSkaMWcR5U04Txlqldl41ynQW5eAlJt1cIPD8pU9lgaN++tC/Veu
         KBqvK+5quHNX5oFgiEu+fwPV64Um+2jMT+3DDF1fsgjnd0Jo4PmS2BaPy4rA47W+uZJF
         192zCOzXBLbvDQdAv2E4yFvOLU3G+B0MHDVd0vDwBSVyIn8m3YpkvMaaUde7ezc2nu07
         pIdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794488615; x=1795093415;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xxLvafh8oElSW/f5s1DQzYPUCi1n+N6BxV/jYvId0hQ=;
        b=NjSZhfbu0qWcKPjryUSPrtnbSSFtBegOpD9BzLylQfW1+G2i2LoWYgV4kFpNEwHnHL
         bGhcAt9BbITw7FoEnRgJdk5UD9b+YheWziNoi9GV89MjElsGP14Fvnvxnl8euiPKYpzN
         JBxaFK/KkOYLEUIHBYrxjOBEZs0V0TRGHP90qh448BD3QQvINwkcLh4KfoMDg+sqPuso
         lmM47jAIBhWhbm+l/gT2NB1coFtC5/O+nncBlP40wZ04COfeSxhtyUUvcj0EgoLt1qrn
         deoW2WIymgzlWKi9UVj2P/dkr779BTiQenWd6S10EK/vOEaZaj2Zm47u1fsxoJhOkdUO
         TlVw==
X-Forwarded-Encrypted: i=1; AL+hErFwW/Ok7FmtPif7SoguXvGAzy8JlyxKlDxNgrB1FyhzPFN6s58J56Vl0lVNhh/P4idzCVLFlt1vryOJ/Y0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7ikUQ6q+kiQUYvq9f02Kw2bh9MRWPAhQjhg5PMb8Tt6+cjibi
	0fPQwSmtdzo3Z6pMYuDxAb0juV+pyAfn0fcEK5o2qyYeUVZXZqY323V7
X-Gm-Gg: AYBFou0GeBptZOH67atwVsPmzM+HA0awGTOd4Dn/bsrYwvmpXfUoaIHNwLrQF6B/Tx/
	dYukiHoEeMRHq/b65+ePJpvBA1ODFqoTip/RVcKwSPH5P3yYRKPJT16g5igx2kO5nDKVO94vcCa
	yuGSRO+Od78iirEPTFOD2romMdB31c5ZLpjy2ffb5Sg/Rg2jtHQHu6A85OhHq7hpHxTq/rvLeZc
	fEQVKTVITlJwNpsZd4WPG8xoGlnF0eUktUKD5HeVoaaSualnKsEv85fRQQg2R+NPp5AP8MBJKDL
	0CpyUiFzCiBrXfI/GuyJZN8p2wQYdzbc9DA+nhNqRlHYB2E/la7a2NOu0PlstT8TwASXXw3Tgy+
	QrGpJ62CmkXGKjd/orXY8Th01xu294o2/PbnjFoIntHfTC25A8YhsvLkh6X1kGSrrNsmJHmPqOF
	oZgaLFsPKp25c4TJeKX/HPUGMe/7U0PJ9pQTjnAyAoaBxH5RTJF1IbW71OfxswO3As7GRIHXatt
	cSW/EvIpLO8Vzc40iHWUrsKTrgQi2KiCvSs1EF/+SaU7bULK4JGauUIlZDkIB2WurtzGa9TSukC
	ZfYSXwRr6TejXrgefNfQkaoG
X-Received: by 2002:a05:600c:871b:b0:4a1:fe26:24f0 with SMTP id 5b1f17b1804b1-4ba0938a4cdmr100328715e9.20.1794488614828;
        Thu, 12 Nov 2026 05:03:34 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e26700fsm78144135e9.10.2026.11.12.05.03.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 05:03:33 -0800 (PST)
Message-ID: <e9033159-ffd5-4c84-b355-964687b75226@gmail.com>
Date: Thu, 12 Nov 2026 14:03:31 +0100
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
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <4411389c-2246-4af6-9b34-10d3f259aeb4@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/12/26 1:46 PM, David Hildenbrand (Arm) wrote:
> On 11/11/26 12:31, Jose A. Perez de Azpillaga wrote:
>> With CONFIG_NO_PAGE_MAPCOUNT, an anon large folio mapped by several MMs
>> isn't seen as partially mapped while its mapcount stays at or above the
>> number of pages. If parent and child zap the same half of a THP after
>> fork(), that half is mapped by nobody, the folio is never queued for
>> deferred split, and the memory stays allocated until every mapper is
>> gone.
> 
> If you follow the history on this, in e.g., some raised in my talk
> 
> https://share.daveh.de/s/bQsDpD7xigJ6wD8/download?path=&files=LSF_MM%2726_+Deferred_folio_splitting.pdf
> 
> There are a lot of questions around this.
> 
> In particular
> 
> (a) Is it really relevant in practice. The only way you can trigger this if a
> folio becomes partially mapped *after* fork (by parent and child unmapping the
> same pages), and the child stays alive. Once the child is gone, the folio is
> only mapped by one process (e.g., child quit), the folio is properly detected as
> partially mapped.

I don't have any relevant evidence in practice. found it by just reading
and testing in qemu. that is why I sent it as RFC.

> 
> So you need a long-running parent+child, and have them both do questionable things.
> 
> (b) What is the overhead from having way too many folios in the deferred split list.
> 

I don't know yet. I only measured the walk in a TCG guest, nothing on
how long the list gets

>>
>> Patch 1 moves the split_underused_thp check out of
>> deferred_split_folio(). Patch 2 queues such folios as candidates and has
>> the shrinker walk the rmap to see which pages are still mapped.
>>
>> 512 MB of THPs with the same half zapped by every mapper, memory freed
>> by the shrinker:
>>
>>                                 before    after
>>   2M,  2 processes                0 MB   252 MB
>>   2M,  3 processes                0 MB   237 MB
>>   2M,  2 children + parent PMD    0 MB   244 MB
>>   64K, 2 processes                0 MB   252 MB
>>   64K, 3 processes                0 MB   252 MB
>>
> 
> Again, we can create nice scenarios that are likely not relevant in practice
> (such as 512 MB THPs, lol), but so far I doubted that this is relevant in practice.

that's 512 MB in total, not the folio size. maybe I should have
clarified it.

> 
> Do we have any evidence that real applications run into that and it's a problem
> for them?
> 
> The memory is charged to these processes and swapout etc. would still work.
> 
>> With patch 2 the shrinker reads shrink_underused itself, so folios
>> queued for the underused check aren't split anymore once it's turned
>> off.
>>
>> David suggested a check from the shrinker for the opposite case in [1],
>> folios marked partially mapped by a PTE by PTE unmap. The walk in patch 2
>> could clear the flag there too, this series doesn't do it.
>>
>> Questions:
>>
>> - Is an rmap walk from the shrinker fine for this? Every CoW of a page
>>   in a shared PTE-mapped folio queues a candidate, and so does the last
>>   PMD mapper when it splits its PMD.
> 
> You are asking the same question I asked in my LSF/MM session :)
> 
> I don't have a good answer to that, especially, once large folios (smaller than
> most THPs) come into play. Like 64k folios on a 4k kernel.
> 
>>
>> - The walk needs one bit per page, which is too much for the stack with
>>   64K pages, so I used a static bitmap under a mutex. That serializes
>>   the walks of all nodes and memcgs, and the mutex is taken with the
>>   folio locked. Where should the bitmap live?
> 
> Maybe one could track it a bit broader? "any page in this set of 16 pages is
> present". Reclaiming a single 4k page from a 2M folios is barely worth it.
> 

yes, that works. maybe with the group size scaled to the folio, so the
map is one long on the stack and 64K folio still gets one bit per page?

however, maybe if I don't have real evidence, better drop it?

-- 
cheers,
jose a. p-a
