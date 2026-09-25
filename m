Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D37C356777
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 07:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790319997; cv=none; b=FbM838PS7EzUc4OtzMM80k7P2OX3r810y1YWd7cfFHrhx7awcAM0ymsQzzwkkphAfNIPEayeCqLtX36PfQiYRcj2zYI4i3lpWX9F7q8HQ2Mq59y5Jgs9RhDP6CSYelcEHS/JQm+ISrP0raL85QhndV4PFCXjIpY+rWSHpCBZKpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790319997; c=relaxed/simple;
	bh=S3/OpSlmnJ+kQfF44kY1vqfRiXlTV4Z26AQucl3NAbU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uSCea5WgIHk2MKDi6e0MQgXDqKu/V03p02diez+0mcAVELIXiT5BVmzm31j2lB9S0KWuILxStvEZsGH55391Hx8R4SucoT8th4vva5gDkTg7wyF1LMEO7UYL1twxmbA14NQknpNXsiQJk3zHOuasJIcs2bRoGyT9CdRd0e2HfVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WISsPPXZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WISsPPXZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD9E91F000FF;
	Fri, 25 Sep 2026 07:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790319991;
	bh=Td8m9iIUt95nKIvnxCfVeaTTefgNaJwnXfzuIyCH6YA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=WISsPPXZP8H+KWyPmwNcqB2cLI2ZXJEgwzx3oexLfVxNWsyzmmXvN4X8DRy2Vd+0I
	 EbneXdraYBYE+MOoiR/pSsF+nWnDojcHw4a550rxBMavXoTTYjVpbThn2Esb1/mPa1
	 ftTV+KJ2N0MN9DcXW9DRciHxSUVosh+k6tNP9jgVW7Ubnbifd096X4PfwCv2j6mhSb
	 g7crbmDfyxCsEpRNoZ284TSxRaTLFPLQZENYhzOhI6bIQAAacSRaLhEQ2DFqzzFLYq
	 swu2jtmpyrg+ODxhunThg21TqJvN6KmpYidVnI9akO+895qOLt3lG+1pA5Zt1norMc
	 HXH6UxWptzoCQ==
Message-ID: <30f58666-a798-4028-a2c3-9eb63612c4cc@kernel.org>
Date: Fri, 25 Sep 2026 09:06:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] mm: implement page refcount locking via dedicated
 bit
To: Ilya Gladyshev <ilya.gladyshev@linux.dev>, Zi Yan <ziy@nvidia.com>,
 Linus Torvalds <torvalds@linuxfoundation.org>
Cc: akpm@linux-foundation.org, andrew+netdev@lunn.ch, apopple@nvidia.com,
 artem.kuzin@huawei.com, baolin.wang@linux.alibaba.com,
 Liam.Howlett@oracle.com, edumazet@google.com, harry.yoo@oracle.com,
 hramamurthy@google.com, ivgorbunov@me.com, joshwash@google.com,
 kirill@shutemov.name, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 lorenzo.stoakes@oracle.com, mhocko@suse.com, muchun.song@linux.dev,
 pfalcato@suse.de, rppt@kernel.org, surenb@google.com, vbabka@suse.cz,
 willy@infradead.org, yuzhao@google.com
References: <cover.1789239015.git.ilya.gladyshev@linux.dev>
 <ebd6540ad89a4bb80e2a62d00901b5c827315b66.1789239015.git.ilya.gladyshev@linux.dev>
 <DLFJL5U9DI6F.3QJP9YP0KX636@nvidia.com>
 <56e036665dbeb0a8f51d697220d5ed84f210994c@linux.dev>
 <570cf649-a8bf-4073-be71-207fbb2bef40@kernel.org>
 <CAHk-=wh3LLDV2AMZn1PZcU1o3Na-BNcQtP=LPXouLKPZWaiRdQ@mail.gmail.com>
 <DLO1WIACYFWF.3N01DXYFJLMD0@nvidia.com>
 <a1d5881926dbf4b16dc796fb1da939f32dd42f18@linux.dev>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <a1d5881926dbf4b16dc796fb1da939f32dd42f18@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 9/25/26 09:03, Ilya Gladyshev wrote:
> September 25, 2026 at 5:44 AM, Zi Yan wrote:
>>
>> On Thu Sep 24, 2026 at 4:06 PM EDT, Linus Torvalds wrote:
>>
>>>
>>>
>>>  I think this all needs to be entirely generic to all pages. Agreed.
>>>  Everybody needs to do it right.
>>>
>> It assumes all callers of page_ref_dec_and_test() are free page
>> functions, but there are two exceptions:
>>
>> 1. compaction_free() uses folio_put_testzero(), which calls
>> page_ref_dec_and_test() to put not used migration dst page back to
>> isolated freelist instead of freeing them.
>>
>> 2. virtio_mem_fake_offline_going_offline() drops the last reference of
>> fake-offline pages, so that they can be offline.
>>
>> They will need to be converted to not use page_ref_dec_and_test() in
>> addition to a common page freeing function. And any such future use
>> needs to be banned.
>>
>>>
>>> But I think that in the scenario that Ilya mentioned:
>>>
>>>  Refcount operations as follows (FR = FROZEN):
>>>
>>>  A: DEC 1 -> 0 [ page_ref_dec_and_test() ]
>>>  B: INC 0 -> 1 [ folio_try_get() ] => success
>>>  B: DEC 1 -> 0 [ page_ref_dec_and_test() ]
>>>  B: CAS 0 -> FR [ page_ref_dec_and_test() ]
>>>  B: * deallocates via __folio_put() *
>>>
>>>  C: * re-allocates page *
>>>  C: DEC 1 -> 0 [ page_ref_dec_and_test() ]
>>>  A: CAS 0 -> FR [ page_ref_dec_and_test() ] => success
>>>  A: * deallocates directly via free_frozen_pages() * => BUG
>>>
>>>  the big here is that the de-allocation was done not from the state of
>>>  the *page*, but from the state of who finished it off.
>>>
>>>  So that
>>>
>>>  A: CAS 0 -> FR [ page_ref_dec_and_test() ] => success
>>>
>>>  is not a problem per se. It's a fine case of "we had one single unique
>>>  final free".
>>>
>>>  The failure is that A then goes on to do that
>>>
>>>  "deallocates directly via free_frozen_pages"
>>>
>>>  because A mis-judged the page as having the old stale state that it
>>>  had when *A* was using it.
>>>
>>>  IOW, I think the soluition is either:
>>>
>>>  (a) every user of put_page_testzero(page) agrees tro do exactly the
>>>  same thing and there is no difference between how that final
>>>  "0->FROZEN" is dealt with, so it doesn't matter that A is freeing a
>>>  page that C allocated for something else
>>>
>>>  or
>>>
>>>  (b) the CAS 0 -> FR state sequence always looks at the *page* to
>>>  decide what to do, never at the caller state (ie A will look at
>>>  whatever C wrote when it allocated the page to know how to do that
>>>  final free).
>>>
>>>  Hmm?
>>>
>> Just wonder if we could make 1 -> FROZEN atomic to get rid of the gap.
> 
> Hmmm, I’m afraid that since you need CAS for a safe 1->FR transition,
> it will result in a CAS loop for the decrement itself (like in
> atomic_sub_unless).

I was playing with exact this idea when I was reviewing one of the earlier
versions; didn't manage to make it fly in a nice way :)

-- 
Cheers,

David
