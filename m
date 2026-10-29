Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793301900;
	b=23NSKY1hW041QtTPANlETwY+U3C7FbB3zB4XExaMOlaWSg8dB1GGcPhqGdo2w+N53Lxr
	 /9FaCA5TK0d344HaGKC/vpByOLPPywbpcSrrXBxeRL1fjaycfVv630xMH3hie6fWwUUJf
	 +Iay4oK8pUEX5ATf/9OZC+AiMDSNJZBy2Ijch36UHMe0wnDpi+qYrt/xqPB26OdmHPCMM
	 95qVacRSSFw61npwL1rFXtkNMwEI34VrP8A8aAUOOaJIls15IFhZpThROwLOq7SRYeMyd
	 Qp4IINCGZxeHHuTdEI1r/4uLBdWbeNhJIi2dNCySG4o1DoWL7HglM7ieunvSUKfY5ZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793301900;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=vHvd/q4O+h986N5mN9exXE8IloUVYJcmVGFfgDmC9Y8=;
	b=Kg+BD/p0XP9B1w0HsSqm9SMy4VdNXllk58g/ve/uvfCDbcCwUvRkwr5NSm6q9lcPtjos
	 iX4WY2cbFc+0is9IDCLd6O2UKhT8Wh2yLRcAJ92iOjtl6T+N3fDKn4QGffTbhBj2/R6T5
	 2UCEYFaH5k49HffxIqv9IgV483ZdJ4AdIyFkizZyIG4DTsesESBiFjmWbeGclp57gsbZG
	 3PR5qWJOZn4/nDv826IIG8QCF0swSbZRVbreL9hUGUJ5+7+Gxc9ul+35SbK3oBQT58vDk
	 DzvXiGgc60hfo1gHDrtJ/Kz4+OOBlZezoXGqKShlZ1GQuYFDTfRg6IlExVxDt09LwWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h2m8gHYK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB61606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 19:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h2m8gHYK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 819681F01816;
	Thu, 29 Oct 2026 19:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793301899;
	bh=vHvd/q4O+h986N5mN9exXE8IloUVYJcmVGFfgDmC9Y8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=h2m8gHYKiowIWGROOIGIp2lgHFP799kn2vRajWijcS7Fh+fc7BMZU1zMShcDg9HTG
	 BfUh89iRO16QtmjcQSo0OlzshRrRS6mdNcVNOAxIUViFcgKe21b+qxwWBJcSGsHqoz
	 VEeNeJRVMbHLUGisCtyZPe/4fbCJjZUzlBePLM6WgJguoHTt5sCY168SJ5lmJCrPKc
	 05VZ7DuHlGYolvsBCbpYBiUfTe5Gup3enN/xMpqUH5GgftDE3ejr+Sv87B6DGXRF9c
	 kSzpiRKxYKfg1rgxL6Bwcb/rrttSBxByJG4kKkAfBWuSaxJhga7fO1vvuLksPwZF5r
	 Vq3miXW1MpUNg==
Message-ID: <2c84d8ad-d189-4127-9d1d-8cf0eb40c43c@kernel.org>
Date: Thu, 29 Oct 2026 20:24:52 +0100
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
Subject: Re: [PATCH] mm/huge_memory: use READ_ONCE() when cloning folio flags
 during split
To: Zi Yan <ziy@nvidia.com>, Barry Song <baohua@kernel.org>,
 Ye Liu <ye.liu@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Kiryl Shutsemau <kas@kernel.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Ye Liu <liuye@kylinos.cn>
References: <20261029-data_race_huge_mem-v1-1-112e331291c1@linux.dev>
 <CAGsJ_4wndM+uFwhX+7wdkm2Q8AkgVcw_4wgpObfw0DAZ1w+sVQ@mail.gmail.com>
 <b5dccfe1-3209-471a-a34e-f77fffdee797@kernel.org>
 <DMHE8BEEER1H.2BIY52NXATPIA@nvidia.com>
 <d44e0aef-ac50-4048-952b-50a0307a41cb@kernel.org>
 <DMHKCEKNMA64.3B6O5X5918GWI@nvidia.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <DMHKCEKNMA64.3B6O5X5918GWI@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/29/26 20:19, Zi Yan wrote:
> On Thu Oct 29, 2026 at 10:54 AM EDT, David Hildenbrand (Arm) wrote:
>> On 10/29/26 15:31, Zi Yan wrote:
>>>
>>> data_race() would work too.
>>>
>>>
>>> The PG_waiters on the original folio/the original head page is not lost,
>>
>> Ah, so it's not on arbitrary tail pages, just the old head.
>>
>>> but there is a chance PG_waiters is lost in the new head, because
>>> prep_compound_page() uses __SetPageHead() and can ignore the atomic set
>>> of PG_waiters.
>>
>> Fun.
>> ...>
>>> Solutions can be:
>>>
>>> 1. Use atomic SetPageHead() in prep_compound_page().
>>
>> That sounds like the right thing to do?
> 
> Yes, simpler, but the atomic op can be costly at compound page init
> time. My plan is to add prep_compound_page_atomic() for
> __split_folio_to_order() and the atomic version SetPageHead().

Makes perfect sense.

-- 
Cheers,

David
