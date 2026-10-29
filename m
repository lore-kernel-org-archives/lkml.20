Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793288860;
	b=HgxkvUxRhpul+BiNmvlGWhjUxfXlv9W2b3z9Pxbgvvjmt8QsKhE16muZBBtgxSUibWsO
	 HsqJQ1H36t1/oHXbzrta0PldDvpqmzH2WL9x8tBU4VPIJr9CvO7ctGO5JPXpsupTQrily
	 b5GvaAa4nr8QP94XLyOjUqaAg+DUH9Fm9TLnJunAPInIqtZuXw/W+xFM0rxy2iFxWfonG
	 emVyVF31LT4Svnra1+6mAiH3Wl9luwLjH8ojiEEI73RQIsMZL5SuWyo2RaLG1fdHJ2ydd
	 98JYqzGGOD1VFnoFP/R/iZb/xIXte2iM0M2fe/RVQX01obZJtIglxvGPPht4bKTjFSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793288860;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=QeBdTykJBJ5zP35pEpq30uLA6gbbI1i43t2r5osi4yI=;
	b=wu6GxDl3c5OKmRNru5JUXLDsTOAC1w5/AJe7iE3agQk6vyde0XEjxeLaEZjMQxH6dANI
	 RY+xdonSHTfdi/AtFrOHhMLThe7EvZp1ywko+ydW9hk31m7Sy4FEJHDInqyc2J2v/1Jmr
	 fhGLf+VcxWMmWEEkGLDNQBLZ4X/U/drQwj53r2D8XCICCFgzELSNCJAjaxoPMQAR9rceu
	 YuOUfZeil6ZKSiTxD7H1ffZHjKSyKUytrwyGpcfLaEIfhVXDu/HRU8dMafMKDOR4GC6c+
	 1+dtBwrYjtKwE/H040OJ52cHgcLs1Ch3vXo1/OPvG9XGKq3oFcMt8Yv1glqjsOx5I4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fTqsP2PA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A07606A332
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fTqsP2PA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2F4D1F01816;
	Thu, 29 Oct 2026 15:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793288860;
	bh=QeBdTykJBJ5zP35pEpq30uLA6gbbI1i43t2r5osi4yI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=fTqsP2PAmZAEPesNIu77yJzu2WgeScvhiTz4nuD8H279nZSvE1OezRAHKmk3C7WWz
	 ry5/blQJFAbCPKWI+sJwySf45jzT5wkQMFvYNiJQw2Gk2HPZMrpGS+ZWU9lkExsmxx
	 Y8Zy0x2D/lqP9Yijad7uSZlsbBZHv2Uysvd6aA6Ay/n71gBHzpegm42Ss10IrRKNrM
	 9KVoPh02+y+wuWPGs7ZbBPvHyUh4fumznfY+Brt4k/NiUpM2Rwj0IMMNAaneRJx/oQ
	 +4/ZdjVOEpzVR9S6ZEU+py0Bwcs8Y6hi1nO5nl6S+AgLivD6kYQpYGitL1O8nrOX8t
	 GT2SC5bE3/BNw==
Message-ID: <bf163c58-a884-4164-bede-974b78f032b3@kernel.org>
Date: Thu, 29 Oct 2026 16:47:31 +0100
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
Subject: Re: [PATCH] selftests/mm: fix uffd move-pmd test crash on 64K base
 page systems
To: Zenghui Yu <zenghui.yu@linux.dev>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 akpm@linux-foundation.org, rppt@kernel.org, peterx@redhat.com,
 ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, surenb@google.com,
 mhocko@suse.com
References: <20261011163527.95988-1-zenghui.yu@linux.dev>
 <67c30e4c-3576-4ded-a71f-b49075ed42e3@kernel.org>
 <2162e5c9-58f4-427f-984d-0099d9b515fc@linux.dev>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <2162e5c9-58f4-427f-984d-0099d9b515fc@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/29/26 14:37, Zenghui Yu wrote:
> Hi David,
> 
> On 10/13/26 3:39 PM, David Hildenbrand (Arm) wrote:
>> On 10/11/26 18:35, Zenghui Yu wrote:
>>> From: "Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>
>>>
>>> uffd_move_pmd_test()/uffd_move_test_common() splits the test area into
>>> chunks of chunk_size and moves them one by one.  On arm64 with 64K base
>>> pages the chunk_size (read_pmd_pagesize()) is 512MB, which is larger than
>>> the whole 32MB (UFFD_TEST_MEM_SIZE) test area:
>>>
>>>   step_count = nr_pages / (chunk_size / page_size) == 0
>>>
>>> Because chunk_size > page_size, the test then aligns both areas up to
>>> 512MB, which points far outside of the 32MB mappings, and decrements
>>> step_count, which underflows to ULONG_MAX.  The verification loop then
>>> runs away and the first dereference of area_src faults with a SIGSEGV.
>>>
>>> Skip the test when a single chunk cannot fit into the test area.
>>
>> That leaves 64k untested, though? Why not adjust the chunk size accordingly?
> 
> Right. Apparently this has never been tested on 64k :)

Yeah. And if we start supporting it we should properly test it :)

> 
> I agree that scaling the chunk size is the better approach -- it gives us
> actual test coverage on such configuration, instead of bailing out early.
> 
> If anyone is interested in it, please feel free to send a patch. Otherwise
> I'll work on it when I get some spare time.
I guess no rush on this one.

-- 
Cheers,

David
