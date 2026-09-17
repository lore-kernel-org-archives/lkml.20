Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464927081A
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 18:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789669699; cv=none; b=s1VKIEd2xb+qP5IILvYcW2kpoVM0h1RorV4Iyi6eUW6W72o2kqGPQE47sivTV0X8M2aRZeJtJrFA8h7SU3mvmV47fYLeLdMw8TqzYoLkOQMTLoFhPC6FKTDnkfIOY+hku+EepAvGtaijWyVAnj22D3aqzlTlMrtKv8JW17xsuJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789669699; c=relaxed/simple;
	bh=PlN1J4bq5Zd5rPbVN3If9wdWVIq+fnSAryeGXeIQVBc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QZkjt6DuQKKCwY7wVxIowZjQCZDKwgjMeXShejw3IL1MtLTGLK/KEXZ2T+k4zDaGxXKkVxZQwx0EwDavCbDz697Bbfyk4Mm9vM52Qod9hRhC/ERfH+Vwl1MZOLAbQ2x8EIhW0NbK5G8rR8ZNMnrpZv/QJuFbRXml32N+2qFnahU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hx4f6/Jv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hx4f6/Jv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4D881F000FF;
	Thu, 17 Sep 2026 18:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789669697;
	bh=b5zVLhEkKOWEwakOfls77zzn3VcbclTffxYn4L85i8c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=hx4f6/Jv3cwrMptmmP/azM4P7NNl4TgzLMYGPYxUvgj5fA03oSL4gHfl55lsCvHTT
	 pn5EvppKp1xmJVGJoCg35YpgKo//7RnjqDcC6S8a+5bv13BmFQXoavodtPLD14ATOC
	 rmLLzfgKdbwPSczeH8sX7PRwlBQtwwRWVY2CYFlhqSagmfzeq2QSmTyLzn5Sn1v1ez
	 GsYSrSrknJk0CULzb4njUW5QsatEUpC4El2M6cPUEGGYdRiyicyK7Mntpp8rww/Avk
	 Qil1cbyfX1lJNXxc5p1cZu4mSWyl9wU4Cbmp/v2R2k2C3fUf7DbdZRhNL48WnmlEFp
	 ySmtFZ+wMOr1w==
Message-ID: <efdec0bc-cab0-451f-ad70-ac24c1f69fdd@kernel.org>
Date: Thu, 17 Sep 2026 20:28:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 06/14] arm64/mm: Enable fixmap with 5 level page table
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Stoakes <ljs@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>, Linu Cherian <linu.cherian@arm.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20260907035030.2839978-1-anshuman.khandual@arm.com>
 <20260907035030.2839978-7-anshuman.khandual@arm.com>
 <be1c0a62-4589-4fe4-a500-d3fe16a6e610@kernel.org>
 <pi6o4hjdaz2tndzlx64qvzbgxhuyh3kyewpfetiqnnetbtpzpa@prrxusgc3lpm>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <pi6o4hjdaz2tndzlx64qvzbgxhuyh3kyewpfetiqnnetbtpzpa@prrxusgc3lpm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/17/26 08:18, Anshuman Khandual wrote:
> On Wed, Sep 16, 2026 at 04:30:05PM +0200, David Hildenbrand (Arm) wrote:
>> On 9/7/26 05:50, Anshuman Khandual wrote:
>>> FEAT_D128 halves PTRS_PER_PXX thus shrinking the VA range coverage
>>> for each page table level. Hence in order to preserve all existing
>>> VA range configurations, some geometry now need to become 5-level.
>>>
>>
>> Hmm, wasn't this 5-levels before, but other code allocated+initialized the p4d
>> table for us?
> 
> But fixmap was never 5 level earlier.

I mean the page table hierarchy. It's confusing.

> 
>>
>> I mean, I see how we are filling in another level, but I don't see how we would
>> reconfigure something to use 5 page table levels?
> 
> IIUC existing configurations which never required 5 levels would not need
> this reconfiguration even now.

We only map a handful of MB into a single leaf page table. The only reason why
we have to install more page tables into upper levels is because they were not
instantiated by other code.

> 
>>
>>> Since fixmap is used to build and manipulate page tables early on
>>> during boot the mapping must also gain that additional level which
>>> was not required earlier.
>>
>> I am no expert ... but I am confused :)
>>
>> We do have a loop only in early_fixmap_init_pmd(). So we cannot possibly span
>> more than a single ... PTE table?
>>
>>>
>>> Enable fixmap with 5 level page table when required. This creates table
>>> entries at the PGD level. Add a fallback stub for pgd_page_paddr() when
>>> (PGTBALE_LEVELS <= 4) which helps in intercepting any unintended usage.
>>
>>
>> Again, I am very confused. Is it really just "As the page table layout changes,
>> we might no longer have a p4d table pre-populated for the range our fixmap falls
>> into. So if there is no p4d table yet, populate a static one just like we do for
>> the other levels."
> 
> Right.

Best to rewrite the patch description along these lines.

-- 
Cheers,

David
