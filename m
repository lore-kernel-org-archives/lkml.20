Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516A34E66A3
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 13:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788788804; cv=none; b=BQhtkmMZPEIULeZczfFmyIVquTf61mtcmb42GVJwABZVHD61dBmCuXoXLZrVlNKeLjhdhf8wpps6N3A9TGiDDK+lRVKA0Ne1mLovAZvRNrWcqSfj9VzfKBLbnJDhitl9LSpZlZR2r8r7+MLaHG6j8yuYCxNhsLGEqbJJFTXTt7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788788804; c=relaxed/simple;
	bh=56UF0jK1Ic53xnLhcdW6S8HA3DiVODpp5zWP6ohOoxc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WgElm2+v0ugRdmCvp9y7zgNQT5cWS9pGw0JLEtVLHni7isrvA3XbW0AJy244YyXwigNkn9vuN/kvI8p5iIfX9fwJflLpNCDT2OS4rR1mtbv/c/Ed6bucj54vH0orQxmr1cjCLRi9a6z5WJgULsBGrM/mG78bgfbLN9hp1i18zNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UGRPqI68; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UGRPqI68"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 923ED1F00A3A;
	Mon,  7 Sep 2026 13:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788788799;
	bh=wzDzxAuqB9ojF+hh+Hj8j9w5WVxfT4T0AT5rizOV1hI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=UGRPqI68GBAlh9C4rRQOOuXVdq/mzmQAz/kOW0z5WgWrOMrsS3ws5BWD637XsEwVb
	 IwxYeDnfu8B/WLcDl+8qaC0Xh02fxQg4WFWtBXFjmSlz0Lhr8bUbsIECP40NS/YdRD
	 EOv9yD6mYbsWGGM1lRftr46ALQcMecwn5EvLpwPq9IWY9TPXCRyv+cLZoPTjKs8uKG
	 c9bUyKAmT0JlaBuwEYlgnvTFGMiCE+wQtzyYAsHbl99TI1l93lajRjG8o2nYl0y2ac
	 EPcwHiuAU9nk+9TnO8GclwjCWfO5l5ax7BH7Krk4KDQSvOrcnKqKQfjc8PEceGdqBt
	 yceWjUTYotkWA==
Message-ID: <5a04238e-7dc7-4c88-b0be-c4b510488f48@kernel.org>
Date: Mon, 7 Sep 2026 15:46:30 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Linux MM Alignment Session on hwpoison
To: David Rientjes <rientjes@google.com>,
 "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: William Roche <william.roche@oracle.com>, Jiaqi Yan
 <jiaqiyan@google.com>, linmiaohe@huawei.com, ljs@kernel.org, ziy@nvidia.com,
 osalvador@kernel.org, harry.yoo@oracle.com, willy@infradead.org,
 osalvador@suse.de, jackmanb@google.com, hannes@cmpxchg.org,
 nao.horiguchi@gmail.com, tony.luck@intel.com, wangkefeng.wang@huawei.com,
 jane.chu@oracle.com, akpm@linux-foundation.org, muchun.song@linux.dev,
 liam@infradead.org, duenwen@google.com, jthoughton@google.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, rppt@kernel.org,
 shuah@kernel.org, surenb@google.com, mhocko@suse.com,
 boudewijn@delta-utec.com
References: <20260705180714.3708947-1-jiaqiyan@google.com>
 <85cb7ea8-8116-4092-8310-69b61eb8602c@kernel.org>
 <ee6bcc74-0846-43f2-bcca-b1bedff74351@oracle.com>
 <1dea7b3c-7740-474d-b9d4-cd2baf47f181@kernel.org>
 <168ad406-f6b5-4623-adac-9f894e410e48@kernel.org>
 <8f787434-5326-4a8f-92d0-467e817a23b4@kernel.org>
 <8f023b9f-53d0-0eb8-6f75-65957761cf40@google.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <8f023b9f-53d0-0eb8-6f75-65957761cf40@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/29/26 01:36, David Rientjes wrote:
> Following up on this thread and the suggestion from Matthew (thank you!), 
> I think it would be useful to have a hwpoison requirements and roadmap 
> discussion on how its support is currently integrated into the core MM, 
> get an understanding of what the areas to improve are, and get a sense of 
> future work in this area that people are planning.
> 
> This particular patch series is addressing an area of interest to Google, 
> but it's also quite clear from the thread that there are multiple areas to 
> improve for hwpoison in the core MM and it wouldn't hurt to get more 
> insight into what dependencies users have on it.
> 
> I'd propose this for discussion in one of our upcoming Linux MM Alignment 
> Sessions: Wednesday, September 16 9-10am PDT (UTC-7).
> 
> No specific agenda other than to gather core MM developers with hwpoison 
> developers and discuss:
>  - where validation should live, esp with regard to the page allocator, or
>    strict invariants in the page allocator
>    + implications for the fastpath
>  - handling for folios of arbitary orders
>  - handling partial folio poisoning and split failures
>  - race conditions between memory_failure() and concurrent
>    alloc/free/compaction
>  - soft offline for pages in the pcp lists

There is also the hugetlb hwpoison oddity.

-- 
Cheers,

David
